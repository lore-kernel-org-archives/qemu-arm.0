Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1543588njm;
        Thu, 6 Mar 2025 07:10:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWrGnfxq94eapUAOMRIUZdFEcp5GJBraaFrdb3Zg01cUuqfMLYe9Vm7a8EM3a6qH2a4qblfDpCsizKuqA==@linaro.org
X-Google-Smtp-Source: AGHT+IE6ZaU1Ccx6lSZzF6i0ZGUx9ogrKPv4JLY79VdIVaQsq4XFQ2CBhGDdEilMDnAg3/4CXvqk
X-Received: by 2002:a05:6214:c8c:b0:6e8:9526:5788 with SMTP id 6a1803df08f44-6e8e6c8cc8emr94364406d6.0.1741273855265;
        Thu, 06 Mar 2025 07:10:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741273855; cv=none;
        d=google.com; s=arc-20240605;
        b=U98CjHe+/nx/b6riYZYiBRlFFug7plEkmu+vsDNHiwzFfcXu+yFkp4uXLO6LPPllvU
         5c+mONMU9u0K+aiEi2wYE/ummIjvvQR6KyKl1KDkFyXiqPcShXT6+Q/amOt55wo35dv8
         wE2Hg1UYON5NwMowptK2FREsbSHOYmGnuNklHDo+2LAz7JGwOpudAn3GKqrvq5N6w035
         UABzamR/Pwmd8DzQAJ7vWQZ9x4E3uaPn/G2lPnJRno2hDd3iiD28JVS+259+vtUIBtTm
         xB8PQpTawf6Tg73zsu0ef5ZyWQZn1dqqKP0xjV8qWMKwNqIquRTd9CjoiOhg2Q13L44C
         ysBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=ohiaunk084m5bftOPpwOOdYk92ru8GyDg7tVTJCOK4s=;
        fh=JUqExWdVyO9KjlFCuMigXej9m2rYeji+PtTsDk1BqAY=;
        b=abnJTn+pC/IW8m3tHzy04rOfqZqbXGAS1vQByMR0J00a+vCKUAzAKqS8PBJ3iUPLEY
         mYb9KOQulNg5ufbhu4uLJmYn8JvSQAsmIj9m1QsN8B83S2n0zPFLqdxiQo8ZYh4MfpVu
         +FqKByyk5RsNe3Lc462UIpg/w6/i0xPLKVLcoSysmzOQo8whavZo777iK2mihE/6iZMX
         K4SNbS60YGlD428KPUPgGEjiqyQoTCVL+I2wt350lM2/EL1GutbFcSrhjuQXLtlc+thC
         vaTZ6Tt4kPetQFyJeObXW4zsZ1LJnVcKFL6dOTu0rkPUXVVIghKRczAthlJEgVLPUPiL
         5aZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f7161067si13680456d6.236.2025.03.06.07.10.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 07:10:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqCrx-0001Y8-J0; Thu, 06 Mar 2025 10:10:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=VCYv=VZ=kaod.org=clg@ozlabs.org>)
 id 1tqCrl-0001Ro-Bu; Thu, 06 Mar 2025 10:10:30 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=VCYv=VZ=kaod.org=clg@ozlabs.org>)
 id 1tqCri-0000vY-SR; Thu, 06 Mar 2025 10:10:29 -0500
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Z7tC20pvFz4x3d;
 Fri,  7 Mar 2025 02:10:22 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z7tBy4RtGz4wcT;
 Fri,  7 Mar 2025 02:10:18 +1100 (AEDT)
Message-ID: <9dfe2d2a-1e24-4c78-ad87-75118ea74c83@kaod.org>
Date: Thu, 6 Mar 2025 16:10:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/29] hw/intc/aspeed: Introduce AspeedINTCIRQ
 structure to save the irq index and register address
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
Cc: troy_lee@aspeedtech.com
References: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
 <20250306103846.429221-15-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20250306103846.429221-15-jamin_lin@aspeedtech.com>
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
X-TUID: Xjt2BrG8X3c9

On 3/6/25 11:38, Jamin Lin wrote:
> The INTC controller supports GICINT128 to GICINT136, mapping 1:1 to input and
> output IRQs 0 to 8. Previously, the formula "address & 0x0f00" was used to
> derive the IRQ index numbers.
> 
> However, the INTC controller also supports GICINT192_201, mapping 1 input IRQ
> pin to 10 output IRQ pins. The pin numbers for input and output are different.
> It is difficult to use a formula to determine the index number of INTC model
> supported input and output IRQs.
> 
> To simplify and improve readability, introduces the AspeedINTCIRQ structure to
> save the input/output IRQ index and its enable/status register address.
> 
> Introduce the "aspeed_2700_intc_irqs" table to store IRQ information for INTC.
> Introduce the "aspeed_intc_get_irq" function to retrieve the input/output IRQ
> pin index from the provided status/enable register address.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   include/hw/intc/aspeed_intc.h | 10 ++++
>   hw/intc/aspeed_intc.c         | 87 +++++++++++++++++++----------------
>   2 files changed, 58 insertions(+), 39 deletions(-)
> 
> diff --git a/include/hw/intc/aspeed_intc.h b/include/hw/intc/aspeed_intc.h
> index 41b1f82d73..fa92e9eef2 100644
> --- a/include/hw/intc/aspeed_intc.h
> +++ b/include/hw/intc/aspeed_intc.h
> @@ -19,6 +19,14 @@ OBJECT_DECLARE_TYPE(AspeedINTCState, AspeedINTCClass, ASPEED_INTC)
>   #define ASPEED_INTC_MAX_INPINS 9
>   #define ASPEED_INTC_MAX_OUTPINS 9
>   
> +typedef struct AspeedINTCIRQ {
> +    int inpin_idx;
> +    int outpin_idx;
> +    int num_outpins;
> +    uint32_t enable_reg;
> +    uint32_t status_reg;
> +} AspeedINTCIRQ;
> +
>   struct AspeedINTCState {
>       /*< private >*/
>       SysBusDevice parent_obj;
> @@ -46,6 +54,8 @@ struct AspeedINTCClass {
>       uint64_t reg_size;
>       uint64_t reg_offset;
>       const MemoryRegionOps *reg_ops;
> +    const AspeedINTCIRQ *irq_table;
> +    int irq_table_count;
>   };
>   
>   #endif /* ASPEED_INTC_H */
> diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
> index 5b0d15f463..0ac59745f6 100644
> --- a/hw/intc/aspeed_intc.c
> +++ b/hw/intc/aspeed_intc.c
> @@ -40,7 +40,23 @@ REG32(GICINT135_STATUS,     0x704)
>   REG32(GICINT136_EN,         0x800)
>   REG32(GICINT136_STATUS,     0x804)
>   
> -#define GICINT_STATUS_BASE     R_GICINT128_STATUS
> +static const AspeedINTCIRQ *aspeed_intc_get_irq(AspeedINTCClass *aic,
> +                                                uint32_t reg)
> +{
> +    int i;
> +
> +    for (i = 0; i < aic->irq_table_count; i++) {
> +        if (aic->irq_table[i].enable_reg == reg ||
> +            aic->irq_table[i].status_reg == reg) {
> +            return &aic->irq_table[i];
> +        }
> +    }
> +
> +    /*
> +     * Invalid reg.
> +     */
> +    g_assert_not_reached();
> +}
>   
>   /*
>    * Update the state of an interrupt controller pin by setting
> @@ -54,17 +70,7 @@ static void aspeed_intc_update(AspeedINTCState *s, int inpin_idx,
>       AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
>       const char *name = object_get_typename(OBJECT(s));
>   
> -    if (inpin_idx >= aic->num_inpins) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid input pin index: %d\n",
> -                      __func__, inpin_idx);
> -        return;
> -    }
> -
> -    if (outpin_idx >= aic->num_outpins) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid output pin index: %d\n",
> -                      __func__, outpin_idx);
> -        return;
> -    }
> +    assert((outpin_idx < aic->num_outpins) && (inpin_idx < aic->num_inpins));
>   
>       trace_aspeed_intc_update_irq(name, inpin_idx, outpin_idx, level);
>       qemu_set_irq(s->output_pins[outpin_idx], level);
> @@ -81,21 +87,20 @@ static void aspeed_intc_set_irq(void *opaque, int irq, int level)
>       AspeedINTCState *s = (AspeedINTCState *)opaque;
>       AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
>       const char *name = object_get_typename(OBJECT(s));
> -    uint32_t status_reg = GICINT_STATUS_BASE + ((0x100 * irq) >> 2);
> +    const AspeedINTCIRQ *intc_irq;
> +    uint32_t status_reg;
>       uint32_t select = 0;
>       uint32_t enable;
>       int outpin_idx;
>       int inpin_idx;
>       int i;
>   
> -    outpin_idx = irq;
> -    inpin_idx = irq;
> +    assert(irq < aic->num_inpins);
>   
> -    if (irq >= aic->num_inpins) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid input pin index: %d\n",
> -                      __func__, irq);
> -        return;
> -    }
> +    intc_irq = &aic->irq_table[irq];
> +    status_reg = intc_irq->status_reg;
> +    outpin_idx = intc_irq->outpin_idx;
> +    inpin_idx = intc_irq->inpin_idx;
>   
>       trace_aspeed_intc_set_irq(name, inpin_idx, level);
>       enable = s->enable[inpin_idx];
> @@ -146,21 +151,16 @@ static void aspeed_intc_enable_handler(AspeedINTCState *s, hwaddr offset,
>   {
>       AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
>       const char *name = object_get_typename(OBJECT(s));
> +    const AspeedINTCIRQ *intc_irq;
>       uint32_t reg = offset >> 2;
>       uint32_t old_enable;
>       uint32_t change;
>       int inpin_idx;
> -    uint32_t irq;
>   
> -    irq = (offset & 0x0f00) >> 8;
> -    inpin_idx = irq;
> +    intc_irq = aspeed_intc_get_irq(aic, reg);
> +    inpin_idx = intc_irq->inpin_idx;
>   
> -    if (inpin_idx >= aic->num_inpins) {
> -        qemu_log_mask(LOG_GUEST_ERROR,
> -                      "%s: Invalid input pin index: %d\n",
> -                      __func__, inpin_idx);
> -        return;
> -    }
> +    assert(inpin_idx < aic->num_inpins);
>   
>       /*
>        * The enable registers are used to enable source interrupts.
> @@ -202,26 +202,21 @@ static void aspeed_intc_status_handler(AspeedINTCState *s, hwaddr offset,
>   {
>       AspeedINTCClass *aic = ASPEED_INTC_GET_CLASS(s);
>       const char *name = object_get_typename(OBJECT(s));
> +    const AspeedINTCIRQ *intc_irq;
>       uint32_t reg = offset >> 2;
>       int outpin_idx;
>       int inpin_idx;
> -    uint32_t irq;
>   
>       if (!data) {
>           qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid data 0\n", __func__);
>           return;
>       }
>   
> -    irq = (offset & 0x0f00) >> 8;
> -    outpin_idx = irq;
> -    inpin_idx = irq;
> +    intc_irq = aspeed_intc_get_irq(aic, reg);
> +    outpin_idx = intc_irq->outpin_idx;
> +    inpin_idx = intc_irq->inpin_idx;
>   
> -    if (inpin_idx >= aic->num_inpins) {
> -        qemu_log_mask(LOG_GUEST_ERROR,
> -                      "%s: Invalid input pin index: %d\n",
> -                      __func__, inpin_idx);
> -        return;
> -    }
> +    assert(inpin_idx < aic->num_inpins);
>   
>       /* clear status */
>       s->regs[reg] &= ~data;
> @@ -411,6 +406,18 @@ static const TypeInfo aspeed_intc_info = {
>       .abstract = true,
>   };
>   
> +static AspeedINTCIRQ aspeed_2700_intc_irqs[ASPEED_INTC_MAX_INPINS] = {
> +    {0, 0, 1, R_GICINT128_EN, R_GICINT128_STATUS},
> +    {1, 1, 1, R_GICINT129_EN, R_GICINT129_STATUS},
> +    {2, 2, 1, R_GICINT130_EN, R_GICINT130_STATUS},
> +    {3, 3, 1, R_GICINT131_EN, R_GICINT131_STATUS},
> +    {4, 4, 1, R_GICINT132_EN, R_GICINT132_STATUS},
> +    {5, 5, 1, R_GICINT133_EN, R_GICINT133_STATUS},
> +    {6, 6, 1, R_GICINT134_EN, R_GICINT134_STATUS},
> +    {7, 7, 1, R_GICINT135_EN, R_GICINT135_STATUS},
> +    {8, 8, 1, R_GICINT136_EN, R_GICINT136_STATUS},
> +};
> +
>   static void aspeed_2700_intc_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -423,6 +430,8 @@ static void aspeed_2700_intc_class_init(ObjectClass *klass, void *data)
>       aic->mem_size = 0x4000;
>       aic->reg_size = 0x808 >> 2;
>       aic->reg_offset = 0x1000;
> +    aic->irq_table = aspeed_2700_intc_irqs;
> +    aic->irq_table_count = ARRAY_SIZE(aspeed_2700_intc_irqs);
>   }
>   
>   static const TypeInfo aspeed_2700_intc_info = {

