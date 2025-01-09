Received: by 2002:a05:7022:43a6:b0:92:a90b:6588 with SMTP id bo38csp1139318dlb;
        Wed, 8 Jan 2025 18:00:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWJIRrMABVm9cQKMlwwvGBFRVNjhrHDAFyCxgR0YhF2AbmU4CDcLnj0aqC76rvaDEdkHfYa4n2qzFzYiQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGppOkk+plMAEh1RC5I6XSqmTNgzOdDgTMKX2rfRGKf2xBfzbB5HQd3Q695GzF+SQxeSoE/
X-Received: by 2002:a05:6214:3212:b0:6d8:7db7:1f2e with SMTP id 6a1803df08f44-6df9b1db07amr88037056d6.14.1736388001867;
        Wed, 08 Jan 2025 18:00:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736388001; cv=none;
        d=google.com; s=arc-20240605;
        b=loU9X5yWKXRGTG/ZDPj4B6Jn1s0r9asrKEaWo1Bizcw53nT2gooZAICnPiSkltZnq6
         ZL5nNaMBsYESlY7B6HPdSfFL8u00BxNakGMLP7gDFI2VPb6eWZ32ewGL49ITyqRE2cYM
         sdwv+NCB8LZ2DbGta3Bumb6gpEnHXftMLa1eivIlrILJ9FMPI4f2j5QBrWp/EcoxAvsQ
         QSnL46l0EMpVVbqmF0wVBGwlzUCVWQTrV/xErz9QqkvRpD/1cBvQ17NgBAkbOeeqV8fF
         wXdefhR/v80Br01LuJcLeSiApuUwMEAwgVn3XWAcd3SPKKWSIPYcUUU/KYMS/Q3kZ7sJ
         TjDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :content-transfer-encoding:references:in-reply-to:date:cc:to:from
         :subject:message-id:dkim-signature;
        bh=et6MvNpMhJ/GCry+Ff3Ha/jLEzOm/MI7gaF5X5hYAo8=;
        fh=ZOisryR2Mb28fNxWQse9qjy5qBOClWtToxOZdGTojXg=;
        b=a8JjYSWFJ61VchV0bvGO11eXFbf1psxUsTs6TDXkVimqXw+nqTs8NDrlQ4rbbDrjNt
         eBTDubKdt+joC2gDbwN004JliKr7SGyQHieCQj2GMhINsBvCNl6SvNsKGoYOo6Mbx0zP
         PHNum8CLWui04JS1gX7QrUDo5nTX9pim+DtHYDzK5YOC8hgbsSuUMq5rHE1hwd0//aaM
         oKjz2DB4P8V5L9CUYek0fDMy36p74BwM3nMAaxheajcbgf9GW6Szm4cYskbbjXSREjg3
         APLxTh8YXYnv08v60UmyjvuneR2a7W++n1nK83gFFtl99b1HrFUZlnWLApjKlWP4Ajs2
         Vr0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=cXGxOQHD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dd181017acsi508888426d6.2.2025.01.08.18.00.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jan 2025 18:00:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=cXGxOQHD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVhpP-00068g-Fx; Wed, 08 Jan 2025 20:59:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tVhpK-00068I-ON; Wed, 08 Jan 2025 20:59:14 -0500
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1tVhpH-0000LB-FX; Wed, 08 Jan 2025 20:59:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1736387940;
 bh=et6MvNpMhJ/GCry+Ff3Ha/jLEzOm/MI7gaF5X5hYAo8=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=cXGxOQHDKXXKscWgXKV65vTSyQgGDJv4kDbORSkB0+0frgP6GbesNLNhZ1O5ZAAwj
 4qE65IFP5td1fJ8RXrqWdjdKUl9VBHT9FXHMIily4NC3fGOkauWczCrumK+8lLBtox
 nWsHfF6mNVZYXhNIcy7ria+LmX1RyRObell9aPeSDGhRheGM2+tNQVCzgwElpni9bm
 2k0CqgscrZWgeosW7DHtA+W2hQlz7QyoHMvcV0QDrYEf4+5HRxZB+j0DZssLIT7zFR
 snuq1jVM5zR9xy8QJjOFj1RycurY/p3Wm1E3j1d247OkDDI+9fHEvWz5smysYgbZiy
 +DJGTV4Y6Zxzw==
Received: from [192.168.68.112] (58-7-153-226.dyn.iinet.net.au [58.7.153.226])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 158DE70AE0;
 Thu,  9 Jan 2025 09:58:57 +0800 (AWST)
Message-ID: <c3b0139f9995427dd83e6172aa17b799361926b6.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 1/3] hw/timer/aspeed: Support different memory region
 ops
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?ISO-8859-1?Q?C=E9dric?= Le
 Goater <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>, Steven Lee
 <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
Date: Thu, 09 Jan 2025 12:28:55 +1030
In-Reply-To: <20241216075353.1308043-2-jamin_lin@aspeedtech.com>
References: <20241216075353.1308043-1-jamin_lin@aspeedtech.com>
 <20241216075353.1308043-2-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.29.241.158;
 envelope-from=andrew@codeconstruct.com.au; helo=codeconstruct.com.au
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 2GKWnKp+cnzq

On Mon, 2024-12-16 at 15:53 +0800, Jamin Lin wrote:
> It set "aspeed_timer_ops" struct which containing read and write
> callbacks
> to be used when I/O is performed on the TIMER region.
>=20
> Besides, in the previous design of ASPEED SOCs, the timer registers
> address
> space are contiguous.
>=20
> ex: TMC00-TMC0C are used for TIMER0.
> ex: TMC10-TMC1C are used for TIMER1.
> ex: TMC80-TMC8C are used for TIMER7.
>=20
> The TMC30 is a control register and TMC34 is an interrupt status
> register for
> TIMER0-TIMER7.
>=20
> However, the register set have a significant change in AST2700. The
> TMC00-TMC3C
> are used for TIMER0 and TMC40-TMC7C are used for TIMER1. In
> additional,
> TMC20-TMC3C and TMC60-TMC7C are reserved registers for TIMER0 and
> TIMER1,
> respectively.
>=20
> Besides, each TIMER has their own control and interrupt status
> register.
> In other words, users are able to set control and interrupt status
> for TIMER0
> in one register. Both aspeed_timer_read and aspeed_timer_write
> callback
> functions are not compatible AST2700.
>=20
> Introduce a new "const MemoryRegionOps *" attribute in
> AspeedTIMERClass and use
> it in aspeed_timer_realize function.
>=20
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
> =C2=A0hw/timer/aspeed_timer.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 7 ++++++-
> =C2=A0include/hw/timer/aspeed_timer.h | 1 +
> =C2=A02 files changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> index 149f7cc5a6..970bf1d79d 100644
> --- a/hw/timer/aspeed_timer.c
> +++ b/hw/timer/aspeed_timer.c
> @@ -606,6 +606,7 @@ static void aspeed_timer_realize(DeviceState
> *dev, Error **errp)
> =C2=A0=C2=A0=C2=A0=C2=A0 int i;
> =C2=A0=C2=A0=C2=A0=C2=A0 SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> =C2=A0=C2=A0=C2=A0=C2=A0 AspeedTimerCtrlState *s =3D ASPEED_TIMER(dev);
> +=C2=A0=C2=A0=C2=A0 AspeedTimerClass *atc =3D ASPEED_TIMER_GET_CLASS(s);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 assert(s->scu);
> =C2=A0
> @@ -613,7 +614,7 @@ static void aspeed_timer_realize(DeviceState
> *dev, Error **errp)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 aspeed_init_one_timer(s,=
 i);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sysbus_init_irq(sbd, &s-=
>timers[i].irq);
> =C2=A0=C2=A0=C2=A0=C2=A0 }
> -=C2=A0=C2=A0=C2=A0 memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_t=
imer_ops,
> s,
> +=C2=A0=C2=A0=C2=A0 memory_region_init_io(&s->iomem, OBJECT(s), atc->reg_=
ops, s,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 TYPE_ASPEED_TIMER, 0x1000);


> =C2=A0=C2=A0=C2=A0=C2=A0 sysbus_init_mmio(sbd, &s->iomem);
> =C2=A0}
> @@ -708,6 +709,7 @@ static void
> aspeed_2400_timer_class_init(ObjectClass *klass, void *data)
> =C2=A0=C2=A0=C2=A0=C2=A0 dc->desc =3D "ASPEED 2400 Timer";
> =C2=A0=C2=A0=C2=A0=C2=A0 awc->read =3D aspeed_2400_timer_read;
> =C2=A0=C2=A0=C2=A0=C2=A0 awc->write =3D aspeed_2400_timer_write;
> +=C2=A0=C2=A0=C2=A0 awc->reg_ops =3D &aspeed_timer_ops;
> =C2=A0}
> =C2=A0
> =C2=A0static const TypeInfo aspeed_2400_timer_info =3D {
> @@ -724,6 +726,7 @@ static void
> aspeed_2500_timer_class_init(ObjectClass *klass, void *data)
> =C2=A0=C2=A0=C2=A0=C2=A0 dc->desc =3D "ASPEED 2500 Timer";
> =C2=A0=C2=A0=C2=A0=C2=A0 awc->read =3D aspeed_2500_timer_read;
> =C2=A0=C2=A0=C2=A0=C2=A0 awc->write =3D aspeed_2500_timer_write;
> +=C2=A0=C2=A0=C2=A0 awc->reg_ops =3D &aspeed_timer_ops;
> =C2=A0}
> =C2=A0
> =C2=A0static const TypeInfo aspeed_2500_timer_info =3D {
> @@ -740,6 +743,7 @@ static void
> aspeed_2600_timer_class_init(ObjectClass *klass, void *data)
> =C2=A0=C2=A0=C2=A0=C2=A0 dc->desc =3D "ASPEED 2600 Timer";
> =C2=A0=C2=A0=C2=A0=C2=A0 awc->read =3D aspeed_2600_timer_read;
> =C2=A0=C2=A0=C2=A0=C2=A0 awc->write =3D aspeed_2600_timer_write;
> +=C2=A0=C2=A0=C2=A0 awc->reg_ops =3D &aspeed_timer_ops;
> =C2=A0}
> =C2=A0
> =C2=A0static const TypeInfo aspeed_2600_timer_info =3D {
> @@ -756,6 +760,7 @@ static void
> aspeed_1030_timer_class_init(ObjectClass *klass, void *data)
> =C2=A0=C2=A0=C2=A0=C2=A0 dc->desc =3D "ASPEED 1030 Timer";
> =C2=A0=C2=A0=C2=A0=C2=A0 awc->read =3D aspeed_2600_timer_read;
> =C2=A0=C2=A0=C2=A0=C2=A0 awc->write =3D aspeed_2600_timer_write;
> +=C2=A0=C2=A0=C2=A0 awc->reg_ops =3D &aspeed_timer_ops;
> =C2=A0}
> =C2=A0
> =C2=A0static const TypeInfo aspeed_1030_timer_info =3D {
> diff --git a/include/hw/timer/aspeed_timer.h
> b/include/hw/timer/aspeed_timer.h
> index 07dc6b6f2c..8d0b15f055 100644
> --- a/include/hw/timer/aspeed_timer.h
> +++ b/include/hw/timer/aspeed_timer.h
> @@ -73,6 +73,7 @@ struct AspeedTimerClass {
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 uint64_t (*read)(AspeedTimerCtrlState *s, hwaddr=
 offset);
> =C2=A0=C2=A0=C2=A0=C2=A0 void (*write)(AspeedTimerCtrlState *s, hwaddr of=
fset, uint64_t
> value);
> +=C2=A0=C2=A0=C2=A0 const MemoryRegionOps *reg_ops;

So given the layout changes for the AST2700, perhaps we can improve the
way we've organised the call delegation?

Currently the callbacks in `aspeed_timer_ops` are generic
(aspeed_timer_read(), aspeed_timer_write()), and then we specialise
some bits in the default label of the switch statement by delegating to
the SoC-specific callbacks.

Perhaps we should instead call through the SoC-specific callbacks
first, and then have those call the generic op implementation for
accesses to registers have common behaviours across the AST2[456]00
SoCs.

With that perspective, the change in layout for the AST2700 is
effectively a specialisation for all the registers. Later, if there's
some tinkering with the timer registers for a hypothetical AST2800, we
can follow the same strategy by extracting out the common behaviours
for the AST2700 and AST2800, and invoke them through the default label.

As a quick PoC to demonstrate my line of thinking (not compiled, not
tested, only converts AST2400):

diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 4868651ad489..c7486af4ced2 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -239,9 +239,8 @@ static uint64_t aspeed_timer_get_value(AspeedTimer *t, =
int reg)
     return value;
 }

-static uint64_t aspeed_timer_read(void *opaque, hwaddr offset, unsigned si=
ze)
+static uint64_t aspeed_timer_read_generic(AspeedTimerCtrlState *s, hwaddr =
offset)
 {
-    AspeedTimerCtrlState *s =3D opaque;
     const int reg =3D (offset & 0xf) / 4;
     uint64_t value;

@@ -256,13 +255,20 @@ static uint64_t aspeed_timer_read(void *opaque, hwadd=
r offset, unsigned size)
         value =3D aspeed_timer_get_value(&s->timers[(offset >> 4) - 1], re=
g);
         break;
     default:
-        value =3D ASPEED_TIMER_GET_CLASS(s)->read(s, offset);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\=
n",
+                __func__, offset);
+        value =3D 0;
         break;
     }
-    trace_aspeed_timer_read(offset, size, value);
     return value;
 }

+static uint64_t aspeed_timer_read(void *opaque, hwaddr offset, unsigned si=
ze)
+{
+    AspeedTimerCtrlState *s =3D opaque;
+    return ASPEED_TIMER_GET_CLASS(s)->read(s, offset, size);
+}
+
 static void aspeed_timer_set_value(AspeedTimerCtrlState *s, int timer, int=
 reg,
                                    uint32_t value)
 {
@@ -431,12 +437,11 @@ static void aspeed_timer_set_ctrl2(AspeedTimerCtrlSta=
te *s, uint32_t value)
     trace_aspeed_timer_set_ctrl2(value);
 }

-static void aspeed_timer_write(void *opaque, hwaddr offset, uint64_t value=
,
-                               unsigned size)
+static void aspeed_timer_write_generic(AspeedTimerCtrlState *s, hwaddr off=
set,
+                                    uint64_t value)
 {
     const uint32_t tv =3D (uint32_t)(value & 0xFFFFFFFF);
     const int reg =3D (offset & 0xf) / 4;
-    AspeedTimerCtrlState *s =3D opaque;

     switch (offset) {
     /* Control Registers */
@@ -451,11 +456,20 @@ static void aspeed_timer_write(void *opaque, hwaddr o=
ffset, uint64_t value,
         aspeed_timer_set_value(s, (offset >> TIMER_NR_REGS) - 1, reg, tv);
         break;
     default:
-        ASPEED_TIMER_GET_CLASS(s)->write(s, offset, value);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\=
n",
+                __func__, offset);
+        value =3D 0;
         break;
     }
 }

+static void aspeed_timer_write(void *opaque, hwaddr offset, uint64_t value=
,
+                               unsigned size)
+{
+    AspeedTimerCtrlState *s =3D opaque;
+    ASPEED_TIMER_GET_CLASS(s)->write(s, offset, value);
+}
+
 static const MemoryRegionOps aspeed_timer_ops =3D {
     .read =3D aspeed_timer_read,
     .write =3D aspeed_timer_write,
@@ -465,7 +479,7 @@ static const MemoryRegionOps aspeed_timer_ops =3D {
     .valid.unaligned =3D false,
 };

-static uint64_t aspeed_2400_timer_read(AspeedTimerCtrlState *s, hwaddr off=
set)
+static uint64_t aspeed_2400_timer_read(AspeedTimerCtrlState *s, hwaddr off=
set, unsigned size)
 {
     uint64_t value;

@@ -475,17 +489,18 @@ static uint64_t aspeed_2400_timer_read(AspeedTimerCtr=
lState *s, hwaddr offset)
         break;
     case 0x38:
     case 0x3C:
-    default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\=
n",
                 __func__, offset);
         value =3D 0;
         break;
+    default:
+        return aspeed_timer_read_generic(s, offset);
     }
+    trace_aspeed_timer_read(offset, size, value);
     return value;
 }

-static void aspeed_2400_timer_write(AspeedTimerCtrlState *s, hwaddr offset=
,
-                                    uint64_t value)
+static void aspeed_2400_timer_write(AspeedTimerCtrlState *s, hwaddr offset=
, uint64_t value)
 {
     const uint32_t tv =3D (uint32_t)(value & 0xFFFFFFFF);

@@ -495,10 +510,12 @@ static void aspeed_2400_timer_write(AspeedTimerCtrlSt=
ate *s, hwaddr offset,
         break;
     case 0x38:
     case 0x3C:
-    default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\=
n",
                 __func__, offset);
         break;
+    default:
+        aspeed_timer_write_generic(s, offset, value);
+        break;
     }
 }

diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_time=
r.h
index 07dc6b6f2cbd..540b23656815 100644
--- a/include/hw/timer/aspeed_timer.h
+++ b/include/hw/timer/aspeed_timer.h
@@ -71,7 +71,7 @@ struct AspeedTimerCtrlState {
 struct AspeedTimerClass {
     SysBusDeviceClass parent_class;

-    uint64_t (*read)(AspeedTimerCtrlState *s, hwaddr offset);
+    uint64_t (*read)(AspeedTimerCtrlState *s, hwaddr offset, unsigned size=
);
     void (*write)(AspeedTimerCtrlState *s, hwaddr offset, uint64_t value);
 };


