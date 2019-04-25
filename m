Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1976687wrx;
        Thu, 25 Apr 2019 09:14:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzhEyQOyASjEiuHDSmc0Nbne5OSLsaB4xQuSrDDOiCBL4duIeQXWRm5eCGEXu7AE4YxgYPc
X-Received: by 2002:a5d:4983:: with SMTP id r3mr4804543wrq.254.1556208857274;
        Thu, 25 Apr 2019 09:14:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556208857; cv=none;
        d=google.com; s=arc-20160816;
        b=fp4K/r8/7YUqRZ3QPUcOiGGDfnp/pR4P4tIePVmRh8mkKFX84jzI+YT/touIHQzIuj
         3SSbqakctOXTpuNuTsE7gpzhYiAywAyOCF+96JWNnM3ry0ZPz7PPNN8IA4vEK1tknK1j
         bXX6pj9DwY8TBTzH+oMbG0AJ7JFKvGkb7pwH3p6e+/B3sJdT9xJ6YF+RGM+eoMnMD9p8
         pq14CBgI+x+pMrlPf4o/kyxq6SQgwX8T3ZG5xMau+ARnnUvAcLC0BhMldfKkimnuPfU7
         aRgmey1DUVaS6T1If6vAhk0IcChBKJ2fvPva0ld4/wVRAvljDsSAmecyCmCc0Xmd6tLW
         KwFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=XRVpDPjBZmvBUFFN8JJzxRXHwosnKacJS2q315hBj8U=;
        b=qwsNI/KBIipRHGb0lHnunms0Rto7R3RBBmT4Fj8BLlVRrbLG/WmC1YpGCQfWvIFklk
         nKUybHLZ+jPeRJyQhnRYbE+iftexmbvExNYHdDWdPTEHNtd1UfMZUhxE8BqWK2WCfVWh
         //i0I7SqKVgI0CK9mmM8gSI2l41CeeyHRo1zLZt232A3PIukH9zUi571VmXKi975FWet
         /WbHJ/Vj7igI6P2XVa/uOkfRTJnkN72IcSFTAh4xNBKdS4hf0SKK5AHFUZ9+KEr0C1QT
         Nvesh1HtImtIiXRSGg+x1xM6FFyElCEa1qWHSTJbjGLWoqXAGeGr/fz9/ixF8pogz3bE
         87ww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e7si16441716wrj.109.2019.04.25.09.14.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Apr 2019 09:14:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:60127 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJh0q-0007Ot-BS
	for alex.bennee@linaro.org; Thu, 25 Apr 2019 12:14:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJh0d-0007MA-GL
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 12:14:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJh0c-0007Eg-Dc
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 12:14:03 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45051)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hJh0c-0007Ca-6f
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 12:14:02 -0400
Received: by mail-wr1-f67.google.com with SMTP id c5so172586wrs.11
	for <qemu-arm@nongnu.org>; Thu, 25 Apr 2019 09:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=XRVpDPjBZmvBUFFN8JJzxRXHwosnKacJS2q315hBj8U=;
	b=mwNeDwPTusCLkKB1rGzp6pocLFonpCCizP8xIuFnU30OidROgL6Lx/9yiSjdHgKGam
	/Px7nLuKE5SRflyQ4ivY6eP62XF1hWNJ06Em3QddkRl1thZpWMkEdtujfDHjMwzC2Iqf
	FntVxrOAZQQejVlItbJid2Efw1yFPlYzfz9DsElfMTTWKfg/pwNeJ2njIQiM7PV/Tbkn
	wweiVKxEgCwXjFWCUcFZWUnIPlVO0TeT5pqAPL1cA9aLhioA124roUjHWrIhvxqwdTWb
	15HNdEzJYSadN2nlJIPZCUV7qL3e4PUdUnXrA6fZQgFU9GRllxVqbiBYq4fj+dUlRIjx
	qDFQ==
X-Gm-Message-State: APjAAAUfeLKM8zJvy1dDHh7eWmbi59yDUsrEynKXbhVDPPEeDiOwaV1+
	8jqY75XFIeLu11IOvN68dSbJdw==
X-Received: by 2002:a5d:464f:: with SMTP id j15mr4840548wrs.265.1556208841063; 
	Thu, 25 Apr 2019 09:14:01 -0700 (PDT)
Received: from [192.168.1.25] (abayonne-654-1-209-122.w109-222.abo.wanadoo.fr.
	[109.222.216.122])
	by smtp.gmail.com with ESMTPSA id q3sm575941wre.31.2019.04.25.09.13.59
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 09:14:00 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, yang.zhong@intel.com,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	pbonzini@redhat.com
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-25-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <4fcfff75-aa44-e1cc-2e14-38faba3a3e47@redhat.com>
Date: Thu, 25 Apr 2019 18:13:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418180057.3593-25-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-QEMU-4.1 v5 24/29] hw/arm:
 Express dependencies for remaining IMX boards with Kconfig
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
X-TUID: HVx6D85Jcjkn

On 4/18/19 8:00 PM, Thomas Huth wrote:
> IMX25, IMX7 and IMX6UL were still missing the Kconfig dependencies.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  default-configs/arm-softmmu.mak |  2 --
>  hw/arm/Kconfig                  | 19 +++++++++++++++++++
>  2 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 1455d083d8..6dc388c43e 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -37,7 +37,6 @@ CONFIG_SABRELITE=y
>  CONFIG_EMCRAFT_SF2=y
>  
>  CONFIG_VGA=y
> -CONFIG_IMX_FEC=y
>  
>  CONFIG_NRF51_SOC=y
>  
> @@ -49,4 +48,3 @@ CONFIG_PCIE_PORT=y
>  CONFIG_XIO3130=y
>  CONFIG_IOH3420=y
>  CONFIG_I82801B11=y
> -CONFIG_PCI_EXPRESS_DESIGNWARE=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index f5cd63860d..58439c492a 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -283,6 +283,10 @@ config XLNX_VERSAL
>  
>  config FSL_IMX25
>      bool
> +    select IMX
> +    select IMX_FEC
> +    select IMX_I2C
> +    select DS1338
>  
>  config FSL_IMX31
>      bool
> @@ -296,6 +300,7 @@ config FSL_IMX6
>      select A9MPCORE
>      select IMX
>      select IMX_I2C
> +    select SDHCI
>  
>  config ASPEED_SOC
>      bool
> @@ -321,12 +326,26 @@ config MPS2
>  
>  config FSL_IMX7
>      bool
> +    imply PCI_DEVICES
> +    imply TEST_DEVICES
> +    select A15MPCORE
> +    select PCI
> +    select IMX
> +    select IMX_FEC
> +    select IMX_I2C
> +    select PCI_EXPRESS_DESIGNWARE
> +    select SDHCI
>  
>  config ARM_SMMUV3
>      bool
>  
>  config FSL_IMX6UL
>      bool
> +    select A15MPCORE
> +    select IMX
> +    select IMX_FEC
> +    select IMX_I2C
> +    select SDHCI
>  
>  config NRF51_SOC
>      bool
> 
