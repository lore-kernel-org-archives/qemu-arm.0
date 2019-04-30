Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4434698wrh;
        Tue, 30 Apr 2019 01:03:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwBJ8rCiP5MAOCpaaD8pT3QtT0MO2NyAet5YFG4OXXKTooY6YPLcsp3Q3mtXkSN9ZgKBkqO
X-Received: by 2002:a1c:f910:: with SMTP id x16mr2117975wmh.114.1556611429149;
        Tue, 30 Apr 2019 01:03:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556611429; cv=none;
        d=google.com; s=arc-20160816;
        b=a+ONMd574OrvSuZ1/nlHb35JsZrCsPXX394E4XGo9mEhhR/yQFn9zCgMqeGkNFmQZM
         duztJJv43fnqSTDjB6210XFKGjyU8TDbZX1S0uBM3eH5KEdN6P8hjbR8dNUhqqqfr/12
         adkrRZVAWZjmq7yGEBfyQeRp9bJc5CAbny0j2K6s76KBIyF8fbI4ESjKMWOL3vcYS6eo
         xqYjDe9fs8gncTKNSaSgfp8SjjCNioCHcgsP5GmBRVH8lGkApC4InjFX9aj85Z891/AO
         vuBXxKkW00vbsf57Aa4FsPt2SAW+WTn5IbVzuxRgw7NqezbMpZsxZHchr+OWZSqaCq2r
         aiug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=aMlaK8oo+b1EkNynelRQjG176jij1j2U61jeW1rlgm4=;
        b=GS6qyCaVTZJhoHWIU0zww8OnEqTdiYQjGBrD/2D7suF65b7rzfHfytzZdcpW5IvLCx
         XPjLiBb5iycm2ywO8kns61UKzR3e/enV0NM42JQlHun4x8BLZe4dxPXXjNDBwRrBLJ1G
         P8Er17pUtozvc/tHsQghrJOS5h6PeHESqgkroHWqtuXwNq6LxtB0szf86Hwwt1YURIsh
         wt1+tnrHHrv53ibvLZgPHaC9w4C0PqVXM+a11DVqCg1ZjKIt+4uq+ECa5OOdo+Gg50Od
         yz7ygn1zbm9/t/rRCIRynsq3INy77qNxZPB1K40pRwXNylmfMJYoDwySgHPxxmYqXEWG
         Vmog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i64si1109608wmi.21.2019.04.30.01.03.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 01:03:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41171 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLNjw-0003mr-AD
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 04:03:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38684)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hLNjk-0003kM-TD
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 04:03:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hLNji-0002lR-L0
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 04:03:36 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39146)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hLNjh-0002kV-NT
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 04:03:34 -0400
Received: by mail-wr1-f65.google.com with SMTP id a9so19856523wrp.6
	for <qemu-arm@nongnu.org>; Tue, 30 Apr 2019 01:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=aMlaK8oo+b1EkNynelRQjG176jij1j2U61jeW1rlgm4=;
	b=mQQ/MHEBvv/q6SRVFhHffIjLwKj4rGm6uhW0MAQMAZeirua2Wuu5cAN6MI8RyR8T0L
	I+GP8AW+tXjIZCWJxf82FOKbSjI0feDaM9pzRLfh5zL4q0fE3QpUmdgLOJWDq3saicdB
	IMPxzItlXpJJeuQTdoKVzFoqsZ4sYAlyz1TsUWKAqV0RpD1McUKgTxL6O//IXU5xLRli
	u2i2YRJjSrrDxr/GwELarakhfd820rcE50dcVRc/3UHBBEkVKnYZyOYGREM8D9kPh0BI
	5L5azyiJDmttPcl/GkwVR46zcFNf2t30aukjvQpHEcJfIBZCsUAuiu/IXfYeh2GMZamH
	yc9w==
X-Gm-Message-State: APjAAAWGJjtTZvpspO3UZO7i36urc/LXYg4MxfcX1o6FC/NlrZ3xNK7w
	8kkTxYfpirvOF+21luZRQZmTyw==
X-Received: by 2002:adf:ee01:: with SMTP id y1mr44560327wrn.51.1556611410777; 
	Tue, 30 Apr 2019 01:03:30 -0700 (PDT)
Received: from [192.168.1.37] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	192sm2544533wme.13.2019.04.30.01.03.28
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Apr 2019 01:03:29 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, yang.zhong@intel.com,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	pbonzini@redhat.com
References: <20190430071405.16714-1-thuth@redhat.com>
	<20190430071405.16714-12-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <8b16e1b6-08a5-5f7a-1a59-f37679cd1fff@redhat.com>
Date: Tue, 30 Apr 2019 10:03:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430071405.16714-12-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 11/30] hw/arm: Express
 dependencies of stellaris with Kconfig
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
Cc: Rob Herring <robh@kernel.org>, Peter Chubb <peter.chubb@nicta.com.au>,
	Philippe Mathieu-Daude <f4bug@amsat.org>, qemu-block@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Cedric Le Goater <clg@kaod.org>, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Gerd Hoffmann <kraxel@redhat.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>, John Snow <jsnow@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iScfk1u3bNfM

On 4/30/19 9:13 AM, Thomas Huth wrote:
> This patch is slightly based on earlier work by Ákos Kovács (i.e.
> his "hw/arm/Kconfig: Add ARM Kconfig" patch).
> 
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  default-configs/arm-softmmu.mak |  7 +------
>  hw/arm/Kconfig                  | 11 +++++++++++
>  2 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index b7ed3c530b..3f82d635e4 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -16,6 +16,7 @@ CONFIG_MUSCA=y
>  CONFIG_CHEETAH=y
>  CONFIG_SX1=y
>  CONFIG_NSERIES=y
> +CONFIG_STELLARIS=y
>  
>  CONFIG_VGA=y
>  CONFIG_NAND=y
> @@ -24,16 +25,10 @@ CONFIG_SERIAL=y
>  CONFIG_MAX7310=y
>  CONFIG_TMP421=y
>  CONFIG_PCA9552=y
> -CONFIG_STELLARIS=y
> -CONFIG_STELLARIS_INPUT=y
> -CONFIG_STELLARIS_ENET=y
> -CONFIG_SSD0303=y
> -CONFIG_SSD0323=y
>  CONFIG_DDC=y
>  CONFIG_SII9022=y
>  CONFIG_ADS7846=y
>  CONFIG_MAX111X=y
> -CONFIG_SSI_SD=y
>  CONFIG_SSI_M25P80=y
>  CONFIG_ALLWINNER_EMAC=y
>  CONFIG_IMX_FEC=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 71126254ff..e5a8ae5ef9 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -91,6 +91,17 @@ config REALVIEW
>  
>  config STELLARIS
>      bool
> +    select ARM_V7M
> +    select CMSDK_APB_WATCHDOG
> +    select I2C
> +    select PL011 # UART
> +    select PL022 # Serial port
> +    select PL061 # GPIO
> +    select SSD0303 # OLED display
> +    select SSD0323 # OLED display
> +    select SSI_SD
> +    select STELLARIS_INPUT
> +    select STELLARIS_ENET # ethernet
>  
>  config STRONGARM
>      bool
> 
