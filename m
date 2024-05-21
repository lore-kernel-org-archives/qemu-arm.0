Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-574ea09b972sm9599851a12.47.2024.05.21.05.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 05:44:54 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 2D0005F8B0;
	Tue, 21 May 2024 13:44:54 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: <qemu-devel@nongnu.org>,  <qemu-arm@nongnu.org>,  <maz@kernel.org>,
  <jean-philippe@linaro.org>,  <jonathan.cameron@huawei.com>,
  <lpieralisi@kernel.org>,  <peter.maydell@linaro.org>,
  <richard.henderson@linaro.org>,  <imammedo@redhat.com>,
  <andrew.jones@linux.dev>,  <david@redhat.com>,  <philmd@linaro.org>,
  <eric.auger@redhat.com>,  <oliver.upton@linux.dev>,
  <pbonzini@redhat.com>,  <mst@redhat.com>,  <will@kernel.org>,
  <gshan@redhat.com>,  <rafael@kernel.org>,  <linux@armlinux.org.uk>,
  <darren@os.amperecomputing.com>,  <ilkka@os.amperecomputing.com>,
  <vishnu@os.amperecomputing.com>,  <karl.heubaum@oracle.com>,
  <miguel.luis@oracle.com>,  <salil.mehta@opnsrc.net>,
  <zhukeqian1@huawei.com>,  <wangxiongfeng2@huawei.com>,
  <wangyanan55@huawei.com>,  <jiakernel2@gmail.com>,
  <maobibo@loongson.cn>,  <lixianglai@loongson.cn>,  <npiggin@gmail.com>,
  <harshpb@linux.ibm.com>,  <linuxarm@huawei.com>,  Shaoqin Huang
 <shahuang@redhat.com>
Subject: Re: [PATCH V10 7/8] gdbstub: Add helper function to unregister GDB
 register space
In-Reply-To: <20240520233241.229675-8-salil.mehta@huawei.com> (Salil Mehta's
	message of "Tue, 21 May 2024 00:32:40 +0100")
References: <20240520233241.229675-1-salil.mehta@huawei.com>
	<20240520233241.229675-8-salil.mehta@huawei.com>
Date: Tue, 21 May 2024 13:44:54 +0100
Message-ID: <87seybibax.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: FSb/xzuKLDQ3

Salil Mehta <salil.mehta@huawei.com> writes:

> Add common function to help unregister the GDB register space. This shall=
 be
> done in context to the CPU unrealization.
>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Xianglai Li <lixianglai@loongson.cn>
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Reviewed-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> ---
>  gdbstub/gdbstub.c      | 13 +++++++++++++
>  hw/core/cpu-common.c   |  1 -
>  include/exec/gdbstub.h |  6 ++++++
>  3 files changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index b3574997ea..1949b09240 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -617,6 +617,19 @@ void gdb_register_coprocessor(CPUState *cpu,
>      }
>  }
>=20=20
> +void gdb_unregister_coprocessor_all(CPUState *cpu)
> +{
> +    /*
> +     * Safe to nuke everything. GDBRegisterState::xml is static const ch=
ar so
> +     * it won't be freed
> +     */
> +    g_array_free(cpu->gdb_regs, true);
> +
> +    cpu->gdb_regs =3D NULL;
> +    cpu->gdb_num_regs =3D 0;
> +    cpu->gdb_num_g_regs =3D 0;
> +}
> +
>  static void gdb_process_breakpoint_remove_all(GDBProcess *p)
>  {
>      CPUState *cpu =3D gdb_get_first_cpu_in_process(p);
> diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
> index 0f0a247f56..e5140b4bc1 100644
> --- a/hw/core/cpu-common.c
> +++ b/hw/core/cpu-common.c
> @@ -274,7 +274,6 @@ static void cpu_common_finalize(Object *obj)
>  {
>      CPUState *cpu =3D CPU(obj);
>=20=20
> -    g_array_free(cpu->gdb_regs, TRUE);

Is this patch missing something? As far as I can tell the new function
never gets called.

>      qemu_lockcnt_destroy(&cpu->in_ioctl_lock);
>      qemu_mutex_destroy(&cpu->work_mutex);
>  }
> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> index eb14b91139..249d4d4bc8 100644
> --- a/include/exec/gdbstub.h
> +++ b/include/exec/gdbstub.h
> @@ -49,6 +49,12 @@ void gdb_register_coprocessor(CPUState *cpu,
>                                gdb_get_reg_cb get_reg, gdb_set_reg_cb set=
_reg,
>                                const GDBFeature *feature, int g_pos);
>=20=20
> +/**
> + * gdb_unregister_coprocessor_all() - unregisters supplemental set of re=
gisters
> + * @cpu - the CPU associated with registers
> + */
> +void gdb_unregister_coprocessor_all(CPUState *cpu);
> +
>  /**
>   * gdbserver_start: start the gdb server
>   * @port_or_device: connection spec for gdb

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
