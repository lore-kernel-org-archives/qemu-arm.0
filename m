Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1988559wrx;
        Thu, 25 Apr 2019 09:25:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyjoLKGV4g8aWtnMLjfeGJ9SjN/H3BZDcyOJ87s2uA6DjtY3V8bVa1LyocQDmQpIWG1+7Gu
X-Received: by 2002:adf:efcf:: with SMTP id i15mr28043228wrp.133.1556209512978;
        Thu, 25 Apr 2019 09:25:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556209512; cv=none;
        d=google.com; s=arc-20160816;
        b=GB1EQpG5SupRqX8Shyb4LF0O8xrQGAN0TssBOX0lnwFVfXmspulUQDzGeTfHl1zc4C
         ljmm/HGANdLrV8w3/VBBjd8lxUPVi5fqBI8YWpzMv3af4opgxByqQod+OuCKDbp51EWS
         PtOOnxGFE+79QmtaMUhH9fqsMUTv2oertNy7tJArU5FHt7XPIO6Aj4erpEzR2PNHPDdc
         NWw6oK4zhC5KcUN7gm9ldZKJiwQfMnLStg54fRiVeZm8qc0iRx4dUjviAvkKmQTwC7vV
         zwVuZ+ikj/1KYlFVfiPAgeMSKFxKOVi6ZiV9GOD2RTvFPikn0M5FNfX++0g9jlXTs1J2
         hTDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=Yirb3BB0GvqyFLEMdufU+A6oW4jk59sdATnvk/Bs9kA=;
        b=VB55ZcfejwCFWlmBEJ7eg6v70VhPBD2s6ts1aihR1n1Mw7d3svQgcrmWD31T+iCqXM
         iz1Ucld8VUi163D0FJplCxkfL9Q05fUdyA06GGaCF0PwCDK+tyzH6MsM1pL2kJuEol4a
         UMX55INmBUc/t6OLKJbP1oemMgaazwL+gWH05bnHAfSdSgwzKQx97nNevo/PsfEMnYPW
         OX0cQFl2OADbRCAVFNt7nqXs8fNgQUw3rQ3ihKkjaTqBj823E4NnIBrN0acOAs1n5d7F
         O30JqiiWrF5juRcsk+6P26i+C/WpnZzqZNk6tXDmQo67gMR10PSRzUBq/A6fZuO81JFo
         bajA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5si16596024wrd.183.2019.04.25.09.25.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Apr 2019 09:25:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:60327 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJhBQ-0008L0-3N
	for alex.bennee@linaro.org; Thu, 25 Apr 2019 12:25:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJhAR-0007dG-EW
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 12:24:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJhAP-0007vA-H6
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 12:24:11 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45569)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hJhAN-0007lQ-Ge
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 12:24:09 -0400
Received: by mail-wr1-f66.google.com with SMTP id s15so202312wra.12
	for <qemu-arm@nongnu.org>; Thu, 25 Apr 2019 09:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Yirb3BB0GvqyFLEMdufU+A6oW4jk59sdATnvk/Bs9kA=;
	b=lyb2XJtb3nxbW+Qw5SoFrLx+T5mnus6dxN18dkm8SJzw8gUCzaAB0Vaq72BQ6PX4bS
	kMacEvKkUU9Mbdy5laZ8yNpmxIcTfPmAKPvZDlXZ0c01evA842cIW4KEcA3VS/IMf4PW
	Idtedv5hNHGoTr7HGGuT3yg4fSZ8vMgPo+nWAtpHrSymNVpTdg6ZKJaxdsj5ufaZy7Qd
	mdxLT+A/qAnSdwtr5fUNxCMVwzc3d2nKAS98DZPD8bZ7NmbeJwigcsMCYjIpiscZJZY/
	hVxq8TMK2Ro7KP5D7w4ruJ0uc0vZ9xqoDHecXFJ7rwVoTxtYdIp9gTgO5VBE8bmCV1y/
	wqQA==
X-Gm-Message-State: APjAAAXu80UkEhu+KC2cLBpak0DmI2nrFImcdPbc5CrLz8CENtCeB/Tn
	Y/g2V5mKJJFbkcTvny1ZIdtdiw==
X-Received: by 2002:adf:fc09:: with SMTP id i9mr8247795wrr.261.1556209436174; 
	Thu, 25 Apr 2019 09:23:56 -0700 (PDT)
Received: from [192.168.1.25] (abayonne-654-1-209-122.w109-222.abo.wanadoo.fr.
	[109.222.216.122]) by smtp.gmail.com with ESMTPSA id
	j9sm24345731wrr.93.2019.04.25.09.23.52
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 09:23:55 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, yang.zhong@intel.com,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	pbonzini@redhat.com
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-27-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <06ddd0d3-c036-f9dc-fc12-041a674a7808@redhat.com>
Date: Thu, 25 Apr 2019 18:23:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418180057.3593-27-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-QEMU-4.1 v5 26/29] hw/arm:
 Express dependencies of the ZynqMP zcu102 machine with Kconfig
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
X-TUID: NAr7ZOJW9lR+

On 4/18/19 8:00 PM, Thomas Huth wrote:
> This cleans up most settings in default-configs/aarch64-softmmu.mak.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  default-configs/aarch64-softmmu.mak |  4 ----
>  hw/arm/Kconfig                      | 11 +++++++++++
>  hw/display/Kconfig                  |  1 +
>  3 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarch64-softmmu.mak
> index 4ea9add003..3a4b15e7e8 100644
> --- a/default-configs/aarch64-softmmu.mak
> +++ b/default-configs/aarch64-softmmu.mak
> @@ -3,10 +3,6 @@
>  # We support all the 32 bit boards so need all their config
>  include arm-softmmu.mak
>  
> -CONFIG_AUX=y
> -CONFIG_DDC=y
> -CONFIG_DPCD=y
> -CONFIG_XLNX_ZYNQMP=y
>  CONFIG_XLNX_ZYNQMP_ARM=y
>  CONFIG_XLNX_VERSAL=y
>  CONFIG_ARM_SMMUV3=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 708eae19e5..32e4cc50e5 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -277,6 +277,17 @@ config STM32F205_SOC
>  
>  config XLNX_ZYNQMP_ARM
>      bool
> +    select AHCI
> +    select ARM_GIC
> +    select CADENCE
> +    select DDC
> +    select DPCD
> +    select SDHCI
> +    select SSI
> +    select SSI_M25P80
> +    select XILINX_AXI
> +    select XILINX_SPIPS
> +    select XLNX_ZYNQMP
>  
>  config XLNX_VERSAL
>      bool
> diff --git a/hw/display/Kconfig b/hw/display/Kconfig
> index 0577e68c8e..bb95f8d6a4 100644
> --- a/hw/display/Kconfig
> +++ b/hw/display/Kconfig
> @@ -108,6 +108,7 @@ config VIRTIO_VGA
>  
>  config DPCD
>      bool
> +    select AUX
>  
>  config ATI_VGA
>      bool
> 
