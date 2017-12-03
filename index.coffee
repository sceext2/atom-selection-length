# index.coffee, atom-selection-length/

{ CompositeDisposable } = require 'atom'

util = require './lib/util'


_update_tooltip = (editor, selection) ->
  # check selection is empty
  if selection.isEmpty()
    return null
  text_len = selection.getText().length
  cursor = util.get_cursor_element editor, selection.cursor
  if ! cursor?
    return null
  atom.tooltips.add cursor, {
    title: "#{text_len}"
    trigger: 'manual'
  }

activate = (state) ->
  s = @subscriptions = new CompositeDisposable()

  s.add util.selection_tooltip_helper(_update_tooltip)


deactivate = ->
  @subscriptions.dispose()

serialize = ->
  {}

module.exports = {
  subscriptions: null

  activate
  deactivate
  serialize
}
