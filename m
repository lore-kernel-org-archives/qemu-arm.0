Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1465CD5BAC
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 09:02:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPzHm-0002wD-4v; Thu, 21 May 2026 05:01:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPzHk-0002vT-Of
 for qemu-arm@nongnu.org; Thu, 21 May 2026 05:01:44 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPzHj-00029M-1B
 for qemu-arm@nongnu.org; Thu, 21 May 2026 05:01:44 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-65c37eafcbeso6287747d50.1
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 02:01:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779354102; cv=none;
 d=google.com; s=arc-20240605;
 b=Rrt+BiyXD/Yc/nArMGSXS9+SBljac8I+yLkUN8s+cQANRNTVtsb0dFU3jfKzxqYiNV
 DUvZ+4V+UmGsoA5qELrgbv8W0fXKVanIHbuaLXsmytBCB/exPiaFeVifXLMnMS1Tp89Y
 h/tqAppzw0ubvx47j1ulIco3ZTCjajylMHrC/RZEfWWrNL8Lu09XpDEnQf5ywIj/URRA
 NnlpsRok1iEj/1M0nnl9ZBu38g3X4P1AAot9+EgenGYJMq1FVPvMMKwno4pVbu8l+Qtq
 vjnZdf7CD35ItJuerJQRbno58H6E1kSy0NZBFcCVm0bMDSR6OolIxlFp8dzS1L5DW6MB
 eunA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=q/ftZT8inunFniQ/SEoD05s/8z5qjIOgX4iEhTs33AM=;
 fh=E2BksAaa/kmO/7zD7xSf1ETZxf0ZKMTM9iEKJ7tBDzc=;
 b=lLXJ+gJHItCGQvw+VGEKLVLYuxB/xBt2CfZKJ3EDZ3geEtyMX4Nii5jRxfqncQl/LD
 eCej1ExcnODmVBucaH4K3VnXk2pVo0RaYG3Pe/OxAww0C0TZ5IDu8URwrNRv4bZsYcqT
 GiwcTQ77P32wel/vtN5kdTxNLYRs8gCddZ6JduQdNramjL1yqPRYzuPW188HaoKs1SI4
 T8Gfy6uqJ9+jFYDAjXh5rbUY1lZqzKmfhMupxlfhMnLeyxt7MhNdI1rhtC0iZj3ja3h6
 fYVdxi4YL7Qk3bPKRxIb4Wtr/mhcMP27wGcEfSaNtwyoeL8YjLFWdGCQH68OBvsSlCWA
 IQ7w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779354102; x=1779958902; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=q/ftZT8inunFniQ/SEoD05s/8z5qjIOgX4iEhTs33AM=;
 b=l4+hnNLTV9hpvFZj0OUIBTMEizh2GtDAiHx/+4bNyMJxdnWJSuBywrXGVRAxiuyFez
 h8eESeWY2/nHw6Rcu/I5a+sjGQPVuA+toMNWvumkpUpCjnqIyUYuE1y/8jXKHqdJ62Mg
 Zd4u9Cn9BSuEhAdBZ6kFS2i51lUpj4hJNldtGXtuHsNfSE9Ssz5t/PfUBjSRrgcKhOF5
 6c4akxpxG5IMdKMvk1q/TDP6I+9eTY3LEkz0Wgs2K/eDjI5jMpYRaPAJ2WWCpGDLU51M
 R+vHaIMNN46b2mrvqC64zZSZ/NnvT6TSbE8d36pMAFU9WUW2rWvI6Ch7q4czbVDwEAbJ
 qFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779354102; x=1779958902;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q/ftZT8inunFniQ/SEoD05s/8z5qjIOgX4iEhTs33AM=;
 b=Lp8UrOwZ3T2gwiY0d9oPQDMkShMiPQ/AOOcM7FtRqFyXuw5QTt/86m6vPBufdginUP
 wG0ENWnFc4FwT2ugvaavbrt/WVyWGGvB+WCpNbuzV6No5HrIRMCR3o5sKYU60UP6pZFD
 c7jIj2ij4XYys/eQC7mBZEOVSciVKHwjEXDn5nSwPofzfMTK1LknKemB5dvc0UC+vFrW
 ZNtGT3Exgwtytjq5jjuTPpQghJxNSdfTVpsznAGktGFc7TNiQFImxwbRD1JUuRCvX8aM
 V4UqEciKiPH3HVkLQy+ihBZW6TIV0lBMIj1QA97HvxGdJrczddPmuKCkWGQHUakE3bbF
 3pAw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8FdrV9Ia6HXAS0s68xItWoc5VSTyqazjlL/MBxZxAyA0F8iUauPXODAQA3uli7Ke/ihX9gi5PEuA==@nongnu.org
X-Gm-Message-State: AOJu0Yx0r3BhpTEqEYMD7pt4tL6rG22xMywuXefmC3bgZw3d6rP4JSkJ
 H/Y5Il3xxVi2sLKvpVnNFdYDgzd/j4a7gqMTiviUe3SIqOILCJA66Vrwyrh1BeDoctL4yhBp3SA
 wZi8CAnS5S4IlaT0iA1eYClXkJ1WaqJxBiXEfRWhV9A==
X-Gm-Gg: Acq92OG8Gbl5/ssSZ08j9OqbYZyOI53C5fLk0dvvR645r8m5l2XWpj8Z0v+2wwRQAW6
 3rxDND3X7mMUwwpM3vVZeD7v+6hx2JdYURouYMA58iTYuKDWY2+wwZN8Awt8qAiCjf8Z6bnC3rA
 D8lQS+MKR7Ex7oXA66Nd6KdgI9TfxnO3WeVyA3pVimZE1gk/gM9nD+XrUhHUmJXLjTrFgWdmO4Q
 L490zsk2xk2a+t6WvaCtMNi52pVydpYzzxfJH1P+un1BronGVd5+hBoYI6wMXm2rGUxhiHnxJtG
 /HuuAHotCvwQDrLIxeF2SkPs+BNhydJjWNp78z8eRyhwrtB+QiUIr4GVtonYhbcHczTbsIQROFp
 FQA==
X-Received: by 2002:a05:690e:128e:b0:651:c6e0:6be5 with SMTP id
 956f58d0204a3-65eae0ad1dbmr1564652d50.18.1779354101533; Thu, 21 May 2026
 02:01:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-32-richard.henderson@linaro.org>
In-Reply-To: <20260520182213.872945-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 10:01:29 +0100
X-Gm-Features: AVHnY4JEid7LxaWbXyH4yconjQYRiqOwA-VL_vuuqWAOw_1DBLR7BR1FI_-P83g
Message-ID: <CAFEAcA_DbZ3m+P6g=+uEvVJCSyUCuTdzDN26xwXLPTRrZLBOwQ@mail.gmail.com>
Subject: Re: [PATCH v6 31/64] target/arm: Implement BFCVTN for SVE
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
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

On Wed, 20 May 2026 at 19:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> +static uint8_t fcvt_fp8_e5m2_output(FloatParts64 *p, int scale,
> +                                    bool saturate, float_status *s)
> +{
> +    /*
> +     * Because e5m2 has an infinity encoding, we need to handle
> +     * saturation conversion of Inf -> Max manually.
> +     */
> +    if (unlikely(p->cls == float_class_inf)) {
> +        if (saturate) {
> +            p->cls = float_class_normal;
> +            p->exp = float8_e5m2_params.exp_max;
> +            p->frac = -1ull << float8_e5m2_params.frac_shift;

This value is larger than the maximum representable normal,
so although round_pack_canonical will correctly saturate it
down to the maximum normal, it will also set Inexact and
Overflow in the process. In the pseudocode FPConvertFP8(),
input Infinity is special-cased and returns either Infinity
or the maximum normal without setting any exception flags.

To get the exact maximum normal you want
             p->exp = float8_e5m2_params.exp_max -
float8_e5m2_params.exp_bias - 1;

Or we could shortcut the packing process and just return
the right value:

            /* maximum or minimum normal value for E5M2 */
            return 0x7b | (p->sign << 7);

> +        }
> +    } else {
> +        *p = parts64_scalbn(p, scale, s);
> +    }
> +    return float8_e5m2_round_pack_canonical(p, s, saturate);
> +}

-- PMM

