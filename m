Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2622065wrs;
        Mon, 19 Aug 2019 05:59:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzhdW/3dqqZ+FsUMWvFat9GRiAdrX+ZqAXvxEZFTr4AuRbIPZMWaS8JawkfrW5MPMCu9GmY
X-Received: by 2002:a17:906:3189:: with SMTP id 9mr20153093ejy.172.1566219576236;
        Mon, 19 Aug 2019 05:59:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566219576; cv=none;
        d=google.com; s=arc-20160816;
        b=FbhRfkyJsHQR6PDCCqrHk9I9D4Tdzb10Piwm8mHU5EfTdcczlAVfK4aHafOVo7pWJt
         1+W5nB2mas3ZLinOtti4IoghLRRVtHSXqfX3FrbYIy0+v10W0T2+VtZwmYopOhpAJk7P
         k8CC8EuT8Y90vCxBaFfXtaIl9um0roCNNIQjOPH02y+7unQPDtQORaUvm4C0k8lSdAnL
         qIiUPm1fOUTt+mlgEqvwjhy3ga9MShQgrt/tXBe3ULZORYiexr0hKlRMxeK+bJv+sQYc
         FMM/x7UaMxU7xfFvBSL/ONvXHkj+sQHLP4BZXmOJZ1B/S8SjNJXJnwcmCzdXLf9PwqdB
         7whA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=Fd2+eH1zXiD6ncHnghffVA7+z3hVrEYbwkIoIillleQ=;
        b=dGrm54meToNRUGlDc9i+bC27eYle7GI8Qc9hJ0ZvDtM6nDrgj3I/mnhm7tb0F2J8XV
         Ksaqp/IdFIo55E0jnMRbD81Vz005bJdoNDpHmDwjnuZ9d6O7BnLt3o6KiKQF7Me6RT46
         lUpf2LHMUGr6r8P7SRoBZL+JD7//MLjmyhjL9pOuPW5LIdPtCDlUZqvLhiCF754+ewvy
         wSfFKYhiBUabAbU9oF9a55sFSXk8DwKG2Eo12jUYLV+K+q7R+nnL9tSPXz1NHZzlz7ue
         cM0IjOaoNV+3hYIBMZBc1F3iflhKkHo0wgxqSVeEi4v6vSmcZnEdYjMJbQVnak4lQoWn
         rtSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ga14si6978990ejb.297.2019.08.19.05.59.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 05:59:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzhG2-0004t8-Rv
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 08:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43924)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1hzh4j-0007zX-QG
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 08:47:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hzh4i-0005dB-A0
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 08:47:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52164)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hzh4h-0005ch-VX
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 08:47:52 -0400
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0B40389AC7
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 12:47:51 +0000 (UTC)
Received: by mail-wm1-f72.google.com with SMTP id d65so506695wmd.3
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 05:47:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E3EWK1hCVDvHhz9MwDgrsGJYt0HwG2P0wxgxsXsAI48=;
 b=h2Vs1PI+93Jss6pXvC8enLgWdzwfOxhXC2+gBtN7kDjyKhqPp/JsNUvRSnjaeXvctN
 6zSqevKaiPC7JI6krzrSvBMmtUkeoSjVI06CpDO2vjHsXgER0YiH600bXtrU3DjSekmI
 OqaYqwEKXwtyq2tH5IBCVHp7oE02awmPjOryK0kJM2Ba0FDqF9izr6pFBr3e/Pd8+rpj
 PgFQSPkWNLjaF2zHrBfkLK9zZx57JB3lIptdDyByTa2baKBZc8r8I8Mpue3iA3X3MmsQ
 tOmKw/7zBSeRirFRQFlAgwlLxvOvynkZQQSUwVq9nTCM/eIVZn6D7vvblGn8lnhPi6T5
 1HFw==
X-Gm-Message-State: APjAAAVv9hifsx7cmkWvlwMcztzNtQYTvsgn0TA3rlIizGpPZbjo+mPZ
 IVkYDyHDKYGQ5GDfZKkkFrSyk0SmFh59rP92SFZtRwHFEaPNmiHad69RRAG8j8Yt4UmJVRXn9ou
 XCyAVZog/v+XM
X-Received: by 2002:a1c:4c02:: with SMTP id z2mr21517313wmf.92.1566218869715; 
 Mon, 19 Aug 2019 05:47:49 -0700 (PDT)
X-Received: by 2002:a1c:4c02:: with SMTP id z2mr21517236wmf.92.1566218868899; 
 Mon, 19 Aug 2019 05:47:48 -0700 (PDT)
Received: from [192.168.1.39] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id j20sm35269873wre.65.2019.08.19.05.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2019 05:47:48 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20190817101931.28386-1-thuth@redhat.com>
 <20190817101931.28386-8-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <68d2669d-9a67-f197-939b-dc038f0118ba@redhat.com>
Date: Mon, 19 Aug 2019 14:47:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190817101931.28386-8-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 7/8] hw/misc: Add a config switch for the
 "unimplemented" device
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
Cc: qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tacTQwqGBqs7

On 8/17/19 12:19 PM, Thomas Huth wrote:
> The device is only used by some few boards. Let's use a proper Kconfig
> switch so that we only compile this code if we really need it.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
>  hw/arm/Kconfig        | 11 +++++++++++
>  hw/microblaze/Kconfig |  1 +
>  hw/misc/Kconfig       |  3 +++
>  hw/misc/Makefile.objs |  2 +-
>  hw/sparc64/Kconfig    |  1 +
>  5 files changed, 17 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 6e24c73b54..76a2a6bcbf 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -82,6 +82,7 @@ config MUSCA
>      select PL011
>      select PL031
>      select SPLIT_IRQ
> +    select UNIMP
> =20
>  config MUSICPAL
>      bool
> @@ -217,6 +218,7 @@ config STELLARIS
>      select SSI_SD
>      select STELLARIS_INPUT
>      select STELLARIS_ENET # ethernet
> +    select UNIMP
> =20
>  config STRONGARM
>      bool
> @@ -283,6 +285,7 @@ config ALLWINNER_A10
>      select ALLWINNER_A10_PIC
>      select ALLWINNER_EMAC
>      select SERIAL
> +    select UNIMP
> =20
>  config RASPI
>      bool
> @@ -320,6 +323,7 @@ config XLNX_VERSAL
>      select PL011
>      select CADENCE
>      select VIRTIO_MMIO
> +    select UNIMP
> =20
>  config FSL_IMX25
>      bool
> @@ -355,6 +359,7 @@ config ASPEED_SOC
>      select SSI_M25P80
>      select TMP105
>      select TMP421
> +    select UNIMP
> =20
>  config MPS2
>      bool
> @@ -366,6 +371,7 @@ config MPS2
>      select PL022    # Serial port
>      select PL080    # DMA controller
>      select SPLIT_IRQ
> +    select UNIMP
> =20
>  config FSL_IMX7
>      bool
> @@ -378,6 +384,7 @@ config FSL_IMX7
>      select IMX_I2C
>      select PCI_EXPRESS_DESIGNWARE
>      select SDHCI
> +    select UNIMP
> =20
>  config ARM_SMMUV3
>      bool
> @@ -389,6 +396,7 @@ config FSL_IMX6UL
>      select IMX_FEC
>      select IMX_I2C
>      select SDHCI
> +    select UNIMP
> =20
>  config MICROBIT
>      bool
> @@ -398,6 +406,7 @@ config NRF51_SOC
>      bool
>      select I2C
>      select ARM_V7M
> +    select UNIMP
> =20
>  config EMCRAFT_SF2
>      bool
> @@ -410,6 +419,7 @@ config MSF2
>      select PTIMER
>      select SERIAL
>      select SSI
> +    select UNIMP
> =20
>  config ZAURUS
>      bool
> @@ -448,6 +458,7 @@ config ARMSSE
>      select TZ_MPC
>      select TZ_MSC
>      select TZ_PPC
> +    select UNIMP
> =20
>  config ARMSSE_CPUID
>      bool
> diff --git a/hw/microblaze/Kconfig b/hw/microblaze/Kconfig
> index c4dc120973..e2697ced9c 100644
> --- a/hw/microblaze/Kconfig
> +++ b/hw/microblaze/Kconfig
> @@ -4,6 +4,7 @@ config PETALOGIX_S3ADSP1800
>      select XILINX
>      select XILINX_AXI
>      select XILINX_ETHLITE
> +    select UNIMP
> =20
>  config PETALOGIX_ML605
>      bool
> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index 385e1b0cec..51754bb47c 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -117,4 +117,7 @@ config AUX
>      bool
>      select I2C
> =20
> +config UNIMP
> +    bool
> +
>  source macio/Kconfig
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index e9aab519a1..e4aad707fb 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -9,7 +9,7 @@ common-obj-$(CONFIG_PCI_TESTDEV) +=3D pci-testdev.o
>  common-obj-$(CONFIG_EDU) +=3D edu.o
>  common-obj-$(CONFIG_PCA9552) +=3D pca9552.o
> =20
> -common-obj-y +=3D unimp.o
> +common-obj-$(CONFIG_UNIMP) +=3D unimp.o
>  common-obj-$(CONFIG_FW_CFG_DMA) +=3D vmcoreinfo.o
> =20
>  # ARM devices
> diff --git a/hw/sparc64/Kconfig b/hw/sparc64/Kconfig
> index d4d76a89be..f9f8b0f73a 100644
> --- a/hw/sparc64/Kconfig
> +++ b/hw/sparc64/Kconfig
> @@ -17,3 +17,4 @@ config NIAGARA
>      bool
>      select EMPTY_SLOT
>      select SUN4V_RTC
> +    select UNIMP
>=20
