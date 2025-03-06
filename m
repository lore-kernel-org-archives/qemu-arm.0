Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1538394njm;
        Thu, 6 Mar 2025 07:05:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWrUpl0s04E38c0qjOHp5ZndQ+x/gljGKImx3ERC+0tJBO0UV7a94fTIkToQdWBhAQ8rDKM3egkRBAn2g==@linaro.org
X-Google-Smtp-Source: AGHT+IFs5+GSXcEuIOVF9QcQLl7Iql0lGBBkBQ53PjKyWydkjo9HuHUX3p57k3YScX9rbWlz3aZc
X-Received: by 2002:a05:620a:8013:b0:7c3:d6c8:655d with SMTP id af79cd13be357-7c3d8bd40dbmr1106127285a.4.1741273510453;
        Thu, 06 Mar 2025 07:05:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741273510; cv=none;
        d=google.com; s=arc-20240605;
        b=PBCNIksYRmp+dDN/WBB9Xz9xUsjLFs546N6PB0uDNPbTYPy2g6EtsOiN+wdRtd0U1N
         zGNefvCaEEvHMJI9SRQ7pRbuoh88FKQRWY3La1GwkVdu8tmxdyBUa6CP82tIqS91bJ2B
         iJAIuPI53pByzxRppSKthFNu+OYa/YDXsIoKpKsZF4xaNUJsexvJFwU1QozZgMN64uEJ
         ZiQE1tMcMODKbeVe8z1FYNN+VQ10s+V5+gfymK6JSdckNtMbd4qbwArxLLP0haM33UGj
         32bGtcWYhmmPBTt7qZZf/nlSXH1E18c6Yonz7tVeb0ylxS38iKNGVKUKHRx/uqY/qAQU
         gD8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=4O6UjXhIX+LpNlGF1CX4XuKxWRL6HiqjHGoJnR6+xp8=;
        fh=JUqExWdVyO9KjlFCuMigXej9m2rYeji+PtTsDk1BqAY=;
        b=XEXLI7OKxXRnJeHuCCIlgk0gsaER6ZoWzn62/SPYIYDpgDf8qGqzYdCGlqPjVB6+Cx
         KSoAgmjgGTdJiZtG3GYtecIo0CryZd16tcP+8mc4clNJIaQIyNHS9N3My/InpkGERwdZ
         F5k4SUYrF+BNgLRbKmp8FjKm7nlqkBmB8vyb6pHitnx0UVXrM45pD1MkCaCiyRf4kYZt
         KJHbO0ZLZeH5g6bVfh4c0LrxS524ukdCMwgdpjhzxRLCK/rUAFDArz7MYV97CpsPMNWK
         qmN4MCxKLk74I0O2JbrwMaeVb3qGIdMq5Korx/KHoUoHTfxVE6Gpm7F0N7KcFjkaA0ZT
         b4vQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e55672c2si142473385a.596.2025.03.06.07.05.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 07:05:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqClr-0004kC-OP; Thu, 06 Mar 2025 10:04:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=VCYv=VZ=kaod.org=clg@ozlabs.org>)
 id 1tqCln-0004jb-Gh; Thu, 06 Mar 2025 10:04:19 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=VCYv=VZ=kaod.org=clg@ozlabs.org>)
 id 1tqClk-00086D-QO; Thu, 06 Mar 2025 10:04:19 -0500
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Z7t3s4W6Dz4x3q;
 Fri,  7 Mar 2025 02:04:09 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z7t3n6Btmz4wcT;
 Fri,  7 Mar 2025 02:04:04 +1100 (AEDT)
Message-ID: <70a83582-8792-46b2-bd23-fa6d13f57653@kaod.org>
Date: Thu, 6 Mar 2025 16:04:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/29] hw/intc/aspeed: Support setting different memory
 size
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
Cc: troy_lee@aspeedtech.com
References: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
 <20250306103846.429221-2-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20250306103846.429221-2-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=VCYv=VZ=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: yE8KDP4cnVGc

On 3/6/25 11:38, Jamin Lin wrote:
> According to the AST2700 datasheet, the INTC(CPU DIE) controller has 16KB
> (0x4000) of register space, and the INTCIO (I/O DIE) controller has 1KB (0x400)
> of register space.
> 
> Introduced a new class attribute "mem_size" to set different memory sizes for
> the INTC models in AST2700.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   include/hw/intc/aspeed_intc.h | 3 +++
>   hw/intc/aspeed_intc.c         | 9 ++++++++-
>   2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/intc/aspeed_intc.h b/include/hw/intc/aspeed_intc.h
> index 18cb43476c..03324f05ab 100644
> --- a/include/hw/intc/aspeed_intc.h
> +++ b/include/hw/intc/aspeed_intc.h
> @@ -25,6 +25,8 @@ struct AspeedINTCState {
>   
>       /*< public >*/
>       MemoryRegion iomem;
> +    MemoryRegion iomem_container;
> +
>       uint32_t regs[ASPEED_INTC_NR_REGS];
>       OrIRQState orgates[ASPEED_INTC_NR_INTS];
>       qemu_irq output_pins[ASPEED_INTC_NR_INTS];
> @@ -39,6 +41,7 @@ struct AspeedINTCClass {
>   
>       uint32_t num_lines;
>       uint32_t num_ints;
> +    uint64_t mem_size;
>   };
>   
>   #endif /* ASPEED_INTC_H */
> diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
> index 126b711b94..033b574c1e 100644
> --- a/hw/intc/aspeed_intc.c
> +++ b/hw/intc/aspeed_intc.c
> @@ -302,10 +302,16 @@ static void aspeed_intc_realize(DeviceState *dev, Error **errp)
>       AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
>       int i;
>   
> +    memory_region_init(&s->iomem_container, OBJECT(s),
> +            TYPE_ASPEED_INTC ".container", aic->mem_size);
> +
> +    sysbus_init_mmio(sbd, &s->iomem_container);
> +
>       memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_intc_ops, s,
>                             TYPE_ASPEED_INTC ".regs", ASPEED_INTC_NR_REGS << 2);
>   
> -    sysbus_init_mmio(sbd, &s->iomem);
> +    memory_region_add_subregion(&s->iomem_container, 0x0, &s->iomem);
> +
>       qdev_init_gpio_in(dev, aspeed_intc_set_irq, aic->num_ints);
>   
>       for (i = 0; i < aic->num_ints; i++) {
> @@ -344,6 +350,7 @@ static void aspeed_2700_intc_class_init(ObjectClass *klass, void *data)
>       dc->desc = "ASPEED 2700 INTC Controller";
>       aic->num_lines = 32;
>       aic->num_ints = 9;
> +    aic->mem_size = 0x4000;
>   }
>   
>   static const TypeInfo aspeed_2700_intc_info = {

