Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebc0817a8sm2381867a12.84.2024.08.16.08.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:37:23 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B0C555F92F;
	Fri, 16 Aug 2024 16:37:22 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: <qemu-devel@nongnu.org>,  <qemu-arm@nongnu.org>,  <mst@redhat.com>,
  <maz@kernel.org>,  <jean-philippe@linaro.org>,
  <jonathan.cameron@huawei.com>,  <lpieralisi@kernel.org>,
  <peter.maydell@linaro.org>,  <richard.henderson@linaro.org>,
  <imammedo@redhat.com>,  <andrew.jones@linux.dev>,  <david@redhat.com>,
  <philmd@linaro.org>,  <eric.auger@redhat.com>,  <will@kernel.org>,
  <ardb@kernel.org>,  <oliver.upton@linux.dev>,  <pbonzini@redhat.com>,
  <gshan@redhat.com>,  <rafael@kernel.org>,  <borntraeger@linux.ibm.com>,
  <npiggin@gmail.com>,  <harshpb@linux.ibm.com>,  <linux@armlinux.org.uk>,
  <darren@os.amperecomputing.com>,  <ilkka@os.amperecomputing.com>,
  <vishnu@os.amperecomputing.com>,  <karl.heubaum@oracle.com>,
  <miguel.luis@oracle.com>,  <salil.mehta@opnsrc.net>,
  <zhukeqian1@huawei.com>,  <wangxiongfeng2@huawei.com>,
  <wangyanan55@huawei.com>,  <jiakernel2@gmail.com>,
  <maobibo@loongson.cn>,  <lixianglai@loongson.cn>,  <shahuang@redhat.com>,
  <zhao1.liu@intel.com>,  <linuxarm@huawei.com>
Subject: Re: [PATCH RFC V3 24/29] target/arm: Add support of *unrealize*
 ARMCPU during vCPU Hot-unplug
In-Reply-To: <20240613233639.202896-25-salil.mehta@huawei.com> (Salil Mehta's
	message of "Fri, 14 Jun 2024 00:36:34 +0100")
References: <20240613233639.202896-1-salil.mehta@huawei.com>
	<20240613233639.202896-25-salil.mehta@huawei.com>
Date: Fri, 16 Aug 2024 16:37:22 +0100
Message-ID: <87v800wkb1.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: t6oLkLnDKMRX

Salil Mehta <salil.mehta@huawei.com> writes:

> vCPU Hot-unplug will result in QOM CPU object unrealization which will do=
 away
> with all the vCPU thread creations, allocations, registrations that happe=
ned
> as part of the realization process. This change introduces the ARM CPU un=
realize
> function taking care of exactly that.
>
> Note, initialized KVM vCPUs are not destroyed in host KVM but their Qemu =
context
> is parked at the QEMU KVM layer.
>
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reported-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> [VP: Identified CPU stall issue & suggested probable fix]
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>  target/arm/cpu.c       | 101 +++++++++++++++++++++++++++++++++++++++++
>  target/arm/cpu.h       |  14 ++++++
>  target/arm/gdbstub.c   |   6 +++
>  target/arm/helper.c    |  25 ++++++++++
>  target/arm/internals.h |   3 ++
>  target/arm/kvm.c       |   5 ++
>  6 files changed, 154 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index c92162fa97..a3dc669309 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -157,6 +157,16 @@ void arm_register_pre_el_change_hook(ARMCPU *cpu, AR=
MELChangeHookFn *hook,
>      QLIST_INSERT_HEAD(&cpu->pre_el_change_hooks, entry, node);
>  }
>=20=20
> +void arm_unregister_pre_el_change_hooks(ARMCPU *cpu)
> +{
> +    ARMELChangeHook *entry, *next;
> +
> +    QLIST_FOREACH_SAFE(entry, &cpu->pre_el_change_hooks, node, next) {
> +        QLIST_REMOVE(entry, node);
> +        g_free(entry);
> +    }
> +}
> +
>  void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
>                                   void *opaque)
>  {
> @@ -168,6 +178,16 @@ void arm_register_el_change_hook(ARMCPU *cpu, ARMELC=
hangeHookFn *hook,
>      QLIST_INSERT_HEAD(&cpu->el_change_hooks, entry, node);
>  }
>=20=20
> +void arm_unregister_el_change_hooks(ARMCPU *cpu)
> +{
> +    ARMELChangeHook *entry, *next;
> +
> +    QLIST_FOREACH_SAFE(entry, &cpu->el_change_hooks, node, next) {
> +        QLIST_REMOVE(entry, node);
> +        g_free(entry);
> +    }
> +}
> +
>  static void cp_reg_reset(gpointer key, gpointer value, gpointer opaque)
>  {
>      /* Reset a single ARMCPRegInfo register */
> @@ -2552,6 +2572,85 @@ static void arm_cpu_realizefn(DeviceState *dev, Er=
ror **errp)
>      acc->parent_realize(dev, errp);
>  }
>=20=20
> +static void arm_cpu_unrealizefn(DeviceState *dev)
> +{
> +    ARMCPUClass *acc =3D ARM_CPU_GET_CLASS(dev);
> +    ARMCPU *cpu =3D ARM_CPU(dev);
> +    CPUARMState *env =3D &cpu->env;
> +    CPUState *cs =3D CPU(dev);
> +    bool has_secure;
> +
> +    has_secure =3D cpu->has_el3 || arm_feature(env, ARM_FEATURE_M_SECURI=
TY);
> +
> +    /* rock 'n' un-roll, whatever happened in the arm_cpu_realizefn clea=
nly */
> +    cpu_address_space_destroy(cs, ARMASIdx_NS);

On current master this will fail:

../../target/arm/cpu.c: In function =E2=80=98arm_cpu_unrealizefn=E2=80=99:
../../target/arm/cpu.c:2626:5: error: implicit declaration of function =E2=
=80=98cpu_address_space_destroy=E2=80=99 [-Werror=3Dimplicit-function-decla=
ration]
 2626 |     cpu_address_space_destroy(cs, ARMASIdx_NS);
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~
../../target/arm/cpu.c:2626:5: error: nested extern declaration of =E2=80=
=98cpu_address_space_destroy=E2=80=99 [-Werror=3Dnested-externs]
cc1: all warnings being treated as errors

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
