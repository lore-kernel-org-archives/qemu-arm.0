Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D36CD6E44
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 09:48:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSXLl-0003tQ-3T; Thu, 28 May 2026 05:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSXLk-0003t7-4d
 for qemu-arm@nongnu.org; Thu, 28 May 2026 05:48:24 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSXLi-0002J7-M0
 for qemu-arm@nongnu.org; Thu, 28 May 2026 05:48:23 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-65c477a3278so12863776d50.3
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 02:48:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779961701; cv=none;
 d=google.com; s=arc-20240605;
 b=Kll5PC/EKuB7wXjWLv+2UXpPHBxBnG/x+TgblSaD5O+AHuhPsnZoepbCFmTSetkznY
 yGvqofm5EUOjZG2H9TWsvrD3K+vUxKrBmL5ZbfJV0pKw9OBWyJVbxEQ4BhOD6viKJtHy
 G3mo3KaaYOoJ341cbyP/cNL6aHSIsg6rWYHkzZgeIFA/r/00gAeW8jJAeHsZVuz3zc1t
 5o1U99oANX3XY/V5E96YsXhTNGfmcG3VOIxbj0XGO6ezE/HUfzxhuANxk3SRo4TaCFix
 fHN011Tzge+iQoxHt6+BTILe6BaA3TyeqT0xu7aOViBeZKSrzJkTd9yK1fr7a7iqrzt0
 USUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=1HU1zwMXbhz7xLkyYPPNmDVJLve1TXNd/hOzasB73pI=;
 fh=s+xhdkpxGcasYv5WHTkLIFHyFtBtMZntESBkY2mx2F8=;
 b=Au3iuRID7ZJ6BWfhUw/u8zgwxPiDZwpAZycA4Xyc4yCTYKKMpGWDeZ7M2/UOKKQJhH
 oXqUTeCOr3cyFISNsYS9wmm57BxxPJYE3KOER4xo1TBmTfhOG6Xh5XxljvfemPQCxiZE
 GzXNNI6Dux4jNOXmAsAmRKszRAner05GknzVVKuI6eIMPZ02NpmzAe7S7PAkQMhu8/Jf
 9gbTwuDsnwpgxHXfDShOWQMfHSU9SWwVrkmMteZL0seTaltdyA84yZzuchH3en7+oSv7
 dyVp/TFhrPqhVJM+LypGdmqcJOpNLz8py4Jw9nEcAGNSpRnf48qvn4EK0TB+RFpTIkeF
 rV+A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779961701; x=1780566501; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1HU1zwMXbhz7xLkyYPPNmDVJLve1TXNd/hOzasB73pI=;
 b=aUTaN1zBfRnuQ0YkzVi0qsu4yE0wcgds4CHfE6TEA1a1AV03l97knYUvCn/L7TJKEd
 Af1FLQQ9tVbqPZ1EfiR8dWZBPhstwvouWLPc1ZxuiGpZkWM1gFuAM6M07rjrqx/tBSRD
 50BkbcOzP5dIGjm1iyXI/t0uSxJkwJaXO51K2cfBJAif4Ac4JuIAj1uL6kwxm4BCpELH
 toJyraZx3Q1a9M1Y8QFISu+x5YvtqfNNzQobAJamlM5+hUkuS0jO/9J7pX8nncUlKiXO
 tvCObmsyrstdPeEgHwcDq7On6KUal1PcsHbU/QF2/xBDfA+PrqjJkrGj419Izvld/1ha
 heaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779961701; x=1780566501;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1HU1zwMXbhz7xLkyYPPNmDVJLve1TXNd/hOzasB73pI=;
 b=lz+ASAKLkLsSCBQxwfyhSy1RJK3Ewr2yjA147K0W49/OvCwetyVU76Km26o0cJe+Dp
 capJtFJA4yUCMrOKswPmSO9xwOpviWdHmgydnbBFaVTEcS/uSViXkFFMEJgupS7s8Rfy
 jXrCuVboeh+bBjghqb3Qcxo+jxaSvih25r2elE3LIZuFHMcZtAxGqfycoeP/HvKJkXhs
 ecBEhTnH84TB9BzqFPFwgeGvBVNpwZ6EM424dMBIRo+SP52cggVTGbvSD/KXpJKAhGZV
 IHWDSE/WZ7Wt+pVNHQ5VsPKO6qo8ChHEBnQr1Afy4UVn6Ln3KRo2yvs60dx7eS001AuG
 heSw==
X-Gm-Message-State: AOJu0YwHyyUDsgyY0Td2I3PtPy1wDnx6/17Bh1VYJQ/whpT51+aL0ouN
 fsQnr2coZQjqDJZl2ZxhB/oH2btsCAbQqXMQRfNTV5LlO6zIQYMV6yZNgmxB+lHYDUakve3USND
 HzaOlgFiVWveqygfnOYeLjtcDpWzsYIULLDACsg5QLw==
X-Gm-Gg: Acq92OEooDNRGVn4o6riKvAK/wE33ldjFYxSINgJLqPmFirsj+mCBsAsCJLfOoadqi9
 6rCHVFia7VWm4+twQDOM95s8/FuS3Z//B3Mx4bK8/Z5RCklYvEd6dvNpZynnBiSFeUWGMdP75np
 /rO4YTpwVGToxUEwcroRisy/F40bPrRYnh3if/KHIbuMPPfVW/9m/aRE5e1NTiHqtgHZQmJPXDe
 IudVaRXdfs0vCqEmovmyg7N2X40fNg2tHTJUj6dSzp7Udg7v8wZLD+0uZWnLXPr64srHSCZTyQT
 un1ZWIAuEIZsDPn1bV4F7Sa+QBZBGyBZH/IxAXh/rVaJPB7vsf+v/KxO1tncURBDyhQ2o2jrRXp
 1wCmPSEb3jT81
X-Received: by 2002:a05:690e:2513:20b0:65e:14b6:b1c5 with SMTP id
 956f58d0204a3-65ec9658015mr19963825d50.15.1779961701149; Thu, 28 May 2026
 02:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260519153249.31100-1-wrigjl@proton.me>
 <20260524002617.69593-1-wrigjl@proton.me>
 <20260524002617.69593-2-wrigjl@proton.me>
In-Reply-To: <20260524002617.69593-2-wrigjl@proton.me>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2026 10:48:09 +0100
X-Gm-Features: AVHnY4Ljkn0384QaxK9BKn2PghL8VN6RXMmK2qNFWxSONSflpgjUiFaTXcwXR0I
Message-ID: <CAFEAcA9nqbCXxu6A1f6gbBjHWkP=P8a0WgMLTfAUxzqdNm_N9g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] target/arm: implement FEAT_RNG_TRAP for RNDR/RNDRRS
To: Jason Wright <wrigjl@proton.me>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Sun, 24 May 2026 at 01:26, Jason Wright <wrigjl@proton.me> wrote:
>
> Add an .accessfn to the RNDR and RNDRRS system registers that traps
> reads to EL3 when SCR_EL3.TRNDR is set, as required by FEAT_RNG_TRAP.
> Mark SCR_EL3.TRNDR (bit 40) as a writable field in scr_write() when
> the CPU advertises the feature. The pseudocode in DDI0487 revision M.b
> shows the trap firing from EL0, EL1, EL2, and EL3, so there is no
> check of arm_current_el().
>
> When FEAT_RNG_TRAP is implemented without FEAT_RNG, an RNDR/RNDRRS read
> with SCR_EL3.TRNDR=0 should UNDEF rather than succeed; handle that case
> in access_rndr(). Register the rndr_reginfo CP reg entries whenever either
> FEAT_RNG or FEAT_RNG_TRAP is implemented, so the accessfn fires even on a
> FEAT_RNG_TRAP-only CPU.
>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Jason Wright <wrigjl@proton.me>

SCR_EL3.TRNDR = 1 also does one other thing: when it is set,
ID_AA64ISAR0_EL1.RNDR reads as 0b0001, regardless of whether
FEAT_RNG is implemented. (When TRNDR = 0, ID_AA64ISAR0_EL1.RNDR
reports the presence or absence of FEAT_RNG as usual.)

It looks like this patch has missed that bit. We need to give
that ID register a readfn so it can at runtime report the
different value if necessary, similar to what we do with
id_aa64pfr0_read().

thanks
-- PMM

