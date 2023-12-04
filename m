Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id p8-20020a5d4e08000000b0033349bccac6sm2944476wrt.1.2023.12.04.04.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 04:40:49 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 860BC5F75B;
	Mon,  4 Dec 2023 12:40:48 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  Eric Farman <farman@linux.ibm.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Leif Lindholm
 <quic_llindhol@quicinc.com>,  Beraldo Leal <bleal@redhat.com>,  Andrew
 Jeffery <andrew@codeconstruct.com.au>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>,  Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>,  qemu-arm@nongnu.org,  Radoslaw Biernacki
 <rad@semihalf.com>,  Yoshinori Sato <ysato@users.sourceforge.jp>,  Eric
 Auger <eric.auger@redhat.com>,  Halil Pasic <pasic@linux.ibm.com>,
  qemu-s390x@nongnu.org,  Wainer dos Santos Moschetta
 <wainersm@redhat.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
  Christian
 Borntraeger <borntraeger@linux.ibm.com>,  Aurelien Jarno
 <aurelien@aurel32.net>,  Cleber Rosa <crosa@redhat.com>,  Joel Stanley
 <joel@jms.id.au>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: Re: [PATCH v2 6/7] gitlab: build the correct microblaze target
In-Reply-To: <a9b7f414-5229-4dc6-9d32-b95d36cdbaf7@redhat.com> (Thomas Huth's
	message of "Mon, 4 Dec 2023 08:54:52 +0100")
References: <20231201093633.2551497-1-alex.bennee@linaro.org>
	<20231201093633.2551497-7-alex.bennee@linaro.org>
	<a9b7f414-5229-4dc6-9d32-b95d36cdbaf7@redhat.com>
User-Agent: mu4e 1.11.26; emacs 29.1
Date: Mon, 04 Dec 2023 12:40:48 +0000
Message-ID: <871qc29m3z.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: loXYkDoAbvzA

Thomas Huth <thuth@redhat.com> writes:

> On 01/12/2023 10.36, Alex Benn=C3=A9e wrote:
>> We inadvertently built the LE target for BE tests.
>> Fixes: 78ebc00b06 (gitlab: shuffle some targets and reduce avocado
>> noise)
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   .gitlab-ci.d/buildtest.yml | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
>> index 7f9af83b10..62b5379a5e 100644
>> --- a/.gitlab-ci.d/buildtest.yml
>> +++ b/.gitlab-ci.d/buildtest.yml
>> @@ -41,7 +41,7 @@ build-system-ubuntu:
>>     variables:
>>       IMAGE: ubuntu2204
>>       CONFIGURE_ARGS: --enable-docs
>> -    TARGETS: alpha-softmmu microblazeel-softmmu mips64el-softmmu
>> +    TARGETS: alpha-softmmu microblaze-softmmu mips64el-softmmu
>>       MAKE_CHECK_ARGS: check-build
>>     check-system-ubuntu:
>
> We've got microblazeel-softmmu here and microblaze-softmmu in the
> build-system-fedora job. So please don't change the ubuntu job here,
> otherwise we're building the same target twice instead.

Hmm - what would be really useful is an actual microblazeel test image
so we can test what we build.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
