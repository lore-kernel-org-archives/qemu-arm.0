Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp785904ejc;
        Thu, 10 Aug 2023 09:13:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHC3bbi36UYmnNWyjWq9Bc4ShEZG5dPC7EBFuP35pzjEP82NVqHsPGgxSyXf9z69wtJmq8+
X-Received: by 2002:a05:6358:52cc:b0:13a:22d1:9b53 with SMTP id z12-20020a05635852cc00b0013a22d19b53mr4427323rwz.1.1691684023838;
        Thu, 10 Aug 2023 09:13:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691684023; cv=none;
        d=google.com; s=arc-20160816;
        b=nfqFE43wIt+TTULm07V8PbjuDyGRgKe4PmusCsBFiISeYTm+rffxaMH6nVt0poi3kQ
         rSCCyxQRtJffLdhGoNjevCZ3DHtIFOxJ0x2Rzt+r0GfbykCHfr5lxjlJcg29NgnPoaUE
         QXtuNPb6h46nOYUX9CZYK+VBSXAgiiLEUVBWPI7veyQHcCvg5DBBF1KqJqjL0mimd9qo
         SVYGa6d9oEg6VKLuf4wcQqB3UZ26uEbyaGysQAtu1DBbiIvbYN/43B8eevxwoTWwkqH7
         rvalZLEyHMFHvpIyQG4Pm+RVmLecfT2WWMWKhxxDr1WKeF8OceQKQa7/Wt+fLZV4Uxku
         ZP7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=S+DK/m+jscP/AP0BmZqeAxyMSJZTabVUzOqp4jitSag=;
        fh=2HckukKM1aDIhwR4Gf5EB0R8biZDVGAD3ibhLJ8HTaA=;
        b=GVT0iwRoHmwt4BhOjV7AfP/Rq0PMmCk6rAPxd4eZrSxrx6TqgLB2XiBM16aARPtPUW
         ByhsqW8XbPDNcSlDM9sb/y4guPCaHRmweWZ1szBT4wn/yPxDAWLEr31yvuiX9ZsVUZYc
         GGbHctqaBZB+Y5QdPAOMZd/GVtafNuVfyowAoL617w+T1+D7gwCqjegIkorDWa7tkiT+
         mdZahSgAs/1NKf+a7sDMEBqCggUL5jAMgItu0I1uI5caca+QuQ23xXPZy8jVko+PSrIL
         oncGzexNVd42MOEQajedCR/emRuhkr09SktYVf+xwszUNm0vLfcGtxkYseI17lNUg4BT
         FUTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BSYfEY2M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a12-20020a05622a02cc00b0040556cb119esi1157051qtx.536.2023.08.10.09.13.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 09:13:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BSYfEY2M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qU8Hb-0008Dp-GY; Thu, 10 Aug 2023 12:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8HZ-0008C6-Df
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 12:13:05 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qU8HW-0002e9-Nm
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 12:13:05 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fe15bfb1adso1703266e87.0
 for <qemu-arm@nongnu.org>; Thu, 10 Aug 2023 09:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691683981; x=1692288781;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=S+DK/m+jscP/AP0BmZqeAxyMSJZTabVUzOqp4jitSag=;
 b=BSYfEY2M6NYfqFRvDvlrUNoCO//r2CCbZK9OZn0s0xnGxtXB+5Bb2Mk2hAzUHKPEDo
 97eMLK1EbXVgKkMIjjt3fxV/j96gbF/rl9R+uMlLkG7dm+UvBxaYtKWMSQhA4E95t4o1
 xxG8NbvW6S2CY3nn+l87QqIhr26Cff/y+MTkDKlogL0d+LOE8eB5PMd4Ee8qlr2Eki9d
 +fmORue5GXR/LgtmO366Pu/qFpVLm+rWrjIpagxHQww3OFaET47dNllb6GrcEX7Vnw8p
 GIUqYSorhqyONtV2ilhMsPMY8KeuPwJIG6URlc4enm6GndmGOaFzFeIUymmQf0YDNXIg
 1O6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691683981; x=1692288781;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S+DK/m+jscP/AP0BmZqeAxyMSJZTabVUzOqp4jitSag=;
 b=Qedb6uAmu5nl25+/6NCJC/Mn4Hq4RjaodzgIgt1gEvTbteuZCS+Ov0mgrRvorzcSmS
 K/9tXENay1pecXXYjWSiSAq6Ei9zk4dEADFOXBi/Pmp/S2yr8IOGnAoBsKI67loTcdax
 HuyOjsnDSlV184bqgzYA1kYPUlNQOOlxj+/lAbafO9lf1tZ/bjeWK0h17Q1Ae15+jK/W
 ABaHDaZOfgPfb91slNbMArgANqCnk6k/An0Oy9Wmu/XHl3p/Tg4NHNnvlT6MlYLsN8QA
 QTqjlzK42z0bGOAIhVJiU4/MBNbzEvSrfa+SeZJQ3xONkEuZE8PVx1YsbLyRdsraBunE
 OZtw==
X-Gm-Message-State: AOJu0YyMc9Q9HwXMpLmPu1bsoryijMdAH4t1dWlDBCV/0OTIZn/d4UI3
 ktEejkhpxJGyRJfzw+1ECEBYHW87BXgVQzP/suKDJg==
X-Received: by 2002:a05:6512:36cc:b0:4f9:6528:fb15 with SMTP id
 e12-20020a05651236cc00b004f96528fb15mr2062967lfs.12.1691683980651; Thu, 10
 Aug 2023 09:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-2-richard.henderson@linaro.org>
In-Reply-To: <20230808031143.50925-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Aug 2023 17:12:49 +0100
Message-ID: <CAFEAcA93xKE8xaYEwED2Wwj0-3QiOfnfN7Zgvf=KMYgO1tnz-Q@mail.gmail.com>
Subject: Re: [PATCH 01/24] tcg: Introduce negsetcond opcodes
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x134.google.com
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
X-TUID: a8T/gLbXea5s

On Tue, 8 Aug 2023 at 04:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Introduce a new opcode for negative setcond.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>




> +static bool fold_negsetcond(OptContext *ctx, TCGOp *op)
> +{
> +    TCGCond cond = op->args[3];
> +    int i;
> +
> +    if (swap_commutative(op->args[0], &op->args[1], &op->args[2])) {
> +        op->args[3] = cond = tcg_swap_cond(cond);
> +    }
> +
> +    i = do_constant_folding_cond(ctx->type, op->args[1], op->args[2], cond);
> +    if (i >= 0) {
> +        return tcg_opt_gen_movi(ctx, op, op->args[0], -i);
> +    }
> +
> +    /* Value is {0,-1} so all bits are repititions of the sign. */

"repetitions"

> +    ctx->s_mask = -1;

Do we not also need to set z_mask to something here (presumably -1)?
(I'm not very familiar with the optimizer internals.)

> +    return false;
> +}

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
