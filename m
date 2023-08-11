Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1264149ejc;
        Fri, 11 Aug 2023 03:26:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHC7A3xcuOP+doD+8XN8eObikpngthn3s5tzB2yrkkAtyiX8efsQUoFiuUz6DdzWybgmwPy
X-Received: by 2002:aca:912:0:b0:3a7:215c:e37 with SMTP id 18-20020aca0912000000b003a7215c0e37mr1492981oij.59.1691749598674;
        Fri, 11 Aug 2023 03:26:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691749598; cv=none;
        d=google.com; s=arc-20160816;
        b=Tj8suN0avUc9vNocrr0Vo95liYIRzE4oEcftFhP3JBMOvO7YXhGTM+d8frZKRBO8H2
         jktXxUJZV4wGVy6DIZcq2o54osZ8KUozAdYbmj+qKEQz1ajI7cTSJ6zpLH3bduLXsO+G
         cddsQiBNAA+70RUkcNL9P+cXMh011+85VA+UGyVhQ7Ut3MjU2Y5PF6KMHbFVqauRj0zL
         NQGFX8Y6gOUyR/tipBEEqBbGjJOHd/sRLQ5hIvsNXVYzXW9cD5b1AaSRmkR93esKkCTP
         4gHYzdOU6bXPGKkaH09bKFVFDYiRvLYfTsiaSiZpgiCNrvhUpAUMP8tBruK5N3KhWCvo
         vvCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=AxW4QMohZTd4ffGqz5mVyYv+XPVEgvrR1n8HhpUVgXw=;
        fh=2HckukKM1aDIhwR4Gf5EB0R8biZDVGAD3ibhLJ8HTaA=;
        b=ww9Zea42LRPF41bS7m7baZvIUwYjg8V58Oe2Qqmw69bEe7C0BKiNFChWxbaJFAYmVx
         9k7wN8CQFev2jJOtmGKLkzlXSJlODcirBi/fsgppOfic0sZW+6Ez40eTlD3hrq+tLRzh
         Ljm6A84wMcluzIQngNN0wn6v7AKgvnIfRrbWwohjWqyJ4P4od/RDAWSV95VPLD7DS9w0
         E6qjbgU/jsx0tx8bOJGhkcz75bd5hB4Wys8QPbFpK1bIxA2Qgm2s7O9VHXs45t5R9Bwd
         Dqe5ugCXlN0oCeFCUQHAUqx/Qc2A4SQ3Yv9KBTLKV1xjnDzod88V4/F4Vudi0eOMBG3j
         L+aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yhVR4tjO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p5-20020a0ce185000000b0063fbd2f79d9si1877845qvl.332.2023.08.11.03.26.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Aug 2023 03:26:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yhVR4tjO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qUPLi-0002hA-PR; Fri, 11 Aug 2023 06:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUPLc-0002el-6O
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 06:26:24 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qUPLW-0007DK-4g
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 06:26:22 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-52328e96869so2390894a12.1
 for <qemu-arm@nongnu.org>; Fri, 11 Aug 2023 03:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691749576; x=1692354376;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AxW4QMohZTd4ffGqz5mVyYv+XPVEgvrR1n8HhpUVgXw=;
 b=yhVR4tjOVidwv87lqVVJHDxHF6L1X7ukxRQiWMtFwUuWbgM6lugRU2o1HpRzxfTq6T
 STquIND3nn5cEEL8aU1YUtkZXSH5jjayubDJsdOy+hrT37IVMJqhKrqYkJ8vvP9aley9
 oNeYglWwMoilyw6Vxd2JlfaId8AoOVvXAR32y64XbyjvdrcQJ8i2WEwMkRoqOpNqJI/i
 qp95J2XiWL5GUM7MIAWbvkLbWT13fJFN3cEE84dl4unKjO7hFAmV1drqM0CPP4hHSFC1
 AfYQ4TbrsoFrk1ibQrIhmhG/vc0XXyd98qnqMfoCfyg+ghb9EwNeKfattBgDCmqYzTkA
 bUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691749576; x=1692354376;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AxW4QMohZTd4ffGqz5mVyYv+XPVEgvrR1n8HhpUVgXw=;
 b=Pepj9SSWUReLnDOXrMIcIBvbGlGppIeYkBI/NFPXrXW/CuFJAPI28Y+7EjXZgrynE0
 8JLnASVKQA/qHCbcYNWRmfbglVnRG3r6IwN4epTr9sN24r+wYBFnGDwW4/ZU3Ph8rV8l
 3kGxo2sjA2C52PL4Vd55ceHH2Gp/jdnFXZ215FfhcWKT+lqDVR/cb8Te7kPTtcoOUy52
 9bHd2WasrSDyPKYib/dhiFnJ6MTHw0T9alZUhzecdaNwIXySVgkeFiZke7fM3+2KEwjJ
 V9zuKX7jDZuQv2mzccOYqYAQv8UDvZC0FOheEdcoxzV0L/F+gwEdYHeCY9e4AdOFwesN
 5l2Q==
X-Gm-Message-State: AOJu0YxRls5XfRpOVkC7o+u46UU2rftmN3bciPF2AvihUlqxweGUabMr
 OhiaWGDpR3dTCBNmk5PqyZziZyb9Gg3Ek7eWF0wMwg==
X-Received: by 2002:a05:6402:1846:b0:523:406a:5f6 with SMTP id
 v6-20020a056402184600b00523406a05f6mr1313950edy.12.1691749576480; Fri, 11 Aug
 2023 03:26:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-21-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Aug 2023 11:26:05 +0100
Message-ID: <CAFEAcA-N-QWQXcHgMNnXTr+Bmf7fhdSKYQwS-kkWGdR+UHvT-Q@mail.gmail.com>
Subject: Re: [PATCH 20/24] tcg/i386: Add cf parameter to tcg_out_cmp
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: ZUuRML6RSF6N

On Tue, 8 Aug 2023 at 04:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add the parameter to avoid TEST and pass along to tgen_arithi.
> All current users pass false.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/i386/tcg-target.c.inc | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
> index b88fc14afd..56549ff2a0 100644
> --- a/tcg/i386/tcg-target.c.inc
> +++ b/tcg/i386/tcg-target.c.inc
> @@ -1418,15 +1418,15 @@ static void tcg_out_jxx(TCGContext *s, int opc, TCGLabel *l, bool small)
>      }
>  }
>
> -static void tcg_out_cmp(TCGContext *s, TCGArg arg1, TCGArg arg2,
> -                        int const_arg2, int rexw)
> +static void tcg_out_cmp(TCGContext *s, int rexw, TCGArg arg1, TCGArg arg2,
> +                        int const_arg2, bool cf)
>  {
>      if (const_arg2) {
> -        if (arg2 == 0) {
> +        if (arg2 == 0 && !cf) {
>              /* test r, r */
>              tcg_out_modrm(s, OPC_TESTL + rexw, arg1, arg1);
>          } else {
> -            tgen_arithi(s, ARITH_CMP + rexw, arg1, arg2, 0);
> +            tgen_arithi(s, ARITH_CMP + rexw, arg1, arg2, cf);
>          }
>      } else {
>          tgen_arithr(s, ARITH_CMP + rexw, arg1, arg2);

I don't really understand the motivation here.
Why are some uses of this function fine with using the TEST
insn, but some must avoid it? What does 'cf' stand for?
A comment would help here if there isn't a clearer argument
name available...

thanks
-- PMM
