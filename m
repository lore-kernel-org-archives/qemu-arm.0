Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id b1-20020a5d4d81000000b003215c6e30cbsm12215349wru.104.2023.09.25.09.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 09:59:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1651F1FFBB;
	Mon, 25 Sep 2023 17:59:43 +0100 (BST)
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
 <20230925144854.1872513-5-alex.bennee@linaro.org>
 <ZRG1g/2hWi8+AzNn@redhat.com>
User-agent: mu4e 1.11.20; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>, John Snow <jsnow@redhat.com>,
 libvir-list@redhat.com, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Song Gao <gaosong@loongson.cn>, Daniel Henrique
 Barboza <danielhb413@gmail.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liweiwei@iscas.ac.cn>, Nicholas
 Piggin <npiggin@gmail.com>, Radoslaw Biernacki <rad@semihalf.com>, Eduardo
 Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Bin Meng
 <bin.meng@windriver.com>, Alexandre Iooss <erdnaxe@crans.org>, Xiaojuan
 Yang <yangxiaojuan@loongson.cn>, qemu-ppc@nongnu.org, David Hildenbrand
 <david@redhat.com>, Yanan Wang <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Laurent Vivier <lvivier@redhat.com>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Beraldo Leal <bleal@redhat.com>, Rabin Vincent <rabinv@axis.com>, "Edgar E
 . Iglesias" <edgar.iglesias@xilinx.com>
Subject: Re: [PATCH 04/31] docs: mark CRIS support as deprecated
Date: Mon, 25 Sep 2023 17:50:22 +0100
In-reply-to: <ZRG1g/2hWi8+AzNn@redhat.com>
Message-ID: <878r8urxxc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: MWtFtQm0i0b4


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Sep 25, 2023 at 03:48:27PM +0100, Alex Benn=C3=A9e wrote:
>> This might be premature but while streamling the avocado tests I
>> realised the only tests we have are "check-tcg" ones. The aging
>> fedora-criss-cross image works well enough for developers but can't be
>> used in CI as we need supported build platforms to build QEMU.
>>=20
>> Does this mean the writing is on the wall for this architecture?
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Rabin Vincent <rabinv@axis.com>
>> Cc: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>> ---
>>  docs/about/deprecated.rst | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>=20
>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>> index dc4da95329..7cfe313aa6 100644
>> --- a/docs/about/deprecated.rst
>> +++ b/docs/about/deprecated.rst
>> @@ -399,6 +399,17 @@ Specifying the iSCSI password in plain text on the =
command line using the
>>  used instead, to refer to a ``--object secret...`` instance that provid=
es
>>  a password via a file, or encrypted.
>>=20=20
>> +TCG CPUs
>> +--------
>> +
>> +CRIS CPU architecture (since 8.1)
>> +'''''''''''''''''''''''''''''''''
>> +
>> +The CRIS architecture was pulled from Linux in 4.17 and the compiler
>> +is no longer packaged in any distro making it harder to run the
>> +``check-tcg`` tests. Unless we can improve the testing situation there
>> +is a chance the code will bitrot without anyone noticing.
>
> Deprecated is generally a warning that we intend to delete the
> feature.   If we're just going to relegate it to untested
> status (what I'd call "tier 3" quality), then we should document
> that elsewhere.  I don't mind which way we go.

We do have reasonably good coverage with tests/tcg/cris but of course
without a compiler we can't build them.

Both nios2 and microblaze have build-toolchain scripts which can be used
to re-create containers. However my preference is having pre-built
toolchains hosted by others like we do for loongarch, hexagon, xtensa
and tricore. Then the docker image can simply curl them into an image.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
