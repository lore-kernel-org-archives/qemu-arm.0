Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u8sm5443862wmm.15.2020.02.04.13.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 13:45:14 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 146C91FF87;
	Tue,  4 Feb 2020 21:45:12 +0000 (GMT)
References: <20200114150953.27659-1-alex.bennee@linaro.org>
 <20200114150953.27659-21-alex.bennee@linaro.org>
 <2731815f-9a72-390b-0a8e-73b77c4b62b6@linaro.org>
User-agent: mu4e 1.3.7; emacs 27.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v5 20/22] tests/tcg/aarch64: add test-sve-ioctl
 guest-debug test
In-reply-to: <2731815f-9a72-390b-0a8e-73b77c4b62b6@linaro.org>
Date: Tue, 04 Feb 2020 21:45:12 +0000
Message-ID: <87lfpi81sn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 2YdAELBkCP3T


Richard Henderson <richard.henderson@linaro.org> writes:

> On 1/14/20 5:09 AM, Alex Benn=C3=A9e wrote:
>> This test exercises the gdbstub while runing the sve-iotcl test. I
>> haven't plubmed it into make system as we need a way of verifying if
>> gdb has the right support for SVE.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>=20
>> ---
>> v4
>>   - interrogate ZCR_EL1 directly as no longer have vg
>
> Note that ZCR_EL1 does not give you the correct answer if the hypervisor =
has
> set ZCR_EL2 to something lower.

Sure - although this is only a user space test so we are not expecting
shenanigans.


> Also, ZCR_EL1 it itself not correct if the
> hardware does not support all vector sizes.
>
> See some of Andrew Jones' qemu command-line work.  Try -cpu max,sve512=3D=
on and
> then use the ioctl to set vq to 3 (sve384).  The result will be an effect=
ive vq
> of 2 (sve256).
>
> We *really* need vg, as computed from sve_zcr_len_for_el().

How come TARGET_PR_SVE_GET_VL is happy to compute directly from ZCR
then?

I'll put the vg back in but it seemed a little pointless given the
gdbstub ignores it.

>
>
> r~


--=20
Alex Benn=C3=A9e
