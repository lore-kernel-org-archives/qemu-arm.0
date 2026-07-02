Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8A9C43458
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Jul 2026 09:06:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfDN3-0007DQ-F4; Thu, 02 Jul 2026 05:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfDN2-0007Bl-Fm
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 05:06:08 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfDN0-0007Ob-T0
 for qemu-arm@nongnu.org; Thu, 02 Jul 2026 05:06:08 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-664f0a76a74so2030283d50.1
 for <qemu-arm@nongnu.org>; Thu, 02 Jul 2026 02:06:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782983165; cv=none;
 d=google.com; s=arc-20260327;
 b=Y6/GhI59DEWYCIJWOIiIlY/okKCSk4QTYhgFKtyezxj/Q8ZE2T78ORaCjcDZiBlN1x
 bycpyZGnmefY7stdMP0OJsi7rb7/25KbWesd6+smx8U/Tb7HM3vqMYQgX5Gn7SNdd6kP
 j+WtC1gb0VVuNuXhtddmDx3icLtotcXTWl19LVyv1rjelaDFpKbZvvBSFRZu4ojEZ4/4
 HdMGBOjI2rFm2eAYMaALb4xBcwD2C1fuULWWie3f0REb0kEtpwPhSRN32RyZHxG6Whs6
 ZDWCgEQ8OeNzwxL734y9x7oFPGddlh7GqGS0h/AXKJ95rtZCwEIEEc1ioomWWWI8Qq/b
 IviA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=9cEOkumq398N7Qdu+51eDUcOf7lxn3XziNGH2X2hLww=;
 fh=8maI3F1Cd09aWmtypVpVpUSWt88Ar/ZdVxpXkWQVVeM=;
 b=EQc6pu6qxtFBXT7aD0wtHQHpNr2d5r9ag3f1q0P78ImiXBaPi1qjUQAv3EGPfedlrT
 E5r2a+aBv1C7Cjh+WQbhboAhCTuk7cp4gCDDMvD6DLSHHUoPzlH+62JFdVw+qDu8+qmf
 rMq/Kj5j3TgAQJFG+IWKKz8PgzeR9H2fW/8SvANDiLNEPxE7VjlcQiBgJwfXZVeLW9Z3
 kMSeTbf8TjsU2dwgzz0UY9CH67C+74Eb7x5MsCd0dkMoqnukQ3yctrCMQUslOOrGgtnt
 qX5dZxVePpL6QM53Bs1P+cj+pUepu3iXOpmqIkXigGFI74H/1pXaivMvX3y98E/5LBH6
 O5cQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782983165; x=1783587965; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9cEOkumq398N7Qdu+51eDUcOf7lxn3XziNGH2X2hLww=;
 b=tAe6NTgNpe9fHHYEM9ynMzBYvzBzN+Vjf4Wo/UgHOx93c6hLKK2Af7+9q/FwW679G5
 4wi65h1IAV5PFldojNAOsNhc/nwWa9Xs5n80uc9FNqTi7/nI7Xk1mgAnMVMMU02AJoju
 fQ1KBc+XTDPH4q1Fpo07lBdAYf2572ajyuD1x+seakfvfibjZDq5qSn/ayd4HIaeDuFh
 VcO5c84ebWV7CNlJ3vRGnjXh2/fTxb8kBpVjNGaOzM0JO/7Y4uxRBPY4zLzqfgbTUyeV
 9rTQ9awFxfXsRnfdDTEKVtXByyKyuRi6j6LQeSluGFrSofEqLdtCDDGjvUjGdJsuq5rV
 I/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782983165; x=1783587965;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9cEOkumq398N7Qdu+51eDUcOf7lxn3XziNGH2X2hLww=;
 b=ZfVD8Zq6mmzWwp97qPLzN+Q/Dtlam5JlM3L8GhOgeYI4gNC58XDe7kjwSbzPnFWrKa
 imZUDNPsc8YGQkfIfJSauvzUoPaifs4/eJTCahZHHuNfP3z1G465tOHJbZ4dVhdXqfN4
 jFPN+uSLkiUes+RYC9YgeYNJC3jheB/pFP8qDQzhHM3jIDkeV53hk7KYprlgZ6bEj1gU
 UZAb6lylZFTnwvHKwE5Vuk17xzxl9TtK4J4jk3VUi/vTybd+UNbjK/TKztUKLhWGrdr7
 lcVikjiClrvqxHTyyFbTRVAl5jwCIdP3ESAd8nhtm0nSGztlLwONokigomtFei2pVAhk
 zMxg==
X-Gm-Message-State: AOJu0YxaDBmBhK0dNXN0Ra4eUvE2gZTZ1gUHpz32qesKNpaHFNvFfN+X
 E5GLbtoAV+EMMvcvSs77Y9CRge6otOC9OsBEWBIfG3RcBzC4xw8RtStqNnCkZqxJzl7nH+AeFyH
 0mmvWrLzllDiE0N7gut/ZfMpqD0kcPCvL+df6GDR5s147shJ7ydjQ
X-Gm-Gg: AfdE7cnanBYmWzhRhfniBaBu24RLcZqluGKw+pdofZ0rn9OujM3qsu6O6B9UQORBvBG
 Zx2O6IXwSZYvc4kc53zVr5qasT+iJrO7yvI9DbsF49jiey81DPs+kc++tKQog/09X67i0UKpIfm
 lVetZ0AjLg/dhrO8mksVlXBQ7BPgj3t0dlEuEef8jRipoTOK/sNJPPJklhZazwQUrL7e85y54wx
 DO/J/Pb54fY1Um4UQA4unxIJs5Gkz3pCs2bcElT/gniIb4eFCSmyjBPFNHRuJYTaaOuEydEaeLo
 7En2m+UO18vkLL+eja3+Koda6XvGgSkhMPkkH9b+/HP+A/yYaUz6dHRS
X-Received: by 2002:a53:ac96:0:b0:664:ca89:3f3 with SMTP id
 956f58d0204a3-66521b3c867mr6305916d50.40.1782983165543; Thu, 02 Jul 2026
 02:06:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260701231224.106850-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20260701231224.106850-1-heinrich.schuchardt@canonical.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Jul 2026 10:05:53 +0100
X-Gm-Features: AVVi8CcFQ3Et8fmL6ZbMi6P-Fxy-dqB9fkmbkd-hkXDogb5P3YbAFgAT6RHyHz8
Message-ID: <CAFEAcA9Y1Mfsdn=tQXA=QJqa14JbjhnexPhnem1oi9vyeDPVpQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/arm/virt: define initial aarch64 TCG CPU
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Thu, 2 Jul 2026 at 00:12, Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> Function virt_get_default_cpu_type() is meant to return the default CPU
> type. But for aarch64 TCG it returns cortex-a15 which is a 32-bit CPU.
> This results in failures to boot if no specific CPU is required by
> the command line.
>
> Return neoverse-v1 as default aarch64 TCG CPU. This is the aarch64 CPU
> with richest feature set.

The default CPU type for the "virt" board is the way it is
for command line backwards compatibility: people may have
existing command lines that this change would break.

I agree that for most people "cortex-a15" is not what they want;
the underlying principle we were trying to follow at the time was
"any command line that works with qemu-system-arm should work and
do the same thing under qemu-system-aarch64". So the virt board
has the same default CPU for both qemu-system-arm and qemu-system-aarch64.

If we were going to change the default, I would probably suggest
using "max". Picking any particular fixed CPU model name is a bad
idea, because (a) it won't work with KVM and (b) in five years
time that particular CPU model will be an old and out of date one,
and we'll find we still need to tell people "you should specify
a CPU type because the default doesn't have XYZ features".

thanks
-- PMM

