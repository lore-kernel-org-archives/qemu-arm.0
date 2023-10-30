Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1746501ejc;
        Mon, 30 Oct 2023 02:53:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXEnSlp1qaIGJuugKoomANMIRHu+Qz0HEnmI6Cy7h8jeKx4baUZEb7z6PxHChKZp6d2M1E
X-Received: by 2002:a05:620a:8781:b0:778:5dc:fb74 with SMTP id py1-20020a05620a878100b0077805dcfb74mr8031641qkn.68.1698659585877;
        Mon, 30 Oct 2023 02:53:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698659585; cv=none;
        d=google.com; s=arc-20160816;
        b=hEnuHf1GbX7UU5VCD8V9BXLkLDXJxcJJDI8ZZVEXuNqAZdnMuO0HAIkX+hl9fRBi6L
         mdmOZCW4XZqEi5+MrQtXyfbL7MWDBwFXjgrhk1bSMsrnrvleKtpoT/SU4QgDnauDTHPv
         GlCDrbppw2D9xBF2kDY4LJkOuJLHQ2zw5sPd+va4DeRQmkHVPY9qH5AGPyO1g71IgF3K
         dVKQdVTPKQbH01rs7CdFtDIXOeRMpPLO+dMt96oKoNlWSBeKSYSjSqguuexPo1vb3VCv
         YyfnuXw4KMPJ9WHC7FulO8AshTF6VgbpFpUarutNvVUwquCKkfIGiZ4KboupcTJqqNQ1
         1dpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=GBupKdDYd7/M7+TcrdF896J+H3uMDigsIgVmdFb1wSM=;
        fh=MrxszEF/F4kIHHArArVMcXFfLXBu24bCPd92Q4XIY3E=;
        b=yNIDtXHYv6PncSCJGm7cF1LWgwqxTBCaR5Gy02lCs5WZkbCXwvOuu3o8HivySYdwqm
         3R+CF6YbS1yRf3dtwsDNnYktc9OLS/KNuAysXP198+2lPAzm4K5AKwuvoLVPhp1+N9sp
         t5q81eP/LpWzEEBeBbyTa2WbR3Ic/B8QYLCEbDgzkNPRXhmGxL3CXcfeF9SlRlbrLq7k
         M2PDGR+baYKi+ZNTLhcgVisPxByIuMoO8Bt2BMIdXoqEymGWF3b+QWgA22nAU8+Jsbvr
         u9Ba+lJNwuHzjujvEWLwnmkx5WRRb7ymocYlBgMK6+zXBv8X3OZo4m7qUsb+vYkuQZ1C
         uPdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jcTTBruA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ud4-20020a05620a6a8400b00773c2679efcsi5030489qkn.242.2023.10.30.02.53.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 02:53:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jcTTBruA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxOwx-0001sR-5I; Mon, 30 Oct 2023 05:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxOwv-0001s2-Ob
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 05:52:45 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxOwt-0000mr-0C
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 05:52:45 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-543456dbd7bso579735a12.1
 for <qemu-arm@nongnu.org>; Mon, 30 Oct 2023 02:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698659561; x=1699264361; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GBupKdDYd7/M7+TcrdF896J+H3uMDigsIgVmdFb1wSM=;
 b=jcTTBruAF0arex2XJFhh8UQMQC4v/urhkXVp6fqyv1fHbCNbpaKx3u4GcPulUHUYFD
 JibujI4yekyw2+j2n/bpj5FgK2FSKkKycqwe/WUXbK+u/RYUqq3wIVh8r7Hw/KfQ/5HL
 QU+kHLj/X/+OghNGQdcBfOI63zUKncHyavT3cuoqfgJ9hs/L3OCxKnPUcb3hUuAq7S08
 PWQUwQU/n93rKOiTq4Q+I5tqExXnbias1+tnxLUzR8L5a4y+FYH+ewTwp2RmHpEGlVii
 7RN5ovCYplm4dQFF5cQaiRt0NVZMkYPuxW4C/G3FbmglNmkdUigLIxbqGxLzEs3HQVVB
 JPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698659561; x=1699264361;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GBupKdDYd7/M7+TcrdF896J+H3uMDigsIgVmdFb1wSM=;
 b=rtcvmCp7/CN4D2UvIqdvXq608aSvxpV1w21tof3U4pHvmSpc1CKFmlfoq4GJZsPR9O
 fAAsObl647YG506a8wC6qY3RonLJkL/i6OZv134TiLdJAm23b+3OkU5608xi/IBD5Srf
 PposQPFD1gmffgOul+HqRSfFN7ymdF92/veJwM+vBBkXSBxMOdc9keHNNX/yX6XAU1wb
 sljwrIJYRFmhe0SEcP8TU/09XLoNvd+Wx2FhE1eeKHI/vVnp7ANA9slf8PPVM4rUpa3K
 FjI0oUibeXjS0ic/5dAtN8XagWFKkz4DqEkbOP/27k/tcf+7XZ96JWS2UUdFaOS9MiAJ
 3mlw==
X-Gm-Message-State: AOJu0YwTM1fXxE8u9TgiQ+FY5iip1GgYEOLUcTM4R7YkPElln8pwZtf2
 PpCqHT/iSjQR240RIzSkX56naD9sOBzdg/x9CPNElA==
X-Received: by 2002:a05:6402:1d95:b0:540:911b:72b1 with SMTP id
 dk21-20020a0564021d9500b00540911b72b1mr8221943edb.7.1698659560920; Mon, 30
 Oct 2023 02:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20231029210058.38986-1-marielle@novastrider.com>
In-Reply-To: <20231029210058.38986-1-marielle@novastrider.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Oct 2023 09:52:30 +0000
Message-ID: <CAFEAcA8ELCiGy3jDKjJhAd9Zn7Sse9ZSoJ6uQ=u4ROvV3rNcyQ@mail.gmail.com>
Subject: Re: [PATCH] linux-user/elfload: Add missing arm64 hwcap values
To: Marielle Novastrider <marielle@novastrider.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: bR5kMqHun5L+

On Sun, 29 Oct 2023 at 21:01, Marielle Novastrider
<marielle@novastrider.com> wrote:
>
> Specifically DIT, LSE2, and MTE3.
>
> We already expose detection of these via the CPUID interface, but
> missed these from ELF hwcaps.
>
> Signed-off-by: Marielle Novastrider <marielle@novastrider.com>
> ---
>  linux-user/elfload.c | 3 +++
>  target/arm/cpu.h     | 5 +++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 2e3809f03c..d9683809a1 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -768,12 +768,14 @@ uint32_t get_elf_hwcap(void)
>      GET_FEATURE_ID(aa64_sm4, ARM_HWCAP_A64_SM4);
>      GET_FEATURE_ID(aa64_fp16, ARM_HWCAP_A64_FPHP | ARM_HWCAP_A64_ASIMDHP);
>      GET_FEATURE_ID(aa64_atomics, ARM_HWCAP_A64_ATOMICS);
> +    GET_FEATURE_ID(aa64_lse2, ARM_HWCAP_A64_USCAT);
>      GET_FEATURE_ID(aa64_rdm, ARM_HWCAP_A64_ASIMDRDM);
>      GET_FEATURE_ID(aa64_dp, ARM_HWCAP_A64_ASIMDDP);
>      GET_FEATURE_ID(aa64_fcma, ARM_HWCAP_A64_FCMA);
>      GET_FEATURE_ID(aa64_sve, ARM_HWCAP_A64_SVE);
>      GET_FEATURE_ID(aa64_pauth, ARM_HWCAP_A64_PACA | ARM_HWCAP_A64_PACG);
>      GET_FEATURE_ID(aa64_fhm, ARM_HWCAP_A64_ASIMDFHM);
> +    GET_FEATURE_ID(aa64_dit, ARM_HWCAP_A64_DIT);
>      GET_FEATURE_ID(aa64_jscvt, ARM_HWCAP_A64_JSCVT);
>      GET_FEATURE_ID(aa64_sb, ARM_HWCAP_A64_SB);
>      GET_FEATURE_ID(aa64_condm_4, ARM_HWCAP_A64_FLAGM);
> @@ -807,6 +809,7 @@ uint32_t get_elf_hwcap2(void)

These two are correct...

>      GET_FEATURE_ID(aa64_rndr, ARM_HWCAP2_A64_RNG);
>      GET_FEATURE_ID(aa64_bti, ARM_HWCAP2_A64_BTI);
>      GET_FEATURE_ID(aa64_mte, ARM_HWCAP2_A64_MTE);
> +    GET_FEATURE_ID(aa64_mte3, ARM_HWCAP2_A64_MTE3);
>      GET_FEATURE_ID(aa64_sme, (ARM_HWCAP2_A64_SME |
>                                ARM_HWCAP2_A64_SME_F32F32 |
>                                ARM_HWCAP2_A64_SME_B16F32 |
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 76d4cef9e3..7605d6ee3a 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -4073,6 +4073,11 @@ static inline bool isar_feature_aa64_mte(const ARMISARegisters *id)
>      return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, MTE) >= 2;
>  }
>
> +static inline bool isar_feature_aa64_mte3(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, MTE) >= 3;
> +}

...but we don't implement FEAT_MTE3 yet. We would add this feature test
function, and the GET_FEATURE_ID() line, when we do, but we don't
need it until then.

>  static inline bool isar_feature_aa64_sme(const ARMISARegisters *id)
>  {
>      return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SME) != 0;
> --
> 2.39.3 (Apple Git-145)

thanks
-- PMM
