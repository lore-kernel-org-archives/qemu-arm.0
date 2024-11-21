Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa4f41530d9sm104785466b.29.2024.11.21.09.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 09:31:13 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id A781D5F7B1;
	Thu, 21 Nov 2024 17:31:12 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
  "Michael S. Tsirkin" <mst@redhat.com>,  Daniel Henrique Barboza
 <danielhb413@gmail.com>,  Pierrick Bouvier <pierrick.bouvier@linaro.org>,
  Harsh Prateek Bora <harshpb@linux.ibm.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Jiaxun Yang <jiaxun.yang@flygoat.com>,
  Halil Pasic <pasic@linux.ibm.com>,  Christian Borntraeger
 <borntraeger@linux.ibm.com>,  qemu-ppc@nongnu.org,  Daniel Henrique
 Barboza <dbarboza@ventanamicro.com>,  Alexandre Iooss <erdnaxe@crans.org>,
  qemu-riscv@nongnu.org,  Thomas Huth <huth@tuxfamily.org>,  Bernhard
 Beschow <shentey@gmail.com>,  Thomas Huth <thuth@redhat.com>,  Eric Farman
 <farman@linux.ibm.com>,  Bin Meng <bmeng.cn@gmail.com>,
  qemu-s390x@nongnu.org,  Niek Linnenbank <nieklinnenbank@gmail.com>,
  qemu-arm@nongnu.org,  John Snow <jsnow@redhat.com>,  Wainer dos Santos
 Moschetta <wainersm@redhat.com>,  Cleber Rosa <crosa@redhat.com>,
  qemu-rust@nongnu.org,  Nicholas Piggin <npiggin@gmail.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,
  Markus Armbruster <armbru@redhat.com>,  Weiwei Li <liwei1518@gmail.com>,
  Mahmoud Mandour <ma.mandourr@gmail.com>,  Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,  Aurelien Jarno <aurelien@aurel32.net>,
  Ani Sinha <anisinha@redhat.com>,  Alistair Francis
 <alistair.francis@wdc.com>
Subject: Re: [PATCH 00/39] maintainer updates for -rc2 pre-PR
In-Reply-To: <CAFEAcA8KD4qxY18pJakSeziTioNYDQkd3VYcxYfq9y2KAON4Wg@mail.gmail.com>
	(Peter Maydell's message of "Thu, 21 Nov 2024 17:19:38 +0000")
References: <20241121165806.476008-1-alex.bennee@linaro.org>
	<CAFEAcA8KD4qxY18pJakSeziTioNYDQkd3VYcxYfq9y2KAON4Wg@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 21 Nov 2024 17:31:12 +0000
Message-ID: <875xoglcin.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 0kFlrcrQWf4H

Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 21 Nov 2024 at 16:58, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> This is a mostly testing focused set of patches but a few bug fixes as
>> well. I plan to send the PR in on Monday. I can drop any patches that
>> are objected to but I think its pretty safe.
>>
>> Contains:
>>
>>   - Daniel's clean-up of functional tests
>>   - Another avocado->function conversion from Thomas
>>   - Update the tuxrun baseline images
>>   - Minor fix to the rust pl011 device
>>   - Documentation clarification on identity
>
> Should we really be updating the tuxrun baseline images
> in the middle of a release freeze period? Unless the old images
> are going to go away and break the tests, I think it would
> be better to stick with what we're currently testing.

Well the arm64be fixed a real problem and while I was at it I figured
might as well keep the rest in sync. I have tested them so they all pass
(although I'm waiting on the CI run now).

>
> thanks
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
