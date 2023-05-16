Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp412681ejq;
        Tue, 16 May 2023 06:29:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6BUgiT/jL0f9Rf0z8If+xWzDT7imf3aLK1B1OobJC1fgpwBEZwofNuKkcbBtwYxNUzFFZJ
X-Received: by 2002:ac8:5992:0:b0:3ef:3510:7c40 with SMTP id e18-20020ac85992000000b003ef35107c40mr60929094qte.65.1684243788504;
        Tue, 16 May 2023 06:29:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684243788; cv=none;
        d=google.com; s=arc-20160816;
        b=KvCOOjuSVdGKkvoMr70hO1PMLg1DDW7E+V1Fhe3gLNG6nEHy6x3ZeP/OlZQamF3fyK
         lW6xlw1Ru62BRRm/oY1eRxUCRLinxFHSrcwKi0eRBxYuVI95xJ0VoI2cdWuIhW9PFzt+
         qFaQnrorkrDqtyYRPpafBXXajNLvm8mCRtwsviK1BbSnvS8Xk6ZirVyD/5VMsLE8NoTx
         F03uG8UyLi16a2R9eI2/I4ggfEsUiTnNMCYbJvW1iQeeIoZGEgeKskitSKzwYoprIXeD
         BgZxsWWK1OrB3gO1zvou4hXPgu4uDQOFUNYqstFBVjz50FkQtl143GRUedLANpNosE4M
         w7YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=6jDGNi/49YCbROVvTGVyKiWZWjMOZXaLv/Mdytbr25U=;
        b=XedFoKYq0wV8GfJ9N/ZTkDQV9aSoV6/6Z7XxX71k1+F7efPLoyAh47yAaaRUqBHfkF
         gYvFbG6SbfzHlUCl1Bp0UeH1wDZOTKekI87Y30Uzs7Jvo05nr5poDCdVugVEgbeqIFgo
         5U3jV0q4XDhE1YXwxMhDIwMQrZ1WXPMPYI/DQQ9SC7GZHS2QShwZHfalsUO+GUJZ7l2F
         dX9YCQNfJQW/pv/rF2lF+4ET7vtwjnRbHAYot+dkHdY4s7vIqpb0RBMHkygF4I9HzKe7
         sz7cfA4zcsYF7Mr8CO5ThcbiXsA3jTgsNQL9jjs3QSqtPB0FRodVqpPpiOXt3RFKq1eC
         be4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hXs26r6b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l19-20020a05622a051300b003ef496edb52si10900119qtx.87.2023.05.16.06.29.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 May 2023 06:29:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hXs26r6b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyujv-0001n6-SV; Tue, 16 May 2023 09:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyuju-0001mZ-Eh
 for qemu-devel@nongnu.org; Tue, 16 May 2023 09:29:18 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyujr-0007nd-Sz
 for qemu-devel@nongnu.org; Tue, 16 May 2023 09:29:18 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-50bc070c557so26074300a12.0
 for <qemu-devel@nongnu.org>; Tue, 16 May 2023 06:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684243754; x=1686835754;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6jDGNi/49YCbROVvTGVyKiWZWjMOZXaLv/Mdytbr25U=;
 b=hXs26r6bBOtT5lRGZmAJxgSCE27cLF9i5nR4uarWDS46p12EUb2JtBVLHYf6D2svv9
 qI9GOE5BMIn3gQYtLFqU0tLm+p5qk2LqxCAph6HX/QYMQ/AXz2H83eaxO+rB0wkQ2Bym
 a3tKVkcYE7GbrZAQuxRslMLD8WzST39iq8lR+WrkSNjvuN/iRM01kAvH3d0IiiQA7FE7
 WKKWOHaZTplsofX54mtp4SWwuJ7oxc2wSHSOX22iSIB30m6wPuoBio/bNcmJqbbQBHAV
 xfWhPqLONQbi/huSpxjyTZ5VPblZzmb4jbnO4wFIc0Z4U4zaf7Q3OLFZTZdR1GFl3as7
 W7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684243754; x=1686835754;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6jDGNi/49YCbROVvTGVyKiWZWjMOZXaLv/Mdytbr25U=;
 b=g7qBdAb+4vyPAtN5LY6V3d/+FrMZIT0KvNjbELvXNZdqvDyDuhA40W1aPo0GxlIG0F
 SBLrIVSX22SSau0EkNky3Dl4Kq0Nt6pPqw7HGfd9HH4vVot61jan2iHXLvJzEuq0SCkQ
 /BR+avdXqmmJQQJoWY/n4PllHAxY+L9uQ61PaFH7SsoHn3bB2IeGQiY5NIaxyuuSw8ZJ
 owux4sqTe2rQt4+WiK2hkmM1vdEQlS8Qq8CKt75AOFVYWM87iNUZUp9bX77olqMf/PhT
 PTanAAkLEKfUrQpdZVnivGEbmkUZJlypFjqyS0ItBkzA1iHV6brNWGaPh3kLjbX6kfZ0
 GETA==
X-Gm-Message-State: AC+VfDwm8r71YDrZu+jbhWUuW7rf/BmVOpNGUX3zSUowWeBoZUKUpCG/
 8v/IGQroWqESPsSGj0/hT65oFQIdby/5kbdPcN9xDg==
X-Received: by 2002:aa7:ca58:0:b0:50b:c1d6:8d60 with SMTP id
 j24-20020aa7ca58000000b0050bc1d68d60mr31578369edt.21.1684243754348; Tue, 16
 May 2023 06:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230515143313.734053-1-richard.henderson@linaro.org>
 <20230515143313.734053-12-richard.henderson@linaro.org>
In-Reply-To: <20230515143313.734053-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 May 2023 14:29:03 +0100
Message-ID: <CAFEAcA-En1=iy_M7o0Ky+5ZwOJ4TWxoNz7Yq27ftYgnbV9j8OA@mail.gmail.com>
Subject: Re: [PATCH v5 11/54] accel/tcg: Add aarch64 specific support in
 ldst_atomicity
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
X-TUID: vKrf+KTQwrhd

On Mon, 15 May 2023 at 15:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We have code in atomic128.h noting that through GCC 8, there
> was no support for atomic operations on __uint128.  This has
> been fixed in GCC 10.  But we can still improve over any
> basic compare-and-swap loop using the ldxp/stxp instructions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/ldst_atomicity.c.inc | 60 ++++++++++++++++++++++++++++++++--
>  1 file changed, 57 insertions(+), 3 deletions(-)
>
> diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
> index 69c1c61997..c3b2b35823 100644
> --- a/accel/tcg/ldst_atomicity.c.inc
> +++ b/accel/tcg/ldst_atomicity.c.inc
> @@ -263,7 +263,22 @@ static Int128 load_atomic16_or_exit(CPUArchState *env, uintptr_t ra, void *pv)
>       * In system mode all guest pages are writable, and for user-only
>       * we have just checked writability.  Try cmpxchg.
>       */
> -#if defined(CONFIG_CMPXCHG128)
> +#if defined(__aarch64__)
> +    /* We can do better than cmpxchg for AArch64.  */
> +    {
> +        uint64_t l, h;
> +        uint32_t fail;
> +
> +        /* The load must be paired with the store to guarantee not tearing. */
> +        asm("0: ldxp %0, %1, %3\n\t"
> +            "stxp %w2, %0, %1, %3\n\t"
> +            "cbnz %w2, 0b"
> +            : "=&r"(l), "=&r"(h), "=&r"(fail) : "Q"(*p));
> +
> +        qemu_build_assert(!HOST_BIG_ENDIAN);
> +        return int128_make128(l, h);
> +    }

The compiler (well, clang 11, anyway) seems able to generate equivalent
code to this inline asm:
https://godbolt.org/z/eraeTn4vs

__int128 do_load2(void *pv) {
    __int128 *p = __builtin_assume_aligned(pv, 16);
    __int128 i = __atomic_load_n(p, __ATOMIC_RELAXED);
    return i;
}

generates

do_load2:                               // @do_load2
        mov     x8, x0
.LBB0_1:                                // =>This Inner Loop Header: Depth=1
        ldxp    x0, x1, [x8]
        stxp    w9, x0, x1, [x8]
        cbnz    w9, .LBB0_1
        ret

thanks
-- PMM
