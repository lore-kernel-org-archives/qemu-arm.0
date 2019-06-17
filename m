Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id s10sm14667254wmf.8.2019.06.17.07.50.14
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 07:50:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4903B1FF87;
	Mon, 17 Jun 2019 15:50:14 +0100 (BST)
References: <20190615154352.26824-1-philmd@redhat.com> <20190615154352.26824-21-philmd@redhat.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Samuel Ortiz
 <sameo@linux.intel.com>, Robert Bradford <robert.bradford@intel.com>
Subject: Re: [Qemu-devel] [PATCH v2 20/23] target/arm: Define TCG dependent functions when TCG is enabled
In-reply-to: <20190615154352.26824-21-philmd@redhat.com>
Date: Mon, 17 Jun 2019 15:50:14 +0100
Message-ID: <87d0jc9sgp.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: VjuAY8MwnNbV


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> From: Samuel Ortiz <sameo@linux.intel.com>
>
> do_interrupt, do_unaligned_access, do_transaction_failed and debug_excp
> are only relevant in the TCG context, so we should not define them
> when TCG is disabled.
>
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Robert Bradford <robert.bradford@intel.com>
> [PMD: Rebased]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/cpu.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 2335659a85..3ffea857c4 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1557,7 +1557,7 @@ static void arm_v7m_class_init(ObjectClass *oc, voi=
d *data)
>      CPUClass *cc =3D CPU_CLASS(oc);
>
>      acc->info =3D data;
> -#ifndef CONFIG_USER_ONLY
> +#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
>      cc->do_interrupt =3D arm_v7m_cpu_do_interrupt;
>  #endif
>
> @@ -2172,22 +2172,24 @@ static void arm_cpu_class_init(ObjectClass *oc, v=
oid *data)
>      cc->gdb_read_register =3D arm_cpu_gdb_read_register;
>      cc->gdb_write_register =3D arm_cpu_gdb_write_register;
>  #ifndef CONFIG_USER_ONLY
> +#ifdef CONFIG_TCG
>      cc->do_interrupt =3D arm_cpu_do_interrupt;
>      cc->do_unaligned_access =3D arm_cpu_do_unaligned_access;
>      cc->do_transaction_failed =3D arm_cpu_do_transaction_failed;
> +    cc->debug_excp_handler =3D arm_debug_excp_handler;
> +#endif /* CONFIG_TCG */
>      cc->get_phys_page_attrs_debug =3D arm_cpu_get_phys_page_attrs_debug;
>      cc->asidx_from_attrs =3D arm_asidx_from_attrs;
>      cc->vmsd =3D &vmstate_arm_cpu;
>      cc->virtio_is_big_endian =3D arm_cpu_virtio_is_big_endian;
>      cc->write_elf64_note =3D arm_cpu_write_elf64_note;
>      cc->write_elf32_note =3D arm_cpu_write_elf32_note;
> -#endif
> +#endif /* CONFIG_USER_ONLY */
>      cc->gdb_num_core_regs =3D 26;
>      cc->gdb_core_xml_file =3D "arm-core.xml";
>      cc->gdb_arch_name =3D arm_gdb_arch_name;
>      cc->gdb_get_dynamic_xml =3D arm_gdb_get_dynamic_xml;
>      cc->gdb_stop_before_watchpoint =3D true;
> -    cc->debug_excp_handler =3D arm_debug_excp_handler;
>      cc->debug_check_watchpoint =3D arm_debug_check_watchpoint;
>  #if !defined(CONFIG_USER_ONLY)
>      cc->adjust_watchpoint_address =3D arm_adjust_watchpoint_address;


--
Alex Benn=C3=A9e
