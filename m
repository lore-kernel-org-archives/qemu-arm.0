Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e6251asm159811055e9.40.2025.01.13.13.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 13:09:48 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 39CBB5F713;
	Mon, 13 Jan 2025 21:09:47 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,  qemu-devel@nongnu.org,
  Eduardo Habkost <eduardo@habkost.net>,  Fabiano Rosas <farosas@suse.de>,
  Yanan Wang <wangyanan55@huawei.com>,  Zhao Liu <zhao1.liu@intel.com>,
  qemu-arm@nongnu.org,  Laurent Vivier <lvivier@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,
  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v2 0/3] Change default pointer authentication algorithm
 on aarch64 to impdef
In-Reply-To: <CAFEAcA_SHz2a0ZU=3e9AmZyJ_qn3e7nNhNm-hR9MdiTRjOyqWg@mail.gmail.com>
	(Peter Maydell's message of "Mon, 13 Jan 2025 12:34:09 +0000")
References: <20241219183211.3493974-1-pierrick.bouvier@linaro.org>
	<CAFEAcA_ChARwKyvRXsEk1U3q1T2528753Eu7LgDSsDbF1s5tNQ@mail.gmail.com>
	<CAFEAcA_SHz2a0ZU=3e9AmZyJ_qn3e7nNhNm-hR9MdiTRjOyqWg@mail.gmail.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Mon, 13 Jan 2025 21:09:47 +0000
Message-ID: <874j22l8tg.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: hB2yuLPo/Qlq

Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 10 Jan 2025 at 16:28, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>>
>> On Thu, 19 Dec 2024 at 18:32, Pierrick Bouvier
>> <pierrick.bouvier@linaro.org> wrote:
>> >
>> > qemu-system-aarch64 default pointer authentication (QARMA5) is expensi=
ve, we
>> > spent up to 50% of the emulation time running it (when using TCG).
>> >
>> > Switching to pauth-impdef=3Don is often given as a solution to speed u=
p execution.
>> > Thus we talked about making it the new default.
>> >
>> > The first patch introduce a new property (pauth-qarma5) to allow to se=
lect
>> > current default algorithm.
>> > The second one change the default.
>> > The third one updates documentation.
>> >
>> > v2:
>> > - ensure we don't break migration compatibility, by using a specific b=
ackward
>> >   compatible property.
>> > - added some documentation about migration for arm virt machine model.
>>
>> Other than a minor change to the 3rd docs patch which I'll note there:
>> applied to target-arm.next, thanks.
>
> I just noticed that this series breaks 'make check-tcg', because
> the pauth-3 test is explicitly checking the output of the
> pointer-auth operation. I'm going to add in this patch, which
> goes between patches 1 and 2 of this series:
>
> Author: Peter Maydell <peter.maydell@linaro.org>
> Date:   Mon Jan 13 11:42:57 2025 +0000
>
>     tests/tcg/aarch64: force qarma5 for pauth-3 test
>
>     The pauth-3 test explicitly tests that a computation of the
>     pointer-authentication produces the expected result.  This means that
>     it must be run with the QARMA5 algorithm.
>
>     Explicitly set the pauth algorithm when running this test, so that it
>     doesn't break when we change the default algorithm the 'max' CPU
>     uses.
>
>     Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> diff --git a/tests/tcg/aarch64/Makefile.softmmu-target
> b/tests/tcg/aarch64/Makefile.softmmu-target
> index d08d9b01ded..9c52475b7ae 100644
> --- a/tests/tcg/aarch64/Makefile.softmmu-target
> +++ b/tests/tcg/aarch64/Makefile.softmmu-target
> @@ -91,6 +91,9 @@ EXTRA_RUNS+=3Drun-memory-replay
>
>  ifneq ($(CROSS_CC_HAS_ARMV8_3),)
>  pauth-3: CFLAGS +=3D $(CROSS_CC_HAS_ARMV8_3)
> +# This test explicitly checks the output of the pauth operation so we
> +# must force the use of the QARMA5 algorithm for it.
> +run-pauth-3: QEMU_BASE_MACHINE=3D-M virt -cpu max,pauth-qarma5=3Don -dis=
play none
>  else
>  pauth-3:
>         $(call skip-test, "BUILD of $@", "missing compiler support")
<snip>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
