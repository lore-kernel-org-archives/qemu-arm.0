Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp460992njb;
        Thu, 4 Jul 2024 01:54:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU6ilF+otOTXbsmzobN3wzr9PPPAx66q9H5mwm3aMe8tSnqttV4tEtt/sb7vClCdhE/rWus4+nj+qN7U9Z3QV3nuhCs6895
X-Google-Smtp-Source: AGHT+IE+i8mMNWz9EvDfPX0Nd2S6b11JaZjdHVXObln55JsRjJT9e6waJUQ23oapa+jVPyrmU/Cu
X-Received: by 2002:a05:620a:854:b0:797:d9ab:8e5b with SMTP id af79cd13be357-79eee19860amr110806785a.27.1720083265770;
        Thu, 04 Jul 2024 01:54:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720083265; cv=none;
        d=google.com; s=arc-20160816;
        b=suJRZHvEN5q4fMLaReZTpBmiGkeKwDUf+dzcpqWuZHFpeWgT26LZbNNifdUZNwHWIj
         hrPc24pkzKu8FA2i9iillXzOe32QOpO88FOMd/VszGzkA1c4r9aUPbx+t3YqFiZBSf5E
         7V9jtS4U4npxrKThEm9Awbjd3a5IDEX6PRAQnOp59R5GqxWWx2vsiuw0+f1gtXs+YyHu
         FH8PyO2OZoDqHb3eTf0vKYFfqtLXbp+T2nQ89BE6McuFrF4mCMZWbSG0aN9FO9gcI97/
         GKvxXsg0gwHyjFrDnJ52cUMP+zyDyau/pnpNmwG4RqKGkw7pS07lSvGV2cvzT/gm8LHC
         gUlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=o5heRt7e4wPRp4X3vyS1ohifxep/lATrycj3Z9nJhYU=;
        fh=99LDCLNDIGyo70K5tizYz4Wx+QKxBdnC4BaKqLN7Z0w=;
        b=T+nUF0P+o5TlOBLeGvqqCn7m9d/BG2gUuDV8o8duSoIMm2Zmug8+LzYtAJ49od99Zf
         CilEr5F/Sd8M8ZA752BTF9xfL/TdtiKfiS9bSRhge6FEr6/tMZZeYj4/JpDrA7mVaBtd
         Q+4ARXFfGf+FN3/wIEkUtSkvwooIZmThNdEHyo/lx1zfWaJfxfPxs1gKgJp9ujbOpOc4
         0Zym3iGYioOJQm2UxhOOm+xg9nMAyqBoLi9yaZATpDFpFf3RXDwOvZk8wY2qgqf31vB/
         iHHC4TaDuAMKOZEUa061EOf+HHn/e5M6NfwH8gDJFRru+V8X5U3pvgKiu4Fx9R/+oXiW
         wlnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d692f06e7si1402742085a.252.2024.07.04.01.54.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2024 01:54:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPIDr-00013Z-4R; Thu, 04 Jul 2024 04:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=mgHy=OE=kaod.org=clg@ozlabs.org>)
 id 1sPIDp-000132-Qx; Thu, 04 Jul 2024 04:53:45 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=mgHy=OE=kaod.org=clg@ozlabs.org>)
 id 1sPIDj-0003Sk-4r; Thu, 04 Jul 2024 04:53:45 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4WF9RJ6QvNz4x1V;
 Thu,  4 Jul 2024 18:53:32 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WF9R96mxQz4wx6;
 Thu,  4 Jul 2024 18:53:25 +1000 (AEST)
Message-ID: <7c2a40f4-8ab2-4e44-a7f5-2f445e9b6d77@kaod.org>
Date: Thu, 4 Jul 2024 10:53:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] hw/net:ftgmac100: update memory region size to 64KB
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:Block layer core" <qemu-block@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240704082922.1464317-1-jamin_lin@aspeedtech.com>
 <20240704082922.1464317-2-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240704082922.1464317-2-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=mgHy=OE=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cNsJB/Dba1DV

On 7/4/24 10:29 AM, Jamin Lin wrote:
> According to the datasheet of ASPEED SOCs,
> one MAC controller owns 128KB of register space for AST2500.
> However, one MAC controller only owns 64KB of register space for AST2600
> and AST2700. It set the memory region size 128KB and it occupied another
> controllers Address Spaces.
> 
> Update one MAC controller memory region size to 0x1000
> because AST2500 did not use register spaces over than 64KB.
> 
> Introduce a new container region size to 0x1000 and its range
> is from 0 to 0xfff. This container is mapped a sub region
> for the current set of register.
> This sub region range is from 0 to 0xff.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/net/ftgmac100.c         | 11 ++++++++---
>   include/hw/net/ftgmac100.h |  4 ++++
>   2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
> index 25e4c0cd5b..9e1f12cd33 100644
> --- a/hw/net/ftgmac100.c
> +++ b/hw/net/ftgmac100.c
> @@ -1107,9 +1107,14 @@ static void ftgmac100_realize(DeviceState *dev, Error **errp)
>           s->rxdes0_edorr = FTGMAC100_RXDES0_EDORR;
>       }
>   
> -    memory_region_init_io(&s->iomem, OBJECT(dev), &ftgmac100_ops, s,
> -                          TYPE_FTGMAC100, 0x2000);
> -    sysbus_init_mmio(sbd, &s->iomem);
> +    memory_region_init(&s->iomem_container, OBJECT(s),
> +                       TYPE_FTGMAC100 ".container", FTGMAC100_MEM_SIZE);
> +    sysbus_init_mmio(sbd, &s->iomem_container);
> +
> +    memory_region_init_io(&s->iomem, OBJECT(s), &ftgmac100_ops, s,
> +                          TYPE_FTGMAC100 ".regs", FTGMAC100_REG_MEM_SIZE);
> +    memory_region_add_subregion(&s->iomem_container, 0x0, &s->iomem);
> +
>       sysbus_init_irq(sbd, &s->irq);
>       qemu_macaddr_default_if_unset(&s->conf.macaddr);
>   
> diff --git a/include/hw/net/ftgmac100.h b/include/hw/net/ftgmac100.h
> index 765d1538a4..269446e858 100644
> --- a/include/hw/net/ftgmac100.h
> +++ b/include/hw/net/ftgmac100.h
> @@ -14,6 +14,9 @@
>   #define TYPE_FTGMAC100 "ftgmac100"
>   OBJECT_DECLARE_SIMPLE_TYPE(FTGMAC100State, FTGMAC100)
>   
> +#define FTGMAC100_MEM_SIZE 0x1000
> +#define FTGMAC100_REG_MEM_SIZE 0x100
> +
>   #include "hw/sysbus.h"
>   #include "net/net.h"
>   
> @@ -30,6 +33,7 @@ struct FTGMAC100State {
>       NICState *nic;
>       NICConf conf;
>       qemu_irq irq;
> +    MemoryRegion iomem_container;
>       MemoryRegion iomem;
>   
>       uint8_t frame[FTGMAC100_MAX_FRAME_SIZE];

