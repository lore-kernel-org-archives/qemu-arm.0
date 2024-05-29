Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp449394ejk;
        Wed, 29 May 2024 01:48:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXt/QwNvojY8QmY5EYUH5ZYDyO+eCp6BSWdbesBd8IufneqcB3vFRSIVn6l46XvTVErzY50x3bkL9JQD6iN8irMUhN5i5Sz
X-Google-Smtp-Source: AGHT+IG638v099sUnbwQtAsiTsnnBgXj9mNjfqQMD16BS0UYZQm3UmvTBm/W4Bz6STi+PPz2fZMI
X-Received: by 2002:a05:6102:512a:b0:47c:122b:a3bd with SMTP id ada2fe7eead31-48a385036d4mr19722550137.2.1716972523131;
        Wed, 29 May 2024 01:48:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716972523; cv=none;
        d=google.com; s=arc-20160816;
        b=GW6dm8bUaTHQVdDYGKNyMAcGa74htE72Um7MkZdSlU8/a/x1PAk/URnSjaCMWBiht0
         b7mlsI6QhCY+3/V10q59Y3q9Tx6wVmr3C6NKPe2ym7W7yxL9voeQXyxeSSCcT/BElRfe
         vScVi3DzddseBWoxvlpFYGxVNE8gZGOJMd2uBfQCRdAaw0E4wWKQ0yyQa8/uSZ1evIKX
         fYuXX6sFuAvpB3eFQeD7MhYd+bGMbsumpqZZtOQ4fLubUnBBHgmTMndb3j66otlR/Adj
         ujSq1jfO0DH7IPJXIITjygw3zGNjicEyPLINRP9ejTdC5yRizF5SoXyewDFd64n7kz/M
         Ck9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=KRdeRoDPXl7HY0o13It11Md6EqCoQDPCAGtA1FmIanQ=;
        fh=dkl4W7Ty5DQDYblIuR6iwQV8rfkW6Bl5VLJjLin9mSc=;
        b=Dj9SsKtOzlXwb9MQLBzRnxNZosh0MukzpgukUabHAzbOWSdJuAW5Jt7rLWKKN/WEYV
         s9ctCzdFvf5j6o7gLE0DAHHlbv9rjdpJq7BbxRzoNA8SGd5hYR3FVHE5Ntr8tUY+88LC
         +URxCwXqQvSrPl8L5ZX3byE3Zc6/lkQhyex0o3e2VZkVTloHHfqWeL1ZylvshS6Lex5X
         FBsz5knAgQ7NZ+egi6U0TOrzaSpXzqL2BGAVDo9o8rDcXY5E5f1nr3Udu04CMYo2lxAB
         X3VS/a/B0KDwzekqHbdd56IDQwLXwU5xhU38czPAK8ZEn13U0FmJvjKpKdL6bVu5xyZH
         yoRA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18a603asi121375241cf.294.2024.05.29.01.48.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 May 2024 01:48:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sCEyo-0007FS-1z; Wed, 29 May 2024 04:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=oWzJ=NA=kaod.org=clg@ozlabs.org>)
 id 1sCEym-0007F7-Td; Wed, 29 May 2024 04:48:16 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=oWzJ=NA=kaod.org=clg@ozlabs.org>)
 id 1sCEyj-0000Hj-TQ; Wed, 29 May 2024 04:48:16 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Vq31g5Rkwz4x1s;
 Wed, 29 May 2024 18:48:07 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vq31Y2Djdz4wyh;
 Wed, 29 May 2024 18:48:00 +1000 (AEST)
Message-ID: <60541d4f-5829-495c-86fb-4fbf82cf98c8@kaod.org>
Date: Wed, 29 May 2024 10:47:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/16] aspeed/soc: fix incorrect dram size for AST2700
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
References: <20240527080231.1576609-1-jamin_lin@aspeedtech.com>
 <20240527080231.1576609-15-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240527080231.1576609-15-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=oWzJ=NA=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Dwma5CIEfDJz

Hello Jamin

On 5/27/24 10:02, Jamin Lin wrote:
> AST2700 dram size calculation is not back compatible AST2600.
> According to the DDR capacity hardware behavior,
> if users write the data to address which is beyond the ram size,
> it would write the data to address 0.
> For example:
> a. sdram base address "0x4 00000000"
> b. sdram size is 1 GiB
> The available address range is from "0x4 00000000" to "0x4 40000000".
> If users write 0xdeadbeef to address "0x6 00000000",
> the value of DRAM address 0 (base address 0x4 00000000) should be 0xdeadbeef.
> 
> Add aspeed_soc_ast2700_dram_init to calculate the dram size and add
> memory I/O whose address range is from max_ram_size - ram_size to max_ram_size
> and its read/write handler to emulate DDR capacity hardware behavior.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/arm/aspeed_ast27x0.c     | 94 ++++++++++++++++++++++++++++++++++++-
>   include/hw/arm/aspeed_soc.h |  1 +
>   2 files changed, 94 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> index a3a03fc1ca..19380087fa 100644
> --- a/hw/arm/aspeed_ast27x0.c
> +++ b/hw/arm/aspeed_ast27x0.c
> @@ -20,6 +20,7 @@
>   #include "sysemu/sysemu.h"
>   #include "hw/intc/arm_gicv3.h"
>   #include "qapi/qmp/qlist.h"
> +#include "qemu/log.h"
>   
>   static const hwaddr aspeed_soc_ast2700_memmap[] = {
>       [ASPEED_DEV_SPI_BOOT]  =  0x400000000,
> @@ -191,6 +192,97 @@ static qemu_irq aspeed_soc_ast2700_get_irq(AspeedSoCState *s, int dev)
>       return qdev_get_gpio_in(a->intc.gic, sc->irqmap[dev]);
>   }
>   
> +static uint64_t aspeed_ram_capacity_read(void *opaque, hwaddr addr,
> +                                                    unsigned int size)
> +{
> +    qemu_log_mask(LOG_GUEST_ERROR,
> +                  "%s: read @%" PRIx64 " out of ram size\n",
> +                   __func__, addr);
> +    return 0;
> +}
> +
> +static void aspeed_ram_capacity_write(void *opaque, hwaddr addr, uint64_t data,
> +                                                unsigned int size)
> +{
> +    AspeedSoCState *s = ASPEED_SOC(opaque);
> +    uint32_t test_pattern = 0xdeadbeef;
> +    bool invalid_pattern = true;
> +    uint32_t *ram_ptr;
> +    int sz;
> +
> +    ram_ptr = memory_region_get_ram_ptr(s->dram_mr);
> +
> +   /*
> +    * Emulate ddr capacity hardware behavior.
> +    * If writes the test_pattern to address which is beyond the ram size,
> +    * it would write the test_pattern to address 0.
> +    */
> +    for (sz = 4; sz > 0 ; sz--) {
> +        test_pattern = (test_pattern << 4) + sz;
> +        if (data == test_pattern) {
> +            ram_ptr[0] = test_pattern;
> +            invalid_pattern = false;
> +            break;
> +        }
> +    }
> +
> +    if (invalid_pattern) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: write invalid pattern @%" PRIx64
> +                      " to addr @%" HWADDR_PRIx "]\n",
> +                      __func__, data, addr);
> +    }
> +}


I would simplify with write transaction on the DRAM memory region
of the SoC.

For that, initialize a 'dram_as' on top of 'dram_mr' in
aspeed_soc_ast2700_dram_init():

    address_space_init(&s->dram_as, s->dram_mr, "dram");

Then, in aspeed_ram_capacity_write(), add :

   address_space_write(&s->dram_as, addr % ram_size, MEMTXATTRS_UNSPECIFIED,
                                  &data, size);

and check returned error.

It should be enough to detect the RAM size from FW.


Thanks,

C.





> +static const MemoryRegionOps aspeed_ram_capacity_ops = {
> +    .read = aspeed_ram_capacity_read,
> +    .write = aspeed_ram_capacity_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 1,
> +        .max_access_size = 8,
> +    },
> +};
> +
> +/*
> + * SDMC should be realized first to get correct RAM size and max size
> + * values
> + */
> +static bool aspeed_soc_ast2700_dram_init(DeviceState *dev, Error **errp)
> +{
> +    ram_addr_t ram_size, max_ram_size;
> +    Aspeed27x0SoCState *a = ASPEED27X0_SOC(dev);
> +    AspeedSoCState *s = ASPEED_SOC(dev);
> +    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
> +
> +    ram_size = object_property_get_uint(OBJECT(&s->sdmc), "ram-size",
> +                                        &error_abort);
> +    max_ram_size = object_property_get_uint(OBJECT(&s->sdmc), "max-ram-size",
> +                                            &error_abort);
> +
> +    memory_region_init(&s->dram_container, OBJECT(s), "ram-container",
> +                       ram_size);
> +    memory_region_add_subregion(&s->dram_container, 0, s->dram_mr);
> +
> +    /*
> +     * Add a memory region beyond the RAM region to emulate
> +     * ddr capacity hardware behavior.
> +     */
> +    if (ram_size < max_ram_size) {
> +        memory_region_init_io(&a->dram_empty, OBJECT(s),
> +                              &aspeed_ram_capacity_ops, s,
> +                              "ram-empty", max_ram_size - ram_size);
> +
> +        memory_region_add_subregion(s->memory,
> +                                    sc->memmap[ASPEED_DEV_SDRAM] + ram_size,
> +                                    &a->dram_empty);
> +    }
> +
> +    memory_region_add_subregion(s->memory,
> +                      sc->memmap[ASPEED_DEV_SDRAM], &s->dram_container);
> +    return true;
> +}
> +
>   static void aspeed_soc_ast2700_init(Object *obj)
>   {
>       Aspeed27x0SoCState *a = ASPEED27X0_SOC(obj);
> @@ -461,7 +553,7 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
>                       sc->memmap[ASPEED_DEV_SDMC]);
>   
>       /* RAM */
> -    if (!aspeed_soc_dram_init(s, errp)) {
> +    if (!aspeed_soc_ast2700_dram_init(dev, errp)) {
>           return;
>       }
>   
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 9f177b6037..9dbf48f873 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -127,6 +127,7 @@ struct Aspeed27x0SoCState {
>   
>       ARMCPU cpu[ASPEED_CPUS_NUM];
>       AspeedINTCState intc;
> +    MemoryRegion dram_empty;
>   };
>   
>   #define TYPE_ASPEED27X0_SOC "aspeed27x0-soc"

