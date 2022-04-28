Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1626362lfu;
        Thu, 28 Apr 2022 03:36:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHg4TTtPkgIs5gQ8t2dM0/1nAJUFbvhq0RzHHdG0d4c4Csg/wyiSmQo/0PfUBwKldnADoe
X-Received: by 2002:ac8:58cd:0:b0:2f3:41c8:9d01 with SMTP id u13-20020ac858cd000000b002f341c89d01mr22308621qta.416.1651142189139;
        Thu, 28 Apr 2022 03:36:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651142189; cv=none;
        d=google.com; s=arc-20160816;
        b=W2NNaPm9pB22nx8yFm/hfCT2l6UV+FHlIG9c/fK6DzQl0sW3Ls1Zq2hfGHUTeJiN6c
         5o27C3jjydfJxIyuaw9zfGVP/GxoPrQxurdIRS8hR2o+8VV/58TDQ8UqODgQdZHCAiwX
         y35WpPVb36Oyjon0lEBfHtmUkS2qjaOI3XDDi/hCxav1MIxOA5hDF05cGpEOeZXLhUJ0
         KcPLS0X8fzml0MI1UZJIYfpI8Mcu0a3Gkw9B0WwwZU9VyiuAcQ3TJYiYpi+BueztoMFb
         5KADFJ5uY+plwTsn9igR5FnN41s9GQ02SADULs+D2FGNDgZGOzZQcExCwdnhkEIBJVEi
         mKvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2MzkyQT+gL0SRzBfwVMvaDW2y8xk5bm/j+LxgF1JYX0=;
        b=OkvCRKTPs1A4bJPH/vYoqkUImcTRi5M+LLD/84nqkGfsal9zNwdLg6kiMluu8kQoBq
         cYFUD/PHWR8JFERjmoYgEU1jbo3JBprHZrPNEi5xquuz3ridwcUAQ2vlWkut45kedNvT
         V/lEtrrcPD8AKBuLQ15KgKrqG/5EdPHeG19kFXATL5Tee32PuzmHgxKVDNa2Fl5WV/D9
         2fKSQXp+54AY+ZcqMU+NHazS2NdN2l0VS6poSobcXUkbacylsdJLgZ9c3bC3sY8RjUk1
         tEKaJ5Xuz6y7Amw2bSWYyxeYdDYWcAY5noCPa1vkmuxJNLgBOQJzqqY7hZ0sVMbvRlHN
         Ze9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P1GjDFeb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8-20020a05622a064800b002f33d07541fsi1594802qtb.259.2022.04.28.03.36.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 03:36:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P1GjDFeb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk1VX-0004nX-Ck
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 06:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk12d-0006H5-0A
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:06:31 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:35516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk12b-0002ti-Ha
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:06:30 -0400
Received: by mail-yb1-xb33.google.com with SMTP id w187so8112593ybe.2
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2MzkyQT+gL0SRzBfwVMvaDW2y8xk5bm/j+LxgF1JYX0=;
 b=P1GjDFeb0Dl948S6N1MnQJ0OMThHRsNDyz4/00cFuM3mtnEl/NnC/DLfP2hXQtuzd8
 tmuyzVaAqPrSH92sreAz44y1Ueyq4QmwJnEnGA2TfJk5gnvR2Rq1ZTfJZ/4HdcpqBX+C
 jTMfEkB8MkRqvNAct9LqCcPcskx5DRcafca9P+bBs0+doZF/+lC6ufXdygK02InWJGhe
 0/1qFTmgP95GAyz1IpNtwfMAIk04c1jFneoNAAOCuaBnbBFidDygRyje0jF8n45IUeas
 i3EDnTwUpmoFaKRpcuCZumUBCq9FEvSno2sgajrJOvjDbuZiUUdJ1/EgWYHFzpmFN3at
 rRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2MzkyQT+gL0SRzBfwVMvaDW2y8xk5bm/j+LxgF1JYX0=;
 b=mfm1QdUxm4aNHZnbeZHVDhOIyMS8HazInFb6xCrQmcUx8Y5+9dbon8vapdyyH2M2Ke
 WyIJVlLwjYCQepV85q/4nDP6oD+oYvX8T0G36YGuI+84Hy3DuMMrkZ5TbMIBGRsugG+C
 h3kb0R84gz5a6dcEz+gRSuzAHNgBzBYBZqfrNU8KhVEM20w5HoyK6u+tM36FuLHaLsc2
 2qPkGUOn0JqqlkWLFrALarzUvRe3qWTG9X/BZQzlQRUR6HohE1XdbcmcUkVl8i2MMmum
 pMJQpTs/auqQKnupSQ5FMsaAZ1zboLXhXGsiNnDxTcU0E3Nn7OW1NS3kUOW3IWNX4+E/
 Copg==
X-Gm-Message-State: AOAM533tyVlTwby/l9cCzuf+I0hkTI5J30m7wr3Q5TQIdT7DbgcIffvv
 4H6W3b9GaR7eF0i9WD1Gg2rZoTV+cpDbTYTS/aIGqPSaiGA=
X-Received: by 2002:a25:bb46:0:b0:648:4d25:4b40 with SMTP id
 b6-20020a25bb46000000b006484d254b40mr19942211ybk.479.1651140388381; Thu, 28
 Apr 2022 03:06:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-18-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:06:17 +0100
Message-ID: <CAFEAcA9Uz98h8v7ARw-8ZmeZD==+=ntPtMhxgq7Php6a_pUhOg@mail.gmail.com>
Subject: Re: [PATCH 17/47] target/arm: Use tcg_constant in disas_fp*
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: exE+p76hxVZ+

On Tue, 26 Apr 2022 at 17:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 24 +++++++-----------------
>  1 file changed, 7 insertions(+), 17 deletions(-)

> @@ -6052,7 +6049,7 @@ static void disas_fp_ccomp(DisasContext *s, uint32_t insn)
>  static void disas_fp_csel(DisasContext *s, uint32_t insn)
>  {
>      unsigned int mos, type, rm, cond, rn, rd;
> -    TCGv_i64 t_true, t_false, t_zero;
> +    TCGv_i64 t_true, t_false;
>      DisasCompare64 c;
>      MemOp sz;
>
> @@ -6097,10 +6094,8 @@ static void disas_fp_csel(DisasContext *s, uint32_t insn)
>      read_vec_element(s, t_false, rm, 0, sz);
>
>      a64_test_cc(&c, cond);
> -    t_zero = tcg_const_i64(0);
> -    tcg_gen_movcond_i64(c.cond, t_true, c.value, t_zero, t_true, t_false);
> -    tcg_temp_free_i64(t_zero);
> -    tcg_temp_free_i64(t_false);
> +    tcg_gen_movcond_i64(c.cond, t_true, c.value, tcg_constant_i64(0),
> +                        t_true, t_false);
>      a64_free_cc(&c);
>
>      /* Note that sregs & hregs write back zeros to the high bits,

This incorrectly drops the free of t_false, which isn't a
tcg_constant_*.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
