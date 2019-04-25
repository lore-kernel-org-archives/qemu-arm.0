Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1845565wrx;
        Thu, 25 Apr 2019 07:15:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz9D8hAXXumh560QG7R+WyNEXd5gvOUVdIkgHZTK4rrj5WDGXtLY7l+uRLqaLRxxQ+c8XdR
X-Received: by 2002:adf:ec09:: with SMTP id x9mr27190684wrn.187.1556201711997;
        Thu, 25 Apr 2019 07:15:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556201711; cv=none;
        d=google.com; s=arc-20160816;
        b=bYJI6StPOH8zwpmzc72Tc2kZWPkYozsNx+L9T7AC5uP7U+J4wBDJSDnM/Ir/zfjk3d
         c/Auu7ZNCY8TxMALfJzhGWgjoCWew59ZLXXdLofCGNVi1C1snINIxtfa1/TwzcqF7fSS
         7GMb3l2UZfah2wqG99YsBU+Q96QVUclLBJRgafcdXnVheCLa+ztuMTSB3WT6Mv0tlXa2
         dFfDZNjEljVFZlrDt/qqIl38H5JQFHTUeZfOUtFIeqdHPrI5WO/eOndZPloe/LkKCZR2
         d8RRCmZULEYnQ5kwYeJkBpEkRkEermbkXx4IQ3K3SaD4INxGLXXM+3R/+j6mypT6k0lz
         bspg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=rUKdnC/3cE2qM1D8mJmUw2ECG6CWGutrarsfOlrkBuw=;
        b=ZU2WzEjOYu2iSpsw1O4/36o8IThD0T0lq8Myer5WcQPdbQCOcRP22d63cOFZ0wu77M
         hlQvLcZDV9TSYlDbeANnMx532y1v+7pRfUVWHaRbdKpQJnvCWBIY7eTvuN54F2ovxqID
         fCWlayOlkgytJk1GCRIe6unNdprdW20n6Siks7VFwbDOJXjGW3Ryf39+xdJbWVC12JOC
         WTh8oakXl2eW0764tvWOwbGL/wHvAR/wzVPd5UNKOWz2GsHa/6mXLRhvoZbE5T51rnfz
         nHHvUTaFYDOhsU3q2tMOFh2LMpY35AuDfvo+Mof7jcE4AcfIv51WHT2oMxV5WUojBODo
         pmzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f26si15314512wmj.97.2019.04.25.07.15.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Apr 2019 07:15:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:58305 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJf9b-0005oe-37
	for alex.bennee@linaro.org; Thu, 25 Apr 2019 10:15:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47589)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJf9Q-0005nk-La
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 10:15:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJf9P-0005Op-Dl
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 10:15:00 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43348)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hJf9P-0005O4-7U
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 10:14:59 -0400
Received: by mail-wr1-f66.google.com with SMTP id a12so7305898wrq.10
	for <qemu-arm@nongnu.org>; Thu, 25 Apr 2019 07:14:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=rUKdnC/3cE2qM1D8mJmUw2ECG6CWGutrarsfOlrkBuw=;
	b=TZNv4+LYP1lUbcDH1v6b7UdYWIiEwBxIUQ4leyAbSufV6eRvHYbadcNqzrhn9YJKbn
	MVNn65vKcipFQTFuYzCnh5L3wRiMQoMqAZS8PBBN4XEuNhSAhUvNv/GuTI1lvEN5Vudz
	m10BOSVjE5fjH1O6rSCYZjpap9GkbBFxKh45nyAfA/ewxV89c57L6f8UdLoirfWXDLsS
	28/62F2+tInFRsAEmBRomrvkCSJhUYxjG3eUVPjWAu/pTyO5mainDyuvQ1mYTHuEYU70
	VDJDmO0BQ59KR00Sbdp4oTMstc88IhYedf69A8+75qNc3GVoNWc/Yqfqsth7EGxR+TWE
	v4Tw==
X-Gm-Message-State: APjAAAVoV9zY8wYi1T7XUTmpoBofK7yvUSOw/GCwoyqjpY7XgjZ5fZ6V
	lvngxToWg3bLxjjJW2fWWDvm8Q==
X-Received: by 2002:adf:b64e:: with SMTP id i14mr3434590wre.72.1556201698230; 
	Thu, 25 Apr 2019 07:14:58 -0700 (PDT)
Received: from [192.168.1.25] (abayonne-654-1-209-122.w109-222.abo.wanadoo.fr.
	[109.222.216.122]) by smtp.gmail.com with ESMTPSA id
	t9sm26534187wra.71.2019.04.25.07.14.54
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 07:14:57 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, yang.zhong@intel.com,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	pbonzini@redhat.com
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-7-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <cf39902b-267a-ea7e-c513-fa0c9abf639c@redhat.com>
Date: Thu, 25 Apr 2019 16:14:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418180057.3593-7-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-QEMU-4.1 v5 06/29] hw/arm:
 Express dependencies of integratorcp with Kconfig
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
X-TUID: BPLdHR1+kqoe

Hi Thomas,

On 4/18/19 8:00 PM, Thomas Huth wrote:
> This patch is slightly based on earlier work by Ákos Kovács (i.e.
> his "hw/arm/Kconfig: Add ARM Kconfig" patch).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  default-configs/arm-softmmu.mak | 8 +-------
>  hw/arm/Kconfig                  | 8 ++++++++
>  hw/display/Kconfig              | 1 +
>  3 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 50a4be3cad..6195b75f48 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -9,6 +9,7 @@ CONFIG_PCI_TESTDEV=y
>  
>  CONFIG_EXYNOS4=y
>  CONFIG_HIGHBANK=y
> +CONFIG_INTEGRATOR=y
>  
>  CONFIG_VGA=y
>  CONFIG_NAND=y
> @@ -33,7 +34,6 @@ CONFIG_ADS7846=y
>  CONFIG_MAX111X=y
>  CONFIG_SSI_SD=y
>  CONFIG_SSI_M25P80=y
> -CONFIG_SMC91C111=y
>  CONFIG_ALLWINNER_EMAC=y
>  CONFIG_IMX_FEC=y
>  CONFIG_FTGMAC100=y
> @@ -50,10 +50,7 @@ CONFIG_ARM11MPCORE=y
>  CONFIG_NETDUINO2=y
>  
>  CONFIG_PL041=y
> -CONFIG_PL050=y

You remove this device but it is used by the realview/versatile/vexpress
(you add it to these machines later in patch 11).

>  CONFIG_PL080=y
> -CONFIG_PL110=y

Ditto,

> -CONFIG_PL181=y

Ditto.

>  CONFIG_PL190=y
>  CONFIG_PL330=y
>  CONFIG_CADENCE=y
> @@ -113,9 +110,6 @@ CONFIG_VERSATILE_I2C=y
>  CONFIG_PCI_EXPRESS=y
>  CONFIG_PCI_EXPRESS_GENERIC_BRIDGE=y
>  
> -CONFIG_INTEGRATOR=y
> -CONFIG_INTEGRATOR_DEBUG=y
> -
>  CONFIG_ALLWINNER_A10_PIT=y
>  CONFIG_ALLWINNER_A10_PIC=y
>  CONFIG_ALLWINNER_A10=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 0ba377ac18..ad3b1f9b40 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -32,6 +32,14 @@ config HIGHBANK
>  
>  config INTEGRATOR
>      bool
> +    select ARM_TIMER
> +    select INTEGRATOR_DEBUG
> +    select PL011 # UART
> +    select PL031 # RTC
> +    select PL050 # keyboard/mouse
> +    select PL110 # pl111 LCD controller
> +    select PL181 # display
> +    select SMC91C111
>  
>  config MAINSTONE
>      bool
> diff --git a/hw/display/Kconfig b/hw/display/Kconfig
> index 72be57a403..a11815c9af 100644
> --- a/hw/display/Kconfig
> +++ b/hw/display/Kconfig
> @@ -21,6 +21,7 @@ config JAZZ_LED
>  
>  config PL110
>      bool
> +    select FRAMEBUFFER
>  
>  config SII9022
>      bool
> 
