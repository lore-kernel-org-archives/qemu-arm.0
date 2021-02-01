Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp3216829lfo;
        Mon, 1 Feb 2021 00:18:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyuxfVZc8CzVRBiFxQa5uuFzABIoR8MTp6wVEaaODeX5r3uhwrDvk25lizC3/exi2G2z9iA
X-Received: by 2002:a25:3007:: with SMTP id w7mr22463388ybw.495.1612167495007;
        Mon, 01 Feb 2021 00:18:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612167495; cv=none;
        d=google.com; s=arc-20160816;
        b=VD2rPQ44KyDedvf2EEffp0c/LUATPEErpzfn484Ng7moUEe3CkVXSFEzuGvSTWuo05
         FLLiFO0G7iUeD39lFAQ/nLm4gbHXHBYCh1tZysLx+ZsIIaZC1QSkrKh2xJZTBettq7XX
         yn4pg7Pynw5K0C8ZxDAcEfD0KbH2ye+kdZoYVXSPp75/6/cPtUWeDGz9YMGFsO1/tdfi
         hbTjs4rNloqbPO3Xx4RR4VdXKSxwP+S+en1fzzayOg36h9L18Zf6yj3Pao8fh4JfJQc6
         SlcToCpowgONnuT2XPQH7JAW6WfLUNTnzvx255UuABT8M+YumRlIo33jBbOGYegmcHQZ
         mhTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=r0CltJWtYwRND/OpSTkq0nuwwoFHtGa7FKmGwICQdK4=;
        b=x1ujNZsgzn9D1GbHCLg2fw+6GHyvgQ0NrRgibpcHqU47az1g0Q5LTrqkacC9kWeXwD
         bI7ghfPkyaUHmtEWutuoafVvZRbmIei+mYbzvet6Y6ixEbfcWkq6nFUpiDE5y/882/lu
         yRMQA6CHktKijC4P+NWipwdB6wkLwsjkk1HQ2l6iLZP0av8EJWRYQZpHQJPJC7W2Ozty
         BqP70Eg5XWPDyeAdKvirXPzJC6W0fpFwEQs1R18pI1O+NMopZ15LlKss8fOGwZHnjIbH
         rNfXnJ+D8S464Q1Sl3h1e31LXuBvHQIFBnjbPbtpH2I1sb0CcbqNZHwjw75XK3WfFKxB
         58pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=j39dMqTa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g205si15616739ybg.317.2021.02.01.00.18.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Feb 2021 00:18:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=j39dMqTa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1]:33104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6UPW-0003PQ-By
	for alex.bennee@linaro.org; Mon, 01 Feb 2021 03:18:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l6UPO-0003P7-80; Mon, 01 Feb 2021 03:18:06 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:37208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1l6UPM-00069Q-9A; Mon, 01 Feb 2021 03:18:06 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 3433EC602E6;
 Mon,  1 Feb 2021 09:18:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1612167480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r0CltJWtYwRND/OpSTkq0nuwwoFHtGa7FKmGwICQdK4=;
 b=j39dMqTafjD423uZqunZV/Qrp1ydIz2+jW7S55DRG9z4iN9uY2Qd5aR5obfd//W/xc6WkO
 VTOjHcrhWWS9HWkhJ9wmiuxUIYIcfzNIrVbnpYrEBtb0cMPjsj2Iw6qGxwZWBlXhCupkzY
 B6Xhe2Dc88ZUG7Ua4ozgYorzVlvrLOdkxSTF0XJYA7cELLtubNktA1kTF8O//eOGoCMfcR
 ozO5eyKJILfEegR2t+h/Z/jRm7Ph+OIzePH+fzo/0GyulS7Sx8P0xKt1OGHYMD1PhIEKU9
 4Kyy3idzjEC4hsn/IfTZ8PtDCLtgTr7DUiuI7wTduvoF6NnNe9OKd75xnS8HOQ==
Date: Mon, 1 Feb 2021 09:18:26 +0100
From: Luc Michel <luc@lmichel.fr>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 2/2] hw/arm/raspi: Restrict BCM2835 / BCM2836 SoC to
 TCG
Message-ID: <20210201081826.yx34xjzbgsiwzcpd@sekoia-pc.home.lmichel.fr>
References: <20210131151410.318649-1-f4bug@amsat.org>
 <20210131151410.318649-3-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210131151410.318649-3-f4bug@amsat.org>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yquQV6/dz7QM

Hi Philippe,

On 16:14 Sun 31 Jan     , Philippe Mathieu-Daudé wrote:
> KVM requires the target cpu to be at least ARMv8 architecture
> (support on ARMv7 has been dropped in commit 82bf7ae84ce:
> "target/arm: Remove KVM support for 32-bit Arm hosts").
Wow, is there absolutely no way to do that then? What about using an
ARMv8 and starting in AArch32 mode? Is that possible with KVM? I guess
it might not be strictly identical as spawning the "real" CPU...

> 
> From the various SoC used by the Raspberry Pi machines, only
> the BCM2837 is an ARMv8 (Cortex-A53).
> 
> Restrict the BCM2835 (ARM1176) and BCM2836 (Cortex-A7) to TCG.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/bcm2836.c | 6 ++++++
>  hw/arm/raspi.c   | 4 ++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index fd16ed87c40..3051764f2dc 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -89,6 +89,7 @@ static bool bcm283x_common_realize(DeviceState *dev, Error **errp)
>      return true;
>  }
>  
> +#ifdef CONFIG_TCG
I'm not sure it's enough. TCG and KVM can be enabled in the same
binary. You'll have to perform a runtime check here I think.

>  static void bcm2835_realize(DeviceState *dev, Error **errp)
>  {
>      BCM283XState *s = BCM283X(dev);
> @@ -107,6 +108,7 @@ static void bcm2835_realize(DeviceState *dev, Error **errp)
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 1,
>              qdev_get_gpio_in(DEVICE(&s->cpu[0].core), ARM_CPU_FIQ));
>  }
> +#endif /* CONFIG_TCG */
>  
>  static void bcm2836_realize(DeviceState *dev, Error **errp)
>  {
> @@ -178,6 +180,7 @@ static void bcm283x_class_init(ObjectClass *oc, void *data)
>      dc->user_creatable = false;
>  }
>  
> +#ifdef CONFIG_TCG
>  static void bcm2835_class_init(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(oc);
> @@ -201,6 +204,7 @@ static void bcm2836_class_init(ObjectClass *oc, void *data)
>      bc->clusterid = 0xf;
>      dc->realize = bcm2836_realize;
>  };
> +#endif /* CONFIG_TCG */
>  
>  #ifdef TARGET_AARCH64
>  static void bcm2837_class_init(ObjectClass *oc, void *data)
> @@ -227,6 +231,7 @@ static const TypeInfo bcm283x_types[] = {
>          .class_init     = bcm283x_class_init,
>          .abstract       = true,
>      },
> +#ifdef CONFIG_TCG
>      {
>          .name           = TYPE_BCM2835,
>          .parent         = TYPE_BCM283X,
> @@ -236,6 +241,7 @@ static const TypeInfo bcm283x_types[] = {
>          .parent         = TYPE_BCM283X,
>          .class_init     = bcm2836_class_init,
>      },
> +#endif /* CONFIG_TCG */
>  #ifdef TARGET_AARCH64
>      {
>          .name           = TYPE_BCM2837,
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index dce966a4dd8..cfa15504d9c 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -319,6 +319,7 @@ static void raspi_machine_class_common_init(MachineClass *mc,
>      mc->default_ram_id = "ram";
>  };
>  
> +#ifdef CONFIG_TCG
>  static void raspi0_machine_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc = MACHINE_CLASS(oc);
> @@ -346,6 +347,7 @@ static void raspi2b_machine_class_init(ObjectClass *oc, void *data)
>      rmc->board_rev = 0xa21041;
>      raspi_machine_class_common_init(mc, rmc->board_rev);
>  };
> +#endif /* CONFIG_TCG */
>  
>  #ifdef TARGET_AARCH64
>  static void raspi3ap_machine_class_init(ObjectClass *oc, void *data)
> @@ -376,6 +378,7 @@ static const TypeInfo raspi_machine_types[] = {
>          .class_size     = sizeof(RaspiMachineClass),
>          .abstract       = true,
>      },
> +#ifdef CONFIG_TCG
>      {
>          .name           = MACHINE_TYPE_NAME("raspi0"),
>          .parent         = TYPE_RASPI_MACHINE,
> @@ -389,6 +392,7 @@ static const TypeInfo raspi_machine_types[] = {
>          .parent         = TYPE_RASPI_MACHINE,
>          .class_init     = raspi2b_machine_class_init,
>      },
> +#endif /* CONFIG_TCG */
>  #ifdef TARGET_AARCH64
>      {
>          .name           = MACHINE_TYPE_NAME("raspi3ap"),
> -- 
> 2.26.2
> 

-- 
