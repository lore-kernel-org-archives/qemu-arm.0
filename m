Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47377CAC5B5
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Sep 2025 00:35:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v31r8-0005Qd-6Q; Sun, 28 Sep 2025 20:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v31r4-0005PA-Q8
 for qemu-arm@nongnu.org; Sun, 28 Sep 2025 20:35:03 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v31qv-0007Mo-FY
 for qemu-arm@nongnu.org; Sun, 28 Sep 2025 20:35:01 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6228de280a4so7848681a12.2
 for <qemu-arm@nongnu.org>; Sun, 28 Sep 2025 17:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759106088; x=1759710888; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2rfX5WOfA1y09+eggC5CNyFt9iUd0mD+S4yDvOqh9A0=;
 b=c/S95+LfLTbyc6DU6qEBLaZKHrh7+XegSmjwp3tjPvArBoJDnnKQm0oakLJpM8NQkz
 VV2kSRCIWkUTPfTNGLqvTRYPi76gtW4BLAgbMv9AwYS7acCThYoe2mT3zsUosTFqB6TN
 WLZ50yP5hXJn38CSv05nBFYxjZ03lXWkvzcE/QpovGS8F9CeOf0HVbqfJcd9DeiBrftv
 TrsYGq25mMONvhPpg1VvuDQBa6h/jhwLjcuVf0PFP7B1KQ1iU+crSzT9Xc1jIqc9btqp
 SMDpGRNyEGhpD1EpY5fgamedfMl+hoht+Ws7D9CNLkbDR2okWVBTDjhMRfhS4omVeNmJ
 Ineg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759106088; x=1759710888;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2rfX5WOfA1y09+eggC5CNyFt9iUd0mD+S4yDvOqh9A0=;
 b=kYvfaIdasKosfEQUHftzJsAh6xCpNI5xFP7diuecLMGiwdFJ14+wmbR6pWI+KrZCar
 DYfprxULxH0sz4M80Ebu7pCgObBpgjWYKWmbKPmJo/jhA6pxIyKH6xagPI1mEP7YDfFw
 cvl9eukVe0Oac6YhvBonh7D9I5rBoSI+xzdpFRtv65wnu7xIOgnbJc2ygb2Zek3eJnnm
 bIty9i4ToO9nXmDfMJcUzt7ETRioo/1nkTBZX43HV77dzwvdCtYzzhbNQ6g/+joCMCjF
 khDps4o7rQjrmMAz80bU9Mm2S/Tx+MA7ca5HpUCLWh0v04rRdl91K2DkxNEvJ3I2tme4
 DE0w==
X-Gm-Message-State: AOJu0YyQFPC1tNOtLS5y6NJcQxmucvxlvvN13/SOOHU456mgdvisjgNh
 kso/41v4jdMc/sEcjOLPVD8MIgHI0GPQJyapGjmeQllwovqWv/ishqQR5wtxFarU3MsGtueTboz
 tDXD3761020dNEDmDnpLkoT0xtMrLbxE=
X-Gm-Gg: ASbGncuFND6Cw6JB80OGsVdjJjaaus+AtEbHqSWt6fzm2y7Pfb39gFDLEuksNV9mdsA
 P+Qu/b5ToBMcVJn6zJgk2nzkO/Ge1ZSG6ZjpgRP07ykUfISbwjayDmPPZrZSS3PWWxmvkxNJhLW
 CDqak2bAmeUYbQV5hKPja06GJ2/8xhR16GY+OzVtImk6leSKMY3336dp6mpnL/qSB7BCa/gsowb
 uNlDiLAGo/xqPPLVtnT8CG0h4MD74fKZWuXCA==
X-Google-Smtp-Source: AGHT+IEImx5Ln0lob2PHtZQgZCyGzqItUZep1UCIWt5rRZVdTu/7jjDjE/+TpOxfriDjpe9FAsMOA2xOiPwCrZacY9E=
X-Received: by 2002:a05:6402:180c:b0:632:bc36:db59 with SMTP id
 4fb4d7f45d1cf-6349f9cb7demr10990713a12.1.1759106088398; Sun, 28 Sep 2025
 17:34:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250821154229.2417453-1-peter.maydell@linaro.org>
In-Reply-To: <20250821154229.2417453-1-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Sep 2025 10:34:22 +1000
X-Gm-Features: AS18NWC6DHgNHdcvbUZ1qPhB8KxFPzTO3wKWR_VlVeNh1cR6KkYYska4wKvnswI
Message-ID: <CAKmqyKOxaStFvb5XSzEHOw4Sz9NkaFQE2+NS2JNwHnrVOpJijw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/stm32f205_soc: Don't leak TYPE_OR_IRQ objects
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, Aug 22, 2025 at 1:42=E2=80=AFAM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> In stm32f250_soc_initfn() we mostly use the standard pattern
> for child objects of calling object_initialize_child(). However
> for s->adc_irqs we call object_new() and then later qdev_realize(),
> and we never unref the object on deinit. This causes a leak,
> detected by ASAN on the device-introspect-test:
>
> Indirect leak of 10 byte(s) in 1 object(s) allocated from:
>     #0 0x5b9fc4789de3 in malloc (/mnt/nvmedisk/linaro/qemu-from-laptop/qe=
mu/build/arm-asan/qemu-system-arm+0x21f1de3) (BuildId: 267a2619a026ed91c78a=
07b1eb2ef15381538efe)
>     #1 0x740de3f28b09 in g_malloc (/lib/x86_64-linux-gnu/libglib-2.0.so.0=
+0x62b09) (BuildId: 1eb6131419edb83b2178b682829a6913cf682d75)
>     #2 0x740de3f3e4d8 in g_strdup (/lib/x86_64-linux-gnu/libglib-2.0.so.0=
+0x784d8) (BuildId: 1eb6131419edb83b2178b682829a6913cf682d75)
>     #3 0x5b9fc70159e1 in g_strdup_inline /usr/include/glib-2.0/glib/gstrf=
uncs.h:321:10
>     #4 0x5b9fc70159e1 in object_property_try_add /mnt/nvmedisk/linaro/qem=
u-from-laptop/qemu/build/arm-asan/../../qom/object.c:1276:18
>     #5 0x5b9fc7015f94 in object_property_add /mnt/nvmedisk/linaro/qemu-fr=
om-laptop/qemu/build/arm-asan/../../qom/object.c:1294:12
>     #6 0x5b9fc701b900 in object_add_link_prop /mnt/nvmedisk/linaro/qemu-f=
rom-laptop/qemu/build/arm-asan/../../qom/object.c:2021:10
>     #7 0x5b9fc701b3fc in object_property_add_link /mnt/nvmedisk/linaro/qe=
mu-from-laptop/qemu/build/arm-asan/../../qom/object.c:2037:12
>     #8 0x5b9fc4c299fb in qdev_init_gpio_out_named /mnt/nvmedisk/linaro/qe=
mu-from-laptop/qemu/build/arm-asan/../../hw/core/gpio.c:90:9
>     #9 0x5b9fc4c29b26 in qdev_init_gpio_out /mnt/nvmedisk/linaro/qemu-fro=
m-laptop/qemu/build/arm-asan/../../hw/core/gpio.c:101:5
>     #10 0x5b9fc4c0f77a in or_irq_init /mnt/nvmedisk/linaro/qemu-from-lapt=
op/qemu/build/arm-asan/../../hw/core/or-irq.c:70:5
>     #11 0x5b9fc70257e1 in object_init_with_type /mnt/nvmedisk/linaro/qemu=
-from-laptop/qemu/build/arm-asan/../../qom/object.c:428:9
>     #12 0x5b9fc700cd4b in object_initialize_with_type /mnt/nvmedisk/linar=
o/qemu-from-laptop/qemu/build/arm-asan/../../qom/object.c:570:5
>     #13 0x5b9fc700e66d in object_new_with_type /mnt/nvmedisk/linaro/qemu-=
from-laptop/qemu/build/arm-asan/../../qom/object.c:774:5
>     #14 0x5b9fc700e750 in object_new /mnt/nvmedisk/linaro/qemu-from-lapto=
p/qemu/build/arm-asan/../../qom/object.c:789:12
>     #15 0x5b9fc68b2162 in stm32f205_soc_initfn /mnt/nvmedisk/linaro/qemu-=
from-laptop/qemu/build/arm-asan/../../hw/arm/stm32f205_soc.c:69:26
>
> Switch to using object_initialize_child() like all our
> other child objects for this SoC object.
>
> Cc: qemu-stable@nongnu.org
> Fixes: b63041c8f6b ("STM32F205: Connect the ADC devices")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/arm/stm32f205_soc.h |  2 +-
>  hw/arm/stm32f205_soc.c         | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/include/hw/arm/stm32f205_soc.h b/include/hw/arm/stm32f205_so=
c.h
> index 4f4c8bbebc1..46eda3403a9 100644
> --- a/include/hw/arm/stm32f205_soc.h
> +++ b/include/hw/arm/stm32f205_soc.h
> @@ -59,7 +59,7 @@ struct STM32F205State {
>      STM32F2XXADCState adc[STM_NUM_ADCS];
>      STM32F2XXSPIState spi[STM_NUM_SPIS];
>
> -    OrIRQState *adc_irqs;
> +    OrIRQState adc_irqs;
>
>      MemoryRegion sram;
>      MemoryRegion flash;
> diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
> index 229af7fb108..e3c7203c6e7 100644
> --- a/hw/arm/stm32f205_soc.c
> +++ b/hw/arm/stm32f205_soc.c
> @@ -66,7 +66,7 @@ static void stm32f205_soc_initfn(Object *obj)
>                                  TYPE_STM32F2XX_TIMER);
>      }
>
> -    s->adc_irqs =3D OR_IRQ(object_new(TYPE_OR_IRQ));
> +    object_initialize_child(obj, "adc-irq-orgate", &s->adc_irqs, TYPE_OR=
_IRQ);
>
>      for (i =3D 0; i < STM_NUM_ADCS; i++) {
>          object_initialize_child(obj, "adc[*]", &s->adc[i], TYPE_STM32F2X=
X_ADC);
> @@ -171,12 +171,12 @@ static void stm32f205_soc_realize(DeviceState *dev_=
soc, Error **errp)
>      }
>
>      /* ADC 1 to 3 */
> -    object_property_set_int(OBJECT(s->adc_irqs), "num-lines", STM_NUM_AD=
CS,
> +    object_property_set_int(OBJECT(&s->adc_irqs), "num-lines", STM_NUM_A=
DCS,
>                              &error_abort);
> -    if (!qdev_realize(DEVICE(s->adc_irqs), NULL, errp)) {
> +    if (!qdev_realize(DEVICE(&s->adc_irqs), NULL, errp)) {
>          return;
>      }
> -    qdev_connect_gpio_out(DEVICE(s->adc_irqs), 0,
> +    qdev_connect_gpio_out(DEVICE(&s->adc_irqs), 0,
>                            qdev_get_gpio_in(armv7m, ADC_IRQ));
>
>      for (i =3D 0; i < STM_NUM_ADCS; i++) {
> @@ -187,7 +187,7 @@ static void stm32f205_soc_realize(DeviceState *dev_so=
c, Error **errp)
>          busdev =3D SYS_BUS_DEVICE(dev);
>          sysbus_mmio_map(busdev, 0, adc_addr[i]);
>          sysbus_connect_irq(busdev, 0,
> -                           qdev_get_gpio_in(DEVICE(s->adc_irqs), i));
> +                           qdev_get_gpio_in(DEVICE(&s->adc_irqs), i));
>      }
>
>      /* SPI 1 and 2 */
> --
> 2.43.0
>
>

