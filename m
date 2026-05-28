Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0422CD4F54
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 14:07:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSbOP-00076Q-7F; Thu, 28 May 2026 10:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSbOL-00075V-9f
 for qemu-arm@nongnu.org; Thu, 28 May 2026 10:07:22 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSbOF-0003CB-PE
 for qemu-arm@nongnu.org; Thu, 28 May 2026 10:07:17 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-7cfd0d8eb09so95717887b3.1
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 07:07:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779977234; cv=none;
 d=google.com; s=arc-20240605;
 b=US33PlWCoDnKuVLngW55KMXd6q5H3PPb1KlWAYqxz0CihCd0M9DMqHlvutuTQiyNp7
 G+Y1UEWbU7B1MCU0DR273MgwVRToKPkjjRcgf5Yj5X7OdFd7JwfU9sIcjPRRKZzp/MCh
 d1uNJ/RXcZ7ZfGlMbJJCRqPbluP+XJAQFA2gAO1IxfvX4F02bCcHll05p2NxaQb+j6mn
 cFi6prPD3x+lrmTlfFLJpL7KZAXRRR/jZRDZ7MfyK2v2vdBIwYYdxQGJ4iKw35TqZOP/
 Z212GB2WPpEsxC16lNeU2Iagd5PH1CsdrEZn/iSIw4qpSvSTUMrpaCP6ToodYpjsglrn
 ix+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=LYReXnL8/JT1YFIhzytVzBrwfmVY7OdGo4mUDZ5tpew=;
 fh=k/p0xCjnj/xa8Y66KAYEIm+iBIcBzwtkaXeOTJ36O2I=;
 b=HmWH6zixvay4m1Ux60zz9KhHi0B8HqEeOLcC3UNlRYGES1WOmNCtjp2ZAiiDjv2AGb
 1TKwH/LuvZBH8TFzxyUSjpqmsnHa0prxowPPXYyx5GSAMqpALznSmCrefpO/BKdYCdb6
 7RRj+mhhKjVkWGRshCnoIq/USL0iUPiwbfHipsB/pOBU+H/RHawdDoDNaAGbiixMEx14
 glzz7Pdd7ru6AjufIIAQo0DZB1mpr3ZshJCucXHoJaYA8yQsaln3eN7Bxjv1GswZFyoS
 s93V6l8JqwRtKjbZ+2nXeQDVx60caPY+JqI1RLrf6cAHO46G7ndq3VV4WRnf4N1C6873
 Lk7Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779977234; x=1780582034; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LYReXnL8/JT1YFIhzytVzBrwfmVY7OdGo4mUDZ5tpew=;
 b=TyJLZMzQ3RewDsxQHaNDRxCgpwy6QooYUW4RIqv8RNtfEQedDZWUY6l8LnsumO4xML
 iUnKBvlGoalkwuYYnX2+wvcOOeqE38jFl69TLxM3HUOErLpg2WcdfEul0sjcu6twT0Iv
 oTwUfMm4FH7wZ+pTuKiVVTjG4W2dGCqpJIRjVIha5D6IqX8qEwzHdJrC9i5EFn3JhXg+
 jtDJoosjugtrL9aDtRQFaP5XHGORCNJlA6CJhMDDmZgv8BsIDZeeVOzXh4FntSSP2PQy
 bdy+WS1YL4HtqQ8yoEEU2VVLaACPEMkgLohxgCvJfDUnFgLNK4EY/xi2nBQk3uU+c5B6
 F+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779977234; x=1780582034;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LYReXnL8/JT1YFIhzytVzBrwfmVY7OdGo4mUDZ5tpew=;
 b=GLqbjJiNzqBw+7D2vblClUGFoi01Gf59XcY4HwXYHhAmHoEKCbP10uj0tCas/KqM9u
 e6C51OALqDFJ5LMvX3a0cQ9x1JU8cuK1LsPu1wJzcOeiQTu9RU55OyMPEz9nKFsyWoyZ
 FTs7F3rSfSBI7g3AIcN1ifx5bhscH1BaJmCYGTM2hvtZjdmm6hOqVl0BiEpGvhvDbgmC
 6qKu5eDg7PtqA1U1VGAV6qIrzmNQ0Sarm8olMU/rUbXZltFzgbeqZ3RAp0FSgMiaNUPo
 KL2LL3MPtiBPHH3sGJJNltV5D0JZ4HqfQht7QxB1dwG8Hyfm7xnb8JFMi8uRoA9rJkq7
 7VsQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9PCZgvks0QHbbT8AAtKf0yYT7n0U9HwvggQlxQzdIBNU6e5IF/uNyB6Hal8bhzKTrB84Ft7C+Nhg==@nongnu.org
X-Gm-Message-State: AOJu0YwzOq6h4VEWKkyPpMMgiaP1a7obvMhiqNbDp7KlU3Ap2wg6zIjd
 wVPUvIW4QsZQk0Y3PGxXiKexZIUsdQrizMqkFfkI0LO3T2eB1ZwH/F7Wq50HqaMM2BFtPUAkR2v
 KYvhECwc6+4q1U5r0hp/BsUBU6Xng9uHtun2MxPNG5Q==
X-Gm-Gg: Acq92OEh/W2Ld7saG9sh+NtubJGOMflsB5O6W2Z7yfBAU5RZSQ+TbX9MH/RUPXbRpsT
 daataeK15jpUB9PJ7nVP3sX/2Iw6KGGE3EOOTNtY9KDfroutL69p/7ExwC1aya9IQxpt2ouUGz4
 gdSacIUlaYG2aFrag4zu4M035Ywrogzilp9R7h4hvLW/0zr7j30VGo4VOtfsUuUB5ceLUcCUToT
 8pjBIgb0e/dsRXe3CSSLKDgPHWbBi6ViUB3M1tYo/t1qS9G0imgYSS/qT1jobQkNvOq5D0CtHB0
 9E7i7CiMf17QA//Ldr9puf7B4tfgV4K9nlM3XRmT1+SC6dR6yldp7/m9os2oBl7yvT6em53VWNO
 3Vg==
X-Received: by 2002:a05:690c:4b83:b0:7d0:1b14:2ccc with SMTP id
 00721157ae682-7d33b449324mr298884387b3.47.1779977234420; Thu, 28 May 2026
 07:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260518174750.660258-1-richard.henderson@linaro.org>
In-Reply-To: <20260518174750.660258-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2026 15:07:02 +0100
X-Gm-Features: AVHnY4JPlaOvA9I-g5HN0Z0qoa7H7f3mrtfbUwVaunnPmlkigCYtYPkwfWGyC-M
Message-ID: <CAFEAcA9taamCZKHjDkchpNzs_sdOrZm=960gYizd6B17ukFLMg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] target/arm: Implement FEAT_CMPBR
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Mon, 18 May 2026 at 18:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> v1: https://lore.kernel.org/qemu-devel/20250803014019.416797-1-richard.henderson@linaro.org/
>
> Changes for v2:
>   - v9.6 to be included in Arm ARM.
>   - Reorg CB_cond to avoid argument ordering error (paolo).
>
>
> r~
>
>
> Richard Henderson (4):
>   target/arm: Add feature predicate for FEAT_CMPBR
>   target/arm: Implement CB, CBB, CBH
>   target/arm: Implement CB (immediate)
>   target/arm: Enable FEAT_CMPBR for -cpu max

Since my review comments were trivial, I've applied this series
to target-arm.next and made the minor tweaks to them there.

thanks
-- PMM

