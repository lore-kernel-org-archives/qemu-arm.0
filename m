Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36075104a3dsm10173809f8f.112.2024.06.16.11.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 11:43:37 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 429C85F91D;
	Sun, 16 Jun 2024 19:43:37 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
  qemu-devel@nongnu.org,
  David Hildenbrand <david@redhat.com>,  Ilya Leoshkevich
 <iii@linux.ibm.com>,  Daniel Henrique Barboza <danielhb413@gmail.com>,
  Marcelo Tosatti <mtosatti@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Mark Burton <mburton@qti.qualcomm.com>,
  qemu-s390x@nongnu.org,  Peter Maydell <peter.maydell@linaro.org>,
  kvm@vger.kernel.org,  Laurent Vivier <lvivier@redhat.com>,  Halil Pasic
 <pasic@linux.ibm.com>,  Christian Borntraeger <borntraeger@linux.ibm.com>,
  Alexandre Iooss <erdnaxe@crans.org>,  qemu-arm@nongnu.org,  Alexander
 Graf <agraf@csgraf.de>,  Nicholas Piggin <npiggin@gmail.com>,  Marco
 Liebel <mliebel@qti.qualcomm.com>,  Thomas Huth <thuth@redhat.com>,  Roman
 Bolshakov <rbolshakov@ddn.com>,  qemu-ppc@nongnu.org,  Mahmoud Mandour
 <ma.mandourr@gmail.com>,  Cameron Esfahani <dirty@apple.com>,  Jamie Iles
 <quic_jiles@quicinc.com>,  "Dr. David Alan Gilbert" <dave@treblig.org>,
  Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 9/9] contrib/plugins: add ips plugin example for cost
 modeling
In-Reply-To: <db8d82d4-c88d-45ac-bc99-e85a4240add2@linaro.org> (Pierrick
	Bouvier's message of "Fri, 14 Jun 2024 10:39:38 -0700")
References: <20240612153508.1532940-1-alex.bennee@linaro.org>
	<20240612153508.1532940-10-alex.bennee@linaro.org>
	<31ba8570-9009-4530-934d-3b73b07520d0@linaro.org>
	<db8d82d4-c88d-45ac-bc99-e85a4240add2@linaro.org>
Date: Sun, 16 Jun 2024 19:43:37 +0100
Message-ID: <87frtcsp7q.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: dCXHz+HyRlgU

Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:

> On 6/13/24 01:54, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 12/6/24 17:35, Alex Benn=C3=A9e wrote:
>>> From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>>
>>> This plugin uses the new time control interface to make decisions
>>> about the state of time during the emulation. The algorithm is
>>> currently very simple. The user specifies an ips rate which applies
>> ... IPS rate (Instructions Per Second) which ...
>>=20
>>> per core. If the core runs ahead of its allocated execution time the
>>> plugin sleeps for a bit to let real time catch up. Either way time is
>>> updated for the emulation as a function of total executed instructions
>>> with some adjustments for cores that idle.
>>>
>>> Examples
>>> --------
>>>
>>> Slow down execution of /bin/true:
>>> $ num_insn=3D$(./build/qemu-x86_64 -plugin ./build/tests/plugin/libinsn=
.so -d plugin /bin/true |& grep total | sed -e 's/.*: //')
>>> $ time ./build/qemu-x86_64 -plugin ./build/contrib/plugins/libips.so,ip=
s=3D$(($num_insn/4)) /bin/true
>>> real 4.000s
>>>
>>> Boot a Linux kernel simulating a 250MHz cpu:
>>> $ /build/qemu-system-x86_64 -kernel /boot/vmlinuz-6.1.0-21-amd64 -appen=
d "console=3DttyS0" -plugin ./build/contrib/plugins/libips.so,ips=3D$((250*=
1000*1000)) -smp 1 -m 512
>>> check time until kernel panic on serial0
>>>
>>> Tested in system mode by booting a full debian system, and using:
>>> $ sysbench cpu run
>>> Performance decrease linearly with the given number of ips.
>>>
>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> Message-Id: <20240530220610.1245424-7-pierrick.bouvier@linaro.org>
>>> ---
>>>    contrib/plugins/ips.c    | 164 +++++++++++++++++++++++++++++++++++++=
++
>>>    contrib/plugins/Makefile |   1 +
>>>    2 files changed, 165 insertions(+)
>>>    create mode 100644 contrib/plugins/ips.c
>>>
>>> diff --git a/contrib/plugins/ips.c b/contrib/plugins/ips.c
>>> new file mode 100644
>>> index 0000000000..db77729264
>>> --- /dev/null
>>> +++ b/contrib/plugins/ips.c
>>> @@ -0,0 +1,164 @@
>>> +/*
>>> + * ips rate limiting plugin.
>> The plugin names are really to packed to my taste (each time I look
>> for
>> one I have to open most source files to figure out the correct one); so
>> please ease my life by using a more descriptive header at least:
>>        Instructions Per Second (IPS) rate limiting plugin.
>> Thanks.
>>=20
>
> I agree most of the plugin names are pretty cryptic, and they are
> lacking a common "help" system, to describe what they do, and which
> options are available for them. It's definitely something we could add
> in the future.
>
> Regarding what you reported, I'm totally ok with the change.
>
> However, since this is a new series, I'm not if I or Alex should
> change it. If it's ok for you to modify this Alex, it could be simpler
> than waiting for me to push a new patch with just this.

Its my tree so I'll fix it up. I'll ask you if I want a respin ;-)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
