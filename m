Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2234045wrx;
        Fri, 19 Apr 2019 14:27:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzu7xrCfD06WQAKdw+0eL7smJMBV2/5+OfZXPGAkBkTSOCVVw/H4gfwPhzz+96ywnDSKoNa
X-Received: by 2002:a5d:4d49:: with SMTP id a9mr4742569wru.227.1555709270742;
        Fri, 19 Apr 2019 14:27:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555709270; cv=none;
        d=google.com; s=arc-20160816;
        b=AG6TyxWMywjssCwcGRh+GtCT+/ZUDqnkHdehqHPxzSM30vC/FxQjwuIY5/r2w6r3/p
         //JjMQ609kJkzwDJS82MV2fO82DvI2KNPXgzqunNDXf0lE3E2/gblKZzVsf2CPqJu1Di
         VuPGlbKBe6vZ57RC9411RuZ+m4RL3BWt0ij2PumAL266ZctHvI3GPN/xBvfrW4bU8zT+
         Hz7p+up7YbPp5QBxrNpEDAMyGwWZPn1gtRWOKVvy7ZObMbXxbvCOqHDq6DtypC5LdlXy
         /+G1trFZBxTLv1vjzIpyYqrErFS/wHKJFXsHmkLkv8AtMt4Gs66TEqNgrN4NTSTmGUnM
         +1xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2tubYGVGC+zztlt6H1UAeONkKsPTLRYswJfNrPrC5Zc=;
        b=uKA5+Kg2IFpJ7emNEqyZKnRBGkFFQTtjRy1xzmMNGMBqrazDYWrHuDzHSVFumU+oM+
         8ZnvHg+/0tAU6MEIQ2oDoCoOPvTtrJgXCDxDJjt6lmXwEq5K+RXUshNr1HhaQe6se6OV
         PhT8oOPU8+AlyARkfJ38lyNDGqFPd+cbBbuS3vGDykWyMAhfLtb3QuseLL9C1eyb9TVd
         Ud7okQzOdslhkn/fM3WC7bMOThcS4vchhlBkvTSkCDZtHKGxGIR7r/HmkIYYCThxGoBr
         uj5gn6fiXSJdiCU09/z7oAGm1N0bD+z6XNkU+WtG+YydWxWdIoHvwDAruhkXQzPiCi06
         NTFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LpUvNhUm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f191si4537093wmf.103.2019.04.19.14.27.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Apr 2019 14:27:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LpUvNhUm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:33425 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hHb2z-0000xB-Pl
	for alex.bennee@linaro.org; Fri, 19 Apr 2019 17:27:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54598)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hHb2R-0000bE-EL
	for qemu-arm@nongnu.org; Fri, 19 Apr 2019 17:27:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hHaq6-0008Kn-N6
	for qemu-arm@nongnu.org; Fri, 19 Apr 2019 17:14:31 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:38475)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hHaq4-0008JL-5y; Fri, 19 Apr 2019 17:14:28 -0400
Received: by mail-lj1-x241.google.com with SMTP id p14so5587217ljg.5;
	Fri, 19 Apr 2019 14:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2tubYGVGC+zztlt6H1UAeONkKsPTLRYswJfNrPrC5Zc=;
	b=LpUvNhUmOQX3fz46wwSsfI9LqQRXqt2Je5AW90smgfQ2bc20skwxySvSvMZIcD7HwX
	p0cxPaNUzIkTGI48kxmCgRpGCMI0leEhqy84JT2floiTBO3l4dBdy9nwF6qXl8qk83mY
	kR0ojbgsxX0RtB+hNI9+DtzmYXI/ItFiKXjYDE4p+ZgK7clTAhAMGWFbk/WCYTq5KFFd
	emMPmQcn6GekW0FkwKo+3nrp6VpvqyeT9Rc6ajcTrNskiIhPWBYTqDtKLAiH9iPyvjfj
	nBHdmfHdscfAc3ylt7FI0MoOQufsLodwOhAN3v7cqPdYXEdXLCYQ+EwUJKCjDk77bAC2
	SB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2tubYGVGC+zztlt6H1UAeONkKsPTLRYswJfNrPrC5Zc=;
	b=j8z3ocq7v2AiLdF9AgQgST36p+2nf14RRYYyu6xOZipiy5P1A9vzPHgk8tZTsjogc1
	MJ8rn2/Jt6JIbVd2xhanbcI6Dj5wR5C85DtNwHfPlNANsL1XMlvovBrFQfxpAeqPQuLE
	I3DUfikWL2M7r/rGmcOtPsnOPYNPadEHHbrQ9V9mfbPRl2CHDJg00HDrKIlSNrPhkPXQ
	TdvzjcfooJar+nIoJyU8H9HfH4OsV8oEiDLD9uX7fbMYwTIwj5fw/mU57mn7sh5K6flt
	5Yb6uOzl1T9YmTbOSaL+K47XpwCOZHfrkLIwxU7qJFM3tB5Z658AB5nhTG/nlVwGJ8Jz
	/o+Q==
X-Gm-Message-State: APjAAAWoXdcgqoKcqIUSUmObmN+WnzrViG9ud8dTGEY9sJNyWcsmb7Vl
	Sm4xnTSjrXUieLBoIJ7pWNf4VrtQ1qRFu8t25qM=
X-Received: by 2002:a2e:974d:: with SMTP id f13mr3377594ljj.140.1555708466431; 
	Fri, 19 Apr 2019 14:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-26-thuth@redhat.com>
In-Reply-To: <20190418180057.3593-26-thuth@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Apr 2019 14:13:59 -0700
Message-ID: <CAKmqyKM4ZtUmT6U-9Nv=S_3KMVnPzogOkNPrtyqvKz=b+u1AYQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-QEMU-4.1 v5 25/29] hw/arm:
 Express dependencies of the microbit / nrf51 machine with Kconfig
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jan Kiszka <jan.kiszka@web.de>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Yang Zhong <yang.zhong@intel.com>, Rob Herring <robh@kernel.org>,
	Qemu-block <qemu-block@nongnu.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	Cedric Le Goater <clg@kaod.org>, John Snow <jsnow@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>, Philippe Mathieu-Daude <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bTlzK15N+S6n

On Thu, Apr 18, 2019 at 11:23 AM Thomas Huth <thuth@redhat.com> wrote:
>
> Add Kconfig dependencies for the NRF51 / microbit machine.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  default-configs/arm-softmmu.mak | 3 +--
>  hw/arm/Kconfig                  | 6 ++++++
>  hw/arm/Makefile.objs            | 3 ++-
>  3 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 6dc388c43e..233937f394 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -35,11 +35,10 @@ CONFIG_RASPI=y
>  CONFIG_DIGIC=y
>  CONFIG_SABRELITE=y
>  CONFIG_EMCRAFT_SF2=y
> +CONFIG_MICROBIT=y
>
>  CONFIG_VGA=y
>
> -CONFIG_NRF51_SOC=y
> -
>  CONFIG_FSL_IMX25=y
>  CONFIG_FSL_IMX7=y
>  CONFIG_FSL_IMX6UL=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 58439c492a..708eae19e5 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -347,8 +347,14 @@ config FSL_IMX6UL
>      select IMX_I2C
>      select SDHCI
>
> +config MICROBIT
> +    bool
> +    select NRF51_SOC
> +
>  config NRF51_SOC
>      bool
> +    select I2C
> +    select ARM_V7M
>
>  config EMCRAFT_SF2
>      bool
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index eae9f6c442..994e67dd0d 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -8,6 +8,7 @@ obj-$(CONFIG_EMCRAFT_SF2) += msf2-som.o
>  obj-$(CONFIG_HIGHBANK) += highbank.o
>  obj-$(CONFIG_INTEGRATOR) += integratorcp.o
>  obj-$(CONFIG_MAINSTONE) += mainstone.o
> +obj-$(CONFIG_MICROBIT) += microbit.o
>  obj-$(CONFIG_MUSICPAL) += musicpal.o
>  obj-$(CONFIG_NETDUINO2) += netduino2.o
>  obj-$(CONFIG_NSERIES) += nseries.o
> @@ -48,4 +49,4 @@ obj-$(CONFIG_ARMSSE) += armsse.o
>  obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o mcimx7d-sabre.o
>  obj-$(CONFIG_ARM_SMMUV3) += smmu-common.o smmuv3.o
>  obj-$(CONFIG_FSL_IMX6UL) += fsl-imx6ul.o mcimx6ul-evk.o
> -obj-$(CONFIG_NRF51_SOC) += nrf51_soc.o microbit.o
> +obj-$(CONFIG_NRF51_SOC) += nrf51_soc.o
> --
> 2.21.0
>
>
