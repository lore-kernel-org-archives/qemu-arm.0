Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3848490ejx;
        Mon, 5 Dec 2022 13:07:48 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6eWa9iR0WYC2Iu4mrMV0G/mJ9Qi+tjpltpXrPNQzAYICiXbj+766elo5bEs7V4IjQNUFBG
X-Received: by 2002:a05:6214:1cb:b0:4bb:b542:892e with SMTP id c11-20020a05621401cb00b004bbb542892emr60384776qvt.80.1670274468475;
        Mon, 05 Dec 2022 13:07:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670274468; cv=none;
        d=google.com; s=arc-20160816;
        b=JzwWP+yTQbeNsU9y+2DbW4P8L07Mtnt7FEgiH26of03ZcMevJ+FI2xg+4FAV7N4jpU
         C4iSLI5wpVFrPCfLWdcX0dR/d6GWy8CzagyL3cq1jYP9iP92LbA4s9Nih87VbzOE9NAr
         ojrEly6XWmsYeusm5jzQRqrP+yTypthdChSHAxfHdICCqAajlgY27vF2Y3yMll4m31Qg
         +dOSpEF0o9MhD+O91oIn9ukGOSuSSi9fpTSZyKemXq73+lAo5t2JdyvPISkOdJgMPqTJ
         z7dQxn3PuCuDdnnp450+5HFdyv7bryya3m3GuhkO0ilL28n+EEUL6n+BVtjrRx7fSd/z
         gmyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=uU0lM1xzAliU2nE4tYaKeKK/U8UihxxbSnJTN+heYOw=;
        b=xXzR8DPt9FL9syfB8tQvewqZ0bWLRRzuLm0ifBKQfMdDKxa8NxPfsS6yqSqsWKUABT
         2Mx5Qi4t0FKMdtGz5zWZ7MRdFsaum/7nDMgweO04iJtppCK/RowEuvsJapnUaUuD9biD
         JEOYQOs+6rYUCstDK+g2vxQk/XbhGBqOLfSPQZ0uHHyxUcziYelHPXZju52BltKUJwcE
         LWHtC7e0N2/ShSUXa4jWfc9+ixYF7HG+mr29i5a5x0cs9nO/rDo0Y9GQfZ7pVcpr32gU
         Q6uMsFvWA86jnx8xP3XBDkvuIJeebm5vesXcZaln3ldUfEI8N1xQekKV2KbzQomL7Kda
         CmzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=eDUu6uUA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j18-20020a05620a411200b006eedb466744si9370828qko.669.2022.12.05.13.07.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Dec 2022 13:07:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=eDUu6uUA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p2IgW-0007h4-3U; Mon, 05 Dec 2022 16:07:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p2IgU-0007gp-NN; Mon, 05 Dec 2022 16:07:30 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p2IgS-000078-V3; Mon, 05 Dec 2022 16:07:30 -0500
Received: by mail-ej1-x635.google.com with SMTP id ud5so1526731ejc.4;
 Mon, 05 Dec 2022 13:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uU0lM1xzAliU2nE4tYaKeKK/U8UihxxbSnJTN+heYOw=;
 b=eDUu6uUAda0T9VWB6TURL8aM2uZ9Nv3cq01eXMLoKBj4lJM4XTEFTpuqR4iwg/WBwB
 QgKm9T7VQSTKSFPDDVwsbMjHjPk+kR64TZtqvUFm256FCNRVtuV8Fx6/KlZLJXcfElcM
 Ttf1c77E80KF9PdLP/KKNzsf8oA8IXD/HbnrEXzKLzhX9INpGuD++86J2mQUgHL3yWXQ
 LAlBfsfThgAlt73hPSeREF6H+1uBfnteOtIpt/S+3jtr/xgovuw2MIldyzUgaAO+bqr3
 ywsW8uz1gMlQLzdzboStmiRY5ZbopiWYIGcRlJG2vIq1Jr4jmFf21e/U8DIq3M5bMpES
 VpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uU0lM1xzAliU2nE4tYaKeKK/U8UihxxbSnJTN+heYOw=;
 b=GK49c3glJapx0mqPikFD7G/e8pATSNk9hA6Rl7gcf2eHc94JV4diyUA5WVWGy03xR8
 pJhfz58UD0PAJPflJMfa+vtZZTnjqHOIPBWLMP7GTg2SYp02VspX/KkSkZL17NgpXaMg
 vYDhZbTAkRQdgkRF9k5lMFF+BOuSabR93jGYGicixjiHGQLMM8ysbb+4tgfIK7d8ZnBF
 TbLYqAqYRGHNWsT1+/e9QBiqXZJwA4EzZ0yKT2qDpWhg70Y4790cqr+EMclnKIq9mZJH
 noymulJi/G2aIccofX67m6wdsqzU8eVCNQpuTScRo8z6ZE2z2Ucfq1yUV8r1K3E6pSJc
 +f9w==
X-Gm-Message-State: ANoB5pnruoPhVeGgsFSgwAhb+jUqM2tbaACcvovv5REzDaUNoUNGPm87
 d2HPl44biEkYliwVDn87nZCDA1iK1lu7h+Nk7Us=
X-Received: by 2002:a17:907:9c0a:b0:7ae:1e53:8dd4 with SMTP id
 ld10-20020a1709079c0a00b007ae1e538dd4mr28136738ejc.42.1670274445986; Mon, 05
 Dec 2022 13:07:25 -0800 (PST)
MIME-Version: 1.0
References: <20221203231904.25155-1-strahinja.p.jankovic@gmail.com>
 <20221203231904.25155-5-strahinja.p.jankovic@gmail.com>
 <4af65cc1-965a-24e7-80f5-7b23d33f8e89@linaro.org>
In-Reply-To: <4af65cc1-965a-24e7-80f5-7b23d33f8e89@linaro.org>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Mon, 5 Dec 2022 22:07:14 +0100
Message-ID: <CABtshVRAc1-O_DodXFWEKVXOmHmpzRiSWFik6YcNUFeEviRKcQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] hw/misc: Allwinner AXP-209 Emulation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: secVT8tA0zfp

Hi Philippe,

On Sun, Dec 4, 2022 at 10:39 PM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Hi Strahinja,
>
> On 4/12/22 00:19, Strahinja Jankovic wrote:
> > This patch adds minimal support for AXP-209 PMU.
> > Most important is chip ID since U-Boot SPL expects version 0x1. Besides
> > the chip ID register, reset values for two more registers used by A10
> > U-Boot SPL are covered.
> >
> > Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> > ---
> >   hw/arm/Kconfig              |   1 +
> >   hw/misc/Kconfig             |   4 +
> >   hw/misc/allwinner-axp-209.c | 263 +++++++++++++++++++++++++++++++++++=
+
> >   hw/misc/meson.build         |   1 +
> >   4 files changed, 269 insertions(+)
> >   create mode 100644 hw/misc/allwinner-axp-209.c
>
>
> > diff --git a/hw/misc/allwinner-axp-209.c b/hw/misc/allwinner-axp-209.c
> > new file mode 100644
> > index 0000000000..229e3961b6
> > --- /dev/null
> > +++ b/hw/misc/allwinner-axp-209.c
> > @@ -0,0 +1,263 @@
> > +/*
> > + * AXP-209 Emulation
> > + *
> > + * Written by Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> > + *
>
> You missed the "Copyright (c) <year> <copyright holders>" line.

Ok, I will add it.

>
> > + * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > + * copy of this software and associated documentation files (the "Soft=
ware"),
> > + * to deal in the Software without restriction, including without limi=
tation
> > + * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> > + * and/or sell copies of the Software, and to permit persons to whom t=
he
> > + * Software is furnished to do so, subject to the following conditions=
:
> > + *
> > + * The above copyright notice and this permission notice shall be incl=
uded in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT S=
HALL THE
> > + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARI=
SING
> > + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> > + * DEALINGS IN THE SOFTWARE.
>
> If you mind, please also include:
>
>      * SPDX-License-Identifier: MIT

Ok, I will add it.

>
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/log.h"
> > +#include "hw/i2c/i2c.h"
> > +#include "migration/vmstate.h"
> > +
> > +#ifndef AXP_209_ERR_DEBUG
> > +#define AXP_209_ERR_DEBUG 0
> > +#endif
> > +
> > +#define TYPE_AXP_209 "allwinner.axp209"
> > +
> > +#define AXP_209(obj) \
> > +    OBJECT_CHECK(AXP209I2CState, (obj), TYPE_AXP_209)
> > +
> > +#define DB_PRINT(fmt, args...) do { \
> > +    if (AXP_209_ERR_DEBUG) { \
> > +        fprintf(stderr, "%s: " fmt, __func__, ## args); \
>
> Please replace the DB_PRINT() calls by trace events which are more
> powerful: when a tracing backend is present, the events are built
> in and you can individually enable them at runtime.

I will do my best to update this to trace events. Have not used them
before, but I will look at other places in code and docs.

>
> > +    } \
> > +} while (0)
>
>
> > +#define AXP_209_CHIP_VERSION_ID             (0x01)
> > +#define AXP_209_DC_DC2_OUT_V_CTRL_RESET     (0x16)
> > +#define AXP_209_IRQ_BANK_1_CTRL_RESET       (0xd8)
>
>
> > +/* Reset all counters and load ID register */
> > +static void axp_209_reset_enter(Object *obj, ResetType type)
> > +{
> > +    AXP209I2CState *s =3D AXP_209(obj);
> > +
> > +    memset(s->regs, 0, NR_REGS);
> > +    s->ptr =3D 0;
> > +    s->count =3D 0;
> > +    s->regs[REG_CHIP_VERSION] =3D AXP_209_CHIP_VERSION_ID;
> > +    s->regs[REG_DC_DC2_OUT_V_CTRL] =3D AXP_209_DC_DC2_OUT_V_CTRL_RESET=
;
> > +    s->regs[REG_IRQ_BANK_1_CTRL] =3D AXP_209_IRQ_BANK_1_CTRL_RESET;
> > +}
>
>
> > +/* Initialization */
> > +static void axp_209_init(Object *obj)
> > +{
> > +    AXP209I2CState *s =3D AXP_209(obj);
> > +
> > +    s->count =3D 0;
> > +    s->ptr =3D 0;
> > +    memset(s->regs, 0, NR_REGS);
> > +    s->regs[REG_CHIP_VERSION] =3D AXP_209_CHIP_VERSION_ID;
> > +    s->regs[REG_DC_DC2_OUT_V_CTRL] =3D 0x16;
> > +    s->regs[REG_IRQ_BANK_1_CTRL] =3D 0xd8;
>
> The device initialization flow is:
>
>   - init()
>   - realize()
>   - reset()
>
> So these values are already set in axp_209_reset_enter().

Thanks, that makes perfect sense. I will update .init and .reset
functions accordingly in v2 of the patch.

>
> Besides, you should use the definition you added instead of
> magic values (AXP_209_DC_DC2_OUT_V_CTRL_RESET and
> AXP_209_IRQ_BANK_1_CTRL_RESET).

Yes, that was an oversight. I used the macros in .reset, but I forgot
to update them in .init.

>
> > +
> > +    DB_PRINT("INIT AXP209\n");
> > +
> > +    return;
> > +}
>
> Otherwise LGTM!

Thanks!

Best regards,
Strahinja

>
> Thanks,
>
> Phil.
