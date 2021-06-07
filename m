Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id o11sm394047wmq.1.2021.06.07.03.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 03:15:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C8B011FF7E;
	Mon,  7 Jun 2021 11:15:10 +0100 (BST)
References: <OS3PR01MB61515F08F0709D9E22B8DDDFE9249@OS3PR01MB6151.jpnprd01.prod.outlook.com>
 <TYCPR01MB6160FB4A9712F3F5E14D8BBAE93E9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <CAFEAcA_fZ_jC640XrFUCSk6YxzoSmdwDaMDAXoX47mBFKdS9hg@mail.gmail.com>
 <a56283b3-3bb2-d9a3-9a6e-8175cc17b376@linaro.org>
 <TYCPR01MB6160998DCE40866CDC3134BBE93C9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <65323e52-789c-567a-3446-ccb7709877e2@linaro.org>
 <TYCPR01MB6160266A2DFDE090276C44D0E93B9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <CAFEAcA9vttSZRRX_DS7p6Hgo-4zbhDfkSd0jb-+LJZUOLrumAA@mail.gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>, Richard
 Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, qemu-arm@nongnu.org
Subject: Re: [RFC] Adding the A64FX's HPC funtions.
Date: Mon, 07 Jun 2021 11:14:38 +0100
In-reply-to: <CAFEAcA9vttSZRRX_DS7p6Hgo-4zbhDfkSd0jb-+LJZUOLrumAA@mail.gmail.com>
Message-ID: <87o8cinfpt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: kGRlP8MGC6Ty


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 4 Jun 2021 at 09:29, ishii.shuuichir@fujitsu.com
> <ishii.shuuichir@fujitsu.com> wrote:
>>
>> Hi, Richard.
>>
>> > Well, Peter disagreed with having them enabled by default in -cpu max,=
 so we
>> > might need at least one extra property.  I see no reason to have three
>> > properties -- one property a64fx-hpc should be sufficient.  But we mig=
ht not
>> > want any command-line properties, see below...
>>
>> I understood.
>>
>> > For comparison, in the Arm Cortex-A76 manual,
>> >    https://developer.arm.com/documentation/100798/0301/
>> > section B2.4 "AArch64 registers by functional group", there is a conci=
se
>> > listing of all of the system registers and their reset values.
>>
>> Thank you for the information.
>>
>> > The most important of these for QEMU to create '-cpu a64fx' are the
>> > ID_AA64{ISAR,MMFR,PFR} and MIDR values.  These values determine all of
>> > the
>> > standard architectural features,
>>
>> The values of ID_AA64{ISAR,MMFR,PFR} and MIDR are not listed in the spec=
ifications published at this time.
>> Of course, they are listed in the A64FX specification document managed w=
ithin Fujitsu,
>> but we cannot tell how far these setting values can be disclosed
>> without checking with the A64FX specification staff within Fujitsu.
>
> If somebody has access to A64 hardware they could write a minor kernel
> patch to just print the values...

We do have access to some a64fx hardware I think... or at least there is
some in the lab that tcwg can get access to.

>
> -- PMM


--=20
Alex Benn=C3=A9e
