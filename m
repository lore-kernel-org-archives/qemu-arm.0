Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp529660ejc;
        Fri, 1 Sep 2023 03:47:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGek/m+lIG3Dcj8MCh1tCuDbU6HvEfeAIUyBsL9HoGN92qJde8fJQxd0NO9Y15rVTM1O7ie
X-Received: by 2002:a05:622a:294:b0:412:2b52:d21e with SMTP id z20-20020a05622a029400b004122b52d21emr3405900qtw.10.1693565230444;
        Fri, 01 Sep 2023 03:47:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693565230; cv=none;
        d=google.com; s=arc-20160816;
        b=nnYSASOyNa3bmERSnbffOIeoKMo20K/Kou4FiqQ+wTK5kBpGsI5U4eamWeseLS0YfX
         R7UG7ZpfhrQKKQxraVaY2gT1CkUsm9ypBCZDHIhKcxNII8yI8rOEjesT6QJwEXm8S3XF
         WjPOslLKyd0hNco7eO34Fh5ErlmsD1ZicYKaOgJVDij0nZWOjG5MLp+6ESAd2TnjJ+od
         W58cMy6LeEGQXqfOQAcWRjQeUfAfdrGNd0EyXc+b9+6AxOQy4SvKjEUA/w5Cbg59tDbq
         dvYlOZV/wHv7S7fxVzYPNN6paijcISakdP7DhExDbuAECFt5+8egopH2ZBuXiHc308AG
         id/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=uwsaLX6raeY8tGZgGItUmuVH7mgRE4z3Rq6Kw2fySHg=;
        fh=wZ75gK4WnMSHMVE0UTOGuCp4NrVgkw0b5BEi9eukt/s=;
        b=TjITNQBAumIBWKfT1mCk7HpXg/K6lnMPrA9Rx5bEokOrNhBqG6adLyQBGcsCJOLeKF
         NkYOxmkSIHTAfPrnjPkiL78BwnICAISBiuwJPFwrZmsg7wZRwu4nmmiz5t2kxAvE2nWd
         Tz4zMR1fjzj5Kwda6k174rMdNZCDJldpgepr00toHiZGSma8BV3q/7SpUh1sbkR5Urh4
         VWDn8YbBOXuQVflvLzbN/PkIRnone9cI9+Sa3PE3U46OZexxpYphCYpKW+uzNjC7140I
         vNjwX1MILlSbgOV0sMeRCq4zf0w4GBLuQHqWTqXdnVh0OEcF41OeEGqAQqfknMjDQgQi
         HWvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MQd/rli+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z20-20020a05622a029400b0041006e79194si2115060qtw.691.2023.09.01.03.47.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Sep 2023 03:47:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MQd/rli+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qc1fj-0001xt-1Q; Fri, 01 Sep 2023 06:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qc1fi-0001wR-6K
 for qemu-arm@nongnu.org; Fri, 01 Sep 2023 06:46:38 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qc1ff-0001OF-CD
 for qemu-arm@nongnu.org; Fri, 01 Sep 2023 06:46:37 -0400
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2bcc846fed0so31284451fa.2
 for <qemu-arm@nongnu.org>; Fri, 01 Sep 2023 03:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693565193; x=1694169993; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uwsaLX6raeY8tGZgGItUmuVH7mgRE4z3Rq6Kw2fySHg=;
 b=MQd/rli+97zCnldETU/f/tlEIdvB6b/xO5ZD/FNGRaYc0LT+Z168GLOkdVVC+3O9IY
 YYu3LW0M1e4zWwt/1jr6YyhDbt6GHUkywMcrncQ59sJ2IoaAYHe9Drboej7R2RnuR/MU
 Y2M05W9wFpZ+na2PhG+0BPf/sqmFoWzxc/B2xlCOBgHfZJQXrGo2yMQJfnPeMInyot1q
 ubEaGGDXkppDYmXEVshem1Od+pmZNPUK4QbHvehCSUpxaWCmF7ibny0xcAvu+NYhJKmu
 pGDeBTBHrhtQPaljsiFgPwvxfiS0JNiTiJAeAgRE3zuTt5QRQ3gd5E/la/gk5gFKQ0Mv
 f5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693565193; x=1694169993;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uwsaLX6raeY8tGZgGItUmuVH7mgRE4z3Rq6Kw2fySHg=;
 b=lxzhXU/F1RfKucrUdKWqYM6ymFLuxGfQPvzjmxK8v02Xc3iIiglNoiMZWI9y/nF3gO
 Rc/hnch2XQY0YRty1Z2EwgDGgz6melDyCF0GXQgugJAnqnrjgJsBl5hPQ4XZYWsbLDr8
 394QVY1P9HUD/cBHvt0w+aF4ErN24M5zm4styJB1e7nIyP2KvkNmxMc0pWKwOJNhY3rG
 FmC0btHJyvXiSLnsVuqww6DWE1+XU2T+Il7mefkFGn235E+i7sS3i/DpGuu0OHGTcy8P
 uhPqXW15nLWoG7u0eLEmDNpUah3cQRBbpkIO0FpScpNvOLSY1u4iaRRVR0NLJsPNCyRx
 d+bg==
X-Gm-Message-State: AOJu0YwEo1TH8ZQ8w+whWKi9iEoppVx7OTa3/4kvHBW1vAHt1BgXGXkd
 ZWV/+nW9lTrbzqpEK+VM2PNUQ4EB0pPR9OYoFfRR2Q==
X-Received: by 2002:a19:7706:0:b0:500:bf56:cca6 with SMTP id
 s6-20020a197706000000b00500bf56cca6mr1107347lfc.53.1693565192677; Fri, 01 Sep
 2023 03:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230831225607.30829-1-philmd@linaro.org>
 <20230831225607.30829-3-philmd@linaro.org>
In-Reply-To: <20230831225607.30829-3-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Sep 2023 11:46:21 +0100
Message-ID: <CAFEAcA_e+fU6JKtS+W63wr9cCJ6btu_hT_ydZWOwC0kBkDYYYQ@mail.gmail.com>
Subject: Re: [PATCH 02/11] target/arm: Clean up local variable shadowing
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, 
 qemu-block@nongnu.org, David Gibson <david@gibson.dropbear.id.au>, 
 Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x236.google.com
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
X-TUID: s4dXrVaubNoD

On Thu, 31 Aug 2023 at 23:56, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Fix:
>
>   target/arm/tcg/translate-m-nocp.c:509:18: error: declaration shadows a =
local variable [-Werror,-Wshadow]
>         TCGv_i32 tmp =3D load_cpu_field(v7m.fpdscr[M_REG_NS]);
>                  ^
>   target/arm/tcg/translate-m-nocp.c:433:14: note: previous declaration is=
 here
>     TCGv_i32 tmp;
>              ^
>   target/arm/tcg/mve_helper.c:2463:17: error: declaration shadows a local=
 variable [-Werror,-Wshadow]
>         int64_t extval =3D sextract64(src << shift, 0, 48);
>                 ^
>   target/arm/tcg/mve_helper.c:2443:18: note: previous declaration is here
>     int64_t val, extval;
>                  ^
>   target/arm/hvf/hvf.c:1936:13: error: declaration shadows a local variab=
le [-Werror,-Wshadow]
>         int ret =3D 0;
>             ^
>   target/arm/hvf/hvf.c:1807:9: note: previous declaration is here
>     int ret;
>         ^
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  target/arm/hvf/hvf.c              | 1 -
>  target/arm/tcg/mve_helper.c       | 8 ++++----
>  target/arm/tcg/translate-m-nocp.c | 2 +-
>  3 files changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 486f90be1d..20d534faef 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1933,7 +1933,6 @@ int hvf_vcpu_exec(CPUState *cpu)
>          uint32_t rt =3D (syndrome >> 5) & 0x1f;
>          uint32_t reg =3D syndrome & SYSREG_MASK;
>          uint64_t val;
> -        int ret =3D 0;
>
>          if (isread) {
>              ret =3D hvf_sysreg_read(cpu, reg, rt);

I'm not sure this is correct.

The hvf_vcpu_exec() function is not documented, but in practice
its caller expects it to return either EXCP_DEBUG (for "this was
a guest debug exception you need to deal with") or something else
(presumably the intention being 0 for OK).

The hvf_sysreg_read() and hvf_sysreg_write() functions are also not
documented, but they return 0 on success, or 1 for a completely
unrecognized sysreg where we've raised the UNDEF exception (but
not if we raised an UNDEF exception for an unrecognized GIC sysreg --
I think this is a bug). We use this return value to decide whether
we need to advance the PC past the insn or not. It's not the same
as the return value we want to return from hvf_vcpu_exec().

So I think the correct fix here is to retain the variable as
locally scoped but give it a name that doesn't clash with the
other function-scoped variable.

> diff --git a/target/arm/tcg/mve_helper.c b/target/arm/tcg/mve_helper.c
> index 403b345ea3..32087b6f0a 100644
> --- a/target/arm/tcg/mve_helper.c
> +++ b/target/arm/tcg/mve_helper.c
> @@ -924,8 +924,8 @@ DO_1OP_IMM(vorri, DO_ORRI)
>          bool qc =3D false;                                              =
  \
>          for (e =3D 0; e < 16 / ESIZE; e++, mask >>=3D ESIZE) {          =
    \
>              bool sat =3D false;                                         =
  \
> -            TYPE r =3D FN(n[H##ESIZE(e)], m[H##ESIZE(e)], &sat);        =
  \
> -            mergemask(&d[H##ESIZE(e)], r, mask);                        =
\
> +            TYPE r_ =3D FN(n[H##ESIZE(e)], m[H##ESIZE(e)], &sat);       =
  \
> +            mergemask(&d[H##ESIZE(e)], r_, mask);                       =
\
>              qc |=3D sat & mask & 1;                                     =
  \
>          }                                                               =
\
>          if (qc) {                                                       =
\

The commit message doesn't list an error message relating to
this change and it's not immediately obvious to me what 'r'
would be shadowing here.

> @@ -2460,7 +2460,7 @@ static inline int64_t do_sqrshl48_d(int64_t src, in=
t64_t shift,
>              return extval;
>          }
>      } else if (shift < 48) {
> -        int64_t extval =3D sextract64(src << shift, 0, 48);
> +        extval =3D sextract64(src << shift, 0, 48);
>          if (!sat || src =3D=3D (extval >> shift)) {
>              return extval;
>          }
> @@ -2492,7 +2492,7 @@ static inline uint64_t do_uqrshl48_d(uint64_t src, =
int64_t shift,
>              return extval;
>          }
>      } else if (shift < 48) {
> -        uint64_t extval =3D extract64(src << shift, 0, 48);
> +        extval =3D extract64(src << shift, 0, 48);
>          if (!sat || src =3D=3D (extval >> shift)) {
>              return extval;
>          }

These two parts are good, but one of them is missing from the
listed error messages in the commit message.

> diff --git a/target/arm/tcg/translate-m-nocp.c b/target/arm/tcg/translate=
-m-nocp.c
> index 33f6478bb9..42308c4db5 100644
> --- a/target/arm/tcg/translate-m-nocp.c
> +++ b/target/arm/tcg/translate-m-nocp.c
> @@ -506,7 +506,7 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int=
 regno,
>
>          gen_branch_fpInactive(s, TCG_COND_EQ, lab_active);
>          /* fpInactive case: reads as FPDSCR_NS */
> -        TCGv_i32 tmp =3D load_cpu_field(v7m.fpdscr[M_REG_NS]);
> +        tmp =3D load_cpu_field(v7m.fpdscr[M_REG_NS]);
>          storefn(s, opaque, tmp, true);
>          lab_end =3D gen_new_label();
>          tcg_gen_br(lab_end);

This one's right too.

thanks
-- PMM
