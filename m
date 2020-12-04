Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id p3sm4041607wrs.50.2020.12.04.08.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 08:15:58 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 95C101FF7E;
	Fri,  4 Dec 2020 16:15:57 +0000 (GMT)
References: <20201203234857.21051-1-agraf@csgraf.de>
 <20201203234857.21051-5-agraf@csgraf.de>
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
Subject: Re: [PATCH v4 04/11] hvf: Introduce hvf vcpu struct
In-reply-to: <20201203234857.21051-5-agraf@csgraf.de>
Date: Fri, 04 Dec 2020 16:15:57 +0000
Message-ID: <875z5hsg1u.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Wmdj4q1mXbcX


Alexander Graf <agraf@csgraf.de> writes:

> We will need more than a single field for hvf going forward. To keep
> the global vcpu struct uncluttered, let's allocate a special hvf vcpu
> struct, similar to how hax does it.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
> ---
>  accel/hvf/hvf-cpus.c        |   8 +-
>  include/hw/core/cpu.h       |   3 +-
>  include/sysemu/hvf_int.h    |   4 +
>  target/i386/hvf/hvf.c       | 102 +++++++++---------
>  target/i386/hvf/vmx.h       |  24 +++--
>  target/i386/hvf/x86.c       |  28 ++---
>  target/i386/hvf/x86_descr.c |  26 ++---
>  target/i386/hvf/x86_emu.c   |  62 +++++------
>  target/i386/hvf/x86_mmu.c   |   4 +-
>  target/i386/hvf/x86_task.c  |  12 +--
>  target/i386/hvf/x86hvf.c    | 210 ++++++++++++++++++------------------
>  11 files changed, 247 insertions(+), 236 deletions(-)
>
> diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
> index 60f6d76bf3..1b0c868944 100644
> --- a/accel/hvf/hvf-cpus.c
> +++ b/accel/hvf/hvf-cpus.c
> @@ -312,10 +312,12 @@ static void hvf_cpu_synchronize_pre_loadvm(CPUState=
 *cpu)
>=20=20
>  static void hvf_vcpu_destroy(CPUState *cpu)
>  {
> -    hv_return_t ret =3D hv_vcpu_destroy(cpu->hvf_fd);
> +    hv_return_t ret =3D hv_vcpu_destroy(cpu->hvf->fd);
>      assert_hvf_ok(ret);
>=20=20
>      hvf_arch_vcpu_destroy(cpu);
> +    free(cpu->hvf);

You should pair g_malloc0 with g_free.

> +    cpu->hvf =3D NULL;
>  }
>=20=20
>  static void dummy_signal(int sig)
> @@ -326,6 +328,8 @@ static int hvf_init_vcpu(CPUState *cpu)
>  {
>      int r;
>=20=20
> +    cpu->hvf =3D g_malloc0(sizeof(*cpu->hvf));
> +

Otherwise so far, so mechanical ;-)

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e
