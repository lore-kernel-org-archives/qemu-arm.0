Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D11C5DF66
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Aug 2026 16:45:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ww0Sv-0004I9-8Y; Mon, 17 Aug 2026 12:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ww0Sq-0004Fz-Np
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 12:45:34 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ww0Sn-0000PT-Uq
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 12:45:31 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-c2022323c37so451348066b.0
 for <qemu-arm@nongnu.org>; Mon, 17 Aug 2026 09:45:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786985128; cv=none;
 d=google.com; s=arc-20260327;
 b=bTAWZawjyffpusQfsnWNcMWNKJhpAhrb1nCL1875cMpQ7dLYLyuK2lHd717uhc4AGu
 h+VQ/aBfVsg9sm0PaVCRaWL1cF8dXk8adU09IxLxLIucLOOBY7DQhsP4SOT+PFI66HrK
 2+9/1/ZUHu4NUmJF6n9Z0gboR+Mdt0yGF+Nwa3Yt4qriFJoJEFQ1gm+zILhO7OjoPTAp
 81/TjEAh37Y+BVhY5f+4e95VaDlHFTx+AiqnQPlf+erwR6y7ZkuPOGdWvqqgRdwABTz/
 3RwY1EXw0A2BxWcGVZp66I+ZBcYDi2TKdWobRLx00DeFnCTIXGEJ3qq0T1MISddlTArl
 KWLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=1t8sNwKG7c1EyHhRvWRZ4z3J16W9r+mbOLetTXmgc3E=;
 fh=b9neRHRlG6xCxZ5S2scIgODajQmpOTE8SWb5rnWrm9k=;
 b=Xbq0k+TfbXxKU6xh1Ib9zS9YMojfdJPmn51x2/ultT0Tum5xtgHK5Zxkd0s9Oc9sfd
 CNrAo3fdvQcyxHGWp6gDMPWyDGfKf7aYHGb/lK/SDwTjA38+MpjwyQW/Wi2k7tQR+wfQ
 UM9eB3GOpa63LZT2L9lc39EH4kXKaVwCGoV89GyRJUPk0+k6bkWS7gc1mxOBw4OQMidW
 S1vsfXD4Fi1vLqS8q2C622zZGU883SWibKL853PKNWDJjrbVLxME+ZTviWla9A3srZ0i
 z6zOZVTBHdyh4uHlYgEho91A0N024Fhn4pDKh2Pt73HmZdoYzRz6iXkR1IFOngIzTohg
 BSAA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786985128; x=1787589928; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=1t8sNwKG7c1EyHhRvWRZ4z3J16W9r+mbOLetTXmgc3E=;
 b=c8gz6e+eQNmxfbQpLoHF/k8/c5ILz5imOS5N3y3TlIntvbWXbgHG6nd8zcr1P5kRGU
 N4yORvjaYIH7XBkCZIUbqA/gZHaObtf8KK5QR1kpOlMvo9YddZpAsFZ+n0tP99KsCjqE
 ycZ2qHyDnIFWt+Y6kJY682FFpU4jAOGti2TKw4elkv4o4BV9cjXQ/LxlWjSk0jxIyC5v
 O3bPy9TvMgbVHyAWhUL4LEkVH3cRJOTxhGpxTxpEUd7v3u8D8datflQ8BviOO4fN4vX9
 lasyT/u+E5VN1Wm7a35gNeTltDqMPfVQDU2iW6dMv68W5M3IYLkZzzlSEsZcBkRGJSY3
 PlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786985128; x=1787589928;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=1t8sNwKG7c1EyHhRvWRZ4z3J16W9r+mbOLetTXmgc3E=;
 b=OJ2HFTryjnQY01umluvgzPTateRm2YkIzObWZqWk95VIe9WCh8URhN1OZJIbBcDECK
 6eAYybLzjegcC0uWKnBCgLVXb3RXVGdg6TfumSRcW7Zo8ta67pq9NcXXkkB3zmBbMxGH
 vAAWAhrQJLACeevH2DMiOWMou6olLnIbyWjZocmJ7GEjea0WUe3Ky/8tdFnc6LJc1LFc
 SQSrRLPtTxmrhTGAeyro9CWyIsq1uhL3/sj1V1CR/L1dvbnGmRSyxfhpxMEpZ2+2nXGh
 umxbxXPokkd3Aa/1Q2qp8ILxNOi+zc2n4owzgmn+7riDUaeEI5G9MumKgMfeGHWjLf5y
 pBLQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqRD/NpS8/BY1rcV+1iTva+s8oK02bQnnvWmIfy9M22rrBCtwB651ivpantLrVWg1PmUDJe7KUtaQ==@nongnu.org
X-Gm-Message-State: AOJu0YwoKbgtXq6HZ7IWBJps6e6puZHYBe3Qu6AoozUuum9Sn8dG7u3r
 5jn3v7HDA3IK6RZQrSX+AWsD3IV5Ilwm6pFNxUjlK9lOaaVzaGKQf1CJCYgB2x+Ir+bn0ZbYeRZ
 nZ+3mDmnE10TpoT+lTXRb3o3IAJpC9XNmqhWqyHmZGw==
X-Gm-Gg: AR+sD10tlq/RcM5ze4iGLABo5X1rnuaWJNUkNdqizIobmzwfvd0zSHOEIIfVYze7Rei
 COR3iHOGHpsJqpXMbn+1MjxMdHYAf1szbWL2Xf+XkthzVbAElBGKwpVRRN2tIDKoEShWykp5QKt
 xHa+teD+AT/FmkLnWPAxAUvZZjWjWbKKINWeZCQ+dGYCPonx5wDJsc4Ih9jyVKI30llIPdz/bkb
 O6NavG3m352wh7afGku0E3VxH8nJPu96/jCEdI1gEUM1Ve/qPfKiNxsPmUIiKPt3OSZiGJE1aeC
 kYXg45c8XlMPmrKZ5ZfY9LMI/HEAAEkNFCVT16L6tO3BB2lMDmwxZUo5x+HtI7jbEoTNgrFc0yV
 Ex+0GfImHKAKtnQBEFuF/JUoJWkZA
X-Received: by 2002:a17:907:c78e:b0:c20:f6d9:d8c7 with SMTP id
 a640c23a62f3a-c212a256de5mr1057918966b.24.1786985128178; Mon, 17 Aug 2026
 09:45:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260811191540.79882-1-richard.henderson@linaro.org>
 <20260811191540.79882-3-richard.henderson@linaro.org>
 <CAFEAcA98oxLs-w1PNuoM9mArit=toTCTucD5xOmN29Rbk6XBTQ@mail.gmail.com>
In-Reply-To: <CAFEAcA98oxLs-w1PNuoM9mArit=toTCTucD5xOmN29Rbk6XBTQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Aug 2026 17:45:15 +0100
X-Gm-Features: AcwNN1WOezCgxsy6hmB-Nx7Bm4cN-_76e44vnroDw369LaYPhb-HvslDiXLImzY
Message-ID: <CAFEAcA9NuN3tTPoVyNKWcoF3cK+jfBg7ySvPhgM-hkNANy7M2w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] target/arm: Fix SVE2 WHILEWR/WHILERW zero diff
 boundary case
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, yang.yanjun1@sanechips.com.cn, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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

On Mon, 17 Aug 2026 at 17:37, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 11 Aug 2026 at 20:16, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > The trans_WHILE_ptr function incorrectly handles the case where the
> > address difference divided by ESIZE results in zero. This happens when
> > the address difference is less than ESIZE but greater than zero.
> >
> > Fix by dropping direct comparisons of op0 vs op1, and instead
> > testing the scaled diff vs 0.  Merge with the bounding to the
> > maximum vector length via wrapping arithmetic.
> >
> > Reported-by: YanjunYang <yang.yanjun1@sanechips.com.cn>
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  target/arm/tcg/translate-sve.c | 38 +++++++++++++++++++++-------------
> >  1 file changed, 24 insertions(+), 14 deletions(-)
>
>
> > -    /* Since we're bounded, pass as a 32-bit type.  */
> > +    /*
> > +     * If diff == 0, the condition is always true.  Also, bound to max.
> > +     * Simplify
> > +     *    diff = diff ? diff : max;
> > +     *    diff = umin(diff, max);
> > +     * via
> > +     *    diff -= 1;
> > +     *    diff = umin(diff, max - 1);
> > +     *    diff += 1;
> > +     * via 0 - 1 == UINT64_MAX.
> > +     */
> > +    tcg_gen_addi_i64(diff, diff, -1);
> > +    tcg_gen_umin_i64(diff, diff, tcg_constant_i64((vsz >> a->esz) - 1));
> > +
> > +    /*
> > +     * Since we're bounded, pass as a 32-bit type.
> > +     * Sink the diff += 1 from above into the 32-bit type.
>
> Is it worth doing that? Hosts are all 64-bits now, and surely there's
> not going to be a perf or codesize difference between "add 1"
> on a 32-bit type vs a 64-bit type ?

Other than that
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

