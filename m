Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp323428njb;
        Wed, 10 Jul 2024 05:26:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU6ALg4pWFdefGnrFdkoMZNFK/E/8LMUiSok6diLn7hnRFm5e+QbhYnFPpQavjhOZDyrIEZd2LHofX4DKrveaO6RNNoWwn5
X-Google-Smtp-Source: AGHT+IE7dv4fkUFhsTsDEfiULVSFEKtNawTLGvmsdcePx67zodLbgUsOicpp92PcrvK0NnVmN43I
X-Received: by 2002:a05:6808:1708:b0:3d9:385d:8754 with SMTP id 5614622812f47-3d93c07bf54mr6012488b6e.47.1720614388611;
        Wed, 10 Jul 2024 05:26:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720614388; cv=none;
        d=google.com; s=arc-20160816;
        b=sM/jy4upBxIz6rJELdyAUBmm/FMsVSTIYgQd6R1WjkFUMYdYkSB47ERQTf4LZIoz6T
         x5oHMDbllgoOmHkG20DZJYhN9krKgXHMpAJ0H9Ca7TIloWBGgRCKEKb8e0qabh6Wz7n/
         e13U5BOwG810vxl4Re4xQB/bubCh6S/CDlWGjk9TY0hzAocBR0nGxIu0lHIRss/w8p5B
         IWdPAMXhi8JMsQE6shLLcEycdTtV93cr5wOObUh+95WNq5LFFdI9A1C8ljpxdHSNUa2B
         8267+n2Rv8QkYa+POSdm55zdZkgeWFcRXOwrmBJoMEoPidf459HhsOYzucZLvJMSPRiX
         MqaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=qvI3slIO4M84yo5QxGGehrC73PsA/EXBcgn9X7gqSeQ=;
        fh=rm/kdaPET133yykskS8xfxkdHKlgdt+Au8v/zfBGSUQ=;
        b=Uwyl6bz0+wbtgGMbMCklNhV+9+tMeYyyg3zfq1QNHL8AWXVwM/CbEZRVC0hl7FvkQO
         U+/BKxTQFu5o/UHkEZ5B9Pd6KLNM8yK9prkhUJEP+NiGy7YowzSxCB+VIIIzR2MmO2TS
         ptLS7RLD6qnTnYIWrGTs/WGgCWe4EHgBNtg3+FaThGuFn8drdKoUFbVD9nplMZGTUXr9
         bkjVM2ng5YiDK0oO9WwTBN/1vCIqA/miydHpultUoqqMpj2YpTVZbd/knzFkuEMXJfp/
         +cberLeU7IqB10++krE4MU3Pfn1uFcfxb6UNJ4yyw12HCzGQAjmxUWyZj95gcdzmF6j8
         N+uA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79f190d8d6bsi446975585a.669.2024.07.10.05.26.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2024 05:26:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sRWOg-000553-Iq; Wed, 10 Jul 2024 08:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1sRWOe-00051q-Qz; Wed, 10 Jul 2024 08:26:08 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1sRWOZ-0000Qk-PV; Wed, 10 Jul 2024 08:26:08 -0400
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id F2DA74E600F;
 Wed, 10 Jul 2024 14:25:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id cwyTVD_7e2AZ; Wed, 10 Jul 2024 14:25:58 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0DF6A4E6005; Wed, 10 Jul 2024 14:25:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0C43E746E3B;
 Wed, 10 Jul 2024 14:25:58 +0200 (CEST)
Date: Wed, 10 Jul 2024 14:25:58 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Richard Henderson <richard.henderson@linaro.org>
cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongu.org, 
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, max.chou@sifive.com
Subject: Re: [PATCH v2 09/13] target/ppc: Improve helper_dcbz for user-only
In-Reply-To: <20240710032814.104643-10-richard.henderson@linaro.org>
Message-ID: <6b2f8ee5-0715-5040-403e-943a16ec170e@eik.bme.hu>
References: <20240710032814.104643-1-richard.henderson@linaro.org>
 <20240710032814.104643-10-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: tzbACtAgWLVR

On Tue, 9 Jul 2024, Richard Henderson wrote:
> Mark the reserve_addr check unlikely.  Use tlb_vaddr_to_host
> instead of probe_write, relying on the memset itself to test
> for page writability.  Use set/clear_helper_retaddr so that
> we can properly unwind on segfault.
>
> With this, a trivial loop around guest memset will spend
> nearly 50% of runtime within helper_dcbz and host memset.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> target/ppc/mem_helper.c | 14 ++++++++++----
> 1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
> index 24bae3b80c..fa4c4f9fa9 100644
> --- a/target/ppc/mem_helper.c
> +++ b/target/ppc/mem_helper.c
> @@ -280,20 +280,26 @@ static void dcbz_common(CPUPPCState *env, target_ulong addr,
>     addr &= mask;
>
>     /* Check reservation */
> -    if ((env->reserve_addr & mask) == addr)  {
> +    if (unlikely((env->reserve_addr & mask) == addr))  {
>         env->reserve_addr = (target_ulong)-1ULL;
>     }
>
>     /* Try fast path translate */
> +#ifdef CONFIG_USER_ONLY
> +    haddr = tlb_vaddr_to_host(env, addr, MMU_DATA_STORE, mmu_idx);
> +#else
>     haddr = probe_write(env, addr, dcbz_size, mmu_idx, retaddr);
> -    if (haddr) {
> -        memset(haddr, 0, dcbz_size);
> -    } else {
> +    if (unlikely(!haddr)) {
>         /* Slow path */
>         for (int i = 0; i < dcbz_size; i += 8) {
>             cpu_stq_mmuidx_ra(env, addr + i, 0, mmu_idx, retaddr);
>         }

Is a return needed here to only get to memset below when haddr != NULL?

Regards,
BALATON Zoltan

>     }
> +#endif
> +
> +    set_helper_retaddr(retaddr);
> +    memset(haddr, 0, dcbz_size);
> +    clear_helper_retaddr();
> }
>
> void helper_dcbz(CPUPPCState *env, target_ulong addr, int mmu_idx)
>
