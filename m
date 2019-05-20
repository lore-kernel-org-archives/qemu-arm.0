Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp445180wrg;
        Mon, 20 May 2019 10:39:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwkeaRofPvqpvx2m8QXaNvRGWEML0v4eyji/5yEvP70QLMJ/S8fsHAeUgiaruNqHr2+30Kb
X-Received: by 2002:a17:906:58d:: with SMTP id 13mr44011409ejn.36.1558373972483;
        Mon, 20 May 2019 10:39:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558373972; cv=none;
        d=google.com; s=arc-20160816;
        b=gd7qVqfKZs5tOhufOKQPUkLPdZ2yjj3+7r7qwCkykmh3aEKOtywiHrVVZMDGAXUlvK
         qb9jv3Qwfd9X/fuS4lFpb/vuF/RlaeDKPMNU2EDTYf4ypKK0Q+hfzaJ50wb2JovqlOUZ
         oa1LuBZjMmzZGu+gFWauLRdvbMeKp2H5KwLsTPT4vK9ZSRZthRQP86z2d7SvpUYwX5yB
         wqsrqTR/l2mhZPjxxqaCdL0NFfJMRgWR2JsdRNrc69p3SfvbYclLHxKHrQNBYLpXkhd5
         /oxQ/LbE2uujPMqCD7vACAK3dgEFptc+gVBLSOQWpE2Jr31/D9BOYcb8A8Du0GGZye4z
         K6gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=Z3bIzp7bNN8LqmaeDZr/a8qvIyz/8zh6J2BdewSw5zQ=;
        b=eAqbI+ctDZcrooFw1Xq/GpOo4XhiM4kUpXda5evjkyqt1BjNYZqh4Idb+OZmKP5eSD
         28+BaCKNbVZyOqiQm2n918RC/h2cXz8Fy5VBEg8LNYTV6FAEABQU40Y6L6uz3E3KX/cA
         oVyZnaHnNkj8EVHLQJs/BrYcCDJ7olkM+qYdHVrpqExcu1B/Dy/kLOSGdg5M6Px8Fc/+
         i9Ar5dwtRjAebMAsYjExwG/H6t4j65iJBfOyyolrJntrflpuSXInqG8VeWwAbhAS3uco
         b5q6Cuj2UgheQng45k8EuKh5HOyqWczyFvadTFtnBB3v27CUqXlCbZeM/zb+KyljvJbv
         ny+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w16si2728842edb.109.2019.05.20.10.39.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 10:39:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39357 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSmG3-0005Ij-5y
	for alex.bennee@linaro.org; Mon, 20 May 2019 13:39:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hSm1d-0001qo-3z
	for qemu-arm@nongnu.org; Mon, 20 May 2019 13:24:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hSm1b-0005Pg-Lw
	for qemu-arm@nongnu.org; Mon, 20 May 2019 13:24:36 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54989)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hSm1b-0005Ol-Fv
	for qemu-arm@nongnu.org; Mon, 20 May 2019 13:24:35 -0400
Received: by mail-wm1-f66.google.com with SMTP id i3so159129wml.4
	for <qemu-arm@nongnu.org>; Mon, 20 May 2019 10:24:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Z3bIzp7bNN8LqmaeDZr/a8qvIyz/8zh6J2BdewSw5zQ=;
	b=kpZToFtdjqolY/g6woWPk5KPPh0Cni0mM9oTfLovCOakDIIz8K0p26jiD7ZYjvHbWd
	hE+y8Z9SlWUPtUwOxr08BRDiQGKCLNb7eCO+rxpmPboiotLhNB0rofUAzCuje91CW0jk
	etsEyfIYXGNGDzNB9Sfp2AZXH5T0z0Bjv3B6Wr1kYqp7KTBTc4eOwffua/7K45E2MYkU
	qA2+wWKjjinCUf6ZlbN/xrcJCYsqObB4yNkmrn7q3zzgDdyGJ0KZvOG7rJnKuinFrBpC
	6AyrX4hfunbqZtFcudgmQiYvLU0n9Rq3HBadWsV3q3o9TqRJFHNEj3ahtbhFPZtHbOYr
	cloQ==
X-Gm-Message-State: APjAAAV8Yg6rNHYnJHDmWqVVzo46Y2uC4MwHW3DJJxs8b/wpb4E6nONN
	R8X1VunUx93VkAoZ4/jxsY8gtQ==
X-Received: by 2002:a1c:2245:: with SMTP id i66mr166605wmi.19.1558373073452;
	Mon, 20 May 2019 10:24:33 -0700 (PDT)
Received: from [192.168.1.43] (228.red-83-52-173.dynamicip.rima-tde.net.
	[83.52.173.228]) by smtp.gmail.com with ESMTPSA id
	e8sm42662114wrc.34.2019.05.20.10.24.32
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 10:24:33 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190520162809.2677-1-peter.maydell@linaro.org>
	<20190520162809.2677-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <dc232ab2-5a8d-1df7-074e-0e7eed1b2960@redhat.com>
Date: Mon, 20 May 2019 19:24:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190520162809.2677-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/4] hw/intc/arm_gicv3: Fix
 decoding of ID register range
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8G5MH4122GZc

On 5/20/19 6:28 PM, Peter Maydell wrote:
> The GIC ID registers cover an area 0x30 bytes in size
> (12 registers, 4 bytes each). We were incorrectly decoding
> only the first 0x20 bytes.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

"8.1.13 Identification registers" OK.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/intc/arm_gicv3_dist.c   | 2 +-
>  hw/intc/arm_gicv3_redist.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
> index 53c55c57291..335386ff3ac 100644
> --- a/hw/intc/arm_gicv3_dist.c
> +++ b/hw/intc/arm_gicv3_dist.c
> @@ -533,7 +533,7 @@ static MemTxResult gicd_readl(GICv3State *s, hwaddr offset,
>          }
>          return MEMTX_OK;
>      }
> -    case GICD_IDREGS ... GICD_IDREGS + 0x1f:
> +    case GICD_IDREGS ... GICD_IDREGS + 0x2f:
>          /* ID registers */
>          *data = gicv3_idreg(offset - GICD_IDREGS);
>          return MEMTX_OK;
> diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> index 3b0ba6de1ab..9bb11423382 100644
> --- a/hw/intc/arm_gicv3_redist.c
> +++ b/hw/intc/arm_gicv3_redist.c
> @@ -233,7 +233,7 @@ static MemTxResult gicr_readl(GICv3CPUState *cs, hwaddr offset,
>          }
>          *data = cs->gicr_nsacr;
>          return MEMTX_OK;
> -    case GICR_IDREGS ... GICR_IDREGS + 0x1f:
> +    case GICR_IDREGS ... GICR_IDREGS + 0x2f:
>          *data = gicv3_idreg(offset - GICR_IDREGS);
>          return MEMTX_OK;
>      default:
> 
