Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp315223ejq;
        Fri, 5 May 2023 03:30:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5T1aul3nJgSD87aT4mAaJBku7QCxv1Ys7ZXkflkyYRd8JgFXCsvXILXJmqq9S1e+/iRTeW
X-Received: by 2002:ac8:5754:0:b0:3e3:7dc9:b85a with SMTP id 20-20020ac85754000000b003e37dc9b85amr1716966qtx.59.1683282629702;
        Fri, 05 May 2023 03:30:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683282629; cv=none;
        d=google.com; s=arc-20160816;
        b=Ske7el1YDQGdd9nZCr+OThyFBUENFZGMYGY2lfE5u5Qe7t7sRcnKbgNhZQAkqjvufK
         GYTDv5c2mQi9u5jFP7qiViI6ZOuRPxadRvxpMnDDTZXFw7CBLc8qMBlLFMTbgEqt18Tb
         8bwL1+0RpGAXtJQZl5TLUekmT2Bk2ZJ5F5gonXDQ5FTQX46rl2S/QIRo8yD/9kt/aeO/
         Xac66DkQdsh9wk3scu0XPQiCiwZNGZkM9Ke5OOpMhq6TbquflrLDApoWqxPwjDFMqhGp
         z4mQwYhFHP2KqDD/6vXYmJfGQPuZd2gfKTQ04+K/jtV++CVzvW18GrhWqAUkfbUiB3Xo
         tCRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=hnqTNG8MzOKBvFmVPeaf8tellhPa1mMajzbAEt/ud+Q=;
        b=GYREhqgiebs8iuHDUSBB84qGJbBsNnUnOgrcYHTzpcQzerMYett6vIuIjuQhaHyAfX
         J0dvcFBxDGQPymqg3iajknlXXGJ5Zatp74Y/WXUmCqW8o5Cal2IuuKW/CF7s/HhNqZPF
         9KlgNVWWlYO0iDatEhZrs3qkKUVp/wh5Nh3mONcpyLqlX1rLwsNBQOeXF6boA9jYqLhs
         s/rdJSS2txms/ikj+zJvnMzAo6XoIF6qCoGH+abB3QvfNNGb4J1z3WutnHOfSCtFvew7
         pXcoJ4J//KZAKsg0EyACdbFq7+rSkZJLPlX/QPW78v0VzzS7NWpy+zp6Jt/DglvOJWqI
         FeTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bLmzlWrt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j15-20020a05622a038f00b003e8846087b6si463037qtx.367.2023.05.05.03.30.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 03:30:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bLmzlWrt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1push3-0000Pk-Kt; Fri, 05 May 2023 06:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1push2-0000P2-BG
 for qemu-arm@nongnu.org; Fri, 05 May 2023 06:29:40 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1push0-0002uH-LJ
 for qemu-arm@nongnu.org; Fri, 05 May 2023 06:29:40 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50bc3a2d333so2398941a12.0
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 03:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683282576; x=1685874576;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hnqTNG8MzOKBvFmVPeaf8tellhPa1mMajzbAEt/ud+Q=;
 b=bLmzlWrtk62D96W986phTUm7TZIFl+TN0MS0hDOlAYnfK13Vs5CUeMmDuSO10KCUwL
 QlpZYTLmBPSLpUdyBTx30Kld0tX2wWii0RyeJB38zU3EqInaORcLQzSftOWaWK7y8XHv
 ohehcl2w0EcN/mdRWCnuHCQpGqmfiEVF9oA6tOwbr+Dh53+vRszcyKTyb41ZMD9hgDt7
 Y2QL7/OxYVWLkJ/ClNL6j+IQ9igd2pxoplZWMgVx0WsryQpCGh3CeFLtn5k0qCXGOo61
 0iS9xFXaMfJsYK4b1n24QUWt+/JdjATkmUgJsYrBTw/Hbf54bQwg17020MwpMxQc/qDQ
 mdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683282576; x=1685874576;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hnqTNG8MzOKBvFmVPeaf8tellhPa1mMajzbAEt/ud+Q=;
 b=IFg4m1ZaQXQBlx5PsFvp3KRgCztM6mmcbM1BYKlqlUdJ/br8UizUFNc+ToWbdLTMvB
 rQen0Uy90hJFpbv7jGemzds8QXDqPFFeR3gh2p4ETy+lVAkmfP3R/MsZN0pM2dhiFRBO
 XElTuh/nNFIsuNw50WHZcdWnky89bHKbd7XIk511qHAGFjF5oFoDcWtzPCvknyzEybSB
 YF+1CHVTfiiDO1dtHgZDZWG1km71gYy7tdXMkSDbay0wGjbdl3abJW8pGTnRJ2/Wq4FX
 MH7FJUNj2PwotP+LyUJ8ApkIh8QZS4KQgku+IiaeEWctS6B3Y3Owr3Q8MGTDl62W2T8v
 F/+Q==
X-Gm-Message-State: AC+VfDzYBCFQzfYMZHQDrCgbpw0Drviy9tZNyco0gRIrt1tw/ZsEyrQi
 +PlOiz8hDHi++fIgpPSbcVq+XCjHAxp99T8rqF6jqQ==
X-Received: by 2002:a17:907:724a:b0:95f:3a55:1dfc with SMTP id
 ds10-20020a170907724a00b0095f3a551dfcmr900570ejc.35.1683282576591; Fri, 05
 May 2023 03:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-14-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 11:29:25 +0100
Message-ID: <CAFEAcA-Qt6SBE42p_qWbETzBtgkqLbkBkyqLQ=Q7nMbjFrcKDw@mail.gmail.com>
Subject: Re: [PATCH v4 13/57] meson: Detect atomic128 support with optimization
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
X-TUID: UPEiB5e8+myU

On Wed, 3 May 2023 at 08:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There is an edge condition prior to gcc13 for which optimization
> is required to generate 16-byte atomic sequences.  Detect this.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/ldst_atomicity.c.inc | 38 ++++++++++++++++++-------
>  meson.build                    | 52 ++++++++++++++++++++++------------
>  2 files changed, 61 insertions(+), 29 deletions(-)
>



> @@ -676,28 +695,24 @@ static inline void store_atomic8(void *pv, uint64_t val)
>   *
>   * Atomically store 16 aligned bytes to @pv.
>   */
> -static inline void store_atomic16(void *pv, Int128 val)
> +static inline void ATTRIBUTE_ATOMIC128_OPT
> +store_atomic16(void *pv, Int128Alias val)
>  {
>  #if defined(CONFIG_ATOMIC128)
>      __uint128_t *pu = __builtin_assume_aligned(pv, 16);
> -    Int128Alias new;
> -
> -    new.s = val;
> -    qatomic_set__nocheck(pu, new.u);
> +    qatomic_set__nocheck(pu, val.u);
>  #elif defined(CONFIG_CMPXCHG128)
>      __uint128_t *pu = __builtin_assume_aligned(pv, 16);
>      __uint128_t o;
> -    Int128Alias n;
>
>      /*
>       * Without CONFIG_ATOMIC128, __atomic_compare_exchange_n will always
>       * defer to libatomic, so we must use __sync_val_compare_and_swap_16
>       * and accept the sequential consistency that comes with it.
>       */
> -    n.s = val;
>      do {
>          o = *pu;
> -    } while (!__sync_bool_compare_and_swap_16(pu, o, n.u));
> +    } while (!__sync_bool_compare_and_swap_16(pu, o, val.u));
>  #else
>      qemu_build_not_reached();
>  #endif

Should this change be in a different patch? It doesn't
seem related to the meson detection.



Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
