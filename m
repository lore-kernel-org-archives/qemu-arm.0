Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp26543lfm;
        Tue, 14 Apr 2020 19:05:30 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ0dU+5T1eK2wkVSyrQ4CS9CCgVfJcogtIKx64NSHYyE9vi5RavSaEZ6axqlVxJ8T+4iXg/
X-Received: by 2002:ac8:7156:: with SMTP id h22mr19223624qtp.361.1586916329958;
        Tue, 14 Apr 2020 19:05:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586916329; cv=none;
        d=google.com; s=arc-20160816;
        b=dTUSqErftj7PoIuggU7PEm9/B3CkqKmaXnzuwnO2LNe28K4F5BHQInGsFWuRgsBxQK
         HOEjef1G3fXYCCcwVQkvXjy9K0KicfKDKB+rlw0plnPJmqM2leBb3hwlCPzv/UB4Ld6+
         HzApkr++jcGt+Sod6o/dfwUNcyM8III+sjRvcGYw3IiOLWsRwHo7m9O4VNBWd0THkUEu
         5wpPPeN8OYrCx0IL93NaSSqww0CKv3BEDhGKY5EbT08IHkWR/lJXrZNf1e6X4Kx9Ou2o
         qTmrvHVGkHNEVxVLDC+TdE4vwy+BUhh6LiBNPxYiEufQ3A00uhHk7Wf+fo76ItU9r9Y3
         C5XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=z5ZIqmLGd9afsenqOCO5DmjHB2R2FPUTCPEsoeiBXN8=;
        b=FfUiMm0kvnJaIMIUQwUsMlfW3BQxpshDBgwua9lEmGdaFYUNR4LwgkLII6W5LqUYzH
         PVaNyys+C3lKSWdfoW34gjvg3bCh2HvMSa382jQtUhONs7npI8JCHs1TWX0ECjP2UorR
         t75vRMGvd6RiwH3RcANst4J4vmEEdjTBFkr8CLTHEB1hNTusExUmkBUPxuYQlojeoT+q
         IXuscq8uXdPwtEua2VkB/VOh+U/o4FhB9cBqF0YAYxrDIaZNwzxLbBbvNhVZ1eVfyOpQ
         6Nveqf+7oIXR4mtt1eHrYFTmkm/YcE9WkS69exygn/V1e3BlMOQcpO5bc9PsovtfZGqQ
         vtPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DIPD1ZDm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a21si3701692qtc.162.2020.04.14.19.05.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 19:05:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DIPD1ZDm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOXQf-0006YU-Df
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 22:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38117)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jOXQT-0006Y4-AJ
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 22:05:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jOXQR-0001wv-KD
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 22:05:17 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:45849)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jOXQR-0001vT-7A
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 22:05:15 -0400
Received: by mail-pg1-x541.google.com with SMTP id w11so781533pga.12
 for <qemu-arm@nongnu.org>; Tue, 14 Apr 2020 19:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z5ZIqmLGd9afsenqOCO5DmjHB2R2FPUTCPEsoeiBXN8=;
 b=DIPD1ZDmOyVvuD+EGFr9PB46FukiEq0KqsdHOitSk8S4bJCFdVbvj1vkdpQOuVjhZ6
 xHc1iBOQY6vQXhQJPIoIXon36Xm+8Mz7bZpVN7A9JGnbq0DsDd9Qo1aaChJXU5FGViQk
 mWC5PpnmPvRUkKP348lu2TD/j+KyA+V6rs3cnVt8DoQ+P4PkwbJnZBSgUmSD+f0zBKwv
 a+B7+gyxrmDLR1TkMJqLh0azl5+9LsJEOstSIjR0kFe5wCL95jPCi0h+A3queoSv1l+2
 ItwU8H/cfboWPgh+kXOmQ8zJhfMIqsf/urPlf0pPBHIRr9Gr1/OxgBMHc+oe2Wj8U+B/
 1pFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z5ZIqmLGd9afsenqOCO5DmjHB2R2FPUTCPEsoeiBXN8=;
 b=Bmfx0pHJE3Dmh4mUoBDnjLigcjydpesMJglFjXpetvt8jZJou/64XNJCDIHHq5cK8C
 ojsLw7BFPVVQOkCKU6NQG8/bkGKe3LOOWhJ4G597EKgRc/Izf/dV2li+4GQXLSJkWcPJ
 3JUGMhOYCR1Z/ZADSLYyyqna0bXSwQsyOEQE9WwTr3ChRThROGbMHuLYeldcxNfqYnkR
 f+EjmqDW3yvaJiSalPiZ3xYdaQB8smMEq9C360x/h+nZ/adyJ5JGLSCgI4AuRPw/UCPv
 jj+6GQngxGoGhgJf3sZVTYXSCWU4gGxAecztPVcxxK/lFL6pnTZ7MiUGdIS3JanljZib
 5WZQ==
X-Gm-Message-State: AGi0PuZoGkfjd80N+sWObiAilzIBKhFLzNOYe23mCnHsCMtQm0fWkujD
 wS6JVtyOflGSaPI7BnCkMGDNnQ==
X-Received: by 2002:a62:7a88:: with SMTP id
 v130mr24809578pfc.129.1586916313101; 
 Tue, 14 Apr 2020 19:05:13 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id j16sm10167646pgi.40.2020.04.14.19.05.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2020 19:05:12 -0700 (PDT)
Subject: Re: [PATCH RFC v2] target/arm: Implement SVE2 MATCH, NMATCH
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200414231610.8387-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e7fb7a8c-0dc9-45c3-a0f7-9952b4a60aeb@linaro.org>
Date: Tue, 14 Apr 2020 19:05:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200414231610.8387-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5SvsFvuXQaRC

On 4/14/20 4:16 PM, Stephen Long wrote:
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> ---
>  target/arm/helper-sve.h    | 10 ++++++++
>  target/arm/sve.decode      |  5 ++++
>  target/arm/sve_helper.c    | 51 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 22 ++++++++++++++++
>  4 files changed, 88 insertions(+)
> 
> diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
> index 5dd880cf6d..bc4a463bc7 100644
> --- a/target/arm/helper-sve.h
> +++ b/target/arm/helper-sve.h
> @@ -2516,6 +2516,16 @@ DEF_HELPER_FLAGS_3(sve2_uqrshrnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_3(sve2_uqrshrnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_3(sve2_uqrshrnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
>  
> +DEF_HELPER_FLAGS_5(sve2_match_ppzz_b, TCG_CALL_NO_RWG,
> +                   i32, ptr, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_5(sve2_match_ppzz_h, TCG_CALL_NO_RWG,
> +                   i32, ptr, ptr, ptr, ptr, i32)
> +
> +DEF_HELPER_FLAGS_5(sve2_nmatch_ppzz_b, TCG_CALL_NO_RWG,
> +                   i32, ptr, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_5(sve2_nmatch_ppzz_h, TCG_CALL_NO_RWG,
> +                   i32, ptr, ptr, ptr, ptr, i32)
> +
>  DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_h, TCG_CALL_NO_RWG,
>                     void, ptr, ptr, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_s, TCG_CALL_NO_RWG,
> diff --git a/target/arm/sve.decode b/target/arm/sve.decode
> index 374e47fb05..652668df02 100644
> --- a/target/arm/sve.decode
> +++ b/target/arm/sve.decode
> @@ -1305,6 +1305,11 @@ UQSHRNT         01000101 .. 1 ..... 00 1101 ..... .....  @rd_rn_tszimm_shr
>  UQRSHRNB        01000101 .. 1 ..... 00 1110 ..... .....  @rd_rn_tszimm_shr
>  UQRSHRNT        01000101 .. 1 ..... 00 1111 ..... .....  @rd_rn_tszimm_shr
>  
> +### SVE2 Character Match
> +
> +MATCH           01000101 .. 1 ..... 100 ... ..... 0 .... @pd_pg_rn_rm
> +NMATCH          01000101 .. 1 ..... 100 ... ..... 1 .... @pd_pg_rn_rm
> +
>  ## SVE2 floating-point pairwise operations
>  
>  FADDP           01100100 .. 010 00 0 100 ... ..... ..... @rdn_pg_rm
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index b68f62cd7f..78abd8b62a 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -6890,3 +6890,54 @@ DO_ST1_ZPZ_D(dd_be, zd, MO_64)
>  
>  #undef DO_ST1_ZPZ_S
>  #undef DO_ST1_ZPZ_D
> +
> +#define DO_PPZZ_CHAR_MATCH(NAME, TYPE, OP, H, MASK, DEFAULT_VAL)              \
> +static inline bool NAME##_inner_loop(TYPE nn, void *segmentbase)              \
> +{                                                                             \
> +    intptr_t i = 128;                                                         \
> +    do {                                                                      \
> +        do {                                                                  \
> +            i -= sizeof(TYPE) * 8;                                            \
> +            TYPE mm = *(TYPE *)(segmentbase + H1(i));                         \
> +            if (nn OP mm) {                                                   \
> +                return !DEFAULT_VAL;                                          \
> +            }                                                                 \
> +        } while (i & 63);                                                     \
> +    } while (i > 0);                                                          \
> +    return DEFAULT_VAL;                                                       \
> +}                                                                             \

You seem to be mixing up bit and bytes here, with 128 bits and H1 as a byte index.

I note that we don't need to keep re-loading the Zm segment elements from
memory.  Perhaps something like

static inline bool do_match1(uint64_t n, uint64_t m, int esz)
{
    int i, bits = 8 << esz;
    n = extract64(n, 0, bits);
    for (i = 0; i < 64; i += bits) {
        if (n == extract64(m, i, bits)) {
            return true;
        }
    }
    return false;
}

static inline bool do_match2(uint64_t n, uint64_t m0,
                             uint64_t m1, int esz)
{
    return do_match1(n, m0, esz) || do_match1(n, m1, esz);
}


As an improvement, we can use

https://graphics.stanford.edu/~seander/bithacks.html#ZeroInWord

static inline bool do_match2(uint64_t n, uint64_t m0,
                             uint64_t m1, int esz)
{
    int bits = 8 << esz;
    uint64_t ones = dup_const(esz, 1);
    uint64_t signs = ones << (bits - 1);
    uint64_t cmp0, cmp1;

    cmp1 = dup_const(esz, n);
    cmp0 = cmp1 ^ m0;
    cmp1 = cmp1 ^ m1;
    cmp0 = (cmp0 - ones) & ~cmp0;
    cmp1 = (cmp1 - ones) & ~cmp1;
    return (cmp0 | cmp1) & signs;
}


> +uint32_t HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc)  \
> +{                                                                             \
> +    intptr_t opr_sz = simd_oprsz(desc);                                       \
> +    uint32_t flags = PREDTEST_INIT;                                           \
> +    intptr_t i = opr_sz;                                                      \
> +    do {                                                                      \
> +        uint64_t out = 0;                                                     \
> +        uint64_t pg;                                                          \
> +        do {                                                                  \
> +            i -= sizeof(TYPE), out <<= sizeof(TYPE);                          \
> +            TYPE nn = *(TYPE *)(vn + H(i));                                   \
> +            out = (out & ~1ull) | DEFAULT_VAL;                                \
> +            out |= NAME##_inner_loop(nn, vm + (i & -16));                     \
> +        } while (i & 63);                                                     \
> +        pg = *(uint64_t *)(vg + (i >> 3)) & MASK;                             \
> +        out &= pg;                                                            \
> +        *(uint64_t *)(vd + (i >> 3)) = out;                                   \
> +        flags = iter_predtest_bwd(out, pg, flags);                            \
> +    } while (i > 0);                                                          \
> +    return 0;                                                                 \

static inline uint32_t do_match(void *vd, void *vn,
    void *vm, void *vg, uint32_t desc,
    int esz, bool nmatch)
{
    intptr_opr_sz = simd_oprsz(desc);
    uint32_t flags = PREDTEST_INIT;
    intptr_t i, j, k;

    for (i = 0; i < opr_sz; i += 16) {
        uint64_t m0 = *(uint64_t *)(vm + i);
        uint64_t m1 = *(uint64_t *)(vm + i + 8);
        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));
        uint16_t out = 0;

        for (j = 0; j < 16; j += 8) {
            uint64_t n = *(uint64_t *)(vn + i + j);

            for (k = 0; k < 8; k += 1 << esz) {
                if (pg & (1 << (j + k))) {
                    bool o = do_match2(n >> (k * 8),
                                       m0, m1, esz);
                    out |= (o ^ nmatch) << (j + k);
                }
            }
        }
        *(uint16_t *)(vd + H1_2(i >> 3)) = out;
        flags = iter_predtest_fwd(out, pg, flags);
    }
    return flags;
}

#define DO_PPZZ_MATCH(NAME, ESZ, INV) \
uint32_t HELPER(NAME)(void *vd, void *vn, void *vm,   \
                      void *vg, uint32_t desc)        \
{                                                     \
    return do_match(vd, vn, vm, vg, desc, ESZ, INV);  \
}

DO_PPZZ_MATCH(sve2_match_ppzz_b, MO_8, false)
DO_PPZZ_MATCH(sve2_match_ppzz_h, MO_16, false)

DO_PPZZ_MATCH(sve2_nmatch_ppzz_b, MO_8, true)
DO_PPZZ_MATCH(sve2_nmatch_ppzz_h, MO_16, true)


r~
