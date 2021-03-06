{WorkspaceView} = require 'atom'
LanguageVbscript = require '../lib/language-vbscript'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "LanguageVbscript", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('language-vbscript')

  describe "when the language-vbscript:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.language-vbscript')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'language-vbscript:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.language-vbscript')).toExist()
        atom.workspaceView.trigger 'language-vbscript:toggle'
        expect(atom.workspaceView.find('.language-vbscript')).not.toExist()
