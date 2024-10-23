Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d6328sm445752966b.40.2024.10.23.01.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 01:55:01 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 293D55F89C;
	Wed, 23 Oct 2024 09:55:00 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,  qemu-devel@nongnu.org,  Beraldo
 Leal <bleal@redhat.com>,  Laurent Vivier <laurent@vivier.eu>,  Wainer dos
 Santos Moschetta <wainersm@redhat.com>,  Mahmoud Mandour
 <ma.mandourr@gmail.com>,  Jiaxun Yang <jiaxun.yang@flygoat.com>,  Yanan
 Wang <wangyanan55@huawei.com>,  Thomas Huth <thuth@redhat.com>,  John Snow
 <jsnow@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
  qemu-arm@nongnu.org,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Eduardo
 Habkost <eduardo@habkost.net>,  devel@lists.libvirt.org,  Cleber Rosa
 <crosa@redhat.com>,  kvm@vger.kernel.org,  Philippe =?utf-8?Q?Mathieu-Dau?=
 =?utf-8?Q?d=C3=A9?=
 <philmd@linaro.org>,  Alexandre Iooss <erdnaxe@crans.org>,  Peter Maydell
 <peter.maydell@linaro.org>,  Richard Henderson
 <richard.henderson@linaro.org>,  Riku Voipio <riku.voipio@iki.fi>,  Zhao
 Liu <zhao1.liu@intel.com>,  Marcelo Tosatti <mtosatti@redhat.com>,  "Edgar
 E. Iglesias" <edgar.iglesias@gmail.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 07/20] tests/tcg/x86_64: Add cross-modifying code test
In-Reply-To: <17ab6a26-bfd2-4ee6-8fc4-c371d266dcb1@linaro.org> (Pierrick
	Bouvier's message of "Tue, 22 Oct 2024 17:33:21 -0700")
References: <20241022105614.839199-1-alex.bennee@linaro.org>
	<20241022105614.839199-8-alex.bennee@linaro.org>
	<6b18238b-f9c3-4046-964f-de16dc30d26e@linaro.org>
	<4c383f09bd6bd9b488ad301e5f050b8c9971f3a2.camel@linux.ibm.com>
	<17ab6a26-bfd2-4ee6-8fc4-c371d266dcb1@linaro.org>
User-Agent: mu4e 1.12.6; emacs 29.4
Date: Wed, 23 Oct 2024 09:55:00 +0100
Message-ID: <87y12fkxln.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 8z9MzvJrRzrh

Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:

> On 10/22/24 17:16, Ilya Leoshkevich wrote:
>> On Tue, 2024-10-22 at 13:36 -0700, Pierrick Bouvier wrote:
>>> On 10/22/24 03:56, Alex Benn=C3=A9e wrote:
>>>> From: Ilya Leoshkevich <iii@linux.ibm.com>
>>>>
>>>> commit f025692c992c ("accel/tcg: Clear PAGE_WRITE before
>>>> translation")
>>>> fixed cross-modifying code handling, but did not add a test. The
>>>> changed code was further improved recently [1], and I was not sure
>>>> whether these modifications were safe (spoiler: they were fine).
>>>>
>>>> Add a test to make sure there are no regressions.
>>>>
>>>> [1]
>>>> https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg00034.html
>>>>
>>>> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
>>>> Message-Id: <20241001150617.9977-1-iii@linux.ibm.com>
>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>> ---
>>>>  =C2=A0 tests/tcg/x86_64/cross-modifying-code.c | 80
>>>> +++++++++++++++++++++++++
>>>>  =C2=A0 tests/tcg/x86_64/Makefile.target=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 4 ++
>>>>  =C2=A0 2 files changed, 84 insertions(+)
>>>>  =C2=A0 create mode 100644 tests/tcg/x86_64/cross-modifying-code.c
>>>>
>>>> diff --git a/tests/tcg/x86_64/cross-modifying-code.c
>>>> b/tests/tcg/x86_64/cross-modifying-code.c
>>>> new file mode 100644
>>>> index 0000000000..2704df6061
>>>> --- /dev/null
>>>> +++ b/tests/tcg/x86_64/cross-modifying-code.c
>>>> @@ -0,0 +1,80 @@
>>>> +/*
>>>> + * Test patching code, running in one thread, from another thread.
>>>> + *
>>>> + * Intel SDM calls this "cross-modifying code" and recommends a
>>>> special
>>>> + * sequence, which requires both threads to cooperate.
>>>> + *
>>>> + * Linux kernel uses a different sequence that does not require
>>>> cooperation and
>>>> + * involves patching the first byte with int3.
>>>> + *
>>>> + * Finally, there is user-mode software out there that simply uses
>>>> atomics, and
>>>> + * that seems to be good enough in practice. Test that QEMU has no
>>>> problems
>>>> + * with this as well.
>>>> + */
>>>> +
>>>> +#include <assert.h>
>>>> +#include <pthread.h>
>>>> +#include <stdbool.h>
>>>> +#include <stdlib.h>
>>>> +
>>>> +void add1_or_nop(long *x);
>>>> +asm(".pushsection .rwx,\"awx\",@progbits\n"
>>>> +=C2=A0=C2=A0=C2=A0 ".globl add1_or_nop\n"
>>>> +=C2=A0=C2=A0=C2=A0 /* addq $0x1,(%rdi) */
>>>> +=C2=A0=C2=A0=C2=A0 "add1_or_nop: .byte 0x48, 0x83, 0x07, 0x01\n"
>>>> +=C2=A0=C2=A0=C2=A0 "ret\n"
>>>> +=C2=A0=C2=A0=C2=A0 ".popsection\n");
>>>> +
>>>> +#define THREAD_WAIT 0
>>>> +#define THREAD_PATCH 1
>>>> +#define THREAD_STOP 2
>>>> +
>>>> +static void *thread_func(void *arg)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 int val =3D 0x0026748d; /* nop */
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 while (true) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (__atomic_load_n((i=
nt *)arg, __ATOMIC_SEQ_CST)) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case THREAD_WAIT:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 br=
eak;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case THREAD_PATCH:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 va=
l =3D __atomic_exchange_n((int *)&add1_or_nop, val,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 __ATOMIC_SEQ_CST);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 br=
eak;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case THREAD_STOP:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn NULL;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 as=
sert(false);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __=
builtin_unreachable();
>>>
>>> Use g_assert_not_reached() instead.
>>> checkpatch emits an error for it now.
>> Is there an easy way to include glib from testcases?
>> It's located using meson, and I can't immediately see how to push the
>> respective compiler flags to the test Makefiles - this seems to be
>> currently handled by configure writing to $config_target_mak.
>> [...]
>>=20
>
> Sorry you're right, I missed the fact tests don't have the deps we
> have in QEMU itself.
> I don't think any test case include any extra dependency for now (and
> would make it hard to cross compile them too), so it's not worth
> trying to get the right glib header for this.

No we only have glibc for test cases.

>
> I don't now if it will be a problem when merging the series regarding
> checkpatch, but if it is, we can always replace this by abort, or
> exit.

Its a false positive in this case. We could tech checkpatch not to care
about glib-isms in tests/tcg but that would probaly make keeping it in
sync with the kernel version harder.

>
>>=20
>
> As it is,
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
