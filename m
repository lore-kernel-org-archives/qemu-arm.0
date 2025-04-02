Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3284858njd;
        Wed, 2 Apr 2025 00:46:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWLZOXaAAoFQIZ6mRZRWzDXKe5ufDzYG2PYI6WsXCKI20XRu0OEeKqxIuFqZxV3FPqF3MUjVNMX49oJfA==@linaro.org
X-Google-Smtp-Source: AGHT+IHo5o+Up473N7A7ipe33fWHAAjZmv4XpDxd1InmmhR+AKBBF1Ga2rg0t8qLS2O3va0KC6db
X-Received: by 2002:a05:6214:2508:b0:6ed:1651:e8dc with SMTP id 6a1803df08f44-6eed5fc8470mr240907236d6.11.1743580012673;
        Wed, 02 Apr 2025 00:46:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743580012; cv=none;
        d=google.com; s=arc-20240605;
        b=ARx61e8CCtmt9Q929A+BfwyQChuRy3HEXTO8Uxf3IGqWzb5PhYAw97nJoCKohpm9lk
         zgiEuSgzQ2tV9wnCrTRQZmaj9zj8gjyGqk3ZyLY8rQQjKk/Mo9ua/IBHNt3LV8mh3h3+
         JPdXGWgjGmhpyYqycO6NEyErurrLg1XMNX1nqLlTFGiPmElu1QWoikdvFWB6klUI+GcJ
         j+kXxFxCVlBDR4L66A2JPV05zY/jzeVkm8aKRtuKoaGwyZA1Kj+3rTXI34YzHZu1rvxz
         RfdGQlI5wi9NBeBgAp0+ZmAnxGPNJm4wc9j8R7XQUmluY/iq4We4SAe/Mt5c+IxAGwtJ
         7wwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=IoQJCjL9CkC2nNLPRiKCwC1ymM2gX7kWLIHlyGf9PpI=;
        fh=KIQWrerkHcHGY8pI9tE4eJlk73GRvR/oZFuXy8RkeGg=;
        b=S0VoBwACb9l/cikfQ30QKvCR2y3FQ/GghmPCATMqWvGSsi6o3I7AS8hRERIHlES+5y
         biU9CYACrMfv5u/w33qwx1Wg8f7UGWQy2wsr+YkM+nJveilIO3nGUbhbaCv1B2mXwOyO
         0d/9oRH1Y67xa8ffqciuvwQsIcBo9f8SqVakZ/0GxasSEe+Aqa1PNzEShva/C1ES3iYG
         og4EedHDIK0F2Ip7AcKMqQUT4ET7buy6BFpa9A1QTbv6SjFoRrR3seJYOArdPX7bEgjh
         QA0Q7fYmoHdQ8V1qNM/KipF/oz3PMqqQk6PW+ym64a+oV/2W52AQ/twwc4CkcgM+WM8L
         /zqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eec962e1e5si103919556d6.31.2025.04.02.00.46.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Apr 2025 00:46:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzso5-0004Hu-Pm; Wed, 02 Apr 2025 03:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1tzso3-0004HK-9J; Wed, 02 Apr 2025 03:46:39 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1tzso0-000611-BI; Wed, 02 Apr 2025 03:46:38 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4ZSH4N3msgz4x8h;
 Wed,  2 Apr 2025 18:46:28 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZSH4J3gPJz4wcT;
 Wed,  2 Apr 2025 18:46:24 +1100 (AEDT)
Message-ID: <1727568a-2101-444c-bf48-03d4a203d78f@kaod.org>
Date: Wed, 2 Apr 2025 09:46:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/22] hw/misc/aspeed_hace:: Support setting different
 memory size
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com
References: <20250321092623.2097234-1-jamin_lin@aspeedtech.com>
 <20250321092623.2097234-11-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20250321092623.2097234-11-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=yfRC=WU=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: IQly2tQFngZl

On 3/21/25 10:26, Jamin Lin wrote:
> The memory size was previously hardcoded to 0x1000 (4K). However, the actual
> memory size of the HACE controller varies across different models:
> 1. AST2400/AST2500: 0x1000 (4K)
> 2. AST2600/AST1030: 0x10000 (64K)
> 3. AST2700: 0x100 (256 bytes)
> 
> To address this, a new class attribute, mem_size, has been introduced to
> dynamically set the appropriate memory size for each HACE model, ensuring
> correct allocation across AST2400, AST2500, AST2600, AST1030 and AST2700.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   include/hw/misc/aspeed_hace.h | 1 +
>   hw/misc/aspeed_hace.c         | 8 +++++++-
>   2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
> index 58fb66009a..db95f2fd4b 100644
> --- a/include/hw/misc/aspeed_hace.h
> +++ b/include/hw/misc/aspeed_hace.h
> @@ -53,6 +53,7 @@ struct AspeedHACEClass {
>       uint32_t dest_hi_mask;
>       uint32_t key_hi_mask;
>       bool has_dma64;
> +    uint64_t mem_size;
>   };
>   
>   #endif /* ASPEED_HACE_H */
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> index d4f653670e..53b3b390e3 100644
> --- a/hw/misc/aspeed_hace.c
> +++ b/hw/misc/aspeed_hace.c
> @@ -463,11 +463,12 @@ static void aspeed_hace_realize(DeviceState *dev, Error **errp)
>   {
>       AspeedHACEState *s = ASPEED_HACE(dev);
>       SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +    AspeedHACEClass *ahc = ASPEED_HACE_GET_CLASS(s);
>   
>       sysbus_init_irq(sbd, &s->irq);
>   
>       memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_hace_ops, s,
> -            TYPE_ASPEED_HACE, 0x1000);
> +            TYPE_ASPEED_HACE, ahc->mem_size);
>   
>       if (!s->dram_mr) {
>           error_setg(errp, TYPE_ASPEED_HACE ": 'dram' link not set");
> @@ -521,6 +522,7 @@ static void aspeed_ast2400_hace_class_init(ObjectClass *klass, void *data)
>   
>       dc->desc = "AST2400 Hash and Crypto Engine";
>   
> +    ahc->mem_size = 0x1000;
>       ahc->src_mask = 0x0FFFFFFF;
>       ahc->dest_mask = 0x0FFFFFF8;
>       ahc->key_mask = 0x0FFFFFC0;
> @@ -540,6 +542,7 @@ static void aspeed_ast2500_hace_class_init(ObjectClass *klass, void *data)
>   
>       dc->desc = "AST2500 Hash and Crypto Engine";
>   
> +    ahc->mem_size = 0x1000;
>       ahc->src_mask = 0x3fffffff;
>       ahc->dest_mask = 0x3ffffff8;
>       ahc->key_mask = 0x3FFFFFC0;
> @@ -559,6 +562,7 @@ static void aspeed_ast2600_hace_class_init(ObjectClass *klass, void *data)
>   
>       dc->desc = "AST2600 Hash and Crypto Engine";
>   
> +    ahc->mem_size = 0x10000;
>       ahc->src_mask = 0x7FFFFFFF;
>       ahc->dest_mask = 0x7FFFFFF8;
>       ahc->key_mask = 0x7FFFFFF8;
> @@ -578,6 +582,7 @@ static void aspeed_ast1030_hace_class_init(ObjectClass *klass, void *data)
>   
>       dc->desc = "AST1030 Hash and Crypto Engine";
>   
> +    ahc->mem_size = 0x10000;
>       ahc->src_mask = 0x7FFFFFFF;
>       ahc->dest_mask = 0x7FFFFFF8;
>       ahc->key_mask = 0x7FFFFFF8;
> @@ -597,6 +602,7 @@ static void aspeed_ast2700_hace_class_init(ObjectClass *klass, void *data)
>   
>       dc->desc = "AST2700 Hash and Crypto Engine";
>   
> +    ahc->mem_size = 0x100;
>       ahc->src_mask = 0x7FFFFFFF;
>       ahc->dest_mask = 0x7FFFFFF8;
>       ahc->key_mask = 0x7FFFFFF8;

