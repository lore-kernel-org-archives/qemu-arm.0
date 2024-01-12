Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id c11-20020a05600c0a4b00b0040d53588d94sm10357998wmq.46.2024.01.12.08.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 08:46:51 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 3147A5F7A9;
	Fri, 12 Jan 2024 16:46:51 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,
  qemu-s390x@nongnu.org,  qemu-ppc@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  Song Gao <gaosong@loongson.cn>,
  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,  David
 Hildenbrand
 <david@redhat.com>,  Aurelien Jarno <aurelien@aurel32.net>,  Yoshinori
 Sato <ysato@users.sourceforge.jp>,  Yanan Wang <wangyanan55@huawei.com>,
  Bin Meng <bin.meng@windriver.com>,  Laurent Vivier <lvivier@redhat.com>,
  Michael Rolnik <mrolnik@gmail.com>,  Alexandre Iooss <erdnaxe@crans.org>,
  David Woodhouse <dwmw2@infradead.org>,  Laurent Vivier
 <laurent@vivier.eu>,  Paolo Bonzini <pbonzini@redhat.com>,  Brian Cain
 <bcain@quicinc.com>,  Daniel Henrique Barboza <danielhb413@gmail.com>,
  Beraldo Leal <bleal@redhat.com>,  Paul Durrant <paul@xen.org>,  Mahmoud
 Mandour <ma.mandourr@gmail.com>,  Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,  Cleber Rosa <crosa@redhat.com>,
  kvm@vger.kernel.org,  Wainer dos Santos Moschetta <wainersm@redhat.com>,
  qemu-arm@nongnu.org,  Weiwei Li <liwei1518@gmail.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  John Snow
 <jsnow@redhat.com>,  Daniel
 Henrique Barboza <dbarboza@ventanamicro.com>,  Nicholas Piggin
 <npiggin@gmail.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>,  Ilya Leoshkevich
 <iii@linux.ibm.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
  "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>,  Eduardo Habkost
 <eduardo@habkost.net>,  Pierrick Bouvier <pierrick.bouvier@linaro.org>,
  qemu-riscv@nongnu.org,  Alistair Francis <alistair.francis@wdc.com>,
  Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 12/43] qtest: bump boot-serial-test timeout to 3 minutes
In-Reply-To: <cf617223-0a0b-4d42-84a3-cd323ea4c421@redhat.com> (Thomas Huth's
	message of "Fri, 12 Jan 2024 16:13:16 +0100")
References: <20240103173349.398526-1-alex.bennee@linaro.org>
	<20240103173349.398526-13-alex.bennee@linaro.org>
	<cf617223-0a0b-4d42-84a3-cd323ea4c421@redhat.com>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Fri, 12 Jan 2024 16:46:51 +0000
Message-ID: <871qamwlc4.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: c7M1raCWZaaE

Thomas Huth <thuth@redhat.com> writes:

> On 03/01/2024 18.33, Alex Benn=C3=A9e wrote:
>> From: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> The boot-serial-test takes about 1 + 1/2 minutes in a --enable-debug
>> build. Bumping to 3 minutes will give more headroom.
>> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> Message-ID: <20230717182859.707658-9-berrange@redhat.com>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> Message-Id: <20231215070357.10888-9-thuth@redhat.com>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   tests/qtest/meson.build | 1 +
>>   1 file changed, 1 insertion(+)
>> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
>> index c7944e8dbe9..dc1e6da5c7b 100644
>> --- a/tests/qtest/meson.build
>> +++ b/tests/qtest/meson.build
>> @@ -6,6 +6,7 @@ slow_qtests =3D {
>>     'test-hmp' : 240,
>>     'pxe-test': 600,
>>     'prom-env-test': 360,
>> +  'boot-serial-test': 180,
>>   }
>>     qtests_generic =3D [
>
> 3 minutes was obviously not enough:
>
>  https://gitlab.com/qemu-project/qemu/-/jobs/5918818492#L4984
>
> And in older runs, we can see that the boot-serial-test might take
> longer than 180s when run with TCI :
>
>  https://gitlab.com/qemu-project/qemu/-/jobs/5890481086#L4772
>
> So I think we should bump the timeout to 240s here. Alex, are you
> going to respin your pull request? If so, could you modify your patch?
> Otherwise I can also send a new version of this patch here, just let
> me know.

I'm travelling now so its tricky to respin. If you could send a new
version that would be great.


>
>  Thomas

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
