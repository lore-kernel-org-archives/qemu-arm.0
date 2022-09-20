Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1837930ejy;
        Tue, 20 Sep 2022 07:52:57 -0700 (PDT)
X-Received: by 2002:a17:906:cc0e:b0:77c:d77:576d with SMTP id ml14-20020a170906cc0e00b0077c0d77576dmr17174905ejb.658.1663685576946;
        Tue, 20 Sep 2022 07:52:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663685576; cv=none;
        d=google.com; s=arc-20160816;
        b=EevRT3+vYSYXsyTA2Y5G04vK+xteMrAZQ7Kh76XqNypoRxd06MoLSP1VkGVhdA6odG
         QVgNLhmwhfze2EBYnxCMiIbVnMd922KsOiEj9YEuIyXgAzZWHyh5V843Em/5JUI/cOmt
         tBq2g6cUzlPW9Bm3aW/DEAcn4pVEs+3uwnNOfnKP69gkzwejun/DFw+D25+Ez1Obm9TK
         WMh2yIO5Ebdhswq705n4N61kkyD4o/Q+TzWcrmzl6RkatGPR5QnKvfmLn+19JVirdSFY
         UNHxCkrW3ea66kqf+wTFPNpARnbvHVeraNSVhA0QvJEnBgNtJ9pS90p9JxAwfFUWNhnS
         dVTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6k+UR6vpkzUD5ujSlALjelL/Gh07HL86g44Qa+1GFR8=;
        b=Joe4FynkuiXi/XNgkwAK6TB94n2SUjQmgeyOF6k3OAP9pZvhhJNT+/EhPK6s2FpwN0
         cUEui6Qi2LfxwG/D8CXGQVzC1h477sJNXu663WMcU6pynJmOECY7n+XL0ffr4+CHms3/
         C/r26ZpNDeiHjb9u0Nt9YvEaOw8hex//nvFoyvn0M99v55snj7pijh0HujsvV/r4J8wN
         cO4LOWTSCF/kT5Ue8XwenLGIWKikDtOhK9d7+NfWYOtRR2JIgC79ofTvm8Wi3M0TsUDs
         G+gZ6kLqLsXKlErCQljWSkiRV89Dy8GYGW2JzCqwfxTcmKP4ODnd+phNCLXCbmNha7xj
         DIQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ti+xALDu;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j5-20020a508a85000000b00447a14226c1sor182655edj.61.2022.09.20.07.52.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Sep 2022 07:52:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ti+xALDu;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=6k+UR6vpkzUD5ujSlALjelL/Gh07HL86g44Qa+1GFR8=;
        b=Ti+xALDulbbpFKnWzsjqyRsDzYGFwRuVR6yfDwvem/v2KFH6plhgUkdklcXzHGOVSX
         3cw9GN4ptoC7ARLuSTeHfS1+WqIT/PnueeT5GxQ/xmrmiBMYZNrwQSQyCYuGxpIOs9p1
         q6XP4Jhm7FSB7/SkThkdyk3cLUD+oMzr1x/q6H0y+GdhI6BM1mK2oi6KvPHr1MlEXpPZ
         wfmFz18HT/BG6inNLqaFXqntOmq7hHzaV1Jp1GQxY9+OGA0A0Sp514UqN5D6v8JypNsP
         xn7AuvRCgC7IKVfRY9m5v+XYe776mAXKwimve6kP40z+RYAF297KU7lOx9JG0ELA60np
         VASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=6k+UR6vpkzUD5ujSlALjelL/Gh07HL86g44Qa+1GFR8=;
        b=y6kat+TZRN6PAkMP404qzlX7k5NUBxFnOF1vqAJZjdyU5UT7ajg9TlyoHIEeGT2XYs
         nWd8mN/yPT0oUrPAKS9CH/On66r6tI9EEdvCUlICtzJ8hjmVblXzWXJPqDpgTzqfJJ0c
         MsbzKZQFbDF51FNg5TXDfpwVTQlfie5VHnz+jFP4/WDRrYlZ5CjsR8FFznioy5rDDTm1
         I+aFhM2p/XIo9P1ngdBrQopxkR1l9yaqSvLq1bOygPRNc7iac1JcYRM5cAnXBHuFPd9n
         z+8qmJxVNxNDLSOHrASH1E3VgpAo1P1ztEkhP62llQVL1bO5tHZJ+RQupMQbACS8jyz1
         NVzQ==
X-Gm-Message-State: ACrzQf3LFfk3gCHmRpsTBVzdXR4S+kDHsYKdfAY8Txt+q/M0SkMtvkLl
	fK2Om2CaA8MYFYWDsSc+ZrkmaFVQH4+d3Wdg5N25DOc3tNdy+g==
X-Google-Smtp-Source: AMsMyM7YiRpp8URugRWj9R60nHGAIIuozuwQD+387epoyalbRQbnblzcJI2YJXaXOMS7Ngkox26kqvhLn9Kkoi+ogjM=
X-Received: by 2002:a05:6402:35c5:b0:450:4b7d:9c49 with SMTP id
 z5-20020a05640235c500b004504b7d9c49mr20812656edc.149.1663685576726; Tue, 20
 Sep 2022 07:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org> <20220822152741.1617527-18-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:52:45 +0100
Message-ID: <CAFEAcA-wQk1af=VWxBFmDSSmicn_qjcy88M5wns-SL8LqWXHUw@mail.gmail.com>
Subject: Re: [PATCH v2 17/66] target/arm: Add is_secure parameter to get_phys_addr_lpae
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: mN0LPh39jSRy

On Mon, 22 Aug 2022 at 17:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove the use of regime_is_secure from get_phys_addr_lpae,
> using the new parameter instead.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> @@ -2334,7 +2334,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong a=
ddress,
>              memset(result, 0, sizeof(*result));
>
>              ret =3D get_phys_addr_lpae(env, ipa, access_type, s2_mmu_idx=
,
> -                                     is_el0, result, fi);
> +                                     ipa_secure, is_el0, result, fi);
>              fi->s2addr =3D ipa;

Depending on how we change patch 2, this may want to be looking at
something other than ipa_secure.

thanks
-- PMM
