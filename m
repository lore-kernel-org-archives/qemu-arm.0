Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2302653wrx;
        Thu, 25 Apr 2019 15:10:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyuB7uXxw9/E/Z1V4YSyLSI943uPzhcofQKHWaW7dE3PnmK6GAbCWZwgAzFTwVGfZtGOzHl
X-Received: by 2002:a1c:6502:: with SMTP id z2mr4924558wmb.119.1556230222222;
        Thu, 25 Apr 2019 15:10:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556230222; cv=none;
        d=google.com; s=arc-20160816;
        b=wN4o3pXoa2Pa52kDnCGpxmWGGMweMEBNVifNTQPNu/Au+g9lMwY58aUR7VV3mZDk0p
         n7NvZFFJ2c5ylZZdwfZqR/t0iitAs5WGEY3n45PFn/qM4lvdp7HOCPv7aIy7Ew70M9NP
         q01STMfjMh7oHRcIZoupZwP1bvaKLUjRKITUbrpq/X/015JwdKmm+HMcnG6FwdLbIg/d
         dUW5RhXEYey//eI+8/U5iK/Qn3JawMhoUtakGWs/PLiXYo4vNSfk3b33SToj09U3n0GC
         X+p5B7ZuXuA2uQkzSLfvVnSGxv2YQLegGUY1kjZAJ/dOYaDMX8fxoDWkYEZQft4bwxP1
         Nk3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=NaPGrJILZE4qFy8xmfe+rJXg3UuxeRMh9zAw451xYLI=;
        b=YIwtu1DYnI92+/z9UQt4viymrHmEL1c7TtRVcpm292Ov91vBn23ZrjRNKQjJojzMjz
         zWz6lokhseb2qxkqGe2bXwvarOiyyjmy9sy2Om5v0x03BghHkW5HKp5lxn19cQEymt/l
         vsETyB4KjQ02cpU+F0LZvuc/pFVmLkR5FatUMzlTN2hnfJc2GXn/NcJRjbwWI/DJNVv2
         vtd0oYUei8iOO18s2/Oi9i84+xfdZF+zO93UvIev0I4Ssouyt6CRzAQx5z2063eM6cDZ
         3+iZrfdCVT4qvBcsfGWTdZEG9ZckAilLqeA7HegWXm2F8EgBYXhKtbCS7z1NeP8P0BPE
         EX2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10si8509895wrw.236.2019.04.25.15.10.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Apr 2019 15:10:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35734 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJmZR-0002YK-8Y
	for alex.bennee@linaro.org; Thu, 25 Apr 2019 18:10:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJmXF-0000eg-Eb
	for qemu-devel@nongnu.org; Thu, 25 Apr 2019 18:08:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJmJX-0006YZ-N6
	for qemu-devel@nongnu.org; Thu, 25 Apr 2019 17:53:57 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41721)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hJmJX-0006XB-52
	for qemu-devel@nongnu.org; Thu, 25 Apr 2019 17:53:55 -0400
Received: by mail-wr1-f68.google.com with SMTP id c12so1433446wrt.8
	for <qemu-devel@nongnu.org>; Thu, 25 Apr 2019 14:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=NaPGrJILZE4qFy8xmfe+rJXg3UuxeRMh9zAw451xYLI=;
	b=gU5Job3qdeoHM9nbS0tsBsvU8JGJAWNodjRWhxYG3DFL19NkjPDiZVMQtx8H9CJT1S
	ttO5oPZ7P5enXd5+1dq7pzZJEp9Zh36iTULRQyXX9T6A8fSoMFrRvbidz+LGjXPZjYVY
	Bbpm8v4uk0Kv8BxqhZya/PV2u2iUdH4vUZlFX+u1HyzgMRJ3o7DOVMJHYneE7HwuXWv2
	vAf63ZcElfiDsOyYQMZxn8PuFOx70XYjH4L5d9H4V6p6ms8NmIwlqSF5SzTHpZ22hSMA
	w61MAA5aeGAYuObgubnEpaNNjG/HfonoNAH+HwJpMTYX1VOgbSVRDFSf9cVfgrdclKAP
	OZhw==
X-Gm-Message-State: APjAAAWHGcloxrx+stg3HFUk9w41ru3RGTkRVshK7rJtyP4hT2tPUbDJ
	Lnb80avrFZOjVQTovMGq/FVcMA==
X-Received: by 2002:adf:f70a:: with SMTP id r10mr11613229wrp.96.1556229234042; 
	Thu, 25 Apr 2019 14:53:54 -0700 (PDT)
Received: from [192.168.1.25] (abayonne-654-1-209-122.w109-222.abo.wanadoo.fr.
	[109.222.216.122]) by smtp.gmail.com with ESMTPSA id
	d10sm5794015wmb.15.2019.04.25.14.53.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 14:53:53 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, yang.zhong@intel.com,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	pbonzini@redhat.com
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-20-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <8c7e6aa5-3f74-7c63-486c-80e3e21e9da5@redhat.com>
Date: Thu, 25 Apr 2019 23:53:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418180057.3593-20-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-devel] [PATCH for-QEMU-4.1 v5 19/29] hw/arm: Express
 dependencies of the MPS2 boards with Kconfig
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
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	John Snow <jsnow@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rLrH/2/1lzRf

On 4/18/19 8:00 PM, Thomas Huth wrote:
> Add Kconfig dependencies for the mps2-an* machines.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  default-configs/arm-softmmu.mak | 20 +-------------------
>  hw/arm/Kconfig                  | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index a0b9016e3a..31d31d3f4a 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -30,6 +30,7 @@ CONFIG_Z2=y
>  CONFIG_COLLIE=y
>  CONFIG_ASPEED_SOC=y
>  CONFIG_NETDUINO2=y
> +CONFIG_MPS2=y
>  
>  CONFIG_VGA=y
>  CONFIG_SSI_M25P80=y
> @@ -38,28 +39,9 @@ CONFIG_IMX_FEC=y
>  CONFIG_FRAMEBUFFER=y
>  
>  CONFIG_DIGIC=y
> -CONFIG_MPS2=y
>  CONFIG_RASPI=y
>  CONFIG_NRF51_SOC=y
>  
> -CONFIG_CMSDK_APB_TIMER=y
> -CONFIG_CMSDK_APB_DUALTIMER=y
> -CONFIG_CMSDK_APB_UART=y
> -CONFIG_CMSDK_APB_WATCHDOG=y
> -
> -CONFIG_MPS2_FPGAIO=y
> -CONFIG_MPS2_SCC=y
> -
> -CONFIG_TZ_MPC=y
> -CONFIG_TZ_MSC=y
> -CONFIG_TZ_PPC=y
> -CONFIG_ARMSSE=y
> -CONFIG_IOTKIT_SECCTL=y
> -CONFIG_IOTKIT_SYSCTL=y
> -CONFIG_IOTKIT_SYSINFO=y
> -CONFIG_ARMSSE_CPUID=y
> -CONFIG_ARMSSE_MHU=y
> -
>  CONFIG_FSL_IMX6=y
>  CONFIG_FSL_IMX25=y
>  CONFIG_FSL_IMX7=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 2ef5696900..466b143fdf 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -301,6 +301,12 @@ config ASPEED_SOC
>  
>  config MPS2
>      bool
> +    select ARMSSE
> +    select LAN9118
> +    select MPS2_FPGAIO
> +    select MPS2_SCC
> +    select PL022    # Serial port
> +    select PL080    # DMA controller
>  
>  config FSL_IMX7
>      bool
> @@ -340,6 +346,18 @@ config ARM11MPCORE
>  
>  config ARMSSE
>      bool
> +    select ARMSSE_CPUID
> +    select ARMSSE_MHU
> +    select CMSDK_APB_TIMER
> +    select CMSDK_APB_DUALTIMER
> +    select CMSDK_APB_UART
> +    select CMSDK_APB_WATCHDOG
> +    select IOTKIT_SECCTL
> +    select IOTKIT_SYSCTL
> +    select IOTKIT_SYSINFO
> +    select TZ_MPC
> +    select TZ_MSC
> +    select TZ_PPC
>  
>  config ARMSSE_CPUID
>      bool
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
