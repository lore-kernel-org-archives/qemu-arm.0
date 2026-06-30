Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B803C43458
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Jun 2026 14:32:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weZUd-0000dh-2v; Tue, 30 Jun 2026 10:31:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1weZUa-0000d9-Ik
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 10:31:16 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1weZUY-0000lU-4l
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 10:31:16 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2c95a0c0aa2so31751535ad.3
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 07:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782829871; x=1783434671; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4SYKXqQbYYwS3K02zbSGADcDZzlKLU+Sb2cmDV+qFjE=;
 b=JWlErBFYjBq5Ko3WYgh6T1wXGCfQxjDrom1j2KcuRstbahbrUm6rJ7VWWASikJfOTd
 watiwgaZO/+9DMXI8IAumCrlLcRmYGJJ8eEnswq7k9HKks7dXOMzraABdRfbpy0at2oP
 q9DO6ISzdwq9j6krlQiwekDWEfCCXv3+b/Rcx6Uc/zJSiGWrD6Haorng+kKxydC8utsR
 d7BcVYf74LAKajL3NIFX1A39c66hqvC5IM/KhIuxy6BEnXZ9Obn9MQCugMRrTaokhOhK
 kctf5ApIVuW/8KaQ4UhC+f0kUupyGME9NOP8oQWq7hZrlfy015LlxUsEgqYtINAMBldA
 N15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782829871; x=1783434671;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4SYKXqQbYYwS3K02zbSGADcDZzlKLU+Sb2cmDV+qFjE=;
 b=lhx7wJ9T60gqkzcfG8dJksoiQUdDlsg3WDkaUlc2TMSBi1+RXmxvPllvH0ZCiomI7U
 50RNh1La/8KfDWQoCDXWnSNmYXQr5G8T7TFawXAhhGmPVuTOA9JsGcMvSnIt7gVD3ryF
 U+91tpaRML2UjR/58h4qsdklm0Z4QQbAzD1viKd5CPpy6Kt/mP7tHivpMgyYpXERZ6An
 7DGwgPyyQYcZ3ybgbJCzHwihFhmXPcxOC5/5pORNp4ALYKj/FQyjhQ8yXN3ypCJ+eN19
 SNK0rL4m1qVOoGO1aWaIcoxfZojXinKswkBmQiK5INLKIAeGb6Q0ZuVIUB/ZqdvK2uvq
 RsZA==
X-Gm-Message-State: AOJu0YzM+aVvvMwF9oVS2I7145bRMVeL3ipV51XemwFf52I0muRCoZ8C
 w9C5SltpYyf7nqQrb2YciIudqH1dN9ZRCsLAn/iWfKSqCopBueUr6ivfRlsJxmWN5SA=
X-Gm-Gg: AfdE7cl3KFC44LfkuJhlkIXVcZo4rO9sresKQMUD5YXah65BclrOU38MKY4YVjcXuv1
 UgM9QZ85RTnVoxDnqtckY0oLp4dEwkFMuc3+3dCkpLc9gA282vOQOscK2q9N5XoixAFdwkYFYjL
 R6GeIks8G3LO6/IsHQ1jEbq6IcFZJNjkdcH4hDdW0C+rouTQQm5Pt33DegO3lFML5O/jGMYqXNj
 K+OXQozm3M3dYBcLMxSQtumVel8+7NX7IlVzChEvLYAZA3lTPWcMCEt5rCj8bdJQUT7vheOHIL4
 cKt/LFTYhbSp9JjdXUhxSUJiwk5UapllxeT+zc6ENvFO3gXdpYL0fy+x+hR5OGWzJ8YJed2z7wA
 wvbCt6cSzFh3OqIvoO/ZjiZRqwfqIcHvvug67mOYXtaS6CnIlvnpLe6xJ1ahXBdtnOMW64SUJXH
 xdaVePRvSovhChJMQQPjZNJIpzuiLvgciNFR1sM+so7l7yDctDuHwubBNjHSYDrBfeXEVD
X-Received: by 2002:a17:902:d2c1:b0:2c9:9a19:10c with SMTP id
 d9443c01a7336-2ca2ea2393emr32291045ad.40.1782829871361; 
 Tue, 30 Jun 2026 07:31:11 -0700 (PDT)
Received: from [192.168.0.4] (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ca382c5c48sm15185045ad.78.2026.06.30.07.31.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 07:31:10 -0700 (PDT)
Message-ID: <f0662290-e441-43a0-81b5-a9210f90096d@linaro.org>
Date: Tue, 30 Jun 2026 07:31:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/arm/hvf: seed NO_RAW ID registers from
 isar.idregs[] on vCPU init
To: Jason Wright <wrigjl@proton.me>, agraf@csgraf.de, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, zenghui.yu@linux.dev,
 philmd@oss.qualcomm.com
References: <20260529114723.42040-1-peter.maydell@linaro.org>
 <20260529114723.42040-18-peter.maydell@linaro.org>
 <745e66c7-2a9b-4185-bae7-77e10623332b@linux.dev>
 <20260607182221.4357-1-wrigjl@proton.me>
 <20260629205213.82391-1-wrigjl@proton.me>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260629205213.82391-1-wrigjl@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

On 6/29/26 13:52, Jason Wright wrote:
> Commit 887eaa8a29 ("target/arm: implement FEAT_RNG_TRAP for RNDR/RNDRRS")
> gave ID_AA64ISAR0_EL1 a readfn so the RNDR field can reflect SCR_EL3.TRNDR
> at read time, and marked the cpreg ARM_CP_NO_RAW in the system-emulation
> path.  HVF then trips its hvf_arch_init_vcpu() assertion that no ID
> register in hvf_sreg_list[] is NO_RAW, aborting on boot on Apple Silicon:
> 
>    Assertion failed: (!(ri->type & ARM_CP_NO_RAW)),
>    function hvf_arch_init_vcpu, file hvf.c, line 1441.
> 
> Reproduce with:
> 
>    qemu-system-aarch64 -M virt,accel=hvf -cpu host \
>                        -nographic -display none -bios /dev/null
> 
> Fix it the same way ID_AA64PFR0_EL1 already is: list
> HV_SYS_REG_ID_AA64ISAR0_EL1 in the SYNC_NO_RAW_REGS block in sysreg.c.inc
> so the assert loop skips it, and seed the vCPU's copy at init time.
> 
> While here, unify how the three isar.idregs[]-backed ID registers are
> seeded.  isar.idregs[] already holds QEMU's intended value for each (the
> host caps, probed once at realize via hv_vcpu_config_get_feature_reg(),
> plus any QEMU adjustment), so there is no need to read each register back
> from the vCPU first.  Seed PFR0, ISAR0 and MMFR0 directly from
> isar.idregs[], dropping the two per-vCPU hv_vcpu_get_sys_reg() reads:
> 
>    - PFR0: take the GIC sysreg-interface bit from env->gicv3state, as the
>      id_aa64pfr0_read() readfn does.  Identical to the previous code
>      whenever a GICv3 sysreg interface is present (the configuration HVF
>      runs in practice); it differs only in that a vCPU with no GICv3 now
>      reports ID_AA64PFR0_EL1.GIC == 0 instead of inheriting the host's
>      value, which matches the field's meaning.
>    - ISAR0: no overlay is needed; HVF does not expose EL3, so
>      SCR_EL3.TRNDR is never set and the readfn is constant.
>    - MMFR0: still clamp PARANGE to the chosen IPA size, updating
>      isar.idregs[] in place because the page-table walker and the
>      ID_AA64MMFR0_EL1 cpreg resetvalue read PARANGE back from there.
> 
> Reported-by: Zenghui Yu<zenghui.yu@linux.dev>
> Suggested-by: Peter Maydell<peter.maydell@linaro.org>
> Fixes: 887eaa8a29 ("target/arm: implement FEAT_RNG_TRAP for RNDR/RNDRRS")
> Signed-off-by: Jason Wright<wrigjl@proton.me>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

