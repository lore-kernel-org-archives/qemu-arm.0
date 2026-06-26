Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF9CCDE008
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 09:04:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd2TD-0003vl-Rw; Fri, 26 Jun 2026 05:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd2TC-0003vR-HD
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 05:03:30 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd2TB-0001YA-5E
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 05:03:30 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-66388bf3793so765273d50.2
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 02:03:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782464607; cv=none;
 d=google.com; s=arc-20260327;
 b=l3utP7xnJ0uIEiWfcjmiaBoIZccCubPTKDADmZv1eaPyn+hABxsVIfbWabz4CdJaq0
 HAD41Ki6+KzlqXR12MIWf4rZFL2cFz8EFdkDra16389SnrgiEJZzlngPsG0DO5CgGCqC
 9VKkWqnbR7xekMNriMotp/LdcWQGzJAjWmia0tbZ+2A6EayZyjxDmy3TS22Yrjlx5kuo
 F8rDcgoQEiR9YsokvVFWesJ+m3CTnXSPuve2CTlFIhWBO4xJttJ6C7w53cg1V+2WaRVY
 Omr0c2tZqZAJodv9Xze60ihDAPDkSfczVkYmBQicWgRyHxWOSfm2D3B1AnGoDEzTETiv
 xctg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=rzbTLX9MgIHGjJ8QPBBC83qnuPUQRbdnZjonROf51h0=;
 fh=k8Zii1BPRnaFYCKKttQ1ALCnMwrJjkN41NBABt92mf8=;
 b=hiIxxeKFIsiA4iHTRaDDplgZdbrtinRxpOvVoJSu39BtWYSGeEBcpaFtfBFIqon/ck
 9nPjGmt9BsJ8+yikLA4PsN34Vm6oThMxZWBET4RsrP0LdVo2XfJWbByGeoj/PNQZXQU5
 oHt09Qrr7QbXM94cHVGLo9MS5Ch4hDGYZMPyEr9l3F5DHkeQajdh7QQTCsQVDaHPwwGO
 G08mkMk6Jz+cDeesCHtQ0oR2y6Jzs374SrvT2091rUwpMJb1BmIfEfD1CQ0ii3+Cdk0g
 gaHk4xvjrDEFZHtJ/C5WH8BXzqONGCsfXR9lDkO0XTIcHrST1otJr1XXbefA90vMWr7k
 fgLQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782464607; x=1783069407; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rzbTLX9MgIHGjJ8QPBBC83qnuPUQRbdnZjonROf51h0=;
 b=tnVtUo+OOxH5Cpbc3knFmwdDGs4fzh0BcAEo65h9WdMuwLI2BScxZCaxpQ66oHXv47
 BlQlxc3vMHs8isOG65kFaqFY0fek9cWvzbU2x1LvNdqMOiYsDyXr5ni0WBvtM/ZGvgJC
 jhpy6+fgh+jBnqj2I9B9g5Ycm+V+QWm6mxTlMb6Iz/WKzEGybBloFEQ3Vvb6gv7XYW62
 7+FXP8PpIucOkxhqHRcLlztzXcJeJfPn5UPLy+YaV2wH2hqKjn+yw5FCr4g6W3YRgpjZ
 gaH78QA7rnTQs0vdZ+/1VKmotegFtTkn7iTfiQMe/lP8TbDzOeAeF+dKt2yt8pBPbUSN
 PCiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782464607; x=1783069407;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rzbTLX9MgIHGjJ8QPBBC83qnuPUQRbdnZjonROf51h0=;
 b=XqAzEJGIpWBwyQi0x3RFjdJbZSyCluOhL8wHZUtoUho+8ytXuwGVCjSafLdkKbk5UB
 NuHhcsfv5xku/M/UM71lKo+1It7o/LRdbvY4l8h0CWAOpxUWM3vLTq6510qRznhuISOb
 YY7MgCmzVAl4qKRDSOHEavJtpzaD3rWtocPiHXZuYuBtim+TlBSdYxshl2MnE7A4HVnw
 wpHz3r8Uab1L4WgKHOSe+9fQEVfjvx0b8BmZS/qTBbkVKR1Zt+baDGvXfYup2kFuRGwe
 3hT1cY3X1193oe0zyGf1OM+qDbgcZhJaIAlvEoSFse2S7UpmJyy41GxWBHUq9jdBxaSi
 Z8Tw==
X-Forwarded-Encrypted: i=1;
 AHgh+RorSFin7JplHKfL1gh+fEMQ9uKYLPPzjhBtbSh0kELU9ew6++5MmLuF4cvRj0SJ2uIZAYHTYI5LWw==@nongnu.org
X-Gm-Message-State: AOJu0YzD7b8xvQ9cUk2t50uYoS0PCK6cox/lxCi4av5iwQK8gUpkxcRr
 BcdvgzGsEoHbmh+8Hy5ZB7AFJRPv/uWWpG2ffE+8zEGXVS1xSZ3Lp2I3qWp0I2RBKJz2w2DZXz9
 6soytnptpFbJYPxjHCI4jX+jkU0ECmtjui3gAjWEBlg==
X-Gm-Gg: AfdE7cnhOIES2YeOqNPwDk9S+iqtdgdJ0ZkGggBQKwXM1iyZOuG/62zIiiVQ58u1r+k
 h/D/HX4r1aP6dnjDInKr8r567kBVpSI2NZRoKV1Myuj7M+alp4Qdk/3IYakntoxMotMzwvAUVgQ
 BVBlySdN6STI5k56TcLOJb9PrNbhCT2fF/cAQv6R0cuApix3CNJedrkj7iH64dxs9heteRwdfv+
 2WtL0KqIDOccLzW0Dt8Nz5HMwLAdOKIUGFRNdobGKZ8UIqC+SleKlTTC66tPf3yrJmVooOmvNAU
 C65F2rT3kcXyCh+Ux6II+EV65czBK+Zt79rQ9QcpDhGGhR8+MHq3//lj
X-Received: by 2002:a05:690e:148b:b0:651:bd70:1622 with SMTP id
 956f58d0204a3-66487ade410mr4707242d50.10.1782464607362; Fri, 26 Jun 2026
 02:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260625015159.719300-1-richard.henderson@linaro.org>
 <20260625015159.719300-2-richard.henderson@linaro.org>
In-Reply-To: <20260625015159.719300-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2026 10:03:15 +0100
X-Gm-Features: AVVi8CfGGWQ8yrB6A7EGkSdUN1O7z-s_9qQy74UNkYrn7PtG4nmmHMVkALjboh0
Message-ID: <CAFEAcA9VxO318H9KwC7R7TmrHia8QVW5yqcG+Wutw2oyLFfZeQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] target/arm: Enable FADD/FSUB (half-precision) with
 FEAT_SME_F8F16
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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

On Thu, 25 Jun 2026 at 02:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These two instructions can be enabled with either
> FEAT_SME_F8F16 or FEAT_SME_F16F16.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h      | 11 +++++++++++
>  target/arm/tcg/translate-sme.c |  4 ++--
>  2 files changed, 13 insertions(+), 2 deletions(-)

> +static inline bool
> +isar_feature_aa64_sme_f16f16_or_f8f16(const ARMISARegisters *id)
> +{
> +    return isar_feature_aa64_sme_f16f16(id) && isar_feature_aa64_sme_f8f16(id);

Should be ||, not &&...

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

