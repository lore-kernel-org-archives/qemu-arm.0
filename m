Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1841789ejd;
        Thu, 18 Apr 2024 09:14:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXjudFV3egNKdPZPwaEuXsyF3hrG90QBta3Iq4OexdzOO5ankocABb7DC3v38+MB4kwutrRvWFT5U3Ep7e+XTtDRPePBiNo
X-Google-Smtp-Source: AGHT+IH1Abh1pWKmPdF/7F3pvCd1KhheTESTuVNetXjglJTams8q1ZzOT3JcBzgNDlqYo4ydhNzm
X-Received: by 2002:a05:620a:562a:b0:78d:74e9:efe7 with SMTP id vv10-20020a05620a562a00b0078d74e9efe7mr3369599qkn.74.1713456866420;
        Thu, 18 Apr 2024 09:14:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713456866; cv=none;
        d=google.com; s=arc-20160816;
        b=d4SOyDNjYe6WOndHHX3PtTBjo4nDYuoeAMXl8TwMG0uyA6KmFyYcfFLxU8OobWS/30
         7+KWjuXMZTSn1XoEedBEjGKcBoQSjGONfexMJYtE6wM0V7VnJHazGxUAm1NSlxuU15po
         gArP9IhFFfRNlzWztSMbqp9dbLM/uvwmVwxXxp5eNzYBdWhyINxOclIY2/xIV03+fwGS
         BBGzIhhFksN5eG6zVfvnv+V6weIDrDxrbU3uwJ1wccYMTog8CHLikRqZYrVrRvREptBR
         bQ9nPHvY1IPRVLbGUutwGrKYyxsvQi5KKLM3YzpLm6vaqP0avAJzMx+WvOFaxc+H6ZVB
         zhEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=JJOnGFU3cPz5GR5xOKEzRfUk6QCDApwHA98gKMGvj1Q=;
        fh=dkl4W7Ty5DQDYblIuR6iwQV8rfkW6Bl5VLJjLin9mSc=;
        b=U7HPcQ4xpoiXt7UfAXFR+83/u3pNpHB6fSKXKjrva2Bc3THkJ4xkOhv2NGa5djGaUA
         wb1Sr7MpJTVCu935e8Fr9+Ke63qLcIa0c7Ugg19wGr1P6tnwMApA+MNJKhaJ/joRpO9w
         ppktz4fPxz9vXfJ9Ed/6qiq3SIiujdavZ58kmHXCSl4njuWNPf8OUseFD1BRsvoRZtaz
         qjR31SC94dc93gxFaLM7QDBimcugDPfz3ySMryAJydJgPaQN91YUTGHu5DDMQ+JqFjGu
         hvVzub3VD46/W8E7TLU/CWdsew46Qa1I1o4DHJfL7YG/aIMz9QDSKC8OafOQ6XJxSOjf
         /gSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id vr19-20020a05620a55b300b0078d63cf9e51si1693810qkn.657.2024.04.18.09.14.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Apr 2024 09:14:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rxUOx-0004QR-Bk; Thu, 18 Apr 2024 12:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=S08W=LX=kaod.org=clg@ozlabs.org>)
 id 1rxUOw-0004QF-KN; Thu, 18 Apr 2024 12:14:18 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=S08W=LX=kaod.org=clg@ozlabs.org>)
 id 1rxUOu-0007CH-2w; Thu, 18 Apr 2024 12:14:18 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4VL2sJ3Gxyz4x1t;
 Fri, 19 Apr 2024 02:14:12 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VL2sC48JQz4wcC;
 Fri, 19 Apr 2024 02:14:07 +1000 (AEST)
Message-ID: <64c6d5b2-9ee9-4b74-a679-1509e0293350@kaod.org>
Date: Thu, 18 Apr 2024 18:14:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/16] aspeed/smc: Add AST2700 support
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240416091904.935283-1-jamin_lin@aspeedtech.com>
 <20240416091904.935283-10-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240416091904.935283-10-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=S08W=LX=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
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
X-TUID: jKUjYOpU+PN1

On 4/16/24 11:18, Jamin Lin wrote:
> AST2700 fmc/spi controller's address decoding unit is 64KB
> and only bits [31:16] are used for decoding. Introduce seg_to_reg
> and reg_to_seg handlers for ast2700 fmc/spi controller.
> In addition, adds ast2700 fmc, spi0, spi1, and spi2 class init handler.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/ssi/aspeed_smc.c | 222 +++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 220 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index a67cac3d0f..e768e5463c 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -185,7 +185,7 @@
>    *   0: 4 bytes
>    *   0x7FFFFF: 32M bytes
>    *
> - * DMA length is from 1 byte to 32MB (AST2600, AST10x0)
> + * DMA length is from 1 byte to 32MB (AST2600, AST10x0 and AST2700)
>    *   0: 1 byte
>    *   0x1FFFFFF: 32M bytes
>    */
> @@ -670,7 +670,7 @@ static const MemoryRegionOps aspeed_smc_flash_ops = {
>       .endianness = DEVICE_LITTLE_ENDIAN,
>       .valid = {
>           .min_access_size = 1,
> -        .max_access_size = 4,
> +        .max_access_size = 8,
>       },
>   };
>   
> @@ -1951,6 +1951,220 @@ static const TypeInfo aspeed_1030_spi2_info = {
>       .class_init = aspeed_1030_spi2_class_init,
>   };
>   
> +/*
> + * The FMC Segment Registers of the AST2700 have a 64KB unit.
> + * Only bits [31:16] are used for decoding.
> + */
> +#define AST2700_SEG_ADDR_MASK 0xffff0000
> +
> +static uint32_t aspeed_2700_smc_segment_to_reg(const AspeedSMCState *s,
> +                                               const AspeedSegments *seg)
> +{
> +    uint32_t reg = 0;
> +
> +    /* Disabled segments have a nil register */
> +    if (!seg->size) {
> +        return 0;
> +    }
> +
> +    reg |= (seg->addr & AST2700_SEG_ADDR_MASK) >> 16; /* start offset */
> +    reg |= (seg->addr + seg->size - 1) & AST2700_SEG_ADDR_MASK; /* end offset */
> +    return reg;
> +}
> +
> +static void aspeed_2700_smc_reg_to_segment(const AspeedSMCState *s,
> +                                           uint32_t reg, AspeedSegments *seg)
> +{
> +    uint32_t start_offset = (reg << 16) & AST2700_SEG_ADDR_MASK;
> +    uint32_t end_offset = reg & AST2700_SEG_ADDR_MASK;
> +    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
> +
> +    if (reg) {
> +        seg->addr = asc->flash_window_base + start_offset;
> +        seg->size = end_offset + (64 * KiB) - start_offset;
> +    } else {
> +        seg->addr = asc->flash_window_base;
> +        seg->size = 0;
> +    }
> +}
> +
> +static const uint32_t aspeed_2700_fmc_resets[ASPEED_SMC_R_MAX] = {
> +    [R_CONF] = (CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE0 |
> +            CONF_FLASH_TYPE_SPI << CONF_FLASH_TYPE1),
> +    [R_CE_CTRL] = 0x0000aa00,
> +    [R_CTRL0] = 0x406b0641,
> +    [R_CTRL1] = 0x00000400,
> +    [R_CTRL2] = 0x00000400,
> +    [R_CTRL3] = 0x00000400,
> +    [R_SEG_ADDR0] = 0x08000000,
> +    [R_SEG_ADDR1] = 0x10000800,
> +    [R_SEG_ADDR2] = 0x00000000,
> +    [R_SEG_ADDR3] = 0x00000000,
> +    [R_DUMMY_DATA] = 0x00010000,
> +    [R_DMA_DRAM_ADDR_HIGH] = 0x00000000,
> +    [R_TIMINGS] = 0x007b0000,
> +};
> +
> +static const AspeedSegments aspeed_2700_fmc_segments[] = {
> +    { 0x0, 128 * MiB }, /* start address is readonly */
> +    { 128 * MiB, 128 * MiB }, /* default is disabled but needed for -kernel */
> +    { 256 * MiB, 128 * MiB }, /* default is disabled but needed for -kernel */
> +    { 0x0, 0 }, /* disabled */
> +};
> +
> +static void aspeed_2700_fmc_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
> +
> +    dc->desc               = "Aspeed 2700 FMC Controller";
> +    asc->r_conf            = R_CONF;
> +    asc->r_ce_ctrl         = R_CE_CTRL;
> +    asc->r_ctrl0           = R_CTRL0;
> +    asc->r_timings         = R_TIMINGS;
> +    asc->nregs_timings     = 3;
> +    asc->conf_enable_w0    = CONF_ENABLE_W0;
> +    asc->cs_num_max        = 3;
> +    asc->segments          = aspeed_2700_fmc_segments;
> +    asc->segment_addr_mask = 0xffffffff;
> +    asc->resets            = aspeed_2700_fmc_resets;
> +    asc->flash_window_base = 0x100000000;
> +    asc->flash_window_size = 1 * GiB;
> +    asc->features          = ASPEED_SMC_FEATURE_DMA |
> +                             ASPEED_SMC_FEATURE_DMA_DRAM_ADDR_HIGH;
> +    asc->dma_flash_mask    = 0x2FFFFFFC;
> +    asc->dma_dram_mask     = 0xFFFFFFFC;
> +    asc->dma_start_length  = 1;
> +    asc->nregs             = ASPEED_SMC_R_MAX;
> +    asc->segment_to_reg    = aspeed_2700_smc_segment_to_reg;
> +    asc->reg_to_segment    = aspeed_2700_smc_reg_to_segment;
> +    asc->dma_ctrl          = aspeed_2600_smc_dma_ctrl;
> +}
> +
> +static const TypeInfo aspeed_2700_fmc_info = {
> +    .name =  "aspeed.fmc-ast2700",
> +    .parent = TYPE_ASPEED_SMC,
> +    .class_init = aspeed_2700_fmc_class_init,
> +};
> +
> +static const AspeedSegments aspeed_2700_spi0_segments[] = {
> +    { 0x0, 128 * MiB }, /* start address is readonly */
> +    { 128 * MiB, 128 * MiB }, /* start address is readonly */
> +    { 0x0, 0 }, /* disabled */
> +};
> +
> +static void aspeed_2700_spi0_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
> +
> +    dc->desc               = "Aspeed 2700 SPI0 Controller";
> +    asc->r_conf            = R_CONF;
> +    asc->r_ce_ctrl         = R_CE_CTRL;
> +    asc->r_ctrl0           = R_CTRL0;
> +    asc->r_timings         = R_TIMINGS;
> +    asc->nregs_timings     = 2;
> +    asc->conf_enable_w0    = CONF_ENABLE_W0;
> +    asc->cs_num_max        = 2;
> +    asc->segments          = aspeed_2700_spi0_segments;
> +    asc->segment_addr_mask = 0xffffffff;
> +    asc->flash_window_base = 0x180000000;
> +    asc->flash_window_size = 1 * GiB;
> +    asc->features          = ASPEED_SMC_FEATURE_DMA |
> +                             ASPEED_SMC_FEATURE_DMA_DRAM_ADDR_HIGH;
> +    asc->dma_flash_mask    = 0x2FFFFFFC;
> +    asc->dma_dram_mask     = 0xFFFFFFFC;
> +    asc->dma_start_length  = 1;
> +    asc->nregs             = ASPEED_SMC_R_MAX;
> +    asc->segment_to_reg    = aspeed_2700_smc_segment_to_reg;
> +    asc->reg_to_segment    = aspeed_2700_smc_reg_to_segment;
> +    asc->dma_ctrl          = aspeed_2600_smc_dma_ctrl;
> +}
> +
> +static const TypeInfo aspeed_2700_spi0_info = {
> +    .name =  "aspeed.spi0-ast2700",
> +    .parent = TYPE_ASPEED_SMC,
> +    .class_init = aspeed_2700_spi0_class_init,
> +};
> +
> +static const AspeedSegments aspeed_2700_spi1_segments[] = {
> +    { 0x0, 128 * MiB }, /* start address is readonly */
> +    { 0x0, 0 }, /* disabled */
> +};
> +
> +static void aspeed_2700_spi1_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
> +
> +    dc->desc               = "Aspeed 2700 SPI1 Controller";
> +    asc->r_conf            = R_CONF;
> +    asc->r_ce_ctrl         = R_CE_CTRL;
> +    asc->r_ctrl0           = R_CTRL0;
> +    asc->r_timings         = R_TIMINGS;
> +    asc->nregs_timings     = 2;
> +    asc->conf_enable_w0    = CONF_ENABLE_W0;
> +    asc->cs_num_max        = 2;
> +    asc->segments          = aspeed_2700_spi1_segments;
> +    asc->segment_addr_mask = 0xffffffff;
> +    asc->flash_window_base = 0x200000000;
> +    asc->flash_window_size = 1 * GiB;
> +    asc->features          = ASPEED_SMC_FEATURE_DMA |
> +                             ASPEED_SMC_FEATURE_DMA_DRAM_ADDR_HIGH;
> +    asc->dma_flash_mask    = 0x2FFFFFFC;
> +    asc->dma_dram_mask     = 0xFFFFFFFC;
> +    asc->dma_start_length  = 1;
> +    asc->nregs             = ASPEED_SMC_R_MAX;
> +    asc->segment_to_reg    = aspeed_2700_smc_segment_to_reg;
> +    asc->reg_to_segment    = aspeed_2700_smc_reg_to_segment;
> +    asc->dma_ctrl          = aspeed_2600_smc_dma_ctrl;
> +}
> +
> +static const TypeInfo aspeed_2700_spi1_info = {
> +        .name =  "aspeed.spi1-ast2700",
> +        .parent = TYPE_ASPEED_SMC,
> +        .class_init = aspeed_2700_spi1_class_init,
> +};
> +
> +static const AspeedSegments aspeed_2700_spi2_segments[] = {
> +    { 0x0, 128 * MiB }, /* start address is readonly */
> +    { 0x0, 0 }, /* disabled */
> +};
> +
> +static void aspeed_2700_spi2_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    AspeedSMCClass *asc = ASPEED_SMC_CLASS(klass);
> +
> +    dc->desc               = "Aspeed 2700 SPI2 Controller";
> +    asc->r_conf            = R_CONF;
> +    asc->r_ce_ctrl         = R_CE_CTRL;
> +    asc->r_ctrl0           = R_CTRL0;
> +    asc->r_timings         = R_TIMINGS;
> +    asc->nregs_timings     = 2;
> +    asc->conf_enable_w0    = CONF_ENABLE_W0;
> +    asc->cs_num_max        = 2;
> +    asc->segments          = aspeed_2700_spi2_segments;
> +    asc->segment_addr_mask = 0xffffffff;
> +    asc->flash_window_base = 0x280000000;
> +    asc->flash_window_size = 1 * GiB;
> +    asc->features          = ASPEED_SMC_FEATURE_DMA |
> +                             ASPEED_SMC_FEATURE_DMA_DRAM_ADDR_HIGH;
> +    asc->dma_flash_mask    = 0x0FFFFFFC;
> +    asc->dma_dram_mask     = 0xFFFFFFFC;
> +    asc->dma_start_length  = 1;
> +    asc->nregs             = ASPEED_SMC_R_MAX;
> +    asc->segment_to_reg    = aspeed_2700_smc_segment_to_reg;
> +    asc->reg_to_segment    = aspeed_2700_smc_reg_to_segment;
> +    asc->dma_ctrl          = aspeed_2600_smc_dma_ctrl;
> +}
> +
> +static const TypeInfo aspeed_2700_spi2_info = {
> +        .name =  "aspeed.spi2-ast2700",
> +        .parent = TYPE_ASPEED_SMC,
> +        .class_init = aspeed_2700_spi2_class_init,
> +};
> +
>   static void aspeed_smc_register_types(void)
>   {
>       type_register_static(&aspeed_smc_flash_info);
> @@ -1967,6 +2181,10 @@ static void aspeed_smc_register_types(void)
>       type_register_static(&aspeed_1030_fmc_info);
>       type_register_static(&aspeed_1030_spi1_info);
>       type_register_static(&aspeed_1030_spi2_info);
> +    type_register_static(&aspeed_2700_fmc_info);
> +    type_register_static(&aspeed_2700_spi0_info);
> +    type_register_static(&aspeed_2700_spi1_info);
> +    type_register_static(&aspeed_2700_spi2_info);
>   }
>   
>   type_init(aspeed_smc_register_types)

