Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp657143ejx;
        Tue, 22 Aug 2023 04:45:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE/vAuc8FDoawujRAZoWmS5OPd7BakrPJqqqeVexOQrb8O7pfxgqoSukOLLqPjZKbJ4ySY
X-Received: by 2002:a0c:e206:0:b0:64f:430b:cabe with SMTP id q6-20020a0ce206000000b0064f430bcabemr6083180qvl.32.1692704719242;
        Tue, 22 Aug 2023 04:45:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692704719; cv=none;
        d=google.com; s=arc-20160816;
        b=0Uap/CqV5lduC4YwdZc1ymINLVaj3EfZyu0x7D0ytQxBtPDT9xx4U19lhcZdABl5iB
         /DcDUCQpRl3YM5DEl95ymRrOQxq3GVPvIRevzjbS2lTMM02ydptxrkTF5wmHQiYy9dmH
         qm1QasFvWEsAcRFIzk51dXloCpb+xThmeliubOfSMhXOm+Fur7N6H3ixT4ED1X5OpT1Y
         x9IquOa+9T3uaT9uCeST5i3ETDqNiWdDXovaTC/xkDM5BNh5vKj+3pzDWC3ufInrhzGZ
         hWH3Vjcpk0kJDK3KVrxANZdmc6LrweRv5uQESDtnP9fL7X/sxk2fu8iXokbx2D+gz76k
         3xOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=NrQ0nn/R+ah4RfL4YqoGKD8z4L73n4KEcrCq0geYfv0=;
        fh=2n2TGmFa1ri6Gm+ryyd12WVJ0xNvvL53TsASRxKHK5I=;
        b=GGLgYzwLZ42/X+2vftLn1KlGWx+R0MAN1ZGyguctTzexa2uoPgqNRd3cXxQ6heg1jO
         VB16ZH3GfaysJl8GT76UaNwxLCBaW7kxHqkjdQySit+Tb/f5BeAyJ1gy046xDkBsk8En
         6SM2ccTo44IYakT7fKBNLKGh7JhFIMvtvtcvyKCFADy2MW/n6BN/sd6Gk1YGi41Aldbg
         8El65OU4qLj0fn7aRaC7fG2A1hS3tEBZl2ZRZL5ahC50Zg6Pu5ofBvx6uLmjs0Rgkwm3
         RGZBAJHN+H6TM6y7MyeK7g72TyY/KFNyVdQFXDa6zItPmXtQGPY8S05iEwsTdyAAJ9yQ
         l07Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ni0IT5CW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x1-20020a0ce241000000b006418d1582b2si5824502qvl.392.2023.08.22.04.45.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 04:45:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ni0IT5CW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYPor-0003Uk-3r; Tue, 22 Aug 2023 07:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qYPon-0003UE-Bg
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 07:45:06 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qYPoi-00066W-MQ
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 07:45:03 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-51cff235226so9043034a12.0
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 04:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692704698; x=1693309498;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NrQ0nn/R+ah4RfL4YqoGKD8z4L73n4KEcrCq0geYfv0=;
 b=Ni0IT5CW+haVBHOuKiICtnG5pAUT8jfczPf/ScQX80Z952HQWBBtWUKVeWssCCNwt8
 /rRrtLKNeteXofO+FxOqWzYVr5VHyEswK0xXdu0AaeWwnIgHlevgSPAQZys0misY4E1s
 B35Q73qYOretcZypL9m9Oseahh0tlrwAy5XeOk61CqA7IIzTrI5V8bi31Do/6/4a2HQz
 3APwRGrFBhiKWTf6uIzLEO+sd7AwnmSpSIqRrKwVhsUXpZ1pvpj/DEAgMLddYucbSAfp
 upaG8Lx9LHv86jssCcorJkr9Br7d5g0SFiFMPSc+aMzew9qLQ3A9yjNWYC/doOxgdrRb
 K20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692704698; x=1693309498;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NrQ0nn/R+ah4RfL4YqoGKD8z4L73n4KEcrCq0geYfv0=;
 b=gOR+u5B31Ou4ViYXCepgiOXPSNvBEUj/AWcrHnaNn30iVsj+e6QbIAdaK0OtmpGSrs
 uOv30kC9uIFNqpEm8eKMPMPcUd5xt9nkWr451iikgTs+POJvZ3IhZSORHaKEqs37Cd/n
 3xX43udcLFi2OaSP7lvnGvCItMxXlbwKEqB9ceAQwrC1togsMRIg2igmnVGqIA2t2ioU
 IDoGwRAtv7vkBAeve/lWpMrghwjUUkEXSVT1cUQjpeOAohXQmmZahI3a+ZtTOffwNTQl
 mTLIEqzb5NrR9H9qJ/xikErJ6MmiUTNw56oyXY2+qjP/8GxsBYFXmX3h1zlYF+rGr+TY
 xAAA==
X-Gm-Message-State: AOJu0Yx+Vt9B6sTeasBuoLA6lHjO2Gii9ntFi3sACZJ0dfJw+EbRZprk
 zf2IhzzWv2M/wD/6JPkDX5ZteXT0upuq/hKQEt7PCA==
X-Received: by 2002:a05:6402:348b:b0:522:ab20:368a with SMTP id
 v11-20020a056402348b00b00522ab20368amr10369244edc.13.1692704697794; Tue, 22
 Aug 2023 04:44:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230822110129.41022-1-philmd@linaro.org>
 <20230822110129.41022-3-philmd@linaro.org>
In-Reply-To: <20230822110129.41022-3-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Aug 2023 12:44:46 +0100
Message-ID: <CAFEAcA-36XE-9ikSp0F4EMUKysz=ms2JyLCc8GOWcgJq3sb=hw@mail.gmail.com>
Subject: Re: [PATCH 2/6] target/cris: Use hswap_i32() in SWAPW opcode
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>, 
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 qemu-arm@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Song Gao <gaosong@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: joKj1zMszaG2

On Tue, 22 Aug 2023 at 12:01, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Commit 46be8425ff ("tcg: Implement tcg_gen_{h,w}swap_{i32,i64}")
> introduced the generic hswap_i32(). Use it instead of open-coding
> it as t_gen_swapw().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  target/cris/translate.c         | 14 +-------------
>  target/cris/translate_v10.c.inc |  2 +-
>  2 files changed, 2 insertions(+), 14 deletions(-)
>
> diff --git a/target/cris/translate.c b/target/cris/translate.c
> index 42103b5558..925ed2c6f6 100644
> --- a/target/cris/translate.c
> +++ b/target/cris/translate.c
> @@ -399,18 +399,6 @@ static inline void t_gen_swapb(TCGv d, TCGv s)
>      tcg_gen_or_tl(d, d, t);
>  }
>
> -/* Swap the halfwords of the s operand.  */
> -static inline void t_gen_swapw(TCGv d, TCGv s)
> -{
> -    TCGv t;
> -    /* d and s refer the same object.  */
> -    t =3D tcg_temp_new();
> -    tcg_gen_mov_tl(t, s);
> -    tcg_gen_shli_tl(d, t, 16);
> -    tcg_gen_shri_tl(t, t, 16);
> -    tcg_gen_or_tl(d, d, t);
> -}
> -
>  /*
>   * Reverse the bits within each byte.
>   *
> @@ -1675,7 +1663,7 @@ static int dec_swap_r(CPUCRISState *env, DisasConte=
xt *dc)
>          tcg_gen_not_tl(t0, t0);
>      }
>      if (dc->op2 & 4) {
> -        t_gen_swapw(t0, t0);
> +        tcg_gen_hswap_i32(t0, t0);
>      }
>      if (dc->op2 & 2) {
>          t_gen_swapb(t0, t0);
> diff --git a/target/cris/translate_v10.c.inc b/target/cris/translate_v10.=
c.inc
> index b7b0517982..0ff15769ec 100644
> --- a/target/cris/translate_v10.c.inc
> +++ b/target/cris/translate_v10.c.inc
> @@ -506,7 +506,7 @@ static void dec10_reg_swap(DisasContext *dc)
>      if (dc->dst & 8)
>          tcg_gen_not_tl(t0, t0);
>      if (dc->dst & 4)
> -        t_gen_swapw(t0, t0);
> +        tcg_gen_hswap_i32(t0, t0);

Both these are operating on TCGv, not TCGv_i32, so I think this
should be tcg_gen_hswap_tl(). (Compare the tcg_gen_not_tl()
calls.)

>      if (dc->dst & 2)
>          t_gen_swapb(t0, t0);
>      if (dc->dst & 1)

thanks
-- PMM
