Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1787c6ffsm1622523466b.49.2024.05.21.08.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 08:22:37 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 583B95F8B0;
	Tue, 21 May 2024 16:22:37 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,  "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>,  "maz@kernel.org" <maz@kernel.org>,
  "jean-philippe@linaro.org" <jean-philippe@linaro.org>,  Jonathan Cameron
 <jonathan.cameron@huawei.com>,  "lpieralisi@kernel.org"
 <lpieralisi@kernel.org>,  "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>,  "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>,  "imammedo@redhat.com"
 <imammedo@redhat.com>,  "andrew.jones@linux.dev" <andrew.jones@linux.dev>,
  "david@redhat.com" <david@redhat.com>,  "philmd@linaro.org"
 <philmd@linaro.org>,  "eric.auger@redhat.com" <eric.auger@redhat.com>,
  "oliver.upton@linux.dev" <oliver.upton@linux.dev>,  "pbonzini@redhat.com"
 <pbonzini@redhat.com>,  "mst@redhat.com" <mst@redhat.com>,
  "will@kernel.org" <will@kernel.org>,  "gshan@redhat.com"
 <gshan@redhat.com>,  "rafael@kernel.org" <rafael@kernel.org>,
  "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
  "darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
  "ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
  "vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
  "karl.heubaum@oracle.com" <karl.heubaum@oracle.com>,
  "miguel.luis@oracle.com" <miguel.luis@oracle.com>,
  "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,  zhukeqian
 <zhukeqian1@huawei.com>,  "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
  "wangyanan (Y)" <wangyanan55@huawei.com>,  "jiakernel2@gmail.com"
 <jiakernel2@gmail.com>,  "maobibo@loongson.cn" <maobibo@loongson.cn>,
  "lixianglai@loongson.cn" <lixianglai@loongson.cn>,  "npiggin@gmail.com"
 <npiggin@gmail.com>,  "harshpb@linux.ibm.com" <harshpb@linux.ibm.com>,
  Linuxarm <linuxarm@huawei.com>,  Shaoqin Huang <shahuang@redhat.com>
Subject: Re: [PATCH V10 7/8] gdbstub: Add helper function to unregister GDB
 register space
In-Reply-To: <00d3d97d51df449a88b771174b37f979@huawei.com> (Salil Mehta's
	message of "Tue, 21 May 2024 14:55:13 +0000")
References: <20240520233241.229675-1-salil.mehta@huawei.com>
	<20240520233241.229675-8-salil.mehta@huawei.com>
	<87seybibax.fsf@draig.linaro.org>
	<00d3d97d51df449a88b771174b37f979@huawei.com>
Date: Tue, 21 May 2024 16:22:37 +0100
Message-ID: <87frubi402.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: z6Hk5VV89PCr

Salil Mehta <salil.mehta@huawei.com> writes:

> Hi Alex,
>
>>  From: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>  Sent: Tuesday, May 21, 2024 1:45 PM
>>  To: Salil Mehta <salil.mehta@huawei.com>
>>=20=20
>>  Salil Mehta <salil.mehta@huawei.com> writes:
>>=20=20
>>  > Add common function to help unregister the GDB register space. This
>>  > shall be done in context to the CPU unrealization.
>>  >
>>  > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>>  > Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
>>  > Reviewed-by: Gavin Shan <gshan@redhat.com>
>>  > Tested-by: Xianglai Li <lixianglai@loongson.cn>
>>  > Tested-by: Miguel Luis <miguel.luis@oracle.com>
>>  > Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
>>  > Reviewed-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
>>  > ---
>>  >  gdbstub/gdbstub.c      | 13 +++++++++++++
>>  >  hw/core/cpu-common.c   |  1 -
>>  >  include/exec/gdbstub.h |  6 ++++++
>>  >  3 files changed, 19 insertions(+), 1 deletion(-)
>>  >
>>  > diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c index
>>  > b3574997ea..1949b09240 100644
>>  > --- a/gdbstub/gdbstub.c
>>  > +++ b/gdbstub/gdbstub.c
>>  > @@ -617,6 +617,19 @@ void gdb_register_coprocessor(CPUState *cpu,
>>  >      }
>>  >  }
>>  >
>>  > +void gdb_unregister_coprocessor_all(CPUState *cpu) {
>>  > +    /*
>>  > +     * Safe to nuke everything. GDBRegisterState::xml is static cons=
t char
>>  so
>>  > +     * it won't be freed
>>  > +     */
>>  > +    g_array_free(cpu->gdb_regs, true);
>>  > +
>>  > +    cpu->gdb_regs =3D NULL;
>>  > +    cpu->gdb_num_regs =3D 0;
>>  > +    cpu->gdb_num_g_regs =3D 0;
>>  > +}
>>  > +
>>  >  static void gdb_process_breakpoint_remove_all(GDBProcess *p)  {
>>  >      CPUState *cpu =3D gdb_get_first_cpu_in_process(p); diff --git
>>  > a/hw/core/cpu-common.c b/hw/core/cpu-common.c index
>>  > 0f0a247f56..e5140b4bc1 100644
>>  > --- a/hw/core/cpu-common.c
>>  > +++ b/hw/core/cpu-common.c
>>  > @@ -274,7 +274,6 @@ static void cpu_common_finalize(Object *obj)  {
>>  >      CPUState *cpu =3D CPU(obj);
>>  >
>>  > -    g_array_free(cpu->gdb_regs, TRUE);
>>=20=20
>>  Is this patch missing something? As far as I can tell the new function =
never
>>  gets called.
>
>
> Above was causing double free because eventually this free'ng of 'gdb_reg=
s' is being
> done in context to un-realization of ARM CPU. Function ' gdb_unregister_c=
oprocessor_all'
> will be used by loongson arch as well. Hence, I placed this newly added f=
unction
> in the arch agnostic patch-set=20
>
> https://lore.kernel.org/qemu-devel/20230926103654.34424-1-salil.mehta@hua=
wei.com/
>
> Another approach could be to keep it but make above free'ing as condition=
al?
>
> /* in case architecture specific code did not do its job */
> if (cpu->gdb_regs)
>     g_array_free(cpu->gdb_regs, TRUE);

No I don't object to moving it to a function. But I would expect the
patch that adds the function and plumbs it in to also be the patch that
removes the inline call. Otherwise the tree will be broken in behaviour
between patches.

Just make it clear in the header that the series needs the pre-requisite
patches.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
