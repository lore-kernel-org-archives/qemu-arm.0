Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id c1sm72135wrx.89.2021.04.14.10.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 10:39:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id AA9FA1FF7E;
	Wed, 14 Apr 2021 18:39:06 +0100 (BST)
References: <20200929224857.1225107-1-philmd@redhat.com>
 <87eefvnx3s.fsf@linaro.org>
 <7a720701-a34f-ccf4-d116-a0f0703b5f83@redhat.com>
 <87ft03wd3w.fsf@linaro.org>
 <b9fa6362-7899-884e-58b9-f670143de6ae@redhat.com>
 <a2a463cb-e2a1-1884-cc97-8c5b4689341b@redhat.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Willian Rampazzo
 <willianr@redhat.com>, qemu-arm@nongnu.org, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] tests/acceptance: Add a 'virt_kvm' test using the GICv3
Date: Tue, 13 Apr 2021 17:32:35 +0100
In-reply-to: <a2a463cb-e2a1-1884-cc97-8c5b4689341b@redhat.com>
Message-ID: <87k0p4lq9x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: NRdvISGB/s/L


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Hi Alex,
>
> On 4/12/21 7:55 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 4/6/21 7:12 PM, Alex Benn=C3=A9e wrote:
>>>
>>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>>
>>>> On 3/31/21 5:45 PM, Alex Benn=C3=A9e wrote:
>>>>>
>>>>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>>>>
>>>>>> The current 'virt_kvm' test is restricted to GICv2, but can also
>>>>>> work with a GICv3. Duplicate it but add a GICv3 test which can be
>>>>>> tested on some hardware.
>>>>>>
>>>>>> Noticed while running:
>>>>>>
>>>>>>  $ avocado --show=3Dapp run -t machine:virt tests/acceptance/
>>>>>>  ...
>>>>>>  (2/6) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm=
: ERROR: Unexpected empty reply from server (1.82 s)
>>>>>>
>>>>>> The job.log content is:
>>>>>>
>>>>>>   L0351 DEBUG| Output: 'qemu-system-aarch64: host does not support i=
n-kernel GICv2 emulation\n'
>>>>>>
>>>>>> With this patch:
>>>>>>
>>>>>>  $ avocado --show=3Dapp run -t device:gicv3 tests/acceptance/
>>>>>>  (1/1)
>>>>>>  tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv3:
>>>>>>  PASS (55.10 s)
>>>>>
>>>>> On the new aarch64 machine which is GICv3 I get the following:
>>>>>
>>>>>  (006/142) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_=
kvm_gicv2: ERROR: Unexpected empty reply from server (0.47 s)
>>>>>
>>>>> which it shouldn't have run. However:
>>>>>
>>>>>   ./tests/venv/bin/avocado --show=3Dapp run -t device:gic3 tests/acce=
ptance/
>>>>>   Test Suite could not be create. No test references provided nor any=
 other arguments resolved into tests
>>>>>
>>>>> Is this something that has regressed or am I doing it wrong?
>>>>
>>>> Typo in the tag: "device:gic3" -> "device:gicv3"
>>>
>>> Doh!
>>>
>>> But what about:
>>>
>>> /tests/venv/bin/avocado run tests/acceptance/boot_linux.py:BootLinuxAar=
ch64.test_virt_kvm_gicv2
>>> JOB ID     : 396696d8f9d31d970878cb46025b2ced76f3623f
>>> JOB LOG    : /home/alex/avocado/job-results/job-2021-04-06T17.11-396696=
d/job.log
>>>  (1/1) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gi=
cv2: ERROR: Unexpected empty reply from server (0.65 s)
>>> RESULTS    : PASS 0 | ERROR 1 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 =
| CANCEL 0
>>> JOB TIME   : 0.96 s
>>>
>>> why doesn't that skip?
>>=20
>> /home/phil/avocado/job-results/job-2021-04-12T17.51-efdca81/job.log
>> 2021-04-12 17:52:44,589 machine          L0389 DEBUG| Output:
>> "qemu-system-aarch64: Could not find ROM image
>> '/home/phil/qemu/build/host/pc-bios/edk2-aarch64-code.fd'\n"
>>=20
>> Missing prerequisite:
>>=20
>> $ ninja pc-bios/edk2-aarch64-code.fd
>> [1/1] Generating edk2-aarch64-code.fd with a custom command (wrapped by
>> meson to capture output)
>>=20
>> Then we are good:
>>=20
>> $ avocado --show=3Dapp,console run -t device:gicv3 tests/acceptance
>> JOB ID     : e84401e5cc3ae53a3094c79491e661385cc7b4a7
>> JOB LOG    :
>> /home/phil/avocado/job-results/job-2021-04-12T17.53-e84401e/job.log
>>  (1/1)
>> tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv3:
>> PASS (16.38 s)
>> RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 |
>> CANCEL 0
>> JOB TIME   : 16.70 s
>>=20
>> Probably some missing dependency in Makefile/Meson?
>
> Are you using multiple build directories?

Yes - many.

> I could reproduce doing:
>
> $ mkdir A B
> $ cd A
> $ make check-qtest-aarch64
> $ avocado --show=3Dapp,console run -t device:gicv3 tests/acceptance
> $ cd ../B
> $ ninja qemu-system-aarch64
> $ avocado --show=3Dapp,console run -t device:gicv3 tests/acceptance
>
> In A edk2-aarch64-code.fd has been expanded in A/pc-bios/,
> in B it isn't.
>
> check-acceptance is a Makefile rule, not a ninja one...
> I suppose we need to convert it to ninja to be able to use the
> rest of the dependencies checks.
>
> Cc'ing Paolo because I'm not sure what the best move and where
> to plug things.


--=20
Alex Benn=C3=A9e
