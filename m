Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp284613ejq;
        Fri, 5 May 2023 02:29:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4KCpCw8bW/cGm+B+ZzIoDsEh8OLQNpCGDBAo6PwGgpq6CFMq0UhC0+jqZ3xiU2Pd8H1LCV
X-Received: by 2002:a05:622a:105:b0:3ef:2f92:464d with SMTP id u5-20020a05622a010500b003ef2f92464dmr1233648qtw.28.1683278963901;
        Fri, 05 May 2023 02:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683278963; cv=none;
        d=google.com; s=arc-20160816;
        b=wJGYO6A5mxpyQDms2ig0R1jg5Hx095rYRH1yklcKV4ckQq3jvUmwexIVMiY0FMgSQF
         lO4qwGz3vIwvBoL8h8gGEmd0nqmNTU6AExdzZICDibFuWO55BEfx+pi+sJv0LS7gXOZl
         hKQ6fBXHatdHItYPUDRcbtGHxOOcvybnxM8NvpotpiL7yQylmcINOPCbqh2ZQlHc50qe
         YaoaO2+a2KEBZcFMJ1/Ejpn9grCZJ0qxpUFrUvJbOqcYSnzdQgiwKe6DrVfBzl8Iauf9
         gEH6gLMwNU4DwOlB8um7Z458c7UFmaBQOdnhAy9noBxalz7fisElt5DMef0GzPNgQSa7
         2w6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/qr0u344BdwIFPa4ftATtrgTevlZCM3vdy0U5ev0PUY=;
        b=vqTMbmNCKcEaHeN92Se73fetwKI0UDPWSwLqBe5YBXbe8GUe/tJ5ksdBF0YlmtAjn+
         5q5mg+lDuSc7h1hwVuVDTxZg/SD+2Cans9DUy+BjbCwG8qG9AHm8A7RC18yGoNK6lY47
         dvKqTRDYwBjZgRVo7HQnmMqcUvUdrVn0jdS3/lxS0f9JmRbw3SUvW9N4vNP19DqVy+VZ
         FfRaooqE/YO81y5HKWSb6jzvAKT8KDSDR1Y+tk6O8hmkm2enEWBFbmgoP6fJLTzxQZ5E
         Xj6mKXm1tu5SHD0beiKJgPjtJ+jNFoxxX6Sodzn4FhNRDyWxB4Kwy2vi664lrPASpcpL
         y7yA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vG5AeZXY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f20-20020ae9ea14000000b0074e4ab18191si482405qkg.732.2023.05.05.02.29.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 02:29:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vG5AeZXY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1purk6-00069q-9q; Fri, 05 May 2023 05:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1purk5-00067b-ES
 for qemu-arm@nongnu.org; Fri, 05 May 2023 05:28:45 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1purk3-0007T2-Pz
 for qemu-arm@nongnu.org; Fri, 05 May 2023 05:28:45 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-50b37f3e664so2622151a12.1
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 02:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683278920; x=1685870920;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/qr0u344BdwIFPa4ftATtrgTevlZCM3vdy0U5ev0PUY=;
 b=vG5AeZXY1t21vSZle0v+DGZBb06m36i1h49nszAnwZxxP38opXAlqFys8xjc7Iy9Ix
 wHDjmr+a15lB2xXJm98Iy9veqsFag2Y04wtHA35SLr0nj42fkaPkGocc+KmG4+TE73a+
 b6buAR+SoOny7ph1wzaa58bQi3Wf8jxhzUDuTOwIyQvjqQgZOsrHHAQWvua/Cv9OBzo3
 T+Wu5izd5i1IvNVmgzMkcL9o7o/rZ/w92IJ14C6SLWyjHoCZPnjXFr0/txj7tpLApiO2
 9Z3fHS0jOEyphrrEoV72N0/1k2/in4BZFGDKrl6wyb8Vv/vnuNlvB+GOVKbz78CFwL97
 xQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683278920; x=1685870920;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/qr0u344BdwIFPa4ftATtrgTevlZCM3vdy0U5ev0PUY=;
 b=c7NgDpIHvvgX4Zm0PQLrLD7E2zEaBPzieZM93suBCIahkGs0RI1H45lMiOfEy1n89P
 RQzcrOcu6u0DZ5kjL6+HSXzF6CVAn7njZB6nC+0YXE5+FfvsJk+YeL8ZG8MF/sCdvNco
 SpjSEySOU379jpaHwKjFvTU5IfISkcs/IyQEGCfR3wSkzOP7lETVZdHSrfzsX5PXb6sX
 KR1kRoQaU+0ty1AtsTpXzBSC+1l5hE0YjR8TiAv4oBhUTv+kM4gx1RqXHumQ02toB4Q+
 5Cdh8Lz3mzbF4XA9aEnpYRGtXgGKZOetO1HOZjWzkcSs6SLdG8y2QvsYVsPL8Pcc5b7I
 aOZg==
X-Gm-Message-State: AC+VfDxK6v1zSJMf/yEcFg/LapSa/mnqjxj9AdaQXlH3+1mAu79O3cam
 Qr2LHOVlJ0fZh8kM8cxM5t4glOSumNgCd0F6HOm1zg==
X-Received: by 2002:a05:6402:1347:b0:509:c669:1e93 with SMTP id
 y7-20020a056402134700b00509c6691e93mr768648edw.23.1683278920472; Fri, 05 May
 2023 02:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-8-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 10:28:29 +0100
Message-ID: <CAFEAcA8aqJXGcFSTU1dz6bSeJL5n+cmHq3ATt4xZGZsehJk6Tg@mail.gmail.com>
Subject: Re: [PATCH v4 07/57] accel/tcg: Honor atomicity of stores
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ToQXts4e3ozU

On Wed, 3 May 2023 at 08:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cputlb.c             | 103 +++----
>  accel/tcg/user-exec.c          |  12 +-
>  accel/tcg/ldst_atomicity.c.inc | 491 +++++++++++++++++++++++++++++++++
>  3 files changed, 540 insertions(+), 66 deletions(-)


> +/**
> + * store_atom_insert_al16:
> + * @p: host address
> + * @val: shifted value to store
> + * @msk: mask for value to store
> + *
> + * Atomically store @val to @p masked by @msk.
> + */
> +static void store_atom_insert_al16(Int128 *ps, Int128Alias val, Int128Alias msk)
> +{
> +#if defined(CONFIG_ATOMIC128)
> +    __uint128_t *pu, old, new;
> +
> +    /* With CONFIG_ATOMIC128, we can avoid the memory barriers. */
> +    pu = __builtin_assume_aligned(ps, 16);
> +    old = *pu;
> +    do {
> +        new = (old & ~msk.u) | val.u;
> +    } while (!__atomic_compare_exchange_n(pu, &old, new, true,
> +                                          __ATOMIC_RELAXED, __ATOMIC_RELAXED));
> +#elif defined(CONFIG_CMPXCHG128)
> +    __uint128_t *pu, old, new;
> +
> +    /*
> +     * Without CONFIG_ATOMIC128, __atomic_compare_exchange_n will always
> +     * defer to libatomic, so we must use __sync_val_compare_and_swap_16
> +     * and accept the sequential consistency that comes with it.
> +     */
> +    pu = __builtin_assume_aligned(ps, 16);
> +    do {
> +        old = *pu;
> +        new = (old & ~msk.u) | val.u;
> +    } while (!__sync_bool_compare_and_swap_16(pu, old, new));

Comment says "__sync_val..." but code says "__sync_bool...". Which is right?


> +#else
> +    qemu_build_not_reached();
> +#endif
> +}

-- PMM
