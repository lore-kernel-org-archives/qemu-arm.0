Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1859740wrx;
        Thu, 25 Apr 2019 07:28:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzAxUJw1g2QxKsCzbICSxLVjOcqiMcid5ho73r96BnPHHuLCqIaL58MBvcnHg9Th2DPehrM
X-Received: by 2002:a5d:5584:: with SMTP id i4mr3730289wrv.60.1556202499357;
        Thu, 25 Apr 2019 07:28:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556202499; cv=none;
        d=google.com; s=arc-20160816;
        b=yQkC9hPfPMSr4jlIiIiimqHkN1SvT387IbLtsoqGLrc9I+X1l9LGZBQ3tvlbi6FO9V
         J/poUrggPJwN4SoPlp5xYNuQHjbazcpvFUqcZIPoXoFDRAmKbq4VnkQkS87cqGNoWfw9
         CQS1vCJSHcYU0DpwioDgAy50Hzg5h2ztqGoRtsmzp7t1RdXA4Z1GIMsS+8emPh6ormio
         0vz5IhIQ/UrIDaAvf8u7aijGBcNWKjvVwePZGmL7/YxqzMN7XlQrdfb4koNYY5BwzkUv
         god81eu7W4AZXUkln3lp2nkb1ukS4lNCvVcdxQGXmFSP3k5r1bufGGM3KYsFW86BggBu
         waHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=MPUAfE7XwR1+GwI9oqV+NsnrsOy6QGZjxP7WEADatpA=;
        b=vbwiJFxhD2GYmPcpDkvcKMwsNici852WkatoC1s6oVAVNVg519H/PSnbexZl+l9CyK
         ijzdc1DybQ8JrCsS+DmHxAmJ6adO8HPErSBLIIPjGTMw9n2slteoYt6ms6mVpPMwHc34
         mJdxz7Nk4cJoTsBaz2BWFJAk5HzgFb+mfMmIpDPMw0xHs+DD/9FoT6dVl66p/0YIz1mH
         ARLcuL8TwS4wTWgCgE+xfPXaRmSMAkT7kvwm7+qPlUD9btQ0aEVKQH7U8a/L7rxicy2P
         L/+sRu84gCxwi1TpHqTlLKjOOeJaZTZLkdz9hXeOZiS8BtQR6bJBd2WU9l/3LihjWhU5
         5kBw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r8si16543304wrx.329.2019.04.25.07.28.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Apr 2019 07:28:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:58560 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJfMI-0003MS-Eo
	for alex.bennee@linaro.org; Thu, 25 Apr 2019 10:28:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51044)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJfM4-0003Jx-Fm
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 10:28:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJfM3-0007ts-Gl
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 10:28:04 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35403)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hJfM3-0007tH-9p
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 10:28:03 -0400
Received: by mail-wr1-f65.google.com with SMTP id f7so8026395wrs.2
	for <qemu-arm@nongnu.org>; Thu, 25 Apr 2019 07:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=MPUAfE7XwR1+GwI9oqV+NsnrsOy6QGZjxP7WEADatpA=;
	b=KTpr1OUPBI61+tBG8kfODb9YhpBcBlTgub6NuYKVYjok1XEkzzsbC5SIK4A7yzeEQE
	pMIWBtfuufhC24hwyfYr0MG8nOBDg+a/8aPAJd4lV/RwHCs8zWn66HIMlX8yTQrB08lN
	dFl5ZWEop+npyOT/1vXXnbj6lvbl4tNEJnxn7ipW1TWdYZ/QcB0k/D/59WEw18V16Pvl
	h9rr2bqKxzsNbRttNlUj1L74SUWJ+bTkd6fO+C8GztyoDLhcdSm9zGBKxWwu5ERq6m6W
	4jXbRy9GX8QZPrSidJ0maIeENJxeN3YNuicQSM6jVeDyXnnsa18Lj3EBP18YTHccGRK0
	PC/g==
X-Gm-Message-State: APjAAAWK6wTMejLu28sO1QADHPf4oPx03m8/h+hhwLmGQeeZcZgQA/5j
	SIXruwxh5p8UNJ+n1hJ+KNBqNw==
X-Received: by 2002:adf:ce0b:: with SMTP id p11mr22654467wrn.196.1556202482288;
	Thu, 25 Apr 2019 07:28:02 -0700 (PDT)
Received: from [192.168.1.25] (abayonne-654-1-209-122.w109-222.abo.wanadoo.fr.
	[109.222.216.122]) by smtp.gmail.com with ESMTPSA id
	u6sm41394267wrg.72.2019.04.25.07.27.59
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 07:28:01 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, yang.zhong@intel.com,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	pbonzini@redhat.com
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-8-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <472cdca7-a01f-632f-bbac-633db846c605@redhat.com>
Date: Thu, 25 Apr 2019 16:27:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418180057.3593-8-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-QEMU-4.1 v5 07/29] hw/arm:
 Express dependencies of the fsl-imx31 machine with Kconfig
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
X-TUID: e6gQEbt6rLJD

On 4/18/19 8:00 PM, Thomas Huth wrote:
> Add Kconfig dependencies for the fsl-imx31 / kzm machine.
> This patch is slightly based on earlier work by Ákos Kovács (i.e.
> his "hw/arm/Kconfig: Add ARM Kconfig" patch).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  default-configs/arm-softmmu.mak | 3 +--
>  hw/arm/Kconfig                  | 4 ++++
>  hw/misc/Kconfig                 | 2 ++
>  3 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 6195b75f48..7f94811ccb 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -10,6 +10,7 @@ CONFIG_PCI_TESTDEV=y
>  CONFIG_EXYNOS4=y
>  CONFIG_HIGHBANK=y
>  CONFIG_INTEGRATOR=y
> +CONFIG_FSL_IMX31=y
>  
>  CONFIG_VGA=y
>  CONFIG_NAND=y
> @@ -68,7 +69,6 @@ CONFIG_TSC210X=y
>  CONFIG_BLIZZARD=y
>  CONFIG_ONENAND=y
>  CONFIG_TUSB6010=y
> -CONFIG_IMX=y
>  CONFIG_MAINSTONE=y
>  CONFIG_MPS2=y
>  CONFIG_MUSCA=y
> @@ -115,7 +115,6 @@ CONFIG_ALLWINNER_A10_PIC=y
>  CONFIG_ALLWINNER_A10=y
>  
>  CONFIG_FSL_IMX6=y
> -CONFIG_FSL_IMX31=y
>  CONFIG_FSL_IMX25=y
>  CONFIG_FSL_IMX7=y
>  CONFIG_FSL_IMX6UL=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index ad3b1f9b40..9087b7d714 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -98,6 +98,10 @@ config FSL_IMX25
>  
>  config FSL_IMX31
>      bool
> +    select SERIAL
> +    select IMX
> +    select IMX_I2C
> +    select LAN9118

Similarly to my comment on patch 6 of this series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>  
>  config FSL_IMX6
>      bool
> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index 5f67d0d6d9..385e1b0cec 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -76,6 +76,8 @@ config ECCMEMCTL
>  config IMX
>      bool
>      select PTIMER
> +    select SSI
> +    select USB_EHCI_SYSBUS
>  
>  config STM32F2XX_SYSCFG
>      bool
> 
