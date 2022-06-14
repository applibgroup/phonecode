/*
 * Copyright (c) 2022 Application Library Engineering Group.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import countries from './countries.json';
import { CountriesObject } from './CountriesModel'

@Component
export struct PhoneCode {
  @State show: boolean = false
  @State phone_code: number = 91
  @State country_code: string = "in"
  @State arr: CountriesObject[] = []
  private onSelectionClick: ((isShow: boolean) => void) = null

  aboutToAppear() {
  }

  build() {
    Flex({ direction: FlexDirection.Row }) {

      Image($rawfile('country_flag_' + this.country_code.trim() + '.png'))
        .width("22vp")
        .height("20vp")
        .margin({ left: "5vp" })

      Column() {
        Text('+' + String(this.phone_code)).fontSize("20fp")
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .margin({left: 7,top: 3})
      }


      Button('Click', { type: ButtonType.Circle, stateEffect: true }) {
        Image($r("app.media.ArrowDown")).height("20vp").width("20vp")
      }
      .borderRadius("8vp")
      .backgroundColor(Color.White)
      .width("30vp")
      .height("30vp")
      .margin({ left: "10vp" })
      .onClick(() => {
        this.show = !this.show;
        this.onSelectionClick(this.show);
      })
    }.margin({ top: "7vp" })
  }
}

@Component
export struct PhoneCodePanel {
  @State show: boolean = false
  @State phone_code: number = 91
  @State country_code: string = "in"
  @State arr: CountriesObject[] = []
  private onPanelItemSelection: ((phoneCode: number, countryCode: string) => void) = null

  aboutToAppear() {
    var data = JSON.stringify(countries);
    this.arr = JSON.parse(data);
    console.info("JSON arr data: " + this.arr[0].co + " " + this.arr[0].ph + " " + this.arr[0].na);
  }

  build() {
    Column() {
      Panel(this.show) { // Show code list
        Column() {
          Row() {
            Text('Country Code')
              .fontSize("20fp")
              .height("40vp")
              .fontWeight("bold")
              .textAlign(TextAlign.Start)
              .margin({ bottom: "10vp" })
          }

          Divider().vertical(false).strokeWidth("2vp").color("Black").lineCap(LineCapStyle.Round)
          List({ space: "2vp", initialIndex: 0 }) {
            ForEach(this.arr, (item) => {
              ListItem() {
                Row() {


                  Flex() {
                    Image($rawfile('country_flag_' + item.co.trim() + '.png'))
                      .width("22vp")
                      .height("20vp")
                      .margin({ left: "5vp" })
                      .backgroundColor(0xFFFFFF)
                      .onClick(() => {
                        this.phone_code = item.ph
                        this.onPanelItemSelection(item.ph, item.co)
                      })
                  }
                  .width('10%')
                  .padding({left: 10})


                  Text(item.co)
                    .width('30%')
                    .height("50vp")
                    .padding({left: 30})
                    .fontSize("20fp")
                    .textAlign(TextAlign.Start)
                    .borderRadius("10vp")
                    .onClick(() => {
                      this.phone_code = item.ph
                      this.onPanelItemSelection(item.ph, item.co)
                    })


                  Text("+" + item.ph)
                    .width('60%')
                    .height("50vp")
                    .padding({right: 30})
                    .fontSize("20fp")
                    .textAlign(TextAlign.End)
                    .borderRadius("10vp")
                    .onClick(() => {
                      this.phone_code = item.ph
                      this.onPanelItemSelection(item.ph, item.co)
                    })


                }
              }.editable(true)
            })
          }.listDirection(Axis.Vertical)
        }
      }
      .type(PanelType.Foldable)
      .mode(PanelMode.Half)
      .dragBar(true)
      .halfHeight("1500vp")
      .onChange((value: any) => {
        console.info(`width:${value.width},height:${value.height},mode:${value.mode}`)
      })
    }
  }
}