Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp955055njb;
        Fri, 6 Dec 2024 08:04:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWbyO5D6Sw9OHUH2QybG0d0HNHnilCEZ7Z3HRcFCrGFI4cggOPyJkrpfi2dZeUv8x6z591PsEeJj33Ecg==@linaro.org
X-Google-Smtp-Source: AGHT+IHvy62QRXOu7M7ZID8zAWQ+phTP7DrF72MKTFa2Vuwf0wzNhd6GryhJy96e4Ec8wbKjo4GM
X-Received: by 2002:a05:622a:124f:b0:460:e8d3:7bc6 with SMTP id d75a77b69052e-46734f7eb53mr50001091cf.46.1733501058374;
        Fri, 06 Dec 2024 08:04:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733501058; cv=none;
        d=google.com; s=arc-20240605;
        b=DDT30zc1vMpyLVKPhudpX7HfDCdmKugtnSXwHBD4EcQsPdk/7Sg5ggtuWCh1b/MwgH
         kBxptO3m2sA8Rn+ktxPPLbLC/LIRQFKCpE2suJu0CsmT7JUQUUELgzlDbpjnqTwFe8sT
         ojskiwe5xOyqmpxfIO/GynE72g20yQun0Gd+VTqxBbUVpgWjHs27A6V5ChCg8hbbGttA
         2oJdriuhCEyPYnGqRA7LcTi9NTTrDKU/400rmpxxUO7TSBjpbrUQM9uRapdIgcRH4ZZu
         7Ap5wWxttZG6/d1xAqXrUpujZiymqq7jxFfSSay/D+aW4huEyzJX3QK6eadJlHQyWkQP
         QATg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=VYpU7huxerH/xbD8v7ChQtnPggNL6qf14qnBxnoC1oI=;
        fh=YkCafY+89YkLX78usA0ByPX0v4fuI2z5T0/291Vu5BU=;
        b=BhZ96qCJsfIt7eLDSF6P0HzjX32nn56ezNmOme76XIj62plRR5YTB8MDJVWAOYrDcM
         SrdMhzWxUMPHxmZzYbQJ/G41DQpADwAe/cN2zIAK/psk861Z2NVrvuQNSDiHF/CqEl1d
         UMs841gxnGPTTg+xuQ8M5Lv/81wL2uBgfV6ooQ7TAOKo+SGhRrLEziLvOwm3c0imVNL8
         xmldH2Y7FR+Ni61BQZ4AMHwNPDoEPTII1oHv+etAUNe1S+PRCJyF5rziWuTqiMepOc4/
         GJbeii3r1EfHbNdefULKWLEwtuj9QRw0EKzT/DqJAk1rkC26zVwdU9HQVWpP0cJRPiJN
         zc/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WRwhkS61;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467296e9462si55519721cf.181.2024.12.06.08.04.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 08:04:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WRwhkS61;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJanh-00081L-3t; Fri, 06 Dec 2024 11:03:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJand-00080u-QW
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 11:03:26 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJanb-0006el-6V
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 11:03:24 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5d3bbb0f09dso1291599a12.2
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 08:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733501002; x=1734105802; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VYpU7huxerH/xbD8v7ChQtnPggNL6qf14qnBxnoC1oI=;
 b=WRwhkS61AoxTnnz0rKZntBeA6O3V6Kj4UebYOkxnMGLv44vcg7Bc74/vBQIiOkQqBC
 oOrLz+niCw8j37xK1roiJXA0FPN7W9odSItdVOD9++F/ytlcqcI4Rqa0n/E9jy8z7rKF
 dIDgPaoETysp9uSntJGP8zGUGiuRm6C35UPQqvuLYUqMt+VR4QX0UjVJVzH1Pb1ejHBN
 d+BX19rvGeJKYF4K1NIfTiQJguPyBGoY/AKbv0kmHbo0GAJ2fTyZx5ccuiZNPVuOMVQV
 /bJ9EcjhEOabfbEyEq/8yGjSgtzQPX4UYvPCfDiARN6sUlVM44sCTA4wBCeKK8BDtuC0
 /b6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733501002; x=1734105802;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VYpU7huxerH/xbD8v7ChQtnPggNL6qf14qnBxnoC1oI=;
 b=mhocmMqRgCKRxNtKGS/ATRnpaph4lc/OQtuaBZ/J6JlkIiKD1b+lpcKNmIR3WgIgZK
 /VBxz9N3XBgDzUSf9e5ATEg+Fvhj4SPqf6fwJiijhA12+/WeuCnSUJjePm3IphlBSIa7
 bkNF4RR9iWtY9KugEvnUCTecSTwWc+HMJu+2j5pXQDhZLWIQoviRbyQUp38z4RSuFYk4
 sqZ87NuUkagRYBLTubZoy6EtnsQ7dF1cywHBX1ZoRFRgFV0TcywXCO6UpwpOT5tXwYF5
 pLlGJaE3a+3vqAuWlhHB1c9jswoQJfLqp4Uu4rBQ9AhGMS8FwlbqEdXhVeI3uBVHx6U7
 6Qng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUswhU1I7SUYYe0jfdJD5+xcULqTpWRlkI6PPj0D9BYn2cyVw9kZ7uYiRlFHsqIu2XiqJIlykMpSQ==@nongnu.org
X-Gm-Message-State: AOJu0YxGZYn/4HFm8NQxU6PObEcuPneejV4jcFaMh4zY12Q7Vp4wkspR
 znp+HGrImiWxQ/HpDa8QtkHD7DHnBiEJyjq5jHIZo5NsMe5Z7bHfkW5nwBytWKV4KCth5e9OTcY
 bOJDVEdICmMk4BAulhQhswKRR/0ZX2i0u7dE26g==
X-Gm-Gg: ASbGnctUNzBBW4+p/LY1umvJ/zEnN82X1L7EYDQ4OG+Qo4CxIoNcPNQl5dnZeGRqBRq
 Wmxk5rvM/fnofLMXv5wneFBhgRkdo0DN9
X-Received: by 2002:a05:6402:3881:b0:5cf:c97c:821d with SMTP id
 4fb4d7f45d1cf-5d3be462da9mr2885114a12.0.1733501001674; Fri, 06 Dec 2024
 08:03:21 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-53-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-53-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 16:03:10 +0000
Message-ID: <CAFEAcA84cd_q8WJ8ZVg05qbxb=FfsKgN2fBndoyT8VGOBsZixA@mail.gmail.com>
Subject: Re: [PATCH 52/67] target/arm: Convert FABS,
 FNEG (vector) to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4fRFs3q2Aiwu

On Sun, 1 Dec 2024 at 15:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 61 ++++++++++++++++++----------------
>  target/arm/tcg/a64.decode      |  7 ++++
>  2 files changed, 39 insertions(+), 29 deletions(-)
>
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
> index 613dcdb9a2..31272c1878 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -9153,6 +9153,28 @@ static bool trans_SHLL_v(DisasContext *s, arg_qrr_e *a)
>      return true;
>  }
>
> +static bool do_fabs_fneg_v(DisasContext *s, arg_qrr_e *a, bool neg)
> +{
> +    int check = fp_access_check_vector_hsd(s, a->q, a->esz);
> +    uint64_t sign;
> +
> +    if (check <= 0) {
> +        return check == 0;
> +    }
> +
> +    sign = 1ull << ((8 << a->esz) - 1);
> +    if (neg) {
> +        gen_gvec_fn2i(s, a->q, a->rd, a->rn, sign,
> +                      tcg_gen_gvec_xori, a->esz);
> +    } else {
> +        gen_gvec_fn2i(s, a->q, a->rd, a->rn, sign - 1,
> +                      tcg_gen_gvec_andi, a->esz);
> +    }
> +    return true;
> +}

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Annoying FEAT_AFP wrinkle: for FPCR.AH=1 we will need to make
fabs and fneg not flip the sign bit for NaNs. I guess that means
AH will need to be a tbflags bit so we can generate the nice
vector code for AH=0 and fall back to something else for AH=1.

thanks
-- PMM
