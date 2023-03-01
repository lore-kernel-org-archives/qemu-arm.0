Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id t25-20020a7bc3d9000000b003e896d953a8sm19318702wmj.17.2023.03.01.04.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 04:58:18 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2C67D1FFB7;
	Wed,  1 Mar 2023 12:58:18 +0000 (GMT)
References: <20230228192628.26140-1-farosas@suse.de>
 <20230228192628.26140-10-farosas@suse.de> <87a60wk6st.fsf@secure.mitica>
 <87zg8wk69m.fsf@suse.de>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Fabiano Rosas <farosas@suse.de>
Cc: quintela@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, Peter
 Maydell <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio  Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>, Thomas
 Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, "Dr. David
 Alan  Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RESEND v7 9/9] tests/qtest: Fix tests when no KVM or TCG
 are present
Date: Wed, 01 Mar 2023 12:57:33 +0000
In-reply-to: <87zg8wk69m.fsf@suse.de>
Message-ID: <87bklcd3x1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: MYABWm+ze2r5


Fabiano Rosas <farosas@suse.de> writes:

> Juan Quintela <quintela@redhat.com> writes:
>
>> Fabiano Rosas <farosas@suse.de> wrote:
>>> It is possible to have a build with both TCG and KVM disabled due to
>>> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
>>> host.
>>
>> Ouch.
>>
>> Just curious: why are they needed?
>>
>
> From https://wiki.xenproject.org/wiki/QEMU_Upstream:
>
>   Why is qemu-system-i386 used even on x86_64 and even non-x86?
>=20=20=20
>   QEMU in a Xen system only provides device model (DM) emulation and not
>   any CPU instruction emulation, so the nominal arch doesn't actually
>   matter and Xen builds i386 everywhere as a basically arbitrary choice.
>=20=20=20
>   It happens that the Xen DM part of QEMU is quite closely tied to the x86
>   scaffolding for various historical reasons, so we end up using
>   qemu-system-i386 even e.g. on ARM!  There is no practical difference
>   between qemu-system-i386 and qemu-system-x86_64, they should be
>   interchangeable. However only qemu-system-i386 is regularly tested by
>   Xen Project (via osstest).

That said with the xenpvh model that was added recently we should be
able to finally build a Xen only qemu-system-aarch64 which while
functionally the same will be less head scratching for users.

>
>>>
>>> If we build with --disable-tcg on the aarch64 host, we will end-up
>>> with a QEMU binary (x86) that does not support TCG nor KVM.
>>>
>>> Fix tests that crash or hang in the above scenario. Do not include any
>>> test cases if TCG and KVM are missing.
>>>
>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>> ---
>>> This currently affects Arm, but will also affect x86 after the xenpvh
>>> series gets merged. This patch fixes both scenarios.
>>
>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>
> Thanks!


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
