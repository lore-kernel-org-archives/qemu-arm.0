Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id g17sm7287507wrh.72.2021.06.08.07.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 07:36:47 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7B7F11FF7E;
	Tue,  8 Jun 2021 15:36:45 +0100 (BST)
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-97-alex.bennee@linaro.org>
 <fdb8ac5d-e6c6-0e13-e8df-f1e3e022c98d@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, Thomas Huth
 <thuth@redhat.com>, "open list:IDE" <qemu-block@nongnu.org>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, John Snow
 <jsnow@redhat.com>
Subject: Re: [PATCH v16 96/99] tests/qtest: split the cdrom-test into
 arm/aarch64
Date: Tue, 08 Jun 2021 15:27:00 +0100
In-reply-to: <fdb8ac5d-e6c6-0e13-e8df-f1e3e022c98d@linaro.org>
Message-ID: <87im2ol8xu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: /nbR6nJwpTwm


Richard Henderson <richard.henderson@linaro.org> writes:

> On 6/4/21 8:53 AM, Alex Benn=C3=A9e wrote:
>> The assumption that the qemu-system-aarch64 image can run all 32 bit
>> machines is about to be broken...
>
> Um, what?

Really what we want is to probe the -M (machines) that a binary
supports rather than just barfing the test because we've built a QEMU
that doesn't support all the random 32 bit machines.

> r~
>
>
>
>  and besides it's not likely this is
>> improving out coverage by much. Test the "virt" machine for both arm
>> and aarch64 as it can be used by either architecture.

I think this point still stands though, I don't think we get much from
running the cdrom test with realview et all on qemu-system-aarch64.


>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   tests/qtest/cdrom-test.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>> diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
>> index 5af944a5fb..1e74354624 100644
>> --- a/tests/qtest/cdrom-test.c
>> +++ b/tests/qtest/cdrom-test.c
>> @@ -220,13 +220,16 @@ int main(int argc, char **argv)
>>               "magnum", "malta", "pica61", NULL
>>           };
>>           add_cdrom_param_tests(mips64machines);
>> -    } else if (g_str_equal(arch, "arm") || g_str_equal(arch, "aarch64")=
) {
>> +    } else if (g_str_equal(arch, "arm")) {
>>           const char *armmachines[] =3D {
>>               "realview-eb", "realview-eb-mpcore", "realview-pb-a8",
>>               "realview-pbx-a9", "versatileab", "versatilepb", "vexpress=
-a15",
>>               "vexpress-a9", "virt", NULL
>>           };
>>           add_cdrom_param_tests(armmachines);
>> +    } else if (g_str_equal(arch, "aarch64")) {
>> +        const char *aarch64machines[] =3D { "virt", NULL };
>> +        add_cdrom_param_tests(aarch64machines);
>>       } else {
>>           const char *nonemachine[] =3D { "none", NULL };
>>           add_cdrom_param_tests(nonemachine);
>>=20


--=20
Alex Benn=C3=A9e
