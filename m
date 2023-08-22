Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp663085ejx;
        Tue, 22 Aug 2023 04:58:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOP5dZvZYQWhxWLisR9Oevw1ia0iB+sLqbiHGdcJxObos5omLmW+T6lo8D5PA/mOaI/rzY
X-Received: by 2002:a0c:de08:0:b0:64f:4dbf:b21a with SMTP id t8-20020a0cde08000000b0064f4dbfb21amr1879733qvk.29.1692705482347;
        Tue, 22 Aug 2023 04:58:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692705482; cv=none;
        d=google.com; s=arc-20160816;
        b=grP3p9+0vewDmWosOyG8KRwK3lqNMvm8xw8g1NF7rgTu+4EeTRW7d6aMFKFc6qYUrC
         c4Y5TCTyYW2Q/albzSyNwTLNOk5DTV67qd17ncJ0zyM4eaifF1JABI3RSLtvmVExyBd2
         QzCt15jfHYdWCidf4MktDfzMotsf5yFd50c2Pcimp+lH0SxAsYfwHnH6KA79x46ZV4rv
         SZeHCGKGeO0BuEMiQqtGxPH3zwPCpRjYvg4C4jbRpB0fuvOa3yTS1W/oBfEYXgU3ElFQ
         dAzxCNfM1DY02jzlHKtNkXK32z7ryOSLVYoM9utQjRDa03qOjYUWJmdPWXoPr84wITL7
         wfiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=PgqrI3T3hOuQEDML+sVpS9zcCtCaRRyYRjkYaQ3SPyE=;
        fh=2n2TGmFa1ri6Gm+ryyd12WVJ0xNvvL53TsASRxKHK5I=;
        b=PNWesY1NnB3GbpIAgXMNVbQnxN2F0MBsdqVezRos4PsFd4t9ver+aMEfNj4iKuxtGS
         rB+r5HQO3JBarLRkDP3XNT3rRPqSQTPJIxEq8LpfNchz23hJYl0AnpwJaE/ls+PWpjw5
         wIfWf4SIykk9MRYTvVJ8y8WSzhNqJTEwPhbLAzqLeYdPQqxjpRXzDVIUFjk0o4wvzPv1
         1jlgJjGqzooDkvvXcvK2ZyNwGjLTe/fqRNu5s2h7j8lK1NbAanmHcpv2a9k6lntAd77E
         RDFGypwICTGUtKvvaG6vOjYNBuOwPX/MQas13o+ZiWXdof5NUWFmgJXLKgwZ2GZ5uRK8
         yG2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="lrTAwuF/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e24-20020a0cb458000000b00636497373d1si1117430qvf.483.2023.08.22.04.58.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 04:58:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="lrTAwuF/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYQ0o-0004R0-4T; Tue, 22 Aug 2023 07:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qYQ0n-0004QV-0v
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 07:57:29 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qYQ0k-0002eL-EJ
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 07:57:28 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5298e43bb67so7837404a12.1
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 04:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692705444; x=1693310244;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PgqrI3T3hOuQEDML+sVpS9zcCtCaRRyYRjkYaQ3SPyE=;
 b=lrTAwuF/+Sl4oKcU3i6cFc6QeCkvI2BhC38SUyxRy0hGgJdsG5pbkmKARH+v1UuHDf
 zzl3Sjb5lxfqdAQpHn4oS9whCll+X7oJs0ckmV4Fv9/Zwnz1Eyb3muS0kBV8wWH0lpHq
 FUFOmylitRh8SICa0CbqlI9HwteELoHiwVBKlcxVJ7ioaOIOL2DlZHs991ON1UefUjAI
 5EtHoGkWL8awLiZYRxFwXWAp1Ri2xFSylNMP2Dj6d0/MaRrFDjehXMAOYuvKsqSzQ1uG
 Q2fjdVmSDgdI3C05jSPglV+8Hl0bQcUK+xymbtABA8e4g/jsfsT7KnLDLgrPeFzFadGH
 4dMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692705444; x=1693310244;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PgqrI3T3hOuQEDML+sVpS9zcCtCaRRyYRjkYaQ3SPyE=;
 b=FxEvJ7WCThKd+aCV5tjcD0UBfzRtvRmTail8C4G7Ss7iWD88UOchV73IGvyaU3SOPX
 WtO9+nNTHCgozuS5nz4Vq5Iu3KNRYufYgKQyT2UbuG7B5zbdk3EfEjR/50OOclaUtp8N
 LOQlasp6lC0dWHsT3KmjtUFMyoYdC8UoHSc/vZd8qG8WpDuFi/osbn52gtJfzAJCaPJ4
 7kj0FZRna+tHeiuZaGpHM36hlyQ2LOE9NQzExamFAvRiQbay/mTUI9DaKc7XIvVQIU/1
 fymW64aTZvPtQH7GpUWDP0LKOU4HTXILzHpwsy+gWmKxR5/eZ8tEtXlawCMuzHOzM9yY
 W1ZQ==
X-Gm-Message-State: AOJu0Yx48XEbOs7Rr46HZ0196WAvlob18iVxiW5yYrz8ukIdmKAszWhh
 Ge2kXYnaM/4COg0T3+0pAn3kxqQ7hSxadudhkXLSTQ==
X-Received: by 2002:a05:6402:1d4c:b0:51f:ef58:da87 with SMTP id
 dz12-20020a0564021d4c00b0051fef58da87mr12708958edb.2.1692705444165; Tue, 22
 Aug 2023 04:57:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230822110129.41022-1-philmd@linaro.org>
 <20230822110129.41022-6-philmd@linaro.org>
In-Reply-To: <20230822110129.41022-6-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Aug 2023 12:57:13 +0100
Message-ID: <CAFEAcA-GJiVX5kbx58MNAHQ1z4-bJzjFzJsha_Lp7XB674-NUA@mail.gmail.com>
Subject: Re: [PATCH 5/6] target/mips: Use hswap_i64() in DSHD opcode
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
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
X-TUID: KlvYkWtKZZob

On Tue, 22 Aug 2023 at 12:02, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Commit 46be8425ff ("tcg: Implement tcg_gen_{h,w}swap_{i32,i64}")
> introduced the generic hswap_i32(). Use it instead of open-coding
> it in gen_bshfl().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  target/mips/tcg/translate.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
>
> diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
> index 9bb40f1849..4f34ea9b6a 100644
> --- a/target/mips/tcg/translate.c
> +++ b/target/mips/tcg/translate.c
> @@ -4948,19 +4948,7 @@ static void gen_bshfl(DisasContext *ctx, uint32_t =
op2, int rt, int rd)
>          }
>          break;
>      case OPC_DSHD:
> -        {
> -            TCGv t1 =3D tcg_temp_new();
> -            TCGv t2 =3D tcg_constant_tl(0x0000FFFF0000FFFFULL);
> -
> -            tcg_gen_shri_tl(t1, t0, 16);
> -            tcg_gen_and_tl(t1, t1, t2);
> -            tcg_gen_and_tl(t0, t0, t2);
> -            tcg_gen_shli_tl(t0, t0, 16);
> -            tcg_gen_or_tl(t0, t0, t1);
> -            tcg_gen_shri_tl(t1, t0, 32);
> -            tcg_gen_shli_tl(t0, t0, 32);
> -            tcg_gen_or_tl(cpu_gpr[rd], t0, t1);
> -        }
> +        tcg_gen_hswap_i64(cpu_gpr[rd], t0);

We know that target_long here is 64 bits, but for consistency
with the rest of the function maybe tcg_gen_hswap_tl()
is better? I'm not sure...

thanks
-- PMM
