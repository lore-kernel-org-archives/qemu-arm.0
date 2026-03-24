Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC60F54AB8
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Mar 2026 13:34:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w51uG-00084P-Ep; Tue, 24 Mar 2026 09:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1w51uF-000846-22
 for qemu-arm@nongnu.org; Tue, 24 Mar 2026 09:34:51 -0400
Received: from mail-vk1-xa44.google.com ([2607:f8b0:4864:20::a44])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1w51uD-0003FV-Bf
 for qemu-arm@nongnu.org; Tue, 24 Mar 2026 09:34:50 -0400
Received: by mail-vk1-xa44.google.com with SMTP id
 71dfb90a1353d-56a8fdaddebso1545234e0c.0
 for <qemu-arm@nongnu.org>; Tue, 24 Mar 2026 06:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774359288; x=1774964088; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=35we+WfrubkBZmvNiww3m8Pfsu7szo+HvCClejAuJBg=;
 b=glKQSKx1f8l5mjI6ULd/6OOm/7baTRL3aeefo+uVxyDjUzqy6uPdKqpdreMoqDuRSw
 wA34uoUVMAyRqKGOHkLMv47Ub0gWX0+zdGjHHYEMshCnf8dYKAOsCjTPuc2mxL+fJYuZ
 UlndythDwwbLFpcXvfKD0LLLD5ceRAq7kWbS/uj+IzzPVy/DZ1f7Dnpxnf4Ufh3epugu
 rHD5jGYMyuXXU8AoPF/fitOkofW99g380MGvFsFjw3SEqkbhE8A8QXH/GSulvHxs3+jy
 H20R1dY/xAMuIaMeTHyngdwm+dszzSSaMrdhRPS9vO1EJvpl0Ty8jbar6j1ci4oOFOrt
 Gz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774359288; x=1774964088;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=35we+WfrubkBZmvNiww3m8Pfsu7szo+HvCClejAuJBg=;
 b=Lf1g/iePQXIQ4Nt/COtNBQah2XVpnV81Tecnx/KC3hQc0yWahU6hz02FA0YsY226JO
 CTC7iuxhtHuknm/pEtDRZ7RRrFKOEeNv0up2hthojvUOIyu7fP5l55v8YsagAA6pf1Id
 89WjjU5ALExk/qY7d1IQjai//blBwaJl3wK8Yqvhmu6u0d8App5nBb7iI2b4fYqHxUQ3
 4PKE0WRqvA6Y6MQJJJyXWV67NVoE0oKJP+rz0UkXRidE+4GVQbdG0ayPc+zKBQ+Tw2BS
 Lv2reRf+uKbH5Wv+ojtKqd5fDT1V6OwOtwZwARdLLglGkUWzTihQjpsFqM/M1zw4IbDH
 +hAg==
X-Gm-Message-State: AOJu0YwKi5AqCoa0mqZlHZ2VyCPsLT/qKg++DKoyZtRQZwtBj4hrHiOW
 40SjJCj18dtkFjwst/ALvtk07ec+rZ/kxbdUgRGM6R9VI2v6Kbgl1LTtbmD/kaO9L/4=
X-Gm-Gg: ATEYQzx1KTy+gkywC5RjF28rOrBmW1YpsTaiQ8lnzQOCfGgu6jJTObOEu86nkDBiB9i
 9HG3IeBDfho1uI2ihsd1hBRreBXsPjLAucSpFHcmu9MDhDLmgLicjcR3zjbBh3q+z+0DjQwsnpQ
 UUTEnE4hTX6hAhzEmG4G3Ew+SkwVVq0WIu6UqSOkz9ONELyuA4dsk08dQCwODwnb53OwwY0c61q
 nJcEhilEf1ydZRnHnTPbls1LTcaYzN946v+KYbZjJOxmbCwsfMR0FYXoG4/pXza6ZdnkR1dLV/m
 kObHyignfm/84+iqxK++7a8MI7CH0BfcrrNVU3CGCELXg/xbJ14n4pMA5p/iOzU2dEaXEFy6ZHv
 hmY/85BNbrUm6O8oReVMPz1UrArzKj/AsgOKLD4UcdQCmfi+fLYYdZ4MYl2C9VYF/y8GLeHmvwo
 GFEYtSgFWWtHc58K6tmAglFAhhaGDODeNFZvD1
X-Received: by 2002:a05:6122:d1e:b0:56c:d59a:cfe4 with SMTP id
 71dfb90a1353d-56cde47e3camr7644720e0c.17.1774359287810; 
 Tue, 24 Mar 2026 06:34:47 -0700 (PDT)
Received: from [192.168.0.103] ([177.146.137.168])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-56cddb94eaasm14971403e0c.8.2026.03.24.06.34.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 06:34:47 -0700 (PDT)
Message-ID: <22a212da-76cb-4319-8e1d-a64524eae11c@linaro.org>
Date: Tue, 24 Mar 2026 10:34:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] target/arm: fix s2prot not set for two-stage PMSA
 translations
To: Jose Martins <josemartins90@gmail.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, richard.henderson@linaro.org
References: <20260321231916.2852653-1-josemartins90@gmail.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20260321231916.2852653-1-josemartins90@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a44;
 envelope-from=gustavo.romero@linaro.org; helo=mail-vk1-xa44.google.com
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

Hi Jose,

On 3/21/26 20:19, Jose Martins wrote:
> commit 015cefc0ed65 ("target/arm: Add in_prot_check to S1Translate")
> changed get_phys_addr_twostage() to combine stage 1 and stage 2
> permissions using the new s2prot field:
> 
>    result->f.prot = s1_prot & result->s2prot;
> 
> The LPAE stage 2 path sets result->s2prot explicitly, but the PMSA
> stage 2 path (get_phys_addr_pmsav8) only sets result->f.prot, leaving
> s2prot at zero. This causes the combined permission to be zero,
> resulting in addr_read being set to -1 in the TLB entry and triggering
> an assertion in atomic_mmu_lookup() when the guest executes an atomic
> instruction on a two-stage PMSA platform (e.g. Cortex-R52 with EL2).
> 
> Set s2prot from f.prot after the PMSA stage 2 lookup, consistent with
> what the LPAE path does.
> 
> Fixes: 015cefc0ed65 ("target/arm: Add in_prot_check to S1Translate")
> Signed-off-by: Jose Martins <josemartins90@gmail.com>
> ---
> This issue was found while running a Bao hypervisor [1] demo on the
> mps3-an536 machine, which features a Cortex-R52 with virtualization
> support (PMSAv8 with EL2). Bao uses the stage 2 PMSA MPU to partition
> memory between guest VMs. With QEMU >= 10.2.0 the demo crashes
> immediately after the first guest VCPU is scheduled, when the guest
> executes its first atomic instruction:
> 
>    ERROR:../accel/tcg/cputlb.c:1848:atomic_mmu_lookup: \
>        code should not be reached
> 
> To reproduce, clone the bao-demos repository [2] and follow the
> instructions for the mps3-an536 platform and baremetal demo. With this
> patch applied, the demo boots successfully.
> 
> [1] https://github.com/bao-project/bao-hypervisor
> [2] https://github.com/bao-project/bao-demos
> 
>   target/arm/ptw.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 8b8dc09e72..e289f88124 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -3200,6 +3200,13 @@ static bool get_phys_addr_pmsav8(CPUARMState *env,
>   
>       ret = pmsav8_mpu_lookup(env, address, access_type, ptw->in_prot_check,
>                               mmu_idx, secure, result, fi, NULL);
> +    /*
> +     * For two-stage PMSA translations, s2prot holds the stage 2
> +     * permissions to be combined with stage 1 in get_phys_addr_twostage().
> +     */
> +    if (regime_is_stage2(mmu_idx)) {
> +        result->s2prot = result->f.prot;
> +    }
>       if (sattrs.subpage) {
>           result->f.lg_page_size = 0;
>       }

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo

