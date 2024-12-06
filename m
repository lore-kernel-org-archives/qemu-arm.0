Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp971379njb;
        Fri, 6 Dec 2024 08:23:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX5IS5sFr/EEzYlBiUxPaOV27nXzL9zjoFP94nf70V6SBeajy93iCCsvdffK5Z+eYAND3aEForJzJ8mkQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG2okna9+EyUEzAXL1AAxKXg3IM5OSn+KvkHAWFEbP3LIlq9kSqoSS4Qw7JhjB5Lyo+Ofz+
X-Received: by 2002:a05:6122:4b0c:b0:515:5008:118d with SMTP id 71dfb90a1353d-515fc9dfdc9mr4556350e0c.2.1733502230745;
        Fri, 06 Dec 2024 08:23:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733502230; cv=none;
        d=google.com; s=arc-20240605;
        b=DJOrcOFjJSBJ4yEJS08qj4XJcpjRZHBPsM29d/3cP5MsFQJflijNEt7TLhOr5oxxCW
         Nz9odo2D4zwMqVsDoc+B+ugBz7koOyVIRlnnIzDdtmtM/DyI6tSrZmnG11B9isS350Ak
         Ql2Z7dgkVbkXBl99NkkAYO++L5k5TSypPnSe05VGVZvIrUVCAp8fg7/0sEnCfMS69aCg
         8OEbghWoZ0nBwuRv7rVC27bm52aLITNvnpbYiJFOk53LNSCA68rwtGxQsnB3D45T3a4P
         7pO1I9GYnpTAFEaRr5jI+EbRcyGAGtWaaj5TPOnLPZnRGpc3L5lDtGKQXlJgrBiji/3W
         b4EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=VN8H4a/ej0diCZx4UtFfJrU8VQ6J28t8MtBdVV2NU1s=;
        fh=kUXXMUw9sy0dG1pG3cW8sVLrDlIL3DVhMqKGWUWebNA=;
        b=MmeNe5R/05k0k1uahG5QBaA46S29vmM5XjN3pOV4MJVXdF8Shg1sAxcat63qlzi24l
         OlJb4JKaI7frtnTV9dzRyh2SrKqvUVifr2ff1BklPk9iGJodqLbqNsrm2IHtzjx+m+w/
         fBMlF4cauoeCbHG8YH+zXhe3ctUZFt20Mkwpn5wm9XMsCZu/Y76Pl1JNPIOekgds/XQ3
         Drgca+TERcLA09m37cEDmXajuT+vrLuKICE/LChICXl40gF3fClbukcyum/+PhC3tbgY
         1LErZbeCWvjQdbfqY3mQg2upXGcW8U3dB+fGCu7qDJioR9N2nZdIu0F5PFNx1MtQBWN6
         rmYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BjTuGzIJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-515eaf7b17bsi1441916e0c.250.2024.12.06.08.23.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 08:23:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BjTuGzIJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJb7E-0001vD-F5; Fri, 06 Dec 2024 11:23:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJb78-0001sc-CI
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 11:23:34 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJb74-0004sM-Rs
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 11:23:33 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5cf6f367f97so3218409a12.0
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 08:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733502209; x=1734107009; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VN8H4a/ej0diCZx4UtFfJrU8VQ6J28t8MtBdVV2NU1s=;
 b=BjTuGzIJT/BBRHYcSc7l3VwPCc4eZcXB/6RgJU8kK5Fmdctku6N3NyMvteZpxQ+qCP
 tTdkodjR/laM05BipIwjH+7vzVG7Zrbat1dGpJfaG4j4l0PdTa8phTIqPUoC46ndJc+r
 UNE0o7UuNFFXdNTAM4R1RiNwAAMkeGt0th4tRCTQPi1MeBh3CFba7h/chItDfbNfWXvh
 eNYEfmx1qVXaLYcn5/6rC0K73l+5Kmli8h676EZAmlX8zZU6tu8fB1dvu5JJ0A2QzOqt
 eWj/hfC2ssV6rTKFbzg6wnnKGKYN1e5tIV5wUbfb/vL/YIz7K9En2V9L2fcAGX5aszws
 npbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733502209; x=1734107009;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VN8H4a/ej0diCZx4UtFfJrU8VQ6J28t8MtBdVV2NU1s=;
 b=eTG7oWBJKw9DegJqkF7CLoxVXQ+T3FT40cT9u24IEuDmg6bNoMfK4qU5vFip3GfDu/
 e0+Su8Jg1EZCRlQ1a59tIVbxBdJirQFYUYlOjyol+nYgpd1uQqKJaOHIPrEf9FnAsG6n
 zyLyBkvjpza+h1vSL78vUyClw1iwy9oT4OsjlCiO3trBb3P9W03WCDhTY+kDD3YrnBjj
 h+KG25q9eKWORJSdzLTVz1ofenmW1XLcIdyoYQ4coSQcfkUnBkrm2VDeArdo826WpnXP
 rNCfFCZnbt3516AMCcUV8s60OT/TQNkt6FVckiQpCGArYEcNPeD1uBXJXgSns097Us9/
 w2QA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCQY7u4o0AzwWg1ZVLjSdzdPZcjxb07gtiHUh2OA5Qz17EzBAQjjHsX5UqgDzHar1vtdJMEKgrlA==@nongnu.org
X-Gm-Message-State: AOJu0YwYQyyx3gN4W5BP1nsXRTDUyaKdAWrmMBXrsjDbrQTTd7qnyI0+
 +6YzGwKAbpidaYdjgqUD0Aud1b9TvAyeUSgBUcAznENmQxAvBGEF2Pvq4IpjxwlxTH+Im7h+P7w
 FWdHdFiRWp+JMUwj+dr+soRoqWYmsXtCufE9w3g==
X-Gm-Gg: ASbGncu9myVfF7F1RtqkYEnvGi0Y9CjV0JZz59rsoc9bhWddQE+VBmO4x4nXAIydwof
 vHbWe0QvmDo1YErdlsUspzOWHl+6VFHnX
X-Received: by 2002:a05:6402:3888:b0:5d0:81af:4a43 with SMTP id
 4fb4d7f45d1cf-5d3be47b688mr4045433a12.0.1733502208677; Fri, 06 Dec 2024
 08:23:28 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-56-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-56-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 16:23:17 +0000
Message-ID: <CAFEAcA8GO=NjWpoOM7mG5j-+4JXfx5qEK1_YwQHNmuFt3yH=Ag@mail.gmail.com>
Subject: Re: [PATCH 55/67] target/arm: Convert FCVT* (vector, integer) scalar
 to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: iZ7E8389XAfU

On Sun, 1 Dec 2024 at 15:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Arm silliness with naming, the scalar insns described
> as part of the vector instructions, as separate from
> the "regular" scalar insns which output to general registers.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 135 ++++++++++++++-------------------
>  target/arm/tcg/a64.decode      |  30 ++++++++
>  2 files changed, 87 insertions(+), 78 deletions(-)
>
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
> index 98a42feb7d..ad245f2c26 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -8678,6 +8678,16 @@ static void do_fcvt_scalar(DisasContext *s, MemOp out, MemOp esz,
>                                   tcg_shift, tcg_fpstatus);
>              tcg_gen_extu_i32_i64(tcg_out, tcg_single);
>              break;
> +        case MO_16 | MO_SIGN:
> +            gen_helper_vfp_toshh(tcg_single, tcg_single,
> +                                 tcg_shift, tcg_fpstatus);
> +            tcg_gen_extu_i32_i64(tcg_out, tcg_single);
> +            break;
> +        case MO_16:
> +            gen_helper_vfp_touhh(tcg_single, tcg_single,
> +                                 tcg_shift, tcg_fpstatus);
> +            tcg_gen_extu_i32_i64(tcg_out, tcg_single);
> +            break;

This hunk adds calls to the toshh and touhh helpers,
but as far as I can see it doesn't remove any calls to
those helpers that were in the old decode functions or
any calls to the handle_simd_shift_fpint_conv() function
which was the only one that did call them. Should this
be in a different patch?

(Conversely, we remove calls to gen_helper_advsimd_f16tosinth
and gen_helper_advsimd_f16touinth but don't have those here.)

thnaks
-- PMM
