Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EE5C5DF94
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 10:43:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyS8r-0008OJ-Uv; Mon, 24 Aug 2026 06:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wyS8n-0008Nz-1X
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 06:42:58 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wyS8l-0005bi-Di
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 06:42:56 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-66cecabf777so4609412d50.1
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 03:42:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787568174; cv=none;
 d=google.com; s=arc-20260327;
 b=KnX7kXriaNfJ3KMJaIJxlZ+liNh0/SasT1CTWdxI8k59+cFAU8wuO0A6Jz7bT4Mw4d
 fjVmBkF2qgq04czk6gyo+8Msbc2sYIxkmR6aYmEU6LIDY7uq5QsQ7XVhcIHbTxBLQ6MG
 0KG2thjv6TUwi4sdjfP/GdOo1fIVfTKFTUhYqHilfpdz0eZ3e+cbR9WC+1M9grTGI/+Q
 Qr82RdWK37o7pk3jmm8aCeLBmjPeoxPJWE7KrNLDpwL2F1IuuFccUluYhx1kEbFA79mp
 p4fjaywL7ml4NiiDJc5SfwUn5l2SezWtWrw2levohj3f0ubbaijvMrguUkb1ioJ9mJ+k
 /2ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :dkim-signature;
 bh=+JUe8swsZ6YXdP1HwTUKC7caG2ohMj6fA/spvMzenDQ=;
 fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
 b=eL9GiRekkG7wxfWVbyPjotZHNiEOi4zvechJwuP81FBzsSESp+MWtA1g2ebUn0TSew
 fxQ0GNB3iNLyJCKvFBVQlinL5ri6im9RKRUnJeLk0l/ei6KERTkBmTBih9xvIYvk0PoR
 aUEcusbCx6xyWkMyv6pxtMWD0UT0Sfm6bVmPe7vI3XNGw4k9C/qejgntGdEHwz4Np2fY
 F4u/c29eY6xak3SFO2EW2o6Vh/tvicqs6L69jlFgCxYGBDyZWIevcfguLazDSMEWZvQ+
 BIOBLgRgZ4LF87idStHJy6h0Ad/QMvMCRCnze01Cpaans35MYxGNoOpq9gfXHzVp9KBW
 8tCg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787568174; x=1788172974; darn=nongnu.org;
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=+JUe8swsZ6YXdP1HwTUKC7caG2ohMj6fA/spvMzenDQ=;
 b=IEpyBMcMn0I0W86UUJg9O55yAWYBYzv2OLYzlNuLl/rWCT+F19CHhPfyUk4A/GEAnI
 j7H23WapKIdwjVMrJgBmigdBSNpSxGLA0CNiK+qhpoFjFL1Xhz0RDnisSKkLoRgBukHl
 uJXoVCX25SfGehYKMGhJmh5qGp7Kif2Hp0T5RvJ3JuvUFi0TAHWduu7CDqCiFEmzlO5y
 9CuXOZ7uY9gzhPKsnMd3IrsN2LkGfy34WICWRKSNxHi9CQn5W6PhNcjyXaimw5nt1rbr
 t35KoNwWNAM+l6suVivGmpx2evSNwEIASxl6/uMzbxJotAKSSnSFOcyU83d4TxJcpB/y
 J2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787568174; x=1788172974;
 h=content-type:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+JUe8swsZ6YXdP1HwTUKC7caG2ohMj6fA/spvMzenDQ=;
 b=QQg2WN6YrHVnhwyJobTnmjfGuTu3ye4woRHtGOTIHa2//T/WMmLmUp0XTwPWDyp74g
 6tBEDAwGiqU+FVPIVXVBg8d7p/T2m4sWoc9lHhq53c/eqkjCeR+pOh7KMkD5U/kXGiMw
 O2WTNrRKaKn5IBdiUYOzmEpfljT1YDL5n7ClFQGJCtou/ep1pNBCnBuKDFH7NmKqe8Wv
 nYdy+na1mf5AiQgTy444Iz+ATvgSnUePlmuqmPJMAo90aE0CGY2FmABNCXT1WR2ZX7BN
 934jPhkbFc9Isrm6ovSANGrdv980maxKgzcX25ZbFXcyWIjVcXQJ2b9P+U/PI/wbC3Zx
 d4nQ==
X-Gm-Message-State: AFuF++mYTicT1W7qbT8slNY11KGyX6saXiOMleQm1Ojp0n3GnCjouOJl
 BiqKLwyRtp4USC6bF9oEldhd7oR01x8eT6ylxyFDMQ8XK7IUuHjYz6b1qmRafaepkHz7BJi7YCf
 0vwY0DDbzDW3pvtZ+RX76rTYuhDWoivMvow6OzuWjnWLfQZH0PUXh30c9uA==
X-Gm-Gg: AR+sD10obo59pwaQsRNxvdcmXk63zJR8nuAmkmntiGMl21mL/9KKdBGq+EvRrjn62oe
 OEprhAhp0Ermn6Cn4NlK6gQ7AYQoB4bruaTmN+O+L/5zU85OFlw6yVH19ABvpRGLltUqSU3KiSo
 OfJoCYb9i/M5Y3j0UxLFx+02BtQTPjuPXx3Nfzn3x2UWWKSWQHcg3kNm60Ntme/C60LmGo8ihYp
 AQoHLu10yRSbYLxHCrbsTR11r1PUrmKh6tX7IxLjazSF1WYim5EkWsKxRXyBYcw1uDaNAPUYc8R
 48cLdDtynH1Ti5Kv+QJEn9qIJR/IZlO+mj30N2GPTjIo15Gom/IuK0JSkJg6OWl1Mo6Cqnz4toj
 bfIhjaGbwW2j46eO479knvGU+P3l5
X-Received: by 2002:a05:690e:4511:20b0:665:2045:fe47 with SMTP id
 956f58d0204a3-66cd68a5473mr8109748d50.7.1787568173748; Mon, 24 Aug 2026
 03:42:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260824102805.639072-1-peter.maydell@linaro.org>
 <20260824102805.639072-2-peter.maydell@linaro.org>
In-Reply-To: <20260824102805.639072-2-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Aug 2026 11:42:39 +0100
X-Gm-Features: AcwNN1XlPiJvl0vPwOAjhdIuC-qCvvroQHs_RtOORFFwcHHQWEyPugTU6m32uBI
Message-ID: <CAFEAcA-Y6GRf_a-Dfjgf0NLwzgMuVN+xr6RTu8aZZig1+Ci84w@mail.gmail.com>
Subject: Re: [PATCH 1/6] hw/intc/arm_gicv5: Ignore low bits in
 IRS_IST_BASER.ADDR
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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

On Mon, 24 Aug 2026 at 11:28, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The IRS_IST_BASER.ADDR documentation says:
>
> For IRS_IST_CFGR.STRUCTURE = 0:
>  Bits[N:0] of the resulting address are 0 where N depends on the ISTSZ
>  and LPI_ID_BITS fields in IRS_IST_CFGR as follows:
>     N = Max(5, (ISTSZ + 1) + LPI_ID_BITS)
> For IRS_IST_CFGR.STRUCTURE = 1:
>
>  Bits[N:0] of the resulting address are 0 where N depends on L2SZ,
>  ISTSZ, and LPI_ID_BITS in IRS_IST_CFGR as follows:
>     N = Max(5, LPI_ID_BITS - ((10 - ISTSZ) + (2 * L2SZ)) + 2)

> +        cfg->base &= MAKE_64BIT_MASK(0, tableszbits);

No sooner had I sent this than I found a bug: this should be
  &= ~MAKE_64BIT_MASK(...)

-- PMM

