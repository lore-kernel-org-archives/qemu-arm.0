Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp433423dyc;
        Thu, 3 Jul 2025 03:20:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVNCfzq2MID6q2tOR9Rm3fuSD8qxxlWYquQNWKKI+tXubk3CiK1y2nifKW+Ea3DGXBikkTpcmbGmM1Usw==@linaro.org
X-Google-Smtp-Source: AGHT+IGwOhcHo5/zUIqGojiDXEmBNs0CIZ/hjQ914bqrzwgeHSbBRdRR/PQRNwg0jn7LI34Ig3ed
X-Received: by 2002:a05:6214:2627:b0:6eb:1e80:19fa with SMTP id 6a1803df08f44-702b178fbb7mr93074626d6.1.1751538040741;
        Thu, 03 Jul 2025 03:20:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751538040; cv=none;
        d=google.com; s=arc-20240605;
        b=CZAFVI8HRDGdBX9Xq/8icqsqPpbI++Tdzbh5QrHwfEcI6skP50wUkUe6ZdZt4BLRu2
         7urC8mnD7VmVf8tUB8KcFT34czB9m4pR8TBgyvhKr903yPZOSfsACLiAj0SD80WW9z/o
         cs3arZrRFdc+gjv/kmvvGFb5v/CdJUOkO0tDU1mWdN3H2Pbp36P6trsLwmfXc2LaV1oA
         RE3jWy61g0MdoJe1nWfhKfSDCTL/NZfHQifkEUiwAWU2ROkTF394WaDzvSlEC5c2f6Ob
         yo/eYzGwz9wLUYaEAKmQ+FL4m817AOM0TBtugFB5ufmp1XCB86iZznTP83Z6XMLtZhGj
         9mtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=rBLeovshoD+ZCFSZgZz9QHS7HmFVNwQ8FXr1pu4DzU8=;
        fh=dMzMER8NyyEbeRlGhxO7A7HOkTqApSXhMIcJ36WfJ5Y=;
        b=eLwPWTG6czBe8nEZ3161XQx8O4pEcTXn7vQRuypKpHSgBQIYw482bL1hi34EUGhsS+
         MmPqMTSqCUhz9qgnx9SiuLu6wX6uOJR/R8e8cN2QMqgBN9b04wrcqOpG8vG4l545TQZy
         0gq8DGYQd5ToYxj3Nkl6xN21ny6wRP5e2pYMfJSPL637jIk7Rz4KJsPPzFKrIsifXzAC
         Q8E3IR1WSMYP3hp5LMQctdTu50QbeHqRTzN7kKL0XQQJxj76QE/vAYBl1+juIr87rW94
         x1hwM9tihkugpyTw9fgjP3yGvziLO93xO3IlHMUogKDS5AYKOADDglxm7m8mNEFMoqqz
         AIAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SJ5CBfJ6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd773561c4si168697096d6.216.2025.07.03.03.20.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 03:20:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SJ5CBfJ6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXH3O-0007z2-9F; Thu, 03 Jul 2025 06:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXH3C-0007ya-RM
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 06:20:20 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXH3A-0004AZ-QJ
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 06:20:18 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-7111d02c777so51638227b3.3
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 03:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751538015; x=1752142815; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rBLeovshoD+ZCFSZgZz9QHS7HmFVNwQ8FXr1pu4DzU8=;
 b=SJ5CBfJ612wWgG2yQbhZeVsQixjK4FeAwPdwyGX2RxnBxJQEuXO/uaRlAGk28duny2
 yzNdPy0CoAPM11Gzm0TrsFTurEUzR8ofuSUWiaNlekmvS09dySYLvAFLmsEhYwqQCMiv
 3Sr9eZl4/+/E9atNne5b5gCfyknYmO5hVChJ5eRVe8ZTkKgFUGR+CPzSiud/5vMiQPUK
 XF9RZXAzhXELRBfuXB0dyL0HfwHGnP+MQboVpjbZpVW6X4th7s64f766Xw++mY+SdnKN
 DX6nYKEDwZjswDGhJ3/8smgSaXtjdmTxfOA7aIN7ObbYAaPEo2pBzL3640B7LM+/YRhF
 Uyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751538015; x=1752142815;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rBLeovshoD+ZCFSZgZz9QHS7HmFVNwQ8FXr1pu4DzU8=;
 b=Bwh4VfZSLIReWGpT9DVcbFwzUIGeKUog/oGptslTJvxmFFJPUx61WXpggaYBQpm2pr
 qgyjrVRMDT5tQHD5zLw3it4j7wTJ1seC1SgW7ftUiB0FyFZXS7CPdezBvlYdZM+TbDJO
 LVNk4ajQURog0ujEHwQ4uC2U/6Bw60lalZ7TggkOxstbv0qgrnvEsZ2WBPEOU+NTp4CH
 FujXAPcTMNF3aGI4u4pnWwsVPeaE/k4+C68aMqja3nWNdI+sfsTwCdH3PJhzgjRGxt2F
 EUlPrwZJhOG/D3K0pZYpV5/b7ixDtiHf99tO1yNL7FCyxxwyTZY/a6YNmU1PMriZtph0
 Z5/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVadb4bFjMqkzoQm0Pd0FcfXXjgbM2hhAosHp47QezPU7l3fEo5gdq8BEEk/vQaoFs3jmKhoe69Gg==@nongnu.org
X-Gm-Message-State: AOJu0YzZzv6BzrvZjhCwVtZuQayTfCzsLxkIYHe3XNENki4iCEUQVPY7
 8juia0vALSVxBPIvEcnT0NkA7tlYzkiaJ+jCGDcDvVy1E+w2qfekI57jrFR5823p3pq0uHU51zY
 qxvyQEbbH+uEzcJn207jh9OHc60efq1rI1Hl9Wt3cwA==
X-Gm-Gg: ASbGncszj1XWxXuVVal0leX8SYaBRzIt2/a6dse9deV6B3zhaiSPDp4uxFZG7EeiglJ
 rtv2GtR+2mTYhTanNypulJC3j27Vf7F/sywBZgUuZbUEFWDsk8rgJP9DMM+Glkd6uJhquJ44RvE
 TLum8XRMMWsZk5jXwFkyohp5h8pNfa3eqdcGBSoJGOnn9V
X-Received: by 2002:a05:690c:7344:b0:70c:c013:f26 with SMTP id
 00721157ae682-7164d4b3031mr98128737b3.33.1751538014535; Thu, 03 Jul 2025
 03:20:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-50-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-50-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 11:20:03 +0100
X-Gm-Features: Ac12FXzt6fZkMZ-XYKnDqIecQesdrQLiFZasRBXfGk69lw-sc9D8NTBzgj8H5Rk
Message-ID: <CAFEAcA-Qj5Vv6x08epwiWs0ihDLa4=mihMvrx=D+xOLkdYFvYQ@mail.gmail.com>
Subject: Re: [PATCH v3 49/97] target/arm: Implement SME2 SQCVT, UQCVT, SQCVTU
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
X-TUID: s+GfdntEBByO

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-sme.h    |  20 ++++++
>  target/arm/tcg/sme_helper.c    | 116 +++++++++++++++++++++++++++++++++
>  target/arm/tcg/translate-sme.c |  35 ++++++++++
>  target/arm/tcg/sme.decode      |  22 +++++++
>  4 files changed, 193 insertions(+)


> index d69d57c4cb..906d369d37 100644
> --- a/target/arm/tcg/sme_helper.c
> +++ b/target/arm/tcg/sme_helper.c
> @@ -1561,6 +1561,64 @@ void HELPER(sme2_fcvt_n)(void *vd, void *vs, float_status *fpst, uint32_t desc)
>      }
>  }
>
> +#define SQCVT2(NAME, TW, TN, HW, HN, SAT)                       \
> +void HELPER(NAME)(void *vd, void *vs, uint32_t desc)            \
> +{                                                               \
> +    ARMVectorReg scratch;                                       \
> +    size_t oprsz = simd_oprsz(desc), n = oprsz / sizeof(TW);    \
> +    TW *s0 = vs, *s1 = vs + sizeof(ARMVectorReg);               \
> +    TN *d = vd;                                                 \
> +    if ((vd - vs) < 2 * sizeof(ARMVectorReg)) {                 \

Does this do the right thing if Vd is less than Vs?
Pointer differences are signed, I think, so for eg vd == 0
vs == 16 we unnecessarily use the scratch reg.
Maybe clearer to write
   (vd >= vs && vd < (vs + 2 * sizeof(..))

(Similarly for other use of this condition later in the patch.)


> +        d = (TN *)&scratch;                                     \
> +    }                                                           \
> +    for (size_t i = 0; i < n; ++i) {                            \
> +        d[HN(i)] = SAT(s0[HW(i)]);                              \
> +        d[HN(i) + n] = SAT(s1[HW(i)]);                          \

Should this be HN(i + n) ?

> +    }                                                           \
> +    if (d != vd) {                                              \
> +        memcpy(vd, d, oprsz);                                   \
> +    }                                                           \
> +}
> +
> +SQCVT2(sme2_sqcvt_sh, int32_t, int16_t, H4, H2, do_ssat_h)
> +SQCVT2(sme2_uqcvt_sh, uint32_t, uint16_t, H4, H2, do_usat_h)
> +SQCVT2(sme2_sqcvtu_sh, int32_t, uint16_t, H4, H2, do_usat_h)
> +
> +#undef SQCVT2
> +
> +#define SQCVT4(NAME, TW, TN, HW, HN, SAT)                       \
> +void HELPER(NAME)(void *vd, void *vs, uint32_t desc)            \
> +{                                                               \
> +    ARMVectorReg scratch;                                       \
> +    size_t oprsz = simd_oprsz(desc), n = oprsz / sizeof(TW);    \
> +    TW *s0 = vs, *s1 = vs + sizeof(ARMVectorReg);               \
> +    TW *s2 = vs + 2 * sizeof(ARMVectorReg);                     \
> +    TW *s3 = vs + 3 * sizeof(ARMVectorReg);                     \
> +    TN *d = vd;                                                 \
> +    if ((vd - vs) < 4 * sizeof(ARMVectorReg)) {                 \
> +        d = (TN *)&scratch;                                     \
> +    }                                                           \
> +    for (size_t i = 0; i < n; ++i) {                            \
> +        d[HN(i)] = SAT(s0[HW(i)]);                              \
> +        d[HN(i) + n] = SAT(s1[HW(i)]);                          \
> +        d[HN(i) + 2 * n] = SAT(s2[HW(i)]);                      \
> +        d[HN(i) + 3 * n] = SAT(s3[HW(i)]);                      \

Similarly I thought the Hn macros would need these to be
HN(i + n) etc.

> +    }                                                           \
> +    if (d != vd) {                                              \
> +        memcpy(vd, d, oprsz);                                   \
> +    }                                                           \
> +}

> +#define SQCVTN2(NAME, TW, TN, HW, HN, SAT)                      \
> +void HELPER(NAME)(void *vd, void *vs, uint32_t desc)            \
> +{                                                               \
> +    ARMVectorReg scratch;                                       \
> +    size_t oprsz = simd_oprsz(desc), n = oprsz / sizeof(TW);    \
> +    TW *s0 = vs, *s1 = vs + sizeof(ARMVectorReg);               \
> +    TN *d = vd;                                                 \
> +    if ((vd - vs) < 2 * sizeof(ARMVectorReg)) {                 \
> +        d = (TN *)&scratch;                                     \
> +    }                                                           \
> +    for (size_t i = 0; i < n; ++i) {                            \
> +        d[HN(2 * i + 0)] = SAT(s0[HW(i)]);                      \
> +        d[HN(2 * i + 1)] = SAT(s1[HW(i)]);                      \

Hmm, here we do do HN(whole expr)...


> +    }                                                           \
> +    if (d != vd) {                                              \
> +        memcpy(vd, d, oprsz);                                   \
> +    }                                                           \
> +}
> +

thanks
-- PMM
