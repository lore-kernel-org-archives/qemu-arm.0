Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp3249915ocg;
        Tue, 11 Oct 2022 07:56:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6j44jW/6uo0mH3a5QoO2rs8VrYKJPfc4quUAb8AlCE72fGctJXnRQHTsYNrWUMG+8yXJH7
X-Received: by 2002:ac8:5849:0:b0:39a:8e35:1bfa with SMTP id h9-20020ac85849000000b0039a8e351bfamr7513878qth.573.1665500187230;
        Tue, 11 Oct 2022 07:56:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665500187; cv=none;
        d=google.com; s=arc-20160816;
        b=vdQERM4D2ZjgcKvoq7eL4tlD+N/I5w7U1NRy3x247AbiR155cub1aaw6KLVhVLOVWg
         soJSLvJVV7cGAkqS4oq69ovvixOPfEid3I6+Uijmng9aWQEIIsNcQNEiaiYXqllb7agA
         4VD0Vdgn+iKbgmv3x4eFk4ahzoFAjlZoFASPdQhRyZkBwDcXmO9Thn6cmfQk0H50zJN6
         ioq42A/O4aIwjPOms6mdaBi8euDTohAcgMz0ZNOYcnwXVvDM62U27gUHqAaJ0dOyguRw
         Fvp2z3WNLXaCR4Unqe9meNs805EslDJXoj7yn0bf7UHzF+iolYQMYwXwpsFcIdyRGXQ+
         RTNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Lz0/Lo4+fsY5rZHBa89zwNXemdFwSrwJKnayi2yK5Mk=;
        b=BxZARfbx43QlUMKrF7xTB7TlKr4ZqnPbh5SqB4Qfw1yXz2/S6B7/J5LEPlr1mtvINt
         XiTr3ukQc8LZJc3GOqVnlWnym11/vuD6WLhuf9fBEK15/XPuMU5xNvrA10ENPwARInkt
         cTxgn7LfXcPSg8jZFGxj8uhDDNZQDUkttxTm+/Qn6R5uu6f30lf5O4MK4vQ50KhYiv5e
         hO5A8TpYXm5XIocMhY/xVA4wzmpW+lF+aWWBQalJ7/4O68lhGj4n5WH5ETtx+AgSZ/eU
         vKy/R0rxSECXvLuctEWwWQ89qVJSM6EIXHkxK0gPoHdQLBTFltn/HXnhA+43IeiuGyOm
         Y5/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nyEk9eCp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11-20020a05620a278b00b006ecfe1d0cb7si3204819qkp.365.2022.10.11.07.56.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Oct 2022 07:56:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nyEk9eCp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oiGgE-0006Sa-Hh
	for alex.bennee@linaro.org; Tue, 11 Oct 2022 10:56:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oiGbR-0003iX-Fe
 for qemu-arm@nongnu.org; Tue, 11 Oct 2022 10:51:34 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:42940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oiGbO-0005Yn-Bs
 for qemu-arm@nongnu.org; Tue, 11 Oct 2022 10:51:28 -0400
Received: by mail-pl1-x62e.google.com with SMTP id c24so13400835pls.9
 for <qemu-arm@nongnu.org>; Tue, 11 Oct 2022 07:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lz0/Lo4+fsY5rZHBa89zwNXemdFwSrwJKnayi2yK5Mk=;
 b=nyEk9eCpGLMaZEnz+ORkRq2yGblv8m6Mf1v6spsTNcaskQuz8lb0twZle+7h5aY6zA
 oDvceM46W0rxalLZnB6S0yUpsCibWENCu8HlJ0bDG28wA3A9COIejytRZoBwVxFMy87B
 Os8vXXuAHD3YdqCpJY3Fhk9PTCd8tazCtfOO1O4YVujSKu8ctGx2LH47BZy/vN0LS77M
 GU/9xDvm3gpZFTpQ5WuF/JkilDnOp7LA+yQLq4mdiRapsJIh+1R5aqcv0zsaH7Aq8ehX
 +HFE2n6UvNizzbH6eYGjkMPE7FsJjSqwyY0UZBW8u/jkG+IwCTyUGsD+sUP0zEZGOuxD
 +vKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lz0/Lo4+fsY5rZHBa89zwNXemdFwSrwJKnayi2yK5Mk=;
 b=uQs8onulPL9yFCkBHA5lfMHpNzwXqNyUhQw1w25rzlRLtlKhKEssmpi2lzVUF2eohr
 JXLe9ApqcMIayzaBmzqwka/Fi1yooWHo50BixgrAB55hyfs+iBeN13rm3SHE5ONJNpa/
 kcsYdTvwkTwGJqwfYTw6BB4d3NRxK/i1H7L9QJ+1hRm3vERvt1PnJ14aJ55h45httiDc
 DJPZVzGYVrLbM6w6WF/cOx8bYqoGwZ7D3TMgO9CATzqRBnMVEkUHD1ITmIzg/95+NJIN
 MSuetpNzEhgs/qpieAyX/3xitb0Q9y5epev/Q8JJM7o81WLgW1EIcIlxydiwAim883uN
 +NkQ==
X-Gm-Message-State: ACrzQf2uF/GmDmr3wojhXDduyqgTXAjujoxtgkN8bcPAvOMez1tf7zj4
 OpEly3vhvpypEKwfQm8OWnaHNmwcSk912aYGhHl/ng==
X-Received: by 2002:a17:90b:4b8e:b0:20a:f240:9b23 with SMTP id
 lr14-20020a17090b4b8e00b0020af2409b23mr27494480pjb.19.1665499884352; Tue, 11
 Oct 2022 07:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220930220312.135327-1-richard.henderson@linaro.org>
 <20220930220312.135327-9-richard.henderson@linaro.org>
In-Reply-To: <20220930220312.135327-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Oct 2022 15:51:12 +0100
Message-ID: <CAFEAcA_0ZbNpZKyWdQWhh80dc+Y2R08UH9RWWzBOVOsDdWPi1g@mail.gmail.com>
Subject: Re: [PATCH v5 8/9] target/arm: Introduce gen_pc_plus_diff for aarch32
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qKuYsfHp5SO2

On Fri, 30 Sept 2022 at 23:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index fd35db8c8c..050da9e740 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -276,11 +276,16 @@ static target_long jmp_diff(DisasContext *s, target=
_long diff)
>      return diff + (s->thumb ? 4 : 8);
>  }
>
> +static void gen_pc_plus_diff(DisasContext *s, TCGv_i32 var, target_long =
diff)
> +{
> +    tcg_gen_movi_i32(var, s->pc_curr + diff);
> +}
> +
>  /* Set a variable to the value of a CPU register.  */
>  void load_reg_var(DisasContext *s, TCGv_i32 var, int reg)
>  {
>      if (reg =3D=3D 15) {
> -        tcg_gen_movi_i32(var, read_pc(s));
> +        gen_pc_plus_diff(s, var, jmp_diff(s, 0));
>      } else {
>          tcg_gen_mov_i32(var, cpu_R[reg]);
>      }
> @@ -296,7 +301,8 @@ TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, in=
t ofs)
>      TCGv_i32 tmp =3D tcg_temp_new_i32();
>
>      if (reg =3D=3D 15) {
> -        tcg_gen_movi_i32(tmp, (read_pc(s) & ~3) + ofs);
> +        /* This difference computes a page offset so ok for TARGET_TB_PC=
REL. */
> +        gen_pc_plus_diff(s, tmp, (read_pc(s) & ~3) - s->pc_curr + ofs);

We could rephrase this one also to not do the "pc_curr - pc_curr" thing,
the way we did for BLX in patch 6, right ?

thanks
-- PMM
