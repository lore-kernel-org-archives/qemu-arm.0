Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2317899wrx;
        Thu, 25 Apr 2019 15:29:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyqGM0UUtJDQPb2A0Tw//z5/2njpeSCHuVf1SnkIGTox9PaPRmgrb/tiiTbpXuEqb/WQYVF
X-Received: by 2002:adf:fb0d:: with SMTP id c13mr9002761wrr.214.1556231353014;
        Thu, 25 Apr 2019 15:29:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556231353; cv=none;
        d=google.com; s=arc-20160816;
        b=0hcyRGHQQo+yGRMksfY/Ztsp52JJN8eQtE6OZRMQAv8Cf6fGjQNdv5JciF0bwxGXA1
         O7ltEXZuOKG2oSeldDqLjhPSyJFH2mUegCLzCM6qtFOeknqo850IQRkV69BzdXhnvGN6
         JZ3ITfCk6OeO4/upxM4R8YPonSqnPt3xBOF/M5UAmfNyCKsMPEwT5yvgxw9Wv0FqAx5N
         ftiGRN+WKbXMvAWmt1UH9UNC0wzDSqD2jp7aW14vHh0ZI1HUrJSQU6/6WCA5dOmAtiL7
         0tOuy+J6b6ymp5ZwFIJPy6T6dzIvF0pnas+nKtlGZHBUtBlkIEZ8IvANToM3aoFCrgS4
         CxpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=adqeGRAsm14PQTyQrSQDD9dhgBBzsn8SzlhgDPoecac=;
        b=yMUR6XE1iTMXbBsd7keyAmqxOH3bvUfOYEsbWqIyDaZygY/GwuR9hwX/CxaIyPf1e1
         pAfB79oci4tXcJo6vlSfLi0Az1a0np9I13WFA6GRXgiVesPucLndS47/LGRof564ASWO
         DvaX2VHjMysW9orFem5deoqfAQBYaPik7vylgqM6Z+TLACpzzAKIGRWctr0sK930gJTZ
         J1kLFYq2nj/xJG4HI8shXD26/M9Braag1ZnHQvtkgmHGda0wQy6DggEgTKFSTyduHqQ/
         XXEetpDPR5nr5WuNXNWKpBJRBzr2W6wlZT4JAU6lOr4C2lzFHQtzA33okniSYCOIB6js
         MIzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n130si1703463wmb.45.2019.04.25.15.29.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Apr 2019 15:29:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35936 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJmrg-00071I-1N
	for alex.bennee@linaro.org; Thu, 25 Apr 2019 18:29:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38440)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJmr5-0006We-Tj
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 18:28:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJmr4-0001Zw-Jf
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 18:28:35 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39404)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hJmr4-0001ZI-9B
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 18:28:34 -0400
Received: by mail-wr1-f67.google.com with SMTP id a9so1560956wrp.6
	for <qemu-arm@nongnu.org>; Thu, 25 Apr 2019 15:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=adqeGRAsm14PQTyQrSQDD9dhgBBzsn8SzlhgDPoecac=;
	b=uOdG4ZPSARZYShhyaMZATxyN0VaVrD1LEnvfK4/Auu0l9wQ7aL53dFhZ5BykxoU+8L
	s99tADMMDno3WdNMSzioIsfT0Q6Th5ZeuMwGzlpdWUhigPiMma76/nO/pP+nJ6mFySxu
	iIWsDMN1SbBufStwL9TN/TnwncOrHDUG+k6JOCFXnxai3oynwTnCOjBQzwKs+01BZDMS
	DojAm+x3006pvgfpWMpwiEA1XcwNGgNJTkyde+xtMKfGfMVMcb+KEizUTFtyeO5rrsK9
	ZDpqbDDKTABy6xL0hzcuhNBnGDoEVb6tW00FtIKXviYuLQYqt5m9DwMRkxUtMxUaCGqb
	Eg2w==
X-Gm-Message-State: APjAAAUh9z8uuQQx8sFs54U0t1OLweg+iSfAzxTqM+OxuTFU9xMYAS0v
	IUvFE+wmeSnv60cPuYJdjvKqHQ==
X-Received: by 2002:adf:c653:: with SMTP id u19mr3640824wrg.267.1556231312695; 
	Thu, 25 Apr 2019 15:28:32 -0700 (PDT)
Received: from [192.168.1.25] (abayonne-654-1-209-122.w109-222.abo.wanadoo.fr.
	[109.222.216.122]) by smtp.gmail.com with ESMTPSA id
	y133sm26473877wmd.2.2019.04.25.15.28.27
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 15:28:31 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, yang.zhong@intel.com,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	pbonzini@redhat.com
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-12-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <3c5f82ed-5284-2a57-5c25-c3bc3d329e3a@redhat.com>
Date: Fri, 26 Apr 2019 00:28:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418180057.3593-12-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-QEMU-4.1 v5 11/29] hw/arm:
 Express dependencies of realview, versatile and vexpress with Kconfig
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
X-TUID: JFVIS3mjtQIp

Hi Thomas,

On 4/18/19 8:00 PM, Thomas Huth wrote:
> This patch is slightly based on earlier work by Ákos Kovács (i.e.
> his "hw/arm/Kconfig: Add ARM Kconfig" patch).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  default-configs/arm-softmmu.mak | 24 ++++-------------
>  hw/arm/Kconfig                  | 48 +++++++++++++++++++++++++++++++++
>  hw/arm/Makefile.objs            |  3 ++-
>  hw/display/Kconfig              |  1 +
>  hw/i2c/Kconfig                  |  2 +-
>  5 files changed, 57 insertions(+), 21 deletions(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 3f82d635e4..df7d9421e0 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -3,9 +3,8 @@
>  # TODO: ARM_V7M is currently always required - make this more flexible!
>  CONFIG_ARM_V7M=y
>  
> -CONFIG_PCI=y
> -CONFIG_PCI_DEVICES=y
> -CONFIG_PCI_TESTDEV=y
> +# CONFIG_PCI_DEVICES=n
> +# CONFIG_TEST_DEVICES=n
>  
>  CONFIG_EXYNOS4=y
>  CONFIG_HIGHBANK=y
> @@ -17,6 +16,9 @@ CONFIG_CHEETAH=y
>  CONFIG_SX1=y
>  CONFIG_NSERIES=y
>  CONFIG_STELLARIS=y
> +CONFIG_REALVIEW=y
> +CONFIG_VERSATILE=y
> +CONFIG_VEXPRESS=y
>  
>  CONFIG_VGA=y
>  CONFIG_NAND=y
> @@ -25,8 +27,6 @@ CONFIG_SERIAL=y
>  CONFIG_MAX7310=y
>  CONFIG_TMP421=y
>  CONFIG_PCA9552=y
> -CONFIG_DDC=y
> -CONFIG_SII9022=y
>  CONFIG_ADS7846=y
>  CONFIG_MAX111X=y
>  CONFIG_SSI_M25P80=y
> @@ -38,13 +38,8 @@ CONFIG_MICRODRIVE=y
>  CONFIG_PLATFORM_BUS=y
>  CONFIG_VIRTIO_MMIO=y
>  
> -CONFIG_ARM11MPCORE=y
> -
>  CONFIG_NETDUINO2=y
>  
> -CONFIG_PL041=y
> -CONFIG_PL080=y
> -CONFIG_PL190=y
>  CONFIG_PL330=y
>  CONFIG_CADENCE=y
>  CONFIG_PXA2XX=y
> @@ -52,12 +47,10 @@ CONFIG_FRAMEBUFFER=y
>  CONFIG_XILINX_SPIPS=y
>  CONFIG_ZYNQ_DEVCFG=y
>  
> -CONFIG_ARM11SCU=y
>  CONFIG_DIGIC=y
>  CONFIG_MAINSTONE=y
>  CONFIG_MPS2=y
>  CONFIG_RASPI=y
> -CONFIG_REALVIEW=y
>  CONFIG_ZAURUS=y
>  CONFIG_ZYNQ=y
>  CONFIG_STM32F2XX_TIMER=y
> @@ -86,10 +79,6 @@ CONFIG_IOTKIT_SYSINFO=y
>  CONFIG_ARMSSE_CPUID=y
>  CONFIG_ARMSSE_MHU=y
>  
> -CONFIG_VERSATILE=y
> -CONFIG_VERSATILE_PCI=y
> -CONFIG_VERSATILE_I2C=y
> -
>  CONFIG_PCI_EXPRESS=y
>  CONFIG_PCI_EXPRESS_GENERIC_BRIDGE=y
>  
> @@ -120,6 +109,3 @@ CONFIG_XILINX_AXI=y
>  CONFIG_PCI_EXPRESS_DESIGNWARE=y
>  
>  CONFIG_STRONGARM=y
> -
> -# for realview and versatilepb
> -CONFIG_LSI_SCSI_PCI=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index b91503f5a6..b786cfc5bd 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -88,6 +88,30 @@ config PXA2XX
>  
>  config REALVIEW
>      bool
> +    imply PCI_DEVICES
> +    imply PCI_TESTDEV
> +    select SMC91C111
> +    select LAN9118
> +    select A9MPCORE
> +    select A15MPCORE
> +    select ARM11MPCORE
> +    select ARM_TIMER
> +    select VERSATILE_PCI

REALVIEW selects VERSATILE_PCI/I2C ...

> +    select WM8750 # audio codec
> +    select LSI_SCSI_PCI
> +    select PCI
> +    select PL011  # UART
> +    select PL031  # RTC
> +    select PL041  # audio codec
> +    select PL050  # keyboard/mouse
> +    select PL061  # GPIO
> +    select PL080  # DMA controller
> +    select PL110
> +    select PL181  # display
> +    select PL310  # cache controller
> +    select VERSATILE_I2C
> +    select DS1338 # I2C RTC+NVRAM
> +    select USB_OHCI
>  
>  config STELLARIS
>      bool
> @@ -111,6 +135,29 @@ config SX1
>  
>  config VERSATILE
>      bool
> +    select ARM_TIMER # sp804
> +    select PFLASH_CFI01
> +    select LSI_SCSI_PCI
> +    select PL050  # keyboard/mouse
> +    select PL080  # DMA controller
> +    select PL190  # Vector PIC
> +    select REALVIEW

VERSATILE selects REALVIEW...

> +    select USB_OHCI
> +
> +config VEXPRESS
> +    bool
> +    select A9MPCORE
> +    select A15MPCORE
> +    select ARM_MPTIMER
> +    select ARM_TIMER # sp804
> +    select LAN9118
> +    select PFLASH_CFI01
> +    select PL011 # UART
> +    select PL041 # audio codec
> +    select PL181  # display
> +    select REALVIEW

Ditto.

I'd prefer to have a clearer boards/soc separation,
but this works, so we can improve this later:

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +    select SII9022
> +    select VIRTIO_MMIO
>  
>  config ZYNQ
>      bool
> @@ -183,6 +230,7 @@ config A15MPCORE
>  
>  config ARM11MPCORE
>      bool
> +    select ARM11SCU
>  
>  config ARMSSE
>      bool
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index 8302b8df1d..bd0b45a799 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -15,7 +15,8 @@ obj-$(CONFIG_PXA2XX) += gumstix.o spitz.o tosa.o z2.o
>  obj-$(CONFIG_REALVIEW) += realview.o
>  obj-$(CONFIG_STELLARIS) += stellaris.o
>  obj-$(CONFIG_STRONGARM) += collie.o
> -obj-$(CONFIG_VERSATILE) += vexpress.o versatilepb.o
> +obj-$(CONFIG_VERSATILE) += versatilepb.o
> +obj-$(CONFIG_VEXPRESS) += vexpress.o
>  obj-$(CONFIG_ZYNQ) += xilinx_zynq.o
>  
>  obj-$(CONFIG_ARM_V7M) += armv7m.o
> diff --git a/hw/display/Kconfig b/hw/display/Kconfig
> index a11815c9af..0577e68c8e 100644
> --- a/hw/display/Kconfig
> +++ b/hw/display/Kconfig
> @@ -26,6 +26,7 @@ config PL110
>  config SII9022
>      bool
>      depends on I2C
> +    select DDC
>  
>  config SSD0303
>      bool
> diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
> index 820b24de5b..aee961541c 100644
> --- a/hw/i2c/Kconfig
> +++ b/hw/i2c/Kconfig
> @@ -12,7 +12,7 @@ config DDC
>  
>  config VERSATILE_I2C
>      bool
> -    select I2C
> +    select BITBANG_I2C
>  
>  config ACPI_SMBUS
>      bool
> 
