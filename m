Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp330493ejb;
        Tue, 31 Jan 2023 23:58:32 -0800 (PST)
X-Google-Smtp-Source: AK7set90M4tN5JPd5D0kbGUMa1A2LObzCe4nqcvIUHud8dGOR1gQBu2T5Pl0FpAjJZij4ASL74aS
X-Received: by 2002:ac8:4e52:0:b0:3b8:6b0c:9fd with SMTP id e18-20020ac84e52000000b003b86b0c09fdmr2386203qtw.44.1675238312330;
        Tue, 31 Jan 2023 23:58:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675238312; cv=none;
        d=google.com; s=arc-20160816;
        b=iOW3bInv0c5sBj2v09NlnSEUMhjqmEs4nog0qWqcFv4YMEO0WJC70TlF0mjwEGA3XV
         +1j0jOIiC6T+TO8yLOUShXdo+NVJOLuJ+mPgjzHXv8lqU6Zmn05wg1G31hSNwgp+ISqR
         WvbM/2MLE9C+XeVOQ4rjC0WN+lAdd+o9KtKjj7nSTgpcM5x3EWygN6vRq3jTfEG2jBKh
         TWbSHooyMXcs54s611BDRb65bLLJSb2i9q2HCFbmpi7yFvch/JLY9j5V8pR283ShiA8n
         sFr9G3ci02ENtv/rqi8hEmJbWRZhRpgRflDKeUw5h6NgC/M7htqPWtToigNdj9wIpbN4
         AIDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=GZ/PoxqfltCFqp9FdvOcbRhpyRkEOazrW34PB13psuw=;
        b=P44/Er5F3WV5JaDbp38/TQxGrWDs7TRedXpX76VEJ7aXq67XQXbmiZucdgdXm1TX64
         6R5axdeQPoZMofoLuKmyfRUUwkZzi+sxMhWGgggsSSumOV8ME+qgL0t5v8LGflJbJWOH
         u4LdeAL7S95PtrEu580mpATIbGuCpNRPHaW3tB+9oqbI5tGDEXeZoqEf/4K+tS/xFg5/
         dQUnrLgYn4nynuJAFIOu5U1rDKEL9a1oXIeq7HFzL0njZClcqtCcRrRsxz8cO6Nf3UzM
         rugZAPLjhgMuUUXIYvTviGjUwlqbxlcANMu8QsW51WZEW2YOfu++xVIjoFtO7mK3Sw3n
         xkNw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h19-20020a05620a285300b007102c15d69bsi9111506qkp.125.2023.01.31.23.58.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Jan 2023 23:58:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN80h-0000il-3S; Wed, 01 Feb 2023 02:58:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pN80f-0000iR-Qu
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 02:58:25 -0500
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pN80d-0001Vn-K8
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 02:58:25 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.250])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 4AC2221772;
 Wed,  1 Feb 2023 07:58:18 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Wed, 1 Feb
 2023 08:58:18 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005cfd219af-e247-4267-b0b1-feda3f112ac5,
 F0C8195E27B16437EDCB3A2BE992E155E5E23C80) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <131c30d3-5ada-8f94-8c1a-84419c39b461@kaod.org>
Date: Wed, 1 Feb 2023 08:58:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 08/25] hw/arm/boot: Export write_bootloader for Aspeed
 machines
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
References: <20230119123449.531826-1-clg@kaod.org>
 <20230119123449.531826-9-clg@kaod.org>
 <CACPK8XfW6peVF27_YthCubp-9J8aGpKp5x15-2-qpusnV=4Dzg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8XfW6peVF27_YthCubp-9J8aGpKp5x15-2-qpusnV=4Dzg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: f54f502e-e93a-4a26-afc1-f002bcbddbf7
X-Ovh-Tracer-Id: 1988902187836410787
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudefhedgudduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieekheekheehjefgffekffevgeeludffieetjeeugfeftdejkeeggfevffeviefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpphhhihhlmhgusehlihhnrghrohdrohhrghdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: fqihCyARNqTE

On 2/1/23 06:45, Joel Stanley wrote:
> On Thu, 19 Jan 2023 at 12:37, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> AST2600 Aspeed machines have an home made boot loader for secondaries.
>> To improve support, export the internal ARM boot loader and use it
>> instead.
> 
> I didn't quite follow why we're doing this. Is it just a cleanup?

It comes from this discussion :

   https://lore.kernel.org/qemu-devel/20221222215549.86872-1-philmd@linaro.org/

I will leave Phil handle it. The patch is on the list now.

Thanks,

C.


>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   include/hw/arm/boot.h | 24 ++++++++++++++++++++++++
>>   hw/arm/aspeed.c       | 42 ++++++++++++++++++++++--------------------
>>   hw/arm/boot.c         | 34 +++++++---------------------------
>>   3 files changed, 53 insertions(+), 47 deletions(-)
>>
>> diff --git a/include/hw/arm/boot.h b/include/hw/arm/boot.h
>> index f18cc3064f..23edd0d31b 100644
>> --- a/include/hw/arm/boot.h
>> +++ b/include/hw/arm/boot.h
>> @@ -183,4 +183,28 @@ void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
>>                                               const struct arm_boot_info *info,
>>                                               hwaddr mvbar_addr);
>>
>> +typedef enum {
>> +    FIXUP_NONE = 0,     /* do nothing */
>> +    FIXUP_TERMINATOR,   /* end of insns */
>> +    FIXUP_BOARDID,      /* overwrite with board ID number */
>> +    FIXUP_BOARD_SETUP,  /* overwrite with board specific setup code address */
>> +    FIXUP_ARGPTR_LO,    /* overwrite with pointer to kernel args */
>> +    FIXUP_ARGPTR_HI,    /* overwrite with pointer to kernel args (high half) */
>> +    FIXUP_ENTRYPOINT_LO, /* overwrite with kernel entry point */
>> +    FIXUP_ENTRYPOINT_HI, /* overwrite with kernel entry point (high half) */
>> +    FIXUP_GIC_CPU_IF,   /* overwrite with GIC CPU interface address */
>> +    FIXUP_BOOTREG,      /* overwrite with boot register address */
>> +    FIXUP_DSB,          /* overwrite with correct DSB insn for cpu */
>> +    FIXUP_MAX,
>> +} FixupType;
>> +
>> +typedef struct ARMInsnFixup {
>> +    uint32_t insn;
>> +    FixupType fixup;
>> +} ARMInsnFixup;
>> +
>> +void arm_write_bootloader(const char *name, hwaddr addr,
>> +                          const ARMInsnFixup *insns, uint32_t *fixupcontext,
>> +                          AddressSpace *as);
>> +
>>   #endif /* HW_ARM_BOOT_H */
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index 4919a1fe9e..c373bd2851 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -198,33 +198,35 @@ struct AspeedMachineState {
>>   static void aspeed_write_smpboot(ARMCPU *cpu,
>>                                    const struct arm_boot_info *info)
>>   {
>> -    static const uint32_t poll_mailbox_ready[] = {
>> +    AddressSpace *as = arm_boot_address_space(cpu, info);
>> +    static const ARMInsnFixup poll_mailbox_ready[] = {
>>           /*
>>            * r2 = per-cpu go sign value
>>            * r1 = AST_SMP_MBOX_FIELD_ENTRY
>>            * r0 = AST_SMP_MBOX_FIELD_GOSIGN
>>            */
>> -        0xee100fb0,  /* mrc     p15, 0, r0, c0, c0, 5 */
>> -        0xe21000ff,  /* ands    r0, r0, #255          */
>> -        0xe59f201c,  /* ldr     r2, [pc, #28]         */
>> -        0xe1822000,  /* orr     r2, r2, r0            */
>> -
>> -        0xe59f1018,  /* ldr     r1, [pc, #24]         */
>> -        0xe59f0018,  /* ldr     r0, [pc, #24]         */
>> -
>> -        0xe320f002,  /* wfe                           */
>> -        0xe5904000,  /* ldr     r4, [r0]              */
>> -        0xe1520004,  /* cmp     r2, r4                */
>> -        0x1afffffb,  /* bne     <wfe>                 */
>> -        0xe591f000,  /* ldr     pc, [r1]              */
>> -        AST_SMP_MBOX_GOSIGN,
>> -        AST_SMP_MBOX_FIELD_ENTRY,
>> -        AST_SMP_MBOX_FIELD_GOSIGN,
>> +        { 0xee100fb0 },  /* mrc     p15, 0, r0, c0, c0, 5 */
>> +        { 0xe21000ff },  /* ands    r0, r0, #255          */
>> +        { 0xe59f201c },  /* ldr     r2, [pc, #28]         */
>> +        { 0xe1822000 },  /* orr     r2, r2, r0            */
>> +
>> +        { 0xe59f1018 },  /* ldr     r1, [pc, #24]         */
>> +        { 0xe59f0018 },  /* ldr     r0, [pc, #24]         */
>> +
>> +        { 0xe320f002 },  /* wfe                           */
>> +        { 0xe5904000 },  /* ldr     r4, [r0]              */
>> +        { 0xe1520004 },  /* cmp     r2, r4                */
>> +        { 0x1afffffb },  /* bne     <wfe>                 */
>> +        { 0xe591f000 },  /* ldr     pc, [r1]              */
>> +        { AST_SMP_MBOX_GOSIGN },
>> +        { AST_SMP_MBOX_FIELD_ENTRY },
>> +        { AST_SMP_MBOX_FIELD_GOSIGN },
>> +        { 0, FIXUP_TERMINATOR }
>>       };
>> +    uint32_t fixupcontext[FIXUP_MAX] = { 0 };
>>
>> -    rom_add_blob_fixed("aspeed.smpboot", poll_mailbox_ready,
>> -                       sizeof(poll_mailbox_ready),
>> -                       info->smp_loader_start);
>> +    arm_write_bootloader("aspeed.smpboot", info->smp_loader_start,
>> +                         poll_mailbox_ready, fixupcontext, as);
>>   }
>>
>>   static void aspeed_reset_secondary(ARMCPU *cpu,
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index 3d7d11f782..ed6fd7c77f 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -59,26 +59,6 @@ AddressSpace *arm_boot_address_space(ARMCPU *cpu,
>>       return cpu_get_address_space(cs, asidx);
>>   }
>>
>> -typedef enum {
>> -    FIXUP_NONE = 0,     /* do nothing */
>> -    FIXUP_TERMINATOR,   /* end of insns */
>> -    FIXUP_BOARDID,      /* overwrite with board ID number */
>> -    FIXUP_BOARD_SETUP,  /* overwrite with board specific setup code address */
>> -    FIXUP_ARGPTR_LO,    /* overwrite with pointer to kernel args */
>> -    FIXUP_ARGPTR_HI,    /* overwrite with pointer to kernel args (high half) */
>> -    FIXUP_ENTRYPOINT_LO, /* overwrite with kernel entry point */
>> -    FIXUP_ENTRYPOINT_HI, /* overwrite with kernel entry point (high half) */
>> -    FIXUP_GIC_CPU_IF,   /* overwrite with GIC CPU interface address */
>> -    FIXUP_BOOTREG,      /* overwrite with boot register address */
>> -    FIXUP_DSB,          /* overwrite with correct DSB insn for cpu */
>> -    FIXUP_MAX,
>> -} FixupType;
>> -
>> -typedef struct ARMInsnFixup {
>> -    uint32_t insn;
>> -    FixupType fixup;
>> -} ARMInsnFixup;
>> -
>>   static const ARMInsnFixup bootloader_aarch64[] = {
>>       { 0x580000c0 }, /* ldr x0, arg ; Load the lower 32-bits of DTB */
>>       { 0xaa1f03e1 }, /* mov x1, xzr */
>> @@ -149,9 +129,9 @@ static const ARMInsnFixup smpboot[] = {
>>       { 0, FIXUP_TERMINATOR }
>>   };
>>
>> -static void write_bootloader(const char *name, hwaddr addr,
>> -                             const ARMInsnFixup *insns, uint32_t *fixupcontext,
>> -                             AddressSpace *as)
>> +void arm_write_bootloader(const char *name, hwaddr addr,
>> +                          const ARMInsnFixup *insns, uint32_t *fixupcontext,
>> +                          AddressSpace *as)
>>   {
>>       /* Fix up the specified bootloader fragment and write it into
>>        * guest memory using rom_add_blob_fixed(). fixupcontext is
>> @@ -213,8 +193,8 @@ static void default_write_secondary(ARMCPU *cpu,
>>           fixupcontext[FIXUP_DSB] = CP15_DSB_INSN;
>>       }
>>
>> -    write_bootloader("smpboot", info->smp_loader_start,
>> -                     smpboot, fixupcontext, as);
>> +    arm_write_bootloader("smpboot", info->smp_loader_start,
>> +                         smpboot, fixupcontext, as);
>>   }
>>
>>   void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
>> @@ -1173,8 +1153,8 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
>>           fixupcontext[FIXUP_ENTRYPOINT_LO] = entry;
>>           fixupcontext[FIXUP_ENTRYPOINT_HI] = entry >> 32;
>>
>> -        write_bootloader("bootloader", info->loader_start,
>> -                         primary_loader, fixupcontext, as);
>> +        arm_write_bootloader("bootloader", info->loader_start,
>> +                             primary_loader, fixupcontext, as);
>>
>>           if (info->write_board_setup) {
>>               info->write_board_setup(cpu, info);
>> --
>> 2.39.0
>>
>>

