Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2008534wrx;
        Thu, 25 Apr 2019 09:44:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyFK+lyqndjNXuuxZ+ZX0mqR4fsu07TnSGoPlPpzUyCFQ7BgRRYqmRhRCDxc7OCxvGMpM29
X-Received: by 2002:a1c:e70b:: with SMTP id e11mr4055128wmh.17.1556210646552;
        Thu, 25 Apr 2019 09:44:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556210646; cv=none;
        d=google.com; s=arc-20160816;
        b=KNw2qTlkLGie/jM19JQbj6qGAZZTD2Apdsg+9eWqVD29Hbtjl2XKMEMKfQJS74a0Fx
         L5MtE+XZWa0BLgAFPwTzmQjzuz+ALpZwaFKAaSAuL0UWkQcOcQaITSN9pnA2rUzgUzuy
         nyM9c3eufxf5mdTU3b8rNJwdmOnyIi2WCGwvF+BzTnK6pzPJbJz5tWdmyoZJ2g4fnSxK
         5gs33KCmea7Jccer3jFsjpF+MS2a2yxnXGfjOBfomsKbVuBZmH8L7Kmpzv3jC30XGoPA
         p28+C4ThgJqc59aY7BMnxon+TMf5+2i45oAo2romrZ64w45OG5917m7uW69V6pl+8g1U
         yaAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=dx32jx1mFqAoq4UidFoSljGlessTpYZy6WMKWboPJgg=;
        b=Y+HJ7WYydR2aRAqRooFEQOxEz6PCHE8lMK7jFNxK16KlUHf75Qsv0gvUcNCszSrveM
         QVM5YdtrL7F6IzS6+ncD3i0ic8nlfcvfV0oVFslZA/BV525NbWCZ2b/pztd5rpZg4B5N
         Ji70hLnBkZrKMTto+U3D79tOHzdArAzdC8KGMN/JVJ+9Qisz0/ouMTdmOYaH/UB//rR4
         dFNUpBdJKBlesVP8V+yL77Y4V9Se50zIMsUaharwnbGXDp873aO1B8u3X6K2ZzyVZV5S
         ZQCxqQ90njPtz3cmSkI/9zZqXuLr2y9nmNuwwNl/g7cH0bBlke69UUOwB2pznadsG3/f
         i3gw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a3si15332016wmb.197.2019.04.25.09.44.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Apr 2019 09:44:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:60670 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJhTh-00012Q-Ht
	for alex.bennee@linaro.org; Thu, 25 Apr 2019 12:44:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJhTW-00011q-5S
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 12:43:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJhTU-0004oM-UC
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 12:43:54 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51207)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hJhTT-0004mK-IO
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 12:43:52 -0400
Received: by mail-wm1-f66.google.com with SMTP id 4so155242wmf.1
	for <qemu-arm@nongnu.org>; Thu, 25 Apr 2019 09:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=dx32jx1mFqAoq4UidFoSljGlessTpYZy6WMKWboPJgg=;
	b=NNUNgYS+5MhIXTW5kfW+VTzCEC5TfzXe7gHSaoSj3IjFy5u5Y40mfvNFhv+cHmEssQ
	u8xpjbtzk85ZQQNL46uRQFRVeaTsk9GyQODC2De3SQSa7xY971wUaQwQXZAwUSOxDGPO
	G81/nP5NCpb27X3EHEzdgBnyMHeVYrKUC9E4lVu8eeTgdWKoLqd0jQ1YZ1g9fxXdFCPJ
	u8TwtvuZ1+XZ+o6ulpAe+zEaqm0RxVqtjJfQQpYunQ1y+zrNZxLaH9w1NLGe14lD2i9L
	vXTZvPzz8n4cPfHr9VSrrzlPDBPkmE9Oow8lRr5RMS1Io6qRyKqFxctgrSDmtJf2sfON
	DTFg==
X-Gm-Message-State: APjAAAWxJVyZxpkekuQAr2VQuQnYMDwJhaqZhAcLxqWrT7rmu8lxmJ8S
	IlGNyKrv6uVUGoa97r+yVz89pA==
X-Received: by 2002:a1c:e912:: with SMTP id q18mr4192227wmc.137.1556210630362; 
	Thu, 25 Apr 2019 09:43:50 -0700 (PDT)
Received: from [192.168.1.25] (abayonne-654-1-209-122.w109-222.abo.wanadoo.fr.
	[109.222.216.122]) by smtp.gmail.com with ESMTPSA id
	v184sm34820967wma.6.2019.04.25.09.43.48
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 09:43:49 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, yang.zhong@intel.com,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	pbonzini@redhat.com
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-23-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <b042daff-8b05-08e7-5386-1b89f05ad984@redhat.com>
Date: Thu, 25 Apr 2019 18:43:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418180057.3593-23-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-QEMU-4.1 v5 22/29] hw/arm:
 Express dependencies of sabrelite with Kconfig
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
X-TUID: TBuW1H9gw7Lg

Hi Thomas,

On 4/18/19 8:00 PM, Thomas Huth wrote:
> Add Kconfig dependencies for the Sabrelite / iMX6 machine.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  default-configs/arm-softmmu.mak | 4 +---
>  hw/arm/Kconfig                  | 7 +++++++
>  hw/arm/Makefile.objs            | 3 ++-
>  3 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 76508e3910..ef7dd7156a 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -33,6 +33,7 @@ CONFIG_NETDUINO2=y
>  CONFIG_MPS2=y
>  CONFIG_RASPI=y
>  CONFIG_DIGIC=y
> +CONFIG_SABRELITE=y
>  
>  CONFIG_VGA=y
>  CONFIG_SSI_M25P80=y
> @@ -40,13 +41,10 @@ CONFIG_IMX_FEC=y
>  
>  CONFIG_NRF51_SOC=y
>  
> -CONFIG_FSL_IMX6=y
>  CONFIG_FSL_IMX25=y
>  CONFIG_FSL_IMX7=y
>  CONFIG_FSL_IMX6UL=y
>  
> -CONFIG_IMX_I2C=y
> -
>  CONFIG_PCIE_PORT=y
>  CONFIG_XIO3130=y
>  CONFIG_IOH3420=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 059fb8282c..065c7acf1b 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -177,6 +177,10 @@ config REALVIEW
>      select DS1338 # I2C RTC+NVRAM
>      select USB_OHCI
>  
> +config SABRELITE
> +    bool
> +    select FSL_IMX6

This one crashes:

$ qemu-system-aarch64 -display none -M sabrelite
ERROR:/source/qemu/qom/object.c:454:object_initialize_with_type:
assertion failed: (type != NULL)
Aborted (core dumped)

(gdb) bt
#3  0x00007f71139fb4de in g_assertion_message_expr () at
/lib64/libglib-2.0.so.0
[...]
#8  0x000055a148c5eec9 in sysbus_init_child_obj
    (parent=parent@entry=0x55a14a2fbe10,
childname=childname@entry=0x55a148ed3713 "eth",
child=child@entry=0x55a14a33e0a0, childsize=childsize@entry=27296,
childtype=childtype@entry=0x55a148ed370a "imx.enet")
    at /source/qemu/hw/core/sysbus.c:373
#9  0x000055a148b37b82 in fsl_imx6_init (obj=0x55a14a2fbe10) at
/source/qemu/hw/arm/fsl-imx6.c:91
#10 0x000055a148d0fb17 in object_initialize_with_type
(data=data@entry=0x55a14a2fbe10, size=size@entry=299248,
type=0x55a14a27dbd0) at /source/qemu/qom/object.c:466
#11 0x000055a148d0fe5d in object_initialize
(data=data@entry=0x55a14a2fbe10, size=size@entry=299248,
typename=typename@entry=0x55a148ed3328 "fsl,imx6") at
/source/qemu/qom/object.c:474
#12 0x000055a148b35ced in sabrelite_init (machine=0x55a14a2c1300) at
/source/qemu/hw/arm/sabrelite.c:58
#13 0x000055a148c608bb in machine_run_board_init
(machine=0x55a14a2c1300) at /source/qemu/hw/core/machine.c:1030
[...]

Then:

$ qemu-system-aarch64 -display none -nodefaults -M sabrelite
qemu-system-aarch64: Unknown device 'sst25vf016b' for bus 'SSI'
Aborted (core dumped)

I got it working using the following snippet:

-- >8 --
@@ -186,6 +186,7 @@ config REALVIEW
 config SABRELITE
     bool
     select FSL_IMX6
+    select SSI_M25P80

 config STELLARIS
     bool
@@ -321,6 +322,7 @@ config FSL_IMX6
     select A9MPCORE
     select IMX
     select IMX_I2C
+    select IMX_FEC
     select SDHCI

 config ASPEED_SOC
---

With this snippet amended:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +
>  config STELLARIS
>      bool
>      select ARM_V7M
> @@ -289,6 +293,9 @@ config FSL_IMX31
>  
>  config FSL_IMX6
>      bool
> +    select A9MPCORE
> +    select IMX
> +    select IMX_I2C
>  
>  config ASPEED_SOC
>      bool
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index 4f591ca487..fadd69882c 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -22,6 +22,7 @@ obj-$(CONFIG_COLLIE) += collie.o
>  obj-$(CONFIG_VERSATILE) += versatilepb.o
>  obj-$(CONFIG_VEXPRESS) += vexpress.o
>  obj-$(CONFIG_ZYNQ) += xilinx_zynq.o
> +obj-$(CONFIG_SABRELITE) += sabrelite.o
>  
>  obj-$(CONFIG_ARM_V7M) += armv7m.o
>  obj-$(CONFIG_EXYNOS4) += exynos4210.o
> @@ -36,7 +37,7 @@ obj-$(CONFIG_XLNX_ZYNQMP_ARM) += xlnx-zynqmp.o xlnx-zcu102.o
>  obj-$(CONFIG_XLNX_VERSAL) += xlnx-versal.o xlnx-versal-virt.o
>  obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
>  obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
> -obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
> +obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o
>  obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
>  obj-$(CONFIG_MPS2) += mps2.o
>  obj-$(CONFIG_MPS2) += mps2-tz.o
> 
