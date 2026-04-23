Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBA5FAD3E7
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 02:31:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFjqB-0005DL-Kr; Wed, 22 Apr 2026 22:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wFjq7-0005CP-BE
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 22:30:52 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wFjq5-0002u8-Or
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 22:30:51 -0400
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-8ea8563c693so459233685a.2
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 19:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776911449; x=1777516249; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zYDYEXizfW6rvTyRVJFbPKbXP1tHt3hmW5DfTtI+Wqo=;
 b=R1QBeXQmwwFVyCZfWXhGt5WzJPTjlKTtexDiVmvGwd0az3PsRjCkIUxhvADT8xnjTj
 wIUNZEHV5fDFTwObE6EteMzkUfowF6lV7u0bg6It9dCshUUcMqjTeQgNOh77RFHMEOty
 0x4XlRdgYGAaD1N7+HbA2tjXuw5DBuru7MPYudby0jpLYb5E66Zb57JpBDEfIcYCmFiy
 UBdMHL/3Z0hA/+e8cfTGTOgOFPPd70DMo9o2KgNJDvTDvwXZzmX9B1Pcln41QBzFqLTZ
 CePmlWoiHbfKRUy8zOH6iw1t1GwnT+lTAM/irW1BT55vagSgCMZujzbboW1s4QZkqyya
 tccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776911449; x=1777516249;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zYDYEXizfW6rvTyRVJFbPKbXP1tHt3hmW5DfTtI+Wqo=;
 b=ONrPfo/lj5qfnMt9J8n+5PVT8q5uZxKoNfZG0paGxv9cbPS4h3nDN2U/n8cjmV1dRT
 qJSB0WQSpdx6+hOfmwJUqCTTKNmvIx7w9BSScXzSstQ6/Bhk07+0rzyGmJK8gmzUxJJ8
 KgeljuRjSYaSqxy+kai/J3FqdPK15uQyVStZA57rTfnv8IB7Db7uMIpXocPUk24kV16l
 Uatyx40Fq6biTULpm6JsTiDgHDmpQdpIwMBSzjWvj5DRAbXoBMlePl0UXfzDHrq1F57o
 kxbCnQYEXuir8Srm+N0FQqM2w8uy4X+i8I8YqZdWgaUP8GtwjpWFcHj5y6wUj9TDMtfM
 VDmg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8xVmErSt6OL1VtDoyHaoItLMYZmZUlTg4rIYDl+uw0FBaEA2EJyIN4NetXnaLTE4cotteSK6TXgg==@nongnu.org
X-Gm-Message-State: AOJu0YxPQSTJEddfh+3S+hz6dZmFQk61kVy6X65kQmTZn8bciCzEEuAW
 r8C8zAar/OcfuG6OOJUqBwdwN+w4yn4kJFB9kHW72wcEelCnK+RExAyMmRj+H9/WazREzlRXxAu
 djV2jTLU=
X-Gm-Gg: AeBDieuXGYUPWGSZdYmXBHXwxddA4mb0bIy5wSW+cv90PUWZpghq0KN2bnr9EDVnoSV
 +yHryYc3Bz8sxaqnVtWpcGAehB4nhpaVWfeG4t9+pJkxC65fhSGMV9Olt9hQJjOrny6jzK936p5
 RZKdw9DvKmbo/RJ6BhYCzK2ACdD4plYYgWssjkAc31U4yDByHA/SFsieOxD1ktGx7kexHQYi1ku
 GDtJpbzpcTb1T7ZckmJahfVQysmiLUgRAoeMVTPxBBJy1Uirsz04lpopxUgoPiE+8uSFHz6y4Xw
 IbT9Ury5eUWvonZKaKPdn0HkvZuFoQtEu+Ym8kXKLkCJA0clmhamDtaIhwqpo6aC4rOReonXnaV
 VpK6wDVEe7XlKo8AsZ5evsgUdZaWU9DodlTwKY+L9JZ+hEJ6BUilJpNI43DVP+ZcRpZtJS+/5co
 5QX6CkHvz2w2HrS207tqJa+17awYjMfGtkN9jZclB/uXlp20pRNjOCZUm9P2VZ2QHvbDKzXRY3H
 i9lRhTmHGQ5Jct7nstgM1ezOZcb
X-Received: by 2002:a05:620a:178a:b0:8d7:f950:ea68 with SMTP id
 af79cd13be357-8e78f24ddfdmr3724454485a.13.1776911448665; 
 Wed, 22 Apr 2026 19:30:48 -0700 (PDT)
Received: from [10.72.56.227] ([172.59.184.224])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8eb19632130sm1112106685a.41.2026.04.22.19.30.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 19:30:48 -0700 (PDT)
Message-ID: <c780ccb4-1490-4c04-bf15-43822c0b5266@linaro.org>
Date: Thu, 23 Apr 2026 12:30:41 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] target/ppc: Make get_phys_page_debug handle
 non-page-aligned addrs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260417173105.1648172-1-peter.maydell@linaro.org>
 <20260417173105.1648172-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260417173105.1648172-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 4/18/26 03:30, Peter Maydell wrote:
> Currently our implementations of SysemuCPUOps::get_phys_page_debug
> and SysemuCPUOps::get_phys_page_attrs_debug are a mix of "accepts a
> non-page-aligned virtual address and returns the corresponding
> non-page-aligned physical address" and "only returns a page-aligned
> physical address".  This is awkward for callsites, which in practice
> all want the physical address for an arbitrary virtual address and
> have to work around the possibility of getting a page-aligned
> address, and it doesn't account for protection being possibly on a
> sub-page-sized granularity.  We want to standardize on the
> implementation having to handle non-page-aligned addresses.
> 
> The ppc_xlate() function can accept a non-page-aligned input but may
> return a page-aligned output; we take the simple approach of ORing
> the page offset back into the result address after calling it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/ppc/mmu_common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
> 
> diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
> index 52d48615ac..a1345df716 100644
> --- a/target/ppc/mmu_common.c
> +++ b/target/ppc/mmu_common.c
> @@ -863,7 +863,7 @@ hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>                     ppc_env_mmu_index(&cpu->env, false), false) ||
>           ppc_xlate(cpu, addr, MMU_INST_FETCH, &raddr, &s, &p,
>                     ppc_env_mmu_index(&cpu->env, true), false)) {
> -        return raddr & TARGET_PAGE_MASK;
> +        return raddr | (addr & ~TARGET_PAGE_MASK);
>       }
>       return -1;
>   }


