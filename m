Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id d17-20020a056000115100b002fa6929eb83sm3236459wrx.21.2023.04.17.10.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 10:44:19 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E30861FFB7;
	Mon, 17 Apr 2023 18:44:18 +0100 (BST)
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
 <20230417134321.3627231-2-alex.bennee@linaro.org>
 <CAFn=p-bqK-RsMo8wVy2zCxU=iAkXG1t9xVuoqLSN0UbTYKPgwQ@mail.gmail.com>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: John Snow <jsnow@redhat.com>
Cc: Cleber Rosa <crosa@redhat.com>, Jan Richter <jarichte@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Peter
 Maydell <peter.maydell@linaro.org>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Markus Armbruster <armbru@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Leif Lindholm
 <quic_llindhol@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>, Wainer
 dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org, Kautuk
 Consul <kconsul@linux.vnet.ibm.com>, Hariharan T S
 <hariharan.ts@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 1/6] tests/requirements.txt: bump up
 avocado-framework version to 101.0
Date: Mon, 17 Apr 2023 18:44:04 +0100
In-reply-to: <CAFn=p-bqK-RsMo8wVy2zCxU=iAkXG1t9xVuoqLSN0UbTYKPgwQ@mail.gmail.com>
Message-ID: <87pm82e74d.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: KJQJ3Zr1EDqu


John Snow <jsnow@redhat.com> writes:

> On Mon, Apr 17, 2023 at 9:43=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@lin=
aro.org> wrote:
>>
>> From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>>
>> Avocado version 101.0 has a fix to re-compute the checksum
>> of an asset file if the algorithm used in the *-CHECKSUM
>> file isn't the same as the one being passed to it by the
>> avocado user (i.e. the avocado_qemu python module).
>> In the earlier avocado versions this fix wasn't there due
>> to which if the checksum wouldn't match the earlier
>> checksum (calculated by a different algorithm), the avocado
>> code would start downloading a fresh image from the internet
>> URL thus making the test-cases take longer to execute.
>>
>> Bump up the avocado-framework version to 101.0.
>>
>> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>> Tested-by: Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
>> Message-Id: <20230327115030.3418323-2-kconsul@linux.vnet.ibm.com>
>> Message-Id: <20230330101141.30199-10-alex.bennee@linaro.org>
>>
>> ---
>> v2
>>   - limit --max-parallel-tasks $(JOBS_OPTION:-j%=3D%)
>> ---
>>  tests/Makefile.include | 18 +++++++++++-------
>>  tests/requirements.txt |  2 +-
>>  2 files changed, 12 insertions(+), 8 deletions(-)
>>
>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>> index 9422ddaece..a4de0ad5a2 100644
>> --- a/tests/Makefile.include
>> +++ b/tests/Makefile.include
>> @@ -138,14 +138,18 @@ get-vm-image-fedora-31-%: check-venv
>>  # download all vm images, according to defined targets
>>  get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, $(FEDO=
RA_31_DOWNLOAD))
>>
>> +JOBS_OPTION=3D$(lastword -j1 $(filter-out -j, $(filter -j%,$(MAKEFLAGS)=
)))
>> +
>>  check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>> -       $(call quiet-command, \
>> -            $(TESTS_PYTHON) -m avocado \
>> -            --show=3D$(AVOCADO_SHOW) run --job-results-dir=3D$(TESTS_RE=
SULTS_DIR) \
>> -            $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
>> -                       --filter-by-tags-include-empty-key) \
>> -            $(AVOCADO_CMDLINE_TAGS) \
>> -            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
>> +       $(call quiet-command,                                           =
        \
>> +            $(TESTS_PYTHON) -m avocado                                 =
                \
>> +            --show=3D$(AVOCADO_SHOW) run --job-results-dir=3D$(TESTS_RE=
SULTS_DIR)  \
>> +            $(if $(AVOCADO_TAGS),,                                     =
        \
>> +                       --filter-by-tags-include-empty                  =
        \
>> +                       --filter-by-tags-include-empty-key)             =
        \
>> +               --max-parallel-tasks $(JOBS_OPTION:-j%=3D%)             =
          \
>> +            $(AVOCADO_CMDLINE_TAGS)                                    =
        \
>> +            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS),           =
        \
>>              "AVOCADO", "tests/avocado")
>>
>>  check-acceptance-deprecated-warning:
>> diff --git a/tests/requirements.txt b/tests/requirements.txt
>> index 0ba561b6bd..a6f73da681 100644
>> --- a/tests/requirements.txt
>> +++ b/tests/requirements.txt
>> @@ -2,5 +2,5 @@
>>  # in the tests/venv Python virtual environment. For more info,
>>  # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
>>  # Note that qemu.git/python/ is always implicitly installed.
>> -avocado-framework=3D=3D88.1
>> +avocado-framework=3D=3D101.0
>>  pycdlib=3D=3D1.11.0
>> --
>> 2.39.2
>>
>
> I thought there were test failures that prohibited us from bumping the
> Avocado-Framework version. Did those get rectified recently?

I'm not seeing any with your patch applied.


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
