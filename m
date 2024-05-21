Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp2233100ejb;
        Tue, 21 May 2024 09:17:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXBqFSmT5iWYOGbqqF8RFd8+QLkn2RvYUGBQfq8O4qc1yfkxu1u0sWjhVliyVlVyy9X+B/ZOAZ70zVAH68vev7yFxjudG99
X-Google-Smtp-Source: AGHT+IF3leeyEJMstVMGc2S1Vba00UqPW2oSKQgAZdfuZQ+mCIkTvnhPQ6UpVR38jwBNnw9qt3SN
X-Received: by 2002:a0c:faca:0:b0:6a1:69ae:4d34 with SMTP id 6a1803df08f44-6a169ae4f5bmr272102326d6.20.1716308250930;
        Tue, 21 May 2024 09:17:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716308250; cv=none;
        d=google.com; s=arc-20160816;
        b=UjXaSGNGfAU1qExuMaZ7QmUupe4kYAneYD2/Jd0saWKqaQ6QZUNijQkaNtJxrWtHWa
         myGEI3a4ASBCpHwtysBRIrQTBffp/+EGmWNPHA7J2018q5IyRrXMKAOGpaI5FD11Boww
         sioKRdShJ5dbneAuuF+uMFze4hDwCRgF5i0iWGPiR81qmD0mMDJvAMa9uE2Vs/TMxPTJ
         n1Bv58Lccj0Lidg3YCJbRoNLqWCC7aoVgT77JgSgijxfkvAqkI9MBSDZJ2KgW8Vt8Hbg
         csvsVgqOU/sKTeGp/5XrQTqthIoZsVcuI/j92fZdzehqW1X16mKkiluQXpOF9LI1wIMT
         1FIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=M6LTUce7TaSwInTvTRjvM35KB8kdU6NokoPpAiG5K3M=;
        fh=7Mjqpe/rbP7Nc9Sk/mAFbOKB1HRcofOizlOlSFRSKks=;
        b=foLi5lSZE4S6v/+iI8ZKkBRw7/be6hwVdjbs3gH4Jya1Sd346LcsRAY7EyMGFgrdUL
         YCB6iXJRIXyPAnucAhl3NTXvBfgGPyMmCrLkAxl9TNLBqR+q3s9FNldPFepsq1mmQvEu
         t5SakElcQbxKCpKS39durA3UOekmB+f1XYDTDucAks0ahKUvJ9KV5jUyiwxjhpNJk0Vn
         xCIjFuYui79QAsPeYWvG2vnPwfyRsqvii6bMKsWQYymoPr7gFgvZYYcHVKfiQq3h3jM6
         fxO0pn8yGJfOe2Nd4LQH21AsiU+1JajKHV9QGYm28Pc6QWw9HtarkkASaCg9s9HJjSBE
         f0kQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EjUrCBYW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6aa5d6f9cb3si31029246d6.521.2024.05.21.09.17.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2024 09:17:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EjUrCBYW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s9SAn-0003C5-0O; Tue, 21 May 2024 12:17:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s9SAh-00033J-5C
 for qemu-arm@nongnu.org; Tue, 21 May 2024 12:17:03 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s9SAe-0004hy-VK
 for qemu-arm@nongnu.org; Tue, 21 May 2024 12:17:02 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-573061776e8so9052040a12.1
 for <qemu-arm@nongnu.org>; Tue, 21 May 2024 09:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716308218; x=1716913018; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=M6LTUce7TaSwInTvTRjvM35KB8kdU6NokoPpAiG5K3M=;
 b=EjUrCBYWFnUIS1Oa4KwbIauClRVlqb6p0j+f5/yA39JmfDqBMP7RdxV0vkSaCWBQyW
 mQrDIu49SvKjwaY7Xcx5Es4VcwX/AxCa5uytp5w77mout4haX147MEyxWQaidA8r27tr
 qJfuKMvsDhTVvrtaxH3Aw6ToLRs1ggcV/gdfy45mow2LYh05cfdYipkDKhsJSLQbNP4h
 aKDX7FrBOH+3EqxKSbyk2l7RU06vv+PLXkzZJ4BD/oXi3M0ifPLVyP1bd+toHgKBZ/Hc
 DWR7nO2XU59mvz1alu/AADFdaa2XTGyq61fZR7xkHoRfzYfErgHYEbsGMddraAm7Rqo4
 O2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716308218; x=1716913018;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M6LTUce7TaSwInTvTRjvM35KB8kdU6NokoPpAiG5K3M=;
 b=NKpcf6Wu04Y/hUZ9udsZFf5wFNNW54CsEPIfCm9kOwDczy9iZuZ9SlxzgHQnOtJ3dp
 JEz9s9f3FHyFJCZhWQBoQXrLaKlfJe9af4B1cyMYr0cVKO++PPfD+Jod2K6mdnzKDOVk
 gmWOGI6R0LUXSVs6T97G77Jte/mr5MnXOMA9BjaNAAnKRFj0jFvdr18TDCEe0pB49Esu
 iuDLaN+eYmSzzNfkgyh8K+sEHM4RujOpZgqvv923+dunCEKA1ypyxVx820sGnKyfRtXb
 6FDGM6QNvh2fDfCuuofHEVOsTXCD+fUSfW1NQklpl2n618f2fx5C5JIpjHsyr2Lb2JzT
 mQTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXWEq5/m+Y2ih6xBy7kVfo2jMx74HUZZ5I/yFasmO2kav+5dD+2VYbfvNSldrgFm+840d3q1egGVCT4B7g9nBDfpH4
X-Gm-Message-State: AOJu0YwcRzMq0Bf2QEkHdvYpOGm7jb4KYDqfMlNJOLNJHZ9pYGj9zvd7
 CHP9kpxQ3o13cfRLrZZ5wVoKLLre4NKNN1QwIrVtSOmX9KJtQsdv7Mc2TguEnIYC4DAWY5Uw0Br
 yLgYU5ziVTft1mECB3zn87eL/j+Jnt/k2u8I05Q==
X-Received: by 2002:a50:cd44:0:b0:572:df77:c1bf with SMTP id
 4fb4d7f45d1cf-575750f4033mr6184196a12.3.1716308217894; Tue, 21 May 2024
 09:16:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-58-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-58-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 May 2024 17:16:46 +0100
Message-ID: <CAFEAcA8YQURkn5-SjVFmR16xcv6m2WRmnJpkeg9PVZ+eFGW8fg@mail.gmail.com>
Subject: Re: [PATCH 57/57] target/arm: Convert SQDMULH, SQRDMULH to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: y3tTCJN5Ybse

On Mon, 6 May 2024 at 02:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These are the last instructions within disas_simd_three_reg_same
> and disas_simd_scalar_three_reg_same, so remove them.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h            |  10 ++
>  target/arm/tcg/a64.decode      |  18 +++
>  target/arm/tcg/translate-a64.c | 276 ++++++++++-----------------------
>  target/arm/tcg/vec_helper.c    |  64 ++++++++
>  4 files changed, 172 insertions(+), 196 deletions(-)


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
> +        int16_t mm = m[i];

Wrong type -- this is the 's' version so should be int32_t,
I think.

> +        for (j = 0; j < 16 / 4; ++j) {
> +            d[i + j] = do_sqrdmlah_s(n[i + j], mm, 0, false, true, vq);
> +        }
> +    }
> +    clear_tail(d, opr_sz, simd_maxsz(desc));
> +}
> +
>  void HELPER(sve2_sqrdmlah_s)(void *vd, void *vn, void *vm,
>                               void *va, uint32_t desc)
>  {

-- PMM
