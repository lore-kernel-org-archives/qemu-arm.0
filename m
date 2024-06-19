Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f5f33c43sm226145235e9.7.2024.06.19.02.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 02:49:28 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id DB09F5F919;
	Wed, 19 Jun 2024 10:49:26 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,  qemu-devel@nongnu.org,
  David Hildenbrand <david@redhat.com>,  Ilya Leoshkevich
 <iii@linux.ibm.com>,  Daniel Henrique Barboza <danielhb413@gmail.com>,
  Marcelo Tosatti <mtosatti@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Mark
 Burton <mburton@qti.qualcomm.com>,  qemu-s390x@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  kvm@vger.kernel.org,  Laurent Vivier
 <lvivier@redhat.com>,  Halil Pasic <pasic@linux.ibm.com>,  Christian
 Borntraeger <borntraeger@linux.ibm.com>,  Alexandre Iooss
 <erdnaxe@crans.org>,  qemu-arm@nongnu.org,  Alexander Graf
 <agraf@csgraf.de>,  Nicholas Piggin <npiggin@gmail.com>,  Marco Liebel
 <mliebel@qti.qualcomm.com>,  Thomas Huth <thuth@redhat.com>,  Roman
 Bolshakov <rbolshakov@ddn.com>,  qemu-ppc@nongnu.org,  Mahmoud Mandour
 <ma.mandourr@gmail.com>,  Cameron Esfahani <dirty@apple.com>,  Jamie Iles
 <quic_jiles@quicinc.com>,  Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH 9/9] contrib/plugins: add ips plugin example for cost
 modeling
In-Reply-To: <78003bee-08f7-4860-a675-b09721955e60@linaro.org> (Pierrick
	Bouvier's message of "Tue, 18 Jun 2024 21:40:32 -0700")
References: <20240612153508.1532940-1-alex.bennee@linaro.org>
	<20240612153508.1532940-10-alex.bennee@linaro.org>
	<ZmoM2Sac97PdXWcC@gallifrey>
	<777e1b13-9a4f-4c32-9ff7-9cedf7417695@linaro.org>
	<Zmy9g1U1uP1Vhx9N@gallifrey>
	<616df287-a167-4a05-8f08-70a78a544929@linaro.org>
	<ZnCi4hcyR8wMMnK4@gallifrey>
	<4e5fded0-d1a9-4494-a66d-6488ce1bcb33@linaro.org>
	<874j9qefv0.fsf@draig.linaro.org>
	<78003bee-08f7-4860-a675-b09721955e60@linaro.org>
Date: Wed, 19 Jun 2024 10:49:26 +0100
Message-ID: <87jzilcleh.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: I7s3211HxBNr

Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:

> On 6/18/24 02:53, Alex Benn=C3=A9e wrote:
>> Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:
>>=20
>>> On 6/17/24 13:56, Dr. David Alan Gilbert wrote:
>>>> * Pierrick Bouvier (pierrick.bouvier@linaro.org) wrote:
>>>>> On 6/14/24 15:00, Dr. David Alan Gilbert wrote:
>>>>>> * Pierrick Bouvier (pierrick.bouvier@linaro.org) wrote:
>>>>>>> Hi Dave,
>>>>>>>
>>>>>>> On 6/12/24 14:02, Dr. David Alan Gilbert wrote:
>>>>>>>> * Alex Benn=C3=A9e (alex.bennee@linaro.org) wrote:
>>>>>>>>> From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>>>>>>>>
>>>>>>>>> This plugin uses the new time control interface to make decisions
>>>>>>>>> about the state of time during the emulation. The algorithm is
>>>>>>>>> currently very simple. The user specifies an ips rate which appli=
es
>>>>>>>>> per core. If the core runs ahead of its allocated execution time =
the
>>>>>>>>> plugin sleeps for a bit to let real time catch up. Either way tim=
e is
>>>>>>>>> updated for the emulation as a function of total executed instruc=
tions
>>>>>>>>> with some adjustments for cores that idle.
>>>>>>>>
>>>>>>>> A few random thoughts:
>>>>>>>>       a) Are there any definitions of what a plugin that controls =
time
>>>>>>>>          should do with a live migration?
>>>>>>>
>>>>>>> It's not something that was considered as part of this work.
>>>>>>
>>>>>> That's OK, the only thing is we need to stop anyone from hitting pro=
blems
>>>>>> when they don't realise it's not been addressed.
>>>>>> One way might be to add a migration blocker; see include/migration/b=
locker.h
>>>>>> then you might print something like 'Migration not available due to =
plugin ....'
>>>>>>
>>>>>
>>>>> So basically, we could make a call to migrate_add_blocker(), when som=
eone
>>>>> request time_control through plugin API?
>>>>>
>>>>> IMHO, it's something that should be part of plugin API (if any plugin=
 calls
>>>>> qemu_plugin_request_time_control()), instead of the plugin code itsel=
f. This
>>>>> way, any plugin getting time control automatically blocks any potenti=
al
>>>>> migration.
>>>> Note my question asked for a 'any definitions of what a plugin ..' -
>>>> so
>>>> you could define it that way, another one is to think that in the futu=
re
>>>> you may allow it and the plugin somehow interacts with migration not to
>>>> change time at certain migration phases.
>>>>
>>>
>>> I would be in favor to forbid usage for now in this context. I'm not
>>> sure why people would play with migration and plugins generally at
>>> this time (there might be experiments or use cases I'm not aware of),
>>> so a simple barrier preventing that seems ok.
>>>
>>> This plugin is part of an experiment where we implement a qemu feature
>>> (icount=3Dauto in this case) by using plugins. If it turns into a
>>> successful usage and this plugin becomes popular, we can always lift
>>> the limitation later.
>>>
>>> @Alex, would you like to add this now (icount=3Dauto is still not
>>> removed from qemu), or wait for integration, and add this as another
>>> patch?
>> I think we follow the deprecation process so once integrated we post
>> a
>> deprecation notice in:
>>    https://qemu.readthedocs.io/en/master/about/deprecated.html
>> and then remove it after a couple of releases.
>>=20
>
> Sorry, I was not clear. I meant do we add a blocker in case someone
> tries to migrate a vm while this plugin is used?

Oh yes - I can add that in the core plugin code.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
