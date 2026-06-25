Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C32CDE008
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 10:19:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wchAc-0004pq-58; Thu, 25 Jun 2026 06:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wchAZ-0004oX-1n
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 06:18:51 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wchAW-0000d4-Q7
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 06:18:49 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-662f479a22bso2055238d50.2
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 03:18:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782382727; cv=none;
 d=google.com; s=arc-20260327;
 b=H7A6r4cnuLuN+sNNNwn6bpGn/iBFWndGaRU/sQbxv7cNTJ2UcaslN8OpMU7U5+wOHX
 vG/spt57FwshbeLiT1654M6P1l0808hYPOXAVrsFiYOn8fyUdUT4fhOT0PR6JlbgCWNJ
 pa1eD3RfyYPQGZ9gMyxMgVYVennhPmhVw824Efv1LVNxRhgjazePS9pxlIWtENNkhdul
 4wFaLlX7KtEjD46P3J2Do0QvJtUPpz5hDS11U1yO1cWUJu2Y5HBc1s/d1LmwEZRjhDu1
 QtOmaCExfQYIeElo042cQTG2z+HrmFj96QPyDkUDO8erYxfInhhdk2Gh7NMqjjJzrFlC
 8Jug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Pef0KSqlE53j11M1THHyB9ckpH37jgBeeV7muOuxDAs=;
 fh=oRBo1/s5MGqf12GYSV3/PJRAuUgtJbt0ssUmpyyBviQ=;
 b=FzQ2uToyS4eQZdBh/4yv0+90Z+A7gvNdL6w+qLZYBssZq/iRmI2pfK34YE2TEZMFy+
 DLc5V7u37ebylPBAxpyS2usGPkSmkp3BBp9Nuy0JwYUJ7lmiYXHArkA3lb0OQ4DYKtXw
 DHSnsMP5mw2nAEMb1TEXl7J1Hd38oRrKxaMlv9joymwLbQr+u35rb/U2G4XYT4ST2clo
 YACyLksDqOJpZu4DYKOsyIGDtgAdnO2HI4WDRtw/+0flX4u3uNjtp9t7sGiTnW4vN7mP
 gywJtKBnbt+vk8Aop7QdRKg89/igT9Vpf0QpTZdBKdTJ5WRcXE5sd6Ftfy9xSHMdUu4W
 n4lg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782382727; x=1782987527; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Pef0KSqlE53j11M1THHyB9ckpH37jgBeeV7muOuxDAs=;
 b=XuWAlsp+yhGSmvfQyT81RjD1NqhHn54H6hkb8aUDZx+6ILvPYfDlgAom2gjWmEtwp0
 DBZpL2oq2WeqvExUzNEjpKaQcJBCaTYKgYbThwZnXJa2KOCX78gcqqGnbykXrK2D6q8K
 kC3loXhPAezrMB09zRSDEOR6JwxALmhCWFidl3ep9KpTulmdWCYMlfLUtO+ksxnfQMfG
 jYHMzvsfWcu3AYfZhkOb1Mhk+7H9rBF8mx9H1EqSXSxhM+VxOQePsVTZyq7WASZSkLxS
 Pz+Mz36No7u97QOXaA9kowa1NMFhGXH6yRXNg646dXN8Ou584oZjIzkJsZWahkdnaJ6o
 OF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782382727; x=1782987527;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pef0KSqlE53j11M1THHyB9ckpH37jgBeeV7muOuxDAs=;
 b=VSLE9MhapMHDFmP3yGH5AY8kyaAptdbF3QNd5U9UyqfehYJpK1TiAHQfjTVYrbhZbj
 AtwHywFVqxWmDGc/cyL+kUWzbs+9Q5XN9fnvTkkum4KzcZLQMEQ2ZYKoEfM9ons0XP38
 vhyzgmLSWG+WD4nZfFIZ5IJG4BMpeCZLOrQ0PzNjFVQh25CL4So0PTj808thTrtEDrKd
 oxmPjaAwQKlePq90Af4FqePgvnjm05ABQEIOPrfa3ByodQ5Rg/CsIdzKy144z2j/8QGd
 EHZAhtP778/vaqP8q+OHGjUQlWgs4tvXEN4yE5i61Tv2YwQYWViyERsIpAbqOGb5V6Gp
 Blcw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqr+HLWPn1uQSuyMgu6rx49JN74+sxfT20rQqR9jzkF+s5QctdZ2Q8VVRo//ivDtAUKJZ9slkYk+A==@nongnu.org
X-Gm-Message-State: AOJu0YxGP94Nie+uOON5chw3OAl2JtAKwp4n/zojZp98HhOspPbPtEiD
 UEbP0LwAenV9kl3M2ZWlbw2pKmDDCL2lfx7xnN6gmZXp8m2xrnuX7pRMZH4abEJZtvc78Vr0ZuX
 bMbmIO7BPzyjq1gLxh52veT9PUx8SHsSYK5z5hZGx/g==
X-Gm-Gg: AfdE7clwvIlasxT/fviOVxR/0a6XzIk6Wcp/hGek5s9kgZjmxMFz5iEdcrYqCF+QdZY
 RjuqjRFyDC7oXi/N3mo9rR2q4aR7m1HMV1nyNU8GunFK3J5xV3hHAzWhAi6wGUKgiVhWhJhg8TH
 bs+s2ZgsiwXUc66tj08tlNEMXISoWCqLraMAbq82bai4vp8BULwuV3cc8lPQW+dQZTHG2INRab2
 I+0VGT/nFl/Kh9xAKRMsaUP6ctEZqvxJ62RHSK/Cv4SiXQmzBaghSoYCS3iuii2uUaNMRgik4OB
 qqimFydoUhMYnYmkv511pFZMZN5Iwj94tFJm+M4uvIexvbN1ZaU7DoS/
X-Received: by 2002:a05:690e:43d0:b0:662:f0e3:cc2d with SMTP id
 956f58d0204a3-66487e6c626mr978360d50.24.1782382727478; Thu, 25 Jun 2026
 03:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260625015159.719300-1-richard.henderson@linaro.org>
 <20260625015159.719300-11-richard.henderson@linaro.org>
In-Reply-To: <20260625015159.719300-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2026 11:18:35 +0100
X-Gm-Features: AVVi8Cfge2_3Jq_b9rev9-Zh-42jdONRE0uvGPA0w2UQwRuhWxSmSTPh0KrD0lE
Message-ID: <CAFEAcA_1LQRUzrw7AmChs6OTg_H-6Q_QHdaRoNif2AunGOfkSA@mail.gmail.com>
Subject: Re: [PATCH 10/10] target/arm: Enable FEAT_SME_F8F16 for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Thu, 25 Jun 2026 at 02:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/elfload.c  | 1 +
>  target/arm/tcg/cpu64.c        | 1 +
>  docs/system/arm/emulation.rst | 1 +
>  3 files changed, 3 insertions(+)
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

