Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp301737ejq;
        Fri, 5 May 2023 03:05:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ53zi4BCNiHTgTFubb3IPpQhCz2rVBdlxHinnbiZHHrAOvc+6Pv/D+g7qIb87siYY0qriGX
X-Received: by 2002:a05:6214:76a:b0:5cc:277c:b4e with SMTP id f10-20020a056214076a00b005cc277c0b4emr1059661qvz.39.1683281107439;
        Fri, 05 May 2023 03:05:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683281107; cv=none;
        d=google.com; s=arc-20160816;
        b=EJNyvdAf8J5PqN7G033Pwf/RNl7SQq8nDjKVD+0T6E9/auQdDZpEXHhnizkTRMSkc9
         S01/lmlI38fJ07SIRSX22+NjzTPwWCK5PZDWCPYc5q32OKOtzXDArxkXTftrGX8JOHBS
         ZpxQ4oTMwDZ7T/+jO+RezwXWFbvmxQ4pY3Xzrs8Fg+t5ma46+8ae1K37ZU7QljV5UUcm
         2bSHJdVrrt4vkJbvmBRq2iJIbBxhrmao0x6ImN3RR0e8/IkXp4EPErjFG7QADbmNYR6g
         6aNIN0zkPlMqgve+vQLlA8YoupXQVfQ2AZWNKbMdD/PyIQYgV7bGIH/6L8kvxkT58UXo
         v9vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=n/n2EIcI4moXmMiPBfU/H5CtT1+XVdcDwK249IVE7Tg=;
        b=ui3ApXKfp22Fq9GPHFmQkz3PHd2JOSYC4Ay6ID8GL97Ww0YN6AFqnJbA8hFnI7s4Jk
         xeBUSxZe7CjW+Sj+2emfx0yWIQJXBjrHef5iKCpjg26PLvMlGVsiZbJqt9JNZ+TC1430
         j3M12EGtZvos3/wVy4BMozSo6BQ7PsnVo2o4/v2rqBAPdG9nq0ZhHt0zyYTi0JWMo1Ob
         qGOO1OckuTshiMwR2VPM6ILOe5aEgbi5L7bka8972m73wTR5U5q+ZkAZyA/J1LSui8Zt
         TZdCtIwcJsGfS65fy3xye8ScYze6B2ayMfXQ8ITTMiOFy25s3Fho4Tf+YPpxsoPlZLvF
         2reQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NMpn1YsX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eq9-20020ad45969000000b0056eb226900bsi499351qvb.103.2023.05.05.03.05.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 03:05:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NMpn1YsX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pusJ5-0002t2-EJ; Fri, 05 May 2023 06:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pusJ4-0002ss-Hy
 for qemu-arm@nongnu.org; Fri, 05 May 2023 06:04:54 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pusJ2-0003aA-Uu
 for qemu-arm@nongnu.org; Fri, 05 May 2023 06:04:54 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-50bc0ced1d9so2336536a12.0
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 03:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683281090; x=1685873090;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n/n2EIcI4moXmMiPBfU/H5CtT1+XVdcDwK249IVE7Tg=;
 b=NMpn1YsXuYQepR1ccUKYVBB86NWFlQyeWGbIHUZZ6GX5RnlPgOcokPRyc1We5St0Iv
 7vju6eDccJZp/jeeP18vzFQUv3QMiW/dkmF27Zd3eV3LxO2/u1xbcE3SqKNt3Zs0E79H
 RRwhtAdHLAmFtqQ6J06DmsfgLQu6SeS4AQv7nK+BnhOFv0h6L6v/QOb7QyJmBh63xOEZ
 aRbHMn/zEc7obYAPE1T7jpg/b5n/9MFBkObbvSQ8hd9At1QT/oAToKeiE7PK/+pTJZ91
 yUtrhlkoIEAQNp51kmXiueLv8PkUxxa3MTe6qYbmroteJRh+mlA6fmQhvbL981tqBCiO
 VaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683281090; x=1685873090;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n/n2EIcI4moXmMiPBfU/H5CtT1+XVdcDwK249IVE7Tg=;
 b=V3lZTD77Zm87/O1sewUHePzRjgGMtRtIjkVL+yH5OfbL0AwyjLqocbunqTdfndSrxd
 JRcOQSydFr/pLacYidu7b076N0wXvPLADWlfYsQRSN0sur6kTdPk7cnMwvg9oe9+8rHD
 xeDkkafQ+U6+80MhVt/LrzUlp6yMwEyLP2YCxKOEQ8C622rDh65BBT7aKB4agQ7bG1bF
 9bL21W5rnj5TF/E4Pza/2QN5wAFwD9ZHhrS/VeZvvxCVJTivGQyY5w5OK20fFQNLGhL8
 Fo0jRF3+v4nmoR7C1TIDtIgTBuAa+hJCkApH5UxFAN+SnkJ1M6FT5JcVOtm1ukjdb/4H
 zz3g==
X-Gm-Message-State: AC+VfDxkOz6oc/rDazMOTJRGlKEWSghQQIIkd1cV+b/+FArUzcBp+WYu
 z558tZgLA7aDTTb1sj9Ge9Bj2Tq2shUXPm5hMQxoIw==
X-Received: by 2002:aa7:d954:0:b0:50b:c164:526c with SMTP id
 l20-20020aa7d954000000b0050bc164526cmr923698eds.13.1683281090132; Fri, 05 May
 2023 03:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-13-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 11:04:39 +0100
Message-ID: <CAFEAcA9oMYYC1FYwqLgHxx5HdxJ4u-h-5f1mfiAF1606JMkAXw@mail.gmail.com>
Subject: Re: [PATCH v4 12/57] tcg: Add 128-bit guest memory primitives
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: kf+KYZUDFeIa

On Wed, 3 May 2023 at 08:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---



> +/**
> + * load_atom_16:
> + * @p: host address
> + * @memop: the full memory op
> + *
> + * Load 16 bytes from @p, honoring the atomicity of @memop.
> + */
> +static Int128 load_atom_16(CPUArchState *env, uintptr_t ra,
> +                           void *pv, MemOp memop)
> +{
> +    uintptr_t pi = (uintptr_t)pv;
> +    int atmax;
> +    Int128 r;
> +    uint64_t a, b;
> +
> +    /*
> +     * If the host does not support 8-byte atomics, wait until we have
> +     * examined the atomicity parameters below.
> +     */
> +    if (HAVE_al16_fast && likely((pi & 15) == 0)) {
> +        return load_atomic16(pv);
> +    }

Comment says "8-byte atomics" but code is testing for
existence of 16-byte atomics ?

> +
> +    atmax = required_atomicity(env, pi, memop);
> +    switch (atmax) {
> +    case MO_8:
> +        memcpy(&r, pv, 16);
> +        return r;
> +    case MO_16:
> +        a = load_atom_8_by_2(pv);
> +        b = load_atom_8_by_2(pv + 8);
> +        break;
> +    case MO_32:
> +        a = load_atom_8_by_4(pv);
> +        b = load_atom_8_by_4(pv + 8);
> +        break;
> +    case MO_64:
> +        if (!HAVE_al8) {
> +            cpu_loop_exit_atomic(env_cpu(env), ra);
> +        }
> +        a = load_atomic8(pv);
> +        b = load_atomic8(pv + 8);
> +        break;
> +    case -MO_64:
> +        if (!HAVE_al8) {
> +            cpu_loop_exit_atomic(env_cpu(env), ra);
> +        }
> +        a = load_atom_extract_al8x2(pv);
> +        b = load_atom_extract_al8x2(pv + 8);
> +        break;
> +    case MO_128:
> +        return load_atomic16_or_exit(env, ra, pv);
> +    default:
> +        g_assert_not_reached();
> +    }
> +    return int128_make128(HOST_BIG_ENDIAN ? b : a, HOST_BIG_ENDIAN ? a : b);
> + }

> +/**
> + * store_atomic16:
> + * @pv: host address
> + * @val: value to store
> + *
> + * Atomically store 16 aligned bytes to @pv.
> + */
> +static inline void store_atomic16(void *pv, Int128 val)
> +{
> +#if defined(CONFIG_ATOMIC128)
> +    __uint128_t *pu = __builtin_assume_aligned(pv, 16);
> +    Int128Alias new;
> +
> +    new.s = val;
> +    qatomic_set__nocheck(pu, new.u);
> +#elif defined(CONFIG_CMPXCHG128)
> +    __uint128_t *pu = __builtin_assume_aligned(pv, 16);
> +    __uint128_t o;
> +    Int128Alias n;
> +
> +    /*
> +     * Without CONFIG_ATOMIC128, __atomic_compare_exchange_n will always
> +     * defer to libatomic, so we must use __sync_val_compare_and_swap_16
> +     * and accept the sequential consistency that comes with it.
> +     */
> +    n.s = val;
> +    do {
> +        o = *pu;
> +    } while (!__sync_bool_compare_and_swap_16(pu, o, n.u));

Same val vs bool thing as the other patch.


Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
