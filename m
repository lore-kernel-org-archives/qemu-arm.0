Received: by 2002:a05:7022:ef03:b0:7c:9548:a19d with SMTP id qy3csp2059244dlb;
        Tue, 7 May 2024 07:20:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXJi8h6rojtUMlk3IDTCKRUvQPOxcPHwYB7k21MtKrHF1oMVdVR1ZnMV8RI26t5gMqdgs8aLBsN4SWCA7LOYf4ZMW8yRd63
X-Google-Smtp-Source: AGHT+IHnA6bdcRHJYlnJjfkPM9X6+qiyc55I1pEUwbpIm89c+8YsHcID8lu6aYi/sYmL47cIjzEY
X-Received: by 2002:a05:620a:7e4:b0:792:957f:b17f with SMTP id k4-20020a05620a07e400b00792957fb17fmr6357137qkk.72.1715091644385;
        Tue, 07 May 2024 07:20:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715091644; cv=none;
        d=google.com; s=arc-20160816;
        b=B1noOFUehKpE3p/kNyRv7lVNoz5T+PYrHbqyUZNOWaGUtL1/pVEV9f2eizORU55y7e
         PkO13E1vuA1D0unEfe2doyqZQq1uS9z2KSjoQ2jAo82E9gNyqf3wiIPwPunE4n9AkILo
         xiC4JYEcdNZ1aQh5hGR8DAOVnS+6zQeyNC49zvCg7ucb00230D7kaIibVMQid4hxQYxY
         1cyf0TRXZuUhCU94Ip2M3/NAoKVQnXNhMAw87XwHgPzouqO+K/acfUuriUkynvBDgPRg
         Qc797Tv3s7E4/pdg8UOE/Q7JFNyo26Wmw8kL0HRXUZt4nyn7RtlEoE1TgetFAxHVLXrg
         i83w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=atYzKQsjWO8KdKKZ09kPNo/dnJ8gpAYHVRXM7urgMak=;
        fh=dkl4W7Ty5DQDYblIuR6iwQV8rfkW6Bl5VLJjLin9mSc=;
        b=pC5WxPGGhvE+XW0Y2ggCtVzO/ocHQcC1i9lvbhylevnxzUPK7qm8uq2sXoKMPv2CbF
         WXfHpltw6v0M8e6wTPUf5fY2vFJuKfuRRhaI7THmdPaAbnuJXM4uh5avsy/tTamhdPUv
         G1QbLrpAMHmWdPgfiALyOA/Kr0bk1+FipAzgH9AgvdMCRKaZe8g6TcbC0TZWOnqQRWXT
         jSMcUKfNuBecV6ezDVVgHMSxIMNovmFPWFriPEQTqGXqsltTkRNtw0uyz6I369MYyt+V
         I9veEBrcjk2MYtA1nQKbpWZc+FnxNhDG90MOwwoUOGa/9vW/Qf4ntnGoJZcSQCcM7C9z
         TSuQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id wg26-20020a05620a569a00b00792a478c236si2677082qkn.498.2024.05.07.07.20.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 May 2024 07:20:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s4LgI-0003CR-PP; Tue, 07 May 2024 10:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=IG/P=MK=kaod.org=clg@ozlabs.org>)
 id 1s4LgG-0003BY-Av; Tue, 07 May 2024 10:20:32 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=IG/P=MK=kaod.org=clg@ozlabs.org>)
 id 1s4LgB-00055C-U9; Tue, 07 May 2024 10:20:31 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4VYgRB4gXJz4x2y;
 Wed,  8 May 2024 00:20:22 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VYgR57591z4x0x;
 Wed,  8 May 2024 00:19:58 +1000 (AEST)
Message-ID: <986d0cea-611d-46cd-a266-99bac6a62c55@kaod.org>
Date: Tue, 7 May 2024 16:19:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/16] aspeed/smc: support 64 bits dma dram address
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
 <20240416091904.935283-9-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240416091904.935283-9-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=IG/P=MK=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DuK4uqcxeIOK


Hello Jamin,

To handle the DMA DRAM Side Address High register, we should reintroduce
an "dram-base" property which I removed a while ago. Something like :



diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 7f32e43ff6f3..6d8ef6bc968f 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -76,6 +76,7 @@ struct AspeedSMCState {
      AddressSpace flash_as;
      MemoryRegion *dram_mr;
      AddressSpace dram_as;
+    uint64_t     dram_base;
  
      AddressSpace wdt2_as;
      MemoryRegion *wdt2_mr;
diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 38858e4fdec1..3417949ad8a3 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -500,6 +500,8 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
      }
  
      /* FMC, The number of CS is set at the board level */
+    object_property_set_int(OBJECT(&s->fmc), "dram-base",
+                            sc->memmap[ASPEED_DEV_SDRAM], &error_abort);
      object_property_set_link(OBJECT(&s->fmc), "dram", OBJECT(s->dram_mr),
                               &error_abort);
      if (!sysbus_realize(SYS_BUS_DEVICE(&s->fmc), errp)) {
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 3fa783578e9e..29ebfc0fd8c8 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1372,6 +1372,7 @@ static const VMStateDescription vmstate_aspeed_smc = {
  
  static Property aspeed_smc_properties[] = {
      DEFINE_PROP_BOOL("inject-failure", AspeedSMCState, inject_failure, false),
+    DEFINE_PROP_UINT64("dram-base", AspeedSMCState, dram_base, 0),
      DEFINE_PROP_LINK("dram", AspeedSMCState, dram_mr,
                       TYPE_MEMORY_REGION, MemoryRegion *),
      DEFINE_PROP_LINK("wdt2", AspeedSMCState, wdt2_mr,



With that, see below for more comments,

On 4/16/24 11:18, Jamin Lin wrote:
> AST2700 support the maximum dram size is 8GiB
> and has a "DMA DRAM Side Address High Part(0x7C)"
> register to support 64 bits dma dram address.
> Add helper routines functions to compute the dma dram
> address, new features and update trace-event
> to support 64 bits dram address.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/ssi/aspeed_smc.c | 66 +++++++++++++++++++++++++++++++++++++++------
>   hw/ssi/trace-events |  2 +-
>   2 files changed, 59 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 71abc7a2d8..a67cac3d0f 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -132,6 +132,9 @@
>   #define   FMC_WDT2_CTRL_BOOT_SOURCE      BIT(4) /* O: primary 1: alternate */
>   #define   FMC_WDT2_CTRL_EN               BIT(0)
>   
> +/* DMA DRAM Side Address High Part (AST2700) */
> +#define R_DMA_DRAM_ADDR_HIGH   (0x7c / 4)
> +
>   /* DMA Control/Status Register */
>   #define R_DMA_CTRL        (0x80 / 4)
>   #define   DMA_CTRL_REQUEST      (1 << 31)
> @@ -187,6 +190,7 @@
>    *   0x1FFFFFF: 32M bytes
>    */
>   #define DMA_DRAM_ADDR(asc, val)   ((val) & (asc)->dma_dram_mask)
> +#define DMA_DRAM_ADDR_HIGH(val)   ((val) & 0xf)
>   #define DMA_FLASH_ADDR(asc, val)  ((val) & (asc)->dma_flash_mask)
>   #define DMA_LENGTH(val)         ((val) & 0x01FFFFFF)
>   
> @@ -207,6 +211,7 @@ static const AspeedSegments aspeed_2500_spi2_segments[];
>   #define ASPEED_SMC_FEATURE_DMA       0x1
>   #define ASPEED_SMC_FEATURE_DMA_GRANT 0x2
>   #define ASPEED_SMC_FEATURE_WDT_CONTROL 0x4
> +#define ASPEED_SMC_FEATURE_DMA_DRAM_ADDR_HIGH 0x08
>   
>   static inline bool aspeed_smc_has_dma(const AspeedSMCClass *asc)
>   {
> @@ -218,6 +223,11 @@ static inline bool aspeed_smc_has_wdt_control(const AspeedSMCClass *asc)
>       return !!(asc->features & ASPEED_SMC_FEATURE_WDT_CONTROL);
>   }
>   
> +static inline bool aspeed_smc_has_dma_dram_addr_high(const AspeedSMCClass *asc)
> +{
> +    return !!(asc->features & ASPEED_SMC_FEATURE_DMA_DRAM_ADDR_HIGH);
> +}
> +
>   #define aspeed_smc_error(fmt, ...)                                      \
>       qemu_log_mask(LOG_GUEST_ERROR, "%s: " fmt "\n", __func__, ## __VA_ARGS__)
>   
> @@ -747,6 +757,9 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int size)
>           (aspeed_smc_has_dma(asc) && addr == R_DMA_CTRL) ||
>           (aspeed_smc_has_dma(asc) && addr == R_DMA_FLASH_ADDR) ||
>           (aspeed_smc_has_dma(asc) && addr == R_DMA_DRAM_ADDR) ||
> +        (aspeed_smc_has_dma(asc) &&
> +         aspeed_smc_has_dma_dram_addr_high(asc) &&
> +         addr == R_DMA_DRAM_ADDR_HIGH) ||
>           (aspeed_smc_has_dma(asc) && addr == R_DMA_LEN) ||
>           (aspeed_smc_has_dma(asc) && addr == R_DMA_CHECKSUM) ||
>           (addr >= R_SEG_ADDR0 &&
> @@ -847,6 +860,23 @@ static bool aspeed_smc_inject_read_failure(AspeedSMCState *s)
>       }
>   }
>   
> +static uint64_t aspeed_smc_dma_dram_addr(AspeedSMCState *s)
> +{
> +    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
> +    uint64_t dram_addr_high;
> +    uint64_t dma_dram_addr;
> +
> +    if (aspeed_smc_has_dma_dram_addr_high(asc)) {
> +        dram_addr_high = s->regs[R_DMA_DRAM_ADDR_HIGH];
> +        dram_addr_high <<= 32;
> +        dma_dram_addr = dram_addr_high | s->regs[R_DMA_DRAM_ADDR];
> +    } else {
> +        dma_dram_addr = s->regs[R_DMA_DRAM_ADDR];
> +    }
> +
> +    return dma_dram_addr;
> +}
> +
>   static uint32_t aspeed_smc_dma_len(AspeedSMCState *s)
>   {
>       AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
> @@ -914,24 +944,34 @@ static void aspeed_smc_dma_checksum(AspeedSMCState *s)
>   
>   static void aspeed_smc_dma_rw(AspeedSMCState *s)
>   {
> +    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
> +    uint64_t dram_addr_high;

dram_addr_high can be removed

> +    uint64_t dma_dram_addr;
> +    uint64_t dram_addr;

please call this variable dma_dram_offset, I found it less confusing.

>       MemTxResult result;
>       uint32_t dma_len;
>       uint32_t data;
>   
>       dma_len = aspeed_smc_dma_len(s);
> +    dma_dram_addr = aspeed_smc_dma_dram_addr(s);
> +
> +    if (aspeed_smc_has_dma_dram_addr_high(asc)) {
> +        dram_addr = dma_dram_addr - s->dram_mr->container->addr;
> +    } else {
> +        dram_addr = dma_dram_addr;
> +    }
>

With the new "dram-base" property, the above if can be replaced by :

     dma_dram_offset = dma_dram_addr - s->dram_base;


Thanks,

C.


>       trace_aspeed_smc_dma_rw(s->regs[R_DMA_CTRL] & DMA_CTRL_WRITE ?
>                               "write" : "read",
>                               s->regs[R_DMA_FLASH_ADDR],
> -                            s->regs[R_DMA_DRAM_ADDR],
> +                            dram_addr,
>                               dma_len);
>       while (dma_len) {
>           if (s->regs[R_DMA_CTRL] & DMA_CTRL_WRITE) {
> -            data = address_space_ldl_le(&s->dram_as, s->regs[R_DMA_DRAM_ADDR],
> +            data = address_space_ldl_le(&s->dram_as, dram_addr,
>                                           MEMTXATTRS_UNSPECIFIED, &result);
>               if (result != MEMTX_OK) {
> -                aspeed_smc_error("DRAM read failed @%08x",
> -                                 s->regs[R_DMA_DRAM_ADDR]);
> +                aspeed_smc_error("DRAM read failed @%" PRIx64, dram_addr);
>                   return;
>               }
>   
> @@ -951,11 +991,10 @@ static void aspeed_smc_dma_rw(AspeedSMCState *s)
>                   return;
>               }
>   
> -            address_space_stl_le(&s->dram_as, s->regs[R_DMA_DRAM_ADDR],
> +            address_space_stl_le(&s->dram_as, dram_addr,
>                                    data, MEMTXATTRS_UNSPECIFIED, &result);
>               if (result != MEMTX_OK) {
> -                aspeed_smc_error("DRAM write failed @%08x",
> -                                 s->regs[R_DMA_DRAM_ADDR]);
> +                aspeed_smc_error("DRAM write failed @%" PRIx64, dram_addr);
>                   return;
>               }
>           }
> @@ -964,8 +1003,15 @@ static void aspeed_smc_dma_rw(AspeedSMCState *s)
>            * When the DMA is on-going, the DMA registers are updated
>            * with the current working addresses and length.
>            */
> +        dram_addr += 4;
> +        dma_dram_addr += 4;
> +        if (aspeed_smc_has_dma_dram_addr_high(asc)) {
> +            dram_addr_high = dma_dram_addr >> 32;
> +            s->regs[R_DMA_DRAM_ADDR_HIGH] = dram_addr_high;
> +        }
> +
> +        s->regs[R_DMA_DRAM_ADDR] = dma_dram_addr & 0xffffffff;
>           s->regs[R_DMA_FLASH_ADDR] += 4;
> -        s->regs[R_DMA_DRAM_ADDR] += 4;
>           dma_len -= 4;
>           s->regs[R_DMA_LEN] = dma_len;
>           s->regs[R_DMA_CHECKSUM] += data;
> @@ -1118,6 +1164,10 @@ static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
>       } else if (aspeed_smc_has_dma(asc) && addr == R_DMA_LEN &&
>                  aspeed_smc_dma_granted(s)) {
>           s->regs[addr] = DMA_LENGTH(value);
> +    } else if (aspeed_smc_has_dma(asc) &&
> +               aspeed_smc_has_dma_dram_addr_high(asc) &&
> +               addr == R_DMA_DRAM_ADDR_HIGH) {
> +        s->regs[addr] = DMA_DRAM_ADDR_HIGH(value);
>       } else {
>           qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx "\n",
>                         __func__, addr);
> diff --git a/hw/ssi/trace-events b/hw/ssi/trace-events
> index 2d5bd2b83d..7b5ad6a939 100644
> --- a/hw/ssi/trace-events
> +++ b/hw/ssi/trace-events
> @@ -6,7 +6,7 @@ aspeed_smc_do_snoop(int cs, int index, int dummies, int data) "CS%d index:0x%x d
>   aspeed_smc_flash_write(int cs, uint64_t addr,  uint32_t size, uint64_t data, int mode) "CS%d @0x%" PRIx64 " size %u: 0x%" PRIx64" mode:%d"
>   aspeed_smc_read(uint64_t addr,  uint32_t size, uint64_t data) "@0x%" PRIx64 " size %u: 0x%" PRIx64
>   aspeed_smc_dma_checksum(uint32_t addr, uint32_t data) "0x%08x: 0x%08x"
> -aspeed_smc_dma_rw(const char *dir, uint32_t flash_addr, uint32_t dram_addr, uint32_t size) "%s flash:@0x%08x dram:@0x%08x size:0x%08x"
> +aspeed_smc_dma_rw(const char *dir, uint32_t flash_addr, uint64_t dram_addr, uint32_t size) "%s flash:@0x%08x dram:@0x%" PRIx64 " size:0x%08x"
>   aspeed_smc_write(uint64_t addr,  uint32_t size, uint64_t data) "@0x%" PRIx64 " size %u: 0x%" PRIx64
>   aspeed_smc_flash_select(int cs, const char *prefix) "CS%d %sselect"
>   

