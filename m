Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436612008casm605671245e9.14.2025.01.07.09.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 09:02:32 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 56E3A5F869;
	Tue,  7 Jan 2025 17:02:31 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: Gustavo Romero <gustavo.romero@linaro.org>,  qemu-devel@nongnu.org,
  qemu-arm@nongnu.org,  philmd@linaro.org,  thuth@redhat.com, Bill Mills
 <bill.mills@linaro.org>
Subject: Re: [RESEND][PATCH v3 0/7] Add ivshmem-flat device
In-Reply-To: <87r05e8zv4.fsf@pond.sub.org> (Markus Armbruster's message of
	"Tue, 07 Jan 2025 15:25:51 +0100")
References: <20241216141818.111255-1-gustavo.romero@linaro.org>
	<87r05e8zv4.fsf@pond.sub.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Tue, 07 Jan 2025 17:02:31 +0000
Message-ID: <874j2ad0bc.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Tl51E/N0o5WP

Markus Armbruster <armbru@redhat.com> writes:

> Gustavo Romero <gustavo.romero@linaro.org> writes:
>
>> This is a resend of the series:
>>
>> https://lore.kernel.org/qemu-devel/20240222222218.2261956-1-gustavo.rome=
ro@linaro.org/
>>
>> rebased on the current master. The series was sent about 9 months ago and
>> remains relevant. Besides addressing the longstanding issue:
>>
>> https://gitlab.com/qemu-project/qemu/-/issues/1134
>>
>> it has generated interest in the community at least twice since its last
>> version, from different contexts:
>>
>> https://lists.nongnu.org/archive/html/qemu-discuss/2024-05/msg00003.html
>> https://lists.nongnu.org/archive/html/qemu-devel/2024-09/msg00374.html
>>
>> This suggests the series is being used out-of-tree in various contexts, =
such
>> as experiments with heterogeneous architectures.
>>
>> But due to the fact it relies on sysbus, which is marked for future remo=
val,
>> some maintainers objected to accepting the patchset, causing it to be he=
ld in
>> the ML.
>
> Actually, I inquired about the use cases, and was told it's for OpenAMP.
> I challenged the use of ivshmem for that purpose in some detail[*], but
> got no reply.
>
>>         However, given the ongoing community interest and since currentl=
y there
>> isn't a better way on QEMU than using sysbus for the wiring needs of this
>> device (e.g. to wire the device to a CPU IRQ input line), I'd kindly lik=
e to ask
>> maintainers to reconsider its acceptance.
>
> [*] https://lore.kernel.org/qemu-devel/87zfth4psf.fsf@pond.sub.org/

Yes the principle use case is modelling asymmetric set ups with two sets
of CPU cores attached only by a piece of shared RAM with maybe a
signalling an IRQ. As the CPUs are doing the work we want to test both
sides (VirtIO device and driver) rather than provide an emulation.

Once we have a single QEMU binary that is dynamically configurable and
supports heterogeneous setups then we can model it within QEMU itself.
However until that point 2 QEMU's and some shared memory is the easiest
way to test such things.

This is currently being worked on as part of the larger HVAC project:

  https://linaro.atlassian.net/wiki/spaces/HVAC/overview

where we are working on a new VirtIO transport layer (virtio-msg) that
doesn't have the issues associated with lack of trapped configuration
space.

>
> [...]

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
