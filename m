Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1136488lfm;
        Fri, 24 Apr 2020 14:37:34 -0700 (PDT)
X-Google-Smtp-Source: APiQypIWGdge92fLKzbGvGJa1zz5jZfJ/ClxGam70PhaUq/jGOTiG+IuRWsinzPO7izEsrO7NFNt
X-Received: by 2002:ac8:764e:: with SMTP id i14mr11549570qtr.191.1587764254210;
        Fri, 24 Apr 2020 14:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587764254; cv=none;
        d=google.com; s=arc-20160816;
        b=Lhna3NYIKOUWZlMcgDq3j+hEsi1ndHsKguz7pGbTi6Q8g3h0KPzN9McJLPMD1//vqr
         C2kJmTmAGpHvp1uAb5v7EGxAUZHZ3UH1vhZ5GW9wUSWBOl0P7V8YFf1pufbWMOHekLaj
         unQRiDT/1oU64KQMkLojBONfoiqZ2rk9bj77imVEUP+DAIGZLsBEbf+Vum1nj+BNlub6
         rbl86x/Mq+HGuZaUfWoJsaqmkNF2wNtuYiikK7WdWz5HGuz3HDQ8uNAtWgmZsroJAhNB
         Se0jvEg1U2PGDoue+s0aymrnmEvhYyhGrQSbFyjVZqyoPOwxfYz+j3697Z3U8txvqW2U
         zaGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=dNRfTmh38M6Q+PAlnPzkurZUncglzk1nCME5XDIOZ6E=;
        b=QAOWWtA8TUI871OGfSS35BMB/B+pYhGHq8od3X/Cw/bbxK66kQ4ZSBIf3glEEE8rop
         IWaWJin7x2yM0qLpd2pUroecL7SvyOurND3VmHE0yR0qz6SMCdMcBSJNvZAiW4aVMEjY
         EwpbcY2Q5p0BPrCUgGGlTSrsr43SoZL99ZwiHcv7apcw7zU8dstmn4NCk5s44IJjlBET
         X0ur4ax9EbaV5Cz46Ajqew2vRrOPUq5jBwzOlHeY5yBY2u36kgj0zy7XRMACkXoJwBr0
         3EwYYDxfuWSsDqFvLbyDb8P//+RrlxDXbzoGkTsRNaevreER1N46SvXkrYIKMF6sjKDc
         WRig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=burJebL0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z27si4024371qtj.324.2020.04.24.14.37.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Apr 2020 14:37:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=burJebL0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jS60r-0003do-GX
	for alex.bennee@linaro.org; Fri, 24 Apr 2020 17:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48768)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jS60i-0003cM-5B
 for qemu-arm@nongnu.org; Fri, 24 Apr 2020 17:37:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jS60g-00081D-8F
 for qemu-arm@nongnu.org; Fri, 24 Apr 2020 17:37:23 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:33989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jS60f-0007xE-NS
 for qemu-arm@nongnu.org; Fri, 24 Apr 2020 17:37:21 -0400
Received: by mail-pg1-x543.google.com with SMTP id o15so5264333pgi.1
 for <qemu-arm@nongnu.org>; Fri, 24 Apr 2020 14:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dNRfTmh38M6Q+PAlnPzkurZUncglzk1nCME5XDIOZ6E=;
 b=burJebL03g9+2VYn4TnZDidvEbMQHnRVH7c60dV8zTSN6Hwm6l7J4uDyDcAY/96W16
 zUn8eUQFo+i9aP0th4cCQOfd29dNNnz2V5BIM8N4EN2ayq8KlN0uoO1HIRHB/rsvM9VL
 CqD30IyPDbArh9MjzHbCYHps0ydg1Sk9Ba5S1YDe0806Fdlt1VzQZGcEEhMvdg/JsdoR
 t6ShxW0h3ZDNcnksX2ClC0DkvcKYGAicoJcKYO2yGdtFJE8wYlFtqMsD+bRCDe7z4UeE
 PE5QhzSEkXIxyUpC/2WN7Tsw0vNyMJawrsdnwglSRexuzc+qVaqf8NLVP2q5+eUTGY6x
 LSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dNRfTmh38M6Q+PAlnPzkurZUncglzk1nCME5XDIOZ6E=;
 b=YvwrHo+cmanrvSsi8FZCi6ZeCIwvVJ7QGZzjZJIulNK5Dy4wJa51hv/raspYr8CbkN
 SmQ5775pcI/J5/PH1phERr7UBlUC/uyRLMUHWQfiNmHxvHjEVfVMv/9P4jg5931Yutxc
 knJ+wzmNMVfvICzzFBk9fxKxGevswBNvFGCZ3RrhpS2F2Z9C1HqetwtsoIXK0T580953
 BiZUFH1GntEe6EWuJfy8woww6y8yYsKKaDju9LsFqj3DJeXBHu0ATTQfe8pPYFZ61c7x
 yeKe7LAOrQpHSDm5paqFosODXvl/4QZyxXauiX0FwYdq+/HHdJbCpL6XY9T1LIlQytfW
 KiZQ==
X-Gm-Message-State: AGi0PuZ2P+qZUBYSJT8U2ka+cNyR0rg/sZYF+j5WNbtZa+2uF+ZxMsHF
 A8PY3b0IdoQNNWLuoqMTg5Z+bA==
X-Received: by 2002:a63:f707:: with SMTP id x7mr11747027pgh.374.1587764239313; 
 Fri, 24 Apr 2020 14:37:19 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id y186sm5695099pgb.69.2020.04.24.14.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Apr 2020 14:37:18 -0700 (PDT)
Subject: Re: [PATCH RFC] target/arm: Implement SVE2 TBL, TBX
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200423164236.5181-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c1dc0aa8-783b-c91e-058f-52e3183f9202@linaro.org>
Date: Fri, 24 Apr 2020 14:37:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200423164236.5181-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::543
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
X-TUID: IOEj32LuEAHe

On 4/23/20 9:42 AM, Stephen Long wrote:
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> 
> These insns don't show up under any SVE2 categories in the manual. But
> if you lookup each insn, you'll find they have SVE2 variants.
> ---
>  target/arm/helper-sve.h    | 10 +++++++
>  target/arm/sve.decode      |  5 ++++
>  target/arm/sve_helper.c    | 53 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 20 ++++++++++++++
>  4 files changed, 88 insertions(+)
> 
> diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
> index f6ae814021..54d20575e8 100644
> --- a/target/arm/helper-sve.h
> +++ b/target/arm/helper-sve.h
> @@ -2687,3 +2687,13 @@ DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_zzzz_s, TCG_CALL_NO_RWG,
>                     void, ptr, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_zzzz_d, TCG_CALL_NO_RWG,
>                     void, ptr, ptr, ptr, ptr, i32)
> +
> +DEF_HELPER_FLAGS_5(sve2_tbl_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_5(sve2_tbl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_5(sve2_tbl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_5(sve2_tbl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
> +
> +DEF_HELPER_FLAGS_4(sve2_tbx_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(sve2_tbx_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(sve2_tbx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> +DEF_HELPER_FLAGS_4(sve2_tbx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
> diff --git a/target/arm/sve.decode b/target/arm/sve.decode
> index 3a2a4a7f1c..483fbf0dcc 100644
> --- a/target/arm/sve.decode
> +++ b/target/arm/sve.decode
> @@ -1387,3 +1387,8 @@ UMLSLT_zzzw     01000100 .. 0 ..... 010 111 ..... .....  @rda_rn_rm
>  
>  CMLA_zzzz       01000100 esz:2 0 rm:5 0010 rot:2 rn:5 rd:5  ra=%reg_movprfx
>  SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
> +
> +### SVE2 Table Lookup (three sources)
> +
> +TBL_zzz         00000101 .. 1 ..... 00101 0 ..... .....  @rd_rn_rm
> +TBX_zzz         00000101 .. 1 ..... 00101 1 ..... .....  @rd_rn_rm
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index 55e2c32f03..d1e91da02a 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -2968,6 +2968,59 @@ DO_TBL(sve_tbl_d, uint64_t, )
>  
>  #undef TBL
>  
> +#define DO_SVE2_TBL(NAME, TYPE, H) \
> +void HELPER(NAME)(void *vd, void *vn1, void *vm, void *vn2, uint32_t desc)  \
> +{                                                                           \
> +    intptr_t i, opr_sz = simd_oprsz(desc);                                  \
> +    uintptr_t elem = opr_sz / sizeof(TYPE);                                 \
> +    TYPE *d = vd, *n1 = vn1, *n2 = vn2, *m = vm;                            \
> +    ARMVectorReg tmp1, tmp2;                                                \

Only one temp needed.

> +    if (unlikely(vd == vn1)) {                                              \
> +        n1 = memcpy(&tmp1, vn1, opr_sz);                                    \
> +    }                                                                       \
> +    if (unlikely(vd == vn2)) {                                              \
> +        n2 = memcpy(&tmp2, vn2, opr_sz);                                    \
> +    }                          

Better with else if here.
Because vd cannot overlap both vn1 or vn2, only one of them.
                                             \
> +    for (i = 0; i < elem; i++) {                                            \
> +        TYPE j = m[H(i)];                                                   \
> +        d[H(i)] = j < (elem * 2) ? n1[H(j)] : 0;                            \
> +                                                                            \
> +        TYPE k = m[H(elem + i)];                                            \
> +        d[H(elem + i)] = k < (elem * 2) ? n2[H(k)] : 0;                     \
> +    }

First, the indexing is wrong.

Note that you're range checking vs elem * 2, but only indexing a single vector.
 Thus you must be indexing into the next vector.

This should look more like

    TYPE j = m[H(i)];
    TYPE r = 0;

    if (j < elem) {
        r = n1[H(j)];
    } else if (j < 2 * elem) {
        r = n2[H(j - elem)];
    }
    d[H(i)] = r;

Second, this is one case where I'd prefer to share code with AArch64.  It would
be worthwhile to rearrange both sve1 and advsimd to use a common set of helpers.

> +static bool trans_TBL_zzz(DisasContext *s, arg_rrr_esz *a)

_zzz is not helpful here.  The SVE1 insn also operates on 3 registers, and thus
could logically be _zzz too.

Better might be _double, after double_table = TRUE, or maybe just _2 just in
case SVE3 adds a variant with more table registers.


r~
