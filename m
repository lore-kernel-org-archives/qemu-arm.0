Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp54891ejk;
        Tue, 28 May 2024 09:11:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUxyrmfHPFDzZrmOXfaHsy1NxhQUw/2RHRlBDn0B4X+/wyjW0piJaoeax5eXwKPQGyJauW8Hk/WOQ1wcgEPuiwVlj5Qbnc1
X-Google-Smtp-Source: AGHT+IGxJVaIOvmuW2Jq2/7qkDq0D8+5+7uc7fnTrfms/3Iwi+eRY+5HuehKaSdrueZ0C5O7T5Z4
X-Received: by 2002:a05:6808:2396:b0:3d1:d0ee:8635 with SMTP id 5614622812f47-3d1d0ee8688mr2385262b6e.32.1716912675809;
        Tue, 28 May 2024 09:11:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716912675; cv=none;
        d=google.com; s=arc-20160816;
        b=vWXGP+W620U/qdmrXl/SaRIn/rsK1HpDvoGFQr5GLCVKwg6XViBqBO8sBI5KB2IVs6
         7MewCtxFRQbS5Kjnb1olZZLQafdrfRtOr76CqwRDCab2BTF3msiSkQpc7trqvMaVBeQ/
         x8WuKL9sAdy7u/QQilP3PGJaQnH4v8n7qbN1FEN64hFefO8E39VqQE8dCVDQI/KUei/A
         4d50OmL4cKfXSBsS/W24XS0lR6PWbAOKW5dXIw1smlUP9EHJsdGIoBJxhyGjx97sbXdt
         pRsT5pYJSUi0NNFg5+ou1OTeqQgU6ul/Qud2xmDsDaWiOHBnOrUIBdE/D+1UWtFay1dj
         0uJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=oqfyz4cRf609u2z6I1Hi+Ag3h3sJ+27elfnyT2Wi5pk=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=HOPfsvvVMZFO8uNf3sbGEXqgFHNCN7RaZrixHCg4Z6fMlU3c/FxiRsixdiHxieSbFB
         B6hDTKxRDxZfj0X/LLUIOdqq1ds4aOyeafugioCiwcMdH9NUSp08Sb+SdkDHO5InxX/v
         PL9uFTocizErw9iIUg2DgejgC6E0YHUNvHmcVZ6yxBcEmCx0U8DRbo4gJ0gnN0g9Uc4s
         YIdMf45ZWhKyFY4rq8boBud2/CAE/eXWhCSY9moA5dlo8svxZSOALsfc/XOL+VtK4xug
         v3jezVCJLI6wpwJE5o9O1naZjrCI3DQnoZ2oaHNrW8QvpzHTQ9bULAEEXnKNqqA0hq4p
         18Lw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IBnFq+5c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac1625f8f2si104172156d6.413.2024.05.28.09.11.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 09:11:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IBnFq+5c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sBzPp-0001ty-IO; Tue, 28 May 2024 12:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzPn-0001tA-Nt
 for qemu-devel@nongnu.org; Tue, 28 May 2024 12:11:07 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzPl-0000WZ-NO
 for qemu-devel@nongnu.org; Tue, 28 May 2024 12:11:07 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-57857e0f45eso890200a12.0
 for <qemu-devel@nongnu.org>; Tue, 28 May 2024 09:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716912663; x=1717517463; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oqfyz4cRf609u2z6I1Hi+Ag3h3sJ+27elfnyT2Wi5pk=;
 b=IBnFq+5ce5G5E1BhsIVrtEhOqKBNUNJfi+L2InXefIsL8Kg0EEh9pAXfsZREnZl8yA
 XhdxrnfpBG2rlXIeDhXvpiBCivs8W3WRUafexHyMmjqdPPbW4f38Q3+SX85EGGVgS5Ub
 5RDk895jGt9NPiFUaAgSNRkaKNmxBH925YXC1ErVULm1pkkWdqm7gUt6f/gKbfCrFEQE
 rtRrqF9eU5qmRnaghY2RKjtrCq83g6zPZbYU7moi2nG4ztwUoDzq5ALgtwxIXxT9oIe+
 rg9ltBC+oPeJl46dKV61u4YYhYiUr5lFJWxUSlkEUpEQ9s996JWuHTihtDCgyyHtiNfD
 PQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716912663; x=1717517463;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oqfyz4cRf609u2z6I1Hi+Ag3h3sJ+27elfnyT2Wi5pk=;
 b=hZRKA9zWGrbFeyyCnmv6J6C/0rVDZvHW+kOBYwgeBljRgGzvqHZNNf/AD+rvrPCwmX
 Mb9hAm+VQE3omKx3abrWM68TxUiWdZzZ5RXy10/YmzJU9FUVA+UfdEN54LmTCpkyyUHi
 rZL0QGWeuBWlx9rNzutClcFA7e/6RtBV7VT7If9krF7wzdrgJxBF5nV4cV2SN/gXpFw5
 UCw6g5PpB7/eNj4b/KJevu+BTe8GSm0gskbWZOLHWZHrjgA65YNLQWEVoJWh/9T1uCHI
 XNBhYDav3jyAb77oK2y/HlSn3aOT2q0FNSttUm5vgyfvhWSvsDjDwpu3QSF2GkZIdgUL
 3Luw==
X-Gm-Message-State: AOJu0Yy67jjv1ND023Fnof7he/ECKP23vorWpyB8wMnt83Zw/yEv2gD5
 GPCLqFRAIOw0DOh9jglwyySEeEAv+3cT2kGYiKWu7/Jidj84UNTCi8yh/23fnQcgJ8Cu5VrXDRY
 J59d2UdEcFFDmKFOOG+wy42f0jTt1Q4o0aSGST2E09ERVHkWa
X-Received: by 2002:a50:9518:0:b0:578:6438:be99 with SMTP id
 4fb4d7f45d1cf-5786438bed5mr10017628a12.7.1716912663357; Tue, 28 May 2024
 09:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-66-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-66-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 17:10:52 +0100
Message-ID: <CAFEAcA9MKmvgT6Q4qn8ELSA0pXEO2w2poHELW3Ed6xCs6cKstw@mail.gmail.com>
Subject: Re: [PATCH v2 65/67] target/arm: Convert SQDMULH,
 SQRDMULH to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qxo78pbVmjZC

On Sat, 25 May 2024 at 00:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These are the last instructions within disas_simd_three_reg_same
> and disas_simd_scalar_three_reg_same, so remove them.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>



> diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
> index d8e96386be..b05922b425 100644
> --- a/target/arm/tcg/vec_helper.c
> +++ b/target/arm/tcg/vec_helper.c
> @@ -311,6 +311,38 @@ void HELPER(neon_sqrdmulh_h)(void *vd, void *vn, void *vm,
>      clear_tail(d, opr_sz, simd_maxsz(desc));
>  }
>
> +void HELPER(neon_sqdmulh_idx_h)(void *vd, void *vn, void *vm,
> +                                void *vq, uint32_t desc)
> +{
> +    intptr_t i, j, opr_sz = simd_oprsz(desc);
> +    int idx = simd_data(desc);
> +    int16_t *d = vd, *n = vn, *m = (int16_t *)vm + H2(idx);
> +
> +    for (i = 0; i < opr_sz / 2; i += 16 / 2) {
> +        int16_t mm = m[i];
> +        for (j = 0; j < 16 / 2; ++j) {
> +            d[i + j] = do_sqrdmlah_h(n[i + j], mm, 0, false, false, vq);
> +        }
> +    }
> +    clear_tail(d, opr_sz, simd_maxsz(desc));
> +}
> +
> +void HELPER(neon_sqrdmulh_idx_h)(void *vd, void *vn, void *vm,
> +                                 void *vq, uint32_t desc)
> +{
> +    intptr_t i, j, opr_sz = simd_oprsz(desc);
> +    int idx = simd_data(desc);
> +    int16_t *d = vd, *n = vn, *m = (int16_t *)vm + H2(idx);
> +
> +    for (i = 0; i < opr_sz / 2; i += 16 / 2) {
> +        int16_t mm = m[i];
> +        for (j = 0; j < 16 / 2; ++j) {
> +            d[i + j] = do_sqrdmlah_h(n[i + j], mm, 0, false, true, vq);
> +        }
> +    }
> +    clear_tail(d, opr_sz, simd_maxsz(desc));
> +}
> +
>  void HELPER(sve2_sqrdmlah_h)(void *vd, void *vn, void *vm,
>                               void *va, uint32_t desc)
>  {
> @@ -474,6 +506,38 @@ void HELPER(neon_sqrdmulh_s)(void *vd, void *vn, void *vm,
>      clear_tail(d, opr_sz, simd_maxsz(desc));
>  }
>
> +void HELPER(neon_sqdmulh_idx_s)(void *vd, void *vn, void *vm,
> +                                void *vq, uint32_t desc)
> +{
> +    intptr_t i, j, opr_sz = simd_oprsz(desc);
> +    int idx = simd_data(desc);
> +    int32_t *d = vd, *n = vn, *m = (int32_t *)vm + H4(idx);
> +
> +    for (i = 0; i < opr_sz / 4; i += 16 / 4) {
> +        int32_t mm = m[i];
> +        for (j = 0; j < 16 / 4; ++j) {
> +            d[i + j] = do_sqrdmlah_s(n[i + j], mm, 0, false, false, vq);
> +        }
> +    }
> +    clear_tail(d, opr_sz, simd_maxsz(desc));
> +}
> +
> +void HELPER(neon_sqrdmulh_idx_s)(void *vd, void *vn, void *vm,
> +                                 void *vq, uint32_t desc)
> +{
> +    intptr_t i, j, opr_sz = simd_oprsz(desc);
> +    int idx = simd_data(desc);
> +    int32_t *d = vd, *n = vn, *m = (int32_t *)vm + H4(idx);
> +
> +    for (i = 0; i < opr_sz / 4; i += 16 / 4) {
> +        int32_t mm = m[i];
> +        for (j = 0; j < 16 / 4; ++j) {
> +            d[i + j] = do_sqrdmlah_s(n[i + j], mm, 0, false, true, vq);
> +        }
> +    }
> +    clear_tail(d, opr_sz, simd_maxsz(desc));
> +}

Missing H macros in these helpers ?

thanks
-- PMM
