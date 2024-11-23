Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433cde114d5sm63238445e9.17.2024.11.23.07.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 07:29:15 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id D93295F7DF;
	Sat, 23 Nov 2024 15:29:14 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  qemu-devel@nongnu.org,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  "Michael S.
 Tsirkin"
 <mst@redhat.com>,  Daniel Henrique Barboza <danielhb413@gmail.com>,
  Pierrick Bouvier <pierrick.bouvier@linaro.org>,  Harsh Prateek Bora
 <harshpb@linux.ibm.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
  Jiaxun Yang <jiaxun.yang@flygoat.com>,  Halil Pasic
 <pasic@linux.ibm.com>,  Christian Borntraeger <borntraeger@linux.ibm.com>,
  qemu-ppc@nongnu.org,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  Alexandre Iooss <erdnaxe@crans.org>,
  qemu-riscv@nongnu.org,  Thomas Huth <huth@tuxfamily.org>,  Bernhard
 Beschow <shentey@gmail.com>,  Eric Farman <farman@linux.ibm.com>,  Bin
 Meng <bmeng.cn@gmail.com>,  qemu-s390x@nongnu.org,  Niek Linnenbank
 <nieklinnenbank@gmail.com>,  qemu-arm@nongnu.org,  John Snow
 <jsnow@redhat.com>,  Wainer dos Santos Moschetta <wainersm@redhat.com>,
  Cleber Rosa <crosa@redhat.com>,  qemu-rust@nongnu.org,  Nicholas Piggin
 <npiggin@gmail.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Palmer
 Dabbelt <palmer@dabbelt.com>,  Markus Armbruster <armbru@redhat.com>,
  Weiwei Li <liwei1518@gmail.com>,  Mahmoud Mandour
 <ma.mandourr@gmail.com>,  Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,  Aurelien Jarno <aurelien@aurel32.net>,
  Ani Sinha <anisinha@redhat.com>,  Alistair Francis
 <alistair.francis@wdc.com>
Subject: Re: [PATCH 00/39] maintainer updates for -rc2 pre-PR
In-Reply-To: <eb3dd52c-b7bc-4c77-ad33-33e52d7ecef7@redhat.com> (Thomas Huth's
	message of "Fri, 22 Nov 2024 11:45:42 +0100")
References: <20241121165806.476008-1-alex.bennee@linaro.org>
	<CAFEAcA8KD4qxY18pJakSeziTioNYDQkd3VYcxYfq9y2KAON4Wg@mail.gmail.com>
	<875xoglcin.fsf@draig.linaro.org>
	<eb3dd52c-b7bc-4c77-ad33-33e52d7ecef7@redhat.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Sat, 23 Nov 2024 15:29:14 +0000
Message-ID: <87wmguoto5.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ra5+O42bPVlj

Thomas Huth <thuth@redhat.com> writes:

> On 21/11/2024 18.31, Alex Benn=C3=A9e wrote:
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>=20
>>> On Thu, 21 Nov 2024 at 16:58, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>>>>
>>>> This is a mostly testing focused set of patches but a few bug fixes as
>>>> well. I plan to send the PR in on Monday. I can drop any patches that
>>>> are objected to but I think its pretty safe.
>>>>
>>>> Contains:
>>>>
>>>>    - Daniel's clean-up of functional tests
>>>>    - Another avocado->function conversion from Thomas
>>>>    - Update the tuxrun baseline images
>>>>    - Minor fix to the rust pl011 device
>>>>    - Documentation clarification on identity
>>>
>>> Should we really be updating the tuxrun baseline images
>>> in the middle of a release freeze period? Unless the old images
>>> are going to go away and break the tests, I think it would
>>> be better to stick with what we're currently testing.
>> Well the arm64be fixed a real problem and while I was at it I
>> figured
>> might as well keep the rest in sync. I have tested them so they all pass
>> (although I'm waiting on the CI run now).
>
> But there could be new intermittent problems in the new images ... so
> if we'd face such a problem, we would not know whether it is the image
> or whether it is QEMU. Thus maybe let's better keep the old versions
> for 9.2 (except for the arm64 patch that fixes a real problem), and
> use the new versions for 10.0 ?

Fair enough. Will drop the others for now.

>
>  Thomas

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
