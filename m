Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp382853ejb;
        Fri, 8 Sep 2023 05:26:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLeAFfqiEQ4tKcBWOvNWtZpSRYXTMorUKgGL+inhUYi/t+Y7eSivgU4+sQYL6+m0vQGw8U
X-Received: by 2002:ae9:f30c:0:b0:76f:e36:28cf with SMTP id p12-20020ae9f30c000000b0076f0e3628cfmr2026793qkg.43.1694175986649;
        Fri, 08 Sep 2023 05:26:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694175986; cv=none;
        d=google.com; s=arc-20160816;
        b=xvSF17lcoJKZlXDBKr6R5k7FfAS1J4g7mvdYvlX/ZD9QI846RSvr8fyhY/bTNOLTYz
         c1co9TDbhWx6GUyYkPrGEnjKcJ2sAs/gdiw79OSpNYchzo9b4Us6KCeMq46sZfmLZd1n
         u2md6OJ0V1OH6LH+lQOqbOipPr50Kfu0hF0Yl7kTOT55gEjZf78mN+7MWCarNPGSXCbd
         jy2WN844Xh6dlSYt6gbnTxnfkUt6LBiNMnsF8RS/MknZHPOPKIrI9PWz3aZehCiC3YS4
         uFGGKQIUXHlhtaUTbq3ypY9eO54eCz/r64mqMJDRSHWzieCWH1bGisEZCWAH10CXtsPt
         iprA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=C5qABC+6qAZskwSAsfe9urrYr/WGts/zQ3PIA7K4Nzw=;
        fh=aHz6syCQoHT/Pm97nfFHBpS58CMkzBM/UCDaDK59fOY=;
        b=D71GVCwMbnaMPjmQ5Tqh6ktOp2ok+Z/ZHq2sPCHw7u017Rrm0aGLLjTypyb3eY52jR
         opO5UXvghqGkOFQGGT/FImeiG30W7ELgaawV4CGlfNyZff3gsgAZTp7NjfuT+GLvFuPW
         PygqlgxAyyCjnrEOI3O/0Wn9IGLRKO8clLFZ5to00Yzs+ZJJjIIFpk1dwa/3KDZCTKLG
         p+XYPZl6LWv+AiRjAUSJ777iPmR7Fvxzr6R5921/+AMW9x6i1j097kml9ufQ6T69l7Fi
         0rsAdzsV7vDkoPsUPIfORrwR4KDFv5BL+0URU1RJJ1qf9Jf0d/nSL51gJ+AT6kZFhEBC
         mAaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SsqJDudI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1-20020a05620a280100b00765a635ade2si1032587qkp.309.2023.09.08.05.26.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 05:26:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SsqJDudI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qeaYh-0003qH-Ew; Fri, 08 Sep 2023 08:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qeaYf-0003ov-4M
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 08:25:57 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qeaYb-0007hX-R1
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 08:25:55 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-500cfb168c6so3266825e87.2
 for <qemu-arm@nongnu.org>; Fri, 08 Sep 2023 05:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694175951; x=1694780751; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C5qABC+6qAZskwSAsfe9urrYr/WGts/zQ3PIA7K4Nzw=;
 b=SsqJDudIH8yvToCGW2LS8XPB7oBmyai3u/2KeYziihQxYk++bjA7lNybgeKrepN8fY
 xK696ub2Ab/opXdGfbW46wLFWClE0AQ1s0W+eB9D8FGDzwubJ+nxkG3jfrLkD8zsaDVq
 DkKDhERUmMRd31tfMpgOXmfRy9L3KdADb3pbaGwEU5oKSVnEFIJ4+nhb05i2ILaj4fgq
 2wsBolVpLATDcRR7YXboNn8q+DqZ7uRZsl1uyghk9ClUA81+n00f+Kkm/w2qNUahSDzs
 3Z2mc1yWEqlzsOQh5ymh8h9HO9tqcoaxXhZDz7P1jQhvx2ERNO1F9NkQohwZ1mHzGySb
 Q45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694175951; x=1694780751;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C5qABC+6qAZskwSAsfe9urrYr/WGts/zQ3PIA7K4Nzw=;
 b=LrXoSSDYAhHZ0VgOvrpyUEdTJh4ybRf+Ss6itgE+LpK9KxMBVM7mcc00U7aiUGf/ml
 +ngzUdvOv012JY6L2Xcbf88jgRcnralaXQ6OnFPgKzDPJJPxhOhTmesYgTmB7lGI+UuD
 1xjdffnfD2yvpu4CWw7oybir+XXCYIP2klhY9MXqC1ay+6uNNjYygIFDBnqBwfpBPClX
 b0Ts8EqjqmpDv8kNoUP0WMzVve5/TYfpQL7Z2yDR6M/E6dZzzzWJuTyvdSK5xZf46JMy
 Zrc86tYrh7ykRJDayH3ZwrfuIUmqjXk+9esCzN2aAsXqM3pfHOsPtipXTMKUNPXOFNUh
 QmXQ==
X-Gm-Message-State: AOJu0Yzuc5KOGOSHvwZ2Vmm2BBOHXuKLATPYG4bh7vMq55XjQhXvDtRe
 qqk8hpd9HwLT1o/A7irAbMY4e0qvBdh/UF7AnC+5KA==
X-Received: by 2002:a19:645c:0:b0:500:a00e:1415 with SMTP id
 b28-20020a19645c000000b00500a00e1415mr1299838lfj.35.1694175950514; Fri, 08
 Sep 2023 05:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230904161235.84651-1-philmd@linaro.org>
 <20230904161235.84651-3-philmd@linaro.org>
In-Reply-To: <20230904161235.84651-3-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Sep 2023 13:25:39 +0100
Message-ID: <CAFEAcA_E7M2-jtaaDsCZbb7MC+N62pNkLCbXqbfMkh3nJrkU2g@mail.gmail.com>
Subject: Re: [PATCH v2 02/22] target/arm/tcg: Clean up local variable shadowing
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x136.google.com
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
X-TUID: FXx4VqsKW7/9

On Mon, 4 Sept 2023 at 17:12, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Fix:
>
>   target/arm/tcg/translate-m-nocp.c: In function =E2=80=98gen_M_fp_sysreg=
_read=E2=80=99:
>   target/arm/tcg/translate-m-nocp.c:509:18: warning: declaration of =E2=
=80=98tmp=E2=80=99 shadows a previous local [-Wshadow=3Dcompatible-local]
>     509 |         TCGv_i32 tmp =3D load_cpu_field(v7m.fpdscr[M_REG_NS]);
>         |                  ^~~
>   target/arm/tcg/translate-m-nocp.c:433:14: note: shadowed declaration is=
 here
>     433 |     TCGv_i32 tmp;
>         |              ^~~
>        ---
>
>   target/arm/tcg/mve_helper.c: In function =E2=80=98helper_mve_vqshlsb=E2=
=80=99:
>   target/arm/tcg/mve_helper.c:1259:19: warning: declaration of =E2=80=98r=
=E2=80=99 shadows a previous local [-Wshadow=3Dcompatible-local]
>    1259 |         typeof(N) r =3D FN(N, (int8_t)(M), sizeof(N) * 8, ROUND=
, &su32);  \
>         |                   ^
>   target/arm/tcg/mve_helper.c:1267:5: note: in expansion of macro =E2=80=
=98WRAP_QRSHL_HELPER=E2=80=99
>    1267 |     WRAP_QRSHL_HELPER(do_sqrshl_bhs, N, M, false, satp)
>         |     ^~~~~~~~~~~~~~~~~
>   target/arm/tcg/mve_helper.c:927:22: note: in expansion of macro =E2=80=
=98DO_SQSHL_OP=E2=80=99
>     927 |             TYPE r =3D FN(n[H##ESIZE(e)], m[H##ESIZE(e)], &sat)=
;          \
>         |                      ^~
>   target/arm/tcg/mve_helper.c:945:5: note: in expansion of macro =E2=80=
=98DO_2OP_SAT=E2=80=99
>     945 |     DO_2OP_SAT(OP##b, 1, int8_t, FN)            \
>         |     ^~~~~~~~~~
>   target/arm/tcg/mve_helper.c:1277:1: note: in expansion of macro =E2=80=
=98DO_2OP_SAT_S=E2=80=99
>    1277 | DO_2OP_SAT_S(vqshls, DO_SQSHL_OP)
>         | ^~~~~~~~~~~~
>        ---
>
>   target/arm/tcg/mve_helper.c: In function =E2=80=98do_sqrshl48_d=E2=80=
=99:
>   target/arm/tcg/mve_helper.c:2463:17: warning: declaration of =E2=80=98e=
xtval=E2=80=99 shadows a previous local [-Wshadow=3Dcompatible-local]
>    2463 |         int64_t extval =3D sextract64(src << shift, 0, 48);
>         |                 ^~~~~~
>   target/arm/tcg/mve_helper.c:2443:18: note: shadowed declaration is here
>    2443 |     int64_t val, extval;
>         |                  ^~~~~~
>        ---
>
>   target/arm/tcg/mve_helper.c: In function =E2=80=98do_uqrshl48_d=E2=80=
=99:
>   target/arm/tcg/mve_helper.c:2495:18: warning: declaration of =E2=80=98e=
xtval=E2=80=99 shadows a previous local [-Wshadow=3Dcompatible-local]
>    2495 |         uint64_t extval =3D extract64(src << shift, 0, 48);
>         |                  ^~~~~~
>   target/arm/tcg/mve_helper.c:2479:19: note: shadowed declaration is here
>    2479 |     uint64_t val, extval;
>         |                   ^~~~~~
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
