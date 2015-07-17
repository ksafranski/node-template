/* global sinon, expect, describe, it, beforeEach, afterEach */
import '../setup'
import App from '../../src/app'

describe('App', () => {
  
  const app = new App()
  
  // Just an example test...
  describe('test', () => {
    it('returns foo', () => {
      expect(app.test()).to.equal('foo')
    })
  })
  
})