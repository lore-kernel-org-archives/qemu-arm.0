Received: by 2002:a17:906:ca8a:b0:a63:3083:985b with SMTP id js10csp309372ejb;
        Mon, 27 May 2024 23:54:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUGSY1FS4xalDuybS9j94SLyCuEqiwn5CTB/Uq4qxZqllJgYliWLvyEmbpEvcmQTp0KVSlk5Pmprh2vhTEdRrd60AR1y5ms
X-Google-Smtp-Source: AGHT+IFuMczd9gPKsq9ZgFr/TUXSYgksQ8Mp+NCFxlSNCy+J6ktTgui5l5UWkunH0IB2mvul7Am2
X-Received: by 2002:a81:431c:0:b0:627:972f:babe with SMTP id 00721157ae682-62a08eeddb6mr111100137b3.50.1716879244031;
        Mon, 27 May 2024 23:54:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716879244; cv=none;
        d=google.com; s=arc-20160816;
        b=WEBh3vSkrpI0iNuAu2rr9GfVaXVqfaheKcHa/V3lsZSvfq/ALCsoYkQibN9g4pINw1
         ke6NWWvxvm0nWrDLhDHyFsSwLmK5oTcbJGj4P+8TF7eQbIKDvx5c8l+3YK1ftt5Hmeq4
         Y51q+Y4TQAmN7VhjvTLF5LQlTkD3TRhmFgI8raVYo11MyFaClCC2PH3BkwL8I90wVmX1
         xJuK7/mrfe86m+ZG+uVr8KEhpJhXm/S+oM9OXDZ8a5pxp9UemXyFXwPPy6JWSmo4p6VZ
         LQSam/hZ2pW8tkl3ixsineHSjt4N6rRhF3rV2U0kD69sn2bVYXrfgsP9pR5RUvX5wKnv
         Pffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=FWRVfVkC/GcdinKQllAmwMeuY7FRNh4mGqAWHz1ITBs=;
        fh=GVpuD+f5VFhxVLzAQQCzEs7iUI2e/2dlSxojvjPsRcA=;
        b=xCy1KkyrOdprvN4mIN9TzyaZad0nvoMGLXl9RURej/mCe+G0rkvnDakzN9GtPenMqm
         /Wo9FHDsn4isdJ+laEzK0ydfJ1KO0yKlHMBfIKSiTOb7dcPJmiEdkBF41lIpj6QvLXZ/
         MamiePaiNm8cld1Moa65r/RsWOyzojXOzkQ04ik1+e/kZeLeWLtdkNUWdSsfKJOesYGh
         P5LidKb1P1HOgFW5MJ2Ny2PZWX6Y5WCJ8ryAH6C0UVzm70++Yp90L/hoqHddj49yDcRG
         WPidM8fTT4MDMPO6W/vVjqB22dT6W+uFsQZNQ1kR0ok+KDMD7TmLG+WVBd+xwcOTVKOI
         BIsw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794d5984100si23880185a.247.2024.05.27.23.54.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2024 23:54:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBqiW-0001FL-GV; Tue, 28 May 2024 02:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=HxTW=M7=kaod.org=clg@ozlabs.org>)
 id 1sBqiU-0001DG-Qh; Tue, 28 May 2024 02:53:50 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=HxTW=M7=kaod.org=clg@ozlabs.org>)
 id 1sBqiS-0002J4-2K; Tue, 28 May 2024 02:53:50 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4VpNX66Gf7z4x2d;
 Tue, 28 May 2024 16:53:42 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VpNX13BlGz4wyj;
 Tue, 28 May 2024 16:53:37 +1000 (AEST)
Message-ID: <4cc3df8f-6d61-4c70-a7ce-94e2cbf96a7d@kaod.org>
Date: Tue, 28 May 2024 08:53:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SPAM] Re: [PATCH v4 08/16] aspeed/smc: support 64 bits dma dram
 address
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240527080231.1576609-1-jamin_lin@aspeedtech.com>
 <20240527080231.1576609-9-jamin_lin@aspeedtech.com>
 <2d64463d-0694-4d6e-a8c4-5bfad2cf801d@linaro.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <2d64463d-0694-4d6e-a8c4-5bfad2cf801d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=HxTW=M7=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
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
X-TUID: 6qU66sEyDzkL

On 5/27/24 18:06, Philippe Mathieu-Daudé wrote:
> Hi Jamin,
> 
> On 27/5/24 10:02, Jamin Lin wrote:
>> AST2700 support the maximum dram size is 8GiB
>> and has a "DMA DRAM Side Address High Part(0x7C)"
>> register to support 64 bits dma dram address.
>> Add helper routines functions to compute the dma dram
>> address, new features and update trace-event
>> to support 64 bits dram address.
>>
>> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
>> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
>> ---
>>   hw/ssi/aspeed_smc.c         | 52 +++++++++++++++++++++++++++++++------
>>   hw/ssi/trace-events         |  2 +-
>>   include/hw/ssi/aspeed_smc.h |  1 +
>>   3 files changed, 46 insertions(+), 9 deletions(-)
> 
> 
>> +static uint64_t aspeed_smc_dma_dram_addr(AspeedSMCState *s)
>> +{
>> +    return s->regs[R_DMA_DRAM_ADDR] |
>> +        ((uint64_t) s->regs[R_DMA_DRAM_ADDR_HIGH] << 32);
>> +}
>> +
>>   static uint32_t aspeed_smc_dma_len(AspeedSMCState *s)
>>   {
>>       AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
>> @@ -903,24 +921,34 @@ static void aspeed_smc_dma_checksum(AspeedSMCState *s)
>>   static void aspeed_smc_dma_rw(AspeedSMCState *s)
>>   {
>> +    AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
>> +    uint64_t dma_dram_offset;
>> +    uint64_t dma_dram_addr;
>>       MemTxResult result;
>>       uint32_t dma_len;
>>       uint32_t data;
>>       dma_len = aspeed_smc_dma_len(s);
>> +    dma_dram_addr = aspeed_smc_dma_dram_addr(s);
>> +
>> +    if (aspeed_smc_has_dma64(asc)) {
>> +        dma_dram_offset = dma_dram_addr - s->dram_base;
>> +    } else {
>> +        dma_dram_offset = dma_dram_addr;
> 
> Here s->dram_base is 0x0. Do we really need to check
> aspeed_smc_has_dma64?

You are right, it could be done as your proposal below. However,
we should add a comment regarding some values :

R_DMA_DRAM_ADDR_HIGH and s->dram_base are only set on the AST2700
SoC and zero on other Aspeed SoCs.

>> +    }
> 
> Maybe simplify improving aspeed_smc_dma_dram_addr() as:
> 
>    static uint64_t aspeed_smc_dma_dram_addr(AspeedSMCState *s)
>    {
>        return (s->regs[R_DMA_DRAM_ADDR]
>                | ((uint64_t) s->regs[R_DMA_DRAM_ADDR_HIGH] << 32))
>                - s->dram_base;
>    }
> 
> Then no need for dma_dram_offset, dma_dram_addr is enough.

we need both, dma_dram_offset for the transaction and dma_dram_addr
to update the R_DMA_DRAM_ADDR_HIGH reg. A bit cumbersome, I agree.

Thanks,

C.


> 
>>       trace_aspeed_smc_dma_rw(s->regs[R_DMA_CTRL] & DMA_CTRL_WRITE ?
>>                               "write" : "read",
>>                               s->regs[R_DMA_FLASH_ADDR],
>> -                            s->regs[R_DMA_DRAM_ADDR],
>> +                            dma_dram_offset,
>>                               dma_len);
>>       while (dma_len) {
>>           if (s->regs[R_DMA_CTRL] & DMA_CTRL_WRITE) {
>> -            data = address_space_ldl_le(&s->dram_as, s->regs[R_DMA_DRAM_ADDR],
>> +            data = address_space_ldl_le(&s->dram_as, dma_dram_offset,
>>                                           MEMTXATTRS_UNSPECIFIED, &result);
>>               if (result != MEMTX_OK) {
>> -                aspeed_smc_error("DRAM read failed @%08x",
>> -                                 s->regs[R_DMA_DRAM_ADDR]);
>> +                aspeed_smc_error("DRAM read failed @%" PRIx64,
>> +                                 dma_dram_offset);
>>                   return;
>>               }
>> @@ -940,11 +968,11 @@ static void aspeed_smc_dma_rw(AspeedSMCState *s)
>>                   return;
>>               }
>> -            address_space_stl_le(&s->dram_as, s->regs[R_DMA_DRAM_ADDR],
>> +            address_space_stl_le(&s->dram_as, dma_dram_offset,
>>                                    data, MEMTXATTRS_UNSPECIFIED, &result);
>>               if (result != MEMTX_OK) {
>> -                aspeed_smc_error("DRAM write failed @%08x",
>> -                                 s->regs[R_DMA_DRAM_ADDR]);
>> +                aspeed_smc_error("DRAM write failed @%" PRIx64,
>> +                                 dma_dram_offset);
>>                   return;
>>               }
>>           }
>> @@ -953,8 +981,12 @@ static void aspeed_smc_dma_rw(AspeedSMCState *s)
>>            * When the DMA is on-going, the DMA registers are updated
>>            * with the current working addresses and length.
>>            */
>> +        dma_dram_offset += 4;
>> +        dma_dram_addr += 4;
>> +
>> +        s->regs[R_DMA_DRAM_ADDR_HIGH] = dma_dram_addr >> 32;
>> +        s->regs[R_DMA_DRAM_ADDR] = dma_dram_addr & 0xffffffff;
>>           s->regs[R_DMA_FLASH_ADDR] += 4;
>> -        s->regs[R_DMA_DRAM_ADDR] += 4;
>>           dma_len -= 4;
>>           s->regs[R_DMA_LEN] = dma_len;
>>           s->regs[R_DMA_CHECKSUM] += data;
>> @@ -1107,6 +1139,9 @@ static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
>>       } else if (aspeed_smc_has_dma(asc) && addr == R_DMA_LEN &&
>>                  aspeed_smc_dma_granted(s)) {
>>           s->regs[addr] = DMA_LENGTH(value);
>> +    } else if (aspeed_smc_has_dma(asc) && aspeed_smc_has_dma64(asc) &&
>> +               addr == R_DMA_DRAM_ADDR_HIGH) {
>> +        s->regs[addr] = DMA_DRAM_ADDR_HIGH(value);
>>       } else {
>>           qemu_log_mask(LOG_UNIMP, "%s: not implemented: 0x%" HWADDR_PRIx "\n",
>>                         __func__, addr);
>> @@ -1239,6 +1274,7 @@ static const VMStateDescription vmstate_aspeed_smc = {
>>   static Property aspeed_smc_properties[] = {
>>       DEFINE_PROP_BOOL("inject-failure", AspeedSMCState, inject_failure, false),
>> +    DEFINE_PROP_UINT64("dram-base", AspeedSMCState, dram_base, 0),
>>       DEFINE_PROP_LINK("dram", AspeedSMCState, dram_mr,
>>                        TYPE_MEMORY_REGION, MemoryRegion *),
>>       DEFINE_PROP_END_OF_LIST(),
> 

