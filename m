Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id n4-20020a05600c3b8400b0040b40468c98sm6211232wms.10.2023.11.30.08.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 08:59:56 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 00C9F5FB51;
	Thu, 30 Nov 2023 16:59:55 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  Eric Farman <farman@linux.ibm.com>,  Cleber Rosa
 <crosa@redhat.com>,  Andrew Jeffery <andrew@codeconstruct.com.au>,  Wainer
 dos Santos Moschetta <wainersm@redhat.com>,  Philippe =?utf-8?Q?Mathieu-D?=
 =?utf-8?Q?aud=C3=A9?=
 <philmd@linaro.org>,  Yoshinori Sato <ysato@users.sourceforge.jp>,
  =?utf-8?Q?C=C3=A9dric?=
 Le Goater <clg@kaod.org>,  Eric Auger <eric.auger@redhat.com>,
  qemu-arm@nongnu.org,  Halil Pasic <pasic@linux.ibm.com>,  Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>,  Aurelien Jarno <aurelien@aurel32.net>,
  qemu-s390x@nongnu.org,  Beraldo Leal <bleal@redhat.com>,  Joel Stanley
 <joel@jms.id.au>,  Paolo Bonzini <pbonzini@redhat.com>,  Christian
 Borntraeger <borntraeger@linux.ibm.com>,  Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/3] docs/devel: rationalise unstable gitlab tests under
 FLAKY_TESTS
In-Reply-To: <CAFEAcA91HawkhdxmQmz-+t1favfWmzJCpgAy6xr_1+AEomEXNg@mail.gmail.com>
	(Peter Maydell's message of "Thu, 30 Nov 2023 16:40:06 +0000")
References: <20231130153333.2424775-1-alex.bennee@linaro.org>
	<20231130153333.2424775-3-alex.bennee@linaro.org>
	<CAFEAcA91HawkhdxmQmz-+t1favfWmzJCpgAy6xr_1+AEomEXNg@mail.gmail.com>
User-Agent: mu4e 1.11.25; emacs 29.1
Date: Thu, 30 Nov 2023 16:59:55 +0000
Message-ID: <87jzpz6ut0.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Z7zjur7CKaZq

Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 30 Nov 2023 at 15:33, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> It doesn't make sense to have two classes of flaky tests. While it may
>> take the constrained environment of CI to trigger failures easily it
>> doesn't mean they don't occasionally happen on developer machines. As
>> CI is the gating factor to passing there is no point developers
>> running the tests locally anyway unless they are trying to fix things.
>>
>> While we are at it update the language in the docs to discourage the
>> QEMU_TEST_FLAKY_TESTS becoming a permanent solution.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  docs/devel/testing.rst                   | 31 +++++++++++++++---------
>>  tests/avocado/boot_linux.py              |  8 +++---
>>  tests/avocado/boot_linux_console.py      |  5 ++--
>>  tests/avocado/intel_iommu.py             |  5 ++--
>>  tests/avocado/linux_initrd.py            |  5 ++--
>>  tests/avocado/machine_aspeed.py          |  8 +++---
>>  tests/avocado/machine_mips_malta.py      |  8 +++---
>>  tests/avocado/machine_rx_gdbsim.py       |  8 +++---
>>  tests/avocado/machine_s390_ccw_virtio.py |  2 +-
>>  tests/avocado/replay_kernel.py           |  5 ++--
>>  tests/avocado/reverse_debugging.py       | 14 +++++++----
>>  tests/avocado/smmu.py                    |  5 ++--
>>  tests/avocado/tuxrun_baselines.py        |  4 +--
>>  13 files changed, 67 insertions(+), 41 deletions(-)
>>
>> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
>> index 22218dbedb..579d1837e0 100644
>> --- a/docs/devel/testing.rst
>> +++ b/docs/devel/testing.rst
>> @@ -1371,23 +1371,32 @@ conditions. For example, tests that take longer =
to execute when QEMU is
>>  compiled with debug flags. Therefore, the ``AVOCADO_TIMEOUT_EXPECTED`` =
variable
>>  has been used to determine whether those tests should run or not.
>>
>> -GITLAB_CI
>> -^^^^^^^^^
>> -A number of tests are flagged to not run on the GitLab CI. Usually beca=
use
>> -they proved to the flaky or there are constraints on the CI environment=
 which
>> -would make them fail. If you encounter a similar situation then use that
>> -variable as shown on the code snippet below to skip the test:
>> +QEMU_TEST_FLAKY_TESTS
>> +^^^^^^^^^^^^^^^^^^^^^
>> +Some tests are not working reliably and thus are disabled by default.
>> +This includes tests that don't run reliably on GitLab's CI which
>> +usually expose real issues that are rarely seen on developer machines
>> +due to the constraints of the CI environment. If you encounter a
>> +similar situation then mark the test as shown on the code snippet
>> +below:
>>
>>  .. code::
>>
>> -  @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>> +  @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on =
GitLab')
>>    def test(self):
>>        do_something()
>
> Can we also say here that when marking a test as flaky:
>  * we should raise a github issue giving details of what goes wrong
>  * the URL of that issue should be in a comment above the @skipUnless
>    line ?
>
> That way we have a history of why we disabled the test and we
> might even manage to fix it some day, in which case we'll know
> we are able to unmark it as flaky...

Good idea, I'll update.

>
>> +To run such tests locally you will need to set the environment
>> +variable. For example:
>> +
>> +.. code::
>> +
>> +   env QEMU_TEST_FLAKY_TESTS=3D1 ./pyvenv/bin/avocado run \
>> +      tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg
>
> The "env" here is unnecessary (assuming a standard Posix shell);
> "VAR=3Dvalue foo" will run "foo" with VAR set to 'value' only
> for the duration of that command.

Ahh I habit I've picked up from running a fish shell. Do we want to
assume everyone's interactive shell is Posix compatible?

>
> thanks
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
