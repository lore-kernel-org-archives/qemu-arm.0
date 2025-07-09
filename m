Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E73C83F15
	for <qemu-arm@archiver.kernel.org>; Wed,  9 Jul 2025 20:40:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZbaB-0005n5-Tp; Wed, 09 Jul 2025 16:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uZbZo-0005bJ-Vx
 for qemu-arm@nongnu.org; Wed, 09 Jul 2025 16:39:40 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uZbZl-0000yY-Nh
 for qemu-arm@nongnu.org; Wed, 09 Jul 2025 16:39:36 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-73cddf31c45so66323a34.1
 for <qemu-arm@nongnu.org>; Wed, 09 Jul 2025 13:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752093572; x=1752698372; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SYvkKX9rvlgt2s4O3zGo89LmDfVvpAyzm5m0uoXAgLQ=;
 b=cRT6F/UYumbTeFw98Y3b3HSlQee1oXXQgAmHwQQvna0mEUnzPNhH5KRIdvc7XwPyVz
 u5ypg18SajOHFa9bC6474Hn66wE2dfXLekgs1Nly1oUy37elukjmDQPnmxy+fs5IhL3C
 sQwbA+kHD7dpV6gPj5HnQ4hgEfa8YlDh25qvvcxBvfNbdZ1KYLSTdyPOwV+i9oq+Com8
 Uc7F5Q/Upv8SmNVACSrwT0NRuxajW/eXIcsTqhn9SovnpfjZ2AoRjGGQsdBk6q2jTq+W
 nIb0o7w1dR5RCy+l6InNfcBhBLFxakLrF0riRE6TDcUfo5AEyEoTWVVmf0OUfEbnjz23
 AveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752093572; x=1752698372;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SYvkKX9rvlgt2s4O3zGo89LmDfVvpAyzm5m0uoXAgLQ=;
 b=muy6THmfD0DGc2Ui6CHWbA0N8BDTPgKIsvA/qmio/DYmLwAh2yAwUik7eX9VaHTdFT
 YkmTyVu+uLdgmLkKghQIrp5j9H7I7aMfkf73k5yFQCRx4jS/NSvxL5b9sYX8vpahV+yZ
 1WbT9jmbe26DMtIurt7KhfxsNMomQVri8rKuT6W/CYFzZrImS1pmJ46t1FOp5bWIOTn/
 fxGXpQzsJd/jMa9Bf8oGP41bh8YEk+8aWNzsnIEYnEAyz8zZYpV9aQz/10Fq1YJo3fJD
 W5t+Z4KOne5bQ7geIBhhlGsvEV/TakyVoq8TJcJKRPUvrJIUBns9iaN9IywBt/iHHF46
 ywEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSD0QIPek2keP0pEmrIdXooCJyfwE0czaIfDHs8CmBmzv6Wzcqwdg3fw+49/Yb3qOUwfvLPHKbng==@nongnu.org
X-Gm-Message-State: AOJu0YxnXiFuHo2K/UcGIGpLUVlMEezUscPXtKzD/k96QzbcbkWUCTSi
 UnAWK4OVoJXbJ0Ncbi4ddyx3C7K/bxlsZqmlKj/QpZwLH1SitlFMXGGIqPvEcmapmGY=
X-Gm-Gg: ASbGnctdvic39EfvShMIA/dr2Hsgk8lOBukfpY9wehGFbXUzxrxWn6ptcmzX7nWGwYK
 uLs9gejEqlQF3TMAYfctbVZxa3vmYUXjPdRfYOXSx2NeV/O97Lq2a0XBHLYHqE7JXaOPVaM5giF
 s2wXZzueF39rWFnQ3jGRDCkkFMyB22Tzi/V9NhKVpwrs1PECd50Nxn68hSEaNeqJTN+T4Psc53V
 BLKfu55N6QKPa9l2KHa9eDgOJZjVeQLAx4ut1g2mHGDhfFYMm8hdbsSVvc5WLeEY/PmaYMIcBeF
 r5SUaRP0wS0oJazBUJJBZ6y4TUsOK/PgVHUAWCminhNODyan7zKUw1GKKYBY3Rxwb5/jCaB41/t
 vyO4=
X-Google-Smtp-Source: AGHT+IELzcaJqnYk9TG0A/zSqofxFIbL8BS07QTKIAg0843hWZXBWizzHZqTshfToDRu1yuxit6SVg==
X-Received: by 2002:a05:6830:280d:b0:73a:8bf8:56b4 with SMTP id
 46e09a7af769-73cedfe3bf6mr776656a34.13.1752093571873; 
 Wed, 09 Jul 2025 13:39:31 -0700 (PDT)
Received: from [172.20.0.130] ([187.217.227.247])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-73c9f938806sm2478811a34.55.2025.07.09.13.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jul 2025 13:39:31 -0700 (PDT)
Message-ID: <0bf03b23-30bd-436d-b0ae-eaf257d37112@linaro.org>
Date: Wed, 9 Jul 2025 14:39:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] target/arm: Add FEAT_TCR2
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org
References: <20250709180326.1079826-1-gustavo.romero@linaro.org>
 <20250709180326.1079826-5-gustavo.romero@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250709180326.1079826-5-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/9/25 12:03, Gustavo Romero wrote:
> Add FEAT_TCR2, which introduces the TCR2_EL1 and TCR2_EL2 registers.
> These registers are extensions of the TCR_ELx registers and provide
> top-level control of the EL10 and EL20 translation regimes.
> 
> Since the bits in these registers depend on other CPU features, and only
> FEAT_MEC is supported at the moment, the FEAT_TCR2 only implements the
> AMEC bits for now.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>   docs/system/arm/emulation.rst |  1 +
>   target/arm/cpu-features.h     |  5 +++
>   target/arm/cpu.h              |  2 ++
>   target/arm/helper.c           | 60 +++++++++++++++++++++++++++++++++++
>   target/arm/internals.h        | 19 +++++++++++
>   target/arm/tcg/cpu64.c        |  1 +
>   6 files changed, 88 insertions(+)
> 
> diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
> index 66043b0747..1c597d8673 100644
> --- a/docs/system/arm/emulation.rst
> +++ b/docs/system/arm/emulation.rst
> @@ -149,6 +149,7 @@ the following architecture extensions:
>   - FEAT_SPECRES (Speculation restriction instructions)
>   - FEAT_SSBS (Speculative Store Bypass Safe)
>   - FEAT_SSBS2 (MRS and MSR instructions for SSBS version 2)
> +- FEAT_TCR2 (Support for TCR2_ELx)
>   - FEAT_TGran16K (Support for 16KB memory translation granule size at stage 1)
>   - FEAT_TGran4K (Support for 4KB memory translation granule size at stage 1)
>   - FEAT_TGran64K (Support for 64KB memory translation granule size at stage 1)
> diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
> index 44d6b655a9..3878aed589 100644
> --- a/target/arm/cpu-features.h
> +++ b/target/arm/cpu-features.h
> @@ -486,6 +486,11 @@ static inline bool isar_feature_aa64_xs(const ARMISARegisters *id)
>       return FIELD_EX64_IDREG(id, ID_AA64ISAR1, XS) != 0;
>   }
>   
> +static inline bool isar_feature_aa64_tcr2(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64_IDREG(id, ID_AA64MMFR3, TCRX) != 0;
> +}

Should be sorted with other ID_AA64MMFR3 tests (just SCTLR2 so far, which you just added). 
  Secondary sorting by the bit offset (TCRX < SCTLRx).  This tends to place everything in 
a predictable order.

> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> index bdd2fe7f5b..173528175a 100644
> --- a/target/arm/tcg/cpu64.c
> +++ b/target/arm/tcg/cpu64.c
> @@ -1247,6 +1247,7 @@ void aarch64_max_tcg_initfn(Object *obj)
>       t = FIELD_DP64(t, ID_AA64MMFR2, E0PD, 1);     /* FEAT_E0PD */
>       SET_IDREG(isar, ID_AA64MMFR2, t);
>   
> +    FIELD_DP64_IDREG(isar, ID_AA64MMFR3, TCRX, 1);       /* FEAT_TCR2 */
>       FIELD_DP64_IDREG(isar, ID_AA64MMFR3, SCTLRX, 1);     /* FEAT_SCTLR2 */
>       FIELD_DP64_IDREG(isar, ID_AA64MMFR3, SPEC_FPACC, 1); /* FEAT_FPACC_SPEC */

It would be better to use GET_IDREG / FIELD_DP64 / SET_IDREG, as we do for MMFR2 above.
That would begin with the previous patch.


r~

