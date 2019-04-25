Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2271907wrx;
        Thu, 25 Apr 2019 14:30:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxO6w7uNTPJsRZxK2e8Km0H6sUD0CmItAlhf28Nibd7M6VxqNksY5hMWhx2uhHNgGJMeT50
X-Received: by 2002:adf:de0f:: with SMTP id b15mr26223696wrm.308.1556227814459;
        Thu, 25 Apr 2019 14:30:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556227814; cv=none;
        d=google.com; s=arc-20160816;
        b=R0ZIp1nRrTSdYidQUI4nwzBODytcOYqkYfv4tXGNmzlV0KStWa+xS5WBBhLA8N6Js0
         zLN7B9jsZbOA2Gc0iZSaop4WcUFILHKoG02isOCbVGnPdgBAfJiUVFMKbRI+7zG7OCih
         IhTrlRhK9BOey4nYqyBjE47Az1bgSpoA45fGdFI8dow9vcDuVo8ASBYOfOS1QGLBN+VQ
         oUap5+QUuxUoO9K5eXZKqM30lR0elzEYvFEK3bwbR3y+BliRrrVMt6AJRKn6Es2cSPn5
         tETc3kzDYoDTBNeZi9zRkpcbCxdQqhx7FE8WfisJyNYno5B6AyypmzyO9OaMa2S50QQN
         yaZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=qGURUPMmUmHajOvtglo+W0q/YFgEp7ZhhCqqLRRXN4w=;
        b=U4DWcgp+RydgO9f2pKupeLJaDToZWwycxbbcdEOgzoe7Y/QqO7ywUoIcQCGvoM9PYz
         VoTP6uXZXVqihiLUBodSSZTGKbta8/W6AfKzihASJDTfAlkjZ9xIgoJ/sgVN4i8HzKwU
         SA5RpnMt7krSKDSUuWzLhRD/i/nDC0DO0nH8WKF41h9fJHD4vqwEQrZMgB+WHdPaoTyb
         nFuK+mxSptIUZsKfW8Ej/6qVrtn7DHptvziOQY2X4m+ynhNTth1syV/u/3KE9kVZzPi6
         ytQx6PCWxqPN3SRlIhvNi+eoFES+hWPGYWhQnkb2NuXxpc9xBH5gPfFZ/xK4HgQKa4fv
         6AiA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 75si16863045wma.113.2019.04.25.14.30.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Apr 2019 14:30:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35317 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJlwb-0006qL-JS
	for alex.bennee@linaro.org; Thu, 25 Apr 2019 17:30:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJluR-0004bm-FG
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 17:28:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJluQ-0003zW-3b
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 17:27:59 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39448)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hJluP-0003yh-T2
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 17:27:58 -0400
Received: by mail-wr1-f66.google.com with SMTP id a9so1373943wrp.6
	for <qemu-arm@nongnu.org>; Thu, 25 Apr 2019 14:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=qGURUPMmUmHajOvtglo+W0q/YFgEp7ZhhCqqLRRXN4w=;
	b=UNazhCKE9lZuh5ShiZAS1TfFo5HPtyBQronzce5rVCaQaSkfTjwdxtbQRwJUqKTduW
	3rnvG5QUedSrlfiFaJL7DW4qskBS3aNSBqGVVRvCtt2e/4D81FVnn4yJf81bx+X/Sm4S
	aXi4Y6oQ/3tgMg7Jh44KY03BeotQ+KPgKJEdzkHiLD97BcrDvC5urrXK0z2HMexjxJLT
	ChdSmZ7XnG4F9v5hlqZdPg4lOSB0Vvnwkp85YE8NsKnVgpwKZeHYZvFhxGHchY4kKdlv
	XKnYPRVpw9I/4IgEk3YUenuKnGkhsm6+XAFkpvJlPfw/nyR1JTjZsiQAXnuyZYWvT/mu
	MDgg==
X-Gm-Message-State: APjAAAVpzeEl6GZ2leh8Zv/ru1K7JKKzVyYEIxoKrLohBzpR+7tLp95g
	nMOWzkz5ATxjcJfuyWUQsu9oUQ==
X-Received: by 2002:adf:f6ca:: with SMTP id y10mr6786874wrp.241.1556227676874; 
	Thu, 25 Apr 2019 14:27:56 -0700 (PDT)
Received: from [192.168.1.25] (abayonne-654-1-209-122.w109-222.abo.wanadoo.fr.
	[109.222.216.122]) by smtp.gmail.com with ESMTPSA id
	o2sm17194498wrs.89.2019.04.25.14.27.55
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 14:27:56 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, yang.zhong@intel.com,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	pbonzini@redhat.com
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-26-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <d672400a-0a96-c811-a063-672f697a9366@redhat.com>
Date: Thu, 25 Apr 2019 23:27:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418180057.3593-26-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
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
X-TUID: MuLNQqfAuKoA

On 4/18/19 8:00 PM, Thomas Huth wrote:
> Add Kconfig dependencies for the NRF51 / microbit machine.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

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
> 
