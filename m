Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id p5sm3610038wma.45.2021.04.30.10.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 10:22:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id BA8BA1FF7E;
	Fri, 30 Apr 2021 18:22:22 +0100 (BST)
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-12-philmd@redhat.com>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, Eduardo
 Habkost
 <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Juan
 Quintela <quintela@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Claudio Fontana
 <cfontana@suse.de>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, Igor
 Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v4 11/12] tests/qtest: Do not restrict bios-tables-test
 to Aarch64 hosts anymore
Date: Fri, 30 Apr 2021 18:21:27 +0100
In-reply-to: <20210415163304.4120052-12-philmd@redhat.com>
Message-ID: <87pmybvga9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: SE/4iqPRQc4V


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Since commit 82bf7ae84ce ("target/arm: Remove KVM support for
> 32-bit Arm hosts") we can remove the comment / check added in
> commit ab6b6a77774 and directly run the bios-tables-test.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  tests/qtest/meson.build | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 0c767389217..46de073d155 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -175,14 +175,13 @@
>     'boot-serial-test',
>     'hexloader-test']
>=20=20
> -# TODO: once aarch64 TCG is fixed on ARM 32 bit host, make
> bios-tables-test unconditional

Yeah this one has been fixed for some time I reckon. Once I fixed my
cross compile detection scripts I was able to run them all with 32 bit
ARM binaries.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


>  qtests_aarch64 =3D \
> -  (cpu !=3D 'arm' ? ['bios-tables-test'] : []) +                        =
                          \
>    (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-devic=
e-test'] : []) +        \
>    (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-devic=
e-swtpm-test'] : []) +  \
>    ['arm-cpu-features',
>     'numa-test',
>     'boot-serial-test',
> +   'bios-tables-test',
>     'xlnx-can-test',
>     'migration-test']


--=20
Alex Benn=C3=A9e
