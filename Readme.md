## Library Name - Phone Code
### Library Version - 1.0
### Library Release Date - 
### Library Overview  
  Phone Code library provides access to a developer to add this into their own harmony os project, where user will get option to enter his/her nobile number. The main feature includes a list of phone codes of all the coutries from where usercan choose the coutry he/she belongs to and the Mobile code of that coutry will automatically added to the phonenumber field.
### Github Link - 

![alt-text-1](./Images/ss%201.png) ![alt-text-2](./Images/ss%202.png)


## Library Feature 1: Button
### A beautiful coloured clickable button is provided underneath the input field, by clicking which user can submit his data into the server    



` Button('Click', { type: ButtonType.Circle, stateEffect: true }){
    Image($r("app.media.ArrowDown")).height(20).width(20)}
        .borderRadius(8)
        .backgroundColor(Color.White)
        .width(30)
        .height(30)
        .margin({ left: 10 })
        .onClick(() => {
        this.show = !this.show;
})`

![Image](./Images/Button.png)

## Library Feature 2: Panel
### Upon clicking the dropdown button a panel will pop up from the buttom of the screen which displays the name, phone code and the cotry flag icon of the coutries. User can select his/her country and the phone code of that coutry will automatically adde up to the required field.

``    Panel(this.show) { // Show schedule
        Column() {
          Row() {
            Text('Coutry Code')
              .fontSize(20)
              .height(40)
              .fontWeight("bold")
              .textAlign(TextAlign.Start)
              .margin({ bottom: 10 })   
          }
          Divider().vertical(false).strokeWidth(2).color("Black").lineCap(LineCapStyle.Round)
          List({ space: 20, initialIndex: 0 }) {
            ForEach(this.arr, (item) => {
              ListItem() {
                Row() {
                  Text(item.co + "    " + "+" + item.ph)
                    .width('50%')
                    .height(50)
                    .fontSize(20)
                    .textAlign(TextAlign.Start)
                    .borderRadius(10)
                    .backgroundColor(0xFFFFFF)
                    .onClick(() => {
                      this.phone_code = item.ph
                    })
                  Text(item.na)
                    .width('50%')
                    .height(50)
                    .fontSize(20)
                    .textAlign(TextAlign.End)
                    .borderRadius(10)
                    .backgroundColor(0xFFFFFF)
                    .onClick(() => {
                      this.phone_code = item.ph
                    })
                }
              }.editable(true)
            })
          }
          .listDirection(Axis.Vertical)
        }
      }
      .type(PanelType.Foldable)
      .mode(PanelMode.Half)
      .dragBar(true)
      .halfHeight(1500)
      .onChange((width: number, height: number, mode: PanelMode) => {
        console.info(`width:${width},height:${height},mode:${mode}`)
      })``

![Image](./Images/Panel.png)
### Advance features that can be implemented into the library - 
* Voice search can be integrated so that user dont have to pick the coutry name everytime from the panel, instead he/she can do a voice search and the data will be filled up
* Application can seek permission to use the user's current location and the phonecode of that coutry in which the location exists can be filled up automatically.


### Coclusion
* It is a very useful Library which can save your lots of time by importing it directly into your App
* It is easy to use and very user friendly and it's UI is very much specific
* Specific fields acn be customized according to the need of the project