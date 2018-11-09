Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id o81-v6sm2004014wmo.38.2018.11.09.07.45.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Nov 2018 07:45:58 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id ACE083E043F;
	Fri,  9 Nov 2018 15:45:57 +0000 (GMT)
References: <20181109152119.9242-1-alex.bennee@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: Re: [PATCH  v3 0/7] KVM Guest Debug fixes (plus TCG EL2 debug tweaks)
In-reply-to: <20181109152119.9242-1-alex.bennee@linaro.org>
Date: Fri, 09 Nov 2018 15:45:57 +0000
Message-ID: <87ftwa5k5m.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: eAw3peWnZlk5


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Hi,
>
> I missed a fix I'd applied locally from v2 so this is a resend with
> some additional tags, some changes suggested by rth and one more fix
> for the test case.
>
> So these are fixes for guest debug when running under KVM. While
> re-spinning these I came across an anomaly which pointed to a kernel bug
> that caused the 1st single-step to fail. This is being discussed at on
> the kvm-arm list:
>
>   Subject: [RFC PATCH] KVM: arm64: don't single-step for non-emulated fau=
lts
>   Date: Wed, 7 Nov 2018 17:10:31 +0000
>   Message-Id: <20181107171031.22573-1-alex.bennee@linaro.org>
>
> It looks like there will be another patch series on its way to address
> this.

For reference Mark has posted this now:

   Subject: [PATCH 0/2] kvm/arm: make singlestep behaviour consistent
   Date: Fri,  9 Nov 2018 15:07:09 +0000
   Message-Id: <20181109150711.45864-1-mark.rutland@arm.com>
--
Alex Benn=C3=A9e
