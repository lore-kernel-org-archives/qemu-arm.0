Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id ne33sm1770325ejc.6.2021.12.10.07.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 07:39:10 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B07661FF96;
	Fri, 10 Dec 2021 15:39:09 +0000 (GMT)
References: <20211202115352.951548-1-alex.bennee@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: pbonzini@redhat.com, drjones@redhat.com, thuth@redhat.com
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 christoffer.dall@arm.com, maz@kernel.org, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Subject: Re: [kvm-unit-tests PATCH v9 0/9] MTTCG sanity tests for ARM
Date: Fri, 10 Dec 2021 15:38:56 +0000
In-reply-to: <20211202115352.951548-1-alex.bennee@linaro.org>
Message-ID: <87czm4jwpu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: R3NQHOvUtFUT


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Hi,
>
> Not a great deal has changed from the last posting although I have
> dropped the additional unittests.cfg in favour of setting "nodefault"
> for the tests. Otherwise the clean-ups are mainly textual (removing
> printfs, random newlines and cleaning up comments). As usual the
> details are in the commits bellow the ---.
>
> I've also tweaked .git/config so get_maintainer.pl should ensure
> direct delivery of the patches ;-)

Gentle ping...

--=20
Alex Benn=C3=A9e
