Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id y2-20020a1c4b02000000b003e203681b26sm14811123wma.29.2023.03.01.01.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 01:58:35 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 316C71FFB7;
	Wed,  1 Mar 2023 09:58:35 +0000 (GMT)
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-25-alex.bennee@linaro.org>
 <72580c0e-353b-bb91-444e-b56d4c6ff7ba@redhat.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Michael Roth
 <michael.roth@amd.com>, Peter Maydell <peter.maydell@linaro.org>, Kevin
 Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>, Alexander
 Bulekov <alxndr@bu.edu>, Aurelien Jarno <aurelien@aurel32.net>, Markus
 Armbruster <armbru@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Darren Kenny <darren.kenny@oracle.com>, Hanna Reitz
 <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>, John Snow
 <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Yonggang Luo <luoyonggang@gmail.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>, Li-Wen Hsu
 <lwhsu@freebsd.org>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Laurent
 Vivier <lvivier@redhat.com>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v3 24/24] tests/avocado: disable BootLinuxPPC64 test in CI
Date: Wed, 01 Mar 2023 09:57:34 +0000
In-reply-to: <72580c0e-353b-bb91-444e-b56d4c6ff7ba@redhat.com>
Message-ID: <871qm8eqt0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: TSlWLXFCkzDV


Thomas Huth <thuth@redhat.com> writes:

> On 28/02/2023 20.06, Alex Benn=C3=A9e wrote:
>> This test is exceptionally heavyweight (nearly 330s) compared to the
>> two (both endians) TuxRun baseline tests which complete in under 160s.
>> The coverage is slightly reduced but a more directed test could make
>> up the difference.
>> tests/avocado/tuxrun_baselines.py:TuxRunBaselineTest.test_ppc64:
>> Overall coverage rate:
>>    lines......: 9.6% (44110 of 458817 lines)
>>    functions..: 16.5% (6767 of 41054 functions)
>>    branches...: 6.0% (13395 of 222634 branches)
>> tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg:
>> Overall coverage rate:
>>    lines......: 11.6% (53408 of 458817 lines)
>>    functions..: 18.7% (7691 of 41054 functions)
>>    branches...: 7.9% (17692 of 224218 branches)
>> So lets skip for GITLAB_CI and also unless AVOCADO_TIMEOUT_EXPECTED
>> is
>> specified by the user.
>
> The explanation sounds somewhat implausible to me.
> AVOCADO_TIMEOUT_EXPECTED should be for jobs where we are not sure
> whether the job really finishes in time, e.g. when compiling QEMU with
> debug flags enabled, and not for jobs that simply run a little bit
> longer (in the latter case, it would be enough to simply bump the
> timeout setting a little bit if necessary). So did you check whether
> you really run into timeout issues here when compiling QEMU with debug
> flags?

Ahh I realise now that I was running into the timeout because it was a
gcov build. I'll drop the AVOACADO_TIMEOUT_EXPECTED bit for now.

>
> Anyway, if you add AVOCADO_TIMEOUT_EXPECTED, then I think you don't
> need GITLAB_CI anymore, since we certainly don't set
> AVOCADO_TIMEOUT_EXPECTED in the gitlab CI.
>
>  Thomas


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
