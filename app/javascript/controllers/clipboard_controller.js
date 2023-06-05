import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
     content: String
  }

  connect() {
      this.originalText = this.element.textContent
      // console.log(this.contentValue)
  }
 copy() {
   navigator.clipboard.writeText(this.contentValue).then(
       () => {
           this.element.textContent = "Copied!"
           setTimeOut(() => {
             this.element.textContent = this.originalText
           }, 1000)
         /* clipboard successfully set */
       },
       () => {
         alert("Failed to copy to clipboard")
       }
   );

 }
}
