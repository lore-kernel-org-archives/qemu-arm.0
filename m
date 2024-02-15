Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp767675ejb;
        Thu, 15 Feb 2024 10:55:28 -0800 (PST)
X-Received: by 2002:a2e:879a:0:b0:2d1:12bb:6613 with SMTP id n26-20020a2e879a000000b002d112bb6613mr1875938lji.30.1708023328461;
        Thu, 15 Feb 2024 10:55:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708023328; cv=none;
        d=google.com; s=arc-20160816;
        b=ttj429RwFUjQeqaD7dwuesRsakz5lawTh9acflir+9JfNuDP/XZlo4Wsspuon/KiYH
         noCEl5s9gV8ltoklVzJMph53f1+BMQ5yVhauBZLmLcPdNtbdAVh2iwDAw5wHLcr7kaQU
         MkuVgMHFLvSRPOUdpmN03dO8bDkKzjhlIewhk9BRkBY0/guJPHuCxqWPGiCbNi0t3jt2
         0vPo8LHTPifM1k0Ywq0CwZQQNO12RRegH5sp8FPVEZ103+i8DaORTiXqp64OajK5dDaH
         JB+/OESL7mdiKy/K21HgmoRmPg6qJm202WUzagDqTGJHeCDK77WL0AtLWsIwJb7XX5Ov
         MFRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F18LAjIP/+AmrGXybYek6+l5Qorf3H6geOHINFwOi9g=;
        fh=osIy2DxWufiDImYjAysnjvl+SEMgdaYEhK4B3UXSebw=;
        b=GH/SWeb9s8PTI/RiqeM258rz4SH/1mEQPOuiyfgG+83u85CBfg0uCiP6R53XQqbqbw
         Oq8+NE9rrdG9U702g1TMbNG6VIAOcW20ksXlHO4/1OotRlUsUW3yanV2cfBN4EHfroRA
         3JZMtXRktF9qgIGUYmVjXijhuzHbiILRH9tSuOC5H8bCIWcSrY4ZtMrccwSsbeq8wpl4
         u58N0kyb+dGMhJSZsQivYhueIpbXheezMC4lkDxe9uxcdabaHz/ho0pP8z776GsMu1fM
         6hWTaKgi1nwaod1061efHLKUhnif5uFR0pUSykKTOxTz7SGhGCgbyuuNP6yn2KDdPiJC
         qMFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JDqrE188;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j24-20020a50ed18000000b00561a7f3bdc1sor552604eds.7.2024.02.15.10.55.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 15 Feb 2024 10:55:28 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JDqrE188;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708023328; x=1708628128; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F18LAjIP/+AmrGXybYek6+l5Qorf3H6geOHINFwOi9g=;
        b=JDqrE1886eVtU8jYdz/7SFsmlJZVFyv7l0Fql8Yz3our+F/+LF+OLVB469+e+ElJ9j
         akzbsKdCMmpzXXQoUL6l3QdCB4cY1sf/h2hVBD3UJ9scvMqPcHSjwkuDu/HH+OcyQtsT
         PKfvLQSzXQTRp2TE8IwZhCbT9c76HghTnD8lis1fFcbuauCfW29cwkkM17yO9qIYERbG
         um7m9Gr6nNz5rUwdXJu8Z51YXZa0747BJdliU+effE2Q2acp9qOUqPMI2Lq/7QV3OOxs
         AceQ+6qXPcUR23erwreqM/pKOtqr9X1h/xr+0O5ThsHDwvtzflZh1VZFpYvoLzlPseGo
         mPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708023328; x=1708628128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F18LAjIP/+AmrGXybYek6+l5Qorf3H6geOHINFwOi9g=;
        b=V18gUA/toUKsLEhRsklKloNjggYrCmOjEeXfvtJQBcixFPmLqCJ9oIBOKs87AQBBhD
         4yjyLmY2eLFF9wg0ah9YpFm9vuQ4v4cKcYtKzNG1iQ2Sjzc+J/B63ciUcQlETAhdtBcl
         azPtbvinkDgeqqR6EYidjOfIklfIjPaMOSm1FqX4J8Ir0sa5B8OyThfP9sWeSc6REPaG
         2yLdXTxsqvimGPoZVCw4Wn3/0D3nasQIcCZDYJplpyx6hY8dXGJ4d39PrdcVAPG/6CiC
         1N65aeqc9NCBZyf6AEdChHFbT9UCZoU0ghxb93rW/opPBSKgUAra3kX7pkuXfCSDobFP
         cvAw==
X-Gm-Message-State: AOJu0YyZNUiICHoW7t9UoqA63DHGVn5GLaP5sZ2hQOvBqESrtgtx5zzY
	voPFTU1X6cMjen2Ovg1BXxbc1WOeJdgVQ24F090J/Ti8DQjeRYO0ABxjrBkIAiGVJEGMy3EMV05
	UxabY+8spnrwLNrfKADwXhHs5iOIrCcqayHZRuneL6F3DrP9V33s=
X-Google-Smtp-Source: AGHT+IEq0Qkm5r5un9hiHON7+vZZA2/AblmKcjpG9rUp4Mrwx+0GnjnFpg4V/mUWcsGKAvO8463DF1KEOzHdy+XJlg4=
X-Received: by 2002:aa7:d14c:0:b0:55e:dcdf:50b0 with SMTP id
 r12-20020aa7d14c000000b0055edcdf50b0mr1857481edo.15.1708023328031; Thu, 15
 Feb 2024 10:55:28 -0800 (PST)
MIME-Version: 1.0
References: <20240215184036.214065-1-alex.bennee@linaro.org>
In-Reply-To: <20240215184036.214065-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Feb 2024 18:55:16 +0000
Message-ID: <CAFEAcA-YowK9nNMrTdyT1i4pt=npn_53PEywoA7uaDMc+z5Y-w@mail.gmail.com>
Subject: Re: [RFC PATCH] tests/tcg: update licenses to GPLv2 as intended
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: yG4ikE2Ez9/o

On Thu, 15 Feb 2024 at 18:40, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> My default header template is GPLv3 but for QEMU code we really should
> stick to GPLv2-or-later (allowing others to up-license it if they
> wish). While this is test code we should still be consistent on the
> source distribution.

Test code, and more importantly not linked against
QEMU proper -- it's all standalone guest binaries,
so we don't link this code with any GPL-v2-only code.

> I wrote all of this code so its not a problem. However there remains
> one GPLv3 file left which is the crt0-tc2x.S for TriCore.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/tcg/aarch64/semicall.h                      | 4 ++--
>  tests/tcg/arm/semicall.h                          | 4 ++--
>  tests/tcg/multiarch/float_helpers.h               | 4 ++--
>  tests/tcg/riscv64/semicall.h                      | 4 ++--
>  tests/tcg/multiarch/arm-compat-semi/semiconsole.c | 4 ++--
>  tests/tcg/multiarch/arm-compat-semi/semihosting.c | 4 ++--
>  tests/tcg/multiarch/float_convd.c                 | 4 ++--
>  tests/tcg/multiarch/float_convs.c                 | 4 ++--
>  tests/tcg/multiarch/float_madds.c                 | 4 ++--
>  tests/tcg/multiarch/libs/float_helpers.c          | 4 ++--
>  tests/tcg/i386/system/boot.S                      | 6 +++---
>  tests/tcg/x86_64/system/boot.S                    | 6 +++---
>  12 files changed, 26 insertions(+), 26 deletions(-)

Of these files, contributions by somebody other than Alex:

tests/tcg/multiarch/float_convd.c
tests/tcg/multiarch/float_convs.c
tests/tcg/multiarch/float_helpers.h
tests/tcg/multiarch/float_madds.c
 Richard Henderson <richard.henderson@linaro.org>
which is all Linaro copyright.

tests/tcg/multiarch/libs/float_helpers.c
 Taylor Simpson <tsimpson@quicinc.com>
 ...but this was exclusively deleting lines

plus a couple of typo/spelling fixes from
Michael Tokarev <mjt@tls.msk.ru> which I don't think rise
to the level of being relicensable contributions.

So I don't think we need anybody else's signoff for this
relicensing.

thanks
-- PMM
