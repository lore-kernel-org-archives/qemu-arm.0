Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1953054wrx;
        Thu, 25 Apr 2019 08:53:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw72pP6bfjN93IM8si/OleabwEYCmasUvBz4EOp7/S1gs6j8rlprtVz0UYNf0oKwYouY8k/
X-Received: by 2002:adf:dd85:: with SMTP id x5mr239258wrl.172.1556207624780;
        Thu, 25 Apr 2019 08:53:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556207624; cv=none;
        d=google.com; s=arc-20160816;
        b=vTTFrsvNuFLjBmCHEFGsGaSvOP7cT6UcItjanNMCLC6WDEG9Pud/VYHnSKO1YG3vFf
         xsfIK+l3FfjdOM7qUpm8ZtqiWVnaipTibNIX87A2gUjNYys4WkIqiHI6McWylNSoIeN6
         mes6mOHvVCVwLyVgog1zzOdrv2sHJktSP6oWFzKT840+ycpCADlZ4v2pGUagSFJnZp3d
         qMhUwXpn3fLwhEtgAxq6SH3B7aZJge6K7Uy+7n7JQ5gYq8bswDI1dIkExTdUGlZaFCDS
         1nefXJ61rmrODggIUasRKNKN9Ro+TdxNLswEAwNY9BGdalaPKHqxqHTxQz3JK7ZtBFjQ
         lNkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=yE8k0+31sTN30zo+DkawuBrPvUnsBCgNFhrlkCG9Czs=;
        b=pS7mZVnGI5jpUIG4dsduZVzMGRpkobGcwlGjofP6IK7rOX9VSoNF5IqUYb1+EJi0x1
         Vd6pC20HrkQGmqzRNoL34opBRlxHrP8LCkS4bqI2LOUh0QD9iFmQIOpyFA81QGTxP3uq
         4G6WTPNSi6ztp5HNLZHdP9jG8oT7XehDROPaVGThsNria2GyST9ul6/K6TKCGzmDAFad
         7P5jDSas+7lb8jn8GeILDe8pIRN2JtQK+CCrXyh3IEmaAlxJwoLunRd6QueqrZDHgzaH
         Jc3gOow2utRT8gTWH/m6OMFCas6MAxgjwf8nJoD5o9TSKnv2CLk5lMlCn4p1btitXC3q
         lb6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5si15291262wmh.184.2019.04.25.08.53.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Apr 2019 08:53:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59539 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJggx-0002tA-SG
	for alex.bennee@linaro.org; Thu, 25 Apr 2019 11:53:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJggm-0002su-7T
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 11:53:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJggl-000589-75
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 11:53:32 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37101)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hJggl-000576-14
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 11:53:31 -0400
Received: by mail-wr1-f68.google.com with SMTP id r6so146056wrm.4
	for <qemu-arm@nongnu.org>; Thu, 25 Apr 2019 08:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=yE8k0+31sTN30zo+DkawuBrPvUnsBCgNFhrlkCG9Czs=;
	b=UaKLZh19UENMGdHFT2RS6874Vtx3vX0I7iCT5CBkvCIKFeposhxmVx8VB3k+s/ddm0
	aPnab4Z+uehagIicl7KC1s16aC4Bi3dfXrJR/bbCwKbfG/KWvz7hgQXEeYLecGXmyAIr
	t3LuHEguptyWSi2cLbjY6uGvJUmYs5G51DdUU5EnGkvxmoxg0umLwtSdVYLsWXwnNfGV
	8wwx+S0Hn6iEoA4KE63UROcLKFP1+6uJyu51PKMkQXBuefVYSDjf1FmjuRCTQQ7i94wz
	n2ZD2M+gt1w5/m2dxkHy2VVL/NLa3WgC2EyWN3081ZzhX2iCVODFTkyMZ3xBdcRBxQT3
	p6+g==
X-Gm-Message-State: APjAAAURCQYJG74ic96flYiQA3hW2kcdzZgzV+/w2fTs3rPa4KH4FV5N
	Eah9VKooHE+qfXFADNANYX41MA==
X-Received: by 2002:a5d:464f:: with SMTP id j15mr4761590wrs.265.1556207609905; 
	Thu, 25 Apr 2019 08:53:29 -0700 (PDT)
Received: from [192.168.1.25] (abayonne-654-1-209-122.w109-222.abo.wanadoo.fr.
	[109.222.216.122])
	by smtp.gmail.com with ESMTPSA id q3sm498080wre.31.2019.04.25.08.53.27
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 08:53:29 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, yang.zhong@intel.com,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	pbonzini@redhat.com
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-17-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <98855a34-ff5a-896f-7959-480b89d62833@redhat.com>
Date: Thu, 25 Apr 2019 17:53:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418180057.3593-17-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-QEMU-4.1 v5 16/29] hw/arm:
 Express dependencies of the virt machine with Kconfig
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
Cc: Rob Herring <robh@kernel.org>, Jan Kiszka <jan.kiszka@web.de>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-block@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Philippe Mathieu-Daude <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Beniamino Galvani <b.galvani@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
	Cedric Le Goater <clg@kaod.org>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>, Gerd Hoffmann <kraxel@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	John Snow <jsnow@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B3ejKFfB29ID

Hi Thomas,

On 4/18/19 8:00 PM, Thomas Huth wrote:
> Dependencies have been determined by looking at hw/arm/virt.c
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  default-configs/arm-softmmu.mak | 11 +----------
>  hw/arm/Kconfig                  | 19 +++++++++++++++++++
>  hw/arm/Makefile.objs            |  3 ++-
>  3 files changed, 22 insertions(+), 11 deletions(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 2580584281..f440a2b1cd 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -6,6 +6,7 @@ CONFIG_ARM_V7M=y
>  # CONFIG_PCI_DEVICES=n
>  # CONFIG_TEST_DEVICES=n
>  
> +CONFIG_ARM_VIRT=y
>  CONFIG_EXYNOS4=y
>  CONFIG_HIGHBANK=y
>  CONFIG_INTEGRATOR=y
> @@ -32,8 +33,6 @@ CONFIG_VGA=y
>  CONFIG_SSI_M25P80=y
>  CONFIG_ALLWINNER_EMAC=y
>  CONFIG_IMX_FEC=y
> -CONFIG_PLATFORM_BUS=y
> -CONFIG_VIRTIO_MMIO=y
>  
>  CONFIG_NETDUINO2=y
>  
> @@ -68,9 +67,6 @@ CONFIG_IOTKIT_SYSINFO=y
>  CONFIG_ARMSSE_CPUID=y
>  CONFIG_ARMSSE_MHU=y
>  
> -CONFIG_PCI_EXPRESS=y
> -CONFIG_PCI_EXPRESS_GENERIC_BRIDGE=y
> -
>  CONFIG_ALLWINNER_A10_PIT=y
>  CONFIG_ALLWINNER_A10_PIC=y
>  CONFIG_ALLWINNER_A10=y
> @@ -86,10 +82,5 @@ CONFIG_PCIE_PORT=y
>  CONFIG_XIO3130=y
>  CONFIG_IOH3420=y
>  CONFIG_I82801B11=y
> -CONFIG_ACPI=y
> -CONFIG_ARM_VIRT=y
> -CONFIG_SMBIOS=y
> -CONFIG_GPIO_KEY=y
>  CONFIG_MSF2=y
> -CONFIG_FW_CFG_DMA=y
>  CONFIG_PCI_EXPRESS_DESIGNWARE=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index abeaa54d88..4d0febf644 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -1,6 +1,24 @@
>  config ARM_VIRT
>      bool
> +    imply PCI_DEVICES

Without -nodefaults I get:
qemu-system-aarch64: Unsupported NIC model: virtio-net-pci
This is expected.

> +    imply TEST_DEVICES
> +    imply VFIO_AMD_XGBE
>      imply VFIO_PLATFORM
> +    imply VFIO_XGMAC
> +    select A15MPCORE
> +    select ACPI
> +    select ARM_SMMUV3

You forgot to remove ARM_SMMUV3 from default-configs/aarch64-softmmu.mak.

With it removed:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +    select GPIO_KEY
> +    select FW_CFG_DMA
> +    select PCI_EXPRESS
> +    select PCI_EXPRESS_GENERIC_BRIDGE
> +    select PFLASH_CFI01
> +    select PL011 # UART
> +    select PL031 # RTC
> +    select PL061 # GPIO
> +    select PLATFORM_BUS
> +    select SMBIOS
> +    select VIRTIO_MMIO
>  
>  config CHEETAH
>      bool
> @@ -298,6 +316,7 @@ config A9MPCORE
>  
>  config A15MPCORE
>      bool
> +    select ARM_GIC
>  
>  config ARM11MPCORE
>      bool
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index 729e711b87..4f591ca487 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -1,4 +1,5 @@
> -obj-y += boot.o sysbus-fdt.o
> +obj-y += boot.o
> +obj-$(CONFIG_PLATFORM_BUS) += sysbus-fdt.o
>  obj-$(CONFIG_ARM_VIRT) += virt.o
>  obj-$(CONFIG_ACPI) += virt-acpi-build.o
>  obj-$(CONFIG_DIGIC) += digic_boards.o
> 
