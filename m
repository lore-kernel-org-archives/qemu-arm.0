Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE6FC43458
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Jul 2026 12:55:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfdQA-0004bd-Qb; Fri, 03 Jul 2026 08:55:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfdQ7-0004aw-UA
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 08:55:03 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfdQ5-0000ky-OK
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 08:55:03 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-664c1406f91so654732d50.0
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2026 05:55:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783083300; cv=none;
 d=google.com; s=arc-20260327;
 b=gFw49tPHExmzbr64WAU1b8JZapSN0ZAT/4o7dyYKcnuOoDpnl4nKfXSHhDHZcXDBYW
 bT9OEh5e2xuhi96hPSW0nkaIYyNbM0nrCny8b5f/tAOsBG8RWVM0aCHUCeEAsfXGDBV6
 Vk4uHwIWP45f0SZSWL8RGngK1che17zKdXk1VIusImaGSBLUkXUaagGiKLUzaSfpLwgE
 2LmRkBFupwEHYffNVTAUNEkG3lD2JmsrWNVJovSFQtVHdRmVW9NlqnWMDCbslf0j6MIy
 d1Fs3jecQ2R0/mEay+DafXbpGykgIlj24EmSbDyW6HQrQtJmY7gbZKNYjsUEP+25soW4
 eMtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=1u2thVlVFjL87EGSVIuQ3xHSUXLpj4VbnSIDZ2PwELc=;
 fh=kMHrFYL3sx1v/hfikDZkkTxZ8TwK0jboUI6aEUQ4cFk=;
 b=q3mIPjmL3w8xMTiU9lQ7umKWklONyIaWWyuqQcwa9Cse92HKNnApGK6tmqp71sm0FQ
 NomGOxpL+lulzfcabOJgUS5Le0WO2HMtqQTOc7e2pG2wQ8CXp0QXBSMjyVqu2OcBmeWP
 5KGcK9R51LXAV7sWQQv/+dU+V/tMYuDwfBhZQRgYKsdNUomIL7T1AOCebN3UyG0CbGIT
 CojMF9KtWEGvO9cmAR9hemBonfFYIdYvnSursPNmewr3/79KTBRozT8lMU8+tAPcWS4m
 JedfsHBCPlc5/wWUnOOcJ8OdOEQp+1vpA59KVT/37wZ20+FrIji8l/yUj3J8/+blYPad
 vELw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783083300; x=1783688100; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1u2thVlVFjL87EGSVIuQ3xHSUXLpj4VbnSIDZ2PwELc=;
 b=tZyuw/UCPppN/HVKscY586oOpwXHu/39DbDCVzyUiechMGJzy2n9g0DD4WxIlgr6/y
 tuzAuMhL1RuWIe1gZZ8FJLqFMokcgvemjsin7qT6yF9UEkQAMXcqFcC+sh8XKXZULhfV
 LpPkskoJWDq2DwVCKGkgoyWYmEO/yMWyeRQ3MuFE/I31yfiHYpcvhVAgW462TyLuWCTL
 +TjV2rxnLz6FrmH+CYRF9yH/ckjkcIvU5HD3Pjmw2xNby+tFkKWb8plmzG/Y19hVdWdP
 FWb4zAQ430K2dy4dzNSzGurnMGocnQJN3GhZ0ZWRZq+lLAzCsQ4PL1rJ8nvX4m2lS8eD
 OkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783083300; x=1783688100;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1u2thVlVFjL87EGSVIuQ3xHSUXLpj4VbnSIDZ2PwELc=;
 b=QjYD5J/EUu2Fx14urdgHoZRKsHpz4sI2xMA4DPuwsujSNfCfozY+imC82OagZoylAS
 ist1nZ4DWc8IWC+X6moCZkwO5NZd4TD0eQ8VoQUGftSeBu+g42062Ga9jYlL/T9+qjzl
 VMh+JYwZWXCbzGcnAGYPf8K+L+mPwKAjcNuiTiZL+Dav1hiY5C8FmzBtTvSug67Mgurf
 +VJLy/JV/XLFFx7VUEkSkRK+MYcW8Daq1A33oPKpPfSGzxAGbdd0vE1O18aZXunfMwpM
 71YIIyLKFvTs4QDpeIikfp07S6ev7abMp7QxvFXnLWCS+J7f+SxKEgE4omTyExxVpER9
 i3sA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpewbr+mQm+tZhkIt/lHFTr0jZQIrYGOUZTIst3t085dP4xYO0QdsOM/vlHQW4I2FOWuVh2KaEobQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw/IkriYbSp9U1rbfUYX332Yx+EvbBNQ2IZKMeBpwxWYh2z2nt2
 oCbuF/vIkofqu2CcczdUyWbsU/HioMLUNxPKGPwvv7zWUCmTwQJvGF10OlP0gtKXsWiu3gW5zxN
 T9Axik6YYGUoZ6mPuxdnBmi9hqOSoyrTAbm18BOiZpw==
X-Gm-Gg: AfdE7cmgQbBIiR6x/iMCyRucDC4XpQhLNsUKKP5aJOjbDfi4DXTpEcJUu2bZuT0nTUC
 jEfwS+gdl8J+Qmp0slY9M8fyH3s90p73jNrwTa7MYudfTzxU4da+2IAy9p6h90ExRGd4zEub9A1
 lQ1tUdZI4y8Q6D0Q5SLM25azJwZIlfDdTauVVoW9kP750MD50RiUvmionD8SXg5e+SHccjP97ON
 WVzl04cC+o0HYvkwak7MiCg9bPDr2LVBKwj/AXnQt0tR/O4q4JEKRdGD8SaqiR5Btbc/JevS22P
 oQWR+WIvU5HVCE4yvmXYBurCeCp76aX33faG9M9+WLFYysoWVEjd/EUU
X-Received: by 2002:a05:690e:1918:b0:664:eac2:b394 with SMTP id
 956f58d0204a3-66521ceff4fmr9105449d50.65.1783083300316; Fri, 03 Jul 2026
 05:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260701091209.2860306-1-eric.auger@redhat.com>
 <20260701091209.2860306-4-eric.auger@redhat.com>
In-Reply-To: <20260701091209.2860306-4-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2026 13:54:48 +0100
X-Gm-Features: AVVi8CcRuAFalwoMTAbI7ZQ4dYf1E7O6ETSL-m--vFfkn3jGqWaNHIWsmkUOOlw
Message-ID: <CAFEAcA8kHPouGSrxb7+NkTRonEoJiub4JNuThSJBr6hncrX0vA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] hw/arm/smmuv3: Sanitize
 SMMU_S_STRTAB_BASE_CFG.LOG2SIZE
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 berrange@redhat.com, skolothumtho@nvidia.com, nicolinc@nvidia.com, 
 nathanc@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Wed, 1 Jul 2026 at 10:12, Eric Auger <eric.auger@redhat.com> wrote:
>
> STRTAB_BASE_CFG.LOG2SIZE is programmed by the guest through the
> emulated SMMUv3 MMIO register interface. Currently the value is
> not checked and used directly in smmu_find_ste() for strtab_base
> alignment computation with risk that MAKE_64BIT_MASK() runs out
> of bounds. On FMT==1 the strtab_size cannot be greater than 64 after
> the SPLIT being at minimum 6 (log2size is max 64).
>
> However on FMT=0 path, strtab_size= log2size + 6 can potentially
> exceed 64. Let's abort in that case.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3632
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/smmuv3.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 285e6164a07..5ec3700d0d5 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1696,6 +1696,14 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
>                  s->sid_split = 6;
>              }
>              s->features |= SMMU_FEATURE_2LVL_STE;
> +        } else {
> +            uint32_t log2size = FIELD_EX32(data, STRTAB_BASE_CFG, LOG2SIZE);
> +
> +            if (log2size + 6 > 64) {
> +                qemu_log_mask(LOG_GUEST_ERROR,
> +                              "Invalid STRTAB_BASE_CFG.LOG2SIZE: %d", log2size);
> +                g_assert_not_reached();

This doesn't look right. Either:
 (a) the guest can do something silly that gets us to this code path:
     in that case we mustn't assert, but must continue (doing whatever
     the spec permits and that is reasonably straightforward to implement)
 (b) we can't actually get here in practice: in that case the logging
     isn't needed and we could just assert(log2size + 6 <= 64);

It sounds like we're in case (a) here.

thanks
-- PMM

