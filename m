Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1989278wrx;
        Thu, 25 Apr 2019 09:25:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzLE0bmVoWIg2ceVKl1RFLEyhjFCEIRZVCxfKIGU/VmejlT2N5DA9ZMwWRdAyEGpscmenI5
X-Received: by 2002:a1c:a384:: with SMTP id m126mr3850454wme.99.1556209555377;
        Thu, 25 Apr 2019 09:25:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556209555; cv=none;
        d=google.com; s=arc-20160816;
        b=RFVXn/oimxD24FbKrbFn2IFRkvovexh02dkKFMXHj7JUwalvYwkaQvmUDZmYIgJ/NJ
         7oeYica7u6haotKMDn6vRxcmfIoiLdwS8q2G2zu9XAIQ4ua6KJNym1a+qe9huKVhsOpt
         AWvCj+1Hoz9WH7o7Gj6N1/Zdx6Mk4CYFrkhWL5fsWyGTIa0+fqv9kWpMqF7gEpbg9ikr
         Jw0652aaRBf+a6IGnmJVXaxZvnJYTlm3Ydq/PpsJqzfLsuDm7qSH44gyFZut0b2ZOG9P
         UOh//5Iuala1rrAGkJiFdUhIi500boSCK9QFd11fkFeX534pkhbV2/i8O6MnlW4S+i8J
         azeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=Ko/ee3WLvavlv69QBSoiYXdGoVO571KZqC0f3Po9JKI=;
        b=VnZwyRGOB2jE16yxSqyZruOUYE+VUqVrG3AaUe5GUDb+sjKIZDxyxgiB2nw0+LF4U+
         OhA65NZSV0LAoP33/g9asSDktl5VZIBn59RF82lJ3lfgIEM7VETUAoQXRVG7rKtVjIAd
         cNi5Es1GMwV9WWS2Oj9BuRKFTJRiwSbYGP8SeKV9H1Hn8yctsW0VYpvKd8utoFuWr/YN
         uPMzn94UxrU/3UexJnJ+5z4qPdbOOhVmB+faexLIpmtw85PHhKC689cp2LLq3PxM+7IH
         nLcXgCPUhSts8HyHzu5aKDyt+lnGkHQrDWkIlTNerH2f96Vv4FRe0yXml09h5ENuL9dV
         b/rg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16si14013875wrs.240.2019.04.25.09.25.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Apr 2019 09:25:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:60358 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJhC6-0000OZ-Dj
	for alex.bennee@linaro.org; Thu, 25 Apr 2019 12:25:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50540)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJhBr-0000M7-Bf
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 12:25:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJhBp-0001YP-Fp
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 12:25:39 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45760)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hJhBn-0001Wn-Fq
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 12:25:37 -0400
Received: by mail-wr1-f68.google.com with SMTP id s15so208934wra.12
	for <qemu-arm@nongnu.org>; Thu, 25 Apr 2019 09:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Ko/ee3WLvavlv69QBSoiYXdGoVO571KZqC0f3Po9JKI=;
	b=s6NRL/jppQvgqtot0ot/lxeVyiW1ba77W+BX03VyjTKw7KBwYNxbgOi5uZLIa1eRTI
	v163ln43j7RVx9R7XjwudbhhmI2OZZQFEZH7iZTRWs3+zDuHOKTaVJyk0Rc0SH9Iv/9+
	6mQlGlCcfSIFoHJ1nrVLQ57jAzCx6LT5516ZiW2IXYPGPQC/8Y0N9xIlZLa4swVbOeXi
	yZPcloYQ5SDhWzQf4jpAObyyMK5/O4LjJ3bkGWGZM0zXEeI4BOh+u3hYFYIKTelH7dEe
	hpsb6o9DpmukTl+GaxFwvMcuE8kECCK5ENZRid4xeHmsmkUsfeF1SR3oIYqOB6nMvPyH
	ZLDw==
X-Gm-Message-State: APjAAAV7xVXQVeHoM3E60HIWBuT7mM0SB/zbeGBO698zCsON3zomWFVI
	d60tz7O07ZMYsDCUJI9qHk/8iw==
X-Received: by 2002:a05:6000:cc:: with SMTP id
	q12mr15767393wrx.251.1556209533803; 
	Thu, 25 Apr 2019 09:25:33 -0700 (PDT)
Received: from [192.168.1.25] (abayonne-654-1-209-122.w109-222.abo.wanadoo.fr.
	[109.222.216.122]) by smtp.gmail.com with ESMTPSA id
	h131sm29200171wmh.1.2019.04.25.09.25.31
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 09:25:32 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, yang.zhong@intel.com,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	pbonzini@redhat.com
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-16-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <c7599e97-8ccb-d7fa-93de-1001490ff243@redhat.com>
Date: Thu, 25 Apr 2019 18:25:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418180057.3593-16-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-QEMU-4.1 v5 15/29] hw/arm:
 Express dependencies of the aspeed boards with Kconfig
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
X-TUID: Z0lZdoy0McX6

On 4/18/19 8:00 PM, Thomas Huth wrote:
> Dependencies have been determined by looking at hw/arm/aspeed.c
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  default-configs/arm-softmmu.mak |  7 +------
>  hw/arm/Kconfig                  | 10 ++++++++++
>  2 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 25e8f717ac..2580584281 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -26,15 +26,12 @@ CONFIG_SPITZ=y
>  CONFIG_TOSA=y
>  CONFIG_Z2=y
>  CONFIG_COLLIE=y
> +CONFIG_ASPEED_SOC=y
>  
>  CONFIG_VGA=y
> -CONFIG_TMP421=y
> -CONFIG_PCA9552=y
>  CONFIG_SSI_M25P80=y
>  CONFIG_ALLWINNER_EMAC=y
>  CONFIG_IMX_FEC=y
> -CONFIG_FTGMAC100=y
> -CONFIG_DS1338=y
>  CONFIG_PLATFORM_BUS=y
>  CONFIG_VIRTIO_MMIO=y
>  
> @@ -92,8 +89,6 @@ CONFIG_I82801B11=y
>  CONFIG_ACPI=y
>  CONFIG_ARM_VIRT=y
>  CONFIG_SMBIOS=y
> -CONFIG_ASPEED_SOC=y
> -CONFIG_SMBUS_EEPROM=y
>  CONFIG_GPIO_KEY=y
>  CONFIG_MSF2=y
>  CONFIG_FW_CFG_DMA=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 325133c129..abeaa54d88 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -254,6 +254,16 @@ config FSL_IMX6
>  
>  config ASPEED_SOC
>      bool
> +    select DS1338
> +    select FTGMAC100
> +    select I2C
> +    select PCA9552
> +    select SERIAL
> +    select SMBUS_EEPROM
> +    select SSI
> +    select SSI_M25P80
> +    select TMP105
> +    select TMP421
>  
>  config MPS2
>      bool
> 
