Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F38CDE008
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 09:27:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd2qX-0002QR-TT; Fri, 26 Jun 2026 05:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd2qW-0002Po-Gl
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 05:27:36 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd2qV-0007yP-1b
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 05:27:36 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-662ccb916c5so860071d50.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 02:27:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782466053; cv=none;
 d=google.com; s=arc-20260327;
 b=XGv+3K2i2TPHalSXTsvpOw+cauJV3F4cRV2OUSObbRSOwFUjqQFCJYojPGGXpIzKwN
 dvVf1OlRRRLs9bCGELFewCtOK+5YLNcCKUt/K2T4hmyZj5gZ62SbyptBJHx8rUksy1WH
 9GE+QsEsBZVJXU9eXpMxYc/RhsIdVqARDc2NXu2OqzCk1P/4yU7LFOsZg8S6Qfek5Pj3
 HPtTmW09G0l2TH6ANS0CKVf5Jb5VgRe85JX6Hauw0eHCwj0HlTguK7GiW1sHYYjWZawg
 cJ6pSGtARRIrzPjzWw3cYo0K+mSzJZRcmjoTpQ+0yQTaORbYfEVZTBccz5sirUdIy/iv
 H86A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=OUgQ6nAi7TmyblBMSHspSxW6cQX1avDCKZhMweBV8Lw=;
 fh=LBMlQ4ILYDt8pZiR8E4Lfmo17Wg69tYj631DqVxdmCo=;
 b=jPzsvYv+vJq0nlDg2brMDMwUyFrdOp7jLJdLJRndU1djrK0RrMDocKmd9rV9YAlsgK
 ju7aN45Siy7SXxcSDrI6JGhpAPEgHWU+EnCTfcRTotiAGDQs4AMPSm8E/CWYziLXCfV/
 ntX1U00zi5DH1cSFAVMycEcbGpWA3ewyQlrNBKa6nV1F3JSIlbLrL9oEPgXHGMInLU3+
 ut+aayfLxoZaQ3QoajwjLajDxywJyrH4yvYAimyUFWbpMaM4sNfl99vD7cMlJEMpyOby
 QBaNAAI4m19iBJp2v9xPPEUmZV3cLYTN6JOOdYJRYjFsK8BLK3a2xUwMJ1s0c4IWBCQF
 8lnQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782466053; x=1783070853; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OUgQ6nAi7TmyblBMSHspSxW6cQX1avDCKZhMweBV8Lw=;
 b=Y4Aqu8vxQGlUDWGmXYRtO/IZtjRdGvZpsQ+NI+V+ayIJn+Wx55Z1hREDNyEX7hapGR
 u/66BM5nDE1txdZ3Pp81yIy+5i7UA/skOfJ8U46u6sr2fXIEm/XayPjW+yWM23rK0Tyf
 TjEL8nS/3yd7h1fpJu0Y02EZS+JIsOwx3H8rSFrmT+gtKII2paK1f6t+VoXX30EwI8Lv
 YheeqB6qc7sv7n2GT67iPwDrrM+SUk7SnBXgqgMGB0jVuG8Q4FFtzyPnu58ncJw+14Hk
 iI6AbN54SBw1OuImwwh8T+xwRcanEVCSlE1jMozQ0doCN7N18mGOEkyoN2CJr/MHWFJP
 H2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782466053; x=1783070853;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OUgQ6nAi7TmyblBMSHspSxW6cQX1avDCKZhMweBV8Lw=;
 b=MoU/ahuJm1DjnfT15gUXMzhoxjc9xzBVA+wdj6tFChJsoSe66qIYB8vNNSGETTFSsK
 Lr6LDB5L+UCWVYQEM/fs3gVayh0avIJ8dWiXaRG/ld8KvC2V5DHMh2sppKMEaJ0wjsBq
 4roXKQ/FwOZpVXHffj3rGZfn4EVxD9RODj41eK8W0Gyt3xCe93CIwh3qxvhOBGszRj1M
 FT8F1Zytrjof3sXvy+yIRRH+k4vcYFeQkMAsBNH8xoqCDmitxSj4s6BcmS68WEQwmhD7
 Dvi5MbvZoNglhyhm6rRaZVHYfKeW+bddr4qF6UDRrllSiKKM81YwUqBMt7jIAvCSJW5U
 2k8Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RpOrKN2Zfwr6QBVxSYRZ/Kx722zbAvrRmztj+fX0O1lLuxFNTJWLZ9conxJj3J+zjmTq7nu5w59VA==@nongnu.org
X-Gm-Message-State: AOJu0Yz4noyuG45J3BOJTIm4sJqObhhZnU6ySfpOtbjyqct1QqIgZcrJ
 bFUuI9QEkQzXkjP8zL0fPEI8NF+hLpgTJgmCdYnVGAKzg7/yojewIwTeHTFIooJJ9xW6w8m/sp8
 JOobAEiQMsJT4Ve+5oDAN1o+BSIDBtHCH1rBHgNgwuw==
X-Gm-Gg: AfdE7cnuvp5VdcWGEQC8jwFOpCsaNdEGE3nqgSY+Q22OoFIRIppEajOuuv2eEmbPM5H
 qA8ZgYpSXBuzEjwDtgQPtbzckEZSOF46yI4mSoq822V85p7rEKasIfwygNYgnecx1u0Fyl1IK8O
 AsV2PHJWJkwZQOffMoguOqUmXJMw9PlXFdwwpVZDY3u4b8/JlgWGSSv7iDz81UWJ3wmnfr6F1xr
 E3q3A4wnyfvYoDn7InXSowuwtw9C9Ys8sYzuaMOQQDbrHsaIQ2YyrhTm4UNUI/iO31iDRbHUcPQ
 fIGbKidaXXjL5sIrAbnm1F49hmukhfKe4z68XCdKGy2GWoiVcyI/tCfp5qiT4S0r95k=
X-Received: by 2002:a05:690e:124a:b0:660:a41d:d175 with SMTP id
 956f58d0204a3-66488421e8dmr4682356d50.55.1782466053525; Fri, 26 Jun 2026
 02:27:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260625015159.719300-1-richard.henderson@linaro.org>
 <20260625015159.719300-10-richard.henderson@linaro.org>
In-Reply-To: <20260625015159.719300-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2026 10:27:21 +0100
X-Gm-Features: AVVi8CdIy8r5rigL9uFH2h9P7Yadb6IFq6Fyr1EikIj61wYl_7wcHOQnDQOmcYU
Message-ID: <CAFEAcA9fCEyLoDvYA2JR30+7ZGaN_t_taRK01gb9y4k4NNe8HA@mail.gmail.com>
Subject: Re: [PATCH 09/10] target/arm: Implement FVDOT (FP8 to FP16)
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

On Thu, 25 Jun 2026 at 02:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


> +void HELPER(sme_fvdot_idx_hb)(void *vd, void *vn, void *vm,
> +                              CPUARMState *env, uint32_t desc)
> +{
> +    FP8MulContext ctx = fp8_mul_start(env, 0xf);
> +    intptr_t oprsz = simd_maxsz(desc);
> +    intptr_t elements = oprsz / sizeof(float32);

Shouldn't this be sizeof(float16) since the output elements
are halfprec ?

> +    int idx_n = extract32(desc, SIMD_DATA_SHIFT, 1);
> +    int idx_m = extract32(desc, SIMD_DATA_SHIFT + 1, 3);
> +    float16 *d = vd;
> +    uint8_t *n0 = vn;
> +    uint8_t *n1 = vn + sizeof(ARMVectorReg);
> +    uint16_t *m = vm;
> +    intptr_t i = 0;
> +
> +    do {
> +        uint16_t mm = m[H2(2 * i + idx_m)];
> +        do {
> +            uint16_t nn = n0[H1(4 * i + idx_n)] | (n1[H1(4 * i + idx_n)] << 8);
> +            d[H2(i)] = f8dotadd_h(nn, mm, 2, d[H2(i)], &ctx);
> +        } while (++i & 7);
> +    } while (i < elements);
> +}

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

