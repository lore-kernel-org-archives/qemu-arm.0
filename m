Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp5698486lfy;
        Mon, 10 Aug 2020 16:21:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9ufPiq42nyAK67yJZiBhS0cAMWmS4K3VZ8Ej2IrBhCUNOM8/lsA0BmNlM41D8CcF5k1vA
X-Received: by 2002:a25:5f0f:: with SMTP id t15mr45223876ybb.253.1597101673478;
        Mon, 10 Aug 2020 16:21:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597101673; cv=none;
        d=google.com; s=arc-20160816;
        b=ejF/2BH4NPBRzRMdOAw94fNQ3ULARf0WNJRnjWD4erTbP4NXJIe8m3kyez7WZ9waIX
         Szd06giimInbZjbKxmPlFjPaICuA3VhXbzhOQtxTFfA6boYcxFCaeGlGdCc6+5p+0cdW
         MCLptpgw450TTHIXM/Br6k4gdrbiO3xl4ZJ237JyjP+SAK8X8D5FjQquKjHY2weYVSgG
         1kpsIrDgARVxO8Y/2ce2zolUYGnY1/WWT534xfvgu+LD9h/wQ4NFmuInsLppchY6xThe
         gSqbc8aX/xRNXXjvEYqvzcA916bTaU6aX0KohzWhvUFZHSm3t3zXWlJ1Kdy83NnMN6QA
         dmvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=n7id5il0JMsIxlfb90CWIJnpGml4/jw1H46enYJZeXA=;
        b=sykBrxpjQUj6NjFga4FGGpUrWng57ldIwsisD6WTQzP+q6f7myaq7qLVo7dRdn3atk
         Alm4vhjLSKVC1ispIIYL/FZFCENk7lmzFYkWmeRjLKOq+gyxHm5z1W+2gaeuzSS3Kmhw
         MgPL52nn6nWZd4PEwMWLcBgkS0ItB/rUuwYfGohZUa1v5sr4d8CUPgt8vUWH4fLfwPnW
         SVLFDy6dyJr43kXIK6p9kaqgQ653p3ukFAbyL0FS2EqSggiGMXw+dS5Cjc+nMRz7VcZV
         yDRpseixi6ZF+VYs+Q0jhXt02+NZlZaKB2qCzDxhL4xLkYUOR+38Eydfivu4DGfhykXt
         RBSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=PWCm0son;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m1si12421424ybt.466.2020.08.10.16.21.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Aug 2020 16:21:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=PWCm0son;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k5H6O-0006bk-Kt
	for alex.bennee@linaro.org; Mon, 10 Aug 2020 19:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1k5H61-0006b1-1y; Mon, 10 Aug 2020 19:20:49 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:42174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1k5H5y-0003di-Fa; Mon, 10 Aug 2020 19:20:48 -0400
Received: by mail-ej1-x642.google.com with SMTP id g19so11081046ejc.9;
 Mon, 10 Aug 2020 16:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n7id5il0JMsIxlfb90CWIJnpGml4/jw1H46enYJZeXA=;
 b=PWCm0sonqzqBUbmd82bYe/YzqJyFYlUif7VeGN0pZuMYjvRa6VEAEY5voWnWFxMstQ
 AHEFpR/k73fshr94Oa28Wqig21sXFgcxZ1GXYdLOAlQTUC6FOPOTR1nT+KpJ+IZjRlc2
 RUYLEBZNQutHGr5Ae01hDHKBvxEazuSF/9VNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n7id5il0JMsIxlfb90CWIJnpGml4/jw1H46enYJZeXA=;
 b=SygQIuIvOEEa/4cCEvC3Wz3rRFwYUTArH3DTxAyVjJPr1MHdDrMeml1wxH6xbxfoYM
 9aFuuXmiMj0H/AWqmQAyp9MjMLOSGIAW7yAGZKD7ILiZQRJxcEc07zZGlEu3MjSU4lP/
 7XB7BQpWYWLifcZHPX6LMffIPksDFCtWCl/owKeWZe1oWvr7TKpG5X6zsX+5bCGjS95c
 gES6hkgdabxhd/tUnGoXvqUd05k5lOMVSuScuEGmOCO9reBcbn5od2TwiUw+vPuCp/nW
 aniW2lMCSO73apN4TeU3D1uIRSr99xpBzfQJwJoBlLIX5Bu28pJM38V2/O4PCmoMEjEH
 5ByA==
X-Gm-Message-State: AOAM531N+reA19I/hnjKRbOC6HxnB8k+iCwGCYeyfgamEUYEFThap+h9
 2dpGeXnLFSPX+2ZKPmIkLYrh63zL5ERYp7sfHx8=
X-Received: by 2002:a17:906:198e:: with SMTP id
 g14mr23312740ejd.266.1597101643380; 
 Mon, 10 Aug 2020 16:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200806132106.747414-1-clg@kaod.org>
 <20200806132106.747414-9-clg@kaod.org>
 <CACPK8Xcy-OzbQ4oiLaq96VzROSsmnmSAa0dytRcCVp2ot+mQnw@mail.gmail.com>
 <6ed71987-6247-2098-4e48-9c5d59a74353@kaod.org>
In-Reply-To: <6ed71987-6247-2098-4e48-9c5d59a74353@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Aug 2020 23:20:30 +0000
Message-ID: <CACPK8Xfx+TQezEisV9Tbew7SpoGu0N-tvwNWq+3-t1Y1bA6dXQ@mail.gmail.com>
Subject: Re: [PATCH for-5.2 08/19] aspeed/sdhci: Fix reset sequence
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, Eddie James <eajames@linux.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EFFj2HvVqcX6

On Mon, 10 Aug 2020 at 17:16, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 8/7/20 1:42 AM, Joel Stanley wrote:
> > On Thu, 6 Aug 2020 at 13:21, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> >>
> >> BIT(0) of the ASPEED_SDHCI_INFO register is set by SW and polled until
> >> the bit is cleared by HW. Add definitions for the default value of
> >> this register and fix the reset sequence by clearing the RESET bit.
> >
> > This is mentioned in the datasheet but I couldn't find if software
> > depends on the behaviour. Were you just trying to make the model more
> > accurate?
> >
> >>  #define ASPEED_SDHCI_INFO            0x00
> >> -#define  ASPEED_SDHCI_INFO_RESET     0x00030000
> >> +#define  ASPEED_SDHCI_INFO_SLOT1     (1 << 17)
> >> +#define  ASPEED_SDHCI_INFO_SLOT0     (1 << 16)
> >> +#define  ASPEED_SDHCI_INFO_RESET     (1 << 0)
> >>  #define ASPEED_SDHCI_DEBOUNCE        0x04
> >>  #define  ASPEED_SDHCI_DEBOUNCE_RESET 0x00000005
> >>  #define ASPEED_SDHCI_BUS             0x08
> >> @@ -67,6 +69,9 @@ static void aspeed_sdhci_write(void *opaque, hwaddr =
addr, uint64_t val,
> >>      AspeedSDHCIState *sdhci =3D opaque;
> >>
> >>      switch (addr) {
> >> +    case ASPEED_SDHCI_INFO:
> >> +        sdhci->regs[TO_REG(addr)] =3D (uint32_t)val & ~ASPEED_SDHCI_I=
NFO_RESET;
> >
> > I think bits 24 and 25 should be writable too?
> >
> >         sdhci->regs[TO_REG(addr)] =3D (uint32_t)val &
> > ~(ASPEED_SDHCI_INFO_RESET | ASPEED_SDHCI_INFO_SLOT10 |
> > ASPEED_SDHCI_INFO_SLOT1);
> >
> >> +
> >>      case ASPEED_SDHCI_SDIO_140:
> >>          sdhci->slots[0].capareg =3D (uint64_t)(uint32_t)val;
> >>          break;
> >> @@ -155,7 +160,8 @@ static void aspeed_sdhci_reset(DeviceState *dev)
> >>      AspeedSDHCIState *sdhci =3D ASPEED_SDHCI(dev);
> >>
> >>      memset(sdhci->regs, 0, ASPEED_SDHCI_REG_SIZE);
> >> -    sdhci->regs[TO_REG(ASPEED_SDHCI_INFO)] =3D ASPEED_SDHCI_INFO_RESE=
T;
> >> +    sdhci->regs[TO_REG(ASPEED_SDHCI_INFO)] =3D
> >> +        ASPEED_SDHCI_INFO_SLOT1 | ASPEED_SDHCI_INFO_SLOT0;
> >
> > If we want to be super strict this is true for the "sd" devices, but
> > the "emmc" device in the ast2600 only sets slot0. I don't think this
> > distinction is important to model though.
>
> Both slots seems to be activated on all three SoCs. Am I looking at the
> wrong controller ?

Yes. the "SD/SDIO Host Controller" have both slots. The "eMMC
controller" at 0x1E750000 on the ast2600 has just the one slot.

We have a property for the number of slots, so we could do something like t=
his:

--- a/hw/sd/aspeed_sdhci.c
+++ b/hw/sd/aspeed_sdhci.c
@@ -159,12 +159,15 @@ static void aspeed_sdhci_realize(DeviceState
*dev, Error **errp)
 static void aspeed_sdhci_reset(DeviceState *dev)
 {
     AspeedSDHCIState *sdhci =3D ASPEED_SDHCI(dev);
+    uint32_t slots =3D ASPEED_SDHCI_INFO_SLOT0;

     memset(sdhci->regs, 0, ASPEED_SDHCI_REG_SIZE);

+    if (sdhci->num_slots =3D=3D 2)
+        slots |=3D ASPEED_SDHCI_INFO_SLOT1;
+
     /* Same default value on AST2400, AST2500 and AST2600 SoCs */
-    sdhci->regs[TO_REG(ASPEED_SDHCI_INFO)] =3D
-        ASPEED_SDHCI_INFO_SLOT1 | ASPEED_SDHCI_INFO_SLOT0;
+    sdhci->regs[TO_REG(ASPEED_SDHCI_INFO)] =3D slots;
     sdhci->regs[TO_REG(ASPEED_SDHCI_DEBOUNCE)] =3D ASPEED_SDHCI_DEBOUNCE_R=
ESET;
 }
