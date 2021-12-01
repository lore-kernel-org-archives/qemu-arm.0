Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q26sm248744wrc.39.2021.12.01.08.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 08:22:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 802AB1FF96;
	Wed,  1 Dec 2021 16:22:28 +0000 (GMT)
References: <20211118184650.661575-1-alex.bennee@linaro.org>
 <20211118184650.661575-5-alex.bennee@linaro.org>
 <20211124164859.4enqimrptr3pfdkp@gator>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Jones <drjones@redhat.com>
Cc: kvm@vger.kernel.org, maz@kernel.org, qemu-arm@nongnu.org,
 idan.horowitz@gmail.com, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [kvm-unit-tests PATCH v8 04/10] run_tests.sh: add --config
 option for alt test set
Date: Wed, 01 Dec 2021 16:20:02 +0000
In-reply-to: <20211124164859.4enqimrptr3pfdkp@gator>
Message-ID: <87o860xpkr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: yxLubhkhSQJR


Andrew Jones <drjones@redhat.com> writes:

> On Thu, Nov 18, 2021 at 06:46:44PM +0000, Alex Benn=C3=A9e wrote:
>> The upcoming MTTCG tests don't need to be run for normal KVM unit
>> tests so lets add the facility to have a custom set of tests.
>
> I think an environment variable override would be better than this command
> line override, because then we could also get mkstandalone to work with
> the new unittests.cfg files. Or, it may be better to just add them to
> the main unittests.cfg with lines like these
>
> groups =3D nodefault mttcg
> accel =3D tcg
>
> That'll "dirty" the logs with SKIP ... (test marked as manual run only)
> for each one, but at least we won't easily forget about running them from
> time to time.

So what is the meaning of accel here? Is it:

  - this test only runs on accel FOO

or

  - this test defaults to running on accel FOO

because while the tests are for TCG I want to run them on KVM (so I can
validate the test on real HW). If I have accel=3Dtcg then:

  env ACCEL=3Dkvm QEMU=3D$HOME/lsrc/qemu.git/builds/all/qemu-system-aarch64=
 ./run_tests.sh -g mttcg
  SKIP tlbflush-code::all_other (tcg only, but ACCEL=3Dkvm)
  SKIP tlbflush-code::page_other (tcg only, but ACCEL=3Dkvm)
  SKIP tlbflush-code::all_self (tcg only, but ACCEL=3Dkvm)
  ...

so I can either drop the accel line and rely on nodefault to ensure it
doesn't run normally or make the env ACCEL processing less anal about
preventing me running TCG tests under KVM. What do you think?

--=20
Alex Benn=C3=A9e
