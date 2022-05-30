import countries from '../common/countries.json';
import { CountriesObject } from './CountriesModel'
//import { panel } from './panel'

@Entry
@Component
struct TextExample1 {
  @State show: boolean = false
  @State phone_code: number = 91
  @State arr: CountriesObject[] = []

  aboutToAppear() {
    var data = JSON.stringify(countries);
    this.arr = JSON.parse(data);
    console.info("JSON arr data: " + this.arr[0].co + " " + this.arr[0].ph + " " + this.arr[0].na);
  }

  build() {
    Column() {
      Text('Enter your Mobile Number')
        .fontSize(24)
        .fontWeight("bold")
        .height(40)
        .textAlign(TextAlign.Start)
      Text('Please confirm your country code and enter your mobile number')
        .fontSize(15)
        .margin({ top: "2%" })
        .fontColor(0x9e9e9e)
        .textAlign(TextAlign.Start)
      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween }) {

        Flex({ direction: FlexDirection.Column }) {
          Text('country code')
            .fontSize(15)
            .fontColor(0x9e9e9e)


          Flex({ direction: FlexDirection.Row }) {
            Text('+' + String(this.phone_code)).fontSize(18)
            //            Image("../common/images/icons8-down-arrow-66.png")
            Button('Click', { type: ButtonType.Circle, stateEffect: true }){
              Image($r("app.media.ArrowDown")).height(20).width(20)
            }
              .borderRadius(8)
              .backgroundColor(Color.White)
              .width(30)
              .height(30)
              .margin({ left: 10 })
              .onClick(() => {
                this.show = !this.show;
//                panel({show: $show})
              })

          }.margin({ top: 7 })

        }.width("40%")

        Flex({ direction: FlexDirection.Column }) {
          Text('country code')
            .fontSize(15)
            .fontColor(0xf95353)
          TextInput()
            .type(InputType.Number)
        }.width("60%")

      }.height("20%").margin({ top: "5%" })

      Flex({ justifyContent: FlexAlign.Center }) {
        Button('Continue', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0xff897b)
          .width("100%")

      }




      Panel(this.show) { // Show schedule
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
      })


    }.padding({ left: 35, right: 35, top: 35 })
    .height("80%")
    .margin({ top: "10%" })
  }
}
;

