Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp315232njb;
        Wed, 10 Jul 2024 05:11:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVmn+xKjdDUQbN+YLa0YgFE7yiK+01PEjEfttKPhB6SG/irtGAZDkt5/xAVwU18bValkJmDaGC7gFRrXhgbxUqFBe6097dt
X-Google-Smtp-Source: AGHT+IFt8QieL/k5P+CSX61e1Etlbs4jfJ4NDBMpgqJtG6TbAxG0D/EiihcS53HVqQEu6Z25djfd
X-Received: by 2002:a05:620a:4fa:b0:79d:78ac:a2a3 with SMTP id af79cd13be357-79f19bef231mr489879685a.75.1720613513572;
        Wed, 10 Jul 2024 05:11:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720613513; cv=none;
        d=google.com; s=arc-20160816;
        b=RxRMZk8jbjdchlZFvUeP+BDvhEV8TioefY9zyngkNTdHU7ZXccYX+Glez+s5K8XcM7
         m/G3qLpXEzpkqQM+A+co2qGx1j8uhvWUqmmNBl4CxB8wdZHZ2U8rtd0gzl4ZwzsxOBvH
         HbuBXNnJlbIhsNY9GchyKDzhpzCXuZCn/3rp/WSXmhqjnUBqRU8CgwIYaXx20xP6YE36
         Rrg/T+FXIZoyzZOmkE8RDsxXZDZ/Ht++HKyScn2yfhpaQV8a0Z/STubmhC/6xupkL6/d
         tWdiWbq2+igvkSlatO8WyNBAl5jIYLdB/Uuxhizkri77ED6+VjeRTibqDMLSAVqvDVWo
         Gmtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=6/qJqsEaFYL7/E30h2HTan6aSv3KH9Yj9yKyzRwx6IM=;
        fh=rm/kdaPET133yykskS8xfxkdHKlgdt+Au8v/zfBGSUQ=;
        b=pUsBGS3xGnP74NKCdgkw9UYpS+58jzxfLBpkrzUSc7CmuqiH3stJpLv2jLtPs8YIpJ
         wCvvqp7b6VlCmFIuTyCuFGg1vWN6GAekWxIXS3qq1Ry58yc0aPk55bxVOKRBw4RirIno
         BQQ5keh7ITNBnnm0Yy+JOInLlcfLAEEy797isxhjhBJozSP3KUnbO4cMBSfjetmucM5G
         lK/5RmykE8VngA1s2AckzgY2XUuZjqbHVoDU5W/7lBKZeiPK8NZo/TD2uZsKfJZ1qimK
         x3NwaiqbRX89jnvzWqLHc6zNlMdqzj4wx3eZafcOUkM4IyGYkN5OulvLzRTgRsLHjUYf
         L5HQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9ba86f7si45063401cf.278.2024.07.10.05.11.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2024 05:11:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRWAT-00007m-Qh; Wed, 10 Jul 2024 08:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1sRWAQ-00006H-9M; Wed, 10 Jul 2024 08:11:27 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1sRWAN-0005zs-BZ; Wed, 10 Jul 2024 08:11:26 -0400
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 714CE4E600F;
 Wed, 10 Jul 2024 14:11:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id OXSFRbNrVm4M; Wed, 10 Jul 2024 14:11:14 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 76BEF4E6005; Wed, 10 Jul 2024 14:11:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 74E99746E3B;
 Wed, 10 Jul 2024 14:11:14 +0200 (CEST)
Date: Wed, 10 Jul 2024 14:11:14 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Richard Henderson <richard.henderson@linaro.org>
cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongu.org, 
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, max.chou@sifive.com
Subject: Re: [PATCH v2 06/13] target/ppc: Hoist dcbz_size out of
 dcbz_common
In-Reply-To: <20240710032814.104643-7-richard.henderson@linaro.org>
Message-ID: <aedda59d-2a8f-94bd-246d-d32ee6cf19be@eik.bme.hu>
References: <20240710032814.104643-1-richard.henderson@linaro.org>
 <20240710032814.104643-7-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: CcLh6Yd008Tm

On Tue, 9 Jul 2024, Richard Henderson wrote:
> The 970 logic does not apply to dcbzep, which is an e500 insn.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

As all callers pass GETPC() to retaddr maybe that could be moved into 
dcbz_common() as i had in my patch.

Regards,
BALATON Zoltan

> ---
> target/ppc/mem_helper.c | 30 +++++++++++++++---------------
> 1 file changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
> index 361fd72226..5067919ff8 100644
> --- a/target/ppc/mem_helper.c
> +++ b/target/ppc/mem_helper.c
> @@ -271,22 +271,12 @@ void helper_stsw(CPUPPCState *env, target_ulong addr, uint32_t nb,
> }
>
> static void dcbz_common(CPUPPCState *env, target_ulong addr,
> -                        uint32_t opcode, int mmu_idx, uintptr_t retaddr)
> +                        int dcbz_size, int mmu_idx, uintptr_t retaddr)
> {
> -    target_ulong mask, dcbz_size = env->dcache_line_size;
> -    uint32_t i;
> +    target_ulong mask = ~(target_ulong)(dcbz_size - 1);
>     void *haddr;
>
> -#if defined(TARGET_PPC64)
> -    /* Check for dcbz vs dcbzl on 970 */
> -    if (env->excp_model == POWERPC_EXCP_970 &&
> -        !(opcode & 0x00200000) && ((env->spr[SPR_970_HID5] >> 7) & 0x3) == 1) {
> -        dcbz_size = 32;
> -    }
> -#endif
> -
>     /* Align address */
> -    mask = ~(dcbz_size - 1);
>     addr &= mask;
>
>     /* Check reservation */
> @@ -300,7 +290,7 @@ static void dcbz_common(CPUPPCState *env, target_ulong addr,
>         memset(haddr, 0, dcbz_size);
>     } else {
>         /* Slow path */
> -        for (i = 0; i < dcbz_size; i += 8) {
> +        for (int i = 0; i < dcbz_size; i += 8) {
>             cpu_stq_mmuidx_ra(env, addr + i, 0, mmu_idx, retaddr);
>         }
>     }
> @@ -308,12 +298,22 @@ static void dcbz_common(CPUPPCState *env, target_ulong addr,
>
> void helper_dcbz(CPUPPCState *env, target_ulong addr, uint32_t opcode)
> {
> -    dcbz_common(env, addr, opcode, ppc_env_mmu_index(env, false), GETPC());
> +    int dcbz_size = env->dcache_line_size;
> +
> +#if defined(TARGET_PPC64)
> +    /* Check for dcbz vs dcbzl on 970 */
> +    if (env->excp_model == POWERPC_EXCP_970 &&
> +        !(opcode & 0x00200000) && ((env->spr[SPR_970_HID5] >> 7) & 0x3) == 1) {
> +        dcbz_size = 32;
> +    }
> +#endif
> +
> +    dcbz_common(env, addr, dcbz_size, ppc_env_mmu_index(env, false), GETPC());
> }
>
> void helper_dcbzep(CPUPPCState *env, target_ulong addr, uint32_t opcode)
> {
> -    dcbz_common(env, addr, opcode, PPC_TLB_EPID_STORE, GETPC());
> +    dcbz_common(env, addr, env->dcache_line_size, PPC_TLB_EPID_STORE, GETPC());
> }
>
> void helper_icbi(CPUPPCState *env, target_ulong addr)
>
