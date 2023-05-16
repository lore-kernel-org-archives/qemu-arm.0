Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp315244ejq;
        Tue, 16 May 2023 03:38:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4cEnISORK/rTWXZSIqYHaZKXaLK6g3hm5etk0GvTHQlwet574VwaLES9g/avpXRWaWkMfK
X-Received: by 2002:ac8:5acd:0:b0:3f5:26c2:cf32 with SMTP id d13-20020ac85acd000000b003f526c2cf32mr11066163qtd.14.1684233531532;
        Tue, 16 May 2023 03:38:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684233531; cv=none;
        d=google.com; s=arc-20160816;
        b=FMDgbYfCCOOt4le6aa6yooAJ+ZmEpKTl4mkEk07nJYOc4b9BFHF2nrwIHhHclfDgnN
         9wv9TXxirgJq5d+kkL0ETB0qmVsJ0nIsgOeD7M2q17Jz4p1T+bt78+ah1Sj/NzI9AVua
         mYBQ8N6Sv24fQJWMeRobKbA83tCexihthXh/spX4iCJhZEEo/VIfDKSjxDTIXTN0IOyc
         /XbvHQOev4uUo6my3QSDQw9fFqLhB1QeEtiiHixeBEnX867Nts6w5t6hwZ8GYjcqUptW
         dYO5ObXQaIhyS8q/lnLs7qW9pVb65OzzTzuZurmx0uoYnaHTnsRUgfVLUIVaIBpyIZa0
         2nKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=MA77nGVbeznvJo3CFRKaUeMAlOrz/uJ33UG0RZGl2ig=;
        b=qVl6Df1jbx8aUeQuSuQJUGHe0vGFgnpDyjyrUNZkTlHcsRrAwAMgMJoVjoULIbefAd
         Vbye8QFQzqN6trwOVf9ObkhYs09SbsbyVNIFl7LV5BvX0zeVl8KDaa2ZyXCexYwUJIZp
         hnAkaXVZWNs3v4Wi2dLYKh7hLfBiKqqtgmSCuRkusylzgE6sMRGITKnc5crQIJqs1/et
         BvRbe8uNcK4z6Jv5cbXx9UVbas18d0N/8YYnnm7Yet2nhEcCgUg7jPI/6niW1bOZ7Mfz
         xdPi13pjDr7kIegFeOwmpeU/kklEoAXt68u2Ahm1mtDSh5VzSPya6m2U7KAG9n3bHdys
         thEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sIu1bo0G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c1-20020a05620a200100b0074df9f3ac98si974691qka.351.2023.05.16.03.38.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 May 2023 03:38:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sIu1bo0G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pys4c-000152-KX; Tue, 16 May 2023 06:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pys4b-00014T-L3
 for qemu-arm@nongnu.org; Tue, 16 May 2023 06:38:29 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pys4a-0003iM-28
 for qemu-arm@nongnu.org; Tue, 16 May 2023 06:38:29 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-969f90d71d4so1414025966b.3
 for <qemu-arm@nongnu.org>; Tue, 16 May 2023 03:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684233506; x=1686825506;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MA77nGVbeznvJo3CFRKaUeMAlOrz/uJ33UG0RZGl2ig=;
 b=sIu1bo0Gx+eVlYvkVHEe8fI8/lDDkf503dFZ7Fq+2+z6EvLj5K7zek3gWx9zfASxYm
 uRK79C2LWl/3vnyMtThFN+Toj8n/icUg31CD+oO/I5qLORMpKE0LpyoSMx+3pNF+UZ/z
 vUB1yAaaOjVJuLzeYvzFFD1ySIc1S+nPPiX3AX5jIPy7QYdeMRxMI8/6LeC5qnStIgvL
 lMszTVIhgPE8sBJjr+5GDONZSCRVdEqNAMKBr9wiV7gWvSxVAm7nTCS1LphRVQmVYTM+
 fSGSenEmxTR9A7aYHvfNn/YIUaJsjhWk9r1jiWxpRHwPUso4szpd6+acOqXMO/tY3xOF
 MQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684233506; x=1686825506;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MA77nGVbeznvJo3CFRKaUeMAlOrz/uJ33UG0RZGl2ig=;
 b=U1N1QOobHKEjTwXqopk21et3Xx4AyNZkoqJXI+/X1KUKmlOwa86tnlticcp0+7SDSI
 H8S8nAjK84Mzzgs1zjPdSfv/bnbdx3Z0wt7ByMO2mi1XvhQ4ZTqiiUQ6SlIu4ezFiX8e
 rZdyS4yStIxn6eyMqFONaxURfpSXmCYvYAd1AfPlPxmOHiDSYlCubC/Wact13iW3eWj5
 D6nH0YoLWq4lfnrxkgTNUbK2sX9US9ZiUr3RmQi2admfJ++QOX1fQCkwFehRn/9KopZJ
 Cawsd9gcrm/bwmaR5l+lb0SBbTBDuHiNKoZLtxAS4n6rJvH1wtc1I5q98q2n69K0g3x3
 teUg==
X-Gm-Message-State: AC+VfDyHWrzbCfLUZwbFQPnvhfKIFvIDeUBno6+LTmQxq81Zg04sudbJ
 ZN9K7U3mIq99r0LkBP+hO12HVc3jZYwPMDpFcXzekw==
X-Received: by 2002:a17:907:9703:b0:966:265d:edc9 with SMTP id
 jg3-20020a170907970300b00966265dedc9mr31701470ejc.74.1684233506244; Tue, 16
 May 2023 03:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230515143313.734053-1-richard.henderson@linaro.org>
 <20230515143313.734053-11-richard.henderson@linaro.org>
In-Reply-To: <20230515143313.734053-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 May 2023 11:38:15 +0100
Message-ID: <CAFEAcA_6jHw5kvqZNNR+2c_ihdPgD9d1ByBH0fNvDr6tX88jyA@mail.gmail.com>
Subject: Re: [PATCH v5 10/54] accel/tcg: Use have_atomic16 in
 ldst_atomicity.c.inc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: CH/ecKGA5LDq

On Mon, 15 May 2023 at 15:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Hosts using Intel and AMD AVX cpus are quite common.
> Add fast paths through ldst_atomicity using this.
>
> Only enable with CONFIG_INT128; some older clang versions do not
> support __int128_t, and the inline assembly won't work on structures.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/ldst_atomicity.c.inc | 76 +++++++++++++++++++++++++++-------
>  1 file changed, 60 insertions(+), 16 deletions(-)
>
> diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
> index dd387c9bdd..69c1c61997 100644
> --- a/accel/tcg/ldst_atomicity.c.inc
> +++ b/accel/tcg/ldst_atomicity.c.inc
> @@ -35,6 +35,14 @@
>
>  #if defined(CONFIG_ATOMIC128)
>  # define HAVE_al16_fast    true
> +#elif defined(CONFIG_TCG_INTERPRETER)
> +/*
> + * FIXME: host specific detection for this is in tcg/$host/,
> + * but we're using tcg/tci/ instead.
> + */
> +# define HAVE_al16_fast    false
> +#elif defined(__x86_64__) && defined(CONFIG_INT128)
> +# define HAVE_al16_fast    likely(have_atomic16)
>  #else
>  # define HAVE_al16_fast    false
>  #endif
> @@ -178,6 +186,12 @@ load_atomic16(void *pv)
>
>      r.u = qatomic_read__nocheck(p);
>      return r.s;
> +#elif defined(__x86_64__) && defined(CONFIG_INT128)
> +    Int128Alias r;
> +
> +    /* Via HAVE_al16_fast, have_atomic16 is true. */
> +    asm("vmovdqa %1, %0" : "=x" (r.u) : "m" (*(Int128 *)pv));
> +    return r.s;

This is a compile-time check, so why if we can do
16-byte atomic loads would CONFIG_ATOMIC128 not be set?

>  #else
>      qemu_build_not_reached();
>  #endif
> @@ -399,6 +413,24 @@ load_atom_extract_al16_or_al8(void *pv, int s)
>          r = qatomic_read__nocheck(p16);
>      }
>      return r >> shr;
> +#elif defined(__x86_64__) && defined(CONFIG_INT128)
> +    uintptr_t pi = (uintptr_t)pv;
> +    int shr = (pi & 7) * 8;
> +    uint64_t a, b;
> +
> +    /* Via HAVE_al16_fast, have_atomic16 is true. */
> +    pv = (void *)(pi & ~7);
> +    if (pi & 8) {
> +        uint64_t *p8 = __builtin_assume_aligned(pv, 16, 8);
> +        a = qatomic_read__nocheck(p8);
> +        b = qatomic_read__nocheck(p8 + 1);
> +    } else {
> +        asm("vmovdqa %2, %0\n\tvpextrq $1, %0, %1"
> +            : "=x"(a), "=r"(b) : "m" (*(__uint128_t *)pv));
> +    }
> +    asm("shrd %b2, %1, %0" : "+r"(a) : "r"(b), "c"(shr));
> +
> +    return a;

Similarly this seems to just be an asm version of
the CONFIG_ATOMIC128 code.

thanks
-- PMM
