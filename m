Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb98640619sm1036057166b.54.2025.02.21.07.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 07:29:25 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 7A7655F8C8;
	Fri, 21 Feb 2025 15:29:24 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  qemu-arm@nongnu.org,
  qemu-devel@nongnu.org,  Radoslaw Biernacki <rad@semihalf.com>,  Leif
 Lindholm <leif.lindholm@oss.qualcomm.com>,  Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: Re: [PATCH] tests/functional: Bump some arm test timeouts
In-Reply-To: <12ff6477-7cd5-4ada-b7a8-97a3add814c3@redhat.com> (Thomas Huth's
	message of "Fri, 21 Feb 2025 15:25:21 +0100")
References: <20250221140640.786341-1-peter.maydell@linaro.org>
	<12ff6477-7cd5-4ada-b7a8-97a3add814c3@redhat.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 21 Feb 2025 15:29:24 +0000
Message-ID: <87eczriaej.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: FSlSK/QZDCQo

Thomas Huth <thuth@redhat.com> writes:

> On 21/02/2025 15.06, Peter Maydell wrote:
>> On my local machine, for a debug build, sbsaref_alpine takes
>> nearly 900s:
>> $ (cd build/x86 && ./pyvenv/bin/meson test --setup thorough --suite
>> func-thorough func-aarch64-aarch64_sbsaref_alpine
>> )
>> 1/1 qemu:func-thorough+func-aarch64-thorough+thorough /
>> func-aarch64-aarch64_sbsaref_alpine
>>                        OK 896.90s
>> arm_aspeed_rainier can also run close to its current timeout:
>>   6/44 qemu:func-thorough+func-arm-thorough+thorough / func-arm-arm_aspe=
ed_rainier
>>                        OK 215.75s
>> and arm_aspeed_ast2500 and arm_aspeed_ast2600 can go over:
>> 13/44 qemu:func-thorough+func-arm-thorough+thorough / func-arm-arm_aspee=
d_ast2600
>>                        OK 792.94s
>> 27/44 qemu:func-thorough+func-arm-thorough+thorough /
>> func-arm-arm_aspeed_ast2500
>>                   TIMEOUT 480.01s
>> The sx1 test fails not on the overall meson timeout but on the
>> 60 second timeout in some of the subtests.
>> Bump all these timeouts up a bit.
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> This at least gets 'make -j4 check-functional' to passing for me
>> for an arm/aarch64 debug build, apart from the gpu test hang which
>> we're discussing in a different thread. Whole thing takes 25 mins...
>> ---
>>   tests/functional/meson.build     | 8 ++++----
>>   tests/functional/test_arm_sx1.py | 6 +++---
>>   2 files changed, 7 insertions(+), 7 deletions(-)
>> diff --git a/tests/functional/meson.build
>> b/tests/functional/meson.build
>> index b516d21cba1..effa31701cf 100644
>> --- a/tests/functional/meson.build
>> +++ b/tests/functional/meson.build
>> @@ -15,16 +15,16 @@ test_timeouts =3D {
>>     'aarch64_raspi4' : 480,
>>     'aarch64_rme_virt' : 1200,
>>     'aarch64_rme_sbsaref' : 1200,
>> -  'aarch64_sbsaref_alpine' : 720,
>> +  'aarch64_sbsaref_alpine' : 1200,
>
> I wonder whether we should disable that test with @skipSlowTest() by
> default, since it's really very slow...?

The pauth subtest is marked as @skipSlowTest() - but I think we can drop
test_sbsaref_alpine_linux_cortex_a57 and
test_sbsaref_alpine_linux_max_pauth_off because we don't actually verify
anything so its wasted cycles booting something that we know already
boots.

>
> Anyway, for this patch here:
> Reviewed-by: Thomas Huth <thuth@redhat.com>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
