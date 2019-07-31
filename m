Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5562939wrv;
        Wed, 31 Jul 2019 04:47:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxI7ap5JJ0rz7qb8pYDQ+HW+ln7S9RdH5lP4juyF6+aqU7109nTABrTBr5MkGXQp7fQ7KF5
X-Received: by 2002:a05:6214:1312:: with SMTP id a18mr86961923qvv.241.1564573678356;
        Wed, 31 Jul 2019 04:47:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564573678; cv=none;
        d=google.com; s=arc-20160816;
        b=cJ61HdPah/dtaOqM0CdnUnpf5ai/OhbhZK9E/WlafOWnJCLMNQ/dH1uTRYG/8xlXcZ
         mBHdmGaHrDTGMVzI7Bari2Pr3yyRu+WFvPYazLvuFa6zEVLTDJNpH/jCzkJurzGIR742
         mD34jM+GvvegdYbGIjpHHciHh4TzELXUJTbznnomMainueD6F/ecmpWOcqiRtuWIQ4/p
         zsqWIZch3RF7duH68/xQpkHHImjvQNhjH9q6q4x0xl0AvSi5uni5MBvK6fhHEr3Tb4OO
         ePF9JyJhrdse1hbJI09GzhIs3dvNm3TQbGLC3/gZHpyGgGK3co7GkZDnlgDeMl9pIvoM
         nV7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=R9J6plVPUd6c13V9HHPE90GzLTaBy1CZelJrNwUq+LM=;
        b=CoeqzPtKufrHYFn+KGRebntYl9hKuyD/YItDDVhE8aZHHDdxTZXY1hxMrQbJwrsaf8
         BVHf8U8hVJ3OMGKfvZAkc5MZzT0OjPL9ZTRMCXv/uQZw5VtdRKK5yOT/ripyJppWk4yc
         ZT33UoQeKtaU5+AZOwhTte3/9gSQUkdnE/EU+h86e8XA8+In3A8FyNUrkZXTsaEOCj6B
         L62+21nXHNloeJuavr3lNwASKBFleNKkx7zHAqsqyYrfJy4HAOPJ1+hYt1Beq4JlgzMQ
         sgCh/ameSeuNQnOMmjSUPpQ9T2scyI1eJze8EUlQlOzAKfE1jdHfCEqz91MQdnZ+6YR7
         ecIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r21si8052477qte.212.2019.07.31.04.47.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2019 04:47:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsn5J-0001kz-Ve
	for alex.bennee@linaro.org; Wed, 31 Jul 2019 07:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49515)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hsn5E-0001kO-8Z
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 07:47:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hsn5D-0007y8-4m
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 07:47:52 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50831)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hsn5C-0007wh-Un
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 07:47:51 -0400
Received: by mail-wm1-f66.google.com with SMTP id v15so60515008wml.0
 for <qemu-arm@nongnu.org>; Wed, 31 Jul 2019 04:47:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R9J6plVPUd6c13V9HHPE90GzLTaBy1CZelJrNwUq+LM=;
 b=ITCBHCzpAEUJ6ahrMUqCMpZHTmAoZ+8BHlrGhWCTVX/+uHoJY7NawfBVi9UWUYUvZz
 5t2k3fzSs3/Tqt0jQx7gF+TFcGRtXoM0BEnKR8+fRJL2+ubfPtMePrSy1iL2XIJYGNNH
 /cwXzKBsxX+ZlEG//S2MH1euvur8gq75gJinr3U5jiOzzBQVV3jtgN5XJhLHKk7Lvpe2
 YGOHtPd/RY3nLzJhZYJQy7IR0XAgow0ZTbdnSEmvHFBi1i2HN57ljD/C0zxtOOHpmbtu
 Xbv6gK8QcV0e7dKt9CVTMH7nZvKaNbBLIU+yhzCOKfI99/wW0zBMH0GBdU2d/hINzw+d
 XAnw==
X-Gm-Message-State: APjAAAXsQYUQkyNiKRUb/h9QD2w54Y3ZFR1rQfPgHNtfmTDwW8tbzPfa
 Jk+SbEOCTXcuY6CgkFjDYJyB2Q==
X-Received: by 2002:a1c:a481:: with SMTP id
 n123mr103567968wme.123.1564573669815; 
 Wed, 31 Jul 2019 04:47:49 -0700 (PDT)
Received: from [192.168.43.238] (44.red-95-127-154.staticip.rima-tde.net.
 [95.127.154.44])
 by smtp.gmail.com with ESMTPSA id o7sm55294774wmc.36.2019.07.31.04.47.48
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 04:47:49 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20190731075652.17053-1-thuth@redhat.com>
 <20190731075652.17053-8-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <f2399005-cead-a147-37a5-600fda7eaea5@redhat.com>
Date: Wed, 31 Jul 2019 13:47:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190731075652.17053-8-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-arm] [PATCH v2 7/8] hw/misc: Add a config switch for the
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
X-TUID: uIzRrfK6HLyX

On 7/31/19 9:56 AM, Thomas Huth wrote:
> The device is only used by some few boards. Let's use a proper Kconfig
> switch so that we only compile this code if we really need it.

I'd prefer having the UnimpDevice user-creatable and always present as a
core device...

Maybe this can be solved by using 'default y':

    config UNIMP
        bool
        default y

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/arm/Kconfig        | 9 +++++++++
>  hw/microblaze/Kconfig | 1 +
>  hw/misc/Kconfig       | 3 +++
>  hw/misc/Makefile.objs | 2 +-
>  hw/sparc64/Kconfig    | 1 +
>  5 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 6e24c73b54..ab9e592d74 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -217,6 +217,7 @@ config STELLARIS
>      select SSI_SD
>      select STELLARIS_INPUT
>      select STELLARIS_ENET # ethernet
> +    select UNIMP
>  
>  config STRONGARM
>      bool
> @@ -283,6 +284,7 @@ config ALLWINNER_A10
>      select ALLWINNER_A10_PIC
>      select ALLWINNER_EMAC
>      select SERIAL
> +    select UNIMP
>  
>  config RASPI
>      bool
> @@ -320,6 +322,7 @@ config XLNX_VERSAL
>      select PL011
>      select CADENCE
>      select VIRTIO_MMIO
> +    select UNIMP
>  
>  config FSL_IMX25
>      bool
> @@ -355,6 +358,7 @@ config ASPEED_SOC
>      select SSI_M25P80
>      select TMP105
>      select TMP421
> +    select UNIMP
>  
>  config MPS2
>      bool
> @@ -378,6 +382,7 @@ config FSL_IMX7
>      select IMX_I2C
>      select PCI_EXPRESS_DESIGNWARE
>      select SDHCI
> +    select UNIMP
>  
>  config ARM_SMMUV3
>      bool
> @@ -389,6 +394,7 @@ config FSL_IMX6UL
>      select IMX_FEC
>      select IMX_I2C
>      select SDHCI
> +    select UNIMP
>  
>  config MICROBIT
>      bool
> @@ -398,6 +404,7 @@ config NRF51_SOC
>      bool
>      select I2C
>      select ARM_V7M
> +    select UNIMP
>  
>  config EMCRAFT_SF2
>      bool
> @@ -410,6 +417,7 @@ config MSF2
>      select PTIMER
>      select SERIAL
>      select SSI
> +    select UNIMP
>  
>  config ZAURUS
>      bool
> @@ -448,6 +456,7 @@ config ARMSSE
>      select TZ_MPC
>      select TZ_MSC
>      select TZ_PPC
> +    select UNIMP
>  
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
>  
>  config PETALOGIX_ML605
>      bool
> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index 385e1b0cec..51754bb47c 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -117,4 +117,7 @@ config AUX
>      bool
>      select I2C
>  
> +config UNIMP
> +    bool
> +
>  source macio/Kconfig
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index e9aab519a1..e4aad707fb 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -9,7 +9,7 @@ common-obj-$(CONFIG_PCI_TESTDEV) += pci-testdev.o
>  common-obj-$(CONFIG_EDU) += edu.o
>  common-obj-$(CONFIG_PCA9552) += pca9552.o
>  
> -common-obj-y += unimp.o
> +common-obj-$(CONFIG_UNIMP) += unimp.o
>  common-obj-$(CONFIG_FW_CFG_DMA) += vmcoreinfo.o
>  
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
> 
