// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import { Turbo } from '@hotwired/turbo'
import 'controllers'
import TurboPower from 'turbo_power'
TurboPower.initialize(Turbo.StreamActions)

Turbo.StreamActions.custom = function(x, y, z) {
document.dispatchEvent(new CustomEvent('modal:created',{  detail: { content: JSON.parse(this.getAttribute('content')) } }))
}

import "controllers"
