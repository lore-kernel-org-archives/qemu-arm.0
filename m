Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2327745wrx;
        Thu, 25 Apr 2019 15:42:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzXkEhlkSA8WA78CsggZf7sfL9ZiUN/YBoMlHOMX8L1VmQU+UiJTa/l7fmAATW0W63ijCuH
X-Received: by 2002:a1c:2350:: with SMTP id j77mr199959wmj.84.1556232137549;
        Thu, 25 Apr 2019 15:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556232137; cv=none;
        d=google.com; s=arc-20160816;
        b=m45wVredouM08pQhOgoTEq7ijR5h8CeYHi5kN/gOMRSua9h5/IlbznS5RdFWKDGzES
         v9Acg/AdLiERZnkmE+cpqprDIzriT6gzJvSTSy2EInlpJRPs2MkNQ/oUebccb0AC8wjQ
         M9foQFewlVVBiB5NKXnxzUKEAEiDzA0tlIUXY4zzGVHcDmKrTezxynF3LyvOtOMI6d7K
         +klOxJ3tSfW+qqMhwJ6amdPC59S+nzVly9eoAl1PAzGG7Hl9nnJkyf0pxmSNEXDM1+RQ
         nVPDqFzNLv08FvNilmpo4t2vtcgJ5qzk512melCk/1pF6WCGz3DlZS5YSk8PLOfii059
         Vjqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=UMRq6Kgq2Fs2feHmGWOIYxc3gT5WsGrRPdqv5gXddo4=;
        b=WueV6UskrLW9OvI1NmOx+4Mt6gPGb8Uect6RSb2hCVVIW7CeJLc3GUzfVBozSpu2UA
         JKIdb5CBLgYQyY9mm1q1jjwk8w1jVai7OE6szKJJvDsCW6106lzi1GbDsHjfuGxF3gEV
         eZ505uAZwA4CdG8fctchyEyPBeQlDJXqpru7KP4EJp4BNWHz7P/iNs9OkMvq65DE56Hb
         fgaqAUsNYYu6LPwsb4qkiu07uzjBCz994OBedYQ66OJZYnpQcLwOjdYbO6pgqqh3PtKI
         McrtWGqMaojMLcxmdiv/+wW5rsbBcFDrrW3MoWlGnxCkznuqFV1ASKvv9pwgAl6y0915
         5OEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s129si6333542wme.173.2019.04.25.15.42.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Apr 2019 15:42:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:36107 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJn4H-0003oQ-HZ
	for alex.bennee@linaro.org; Thu, 25 Apr 2019 18:42:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJn41-0003nP-Fr
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 18:41:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJn40-0007Ct-Bx
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 18:41:57 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37047)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hJn40-0007AA-4H
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 18:41:56 -0400
Received: by mail-wr1-f66.google.com with SMTP id r6so1611857wrm.4
	for <qemu-arm@nongnu.org>; Thu, 25 Apr 2019 15:41:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=UMRq6Kgq2Fs2feHmGWOIYxc3gT5WsGrRPdqv5gXddo4=;
	b=HfVEyaJGmjZBxs3saZCEcT8yF9XyUSPZkMDl1FGfv/Zh5Ck49yw4K846IkPEynTwF5
	94lWzgXrzSKTuJw28Cr3dYbnMksf1ZxMs1a5FOEnn29cHgGH+4fWrSkOcEu+v8Z6v2N+
	BwEogx8otYAPX86MzStMmw8Zynhs0cqGk0aT2E4KRn8Cde+PVW4mA4SwdZEc9XdHdxTe
	Ar9I8uyM4SeIFMg89sK1p5TpWK3v6Z7r58hjA9+Z2Stwxk8Bwk9yr5yaVl8Ityv/ljf6
	DdfUnFRDZSu8rliL9V+sqFasRJ8djzRXWXHiyA9PSZPJarurFhxBH3knuVdPx7onehFs
	Cnfw==
X-Gm-Message-State: APjAAAXIdSG7Ka9FZIHGXmcAu+e0KY4mjnrGtyKr+KU6e3CvreZyLO8v
	SW0oEIvKFmRiYZbjS5I9dajQSA==
X-Received: by 2002:adf:9f14:: with SMTP id l20mr27233961wrf.240.1556232114828;
	Thu, 25 Apr 2019 15:41:54 -0700 (PDT)
Received: from [192.168.1.25] (abayonne-654-1-209-122.w109-222.abo.wanadoo.fr.
	[109.222.216.122]) by smtp.gmail.com with ESMTPSA id
	x84sm28678664wmg.13.2019.04.25.15.41.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 15:41:54 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, yang.zhong@intel.com,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	pbonzini@redhat.com
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-10-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <039c6aea-ed08-02c4-7cad-f721c79a259d@redhat.com>
Date: Fri, 26 Apr 2019 00:41:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418180057.3593-10-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-QEMU-4.1 v5 09/29] hw/arm:
 Express dependencies of the OMAP machines with Kconfig
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
X-TUID: 7t347ibkbjZO

On 4/18/19 8:00 PM, Thomas Huth wrote:
> Add Kconfig dependencies for the OMAP machines (cheetah, n800, n810,
> sx1 and sx1-v1).
> This patch is slightly based on earlier work by Ákos Kovács (i.e.
> his "hw/arm/Kconfig: Add ARM Kconfig" patch).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  default-configs/arm-softmmu.mak | 17 ++++-------------
>  hw/arm/Kconfig                  | 25 +++++++++++++++++++++++++
>  hw/arm/Makefile.objs            |  3 ++-
>  3 files changed, 31 insertions(+), 14 deletions(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 0a4d293f8a..b7ed3c530b 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -12,16 +12,16 @@ CONFIG_HIGHBANK=y
>  CONFIG_INTEGRATOR=y
>  CONFIG_FSL_IMX31=y
>  CONFIG_MUSICPAL=y
> +CONFIG_MUSCA=y
> +CONFIG_CHEETAH=y

I can't find a working Cheetah option rom, but could test some asm.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +CONFIG_SX1=y
> +CONFIG_NSERIES=y
>  
>  CONFIG_VGA=y
>  CONFIG_NAND=y
>  CONFIG_ECC=y
>  CONFIG_SERIAL=y
>  CONFIG_MAX7310=y
> -CONFIG_TWL92230=y
> -CONFIG_TSC2005=y
> -CONFIG_LM832X=y
> -CONFIG_TMP105=y
>  CONFIG_TMP421=y
>  CONFIG_PCA9552=y
>  CONFIG_STELLARIS=y
> @@ -39,9 +39,7 @@ CONFIG_ALLWINNER_EMAC=y
>  CONFIG_IMX_FEC=y
>  CONFIG_FTGMAC100=y
>  CONFIG_DS1338=y
> -CONFIG_PFLASH_CFI01=y
>  CONFIG_MICRODRIVE=y
> -CONFIG_USB_MUSB=y
>  CONFIG_PLATFORM_BUS=y
>  CONFIG_VIRTIO_MMIO=y
>  
> @@ -61,15 +59,8 @@ CONFIG_ZYNQ_DEVCFG=y
>  
>  CONFIG_ARM11SCU=y
>  CONFIG_DIGIC=y
> -CONFIG_OMAP=y
> -CONFIG_TSC210X=y
> -CONFIG_BLIZZARD=y
> -CONFIG_ONENAND=y
> -CONFIG_TUSB6010=y
>  CONFIG_MAINSTONE=y
>  CONFIG_MPS2=y
> -CONFIG_MUSCA=y
> -CONFIG_NSERIES=y
>  CONFIG_RASPI=y
>  CONFIG_REALVIEW=y
>  CONFIG_ZAURUS=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index b9f3c3c232..71126254ff 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -2,6 +2,11 @@ config ARM_VIRT
>      bool
>      imply VFIO_PLATFORM
>  
> +config CHEETAH
> +    bool
> +    select OMAP
> +    select TSC210X
> +
>  config DIGIC
>      bool
>      select PTIMER
> @@ -58,9 +63,25 @@ config NETDUINO2
>  
>  config NSERIES
>      bool
> +    select OMAP
> +    select TMP105   # tempature sensor
> +    select BLIZZARD # LCD/TV controller
> +    select ONENAND
> +    select TSC210X  # touchscreen/sensors/audio
> +    select TSC2005  # touchscreen/sensors/keypad
> +    select LM832X   # GPIO keyboard chip
> +    select TWL92230 # energy-management
> +    select TUSB6010
>  
>  config OMAP
>      bool
> +    select FRAMEBUFFER
> +    select I2C
> +    select ECC
> +    select NAND
> +    select PFLASH_CFI01
> +    select SD
> +    select SERIAL
>  
>  config PXA2XX
>      bool
> @@ -74,6 +95,10 @@ config STELLARIS
>  config STRONGARM
>      bool
>  
> +config SX1
> +    bool
> +    select OMAP
> +
>  config VERSATILE
>      bool
>  
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index fa57c7c770..8302b8df1d 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -9,7 +9,8 @@ obj-$(CONFIG_MAINSTONE) += mainstone.o
>  obj-$(CONFIG_MUSICPAL) += musicpal.o
>  obj-$(CONFIG_NETDUINO2) += netduino2.o
>  obj-$(CONFIG_NSERIES) += nseries.o
> -obj-$(CONFIG_OMAP) += omap_sx1.o palm.o
> +obj-$(CONFIG_SX1) += omap_sx1.o
> +obj-$(CONFIG_CHEETAH) += palm.o
>  obj-$(CONFIG_PXA2XX) += gumstix.o spitz.o tosa.o z2.o
>  obj-$(CONFIG_REALVIEW) += realview.o
>  obj-$(CONFIG_STELLARIS) += stellaris.o
> 
