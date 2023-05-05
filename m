Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp375669ejq;
        Fri, 5 May 2023 05:23:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6qy7H3s5V+bF7dzMhMMlN7DH7o8N5M92mHnsPGRR1Y3ifN3y7qwYuQ6tUhx4vetzV0rxgT
X-Received: by 2002:ac8:5a85:0:b0:3f0:ab4e:df6b with SMTP id c5-20020ac85a85000000b003f0ab4edf6bmr1562944qtc.67.1683289386949;
        Fri, 05 May 2023 05:23:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683289386; cv=none;
        d=google.com; s=arc-20160816;
        b=0uSMLgUYuR1ie9nmME9XEoRoo+/og9FIZlm7D1/ekIgyfVzKEiHzR17Gf+grual/9Q
         ybFVJplaq7NIs/WE2KGM3TLg7f5PH+aSy5tYCeM4oyCzDngtVbE6qeVpeSMmUwI9DYk+
         vu36pml1YvueATsDrUbHqkoTbzbsaS/zKd8D6dnFwLYnykWVnwARS9Kysl77DLe8zhr+
         /d3lf1CcP2nD8Kl890GbH9w4rqXIEZUB8A7UfxUj+KWDMpV3eyqryab3oFlSbawnQjSj
         aaEapFzZgX9zydr4Aa9DAAu4V4lHjpUb/ezYT7xg3fqVg2cYmxAImNbZgoCejbA5NSge
         lXmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=qPCyVI9kr62LNVgR4MbqahLwPDo/qYs+kZjMEDVEdgs=;
        b=Xkr1O7ffZv9wsKXp9siXLVhISxjWa20zCaMJG8i5v768SDM//HNgxY/EnpwLSlHZiN
         V1ZfaUdaxC1ibk/Cza3KbrurBKD5d6fRwmfyoH9+1E9lxIMM9s/6+WR7yZh+w6AX/bzc
         BAgz+As/fHvHk4Ik6ewqxt+YYr9/O84/mQAyqEEEs8CJ1mOsiD7ujnD/yHFxxmowgM/5
         aweW33SDbSaGJMAnVec572hHdfNJBpYTNNJ7IVfx/QBaZ9Le2daJNi3AspFhRX0ys7OS
         uEihqC5LMtJx5X5gPoUEJMHh9l5eUEZr1JtxffibXLCUacDSErDY8EVDpeJlsEZlsqcb
         6lLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="c3/VtSjr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10-20020ac87f4a000000b003e6a1032dd4si532305qtk.169.2023.05.05.05.23.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 05:23:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="c3/VtSjr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puuSY-0005Lk-FX; Fri, 05 May 2023 08:22:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuSU-0005KY-EP
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:22:46 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuSF-0000iT-Nq
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:22:46 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-50bc3a2d333so2588980a12.0
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 05:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683289350; x=1685881350;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qPCyVI9kr62LNVgR4MbqahLwPDo/qYs+kZjMEDVEdgs=;
 b=c3/VtSjrE8eDpQLHbaU8mXFdQUcrP2PAssHxyJZRDf+eEafZC4C2BGhqJmtrRZx/Go
 Qim6W1WVIdSD9dQ3lfl/IqXocrhAHwRLX6q3BJeYref1EJ+gMQ0lnLhKdMpvHvm2Xuim
 GLMTsU8DK7zeavvsM1cXrMvMXQCN9UaP4B7FBCXzFnqEWNHDI+HXzuJYe4v+JkMo9rMH
 UUpQcdQua2xCzssBPVLA0DJBHHDgWnNzM4Oj7s71u0kOZNXtZFfht6GS8ufCZqCG3Slk
 1DXbLZjDlIVrWHQA81QSRT8RA9MfWZaWfEEegnEsKXbekjdP1ElYPbYVMZ2Osnb7b9IF
 XTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683289350; x=1685881350;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qPCyVI9kr62LNVgR4MbqahLwPDo/qYs+kZjMEDVEdgs=;
 b=fx+2IePiRvT4Hav8xmRM0QQaYvS32t8ooGBTD14HWjiduilq01PRapcNe0NmdmF0h4
 cE/rhWl3hqxnN72fc3VokRvO9/QOkbkugsMAjGmnYjoUFkjf0m7XEULNYOaqkpGUarTS
 axMBmzu1iiYNY1aAX7wuCj5S/Qsneb1g/1rHM9G0bmEKu38WvzUc1LyYxhgMKSJ9wlJb
 lmPisfxWxErh8cCqVKsZ5Q+gftnTtd/8/M+htVBTcQVSRnlqKElhnviuuuFE3NldFRUO
 g4AvkCDj57Z6yrkldp/+K8yYLhf0Yl15e4qvEefPjaCTgxxdQFv2tjYwyOBY28ddD1Bz
 zeZQ==
X-Gm-Message-State: AC+VfDzUC0IflWV6UWxLZKJKNexqG5Qe3L+/O0AeEkfy5VrsGiVORtvh
 E7PBY3bnwg7W6juauWoNVRSn27Em/ZZcxoHB/M32mQ==
X-Received: by 2002:a05:6402:2044:b0:50b:c77e:b071 with SMTP id
 bc4-20020a056402204400b0050bc77eb071mr1316111edb.18.1683289349953; Fri, 05
 May 2023 05:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-33-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-33-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:22:19 +0100
Message-ID: <CAFEAcA-mFD2-GJxOwq5Zkb0DGh_ONOxAP7NuB5WOPUGAASihNw@mail.gmail.com>
Subject: Re: [PATCH v4 32/57] tcg/sparc64: Rename tcg_out_movi_imm32 to
 tcg_out_movi_u32
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
X-TUID: wR64ck84RITs

On Wed, 3 May 2023 at 08:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Emphasize that the constant is unsigned.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc64/tcg-target.c.inc | 24 ++++++++++--------------
>  1 file changed, 10 insertions(+), 14 deletions(-)
>
> diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
> index 2e6127d506..e244209890 100644
> --- a/tcg/sparc64/tcg-target.c.inc
> +++ b/tcg/sparc64/tcg-target.c.inc
> @@ -399,22 +399,18 @@ static void tcg_out_sethi(TCGContext *s, TCGReg ret, uint32_t arg)
>      tcg_out32(s, SETHI | INSN_RD(ret) | ((arg & 0xfffffc00) >> 10));
>  }
>
> +/* A 13-bit constant sign-extended to 64 bits.  */

This should have been in the previous patch, I think ?

>  static void tcg_out_movi_s13(TCGContext *s, TCGReg ret, int32_t arg)
>  {
>      tcg_out_arithi(s, ret, TCG_REG_G0, arg, ARITH_OR);
>  }
>
> -static void tcg_out_movi_imm32(TCGContext *s, TCGReg ret, int32_t arg)
> +/* A 32-bit constant zero-extended to 64 bits.  */
> +static void tcg_out_movi_u32(TCGContext *s, TCGReg ret, uint32_t arg)
>  {
> -    if (check_fit_i32(arg, 13)) {
> -        /* A 13-bit constant sign-extended to 64-bits.  */
> -        tcg_out_movi_s13(s, ret, arg);
> -    } else {
> -        /* A 32-bit constant zero-extended to 64 bits.  */
> -        tcg_out_sethi(s, ret, arg);
> -        if (arg & 0x3ff) {
> -            tcg_out_arithi(s, ret, ret, arg & 0x3ff, ARITH_OR);
> -        }
> +    tcg_out_sethi(s, ret, arg);
> +    if (arg & 0x3ff) {
> +        tcg_out_arithi(s, ret, ret, arg & 0x3ff, ARITH_OR);
>      }
>  }

More code changes in a patch that says it's a rename-only.

-- PMM
