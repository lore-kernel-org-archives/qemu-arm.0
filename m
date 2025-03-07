Received: by 2002:a05:7022:90e:b0:99:f831:508e with SMTP id bs14csp2013918dlb;
        Thu, 6 Mar 2025 23:24:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWDvxVYAlyzXPgP/cMeEtzXnAvbUMiyKVR03c/4Wgl9zCRMu+VTxhhsXXyhYX/bNgr0Q/yTdMTNxashJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEcIzPDGEu7efh0yrtYnznK/7S5S46HqHGTm22obgdHUBawbhQAfzNkAy6V/c6MZ1rzzFrK
X-Received: by 2002:a05:620a:26a8:b0:7c3:c01e:ad0b with SMTP id af79cd13be357-7c4e61ddbd2mr353992085a.51.1741332262656;
        Thu, 06 Mar 2025 23:24:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741332262; cv=none;
        d=google.com; s=arc-20240605;
        b=cWcKigkhIJ/p1bJ4oOmBWuSoGHUXpv8RMGm02OFvJSx108cII5Wt2re9df30dsd4ZS
         9nNqqSP9URZrqF30K4GNz3BlxhjrdmSRhf8iJWhhAfieAqypBuOxX1SaFliuIl3nR+zE
         /6FlNs+TQQVWf0Gx15yddkGt2ufzUNqJPf6OBueWqEtK+mrC34H6Y59ZT/TOLCqI1/8q
         t+yhyX1X5nZUdgJLXTG1Q2QJzsLOLMmJhZ3oIwYjanQatr5PKpmFFwR2ACJSRqlANByf
         WivStY9780w5j+8wHuPlSvZ7ZPJ3NCfJQqLU0JYyUANS5v6UKawdK8a1QlSXWx8kBokJ
         8bfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=LZHRu5GJnxnwjYSmfyfqMB8RHhJczeVUybGiBOqNs4w=;
        fh=JUqExWdVyO9KjlFCuMigXej9m2rYeji+PtTsDk1BqAY=;
        b=DY2Qp1r/3o/1VghWr+v9UM6/Sr549xg1mETtqIoFLILfyo0WRAqqNstRr5zwwhmYgu
         NSAoJPKXsb9Ax5gJ5SvhqmdlOLK4kkNYTcQIYkkCZxtOOr70kPKH/JDbVoXhmMm/3y0F
         95A35vAK44mmwNuooWrCi4f5SY7eB/mjJUjGib7BiTvw2sQ+H+GCXur+ILNUiphqw0aX
         pVAfi66ZfBrY5utyliUw9H+3oLpiCwc3bWoZlPDfjM49cEDWvq70rcL+3JvnzunCohMe
         IUUZg60eCBGAszzgLfjX6TD6tKuXbGKBw4yLI3Xc6UkdfOnCiKvSXgj2u+g7H1+u079E
         Heyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e556f384si294269385a.608.2025.03.06.23.24.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 23:24:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqS3Y-0008CF-2m; Fri, 07 Mar 2025 02:23:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=3Khh=V2=kaod.org=clg@ozlabs.org>)
 id 1tqS3S-00083l-3z; Fri, 07 Mar 2025 02:23:34 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=3Khh=V2=kaod.org=clg@ozlabs.org>)
 id 1tqS3P-0001aj-2X; Fri, 07 Mar 2025 02:23:33 -0500
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Z8Hnp5Lymz4x5k;
 Fri,  7 Mar 2025 18:23:26 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z8Hnl2kG1z4wcy;
 Fri,  7 Mar 2025 18:23:23 +1100 (AEDT)
Message-ID: <0457f746-fb73-41fd-b95d-aa1d98a35873@kaod.org>
Date: Fri, 7 Mar 2025 08:23:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/29] hw/intc/aspeed: Support setting different
 register size
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
Cc: troy_lee@aspeedtech.com
References: <20250307035945.3698802-1-jamin_lin@aspeedtech.com>
 <20250307035945.3698802-5-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20250307035945.3698802-5-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=3Khh=V2=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
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
X-TUID: XnY28NW0ruvt

On 3/7/25 04:59, Jamin Lin wrote:
> Currently, the size of the regs array is 0x2000, which is too large. So far,
> it only use GICINT128 - GICINT134, and the offsets from 0 to 0x1000 are unused.
> To save code size, introduce a new class attribute "reg_size" to set the
> different register sizes for the INTC models in AST2700 and add a regs
> sub-region in the memory container.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   include/hw/intc/aspeed_intc.h |  2 +-
>   hw/intc/aspeed_intc.c         | 22 +++++-----------------
>   2 files changed, 6 insertions(+), 18 deletions(-)
> 
> diff --git a/include/hw/intc/aspeed_intc.h b/include/hw/intc/aspeed_intc.h
> index 47ea0520b5..ec4936b3f4 100644
> --- a/include/hw/intc/aspeed_intc.h
> +++ b/include/hw/intc/aspeed_intc.h
> @@ -16,7 +16,6 @@
>   #define TYPE_ASPEED_2700_INTC TYPE_ASPEED_INTC "-ast2700"
>   OBJECT_DECLARE_TYPE(AspeedINTCState, AspeedINTCClass, ASPEED_INTC)
>   
> -#define ASPEED_INTC_NR_REGS (0x2000 >> 2)
>   #define ASPEED_INTC_NR_INTS 9
>   
>   struct AspeedINTCState {
> @@ -42,6 +41,7 @@ struct AspeedINTCClass {
>       uint32_t num_lines;
>       uint32_t num_ints;
>       uint64_t mem_size;
> +    uint64_t nr_regs;
>   };
>   
>   #endif /* ASPEED_INTC_H */
> diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
> index 558901570f..134922e46f 100644
> --- a/hw/intc/aspeed_intc.c
> +++ b/hw/intc/aspeed_intc.c
> @@ -120,13 +120,6 @@ static uint64_t aspeed_intc_read(void *opaque, hwaddr offset, unsigned int size)
>       uint32_t reg = offset >> 2;
>       uint32_t value = 0;
>   
> -    if (reg >= ASPEED_INTC_NR_REGS) {
> -        qemu_log_mask(LOG_GUEST_ERROR,
> -                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
> -                      __func__, offset);
> -        return 0;
> -    }
> -
>       value = s->regs[reg];
>       trace_aspeed_intc_read(offset, size, value);
>   
> @@ -143,13 +136,6 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
>       uint32_t change;
>       uint32_t irq;
>   
> -    if (reg >= ASPEED_INTC_NR_REGS) {
> -        qemu_log_mask(LOG_GUEST_ERROR,
> -                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
> -                      __func__, offset);
> -        return;
> -    }
> -
>       trace_aspeed_intc_write(offset, size, data);
>   
>       switch (reg) {
> @@ -288,8 +274,9 @@ static void aspeed_intc_instance_init(Object *obj)
>   static void aspeed_intc_reset(DeviceState *dev)
>   {
>       AspeedINTCState *s = ASPEED_INTC(dev);
> +    AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
>   
> -    memset(s->regs, 0, ASPEED_INTC_NR_REGS << 2);
> +    memset(s->regs, 0, aic->nr_regs << 2);
>       memset(s->enable, 0, sizeof(s->enable));
>       memset(s->mask, 0, sizeof(s->mask));
>       memset(s->pending, 0, sizeof(s->pending));
> @@ -307,9 +294,9 @@ static void aspeed_intc_realize(DeviceState *dev, Error **errp)
>   
>       sysbus_init_mmio(sbd, &s->iomem_container);
>   
> -    s->regs = g_new(uint32_t, ASPEED_INTC_NR_REGS);
> +    s->regs = g_new(uint32_t, aic->nr_regs);
>       memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_intc_ops, s,
> -                          TYPE_ASPEED_INTC ".regs", ASPEED_INTC_NR_REGS << 2);
> +                          TYPE_ASPEED_INTC ".regs", aic->nr_regs << 2);
>   
>       memory_region_add_subregion(&s->iomem_container, 0x0, &s->iomem);
>   
> @@ -361,6 +348,7 @@ static void aspeed_2700_intc_class_init(ObjectClass *klass, void *data)
>       aic->num_lines = 32;
>       aic->num_ints = 9;
>       aic->mem_size = 0x4000;
> +    aic->nr_regs = 0x2000 >> 2;
>   }
>   
>   static const TypeInfo aspeed_2700_intc_info = {

