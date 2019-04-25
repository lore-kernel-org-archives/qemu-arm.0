Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1855665wrx;
        Thu, 25 Apr 2019 07:24:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwTWl5x8goeqamaWMSHAy4/xNc/5XRobVUy/yD8NHDfeH6yjVOm1cWjBdBtaKhEei6is8Pt
X-Received: by 2002:a1c:185:: with SMTP id 127mr3626896wmb.145.1556202264898;
        Thu, 25 Apr 2019 07:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556202264; cv=none;
        d=google.com; s=arc-20160816;
        b=dYrNOs2hrdkGPzsZP6yWOsO2LE+/KIGH7gFjZd0ylZ/G0hBnRj2e6wLQ2wHqYr3bTI
         1W8MeX+b/zvgasWw6xUlf4hD8mWC0MpkBQhPN0q2G4MzjkrRAKhV7XaFqgkRIwvEgM3J
         hoGIwk4Id+aiMjF5sU8juJdQ8vKPimWO/g1FTrLaGa/FhjaVdj9Byy+rMumgi/Vfgb2a
         Su1K3sEphXDgANj0jzoAfQEBZhzUpEYxkzbhgshzW/MUB9d77DZiLqJardrwwFFdeTrn
         PvdTEkjK7vauS+cTurUDAi6jx9TMacC6zuPIK1d8EA+H8JxTVV+u6OD9tPlcIP/dQ/KO
         cc3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=o9qYZ+xKjARwGj9xJtPZr6yjVKvTFK44iOwXMsFiPv0=;
        b=Oe94V3El3QzX47cRQmvQAOm/A7hyjY3AZwFxVyyDqxSN5/B5cHzO43xj4rpXvCDHOl
         SoCBweby3/Gfrkof99NUJUFZ1GnBYSCbhYVMTElGowuCMum5nbBcEEXVZ68eI1ixjIeS
         NOzPTwucTf/Va9FpgDuphF/fmT7FfbxSIYZUx+MREgixqVmnus0NsRtMP4x0EMboewuI
         9roG0AORfWMvCK/oCzu1LvFcFD7GPeN1H/YFW8msd1IgbnQzws4rlFeV4VsiBE5Mvxl7
         vyv569HkcXHB1ceyiicSyOk5KaohdqPDhHTj0rEA8dJEO0tgdn5nnn25dE0swGWMml7X
         wbig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q2si2603098wrj.249.2019.04.25.07.24.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Apr 2019 07:24:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:58445 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJfIW-0000gg-0f
	for alex.bennee@linaro.org; Thu, 25 Apr 2019 10:24:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49551)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJfIB-0000Yp-MP
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 10:24:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJfIA-0004P8-Im
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 10:24:03 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:34935)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hJfIA-0004Nw-Bx
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 10:24:02 -0400
Received: by mail-wm1-f65.google.com with SMTP id y197so10901934wmd.0
	for <qemu-arm@nongnu.org>; Thu, 25 Apr 2019 07:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=o9qYZ+xKjARwGj9xJtPZr6yjVKvTFK44iOwXMsFiPv0=;
	b=JZ7IZD7Ib/CeCWivh+eqh2d5dqbxN7PjJsON4GRRvO8GBKY4nYmn1X3n+AXI5RM+9b
	3x84UdtW2Cdc2F/3sC6Y1D/g4qzllDoT3YXa19IOUiPZ8lZ3vTPrbH3kWVoBY86wcH38
	i4ukmF/JZ2i9dYICLMKqoaYRP4qaKTHDL7M3n40r73zP3/QNJQ+nn9vxLSk4P/OKyWkJ
	VYFmT87rJ6TAnyurX50fo1cJ/8tjthhRH5DqGTg4Bpz6qbNW7uMcgiOz6DOtjw4hgpLV
	2IgWsVTBkLrePm0up5xRoERACvvl7XqcXQdRjcnlUfakdzTx35x29fXy8VWcP0Xy45TR
	3JTA==
X-Gm-Message-State: APjAAAU9dFeRaveHOsOt5Nh1ER4HW2jLAOzUxMAAVKshb60UavzNupjj
	r9Ji4kFfy3aXTCbuor9RBSZhkw==
X-Received: by 2002:a1c:7610:: with SMTP id r16mr3573859wmc.21.1556202241157; 
	Thu, 25 Apr 2019 07:24:01 -0700 (PDT)
Received: from [192.168.1.25] (abayonne-654-1-209-122.w109-222.abo.wanadoo.fr.
	[109.222.216.122])
	by smtp.gmail.com with ESMTPSA id y4sm2483703wrt.34.2019.04.25.07.23.59
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 07:24:00 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, yang.zhong@intel.com,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	pbonzini@redhat.com
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-5-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <356b0ed3-31c3-b210-f98e-c0df97e48fa1@redhat.com>
Date: Thu, 25 Apr 2019 16:23:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418180057.3593-5-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-QEMU-4.1 v5 04/29] hw/arm:
 Express dependencies of the exynos machines with Kconfig
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
X-TUID: WTbBSPmfbkVN

On 4/18/19 8:00 PM, Thomas Huth wrote:
> Add Kconfig dependencies for the Exynos-related boards (nuri and
> smdkc210).
> This patch is slightly based on earlier work by Ákos Kovács (i.e.
> his "hw/arm/Kconfig: Add ARM Kconfig" patch).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  default-configs/arm-softmmu.mak | 17 ++++++-----------
>  hw/arm/Kconfig                  | 10 ++++++++++
>  2 files changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 613d19a06d..2a11e76cc7 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -1,8 +1,14 @@
>  # Default configuration for arm-softmmu
>  
> +# TODO: ARM_V7M is currently always required - make this more flexible!
> +CONFIG_ARM_V7M=y
> +
>  CONFIG_PCI=y
>  CONFIG_PCI_DEVICES=y
>  CONFIG_PCI_TESTDEV=y
> +
> +CONFIG_EXYNOS4=y
> +
>  CONFIG_VGA=y
>  CONFIG_NAND=y
>  CONFIG_ECC=y
> @@ -26,7 +32,6 @@ CONFIG_ADS7846=y
>  CONFIG_MAX111X=y
>  CONFIG_SSI_SD=y
>  CONFIG_SSI_M25P80=y
> -CONFIG_LAN9118=y
>  CONFIG_SMC91C111=y
>  CONFIG_ALLWINNER_EMAC=y
>  CONFIG_IMX_FEC=y
> @@ -36,21 +41,15 @@ CONFIG_PFLASH_CFI01=y
>  CONFIG_PFLASH_CFI02=y
>  CONFIG_MICRODRIVE=y
>  CONFIG_USB_MUSB=y
> -CONFIG_USB_EHCI_SYSBUS=y
>  CONFIG_PLATFORM_BUS=y
>  CONFIG_VIRTIO_MMIO=y
>  
>  CONFIG_ARM11MPCORE=y
> -CONFIG_A9MPCORE=y
>  CONFIG_A15MPCORE=y
>  
> -CONFIG_ARM_V7M=y
>  CONFIG_NETDUINO2=y
>  
> -CONFIG_ARM_GIC=y
>  CONFIG_ARM_TIMER=y
> -CONFIG_ARM_MPTIMER=y
> -CONFIG_A9_GTIMER=y
>  CONFIG_PL011=y
>  CONFIG_PL022=y
>  CONFIG_PL031=y
> @@ -61,11 +60,9 @@ CONFIG_PL080=y
>  CONFIG_PL110=y
>  CONFIG_PL181=y
>  CONFIG_PL190=y
> -CONFIG_PL310=y
>  CONFIG_PL330=y
>  CONFIG_CADENCE=y
>  CONFIG_XGMAC=y
> -CONFIG_EXYNOS4=y
>  CONFIG_PXA2XX=y
>  CONFIG_BITBANG_I2C=y
>  CONFIG_FRAMEBUFFER=y
> @@ -73,7 +70,6 @@ CONFIG_XILINX_SPIPS=y
>  CONFIG_ZYNQ_DEVCFG=y
>  
>  CONFIG_ARM11SCU=y
> -CONFIG_A9SCU=y
>  CONFIG_DIGIC=y
>  CONFIG_MARVELL_88W8618=y
>  CONFIG_OMAP=y
> @@ -123,7 +119,6 @@ CONFIG_VERSATILE_I2C=y
>  CONFIG_PCI_EXPRESS=y
>  CONFIG_PCI_EXPRESS_GENERIC_BRIDGE=y
>  
> -CONFIG_SDHCI=y
>  CONFIG_INTEGRATOR=y
>  CONFIG_INTEGRATOR_DEBUG=y
>  
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index d298fbdc89..acd07b2add 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -8,7 +8,13 @@ config DIGIC
>  
>  config EXYNOS4
>      bool
> +    select A9MPCORE
> +    select I2C
> +    select LAN9118
> +    select PL310 # cache controller
>      select PTIMER
> +    select SDHCI
> +    select USB_EHCI_SYSBUS

Same comment here, you disable selectors that are required by other
machines (That would fail to build if disable EXYNOS4).

Since you add them to each machine later,
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>  
>  config HIGHBANK
>      bool
> @@ -104,6 +110,10 @@ config ZAURUS
>  
>  config A9MPCORE
>      bool
> +    select A9_GTIMER
> +    select A9SCU       # snoop control unit
> +    select ARM_GIC
> +    select ARM_MPTIMER
>  
>  config A15MPCORE
>      bool
> 
