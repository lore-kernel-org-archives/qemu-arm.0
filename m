Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7230049wrx;
        Fri, 22 Feb 2019 10:05:22 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbzYVxI/pjdgir02RfeNwuDzgrWV5agpPcc74psW+BuAUXbUV0G2TFgpCRXKgWWz4xiaYx6
X-Received: by 2002:a81:5d82:: with SMTP id r124mr4546138ywb.109.1550858722430;
        Fri, 22 Feb 2019 10:05:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550858722; cv=none;
        d=google.com; s=arc-20160816;
        b=lv+6A1ZmJIKiJz/4tQsYv1gUrnFhjDpF5J2uIwE4BRBqilbMuEXP/5woCYDQIMYm6h
         JpG/XKv037nXrYA7JZYd+YjXlQG0hxfw4NFptsko3wYKD2ELfbfn11Kp1lOAiFNo0GLj
         RAl4xvSXKGitsUEhxKBy69Oep6MA51pnohddmuWDxPwfRAXoXtjMSZ/7930rF7+ZCSIm
         6neTFGx72mJqvW1zJyZ6qki+F1OWvWpM2KqhMVeM4eCZOxUemGk+h32NJvl12eJEaFE6
         a/QF2NWUkkWvCfFptlHrVtamFwzfseXyI/TD7SxClmLFIS5bY7GtI88t/2mWRRwwzuGC
         H11g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HYke7bgk9llkAaLDLEka6LEksv/094ipcu26snsYj1s=;
        b=0Cb8NcaZLgBnUhYoWcOeUnSkX1vdDE1hGBE33vR7blrRszzPjh+w250xInZ7/kkwd/
         /Lv7Q5mrATviXHVKpkljPN4UXzOew3bp+EtD1LtYDVfvhzlpCrm8inDkl6/FGX/OTUF0
         /1mj3LfkyH7S+0IXxVf9TtxV7F6u9trbcOZHM1PgIZxoS6fhWqlzkBEAJo5VcDs0J/kJ
         bdUDeZNSRa650WCeARSBuqgEQBi0BTDgvbGT6j+Dcst/VBhfFXZjgu9FGKT6qVyEungD
         77EGbF3O3aLvC5m63CwpbHC39HduDFxGXpJJiA/UsVMDYUeDdHXXifQxA2h1HAtBFDtS
         n57w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bav4g7MP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d6si1347176ybm.63.2019.02.22.10.05.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 10:05:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bav4g7MP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:55023 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxFCL-0004eV-WD
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 13:05:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59541)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gxFBD-0004Ki-K4
	for qemu-devel@nongnu.org; Fri, 22 Feb 2019 13:04:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gxFBC-0006S9-GX
	for qemu-devel@nongnu.org; Fri, 22 Feb 2019 13:04:11 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:34158)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gxFBC-00069i-6w; Fri, 22 Feb 2019 13:04:10 -0500
Received: by mail-lj1-x241.google.com with SMTP id l5so2416662lje.1;
	Fri, 22 Feb 2019 10:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HYke7bgk9llkAaLDLEka6LEksv/094ipcu26snsYj1s=;
	b=bav4g7MPup99rAyVCg6e18APtyHAcNr5vySj98w5k/gAW/AU5HW+0QZ8KnQuDeZ4rX
	5qZuk2jWAUvQDj1a/ruu4uou/FMEKjP2IXWEMDSSKcGjpeAWIJq26DrP6VKZZFeraFBn
	TnqHHNXHLePJMhdyWE5hyfMr2tiWpAypmPRAotnOMhQ/ChZF7uTza73m6BaXK7uWJqjL
	jMzXdfSgQ+pXpzC8ReWLsjqy0gS2f6Kg6SMTzC6h87MihHDPo/86t/le2h7DCFVMnN1N
	UwX853bAwEaTwOtk05XIgExqNeMROiYdAQpU80d3AJyZV3ZY4j6T8cIm+dzYtDKu4qns
	mR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HYke7bgk9llkAaLDLEka6LEksv/094ipcu26snsYj1s=;
	b=WU3VW2krAdGzWXOjuqp1LpOn2pCEgv+7xAEc86QmkUTI6Pt6Dm/UDqTYanpJDZyvnl
	00MtBnPab1BGPUkA2BYXz+6K/LYRlZIe/Fk6U9tgYi4hNzLdqYlKQ1HaLRDOpegpERSe
	TQhoxTkjKwGcPfNnqg8BYoNt8esQvb4v7JuCa6Mn+BJpeR33iQRUAthFV33TOUkYdz3k
	vlXZz2JjP3DHDm6x9h3k5l9gTTcDeZL4z9pHPL/K5cV3OFqLMYeI1ml2YycRS6bbgzwU
	CnHaEUK3wWF8O5khQ1e4xLfE8y3N3rOY0laNxCJt+VBtzP+U4l4t+K/TNVrTBhRNtOqI
	ZNSw==
X-Gm-Message-State: AHQUAub3arjRuBBqZVEaXvuwQ20w7Cq6FXHIA0CPYl3w7R7xoSGbAYj4
	x8wPcGZMc6quzpoWZ2eevpg4KkSu7lXEziR35Cw=
X-Received: by 2002:a2e:9e95:: with SMTP id
	f21-v6mr2980491ljk.128.1550858632728; 
	Fri, 22 Feb 2019 10:03:52 -0800 (PST)
MIME-Version: 1.0
References: <1550047098-1210-1-git-send-email-thuth@redhat.com>
	<1550047098-1210-15-git-send-email-thuth@redhat.com>
In-Reply-To: <1550047098-1210-15-git-send-email-thuth@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 22 Feb 2019 10:03:25 -0800
Message-ID: <CAKmqyKMbCVoh2101VDW2fNOsy_Rbddz8LY08WL8UJR5Ve3HKBQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-devel] [PATCH v2 14/25] hw/arm: Express dependencies of
 netduino / stm32f2xx with Kconfig
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Yang Zhong <yang.zhong@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: htNXkg97UpiC

On Wed, Feb 13, 2019 at 1:11 AM Thomas Huth <thuth@redhat.com> wrote:
>
> Netduino only depends on the stm32f205 SoC which in turn depends on
> its components.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  default-configs/arm-softmmu.mak | 9 +--------
>  hw/arm/Kconfig                  | 7 +++++++
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 9db6808..3279fb5 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -24,25 +24,18 @@ CONFIG_TOSA=y
>  CONFIG_Z2=y
>  CONFIG_COLLIE=y
>  CONFIG_ASPEED_SOC=y
> +CONFIG_NETDUINO2=y
>
>  CONFIG_VGA=y
>  CONFIG_SSI_M25P80=y
>  CONFIG_ALLWINNER_EMAC=y
>  CONFIG_IMX_FEC=y
>
> -CONFIG_NETDUINO2=y
> -
>  CONFIG_FRAMEBUFFER=y
>
>  CONFIG_DIGIC=y
>  CONFIG_MPS2=y
>  CONFIG_RASPI=y
> -CONFIG_STM32F2XX_TIMER=y
> -CONFIG_STM32F2XX_USART=y
> -CONFIG_STM32F2XX_SYSCFG=y
> -CONFIG_STM32F2XX_ADC=y
> -CONFIG_STM32F2XX_SPI=y
> -CONFIG_STM32F205_SOC=y
>  CONFIG_NRF51_SOC=y
>
>  CONFIG_CMSDK_APB_TIMER=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 3d580fa..5d7dafb 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -81,6 +81,7 @@ config MUSICPAL
>
>  config NETDUINO2
>      bool
> +    select STM32F205_SOC
>
>  config NSERIES
>      bool
> @@ -262,6 +263,12 @@ config RASPI
>
>  config STM32F205_SOC
>      bool
> +    select ARM_V7M
> +    select STM32F2XX_TIMER
> +    select STM32F2XX_USART
> +    select STM32F2XX_SYSCFG
> +    select STM32F2XX_ADC
> +    select STM32F2XX_SPI
>
>  config XLNX_ZYNQMP_ARM
>      bool
> --
> 1.8.3.1
>
>
