Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id s2sm4305192wmj.15.2020.03.10.07.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 07:57:52 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5ACE21FF7E;
	Tue, 10 Mar 2020 14:57:51 +0000 (GMT)
References: <20200310133020.27196-1-alex.bennee@linaro.org>
 <CAFEAcA-S1g4ojEkYdEa-ZHH+=uNUgCDWo0Z29ikbvNoX8Ro7Cw@mail.gmail.com>
User-agent: mu4e 1.3.9; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [PATCH] docs/system: add a little more detail to ARM machines
In-reply-to: <CAFEAcA-S1g4ojEkYdEa-ZHH+=uNUgCDWo0Z29ikbvNoX8Ro7Cw@mail.gmail.com>
Date: Tue, 10 Mar 2020 14:57:51 +0000
Message-ID: <87y2s8gsuo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: uSPqD/uFtdTp


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 10 Mar 2020 at 13:30, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> Taking from the wiki page mention:
>>
>>   - both 32 and 64 bit architectures
>>   - the roll of A/M profile chips
>>   - warn about kernel portability
>>   - gently suggest -M virt
>>   - add headlines for groups of boards
>>
>> This is still incomplete but hopefully is a less of a straight dive
>> into a dry list of peripherals.
>
> This is a semi-duplicate of the series I sent last night:
> https://patchew.org/QEMU/20200309215818.2021-1-peter.maydell@linaro.org/

Ahh I missed that, as your changes are more comprehensive I've reviewed
them. They render well enough:

  https://qemu-stsquad.readthedocs.io/en/docs-review/system/target-arm.html

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
