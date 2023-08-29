Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3659724ejc;
        Tue, 29 Aug 2023 06:21:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFW68rkEHP7JtBNjrIIn+5dlzmGm8cJPQtFlpLuDO4aAtBlbm1Tj3i7x2e3F+mUotjtLM5i
X-Received: by 2002:a05:622a:594:b0:410:bc4:d7be with SMTP id c20-20020a05622a059400b004100bc4d7bemr33648698qtb.31.1693315303019;
        Tue, 29 Aug 2023 06:21:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693315303; cv=none;
        d=google.com; s=arc-20160816;
        b=0NUwE/J3HFeit750hf+JwbedSnt+B3fg5/yDk0DseRztHKGSV/n0UsWU3WINjVXd7X
         AdJEb9WMZqOdo9E3Q4bZaDUDXdS5v3KKMqGyQMP1Zq2cuVDrW0H5+kEjCUTpzFEvcXvg
         Y2IfJp/RoE7nAbzVzUMHyRk8KYm6Ce9AtLNGPR3/zEgeCBLZ8OYKNzhHK7T0BQ49DTgf
         HFgCva/uYB9kCzryJZ34zTUE0nZ/CO9ABfFWeZN7lsiS6FVdlPs8PR7yASjwdJEyxRFe
         kFHlic7wC5LqStuG8iflzZrlIvw7Drx2nGzZeEkW3FIKqiU/4wP/yONq7WyBy7srDIkG
         j/1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=pIaXhqvjX6xMFpNg8SHdTT6gdjOJPQH2OOxiQdoGFyE=;
        fh=ZunbYo7vBCjqSWc9622LTLPHQcfFJMelhG0lIzAt0Bo=;
        b=Ju91P3d/525d86JQCgkrWswUR9zz0sRqOPPV0FP7+5YncuN7DOyHhZmVTHt1vHzSad
         Bt7Edl3sZmMFuidxkBtkNfvCSPnZt+MhNGfZrR2YvfPIbRmovFivvs5nZUqzN7lR5O5S
         9wswBoj6jTfsd/HQXU0xS0s5hcHeGMBGs3JLojp+n1HgmJ/pfIcaSvoO4bjX/tQaIp+A
         POZ7O1CfdQcL5zTAl4cCW9dmWgNt1QSgwvkQznoRPP8ei+sblEZcqj3ha0jsUv1aoO/j
         SLT0Z3haIc1mHTJ8PVzoIOg9CKsi1842Qgv/Gfdr7TxMg55zKLvf6VYf9V8B2tUEc1SB
         PpjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Q0KYQ+/8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4-20020a05622a190400b004108aee38e8si6201204qtc.122.2023.08.29.06.21.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 06:21:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Q0KYQ+/8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qayeg-0003xd-HH; Tue, 29 Aug 2023 09:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qayee-0003vZ-O4
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 09:21:12 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qayeb-00031j-1Q
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 09:21:12 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5009969be25so6894710e87.3
 for <qemu-arm@nongnu.org>; Tue, 29 Aug 2023 06:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693315267; x=1693920067;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pIaXhqvjX6xMFpNg8SHdTT6gdjOJPQH2OOxiQdoGFyE=;
 b=Q0KYQ+/8lKMhyTX6oKfoJq6/k17gRecXkn7MR9Vl/g+DIrxWpDNWktBM7z3Dv5WdKS
 aenijnPbjpWH7/0Fuj6yGLEg/dA6EMzfqVr+fE1YJNsMVE4SdJsWvDSqx2diklxR1sKa
 2iIH2yBsCPK9O7yz7Wepc3zRO6kg9C5mvblALM0g8pqxc/SLl92wRRaX4wINBouOEP+2
 2NDWLjMyaxJTjfWqhffSEFdzk6Kc1HI2qSLfEhvS7qRPftT5pjby7qtnPb+2RFGKnPt/
 z9Hm+ZGWuMMHQBqP6cwns+ndNp136YCaLviIj/EMhZ0UVzKkL68XLzMu150u9cNbvJBm
 o/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693315267; x=1693920067;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pIaXhqvjX6xMFpNg8SHdTT6gdjOJPQH2OOxiQdoGFyE=;
 b=Q5f0eSCMAVdoYmdVxr9+vwKy75QHNd0B72BhcKanE2jqbS6fbkaYdp5sqPm0pCf+H6
 0tIviXZHkIF7a1tTXMJalpsAN3WRk91HbfQrOtFfILfhZRgDmvWxRhbbpUDzwhwHuQU8
 xiBx9KcAxwuYp4QLtjCxMU0QRJm1J+7qFfsU4pALT5iDSV5H7NLM2olLCatqeMOkPLu/
 H99gDbtf9k5NAyJqDD6XBNEQqY0F+Qn8G6VihvF5CS7GvKJw9K97K7/sp/xABIF1XJ45
 sH291+vJguSgpU1d+gwD7AxofKN3PX7NSyhmycbrchWSM9wY3jpAGcaMMGHa3Nf7tP7S
 7qIw==
X-Gm-Message-State: AOJu0YxDAUdEpwH2XDaWJnV+H/dNIFA8Aj8jDehUin94YqmH/0D1Sezw
 KYdesnAh3UUj5OXE4w/dfqPb4/adqMitblkkLuMDjg==
X-Received: by 2002:a05:6512:3701:b0:500:b7dc:6c90 with SMTP id
 z1-20020a056512370100b00500b7dc6c90mr4198064lfr.36.1693315266838; Tue, 29 Aug
 2023 06:21:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230822095156.39868-1-philmd@linaro.org>
In-Reply-To: <20230822095156.39868-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Aug 2023 14:20:56 +0100
Message-ID: <CAFEAcA8CWDg8cBjr_KJdTE2AvvdksU7jGhfHp5sdQU7FHbAb4w@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Use deposit_z() in BCF opcode
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12b.google.com
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
X-TUID: UOjjjXg1GSh7

On Tue, 22 Aug 2023 at 10:51, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> When clearing a bitfield we don't need to lead the

"load" ?

> source register. Use deposit_z_i32() with the BFC
> opcode to save a load_reg() call.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  target/arm/tcg/translate.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
> index b71ac2d0d5..1a6938d1b3 100644
> --- a/target/arm/tcg/translate.c
> +++ b/target/arm/tcg/translate.c
> @@ -7255,7 +7255,7 @@ static bool trans_UBFX(DisasContext *s, arg_UBFX *a=
)
>  static bool trans_BFCI(DisasContext *s, arg_BFCI *a)
>  {
>      int msb =3D a->msb, lsb =3D a->lsb;
> -    TCGv_i32 t_in, t_rd;
> +    TCGv_i32 t_rd;
>      int width;
>
>      if (!ENABLE_ARCH_6T2) {
> @@ -7268,15 +7268,14 @@ static bool trans_BFCI(DisasContext *s, arg_BFCI =
*a)
>      }
>
>      width =3D msb + 1 - lsb;
> +    t_rd =3D load_reg(s, a->rd);
>      if (a->rn =3D=3D 15) {
>          /* BFC */
> -        t_in =3D tcg_constant_i32(0);
> +        tcg_gen_deposit_z_i32(t_rd, t_rd, lsb, width);
>      } else {
>          /* BFI */
> -        t_in =3D load_reg(s, a->rn);
> +        tcg_gen_deposit_i32(t_rd, t_rd, load_reg(s, a->rn), lsb, width);
>      }
> -    t_rd =3D load_reg(s, a->rd);
> -    tcg_gen_deposit_i32(t_rd, t_rd, t_in, lsb, width);
>      store_reg(s, a->rd, t_rd);
>      return true;

The comment says we are saving a load_reg() call, but the
code change doesn't seem to do that. Before the change:
 * for BFC we call load_reg for rd
 * for BFI we call load_reg for rn and rd

After the change:
 * for BFC we call load_reg for rd
 * for BFI we call load_reg for rn and rd

So we're not saving any load_reg() calls as far as I can see ?

-- PMM
