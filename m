Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id k19-20020a05600c1c9300b003dc43a10fa5sm15293810wms.13.2023.02.07.07.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 07:11:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 02F4D1FFB7;
	Tue,  7 Feb 2023 15:11:41 +0000 (GMT)
References: <20230203100551.2445547-1-alex.bennee@linaro.org>
 <87cz6loahb.fsf@suse.de>
User-agent: mu4e 1.9.19; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Ilias  Apalodimas
 <ilias.apalodimas@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC PATCH] target/arm: disable FEAT_SME if we turn off SVE
Date: Tue, 07 Feb 2023 15:09:57 +0000
In-reply-to: <87cz6loahb.fsf@suse.de>
Message-ID: <877cwtpl1v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Ns4mg0SnwSjQ


Fabiano Rosas <farosas@suse.de> writes:

> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>
>> Before this change booting a -cpu max,sve=3Doff would trigger and
>> assert:
>>
>>   qemu-system-aarch64: ../../target/arm/helper.c:6647: sve_vqm1_for_el_s=
m: Assertion `sm' failed.
>>
>> when the guest attempts to write to SMCR which shouldn't even exist if
>> SVE has been turned off.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
>> ---
>>  target/arm/cpu64.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>> index 0e021960fb..a38d43421a 100644
>> --- a/target/arm/cpu64.c
>> +++ b/target/arm/cpu64.c
>> @@ -409,6 +409,13 @@ static void cpu_arm_set_sve(Object *obj, bool value=
, Error **errp)
>>      t =3D cpu->isar.id_aa64pfr0;
>>      t =3D FIELD_DP64(t, ID_AA64PFR0, SVE, value);
>>      cpu->isar.id_aa64pfr0 =3D t;
>> +
>> +    /* FEAT_SME requires SVE, so disable it if no SVE */
>> +    if (!value) {
>> +        t =3D cpu->isar.id_aa64pfr1;
>> +        t =3D FIELD_DP64(t, ID_AA64PFR1, SME, 0);
>> +        cpu->isar.id_aa64pfr1 =3D t;
>> +    }
>
> What about -cpu max,sve=3Doff,sme=3Don ?

Gah - I bet this is going to depend on ordering of parameters as well.

Markus,

Is there any way to represent optionA implies optionB in our argument parsi=
ng?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
