Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1958486wrx;
        Thu, 25 Apr 2019 08:59:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx2Db4r17o/fF8oaQhT4a32axc0C3v42DkT/mzW3eZEqbo5jFDGrkcHeCcLp2IIcnUvkMB+
X-Received: by 2002:a1c:ef08:: with SMTP id n8mr4232561wmh.85.1556207952658;
        Thu, 25 Apr 2019 08:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556207952; cv=none;
        d=google.com; s=arc-20160816;
        b=IKIkxBONcs/+tJ49jdDEFqX056VDX4xNLoRM3tBxhD7iBQNFtd5VuF8IZOXQqDCgD9
         JgJcJELDRsffT1y81yO4WQceAcL2zqoOzp0JKQnMfKDNf76/gw3SSn506XaPQ0kDtLdg
         oKOGqdOSJQ002mM6UWibDs/PMEpuZDroOey96T0xu9MSZN6T8GGkNOOQZ/8sTgkzSiv2
         PRd1J38JtJ/Bmp5Oww9+nD8jvBIhSRy3dlxXe88y9pCKRXV6BoflkqRklG3iAKS3JGdv
         1wpmlw8IhTbBpv1N/IfbIcX6sj79YbGfWpdJsEI+cZRiP0ka0lE1vrMCEwtYt9zgCN0A
         xJhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=pEWvzxKrJwtzvLjDQ9cAayn3b/wqzcTdETdW+QzgY3Q=;
        b=D7FB8nnliFWU5W7TZjGKbREJ3/fo21357oGdQzbNw17//CXXEWYEpGw5mpgXAi9pnK
         mbruvLlBKT/VREfc1oR0pmzrQ8y2BKp12ZYSMYLDC++c5TkiR8hqbY+ae3EbEtoNJAvQ
         jEXYj5Y1OkkTZSdQGcGdGnbpvFhQZfQ7WSGuvltmCXcrX6JNitFYgtNoH+EnWod9eCYX
         ZaL6gagWWXgA5AqvuE4PYN/bvDZYyvSIN2qjmaIpkqIA8q963/B4Z2vwgCYL9aa8+k3k
         wWd+xpe3Dez8bGRH5095zRo734qxXksKN94UZc+hQX3ELyvqQ1inwC67TEKqWgy2TGr8
         Uxfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13si5776570wmh.18.2019.04.25.08.59.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Apr 2019 08:59:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59631 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJgmF-0005HG-Pe
	for alex.bennee@linaro.org; Thu, 25 Apr 2019 11:59:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJgm2-0005FS-Pg
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 11:58:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJglz-0002WP-Vk
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 11:58:58 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33833)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hJgls-0002OG-Sb
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 11:58:49 -0400
Received: by mail-wr1-f67.google.com with SMTP id c6so192644wrm.1
	for <qemu-arm@nongnu.org>; Thu, 25 Apr 2019 08:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pEWvzxKrJwtzvLjDQ9cAayn3b/wqzcTdETdW+QzgY3Q=;
	b=O2aWqfA/EFuIH3ovGF3OsWAZc7u+W+Afl9UwNgdTdlYXdh4JRMr42OLOwsWGc4qRd1
	mOoK37k+wRkLFIhj/1Gz4PelU4ZLrfojobSFMeEwlnp+JwUcSkjoBAZaZbAeiOTOTgD3
	f/ZwvD0/FXKjm7QcUHrVGohc4siaDgdv9Y8tso8793tnTTJkOXvhxeaZqIXUKMhZ5+zz
	TnUiAN/KvKWtRRqer13JDeGQMdxh+dpsuRvrrK/CuXgt1wvqHzbuhyTMG6r1x3QVNwvG
	RUmI7lM9pR0Hq/pjs8yOTU3okImEpPk8LPI++lR0YlCMlfjlkULxU9OZU5x2Cg0DH10f
	yo6Q==
X-Gm-Message-State: APjAAAViW4rgtVxGC0rM6zOzeheoiHOYPVgcHeCL4jFrfb/BUthWCvTg
	ng17qa4Yus900lPATg0jF7YWbQ==
X-Received: by 2002:a5d:4805:: with SMTP id l5mr5248385wrq.279.1556207927111; 
	Thu, 25 Apr 2019 08:58:47 -0700 (PDT)
Received: from [192.168.1.25] (abayonne-654-1-209-122.w109-222.abo.wanadoo.fr.
	[109.222.216.122]) by smtp.gmail.com with ESMTPSA id
	192sm31407411wme.13.2019.04.25.08.58.45
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 08:58:46 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, yang.zhong@intel.com,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	pbonzini@redhat.com
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-15-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <46bcb836-b4db-db2f-26a3-c2827c95e940@redhat.com>
Date: Thu, 25 Apr 2019 17:58:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418180057.3593-15-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-QEMU-4.1 v5 14/29] hw/arm:
 Express dependencies of collie with Kconfig
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
X-TUID: 0Ofr0A6lgdR3

On 4/18/19 8:00 PM, Thomas Huth wrote:
> Add Kconfig dependencies for the Strongarm collie machine.
> This patch is based on earlier work by Ákos Kovács (i.e.
> his "hw/arm/Kconfig: Add ARM Kconfig" patch).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  default-configs/arm-softmmu.mak | 3 +--
>  hw/arm/Kconfig                  | 7 +++++++
>  hw/arm/Makefile.objs            | 2 +-
>  3 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index af78e7c892..25e8f717ac 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -25,6 +25,7 @@ CONFIG_GUMSTIX=y
>  CONFIG_SPITZ=y
>  CONFIG_TOSA=y
>  CONFIG_Z2=y
> +CONFIG_COLLIE=y
>  
>  CONFIG_VGA=y
>  CONFIG_TMP421=y
> @@ -97,5 +98,3 @@ CONFIG_GPIO_KEY=y
>  CONFIG_MSF2=y
>  CONFIG_FW_CFG_DMA=y
>  CONFIG_PCI_EXPRESS_DESIGNWARE=y
> -
> -CONFIG_STRONGARM=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 785e383411..325133c129 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -168,6 +168,13 @@ config STELLARIS
>  
>  config STRONGARM
>      bool
> +    select PXA2XX
> +
> +config COLLIE
> +    bool
> +    select PFLASH_CFI01
> +    select ZAURUS  # scoop
> +    select STRONGARM
>  
>  config SX1
>      bool
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index 00328d1b0b..729e711b87 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -17,7 +17,7 @@ obj-$(CONFIG_TOSA) += tosa.o
>  obj-$(CONFIG_Z2) += z2.o
>  obj-$(CONFIG_REALVIEW) += realview.o
>  obj-$(CONFIG_STELLARIS) += stellaris.o
> -obj-$(CONFIG_STRONGARM) += collie.o
> +obj-$(CONFIG_COLLIE) += collie.o
>  obj-$(CONFIG_VERSATILE) += versatilepb.o
>  obj-$(CONFIG_VEXPRESS) += vexpress.o
>  obj-$(CONFIG_ZYNQ) += xilinx_zynq.o
> 
