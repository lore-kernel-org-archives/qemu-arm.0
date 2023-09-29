Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id z4-20020a5d6404000000b003176aa612b1sm8885804wru.38.2023.09.29.07.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 07:36:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id EA2DC1FFBB;
	Fri, 29 Sep 2023 15:36:34 +0100 (BST)
References: <20230929124304.13672-1-salil.mehta@huawei.com>
 <20230929124304.13672-9-salil.mehta@huawei.com>
User-agent: mu4e 1.11.20; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, maz@kernel.org,
 jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com,
 oliver.upton@linux.dev, pbonzini@redhat.com, mst@redhat.com,
 will@kernel.org, gshan@redhat.com, rafael@kernel.org,
 linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 karl.heubaum@oracle.com, miguel.luis@oracle.com, salil.mehta@opnsrc.net,
 zhukeqian1@huawei.com, wangxiongfeng2@huawei.com, wangyanan55@huawei.com,
 jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn,
 linuxarm@huawei.com
Subject: Re: [PATCH 8/9] physmem,gdbstub: Add helper functions to help
 *unrealize* vCPU object
Date: Fri, 29 Sep 2023 15:34:38 +0100
In-reply-to: <20230929124304.13672-9-salil.mehta@huawei.com>
Message-ID: <87ttrdnj0t.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: F9vu2/fcdeNO


Salil Mehta <salil.mehta@huawei.com> writes:

> vCPU Hot-unplug requires some helper functions to unroll what has happened
> during realization of a CPU object.
>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>  gdbstub/gdbstub.c         | 13 +++++++++++++
>  include/exec/cpu-common.h |  8 ++++++++
>  include/exec/gdbstub.h    |  1 +
>  include/hw/core/cpu.h     |  1 +
>  softmmu/physmem.c         | 25 +++++++++++++++++++++++++
>  5 files changed, 48 insertions(+)
>
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index 349d348c7b..a06ea3adad 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -491,6 +491,19 @@ void gdb_register_coprocessor(CPUState *cpu,
>      }
>  }
>=20=20
> +void gdb_unregister_coprocessor_all(CPUState *cpu)
> +{
> +    GDBRegisterState *s, *p;
> +
> +    p =3D cpu->gdb_regs;
> +    while (p) {
> +        s =3D p;
> +        p =3D p->next;

Maybe add:

      /* s->xml is static const char so isn't freed */

> +        g_free(s);
> +    }
> +    cpu->gdb_regs =3D NULL;
> +}
> +
>  static void gdb_process_breakpoint_remove_all(GDBProcess *p)
>  {
>      CPUState *cpu =3D gdb_get_first_cpu_in_process(p);
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index 41788c0bdd..eb56a228a2 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -120,6 +120,14 @@ size_t qemu_ram_pagesize_largest(void);
>   */
>  void cpu_address_space_init(CPUState *cpu, int asidx,
>                              const char *prefix, MemoryRegion *mr);
> +/**
> + * cpu_address_space_destroy:
> + * @cpu: CPU for which address space needs to be destroyed
> + * @asidx: integer index of this address space
> + *
> + * Note that with KVM only one address space is supported.
> + */
> +void cpu_address_space_destroy(CPUState *cpu, int asidx);
>=20=20
>  void cpu_physical_memory_rw(hwaddr addr, void *buf,
>                              hwaddr len, bool is_write);
> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> index 16a139043f..986d8d2fa5 100644
> --- a/include/exec/gdbstub.h
> +++ b/include/exec/gdbstub.h
> @@ -27,6 +27,7 @@ typedef int (*gdb_set_reg_cb)(CPUArchState *env, uint8_=
t *buf, int reg);
>  void gdb_register_coprocessor(CPUState *cpu,
>                                gdb_get_reg_cb get_reg, gdb_set_reg_cb set=
_reg,
>                                int num_regs, const char *xml, int
>  g_pos);

Can we have a kdoc comment here describing the function.

I suspect this should be split into two patches, one for gdbstub and one
for physmem.

> +void gdb_unregister_coprocessor_all(CPUState *cpu);
>=20=20
>  /**
>   * gdbserver_start: start the gdb server
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 648b5b3586..65d2ae4581 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -355,6 +355,7 @@ struct CPUState {
>      QSIMPLEQ_HEAD(, qemu_work_item) work_list;
>=20=20
>      CPUAddressSpace *cpu_ases;
> +    int cpu_ases_count;
>      int num_ases;
>      AddressSpace *as;
>      MemoryRegion *memory;
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 4f6ca653b3..4dfa0ca66f 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -761,6 +761,7 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
>=20=20
>      if (!cpu->cpu_ases) {
>          cpu->cpu_ases =3D g_new0(CPUAddressSpace, cpu->num_ases);
> +        cpu->cpu_ases_count =3D cpu->num_ases;
>      }
>=20=20
>      newas =3D &cpu->cpu_ases[asidx];
> @@ -774,6 +775,30 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
>      }
>  }
>=20=20
> +void cpu_address_space_destroy(CPUState *cpu, int asidx)
> +{
> +    CPUAddressSpace *cpuas;
> +
> +    assert(asidx < cpu->num_ases);
> +    assert(asidx =3D=3D 0 || !kvm_enabled());
> +    assert(cpu->cpu_ases);
> +
> +    cpuas =3D &cpu->cpu_ases[asidx];
> +    if (tcg_enabled()) {
> +        memory_listener_unregister(&cpuas->tcg_as_listener);
> +    }
> +
> +    address_space_destroy(cpuas->as);
> +    g_free_rcu(cpuas->as, rcu);
> +
> +    if (cpu->cpu_ases_count =3D=3D 1) {
> +        g_free(cpu->cpu_ases);
> +        cpu->cpu_ases =3D NULL;
> +    }
> +
> +    cpu->cpu_ases_count--;
> +}
> +
>  AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx)
>  {
>      /* Return the AddressSpace corresponding to the specified index */


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
