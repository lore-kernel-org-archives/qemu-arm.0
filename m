Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp11735813wrx;
        Tue, 26 Feb 2019 18:14:19 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYr16rxBvbNCY0hwsxbrza4ShXetK4YbDgT+mEa3bosC4PZCL1gr5Fhzw1ai+bGpt8fjxJ6
X-Received: by 2002:a25:42c3:: with SMTP id p186mr146219yba.392.1551233659568;
        Tue, 26 Feb 2019 18:14:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551233659; cv=none;
        d=google.com; s=arc-20160816;
        b=IONlEczd0VrmEYUM9E0/txZvDoCkfiwMVoYsDzuHXFwCw6/IQw6Cpe8tX9ff0s/SQf
         SO2rn0R3amloADVMWQzqk+zyekU3ibXMWtdFPEfnTmDawZBsV/MCtznfycS3DodEgKQf
         roFUs8M++eKsSI9NxNJTJJLpEdxsR2vSo7fROquXvuTWIGJc01oRaCbuSkMQoVzOlEUK
         Bd/c+wTUdL866lixzsKeQjZHqou6M+kPt5mWJIj5Jw36pOaKyWtLpnyAV/Hwnw+gmMdn
         6pOmf+Rw5cUxeBLQ12LGVwAKu4lBmRXeRk1PScXeNCo4Afzvy5BS5Sh/TYkbQ2ZmHu7i
         djRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wDJ08lmQIqSu5BoWunVh9hqfw6q0c++svdKk4/0dfTc=;
        b=KhdGvfuYOQtn1KNvvaRmSYjkq0Gk/PPUZetzPtbYk8uRj18L9DcLGzobrfveCL5W6x
         QHWw+IHo3UFJ3YN085AIZT7ln6YlxsxLmtFWFnTevjTt3FmyR8Q6TJi8hCaQ/se79lcA
         COzlZRHZ3OVauAgn8R7dS5SwxoTjDC+LUkaYtN1kRFWaSejiN1QnooySIkckOznBr+j6
         YWEsNf9szFkSsoN0sxrVtojWqzgc1teAMeaYWb3vImUxXka9d8SVDpKb4If4hmM2ZRyc
         xuKoX0TpGlSZG4UO78Ed012dXDs3yG1z1CPLHb3PXmUk3B5FZzjcqyyGJnz1S4z6rCqO
         UDBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gXRkPePo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r13si7919854ybl.111.2019.02.26.18.14.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Feb 2019 18:14:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gXRkPePo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:36145 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gyojj-0002jw-0g
	for alex.bennee@linaro.org; Tue, 26 Feb 2019 21:14:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57363)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gyojW-0002hm-0J
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 21:14:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gyojV-0007ng-Cj
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 21:14:05 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:39314)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gyojP-0007eK-Ay; Tue, 26 Feb 2019 21:14:01 -0500
Received: by mail-lf1-x143.google.com with SMTP id r123so2877977lff.6;
	Tue, 26 Feb 2019 18:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wDJ08lmQIqSu5BoWunVh9hqfw6q0c++svdKk4/0dfTc=;
	b=gXRkPePoLAPBuQetMFjsiIqkfGTO7bJ5RshHysSmZ4NVVr3yclcegATK5poYCKgxTx
	+8TOPijCo3ePUAaFBSmHJHwZQ5xJRylIFOwVgQgPtgXQUNI6bUeBH4hPJjQc/vkYpOYK
	5eLM6YAzX0GzJzjtDUinkT/FhnsYOfrtu4vIdrcKmtwvCins9080G62nFzX7IkJaMSCM
	BWXpmq60YVvpt4Hki/JqcO/UpUuCEW5EJtDbYJ9ZUPdUe3SaRWWXzQgme2zUYCAAA8DO
	hWH1KD873cK6+H56vb8CX6XbDSvQFr0ZgMW2T5ZAb9WD/7xA6tMNMuluBFQenSc5VNs8
	DjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wDJ08lmQIqSu5BoWunVh9hqfw6q0c++svdKk4/0dfTc=;
	b=p8N0tRLKrYd6XSPDXan/V2GdcLQ+cfl74ETPOCpZdUT1mXDIB0KFwvB/mW79wc3hLf
	1TARsyA8ZHo+ZVDHmt4VTmTqbSP89kn+sXBHVFci1I7Qjfp+riY/V0Zb+HPUOo/pL5HF
	J1P9MM+nFjFGfdnetTvsvDAjc7PwtWvixMi1/C7WEnqIY1ZoOkN5YLnYoKKxgbZCFGAY
	U1BxJVd3vhicydRJdah4dhxCMgP0imD625tv3Owwi+35lzoqPmZzsqAzLhg+1QyqKdKI
	+7m0LBT38Olo9SIiGd5qW7kHO0p7Rzbhuos3Z74wykIyOJsDL3gHxP0nFdGUvodQudra
	jypA==
X-Gm-Message-State: AHQUAuYACJvdE33Yn4jrN4xlIPnWR97tqnjMVPhIrSXoc/WPH5FX7t8g
	i5hPMop8QSgboBjAQgLE+G5UXnSvcpm1dfr3p78=
X-Received: by 2002:a19:d250:: with SMTP id j77mr15296240lfg.21.1551233636551; 
	Tue, 26 Feb 2019 18:13:56 -0800 (PST)
MIME-Version: 1.0
References: <1550908162-22644-1-git-send-email-thuth@redhat.com>
	<1550908162-22644-19-git-send-email-thuth@redhat.com>
In-Reply-To: <1550908162-22644-19-git-send-email-thuth@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 26 Feb 2019 18:13:02 -0800
Message-ID: <CAKmqyKMG6BRX_DnQsJP5sZ5EG69ds9V3podccw-Qv=+BCKDzOQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::143
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 18/30] hw/arm: Express
 dependencies of netduino / stm32f2xx with Kconfig
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Yang Zhong <yang.zhong@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fQkQQiM4hpUa

On Sat, Feb 23, 2019 at 12:08 AM Thomas Huth <thuth@redhat.com> wrote:
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
> index 62d6b96..b0c6c99 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -25,25 +25,18 @@ CONFIG_TOSA=y
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
> index 487fb03..34243b4 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -87,6 +87,7 @@ config MUSICPAL
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
