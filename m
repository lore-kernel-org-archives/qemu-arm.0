Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0d9bed7sm201495695e9.8.2024.12.03.10.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 10:10:45 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 216345F78C;
	Tue,  3 Dec 2024 18:10:44 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,  qemu-devel@nongnu.org,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Richard
 Henderson
 <richard.henderson@linaro.org>,  Andrew Melnychenko <andrew@daynix.com>,
  Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Jason Wang
 <jasowang@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,  Fabiano Rosas
 <farosas@suse.de>,  Kevin Wolf <kwolf@redhat.com>,  Markus Armbruster
 <armbru@redhat.com>,  Eric Blake <eblake@redhat.com>,
  qemu-arm@nongnu.org,  Yuri Benditovich <yuri.benditovich@daynix.com>,
  manos.pitsidianakis@linaro.org,  qemu-block@nongnu.org,  Michael Roth
 <michael.roth@amd.com>,  Konstantin Kostiuk <kkostiuk@redhat.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Peter Xu <peterx@redhat.com>,
  gustavo.romero@linaro.org
Subject: Re: [PATCH 6/7] docs: add a glossary
In-Reply-To: <CAFEAcA9JdLxi5cr-Z2-YX6Q8nv=j0O3k=f9u6gS-CzSf5BH7Ug@mail.gmail.com>
	(Peter Maydell's message of "Tue, 3 Dec 2024 17:37:22 +0000")
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
	<20241118172357.475281-7-pierrick.bouvier@linaro.org>
	<CAFEAcA9JdLxi5cr-Z2-YX6Q8nv=j0O3k=f9u6gS-CzSf5BH7Ug@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 03 Dec 2024 18:10:44 +0000
Message-ID: <87ttbkbpsr.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: xUpXNRrow4uw

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 18 Nov 2024 at 17:24, Pierrick Bouvier
> <pierrick.bouvier@linaro.org> wrote:
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>  docs/devel/control-flow-integrity.rst |   2 +
>>  docs/devel/multi-thread-tcg.rst       |   2 +
>>  docs/glossary/index.rst               | 238 ++++++++++++++++++++++++++
>>  docs/index.rst                        |   1 +
>>  docs/system/arm/virt.rst              |   2 +
>>  docs/system/images.rst                |   2 +
>>  docs/tools/qemu-nbd.rst               |   2 +
>>  7 files changed, 249 insertions(+)
>>  create mode 100644 docs/glossary/index.rst
>
> I think this is a good idea; we've had at least one bug
> report from a user pointing out that we had a term in
> our docs which we didn't define ("block driver"):
> https://gitlab.com/qemu-project/qemu/-/issues/2611
> I have some comments on specific entries below.
>
>> diff --git a/docs/devel/control-flow-integrity.rst b/docs/devel/control-=
flow-integrity.rst
>> index e6b73a4fe1a..3d5702fa4cc 100644
>> --- a/docs/devel/control-flow-integrity.rst
<snip>
>> +
>> +Device
>> +------
>> +
>> +QEMU is able to emulate a CPU, and all the hardware interacting with it,
>> +including many devices. When QEMU runs a virtual machine using a hardwa=
re-based
>> +accelerator, it is responsible for emulating, using software, all devic=
es.
>
> This definition doesn't actually define what a device is :-)

Also we can xref to:

  https://qemu.readthedocs.io/en/v9.1.0/system/device-emulation.html

where we go into a bit more detail about what a device, bus, frontend
and backend are.

>
>> +
>> +EDK2
>> +----
>> +
>> +EDK2, as known as `TianoCore <https://www.tianocore.org/>`_, is an open=
 source
>> +implementation of UEFI standard. It's ran by QEMU to support UEFI for v=
irtual
>> +machines.
>
> Replace last sentence with
> "QEMU virtual machines that boot a UEFI BIOS usually use EDK2."
> ?
>
<snip>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
