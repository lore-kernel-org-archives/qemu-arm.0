Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1966841wrx;
        Thu, 25 Apr 2019 09:05:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzDjY8q7HOdmjPFXBADIn+mt1vR2Rk5aNS+RyntDFD8pOVtS8q0vAY0UFWong2XVyusAdCm
X-Received: by 2002:a1c:a00a:: with SMTP id j10mr4173189wme.15.1556208356161;
        Thu, 25 Apr 2019 09:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556208356; cv=none;
        d=google.com; s=arc-20160816;
        b=uYnP9tDnOQpZinru1R21aoCSipyIrs1mAe/rrXzBAeUy4M9d2gtbUqg2U9U+bZcDne
         eDzYwb1K0H7B/mimu+kXgRh+kh9sll1S2nUOxKmQUI5F802V9Fx0GmgJUrSRh2CP2piz
         1tdXWC8d2sjSwSo8whwu2+TcHDGyAfwxBQ2Cgf2sdvYh46ma68AOU11iS5fEaeh2KaT9
         At/mdWmCPet+4up0/wLh7MB1xKAheynz/prdwPB+icfDQc7DvUmyrjCM++1fy2UufoHU
         alN8g3cH+/FURRFAbXKNjGDj3sLXb1fd88n8jnACghMfndvx3NPKMDszQICURbLQLIo8
         Lz3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=0AD/xbd7NqYL/doMKzXbJIfwRggRArvPf5ZwIgSIHwg=;
        b=AYrwGuSKb8/nIyUOti8WzGY3xkkrfAgBXvs5BUd8OX2iYrsVxXAqyZYkjLw2GYpS7o
         4thZxot+NeAPJnSjyUcMVVMD75lPkcitxqXUzJUFNjBnY7opgdk7YPaK6Mm3ZWmxa9J7
         g0q8Fj4JwdZob/cku4DiD0bXDWCS2+wCBHMgPXjX9JhI8HGjcKFyqHholJxY49roVOm5
         GVhu/ml6ZeJVwYgERsGferYengagaH7D/iq2lbQ+rW6qs9G+fQKzG7YkforoYTHyqTwx
         snzjJ/Vfn9vBxyzc/MbLlqSnmT+DqxCdXv2imCYJ2Baulliy/uYzsZiBT2R7bSE0WxTW
         wUPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i4si16415037wmg.90.2019.04.25.09.05.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Apr 2019 09:05:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:60009 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJgsl-0001kh-5n
	for alex.bennee@linaro.org; Thu, 25 Apr 2019 12:05:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJgsR-0001j4-Bg
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 12:05:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJgsQ-0003g5-8K
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 12:05:35 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42021)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hJgsQ-0003f5-1z
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 12:05:34 -0400
Received: by mail-wr1-f66.google.com with SMTP id g3so153769wrx.9
	for <qemu-arm@nongnu.org>; Thu, 25 Apr 2019 09:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=0AD/xbd7NqYL/doMKzXbJIfwRggRArvPf5ZwIgSIHwg=;
	b=hV9zVYYMkh/Wh+ht4YRXPkdaVCekZRmZGRaNJw2nCe00B0WmkZ+wfZa5fBPgwiNgVi
	ET1am3EeKvF+kUH6xWpPXt5kykPYpqg73l1vOmg1Gd+fKcEMPoNvhy4I3jhvhRri2GVc
	9pQGddB/6QQTXc+gfq3N5fqMEocsJUcwFhwQ1lXrB5L/tBD3kEHIuO7vUEkQjeZF/T0A
	ZJDS+sh2/i9yuYxaMFf3+jPgbIPPzF1d4iawPK63rfSEOdYDnAfx7D7YhZHMu6TVJp+h
	hp7Kc+eWdQO9oUhWeDZSg3Bd2Pfg2gSsM70YdMRziL37W0VQGRiz6iuC04yATqoOhTMd
	kf3Q==
X-Gm-Message-State: APjAAAX/jABHGe0tM276n51R+Y7WMyqP3El8Y0X7TxSSGYxEpwaT2kCp
	wbBM0FDHi+zr96zZHxPNOh1X5Q==
X-Received: by 2002:adf:f310:: with SMTP id i16mr12807097wro.291.1556208332919;
	Thu, 25 Apr 2019 09:05:32 -0700 (PDT)
Received: from [192.168.1.25] (abayonne-654-1-209-122.w109-222.abo.wanadoo.fr.
	[109.222.216.122]) by smtp.gmail.com with ESMTPSA id
	v14sm3027059wra.58.2019.04.25.09.05.29
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 09:05:31 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, yang.zhong@intel.com,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	pbonzini@redhat.com
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-9-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <6e0098e3-72e5-cb46-d06c-75eed7116ad7@redhat.com>
Date: Thu, 25 Apr 2019 18:05:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418180057.3593-9-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-QEMU-4.1 v5 08/29] hw/arm:
 Express dependencies of musicpal with Kconfig
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
X-TUID: Ef21kD/ftoJM

On 4/18/19 8:00 PM, Thomas Huth wrote:
> This patch is slightly based on earlier work by Ákos Kovács (i.e.
> his "hw/arm/Kconfig: Add ARM Kconfig" patch).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  default-configs/arm-softmmu.mak | 6 +-----
>  hw/arm/Kconfig                  | 5 +++++
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 7f94811ccb..0a4d293f8a 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -11,13 +11,13 @@ CONFIG_EXYNOS4=y
>  CONFIG_HIGHBANK=y
>  CONFIG_INTEGRATOR=y
>  CONFIG_FSL_IMX31=y
> +CONFIG_MUSICPAL=y
>  
>  CONFIG_VGA=y
>  CONFIG_NAND=y
>  CONFIG_ECC=y
>  CONFIG_SERIAL=y
>  CONFIG_MAX7310=y
> -CONFIG_WM8750=y
>  CONFIG_TWL92230=y
>  CONFIG_TSC2005=y
>  CONFIG_LM832X=y
> @@ -40,7 +40,6 @@ CONFIG_IMX_FEC=y
>  CONFIG_FTGMAC100=y
>  CONFIG_DS1338=y
>  CONFIG_PFLASH_CFI01=y
> -CONFIG_PFLASH_CFI02=y
>  CONFIG_MICRODRIVE=y
>  CONFIG_USB_MUSB=y
>  CONFIG_PLATFORM_BUS=y
> @@ -56,14 +55,12 @@ CONFIG_PL190=y
>  CONFIG_PL330=y
>  CONFIG_CADENCE=y
>  CONFIG_PXA2XX=y
> -CONFIG_BITBANG_I2C=y
>  CONFIG_FRAMEBUFFER=y
>  CONFIG_XILINX_SPIPS=y
>  CONFIG_ZYNQ_DEVCFG=y
>  
>  CONFIG_ARM11SCU=y
>  CONFIG_DIGIC=y
> -CONFIG_MARVELL_88W8618=y
>  CONFIG_OMAP=y
>  CONFIG_TSC210X=y
>  CONFIG_BLIZZARD=y
> @@ -137,7 +134,6 @@ CONFIG_XILINX_AXI=y
>  CONFIG_PCI_EXPRESS_DESIGNWARE=y
>  
>  CONFIG_STRONGARM=y
> -CONFIG_MUSICPAL=y
>  
>  # for realview and versatilepb
>  CONFIG_LSI_SCSI_PCI=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 9087b7d714..b9f3c3c232 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -46,7 +46,12 @@ config MAINSTONE
>  
>  config MUSICPAL
>      bool
> +    select BITBANG_I2C
> +    select MARVELL_88W8618
>      select PTIMER
> +    select PFLASH_CFI02
> +    select SERIAL
> +    select WM8750
>  
>  config NETDUINO2
>      bool
> 
