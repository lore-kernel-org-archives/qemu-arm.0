Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id p1sm3456350wmc.11.2021.06.03.10.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 10:19:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9D05C1FF7E;
	Thu,  3 Jun 2021 18:19:37 +0100 (BST)
References: <20210526170432.343588-1-philmd@redhat.com>
 <20210526170432.343588-3-philmd@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Eric Blake
 <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v8 02/12] accel: Introduce 'query-accels' QMP command
Date: Thu, 03 Jun 2021 18:19:15 +0100
In-reply-to: <20210526170432.343588-3-philmd@redhat.com>
Message-ID: <87r1hi7tna.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: txM0lDq1Bj63


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Introduce the 'query-accels' QMP command which returns a list
> of built-in accelerator names.
>
> - Accelerator is a QAPI enum of all existing accelerators,
>
> - AcceleratorInfo is a QAPI structure providing accelerator
>   specific information. Currently the common structure base
>   provides the name of the accelerator, while the specific
>   part is empty, but each accelerator can expand it.
>
> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>
> For example on a KVM-only build we get:
>
>     { "execute": "query-accels" }
>     {
>         "return": [
>             {
>                 "name": "qtest"
>             },
>             {
>                 "name": "kvm"
>             }
>         ]
>     }
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v8:
> - Include code snippet from Markus adding to machine-target.json
>   to be able to use enum values or union branches conditional.
> - Use accel_find() on enum to be sure the accelerator is enabled
>   at runtime (chat with jsnow / eblake).

Hmm something broke because now I get:

 /usr/lib/x86_64-linux-gnu/libpixman-1.so -lgthread-2.0 -lglib-2.0 -lstdc++=
 -Wl,--end-group
/usr/bin/ld: libqemu-aarch64_be-linux-user.fa.p/accel_accel-qmp.c.o: in fun=
ction `qmp_query_accels':
/home/alex/lsrc/qemu.git/builds/arm.all/../../accel/accel-qmp.c:15: undefin=
ed reference to `Accelerator_lookup'
collect2: error: ld returned 1 exit status
[1327/1413] Linking target qemu-io

--=20
Alex Benn=C3=A9e
