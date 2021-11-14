Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4714404lfk;
        Sun, 14 Nov 2021 09:41:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxO0CDMKJmfwnEWE4hGPne4uon1SRBZHBadsiTrXEgcp3MgAwk3S9n7tZ/xdxttw484u5DT
X-Received: by 2002:a05:600c:3553:: with SMTP id i19mr52220158wmq.97.1636911668119;
        Sun, 14 Nov 2021 09:41:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636911668; cv=none;
        d=google.com; s=arc-20160816;
        b=wHgkC9/IiS1ttcYX4jafQ5yEUdgBfrORt7otPvpvIMQASnjHN1TG0YWFygFiaX1AUY
         6fpKI7+3VuAOgbp/Sef4h1FqqzQknuU+vW+xD/XD9H6AC/qnl5xiPD1V112FkvpLfLiM
         id1ksnuxcEJqQuAI1egszvzUXWpYCfyDkf4xJv6aPSN/zlZftfkBszDEm9+0uJ5npwtx
         6pJP6e3ZXEphGM7Ih6UVOhYynp0iJ9OD0zILijMlXRwUhEbX3fxOrtXliRhp6MF9hFNi
         LkVtVVuOL1tUIsMq8boJi/eLBmyG2eR/RIibEtJJiEtMlchbzotgL3vU3HZAsuG/ICtB
         E/mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding;
        bh=IAwhr/QQ6op7OVj8IvTwx4JSupXBfxi4IBJZBbsS4io=;
        b=A7nLNKbDhXF5Z23JVrwWZr9TUye5cPtOyrq0nFVfSlzbdM7y3cjy7ky734z9dJg60+
         vyffUHkWhRvWgoT5/H8YGCAQtwjGFbcAaSFNAWEFrIsBysGxzXyaZDAUtt0xPwdZ/u0K
         8asec+bk7tEEfgKsT2I5ObMdXdFXtM1CGFnLy2tnVE813H5YpAiLGAx6e3w6RKQWIPjy
         kqC1/jxi8i1s3mTcVYbnJzQqhwHIfG9ZrFHcuZddwh1AFuArc4xK07MByLPbnup9xQcb
         Ux7c5IrOW0PU7kst9Vm3RhKv61xXYiWp/WGQoC31wFiE/AeDQtJ1DXaSeicK9nwraDMZ
         adyg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Return-Path: <agraf@csgraf.de>
Received: from zulu616.server4you.de (mail.csgraf.de. [85.25.223.15])
        by mx.google.com with ESMTP id i10si29959215wry.273.2021.11.14.09.41.07;
        Sun, 14 Nov 2021 09:41:08 -0800 (PST)
Received-SPF: pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) client-ip=85.25.223.15;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of agraf@csgraf.de designates 85.25.223.15 as permitted sender) smtp.mailfrom=agraf@csgraf.de
Received: from smtpclient.apple (dynamic-095-118-029-131.95.118.pool.telefonica.de [95.118.29.131])
	by csgraf.de (Postfix) with ESMTPSA id 966D5608038A;
	Sun, 14 Nov 2021 18:41:07 +0100 (CET)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Alexander Graf <agraf@csgraf.de>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] arm: Don't remove EL3 exposure for SMC conduit
Date: Sun, 14 Nov 2021 18:41:06 +0100
Message-Id: <8639608F-1685-48B8-B965-255D30B213F8@csgraf.de>
References: <CAFEAcA8vRNC8RTAAxgYzZsGdqGfzDSr3m0UXmeZoF115z=6N3Q@mail.gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Andrei Warkentin <andrey.warkentin@gmail.com>
In-Reply-To: <CAFEAcA8vRNC8RTAAxgYzZsGdqGfzDSr3m0UXmeZoF115z=6N3Q@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: iPhone Mail (19B74)
X-TUID: EF7EHMdp9p+q



> Am 14.11.2021 um 18:20 schrieb Peter Maydell <peter.maydell@linaro.org>:
>=20
> =EF=BB=BFOn Sun, 14 Nov 2021 at 10:56, Alexander Graf <agraf@csgraf.de> wr=
ote:
>>=20
>> When we expose an SMC conduit, we're implicitly telling the guest that
>> there is EL3 available because it needs to call it. While that EL3 then
>> is not backed by the emulated CPU, from the guest's EL2 point of view,
>> it still means there is an EL3 to call into.
>>=20
>> This is a problem for VMware ESXi, which validates EL3 availability befor=
e
>> doing SMC calls. With this patch, VMware ESXi works with SMP in TCG.
>>=20
>> Reported-by: Andrei Warkentin <andrey.warkentin@gmail.com>
>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>> ---
>> target/arm/cpu.c | 20 +++++++++++++++-----
>> 1 file changed, 15 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index a211804fd3..21092c5242 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -1782,11 +1782,21 @@ static void arm_cpu_realizefn(DeviceState *dev, E=
rror **errp)
>>          */
>>         unset_feature(env, ARM_FEATURE_EL3);
>>=20
>> -        /* Disable the security extension feature bits in the processor f=
eature
>> -         * registers as well. These are id_pfr1[7:4] and id_aa64pfr0[15:=
12].
>> -         */
>> -        cpu->isar.id_pfr1 &=3D ~0xf0;
>> -        cpu->isar.id_aa64pfr0 &=3D ~0xf000;
>> +        if (cpu->psci_conduit =3D=3D QEMU_PSCI_CONDUIT_SMC) {
>> +            /*
>> +             * We tell the guest to use SMC calls into EL3 for PSCI call=
s, so
>> +             * there has to be EL3 available. We merely execute it on th=
e host
>> +             * in QEMU rather than in actual EL3 inside the guest.
>> +             */
>> +        } else {
>> +            /*
>> +             * Disable the security extension feature bits in the proces=
sor
>> +             * feature registers as well. These are id_pfr1[7:4] and
>> +             * id_aa64pfr0[15:12].
>> +             */
>> +            cpu->isar.id_pfr1 &=3D ~0xf0;
>> +            cpu->isar.id_aa64pfr0 &=3D ~0xf000;
>> +        }
>=20
> This is tricky, because we use the cpu->isar values to determine whether
> we should be emulating things. So this change means we now create an
> inconsistent CPU which in some ways claims to have EL3 (the ISAR ID
> bits say so) and in some ways does not (the ARM_FEATURE_EL3 flag is
> unset), and depending on which of the two "do we have EL3?" methods
> any bit of the TCG code is using will give different results...

Do you think it would be sufficient to go through all readers of the isar bi=
ts and guard them behind an ARM_FEATURE_EL3 check in addition? I'll be happy=
 to do so then! :)

Alex
