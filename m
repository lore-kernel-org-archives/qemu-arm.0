Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0458C5B572
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Aug 2026 16:38:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ww0Lp-0002aZ-I1; Mon, 17 Aug 2026 12:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ww0Ll-0002Zk-7T
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 12:38:14 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ww0Lg-0007Ae-7i
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 12:38:11 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-c1c50c1e29bso525101566b.3
 for <qemu-arm@nongnu.org>; Mon, 17 Aug 2026 09:38:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786984686; cv=none;
 d=google.com; s=arc-20260327;
 b=MMpe2njQu5s458eP2ma2wopLlcNfFnEBzuMvrBRRWgEgpb2+0TV9/QCr7NDg+dQYt7
 B9QoCPxhp62rtj+HS4L4OM0E0AisATyrjzeI4P82wheU0JZ+OIPT3l9k5aEIiXAHfnRS
 GK1saoj2nei1kzEdSvLw15AvazDJ8GF/04lBkAG9QLKnoMu01vXnqYvg6lrhUbkcIERo
 sc6zKavsYtEWifybxEVJhGLNe+l++hovfiEoa0UmUngdfTmN/C4Z+8H2gjsgIdIUXhOA
 NyDqmidNffqBq5ts5RMregyiZ2v9NNYZcPWJFvXAbQime9juao3NWjrqymbgxtCIOnol
 /7mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=JisFTHGk3ncXcbu4I3/VkGj9PsX2jCC2hRBgN8jMugg=;
 fh=EIOHpHjoOpXyiZwwJKfi9Anwve4cBA/MPxmcparAelI=;
 b=Vq11rX8o0GCddkwiNbF0w39hKv+6r4VL8PsDG/K9T+0ZD/5nlZw17EM+L2qrix0qHo
 V/IVly5jOAJjZ1KKQXE2bZm5vTEJePcggeD3NkcwXVDE/U/dWQ1D9p1NIzuojHxRXGL7
 Gn9U5MQG/JeBPkxIjn/gR4J862rEfHJVlmqc/QpaE3kd9SA3vXXrpYcHsfdL5qD1tB53
 ITcBE1VrmBVP80CvUMWPVif5J2jkL4R6NlJprglMMktQGdMiDWPiWtzQNnxfnVkW+3+L
 22nnGxjMPOf9t3VS7qovCVKE/YlbqwZpoewmdBarEyKMdjUuG6dU26Le/w7LKwSyhsYd
 9OhQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786984686; x=1787589486; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=JisFTHGk3ncXcbu4I3/VkGj9PsX2jCC2hRBgN8jMugg=;
 b=gLRALKVILAPACshX8rUlZ99bOnySSomYsJd/elh2wfhewoF+AOABS7E6dqIwPIzXUc
 /U1WjlkeP1SZsTkp3DsTUe/QphTa2Y4XbRfRF+9lBsdRDfQUJUxjHSAE0EQlcT9zqSU4
 +vf2MRNVvQieAz3xm1dH7jDjd8UMR4CzmA5yvythKPyq1sVuVqDa5HM9U+jq1E1FNOcI
 mokCeyQ6JXhqgHC/vBf4pzXmG55DYtjd6OLJGleooj7S4sLkXPNIWj8FEp7gFMSC+tUt
 W5EOzmGSiEm3r2ucoGNTfM1IZ/KVpV5Awj6piuEjiy8idUglfk6z7zJli8HfKhVPQDOU
 efIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786984686; x=1787589486;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=JisFTHGk3ncXcbu4I3/VkGj9PsX2jCC2hRBgN8jMugg=;
 b=lDjZHMhprQ8j/+dVgbOrAt5NC/RJypr1pKAKrWBYxV04fk/KyLHi0ZPca4i6qfCMsG
 dqld4a+zFEz2H6XLnlyou8bs4blDq8P/OnTK19BJw3Y2M9d4VzC85wUoJaZvid5RFH7v
 fYS7KffH2geMj0ZMVJTwxfwxCB7f4df929P+TFMiwWWrFZySE0CNOoRG7BrTdMBdfX/x
 NxMADHK3bUwE5USdVACZIOIscwh4puHNZsK2veMqU8PvJdqy/sZ2I8ZLILWJEV6cK29Q
 qY63n6uhJG69BAMgAqU31viQDoTtujbmIvV7L0s06GXmkuzngMNGvCAvN/IKzVfv2fp9
 AIXQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoxkRBv//289+deGWsWtbsu0excQ95MC9ShG9vlAWrK+6FWBYhoRmMqNo7Hjx+Sy1/tb7Ix8FMxLw==@nongnu.org
X-Gm-Message-State: AOJu0YzpiV4DxH5/QT10fKPQgYx8QTkgm16F15o9Y9DtVy+1lgfNOo+r
 bJQ3eNXYK6MjvnhPhuiqCK9rnSBa+k+j9z49eU+f8L+DtgpYKX9nhbTUmzK66WHc7GvWfrdM4Xz
 xDzM3CpGOW+/QtuiAJDCmZHXePDBabbOLkPaJXoAnEw==
X-Gm-Gg: AR+sD1060c0HEcHvSO7ruyJp4gmNC+0GqWkxr4nIRlv+pVX96/INus6yBiBJCRS7Ckw
 SHdKX/fEEkL2jm3E95gYDJ93RWpQ7IEZVxCORPlyJ2/rNe236Wm9jpX04lHev3i9YOCCr2W7JgE
 mqq4Xwq57ecTeQ9/9db5Sw/ueNIHtJKXL/nrKTuZ3zbE9hnLWfa9UpE16AoNeF213kqdRl7yk5j
 7qvFVZfuS2UGdz5nLIyrFGg99tq2jYOStCW8MsV5NCQpMfYyBNgloAq8mAjJDcTFUU6H6hlQ1DV
 DuDNKhi9eS2VClylrlftEf13nL44q5hTbh0ntqc/Mss9EMfw/VxiF3xWfSi5eGlrL+bnT1/TEvS
 u6a+6TGOZc1of+rm4fBTqBcDZhER1
X-Received: by 2002:a17:907:8b90:b0:c20:5797:162c with SMTP id
 a640c23a62f3a-c212a2661b9mr1229457766b.16.1786984686314; Mon, 17 Aug 2026
 09:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260811191540.79882-1-richard.henderson@linaro.org>
 <20260811191540.79882-3-richard.henderson@linaro.org>
In-Reply-To: <20260811191540.79882-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Aug 2026 17:37:53 +0100
X-Gm-Features: AcwNN1XxFMbiFSJmoKnNcQ5umwc2ppAXNnwY_xYV0R7Ey7zHs22CxdTU08eo3ak
Message-ID: <CAFEAcA98oxLs-w1PNuoM9mArit=toTCTucD5xOmN29Rbk6XBTQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] target/arm: Fix SVE2 WHILEWR/WHILERW zero diff
 boundary case
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, yang.yanjun1@sanechips.com.cn, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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

On Tue, 11 Aug 2026 at 20:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The trans_WHILE_ptr function incorrectly handles the case where the
> address difference divided by ESIZE results in zero. This happens when
> the address difference is less than ESIZE but greater than zero.
>
> Fix by dropping direct comparisons of op0 vs op1, and instead
> testing the scaled diff vs 0.  Merge with the bounding to the
> maximum vector length via wrapping arithmetic.
>
> Reported-by: YanjunYang <yang.yanjun1@sanechips.com.cn>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sve.c | 38 +++++++++++++++++++++-------------
>  1 file changed, 24 insertions(+), 14 deletions(-)


> -    /* Since we're bounded, pass as a 32-bit type.  */
> +    /*
> +     * If diff == 0, the condition is always true.  Also, bound to max.
> +     * Simplify
> +     *    diff = diff ? diff : max;
> +     *    diff = umin(diff, max);
> +     * via
> +     *    diff -= 1;
> +     *    diff = umin(diff, max - 1);
> +     *    diff += 1;
> +     * via 0 - 1 == UINT64_MAX.
> +     */
> +    tcg_gen_addi_i64(diff, diff, -1);
> +    tcg_gen_umin_i64(diff, diff, tcg_constant_i64((vsz >> a->esz) - 1));
> +
> +    /*
> +     * Since we're bounded, pass as a 32-bit type.
> +     * Sink the diff += 1 from above into the 32-bit type.

Is it worth doing that? Hosts are all 64-bits now, and surely there's
not going to be a perf or codesize difference between "add 1"
on a 32-bit type vs a 64-bit type ?

> +     */
>      t2 = tcg_temp_new_i32();
>      tcg_gen_extrl_i64_i32(t2, diff);
> +    tcg_gen_addi_i32(t2, t2, 1);
>
>      desc = FIELD_DP32(desc, PREDDESC, OPRSZ, vsz / 8);
>      desc = FIELD_DP32(desc, PREDDESC, ESZ, a->esz);

-- PMM

