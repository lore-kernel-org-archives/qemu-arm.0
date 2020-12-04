Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id j6sm4125541wrq.38.2020.12.04.08.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 08:25:33 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6C25B1FF7E;
	Fri,  4 Dec 2020 16:25:32 +0000 (GMT)
References: <20201203234857.21051-1-agraf@csgraf.de>
 <20201203234857.21051-9-agraf@csgraf.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alexander Graf <agraf@csgraf.de>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Eduardo
 Habkost <ehabkost@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Cameron Esfahani <dirty@apple.com>, Roman
 Bolshakov <r.bolshakov@yadro.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v4 08/11] arm: Add Hypervisor.framework build target
In-reply-to: <20201203234857.21051-9-agraf@csgraf.de>
Date: Fri, 04 Dec 2020 16:25:32 +0000
Message-ID: <87360lsflv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: z1lUbbDXlgby


Alexander Graf <agraf@csgraf.de> writes:

> Now that we have all logic in place that we need to handle Hypervisor.fra=
mework
> on Apple Silicon systems, let's add CONFIG_HVF for aarch64 as well so tha=
t we
> can build it.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>
> ---
>
> v1 -> v2:
>
>   - Fix build on 32bit arm
>
> v3 -> v4:
>
>   - Remove i386-softmmu target
> ---
>  meson.build                | 11 ++++++++++-
>  target/arm/hvf/meson.build |  3 +++
>  target/arm/meson.build     |  2 ++
>  3 files changed, 15 insertions(+), 1 deletion(-)
>  create mode 100644 target/arm/hvf/meson.build
>
> diff --git a/meson.build b/meson.build
> index 86d433c8a4..a2323e8d23 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -74,16 +74,25 @@ else
>  endif
>=20=20
>  accelerator_targets =3D { 'CONFIG_KVM': kvm_targets }
> +
> +if cpu in ['x86', 'x86_64']
> +  hvf_targets =3D ['x86_64-softmmu']
> +elif cpu in ['aarch64']
> +  hvf_targets =3D ['aarch64-softmmu']
> +else
> +  hvf_targets =3D []
> +endif
> +
>  if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
>    # i368 emulator provides xenpv machine type for multiple architectures
>    accelerator_targets +=3D {
>      'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
> +    'CONFIG_HVF': hvf_targets,

I can see this logic continuing to get messier as I just hit a merge
conflict with my Xen on qemu-system-aarch64 patches. Not sure if there
is a cleaner approach though.

>    }
>  endif
>  if cpu in ['x86', 'x86_64']
>    accelerator_targets +=3D {
>      'CONFIG_HAX': ['i386-softmmu', 'x86_64-softmmu'],
> -    'CONFIG_HVF': ['x86_64-softmmu'],
>      'CONFIG_WHPX': ['i386-softmmu', 'x86_64-softmmu'],
>    }
>  endif
> diff --git a/target/arm/hvf/meson.build b/target/arm/hvf/meson.build
> new file mode 100644
> index 0000000000..855e6cce5a
> --- /dev/null
> +++ b/target/arm/hvf/meson.build
> @@ -0,0 +1,3 @@
> +arm_softmmu_ss.add(when: [hvf, 'CONFIG_HVF'], if_true: files(
> +  'hvf.c',
> +))
> diff --git a/target/arm/meson.build b/target/arm/meson.build
> index f5de2a77b8..95bebae216 100644
> --- a/target/arm/meson.build
> +++ b/target/arm/meson.build
> @@ -56,5 +56,7 @@ arm_softmmu_ss.add(files(
>    'psci.c',
>  ))
>=20=20
> +subdir('hvf')
> +
>  target_arch +=3D {'arm': arm_ss}
>  target_softmmu_arch +=3D {'arm': arm_softmmu_ss}


--=20
Alex Benn=C3=A9e
