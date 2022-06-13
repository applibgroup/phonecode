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

import { PhoneCode, PhoneCodePanel } from '@ohos/libphonecode'

@Entry
@Component
struct TextExample1 {
  @State show: boolean = false
  @State phone_code: number = 91
  @State country_code: string = "in"

  aboutToAppear() {
  }

  build() {
    Column() {
      Text($r("app.string.phone_number_label"))
        .fontSize("24fp")
        .fontWeight("bold")
        .height("40vp")
        .textAlign(TextAlign.Start)
      Text($r("app.string.phone_number_info"))
        .fontSize("15vp")
        .margin({ top: "2%" })
        .fontColor(0x9e9e9e)
        .textAlign(TextAlign.Start)
      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween }) {
        Flex({ direction: FlexDirection.Column }) {
          Text($r("app.string.country_code"))
            .fontSize("15fp")
            .fontColor(0x000000)
          PhoneCode({
            show: this.show,
            country_code: this.country_code,
            phone_code: this.phone_code,
            onSelectionClick: (isShow) => {
              this.show = isShow;
            }
          })
        }.width("50%")

        Flex({ direction: FlexDirection.Column }) {
          Text($r("app.string.phone_number"))
            .fontSize("15fp")
            .fontColor(0xff6874)
          TextInput()
            .type(InputType.Number)
        }.width("60%")
      }.height("20%").margin({ top: "5%" })

      Flex({ justifyContent: FlexAlign.Center }) {
        Button($r("app.string.continue"), { type: ButtonType.Normal, stateEffect: true })
          .borderRadius("8fp")
          .backgroundColor(0xff6874)
          .width("100%")
      }

      PhoneCodePanel({
        show: this.show,
        onPanelItemSelection: (phoneCode, countryCode) => {
          this.phone_code = phoneCode;
          this.country_code = countryCode;
          this.show = !this.show;
        }
      })
    }.padding({ left: 35, right: 35, top: 35 })
    .height("80%")
    .margin({ top: "10%" })
  }
}