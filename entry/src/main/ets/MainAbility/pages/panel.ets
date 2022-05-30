import countries from '../common/countries.json';
import { CountriesObject } from './CountriesModel'

@Component
struct panel {

  @Link show:boolean
  @State phone_code: number = 91
  @State arr: CountriesObject[] = []
  aboutToAppear() {
    var data = JSON.stringify(countries);
    this.arr = JSON.parse(data);
    console.info("JSON arr data: " + this.arr[0].co + " " + this.arr[0].ph + " " + this.arr[0].na);
  }

  build() {
    Column() {
      Panel(this.show) { // Show schedule
        Column() {
          Text('Coutry Code')
            .fontSize(20)
            .height(40)
            .fontWeight("bold")
            .textAlign(TextAlign.Start)
            .margin({ bottom: 10 })
          Divider().vertical(false).strokeWidth(2).color("Black").lineCap(LineCapStyle.Round)
          List({ space: 20, initialIndex: 0 }) {
            ForEach(this.arr, (item) => {
              ListItem() {

                //  Here I want to parse the object passed as item and then use it below text,
                // this.arr is the JSON array (declared in starting of code)
                // Here raw item values are passed which does not show the full name of coutry or the icon


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
      })
    }
  }
}