Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp955450njk;
        Fri, 24 Jan 2025 09:11:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVN1+DlA9eWhQSdOk+bxE6ymGA3T9j7K/SK9/PESw1mnjicvo8XL71b1eFyq8lFQAwtB51gyB54ORG+IQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEUHLN2wKfX4/gN8mnoBzn+rJvC9dBpZNnMIR1mCLU+D9QvVGSV7xgHZXgGzno1LjYFm/uP
X-Received: by 2002:a05:690c:4b11:b0:6ef:4e42:64b5 with SMTP id 00721157ae682-6f6eb67cc4amr254973017b3.16.1737738696607;
        Fri, 24 Jan 2025 09:11:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737738696; cv=none;
        d=google.com; s=arc-20240605;
        b=b8o+p/22tg26nizPncNkPRgjGZq1d4O1cSKBAg2cJ6Sr/0feVW3SR9DQkx/dYPFK9p
         vVkWgc+PHxtGU87HsT6B5zRkdxEynDux/WOCIYu3n38W56+yGMHkbXlZ7opQh7H6aGhF
         CIQ29gYD5WgNmm6mmp5d6oUWhmK1zO6yqNwdvIKiShkga1D+Nu32mKn7iuR9fZMwfmg0
         /wdMF/EIWKfGeucjnu5FygFEt5gvyr9iu0zkhfqhtd0CeiUVhZgvzJTE5dV5XZNd8xXs
         KC3YKr2jG0jqSAKU4UTE6d0m2CKDLrpx+LDWPRmOqJndNZpEzrev5ubE2bSHGlEi7zfK
         Qb/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=h7GDB6hr+bb6mQuwcGJyYDs6n5LeT2y1TOI7F+iwvPk=;
        fh=iRdBN1YoLJCvVUiTTWybEyEWQ1TrofmoeyQxLE4Z5mQ=;
        b=RRlKhsBu0HnZGhVmhCUQlYsg+UC8ADhpis3mqQ84scB5w6L8kKVZbXU9OLqCiq0iDN
         Cf2IP+NpLN3sDZlFrNqRld2yBx1H+1ytw3t4nmvl2OPpQ7ZCt1eFTUt8d0G6bBGcTcuF
         Ezyon0ukA5n1gxW/1w3LiYdKIZfot5m7srB3lgcH/0fMOgxEQO58HiW5+Ty1u8q5HR80
         Cx8UqhqmYBYQ0CNiokn4nZbaLjrZj/hVehmBERY0Su7EyPEajjAk+Ftfw6oWFNFLsohc
         Is3sY6iDRXc7BH3iT8VV3RLulUgWM9yEriWqja2rrpvfwbjIb9KLOhdBpbqePZMwXvMJ
         glpw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GY+T1I3d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 00721157ae682-6f757877325si20345957b3.32.2025.01.24.09.11.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 09:11:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GY+T1I3d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbNDO-0006jD-Rk; Fri, 24 Jan 2025 12:11:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNDO-0006iV-2W
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:11:30 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNDM-00064X-KG
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:11:29 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2166360285dso42463365ad.1
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 09:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737738687; x=1738343487; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h7GDB6hr+bb6mQuwcGJyYDs6n5LeT2y1TOI7F+iwvPk=;
 b=GY+T1I3dkjjFYKluYvy4Lc+WJ54SK0/3RKP1xo2Z5NWWFaUDIZ6rZUMYxIa8tGUFlJ
 UyIwbR4o6cSp+jcDKCZx1qchtDrYmExdcyl29dWWPaqOj4TAfjosB7uaB2WThpY8moBw
 vD8CzSj+FeAAxi+2U3H2BQFAapb2MVmVw/5yX95OayFgzRdYVwZzkGn0pzryrQHoyj4p
 f0xZe22E2XHo1HYQB42maDX4EtPZzIRON2z2hBXCM8EQ0qlDaZeHWDPMuVSJpPEg54bE
 7FjDbvCSiN5V+CEDg3eoq8vwm9QtqY7HCtbj0jjArpzh22mGeTXxgBKFJW8CX9Efwy7D
 zoZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737738687; x=1738343487;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h7GDB6hr+bb6mQuwcGJyYDs6n5LeT2y1TOI7F+iwvPk=;
 b=HBawKDIl/0n5WJZrrZ7Ate3Jz1/amgd2oBAm/IcUeniNj42Tg+o8GxA0/AD8hYl5VH
 r+5sz/C/Pgq6mfq2AjcoBLH2wCmAJcZGLsgfxPYUMI3MBH7kpcn2wht8Ams18hlBKArn
 5uYSlVL4MRkDWWnaRIhdm8VGrn0JF9Xf+voMJ/GLEu0xlHBlrhtqwVtWP0DGgsisp4ez
 JKo0tchLvYCVZRUR8Q2hlb4GDtQQfNjIOhUQUWqifwa/HDiyJY0S1Wqg7k6Xe6URXlBX
 vbBcmRnQfPmyMZpVtNyKJmTw/sF34Y8Auh+NqPy0h9/uJo6vVOF5+exX/Z5/WAvX75XY
 r3hw==
X-Gm-Message-State: AOJu0YybRDDQpOBQ1KeI/6I2mYffJqm17gbYExUNb34Sii6FEqJ03F03
 CmwXVlx6Kx0NSz4bTjjP8VymW/AacEb5Lz/ru8noEbxb/We4YvtPP2eyDdAXQJk=
X-Gm-Gg: ASbGncui4LP3ONBVF6bHTNJZHn54cCG/twWpnIC0rJYPSZi4TModWoy1TkaZCYqGrG4
 U7D4YCLKWVvIiV6nrQMtDjUGLMc522hzocNtRiwMEpYN9h4eZj1jpiKmYUNIA5J8u0NglDJ37wz
 wKvKMlWrwT3FTt2l1FAxJcZq+bUQ49utTt89cAqh/o7YTrizcp1Q8NLryaEjSp8k+kvfehpJf8c
 VeOERTACHCeRK47L0bEmLLKhQ0D9pjxoIM9x47OvP5uLuLbP83X4kNfU+YrC/w3syfOZtLiIW7G
 NUkKpfc6lYuDjnHpDIXh3I81
X-Received: by 2002:a17:903:2342:b0:215:cbbf:8926 with SMTP id
 d9443c01a7336-21c355b053fmr469668635ad.35.1737738687271; 
 Fri, 24 Jan 2025 09:11:27 -0800 (PST)
Received: from [192.168.163.227] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da4141414sm18607445ad.125.2025.01.24.09.11.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:11:26 -0800 (PST)
Message-ID: <a082b2ae-5b50-4f04-acd1-24680169f615@linaro.org>
Date: Fri, 24 Jan 2025 09:11:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/28] target/m68k: Move has_work() from CPUClass to
 SysemuCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-16-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-16-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: +d/TQWV0Lnre

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/m68k/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
> 
> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> index 41dfdf58045..eb7fb4f7e4c 100644
> --- a/target/m68k/cpu.c
> +++ b/target/m68k/cpu.c
> @@ -51,10 +51,12 @@ static void m68k_restore_state_to_opc(CPUState *cs,
>       }
>   }
>   
> +#ifndef CONFIG_USER_ONLY
>   static bool m68k_cpu_has_work(CPUState *cs)
>   {
>       return cs->interrupt_request & CPU_INTERRUPT_HARD;
>   }
> +#endif /* !CONFIG_USER_ONLY */
>   
>   static int m68k_cpu_mmu_index(CPUState *cs, bool ifetch)
>   {
> @@ -543,6 +545,7 @@ static const VMStateDescription vmstate_m68k_cpu = {
>   #include "hw/core/sysemu-cpu-ops.h"
>   
>   static const struct SysemuCPUOps m68k_sysemu_ops = {
> +    .has_work = m68k_cpu_has_work,
>       .get_phys_page_debug = m68k_cpu_get_phys_page_debug,
>   };
>   #endif /* !CONFIG_USER_ONLY */
> @@ -576,7 +579,6 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
>                                          &mcc->parent_phases);
>   
>       cc->class_by_name = m68k_cpu_class_by_name;
> -    cc->has_work = m68k_cpu_has_work;
>       cc->mmu_index = m68k_cpu_mmu_index;
>       cc->dump_state = m68k_cpu_dump_state;
>       cc->set_pc = m68k_cpu_set_pc;

