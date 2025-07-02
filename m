Received: by 2002:a05:622a:6187:b0:4a7:49b6:ba6e with SMTP id hh7csp3464204qtb;
        Tue, 1 Jul 2025 19:29:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX3RQQizDrVuwvhWMsgJyR+8hBdLt/mfPd36ZRIg/TmY4Ur02gfTY9M4sItEZQw/a6Z++KnydNatr86Gw==@linaro.org
X-Google-Smtp-Source: AGHT+IENwj389+Q/z1YNhX3iKPC9i1m/IyGFY3Y1lYs/osYrOTvo8trz6PqY76Hmh6H51//1Nev9
X-Received: by 2002:a05:622a:5449:b0:4a7:9b9b:aad7 with SMTP id d75a77b69052e-4a976a37271mr25466991cf.49.1751423371305;
        Tue, 01 Jul 2025 19:29:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751423371; cv=none;
        d=google.com; s=arc-20240605;
        b=VAw9h50ZSgWNDAlaatdoeSDJrfE4O+SZ7aK12cEFwu++DF3I0aqE9hVtAp640Dotpk
         qlN5JH815aqon6ukO9LS5dCbv7Zf9zj7Q1HzckpVeH8FB4Ko5fVGGgTPlATBomBiEZec
         ooAiw86hlRowsOuVwgjNvBMU8JsQbiHpWSUbHg9ubiiDUHgA0fbKJqKTmYEESLLKOv6D
         aizeddoXQhncWl6KpT2SCdejswOMwbL7FucLdyAlM17Y/O1eaBRbwDrgFic9erLIIhAN
         0kFffczUZGuvYJsNZy6QV5TNj5LSbYyGfOsVsu/yuuFfjioqXWFmmAqdF7JW53ZlBoKg
         qioA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Wg+NWeNOqI2N5n/GaHZ/LLPcIAbDq0HjwrLwgpXBjUw=;
        fh=VmNcvBpGnZ12hYnd9vj+I9Y9X/sn86eY2dEvOtqhn80=;
        b=UFWrCaMWSwXBjmLp++GqwTgGJGiwrMLylM5+Bbnn75PZK6/FRaUqlwkYbdCzNge0Ne
         tvgUz2dp/t7J1VsQd4+YUNlbMPeSYLSMFJWi+nA6F+5nr2hkh7iAmJ71U2UkoVdASiuD
         TaWOeHw43yLshSIO5s0/3BSOohdLPAxojmQQhYVeAiCyl+h/Rnpau6dkqWia9woLFVuR
         kzoR1KoHh5+A07DVemF4RbL+fDJp9nmr4Wpc1R/gtSVcSDT4+LROyfT3uwWZn1K0DabV
         75ia8Xca3zvE/lhKwe9SP4EKFNEFedMvVbUsK241hROVfX7VONj2KZSvLHDxYD2Gr6Ad
         I59A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mpxPpxqT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fdca5629si121757701cf.551.2025.07.01.19.29.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Jul 2025 19:29:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mpxPpxqT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWnDp-0003ki-Te; Tue, 01 Jul 2025 22:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWnDn-0003kI-Ua
 for qemu-arm@nongnu.org; Tue, 01 Jul 2025 22:29:16 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWnDl-00022d-UQ
 for qemu-arm@nongnu.org; Tue, 01 Jul 2025 22:29:15 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-611b246727cso2021742eaf.0
 for <qemu-arm@nongnu.org>; Tue, 01 Jul 2025 19:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751423352; x=1752028152; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wg+NWeNOqI2N5n/GaHZ/LLPcIAbDq0HjwrLwgpXBjUw=;
 b=mpxPpxqTRVIzhUblZyJOYRYmBnLyxE3NCsQ2UQB38nN9MRVoEnXC7VCAfemn00SNYJ
 t2c7Q/EcYKxbDPhw8/zY65Ybqpn9BhGTdLk2lKh5PNv4sbvhuYcC9jYzO8epTPYeuPDN
 /GD0yxR6BlUMBQjtLkqL04FNPbKPrRGDlORXV/7MMPwQgbfuIvvL486G4X2MGiMzs4NC
 RXJuJ8qkQsqNB/NP2pAe/3j7uyQ36sHV8fGuMsdGStdg/qwvqUYXAze5JyEafK+Rt3Hs
 ghVWG9gTn0Gkm3O2t9j1EiSOvxWZv89FtDAdzFkfxa3rpAtkrTlfOGjkI2/sodpMpSAn
 rAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751423352; x=1752028152;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wg+NWeNOqI2N5n/GaHZ/LLPcIAbDq0HjwrLwgpXBjUw=;
 b=Dybe2GuGZ+LKs1x9YQFITVydEmHbnkVb2VZWmhmh1kPwEGxjFrw0ZohvkU20MhKerD
 XksEqSKoew4qnXjpdpX4LCsTY7GeqbA8GM5kv/lrF8jIfgZEVEd7C1ha1vSL1y2H0RPv
 I4iN3isUfjhcUNRQqv57a4naCNFFSNG1YgrGWT2euOB7Lm37Od4tcuao4WnMsrJWyl4J
 RzAYIBKf05uUumSE9D0Jyzl+m/Pld45lsIPGbrHvoBoyhyC8LTSpj7eFp4zTH0Jg7NYi
 WM53HPYuMeK6WWZ2AQpPXcbUATMbavHymGcYaZ7akz9nQrvnT8/EFq012Hw28oFc6qED
 xcBw==
X-Gm-Message-State: AOJu0Yw6cII3F2E/BtmsARbidKOLBcqaa4t/2micQIqbZZmKL6D/txVB
 WI2VeJvNb3lZnZqqWRmp9UIaO/iSHmemHgZq1sI51KiDOrRfs9Tx2frFk2wZ5d9iq2tlQVQiqiR
 2H+ztI2U=
X-Gm-Gg: ASbGncvykzcmWjaTVHwBouzjOr/BrT66DsDKHYhXgWdOACL/JHqjjHBMDoXF8AQKG8a
 zxbFTZEhnw1rYUSTVrxb4zMV8Ls6Z9DFmk+mrNS1a54wPY3iq1//zNCSi7ZIIbdczrHOsIT8dnu
 3wiHLzxLlSImZliIXOJBHqmNDdFYIgaEXYZACDmOHa9BivBnpYeLlm/gKbbwmsRnJetQQGnR3t2
 WQYbNfnU+/bo8WJUR1pDGuQSeu+9X+fpzuAzt0a1rjmIf5xW7iRhQcNfIVFMmBZyhNwvWQzuWuS
 xYJ2PO0MQVHVRMYUvIgUqGKAZI4n1v1ut5Rzvawxb717Kul1QlIPvhmwtOE8BmkofUXLdE/Fcdw
 yww==
X-Received: by 2002:a05:6820:1896:b0:611:b1c7:23f with SMTP id
 006d021491bc7-61200fb67e7mr783563eaf.0.1751423351880; 
 Tue, 01 Jul 2025 19:29:11 -0700 (PDT)
Received: from [10.25.7.201] ([187.210.107.185])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-611b848ba33sm1648411eaf.10.2025.07.01.19.29.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 19:29:11 -0700 (PDT)
Message-ID: <d0fe4c30-3dbd-4868-a277-c6777a83972d@linaro.org>
Date: Tue, 1 Jul 2025 20:29:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] target/arm: Fix VLDR helper load alignment checks
To: William Kosasih <kosasihwilliam4@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20250701103159.62661-1-kosasihwilliam4@gmail.com>
 <20250701103159.62661-5-kosasihwilliam4@gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250701103159.62661-5-kosasihwilliam4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc36.google.com
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
X-TUID: S1SID93aEsZn

On 7/1/25 04:31, William Kosasih wrote:
> This patch adds alignment checks in the load operations in the VLDR
> instruction.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1154
> Signed-off-by: William Kosasih <kosasihwilliam4@gmail.com>
> ---
>   target/arm/tcg/mve_helper.c | 41 ++++++++++++++++++++++++++++---------
>   1 file changed, 31 insertions(+), 10 deletions(-)
> 
> diff --git a/target/arm/tcg/mve_helper.c b/target/arm/tcg/mve_helper.c
> index 506d1c3475..922cd2371a 100644
> --- a/target/arm/tcg/mve_helper.c
> +++ b/target/arm/tcg/mve_helper.c
> @@ -147,6 +147,22 @@ static void mve_advance_vpt(CPUARMState *env)
>       env->v7m.vpr = vpr;
>   }
>   
> +/* Mapping of LDTYPE/STTYPE to the number of bytes accessed */
> +#define MSIZE_b 1
> +#define MSIZE_w 2
> +#define MSIZE_l 4
> +
> +/* Mapping of LDTYPE/STTYPE to MemOp flag */
> +#define MFLAG_b MO_UB
> +#define MFLAG_w MO_TEUW
> +#define MFLAG_l MO_TEUL
> +
> +#define MSIZE(t)  MSIZE_##t

AFAICS, this isn't used.

> +#define MFLAG(t)  MFLAG_##t
> +
> +#define SIGN_EXT(v, T, B) { \
> +    ((T)(v) << (sizeof(T) * 8 - (B))) >> (sizeof(T) * 8 - (B)) }

Don't do this.  (1) Not all of these operations require sign extension, (2) it's clearer 
to simply cast to an appropriate MTYPE.

r~

> +
>   /* For loads, predicated lanes are zeroed instead of keeping their old values */
>   #define DO_VLDR(OP, MSIZE, LDTYPE, ESIZE, TYPE)                         \
>       void HELPER(mve_##OP)(CPUARMState *env, void *vd, uint32_t addr)    \
> @@ -155,6 +171,8 @@ static void mve_advance_vpt(CPUARMState *env)
>           uint16_t mask = mve_element_mask(env);                          \
>           uint16_t eci_mask = mve_eci_mask(env);                          \
>           unsigned b, e;                                                  \
> +        int mmu_idx = arm_to_core_mmu_idx(arm_mmu_idx(env));            \
> +        MemOpIdx oi = make_memop_idx(MFLAG(LDTYPE) | MO_ALIGN, mmu_idx);\
>           /*                                                              \
>            * R_SXTM allows the dest reg to become UNKNOWN for abandoned   \
>            * beats so we don't care if we update part of the dest and     \
> @@ -163,7 +181,10 @@ static void mve_advance_vpt(CPUARMState *env)
>           for (b = 0, e = 0; b < 16; b += ESIZE, e++) {                   \
>               if (eci_mask & (1 << b)) {                                  \
>                   d[H##ESIZE(e)] = (mask & (1 << b)) ?                    \
> -                    cpu_##LDTYPE##_data_ra(env, addr, GETPC()) : 0;     \
> +                    SIGN_EXT(cpu_ld##LDTYPE##_mmu(env, addr, oi, GETPC()),\
> +                             TYPE,                                      \
> +                             MSIZE * 8)                                 \
> +                    : 0;                                                \
>               }                                                           \
>               addr += MSIZE;                                              \
>           }                                                               \
> @@ -185,20 +206,20 @@ static void mve_advance_vpt(CPUARMState *env)
>           mve_advance_vpt(env);                                           \
>       }
>   
> -DO_VLDR(vldrb, 1, ldub, 1, uint8_t)
> -DO_VLDR(vldrh, 2, lduw, 2, uint16_t)
> -DO_VLDR(vldrw, 4, ldl, 4, uint32_t)
> +DO_VLDR(vldrb, 1, b, 1, uint8_t)
> +DO_VLDR(vldrh, 2, w, 2, uint16_t)
> +DO_VLDR(vldrw, 4, l, 4, uint32_t)
>   
>   DO_VSTR(vstrb, 1, stb, 1, uint8_t)
>   DO_VSTR(vstrh, 2, stw, 2, uint16_t)
>   DO_VSTR(vstrw, 4, stl, 4, uint32_t)
>   
> -DO_VLDR(vldrb_sh, 1, ldsb, 2, int16_t)
> -DO_VLDR(vldrb_sw, 1, ldsb, 4, int32_t)
> -DO_VLDR(vldrb_uh, 1, ldub, 2, uint16_t)
> -DO_VLDR(vldrb_uw, 1, ldub, 4, uint32_t)
> -DO_VLDR(vldrh_sw, 2, ldsw, 4, int32_t)
> -DO_VLDR(vldrh_uw, 2, lduw, 4, uint32_t)
> +DO_VLDR(vldrb_sh, 1, b, 2, int16_t)
> +DO_VLDR(vldrb_sw, 1, b, 4, int32_t)
> +DO_VLDR(vldrb_uh, 1, b, 2, uint16_t)
> +DO_VLDR(vldrb_uw, 1, b, 4, uint32_t)
> +DO_VLDR(vldrh_sw, 2, w, 4, int32_t)
> +DO_VLDR(vldrh_uw, 2, w, 4, uint32_t)
>   
>   DO_VSTR(vstrb_h, 1, stb, 2, int16_t)
>   DO_VSTR(vstrb_w, 1, stb, 4, int32_t)

