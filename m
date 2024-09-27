Received: by 2002:a17:504:5f68:b0:1be9:327d:8ee3 with SMTP id gl8csp243342njc;
        Fri, 27 Sep 2024 03:46:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUfRngnUU7tvAnHxv1xXpv4H4lckUSAxa7aoMThSy74US38jQDonDXfAImratkwGZR0kqk0A5N3mEnYGQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEdsO8Xpmi0Qsphe1o9n+SlbMNJts3abqZKo9dwPtDiZa0+TTgt1o6EP0MAM5LiXIAFeTmc
X-Received: by 2002:a05:620a:4454:b0:7a9:a917:2680 with SMTP id af79cd13be357-7ae378c645amr386248285a.64.1727434005878;
        Fri, 27 Sep 2024 03:46:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727434005; cv=none;
        d=google.com; s=arc-20240605;
        b=HnnD0P/UuWvGJOyNFJKWm+ME2vE4aFdWCH0tcwRRrNC8MdhhG5ruw2ieilT6ghV5Rt
         ANFf8fmSoy7dH5aWwoMIRrf3e3dsr3zTLy9zyin8MNnvJsn9Cci97N/ntJPAUxOIYJF4
         xDRJIg491/kDN+Kqs592SRuHly9osBvjN9xl+kswIao/SR9phTgbmOXFxJbAuP5HFRGv
         QMWPsXB1r+3D+f+o/NlMguO6I/OhT5ZZHGvx9y48yG8qJ9sN8m4cJz0MxJOCwIhKOp1s
         CIE6mcxIp4qJg0l8f57fjGajVstQ4xpeXcuNT2HVHyPetOCSYnBs5Uqm+tDy5NmGeFqY
         f6LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Rei0wa38vUcTOS18Il30yLYbPKlVTfOEO2MqSLvPCNs=;
        fh=MPBfippJcBHMxfhqmpwSG4hYkL7ElQqV1xWQ0JDcic4=;
        b=SHZ4drzmtgWpc0sPQJC08n91rcuTLNDO52NtYHeYee+19pBBPQbm+JC7g7K4O9hjex
         EyO37TjXNo+vx2UqLhUm3/BibWxTVd4ZGldVxn+4Pu0pRvjt1LlYROqPMUmFyy9IPtmK
         PxAVy8L3dbSUE2zo4aiyFR/Gr1Ua/i6Wwd09kmuvry/TJLBHjoExm7Z3L4n9qeLQuowv
         PGaEuSdI5xsHFld8u+KQbZAyH37opIg61qBEmTW2msltCeJfqH9SYFZdG2XLo6Hm3A+A
         AXmxId4G+S/TUTKXH61mujUDybXVIt1THfYF14jj8XM1CtvI63CvF6I2G3uGzpOnKpYY
         7UwA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dLGFAdau;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45c9f3285d4si19043631cf.341.2024.09.27.03.46.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Sep 2024 03:46:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dLGFAdau;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1su8UU-0001go-Le; Fri, 27 Sep 2024 06:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1su8UQ-0001fg-Sa
 for qemu-arm@nongnu.org; Fri, 27 Sep 2024 06:46:25 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1su8UP-0004yJ-1i
 for qemu-arm@nongnu.org; Fri, 27 Sep 2024 06:46:22 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c5b9d2195eso2369873a12.1
 for <qemu-arm@nongnu.org>; Fri, 27 Sep 2024 03:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727433979; x=1728038779; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rei0wa38vUcTOS18Il30yLYbPKlVTfOEO2MqSLvPCNs=;
 b=dLGFAdauIk+d3M0g9O5zt4UgxqiXjAlS/umlUir+DW0orYxqPV/957dAitiItHgLf5
 bqEKiZ3S+HAbFqAqRVfPac7ovLAfdoeQyXCq9P4rYGxSaPHfo8tbZvGkd/TnJ5K5pwFN
 ExZxUzK7kqaiQKrYzWbUeQoG690xb06LE1pFmCotjfVJYrUVBJH0D33RuQpODuP5t0Pr
 uN3r5crpd4q9Y1TfWWSJXArslADl/gjntRM6HFEB0d+dWBWX4yqxUmhWwDipAVfkBf3P
 jvx/PmuuWm/ekz1qdDmYTbrosWL/RDvjIoEdWhE6W/KB1nZYgsiz9VA2Gxx375uvuWqj
 EKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727433979; x=1728038779;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rei0wa38vUcTOS18Il30yLYbPKlVTfOEO2MqSLvPCNs=;
 b=oAF0UutyE9398IQZOz6TftwFBOVDede8XDtXyh+nOSEMA6FfWudW0x4/3hjbzHvqab
 y8H5z7A0/rbt4NEPfC0cn3l1AL7Cvf3x3ltKVetZP8+4PC7oayj2F4QwYVcIgotOA98s
 ikwh+OAFH4NceKhvQZNdOczKPYlIHqHhAcZt9uI/wqzOR5HTZi8MGb2wwJx4TIUPMKBR
 gVb2S2F1qJXwpk2Y6GZblFwVLEV/x6jVf8skyphN7K7TUENzsUrzpxJaZU6vxcsxQ/Cj
 6UOWwGo89/wIRbciIbCW0jv1i3VZOttkM42i6V+CaQ+/nq4D8nYJbKS7dGXUQ8P25Xrc
 Sw7A==
X-Gm-Message-State: AOJu0Yw4KxMETUJEdFbtZCKvgAQxRoSv5FmmhcOmATVm/6bhA3AdfHm9
 kuTwW80EA3tXv9b0TamsxdLnU59bwZsfTQ8Q+XoaeogwXZ9D+zN7m8PyqbuYPALZGOhfkRTufkI
 QVByxu5B/AmEvPpCWL2wuVqCM4zFQh5FsG80Bcw==
X-Received: by 2002:a05:6402:274c:b0:5c8:839c:81b5 with SMTP id
 4fb4d7f45d1cf-5c8839c823cmr1444143a12.2.1727433979083; Fri, 27 Sep 2024
 03:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240927101453.2569-1-rcardenas.rod@gmail.com>
In-Reply-To: <20240927101453.2569-1-rcardenas.rod@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Sep 2024 11:46:07 +0100
Message-ID: <CAFEAcA9yVy26mb5eM1Lyofi_7LMgT7Ts7G2VMY1UdcQYi+hJ6w@mail.gmail.com>
Subject: Re: [PATCH] Add basic GPIO and RCC functionalities to STM32F4
To: =?UTF-8?B?Um9tw6FuIEPDoXJkZW5hcyBSb2Ryw61ndWV6?= <rcardenas.rod@gmail.com>
Cc: qemu-arm@nongnu.org, alistair@alistair23.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: R9i4ppIgMrRU

On Fri, 27 Sept 2024 at 11:21, Rom=C3=A1n C=C3=A1rdenas Rodr=C3=ADguez
<rcardenas.rod@gmail.com> wrote:
>
> Adds support for GPIO peripherals in STM32F4 targets. Main contributions =
are:
>
> - Generic GPIO class for STM32 devices. It can be used for most of STM32 =
chips.
>   Note that it does not implement configuration locking mechanisms.
> - Generic RCC class for STM32 devices. It can be used for most of STM32 c=
hips.
>   Note that it only implements enable and reset capabilities.
>
> I tested this locally with a few examples with LEDs (digital output) and
> buttons (digital input)  and works as expected.
>
> Signed-off-by: Roman Cardenas Rodriguez <rcardenas.rod@gmail.com>

Hi; thanks for this patch. Please could you split it into
a series of smaller patches (which each do a coherent thing
and compile successfully)? A patch this size is very hard
to review. An example split might be something like:
 * implementation of new rcc device
 * add rcc device to the board
 * implementation of gpio device
 * add gpio device to the board

Also, please cc the qemu-devel@nongnu.org mailing list on
all patches. Our automated tooling only sees patches sent there.

A few other simple notes below for easy style stuff I saw on
a quick scan; I'll save my full review for the split patchset.

> diff --git a/hw/gpio/stm32_gpio.c b/hw/gpio/stm32_gpio.c
> new file mode 100644
> index 0000000000..4a4d15bfbd
> --- /dev/null
> +++ b/hw/gpio/stm32_gpio.c
> @@ -0,0 +1,357 @@
> +/*
> + * STM32 System-on-Chip general purpose input/output register definition
> + *
> + * Copyright 2024 Rom=C3=A1n C=C3=A1rdenas <rcardenas.rod@gmail.com>
> + *
> + * Based on sifive_gpio.c:
> + *
> + * Copyright 2019 AdaCore
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include <stdio.h>

You don't need to include stdio.h, osdep.h will do that
for you. (More generally, osdep.h should always be the
first #include in every .c file, and never included in
any .h file.)

> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "hw/irq.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/arm/stm32.h"
> +#include "hw/gpio/stm32_gpio.h"
> +#include "migration/vmstate.h"
> +#include "trace.h"
> +
> +static void stm32_gpio_update_state(STM32GPIOState *s)
> +{
> +    bool prev_id, new_id, od, in, in_mask;
> +    uint8_t mode, pupd;
> +
> +    for (size_t i =3D 0; i < s->ngpio; i++) {
> +        prev_id =3D extract32(s->idr, i, 1);
> +        od      =3D extract32(s->odr, i, 1);
> +        in      =3D extract32(s->in, i, 1);
> +        in_mask =3D extract32(s->in_mask, i, 1);
> +
> +        mode    =3D extract32(s->moder, i * 2, 2);
> +        pupd    =3D extract32(s->pupdr, i * 2, 2);

I don't really recommend lining up assignments like this:
it looks nice in the first commit but becomes a pain
when making future changes because either you have to edit
all the lines to retain the alignment or else things end
up not all aligned.

> +static void stm32_gpio_reset(DeviceState *dev)
> +{
> +    STM32GPIOState *s =3D STM32_GPIO(dev);
> +
> +    // enabled is not affected by reset. It is ruled by RCC
> +    // IDR is not directly reset. It is updated at the end by update_sta=
te

QEMU's C comment style says no '//' style comments. You can have
 /* one line comments like this */
or
 /*
  * multiple line
  * comments like this
  */

(If you haven't tried running your patches through
scripts/checkpatch.pl, that will catch at least some of
this kind of style issue. Note that it does also have
some false positives, so you don't need to follow its
suggestions 100% if they look weird.)



> +static void stm32_gpio_irq_set(void *opaque, int line, int value)
> +{
> +    STM32GPIOState *s =3D STM32_GPIO(opaque);
> +
> +    trace_stm32_gpio_irq_set(line, value);
> +
> +    assert(line >=3D 0 && line < s->ngpio);
> +
> +    s->in_mask =3D deposit32(s->in_mask, line, 1, value >=3D 0); // <0 i=
s unconnected/connected to load

checkpatch will also warn about overlong lines like this.


> +    if (value >=3D 0) {
> +        s->in =3D deposit32(s->in, line, 1, value !=3D 0); // 0 is low, =
>0 is high
> +    }
> +
> +    stm32_gpio_update_state(s);
> +}
> +

thanks
-- PMM
