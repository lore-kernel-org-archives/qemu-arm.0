Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n6sm4189009wmd.27.2021.04.06.10.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 10:13:08 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B4D581FF7E;
	Tue,  6 Apr 2021 18:13:07 +0100 (BST)
References: <20200929224857.1225107-1-philmd@redhat.com>
 <87eefvnx3s.fsf@linaro.org>
 <7a720701-a34f-ccf4-d116-a0f0703b5f83@redhat.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Willian Rampazzo <willianr@redhat.com>, qemu-arm@nongnu.org, Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] tests/acceptance: Add a 'virt_kvm' test using the GICv3
Date: Tue, 06 Apr 2021 18:12:21 +0100
In-reply-to: <7a720701-a34f-ccf4-d116-a0f0703b5f83@redhat.com>
Message-ID: <87ft03wd3w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Q80iYRl5Q7dL


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 3/31/21 5:45 PM, Alex Benn=C3=A9e wrote:
>>=20
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>=20
>>> The current 'virt_kvm' test is restricted to GICv2, but can also
>>> work with a GICv3. Duplicate it but add a GICv3 test which can be
>>> tested on some hardware.
>>>
>>> Noticed while running:
>>>
>>>  $ avocado --show=3Dapp run -t machine:virt tests/acceptance/
>>>  ...
>>>  (2/6) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm: E=
RROR: Unexpected empty reply from server (1.82 s)
>>>
>>> The job.log content is:
>>>
>>>   L0351 DEBUG| Output: 'qemu-system-aarch64: host does not support in-k=
ernel GICv2 emulation\n'
>>>
>>> With this patch:
>>>
>>>  $ avocado --show=3Dapp run -t device:gicv3 tests/acceptance/
>>>  (1/1)
>>>  tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv3:
>>>  PASS (55.10 s)
>>=20
>> On the new aarch64 machine which is GICv3 I get the following:
>>=20
>>  (006/142) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm=
_gicv2: ERROR: Unexpected empty reply from server (0.47 s)
>>=20
>> which it shouldn't have run. However:
>>=20
>>   ./tests/venv/bin/avocado --show=3Dapp run -t device:gic3 tests/accepta=
nce/
>>   Test Suite could not be create. No test references provided nor any ot=
her arguments resolved into tests
>>=20
>> Is this something that has regressed or am I doing it wrong?
>
> Typo in the tag: "device:gic3" -> "device:gicv3"

Doh!

But what about:

/tests/venv/bin/avocado run tests/acceptance/boot_linux.py:BootLinuxAarch64=
.test_virt_kvm_gicv2
JOB ID     : 396696d8f9d31d970878cb46025b2ced76f3623f
JOB LOG    : /home/alex/avocado/job-results/job-2021-04-06T17.11-396696d/jo=
b.log
 (1/1) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv2:=
 ERROR: Unexpected empty reply from server (0.65 s)
RESULTS    : PASS 0 | ERROR 1 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CA=
NCEL 0
JOB TIME   : 0.96 s

why doesn't that skip?

--=20
Alex Benn=C3=A9e
