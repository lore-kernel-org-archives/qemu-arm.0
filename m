Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp130178lfm;
        Mon, 6 Jul 2020 09:22:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwo8tvujPLPf3fOZ8HYy3gZ2Augd7hCvTlYsOYIYulKbf36wN5Ocns3sBX+jSL7mm1QcbWs
X-Received: by 2002:a25:a026:: with SMTP id x35mr83134759ybh.114.1594052530150;
        Mon, 06 Jul 2020 09:22:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594052530; cv=none;
        d=google.com; s=arc-20160816;
        b=ZPOV8JRV7/2t6fMJ1nF//aHJS9vpvrSan+dFBQ36YqIPH2cn7M92CDnWiDmVXEp4na
         ZDd/Av7SLBKg9YxdQ90fhkmI0dlOeQNkQtVAbgWoxAniE5KLXCucK7WXU1bT2RszfWPq
         dsS3fNKBXz9Oe06wEw6eZdVuDgqAgS7WKHowHj8jY93YILF3dJQOoq5OEvF8fUCRVLt4
         1VCUmSdAV3ZhAJu7eIW3SSNX9jUS0Q2Tsm8DjP9QIPNMvpqswuJ/WEgtlGlnUY6tAG5M
         E02gnS7UcCbFrnrmEUHRZp1MUt/8bmACHbEaGaOqXEiUCtixMZuyFG24OgKtnKBItksw
         pMFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=70rUnE0Ok1T2f4tPI27RMNYzIsTxi9ncAbkowQsv0Xc=;
        b=XMZOPNg5QSXRd0A5Ck6kNUWjBZw7PBZ1WI9NURHIiUD/37zgsjVN4UB0yuOYda6JU3
         JAi+8meE6HcgG8fmMr/FIGC2JjIztNS1tKmZQCKIRu0ZWBNzqcamRlunm5n2hU93nfOi
         acvGFrTEgtd1PtjDqNP6U2oU/1cRZIVr5pBlhqRAFvsqsTPTkAC70Pg244SLXE33Espd
         xp1J9oWJDwHeJaRYm00TLclI/5bk1HFysT137P1bivX0aQhMtFwS2VDgMtxHLcZY4ODT
         uxrzjKOrZWjJ3AUy9JRj6u9VRfsijVgiGo9VyxPEKQyjkkWfWF+aCRXQ/JT33DRM71TR
         lGAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="P/z7EPlo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2si21179145ybh.9.2020.07.06.09.22.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jul 2020 09:22:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="P/z7EPlo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsTsf-0002qG-Hc
	for alex.bennee@linaro.org; Mon, 06 Jul 2020 12:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsTsT-0002oJ-CA; Mon, 06 Jul 2020 12:21:58 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:43941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsTsR-0007I1-5u; Mon, 06 Jul 2020 12:21:57 -0400
Received: by mail-io1-xd43.google.com with SMTP id k23so39908078iom.10;
 Mon, 06 Jul 2020 09:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=70rUnE0Ok1T2f4tPI27RMNYzIsTxi9ncAbkowQsv0Xc=;
 b=P/z7EPloUgGOm6kjwlWy6t2O8v1mZtuEOaXPtChfiGJsxoi95hnFOJT6KAfKFg4Ohg
 y6r6dCt8y0i9/AHEjCNU07UFT2YMJDrR4+QXmgd+I6P9cxqU9WaOfQHkR2/Ru4dQm21o
 ReVnlOIu4W/IXybsjWkM82Py+MzW9PCRevrzQXEj2FACBulHoyf+eHFdjW5Kp7zRq4Tk
 6NrDRwRJU2qhQ/UcVUvf7bmC6bM6VGnDp8d9ZlnKp4I/Bg1GrZVSpMeUYAdk4Aa7h36N
 Qs4hPDzZUgOwf0FHws0WenZc5bBV0n54J5R81b6wtVgLKWHg1Oc3KZu1+ZMdQOYHcv9x
 wq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=70rUnE0Ok1T2f4tPI27RMNYzIsTxi9ncAbkowQsv0Xc=;
 b=YTLWqDN7ITK1RgZgotxiXdvm1kjKvZXAKWSAaaIVHc5J8C1pq8mhu15JbVQcKoN4rk
 NvJVApg3+/fy6ulwQdxIfG8kUtu167rOzZFSTyuCyTdogSkYVSfnDmeXG9sm25fQ6l8g
 6YaOJQYy//vti9NacF4vuwEC7MOxqnPW00Df6v3isT7sXmF6eNffFODVNe/3m4FbOuDy
 dAL2UxIeR7EjirVprF3mgruSowEyjeqwNUoMgpYR4SBVf4r8YasIyBvAdR/v5u3I+5CJ
 yHsczS/zkrcjOUnoWi5otpc8hoWAfoq7bKmv1iKv/0cAri40S/rgK9smxFmrUTuv/4DT
 xP+A==
X-Gm-Message-State: AOAM531hzpOCvywmZUsXJVYgldcZo7mGd9ZTq/i910/djm+WpZKjXkyg
 dQkuuPJR7kXayQQ4TsC6yyJDuNQeZ5q2/xnyZDc=
X-Received: by 2002:a5d:97d9:: with SMTP id k25mr26314087ios.42.1594052513572; 
 Mon, 06 Jul 2020 09:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200705204630.4133-1-f4bug@amsat.org>
 <20200705204630.4133-7-f4bug@amsat.org>
In-Reply-To: <20200705204630.4133-7-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 09:12:05 -0700
Message-ID: <CAKmqyKNJXGfDQL=_+yiahsUVW5D6Spx-Cq+KxrQw=aFTk9PhAw@mail.gmail.com>
Subject: Re: [PATCH v4 06/10] hw/sd/pl181: Expose a SDBus and connect the
 SDCard to it
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d43;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lnqDeKoWKoCJ

On Sun, Jul 5, 2020 at 1:47 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Convert the controller to the SDBus API:
> - add the a TYPE_PL181_BUS object of type TYPE_SD_BUS,
> - adapt the SDBusClass set_inserted/set_readonly handlers
> - create the bus in the PL181 controller
> - switch legacy sd_*() API to the sdbus_*() API.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Since v3:
> Addressed Peter comment, adding TYPE_PL181_BUS:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg515866.html
> ---
>  hw/sd/pl181.c | 67 +++++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 51 insertions(+), 16 deletions(-)
>
> diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
> index ab4cd733a4..f6de06ece8 100644
> --- a/hw/sd/pl181.c
> +++ b/hw/sd/pl181.c
> @@ -17,6 +17,7 @@
>  #include "qemu/module.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
> +#include "hw/qdev-properties.h"
>
>  //#define DEBUG_PL181 1
>
> @@ -32,11 +33,13 @@ do { printf("pl181: " fmt , ## __VA_ARGS__); } while =
(0)
>  #define TYPE_PL181 "pl181"
>  #define PL181(obj) OBJECT_CHECK(PL181State, (obj), TYPE_PL181)
>
> +#define TYPE_PL181_BUS "pl181-bus"
> +
>  typedef struct PL181State {
>      SysBusDevice parent_obj;
>
>      MemoryRegion iomem;
> -    SDState *card;
> +    SDBus sdbus;
>      uint32_t clock;
>      uint32_t power;
>      uint32_t cmdarg;
> @@ -183,7 +186,7 @@ static void pl181_do_command(PL181State *s)
>      request.cmd =3D s->cmd & PL181_CMD_INDEX;
>      request.arg =3D s->cmdarg;
>      DPRINTF("Command %d %08x\n", request.cmd, request.arg);
> -    rlen =3D sd_do_command(s->card, &request, response);
> +    rlen =3D sdbus_do_command(&s->sdbus, &request, response);
>      if (rlen < 0)
>          goto error;
>      if (s->cmd & PL181_CMD_RESPONSE) {
> @@ -224,12 +227,12 @@ static void pl181_fifo_run(PL181State *s)
>      int is_read;
>
>      is_read =3D (s->datactrl & PL181_DATA_DIRECTION) !=3D 0;
> -    if (s->datacnt !=3D 0 && (!is_read || sd_data_ready(s->card))
> +    if (s->datacnt !=3D 0 && (!is_read || sdbus_data_ready(&s->sdbus))
>              && !s->linux_hack) {
>          if (is_read) {
>              n =3D 0;
>              while (s->datacnt && s->fifo_len < PL181_FIFO_LEN) {
> -                value |=3D (uint32_t)sd_read_data(s->card) << (n * 8);
> +                value |=3D (uint32_t)sdbus_read_data(&s->sdbus) << (n * =
8);
>                  s->datacnt--;
>                  n++;
>                  if (n =3D=3D 4) {
> @@ -250,7 +253,7 @@ static void pl181_fifo_run(PL181State *s)
>                  }
>                  n--;
>                  s->datacnt--;
> -                sd_write_data(s->card, value & 0xff);
> +                sdbus_write_data(&s->sdbus, value & 0xff);
>                  value >>=3D 8;
>              }
>          }
> @@ -456,6 +459,20 @@ static const MemoryRegionOps pl181_ops =3D {
>      .endianness =3D DEVICE_NATIVE_ENDIAN,
>  };
>
> +static void pl181_set_readonly(DeviceState *dev, bool level)
> +{
> +    PL181State *s =3D (PL181State *)dev;
> +
> +    qemu_set_irq(s->card_readonly, level);
> +}
> +
> +static void pl181_set_inserted(DeviceState *dev, bool level)
> +{
> +    PL181State *s =3D (PL181State *)dev;
> +
> +    qemu_set_irq(s->card_inserted, level);
> +}
> +
>  static void pl181_reset(DeviceState *d)
>  {
>      PL181State *s =3D PL181(d);
> @@ -479,12 +496,9 @@ static void pl181_reset(DeviceState *d)
>      s->mask[0] =3D 0;
>      s->mask[1] =3D 0;
>
> -    /* We can assume our GPIO outputs have been wired up now */
> -    sd_set_cb(s->card, s->card_readonly, s->card_inserted);
> -    /* Since we're still using the legacy SD API the card is not plugged
> -     * into any bus, and we must reset it manually.
> -     */
> -    device_legacy_reset(DEVICE(s->card));
> +    /* Reset other state based on current card insertion/readonly status=
 */
> +    pl181_set_inserted(DEVICE(s), sdbus_get_inserted(&s->sdbus));
> +    pl181_set_readonly(DEVICE(s), sdbus_get_readonly(&s->sdbus));
>  }
>
>  static void pl181_init(Object *obj)
> @@ -499,19 +513,24 @@ static void pl181_init(Object *obj)
>      sysbus_init_irq(sbd, &s->irq[1]);
>      qdev_init_gpio_out_named(dev, &s->card_readonly, "card-read-only", 1=
);
>      qdev_init_gpio_out_named(dev, &s->card_inserted, "card-inserted", 1)=
;
> +
> +    qbus_create_inplace(&s->sdbus, sizeof(s->sdbus),
> +                        TYPE_PL181_BUS, dev, "sd-bus");
>  }
>
>  static void pl181_realize(DeviceState *dev, Error **errp)
>  {
> -    PL181State *s =3D PL181(dev);
> +    DeviceState *card;
>      DriveInfo *dinfo;
>
>      /* FIXME use a qdev drive property instead of drive_get_next() */
> +    card =3D qdev_new(TYPE_SD_CARD);
>      dinfo =3D drive_get_next(IF_SD);
> -    s->card =3D sd_init(dinfo ? blk_by_legacy_dinfo(dinfo) : NULL, false=
);
> -    if (s->card =3D=3D NULL) {
> -        error_setg(errp, "sd_init failed");
> -    }
> +    qdev_prop_set_drive_err(card, "drive", blk_by_legacy_dinfo(dinfo),
> +                            &error_fatal);
> +    qdev_realize_and_unref(card,
> +                           qdev_get_child_bus(dev, "sd-bus"),
> +                           &error_fatal);
>  }
>
>  static void pl181_class_init(ObjectClass *klass, void *data)
> @@ -533,9 +552,25 @@ static const TypeInfo pl181_info =3D {
>      .class_init    =3D pl181_class_init,
>  };
>
> +static void pl181_bus_class_init(ObjectClass *klass, void *data)
> +{
> +    SDBusClass *sbc =3D SD_BUS_CLASS(klass);
> +
> +    sbc->set_inserted =3D pl181_set_inserted;
> +    sbc->set_readonly =3D pl181_set_readonly;
> +}
> +
> +static const TypeInfo pl181_bus_info =3D {
> +    .name =3D TYPE_PL181_BUS,
> +    .parent =3D TYPE_SD_BUS,
> +    .instance_size =3D sizeof(SDBus),
> +    .class_init =3D pl181_bus_class_init,
> +};
> +
>  static void pl181_register_types(void)
>  {
>      type_register_static(&pl181_info);
> +    type_register_static(&pl181_bus_info);
>  }
>
>  type_init(pl181_register_types)
> --
> 2.21.3
>
>
