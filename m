Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1178499ejb;
        Thu, 23 May 2024 09:29:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXYpuBTbBvd3sX6VvgM9ki3TIEVslponcKnY7eex5267Tve9ot0PR5uGnATSaf4gh8bNeNaz3EQOC4OAloZC11Ny8Xu1zSu
X-Google-Smtp-Source: AGHT+IHWVeN9IWNvhybPtazzp+S5KP3wL8PQUdZbd7muQoGbszEkR+hJK12nSEnAUfa5844vrE2n
X-Received: by 2002:a05:6870:9a11:b0:23e:8a6b:6acf with SMTP id 586e51a60fabf-24c68ab0c16mr5581425fac.32.1716481783203;
        Thu, 23 May 2024 09:29:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716481783; cv=none;
        d=google.com; s=arc-20160816;
        b=A1jFntKMMY+8T5hAXIi70XhcrchJDqVFCNQWLPQhE8Aqvq8asg7LhWnKd87aYGyHZf
         b8gQZerIdRrg+cByi9omeNK12UCiNzBYUFKxqhoMrjpEEmEvaemfpew0QIk08ZYHBPiQ
         tYAsUX7w1GDTUvTRJol3JP/Q9q+XGmeNqj1WgCg0WijdOzUCjUo/96PPSSS0z+DBs3Ip
         c80GOhYSqlgzCRrh52MNEtQU5weUPjr2AGsQkrOQnns4fcvDssiSIn8PGPTy6p2eFMVC
         l1sVZ7imY2J/Hb5r55Pv134HLP9CQEBHc0LAhd3+gd2gj+/jnbGzZv+mqttKwhU0EVfN
         FbFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=WjETyjrfThdWJ6XZACIryPyXtUeRjsjpNxtdDIp7xkA=;
        fh=37ygniCEBiPQJm0fHbTGx6JNgVlgPPmnqR2FREyWjyQ=;
        b=DzObDQvYlPRCXf3OPthZmKYw+UzKYF6BbK52nfB/UqNeysz33jLIOj9ldFeq5hSS4y
         KwpyaQveohprt48acRbEOoOmeGB0Vv4gF/COG8R+kLiZWmNLXm1+CKyvPjYqV8+Ri906
         rrcfn+U+VQs6bQpQoGRfy3vFG+nuU4s63MjizRAbC3/07QbZJrLA9DxlaptZbc9DUYkZ
         m31IvIoNRzZIuP2nvPAC9J+PtHp968CUF0hvXlbfY4nWOgYqFIpnN2u8t/X4AE4ayYSg
         lN4b8JO83MtgtdxDSHiD8t5iJCbNMQ391g+LxTfBJsgXEUe40pggNVTbQ5vZ9IrO/IjB
         uABw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="NG+p/QP+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43df8f159a9si27476211cf.239.2024.05.23.09.29.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 09:29:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="NG+p/QP+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sABJt-0007g5-V2; Thu, 23 May 2024 12:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sABJs-0007em-Af
 for qemu-arm@nongnu.org; Thu, 23 May 2024 12:29:32 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sABJq-0004so-6o
 for qemu-arm@nongnu.org; Thu, 23 May 2024 12:29:32 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-571be483ccaso11560178a12.2
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 09:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716481766; x=1717086566; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WjETyjrfThdWJ6XZACIryPyXtUeRjsjpNxtdDIp7xkA=;
 b=NG+p/QP+pE2KT8AUeP2S0I3G0lnpbMosPzd47qKiYI0AMrhBsHBmYOPfVf6ymSxI5X
 HHYmQX77AnLCjt2fgCHxz4rKe/dKKJbsIzjXd14ZsAr6gNxNoNa3aZcgPovg/XPUIlWP
 28o91Cccg9ZGkKsJ7L+5UUTicGQl2cLmm0+1JBN88np7pGsPEIxOp7C/qMM3SdD6r2FF
 weFhvVE51K9jnbm21Zt7agdJWNDrF74bEmZk5bGtDNIuctc6Z+wfTqv6gbJf9UiqM8vY
 +8zGw8FK1rdQrEw5ptmN8OcKLLEDbhTpMGqMc6KgsAk7dPvZpuVT67NCVgkviYJlRaRL
 HRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716481766; x=1717086566;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WjETyjrfThdWJ6XZACIryPyXtUeRjsjpNxtdDIp7xkA=;
 b=lMBE0DlgqieL8SCOtWeAUdc6YV9B0OmHbJ3cr/IdaOIv9s3mZ22BaS3eEnIJGolKGj
 zZ5YHzR9tup9bKisJbygDWmz/uslqMnCcI3gmbb++/4UILBYszrVIqsnQe+b0HW//lp5
 7ojdewNkuy6WGAqMH09PB93E2fyJb6pvPJKlOAh1EvSYi98sEVZcd9NNzDHYgNJZmC+c
 P4j+/d3eg9DBOJ4VmiVtH3EyjyZ3lZj5Am/q547OkYZ5o/4hHzCQnMP+Hr+g3MQpUJqD
 l3K00PVVOdLHb/D8JkeUkirKTIJcJXkr/WdbROqQ24pp7YnKyEiH6xjb6JD6O/FYtS3+
 zCDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpup1hI91okQAxx1yWJTiUO23bgzd2H4zAmtwYrerXvgZe1qXqZz/0hFGdFkFEIJsdEyw0+S5WCg2KpuvaaFFeYauf
X-Gm-Message-State: AOJu0YyHkplrHzEpWJxldMsrc6HUlr3SnMveTeBofBmksOGJbYdR5C7v
 WyKNpk5qOHyw+ZDZDiOHOKi+rIe93jpPckQaJQVeAnXJ0ttbJWA5LkT/RpfQ7JW7dEm4f7TItwQ
 jM9RxlARKkV13nt41dM5TFkda/o6oiy/Ns8Slqg==
X-Received: by 2002:a50:d5dc:0:b0:572:a167:65c6 with SMTP id
 4fb4d7f45d1cf-57832ac45abmr3140183a12.25.1716481766073; Thu, 23 May 2024
 09:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-16-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2024 17:29:14 +0100
Message-ID: <CAFEAcA-cc0NhU728ysdsq9QSaF7D487onvG1cbcKH4wvQG+nAg@mail.gmail.com>
Subject: Re: [PATCH 15/57] target/arm: Expand vfp neg and abs inline
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QLMvA5YIjwnd

On Mon, 6 May 2024 at 02:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h            |  6 ----
>  target/arm/tcg/translate.h     | 30 +++++++++++++++++++
>  target/arm/tcg/translate-a64.c | 44 +++++++++++++--------------
>  target/arm/tcg/translate-vfp.c | 54 +++++++++++++++++-----------------
>  target/arm/vfp_helper.c        | 30 -------------------
>  5 files changed, 79 insertions(+), 85 deletions(-)


> +static inline void gen_vfp_absh(TCGv_i32 d, TCGv_i32 s)
> +{
> +    tcg_gen_andi_i32(d, s, INT16_MAX);
> +}
> +
> +static inline void gen_vfp_abss(TCGv_i32 d, TCGv_i32 s)
> +{
> +    tcg_gen_andi_i32(d, s, INT32_MAX);
> +}
> +
> +static inline void gen_vfp_absd(TCGv_i64 d, TCGv_i64 s)
> +{
> +    tcg_gen_andi_i64(d, s, INT64_MAX);
> +}
> +
> +static inline void gen_vfp_negh(TCGv_i32 d, TCGv_i32 s)
> +{
> +    tcg_gen_xori_i32(d, s, 1u << 15);

Just noticed something here -- we take a 32-bit input,
so if there is junk in the top half, we will leave it.
In contrast the old helper function:

> -dh_ctype_f16 VFP_HELPER(neg, h)(dh_ctype_f16 a)
> -{
> -    return float16_chs(a);
> -}

passed the value through the float16 type which the
float16_chs() function passes and returns, which is
a uint16_t. So it will zero out the top half, which
I think is the semantics we want for halfprec ops.

Maybe

static inline void gen_vfp_negh(TCGv_i32 d, TCGv_i32 s)
{
    tcg_gen_xori_i32(d, s, 1u << 15);
    tcg_gen_ext16u_i32(d, d);
}

?

There are probably places where the zero-extend
is redundant, but there are definitely places where
it is not, eg A32 VFP vneg.f16, because do_vfp_2op_hp()
doesn't do a "load a 16 bit float value", it does
vfp_load_reg32(), which is just a ld_i32.

Or we could change the VFP codegen to work like the A64
codegen, which has a read_fp_hreg() that does a
ld16u to read the input value.

gen_vfp_absh() doesn't have this problem because the
AND operation clears out the top half anyway.

thanks
-- PMM
