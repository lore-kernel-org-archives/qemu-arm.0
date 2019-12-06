Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id j12sm6285903wrt.55.2019.12.06.10.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 10:25:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 978951FF87;
	Fri,  6 Dec 2019 18:25:33 +0000 (GMT)
References: <20191206122247.7507-1-alex.bennee@linaro.org>
 <CAFEAcA9S51DWqysHbO42CjOhZBMA4qwN2zT+isOmWFtH5G8N3Q@mail.gmail.com>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH] target/arm: don't bother with id_aa64pfr0_read for
 USER_ONLY
In-reply-to: <CAFEAcA9S51DWqysHbO42CjOhZBMA4qwN2zT+isOmWFtH5G8N3Q@mail.gmail.com>
Date: Fri, 06 Dec 2019 18:25:33 +0000
Message-ID: <87d0d171lu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: hN7FJ1+yxUYl


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 6 Dec 2019 at 12:22, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>> For system emulation we need to check the state of the GIC before we
>> report the value. However this isn't relevant to exporting of the
>> value to linux-user and indeed breaks the exported value as set by
>> modify_arm_cp_regs.
>>
>> [AJB: the other option would be just to set reset value anyway and not
>> ifdef out the readfn as the register will become const anyway]
>
> If you want it to be const it would be clearer to define it
> with ARM_CP_CONST... I'm not sure what an ARM_CP_NO_RAW without
> a readfn or a fieldoffset will do on reads.

Well the modify_arm_cp_regs ensures it is ARM_CP_CONST when it changes
the definition. It's just ensuring the reset value is set so it can be
masked/fixed.

However the ifdef approach does reduce the amount of unused stuff in the
linux-user build.

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
