Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp298349ejv;
        Tue, 7 Nov 2023 05:08:55 -0800 (PST)
X-Received: by 2002:a50:aa8b:0:b0:544:b0f4:48a5 with SMTP id q11-20020a50aa8b000000b00544b0f448a5mr4068490edc.17.1699362535130;
        Tue, 07 Nov 2023 05:08:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699362535; cv=none;
        d=google.com; s=arc-20160816;
        b=RDP/XrlS0YBpkev3RsLhudK49zJS2Un9gqwFFymTwf+8kzmC89wK9XujEf7whmTwI1
         COltRpBJk9ZasSX6rpEtoVsDgNq9yBA/7QDNeJbxcbUYRhDIRY7N8sfDpF+j/WGTdUvP
         +Ql2DqkqV+AuBHF/JMd3bC/x072hJ50Uapl0dTkl7bex0rz+2WNX7AGJaFkeaxlTY52V
         J0J9eLLHbnDGBGjCAXiMiq+rsUpFr6BgP385T8f/upkNSMhIlC68eOZ3w+J3AE0yYNUp
         lZo1wacbwNErCUv2aYJuJYlGT2m3iSTJFS2Bt0mekvXi9O/+AlELpl02pMkFHy2BfAus
         6W/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zjVb5feIgOLLxLWvdaFsL34DVmZGoPTAWL8ivwyENP4=;
        fh=Mhv6V+03OVbYySG9kiTXGzES5WIr20q/ItR4uQu9cj8=;
        b=jfkMw7RLBNHawdrEhu15je9FahnZw9i0EmXE8h+zItxag+4FyE6nGWEEq6HFkM0MlN
         TCRY3mTFYr0CvkWSnuvbJQ6s1cZ1iGP2HV36vxQlZc/TyCYPguWxgAxzxTxSkif45A0O
         F0FjAeyFnuancWNCkJD+Vext3N1Dn4kLMvV+LPDOfZ4IRGQCHaHv/EgibUgbFQ1WdoTr
         hfn04ZC3WdxQkl11ZY9g03oQEZUUmG1LlsuDnt8OqUICzksgJDXzCaZGcHU4Y/5E/hz1
         x9TdWMLEVY8nIGdtgNDAeHQrYAWGR+iaXmwnP3DbmPvlIbDyDKNDBnzwoktlGWOcDp5D
         c4mQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tsL2sFs+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id eo5-20020a056402530500b00544a27bea27sor1474873edb.7.2023.11.07.05.08.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 07 Nov 2023 05:08:55 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tsL2sFs+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699362535; x=1699967335; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjVb5feIgOLLxLWvdaFsL34DVmZGoPTAWL8ivwyENP4=;
        b=tsL2sFs+9sz+auRNg/ObDppt7G5uApNIxlDIPz+Ii17cvd2Ow9U/32+/7FiYqbVHnn
         jg1IwZVeRqKEhzZQZL5VI/IQ+3pqx6SvgVg8i1mIUHgdiCwE2g4mpcYYRncyYd/9QC6S
         TugDt9ahfIWOWKsgGV5hmXjXsxtyqjp106vUoPPCG3nayvCXT9po/lpm1GPGMMxpN1rV
         KaR3HMMpGxNrraKKc/ABza3jmZnP26XJZT/P38j8X1JLO4FZ1YQxB/2limNc2kYZL34B
         0+ax5q/+9GRUX2jGGMlTneIIJaTgjQhXc/8vBssfzSIm5G3/wzOLPlN4vEpkVOLCVMob
         ZXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699362535; x=1699967335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zjVb5feIgOLLxLWvdaFsL34DVmZGoPTAWL8ivwyENP4=;
        b=imh/W8pfxIdXfY3iYyUmsErUo1qD39ARlWGIgGP561y8GXtUC6mEypbUHdH5f/Udf4
         gpcOmPqxg3rRoUwUmD1arczWaBQlijk1UfD+eQjGtLLSCa4gIC5LpsETvSXjwcjtU4vI
         Iv3puBZ8Raa2bx9SDu0jV/ewk9n87HcUJYEHMT3b82nHu+ZSfGN+OE2VzEEOD3a/rANt
         KaKOlcb2PciD9S0uevmQvL4SkmeLAB3bsv4KXLSOmD2sFpV4F9W1fzztzjwy9tA8VQ0Z
         o57o2G/GfUfFzWPzr37fyQTPcUOqXtEvismuQSooC1Hx28wW0NucA15DsaHHWkAifx06
         IS7g==
X-Gm-Message-State: AOJu0YyDGMXD5NMLLsCVBqC/48LmVLpKKwAR+cV/PS2tLOJwmUvlmLOF
	b/jtSqupQcwR1X1sLPODFv0V7d/c6zDFfjMrgzIgZFiSHowwQIyr7uQ=
X-Google-Smtp-Source: AGHT+IE0x7nI19tCSGR/NFUCiTcMXvP9doSPDUPPXJK3Dyz86N3JzlBiPkm9nA88akoJ611/PH+M61kxzm/72tQtR7U=
X-Received: by 2002:a50:9fe9:0:b0:543:714b:535d with SMTP id
 c96-20020a509fe9000000b00543714b535dmr18920879edf.3.1699362534602; Tue, 07
 Nov 2023 05:08:54 -0800 (PST)
MIME-Version: 1.0
References: <20231106185112.2755262-1-alex.bennee@linaro.org> <20231106185112.2755262-6-alex.bennee@linaro.org>
In-Reply-To: <20231106185112.2755262-6-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Nov 2023 13:08:43 +0000
Message-ID: <CAFEAcA_Za3-xuuw61EgGyK5c8Fgqz=gKkJQUpZANVvkfKWpp2Q@mail.gmail.com>
Subject: Re: [PATCH 05/22] target/arm: hide aliased MIDR from gdbstub
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Laurent Vivier <laurent@vivier.eu>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
	Cleber Rosa <crosa@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
	Alexandre Iooss <erdnaxe@crans.org>, John Snow <jsnow@redhat.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: eD2wQLpY5uNf

On Mon, 6 Nov 2023 at 18:51, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> This is just a constant alias register with the same value as the
> "other" MIDR so it serves no purpose being presented to gdbstub.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20231103195956.1998255-6-alex.bennee@linaro.org>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 104f9378b4..a681bcba62 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -8993,7 +8993,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .type =3D ARM_CP_CONST, .resetvalue =3D cpu->revidr },
>          };
>          ARMCPRegInfo id_v8_midr_alias_cp_reginfo =3D {
> -            .name =3D "MIDR", .type =3D ARM_CP_ALIAS | ARM_CP_CONST,
> +            .name =3D "MIDR", .type =3D ARM_CP_ALIAS | ARM_CP_CONST | AR=
M_CP_NO_GDB,
>              .cp =3D 15, .crn =3D 0, .crm =3D 0, .opc1 =3D 0, .opc2 =3D 4=
,
>              .access =3D PL1_R, .resetvalue =3D cpu->midr
>          };

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

It's a bit weird to hide this one but not the alias in
id_v8_midr_cp_reginfo[], though.

If we want to expose all these things to gdb I wonder
if we should have the ARMCPRegInfo give both the AArch64
and the AArch32 names for the registers, so that the
user sees the register names they expect, rather than
having their names be a random mix of the two.

thanks
-- PMM
