Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1954219wrx;
        Thu, 25 Apr 2019 08:54:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxnDq68IpejsH0Tcvwz70MAiUZOXOzF0fRIckIJAmfZsTKKCulPh4Sjv1bsvUOR7z+1UyxO
X-Received: by 2002:adf:b612:: with SMTP id f18mr487363wre.236.1556207692432;
        Thu, 25 Apr 2019 08:54:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556207692; cv=none;
        d=google.com; s=arc-20160816;
        b=zTF+1BmmxTCPAF4MSJ1qXHXc1YQu1PaF+8K/dhvfzzytIGrk7iOwPzt069pOgbOU9M
         Um13QGuAVld0AiATByizuSnbEqX1C7JhH7zRKzpwZ/7YysFCt4j5J/wTLVGkL68LoQ9w
         /X4R6+2s4wda3sP4/xw8adascQ+iaz+tRhUq505e3gp+g6PXs3gVqCq0CEfeF7JH3SSc
         kTS3jlbgv51JEiWPWuXQlh2SgKUEb7J9xTTiLiVJkxw5LIc+sdRQtvIxJpexzWbp46sG
         7SauIr6SG7UU9nCe8qjJwQR41AoRyWDTiX5bFv+nohS5fD3Vpy23o8unkaRd/Z7+IzbP
         qhnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=LohXC0yeWaYs5NCSykzb6Caf/iFjyRtIugeMKT3Ooyg=;
        b=dkfpiGz5qroJq5c8Xt6NWKruFzVgbT6zxIdrbj5OLldptQoGXckltIsYau9AMJYlKl
         Ve1yhKXkuiG+c1uyWFHeFrAusYO2JtQhJ45LrXMj3ZUpOrTinxT88zTDyPEqFcyyTeEV
         Pj8qaVP1qs6mmy2m1qmYXjLEGM0DrOFyq4xkXRVYGDuEWF83YW4L6SzciZwqQ+3GzIaB
         4XIqCWCVNdLdOUKJcz6qRzY29xR26N+HsqlFvRuORTDzb+nGEEKxxcql1p0fsWPRjexu
         g7FlVdnoL8fzC2eyflwxl9ntnQjD1YqWqWScbPo73HlLTL1Dh/rpiDlCRWs/HCaSBGF5
         DADg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8si15440482wml.44.2019.04.25.08.54.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Apr 2019 08:54:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59549 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJgi3-0003S5-DP
	for alex.bennee@linaro.org; Thu, 25 Apr 2019 11:54:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJghp-0003Qv-Dg
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 11:54:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJgho-00062Q-E2
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 11:54:37 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37315)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hJghk-0005vD-R6
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 11:54:32 -0400
Received: by mail-wm1-f68.google.com with SMTP id v14so11322537wmf.2
	for <qemu-arm@nongnu.org>; Thu, 25 Apr 2019 08:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=LohXC0yeWaYs5NCSykzb6Caf/iFjyRtIugeMKT3Ooyg=;
	b=a50LNP9vIiQgGRwHkrwWc8n0pW4hE5MTYHxlDvfQoFN4Yzhv34LBdGG4F3lv27epL1
	6VArYb0PqhKcklRW1e70c82vw8I3DylRQuGiTezhHyKgqiz0UB5au58XkLEq6PNHxTk0
	F8MZpO3L4v6hjOQKaC2+Yt/Aqb/asg2fD1v2HMhSLl38omeqkR6Pj+WSqbbhQNcKNMzG
	2XkvvqA5zxJ0Xg/eyycxthVWDg+ty0NaqCb71y4gUwKU/T476HwJ2HQAKbizuSRgpUWU
	cSGN1kdE7R9bj8n++QABX7dcYXTmG0PUMnsc54Pxs/Wh+KwvNvpITkKAMibe/rHR538i
	R+5A==
X-Gm-Message-State: APjAAAVKbjIcU/e2XxZhnPtURJ3K+C+R0/SITmQXx50vqklkdeM44hz1
	TsC1mqEqIVCB4IsdfsPOgHRFbg==
X-Received: by 2002:a1c:a5d0:: with SMTP id o199mr3917377wme.28.1556207671403; 
	Thu, 25 Apr 2019 08:54:31 -0700 (PDT)
Received: from [192.168.1.25] (abayonne-654-1-209-122.w109-222.abo.wanadoo.fr.
	[109.222.216.122]) by smtp.gmail.com with ESMTPSA id
	v14sm2984795wra.58.2019.04.25.08.54.29
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 08:54:30 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, yang.zhong@intel.com,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	pbonzini@redhat.com
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-21-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <bd069b29-2bf7-b468-fe91-d90a339ea1b1@redhat.com>
Date: Thu, 25 Apr 2019 17:54:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418180057.3593-21-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-QEMU-4.1 v5 20/29] hw/arm:
 Express dependencies of the raspi machines with Kconfig
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
X-TUID: e3hA1givev4i

On 4/18/19 8:00 PM, Thomas Huth wrote:
> Most of the code is directly controlled by the CONFIG_RASPI switch,
> so not much to add here additionally.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  default-configs/arm-softmmu.mak | 4 +---
>  hw/arm/Kconfig                  | 3 +++
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 31d31d3f4a..22bff20b32 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -31,15 +31,13 @@ CONFIG_COLLIE=y
>  CONFIG_ASPEED_SOC=y
>  CONFIG_NETDUINO2=y
>  CONFIG_MPS2=y
> +CONFIG_RASPI=y
>  
>  CONFIG_VGA=y
>  CONFIG_SSI_M25P80=y
>  CONFIG_IMX_FEC=y
>  
> -CONFIG_FRAMEBUFFER=y
> -
>  CONFIG_DIGIC=y
> -CONFIG_RASPI=y
>  CONFIG_NRF51_SOC=y
>  
>  CONFIG_FSL_IMX6=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 466b143fdf..e68a29ca2b 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -257,6 +257,9 @@ config ALLWINNER_A10
>  
>  config RASPI
>      bool
> +    select FRAMEBUFFER
> +    select PL011 # UART
> +    select SDHCI
>  
>  config STM32F205_SOC
>      bool
> 
