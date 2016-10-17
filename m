Received: by 10.80.166.35 with SMTP id d32csp262002edc;
        Sun, 16 Oct 2016 20:50:15 -0700 (PDT)
X-Received: by 10.237.37.197 with SMTP id y5mr23244681qtc.8.1476676215022;
        Sun, 16 Oct 2016 20:50:15 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b142si16820356qkc.79.2016.10.16.20.50.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Oct 2016 20:50:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58862 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bvywI-0007jU-Fz
	for alex.bennee@linaro.org; Sun, 16 Oct 2016 23:50:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bvyqe-0003Sq-Rj
	for qemu-devel@nongnu.org; Sun, 16 Oct 2016 23:44:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bvyqb-00015m-Ix
	for qemu-devel@nongnu.org; Sun, 16 Oct 2016 23:44:24 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:38723)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1bvyqa-000134-Hl; Sun, 16 Oct 2016 23:44:21 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3sy3wc2VBdz9ryk; Mon, 17 Oct 2016 14:44:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1476675856;
	bh=UAhDq+qXTVVV5NAuzgzcSfqt+Ct20kTG7/e2rvfgLmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dp2imUWlYV4wFiu99QAvnAOxm9QKQ/7JXWtgcGDNXWlBtXvz1xTzdiZONcKfc3eOi
	188vNe/O6LXYPX9m//KHmrqX83ATzfQw9MxgO7iw5uCw/JmqHoSDyK1HoaGfo4LFgH
	Rdum9yE7z2ITfQhHAbWg+XIurVuwjMjv5MbMHPyY=
Date: Mon, 17 Oct 2016 14:43:19 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20161017034319.GR25390@umbus.fritz.box>
References: <1476485569-6744-1-git-send-email-lvivier@redhat.com>
	<1476485569-6744-3-git-send-email-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DMLl6fZPX8o7hGmc"
Content-Disposition: inline
In-Reply-To: <1476485569-6744-3-git-send-email-lvivier@redhat.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-devel] [PATCH v3 2/3] exec: rename cpu_exec_init() as
 cpu_exec_realizefn()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Anthony Green <green@moxielogic.com>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Greg Ungerer <gerg@uclinux.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Chen Gang <gang.chen.5i5j@gmail.com>, Jia Liu <proljc@gmail.com>,
	Alexander Graf <agraf@suse.de>, Bharata B Rao <bharata@linux.vnet.ibm.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Matthew Rosato <mjrosato@linux.vnet.ibm.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lMlUk8PTmg0w


--DMLl6fZPX8o7hGmc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 15, 2016 at 12:52:48AM +0200, Laurent Vivier wrote:
> Modify all CPUs to call it from XXX_cpu_realizefn() function.
>=20
> Remove all the cannot_destroy_with_object_finalize_yet as
> unsafe references have been moved to cpu_exec_realizefn().
> (tested with QOM command provided by commit 4c315c27)
>=20
> for arm:
>=20
> Setting of cpu->mp_affinity is moved from arm_cpu_initfn()
> to arm_cpu_realizefn() as setting of cpu_index is now done
> in cpu_exec_realizefn().
>=20
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  exec.c                      |  2 +-
>  include/exec/exec-all.h     |  1 -
>  include/qom/cpu.h           |  1 +
>  target-alpha/cpu.c          | 15 +++++++--------
>  target-arm/cpu.c            | 39 +++++++++++++++++----------------------
>  target-cris/cpu.c           | 15 +++++++--------
>  target-i386/cpu.c           | 11 +++++------
>  target-lm32/cpu.c           | 15 +++++++--------
>  target-m68k/cpu.c           | 15 +++++++--------
>  target-microblaze/cpu.c     | 14 +++++++-------
>  target-mips/cpu.c           | 15 +++++++--------
>  target-moxie/cpu.c          | 15 +++++++--------
>  target-openrisc/cpu.c       | 15 +++++++--------
>  target-ppc/translate_init.c |  2 +-
>  target-s390x/cpu.c          |  8 +-------
>  target-sh4/cpu.c            | 15 +++++++--------
>  target-sparc/cpu.c          | 18 +++++++++---------
>  target-tilegx/cpu.c         | 15 +++++++--------
>  target-tricore/cpu.c        | 15 +++++++--------
>  target-unicore32/cpu.c      | 18 +++++++++---------
>  target-xtensa/cpu.c         | 15 +++++++--------
>  21 files changed, 128 insertions(+), 151 deletions(-)
>=20
> diff --git a/exec.c b/exec.c
> index d1e57c4..203eb52 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -634,7 +634,7 @@ void cpu_exec_initfn(CPUState *cpu)
>  #endif
>  }
> =20
> -void cpu_exec_init(CPUState *cpu, Error **errp)
> +void cpu_exec_realizefn(CPUState *cpu, Error **errp)
>  {
>      CPUClass *cc ATTRIBUTE_UNUSED =3D CPU_GET_CLASS(cpu);
> =20
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 336a57c..9797d55 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -57,7 +57,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>                                uint32_t flags,
>                                int cflags);
> =20
> -void cpu_exec_init(CPUState *cpu, Error **errp);
>  void QEMU_NORETURN cpu_loop_exit(CPUState *cpu);
>  void QEMU_NORETURN cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc);
> =20
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index d7648a9..5520c6c 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -947,6 +947,7 @@ AddressSpace *cpu_get_address_space(CPUState *cpu, in=
t asidx);
>  void QEMU_NORETURN cpu_abort(CPUState *cpu, const char *fmt, ...)
>      GCC_FMT_ATTR(2, 3);
>  void cpu_exec_initfn(CPUState *cpu);
> +void cpu_exec_realizefn(CPUState *cpu, Error **errp);
>  void cpu_exec_exit(CPUState *cpu);
> =20
>  #ifdef CONFIG_SOFTMMU
> diff --git a/target-alpha/cpu.c b/target-alpha/cpu.c
> index 6d01d7f..30d77ce 100644
> --- a/target-alpha/cpu.c
> +++ b/target-alpha/cpu.c
> @@ -59,6 +59,13 @@ static void alpha_cpu_realizefn(DeviceState *dev, Erro=
r **errp)
>  {
>      CPUState *cs =3D CPU(dev);
>      AlphaCPUClass *acc =3D ALPHA_CPU_GET_CLASS(dev);
> +    Error *local_err =3D NULL;
> +
> +    cpu_exec_realizefn(cs, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> =20
>      qemu_init_vcpu(cs);
> =20
> @@ -266,7 +273,6 @@ static void alpha_cpu_initfn(Object *obj)
>      CPUAlphaState *env =3D &cpu->env;
> =20
>      cs->env_ptr =3D env;
> -    cpu_exec_init(cs, &error_abort);
>      tlb_flush(cs, 1);
> =20
>      alpha_translate_init();
> @@ -309,13 +315,6 @@ static void alpha_cpu_class_init(ObjectClass *oc, vo=
id *data)
>      cc->disas_set_info =3D alpha_cpu_disas_set_info;
> =20
>      cc->gdb_num_core_regs =3D 67;
> -
> -    /*
> -     * Reason: alpha_cpu_initfn() calls cpu_exec_init(), which saves
> -     * the object in cpus -> dangling pointer after final
> -     * object_unref().
> -     */
> -    dc->cannot_destroy_with_object_finalize_yet =3D true;
>  }
> =20
>  static const TypeInfo alpha_cpu_type_info =3D {
> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
> index 1b9540e..364a45d 100644
> --- a/target-arm/cpu.c
> +++ b/target-arm/cpu.c
> @@ -441,22 +441,11 @@ static void arm_cpu_initfn(Object *obj)
>      CPUState *cs =3D CPU(obj);
>      ARMCPU *cpu =3D ARM_CPU(obj);
>      static bool inited;
> -    uint32_t Aff1, Aff0;
> =20
>      cs->env_ptr =3D &cpu->env;
> -    cpu_exec_init(cs, &error_abort);
>      cpu->cp_regs =3D g_hash_table_new_full(g_int_hash, g_int_equal,
>                                           g_free, g_free);
> =20
> -    /* This cpu-id-to-MPIDR affinity is used only for TCG; KVM will over=
ride it.
> -     * We don't support setting cluster ID ([16..23]) (known as Aff2
> -     * in later ARM ARM versions), or any of the higher affinity level f=
ields,
> -     * so these bits always RAZ.
> -     */
> -    Aff1 =3D cs->cpu_index / ARM_CPUS_PER_CLUSTER;
> -    Aff0 =3D cs->cpu_index % ARM_CPUS_PER_CLUSTER;
> -    cpu->mp_affinity =3D (Aff1 << ARM_AFF1_SHIFT) | Aff0;
> -
>  #ifndef CONFIG_USER_ONLY
>      /* Our inbound IRQ and FIQ lines */
>      if (kvm_enabled()) {
> @@ -576,6 +565,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Erro=
r **errp)
>      ARMCPU *cpu =3D ARM_CPU(dev);
>      ARMCPUClass *acc =3D ARM_CPU_GET_CLASS(dev);
>      CPUARMState *env =3D &cpu->env;
> +    Error *local_err =3D NULL;
> +    uint32_t Aff1, Aff0;
> +
> +    cpu_exec_realizefn(cs, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> =20
>      /* Some features automatically imply others: */
>      if (arm_feature(env, ARM_FEATURE_V8)) {
> @@ -631,6 +628,15 @@ static void arm_cpu_realizefn(DeviceState *dev, Erro=
r **errp)
>          set_feature(env, ARM_FEATURE_THUMB_DSP);
>      }
> =20
> +    /* This cpu-id-to-MPIDR affinity is used only for TCG; KVM will over=
ride it.
> +     * We don't support setting cluster ID ([16..23]) (known as Aff2
> +     * in later ARM ARM versions), or any of the higher affinity level f=
ields,
> +     * so these bits always RAZ.
> +     */
> +    Aff1 =3D cs->cpu_index / ARM_CPUS_PER_CLUSTER;
> +    Aff0 =3D cs->cpu_index % ARM_CPUS_PER_CLUSTER;
> +    cpu->mp_affinity =3D (Aff1 << ARM_AFF1_SHIFT) | Aff0;
> +
>      if (cpu->reset_hivecs) {
>              cpu->reset_sctlr |=3D (1 << 13);
>      }
> @@ -1533,17 +1539,6 @@ static void arm_cpu_class_init(ObjectClass *oc, vo=
id *data)
>      cc->debug_check_watchpoint =3D arm_debug_check_watchpoint;
> =20
>      cc->disas_set_info =3D arm_disas_set_info;
> -
> -    /*
> -     * Reason: arm_cpu_initfn() calls cpu_exec_init(), which saves
> -     * the object in cpus -> dangling pointer after final
> -     * object_unref().
> -     *
> -     * Once this is fixed, the devices that create ARM CPUs should be
> -     * updated not to set cannot_destroy_with_object_finalize_yet,
> -     * unless they still screw up something else.
> -     */
> -    dc->cannot_destroy_with_object_finalize_yet =3D true;
>  }
> =20
>  static void cpu_register(const ARMCPUInfo *info)
> diff --git a/target-cris/cpu.c b/target-cris/cpu.c
> index d680cfb..2e9ab97 100644
> --- a/target-cris/cpu.c
> +++ b/target-cris/cpu.c
> @@ -142,6 +142,13 @@ static void cris_cpu_realizefn(DeviceState *dev, Err=
or **errp)
>  {
>      CPUState *cs =3D CPU(dev);
>      CRISCPUClass *ccc =3D CRIS_CPU_GET_CLASS(dev);
> +    Error *local_err =3D NULL;
> +
> +    cpu_exec_realizefn(cs, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> =20
>      cpu_reset(cs);
>      qemu_init_vcpu(cs);
> @@ -187,7 +194,6 @@ static void cris_cpu_initfn(Object *obj)
>      static bool tcg_initialized;
> =20
>      cs->env_ptr =3D env;
> -    cpu_exec_init(cs, &error_abort);
> =20
>      env->pregs[PR_VR] =3D ccc->vr;
> =20
> @@ -326,13 +332,6 @@ static void cris_cpu_class_init(ObjectClass *oc, voi=
d *data)
>      cc->gdb_stop_before_watchpoint =3D true;
> =20
>      cc->disas_set_info =3D cris_disas_set_info;
> -
> -    /*
> -     * Reason: cris_cpu_initfn() calls cpu_exec_init(), which saves
> -     * the object in cpus -> dangling pointer after final
> -     * object_unref().
> -     */
> -    dc->cannot_destroy_with_object_finalize_yet =3D true;
>  }
> =20
>  static const TypeInfo cris_cpu_type_info =3D {
> diff --git a/target-i386/cpu.c b/target-i386/cpu.c
> index 1c57fce..3476d46 100644
> --- a/target-i386/cpu.c
> +++ b/target-i386/cpu.c
> @@ -3158,7 +3158,11 @@ static void x86_cpu_realizefn(DeviceState *dev, Er=
ror **errp)
>              cpu->phys_bits =3D 32;
>          }
>      }
> -    cpu_exec_init(cs, &error_abort);
> +    cpu_exec_realizefn(cs, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> =20
>      if (tcg_enabled()) {
>          tcg_x86_init();
> @@ -3537,11 +3541,6 @@ static void x86_cpu_common_class_init(ObjectClass =
*oc, void *data)
>      cc->cpu_exec_exit =3D x86_cpu_exec_exit;
> =20
>      dc->cannot_instantiate_with_device_add_yet =3D false;
> -    /*
> -     * Reason: x86_cpu_initfn() calls cpu_exec_init(), which saves the
> -     * object in cpus -> dangling pointer after final object_unref().
> -     */
> -    dc->cannot_destroy_with_object_finalize_yet =3D true;
>  }
> =20
>  static const TypeInfo x86_cpu_type_info =3D {
> diff --git a/target-lm32/cpu.c b/target-lm32/cpu.c
> index a783d46..8d939a7 100644
> --- a/target-lm32/cpu.c
> +++ b/target-lm32/cpu.c
> @@ -144,6 +144,13 @@ static void lm32_cpu_realizefn(DeviceState *dev, Err=
or **errp)
>  {
>      CPUState *cs =3D CPU(dev);
>      LM32CPUClass *lcc =3D LM32_CPU_GET_CLASS(dev);
> +    Error *local_err =3D NULL;
> +
> +    cpu_exec_realizefn(cs, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> =20
>      cpu_reset(cs);
> =20
> @@ -160,7 +167,6 @@ static void lm32_cpu_initfn(Object *obj)
>      static bool tcg_initialized;
> =20
>      cs->env_ptr =3D env;
> -    cpu_exec_init(cs, &error_abort);
> =20
>      env->flags =3D 0;
> =20
> @@ -285,13 +291,6 @@ static void lm32_cpu_class_init(ObjectClass *oc, voi=
d *data)
>      cc->gdb_stop_before_watchpoint =3D true;
>      cc->debug_excp_handler =3D lm32_debug_excp_handler;
>      cc->disas_set_info =3D lm32_cpu_disas_set_info;
> -
> -    /*
> -     * Reason: lm32_cpu_initfn() calls cpu_exec_init(), which saves
> -     * the object in cpus -> dangling pointer after final
> -     * object_unref().
> -     */
> -    dc->cannot_destroy_with_object_finalize_yet =3D true;
>  }
> =20
>  static void lm32_register_cpu_type(const LM32CPUInfo *info)
> diff --git a/target-m68k/cpu.c b/target-m68k/cpu.c
> index 116b784..17e4be2 100644
> --- a/target-m68k/cpu.c
> +++ b/target-m68k/cpu.c
> @@ -159,6 +159,13 @@ static void m68k_cpu_realizefn(DeviceState *dev, Err=
or **errp)
>      CPUState *cs =3D CPU(dev);
>      M68kCPU *cpu =3D M68K_CPU(dev);
>      M68kCPUClass *mcc =3D M68K_CPU_GET_CLASS(dev);
> +    Error *local_err =3D NULL;
> +
> +    cpu_exec_realizefn(cs, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> =20
>      m68k_cpu_init_gdb(cpu);
> =20
> @@ -176,7 +183,6 @@ static void m68k_cpu_initfn(Object *obj)
>      static bool inited;
> =20
>      cs->env_ptr =3D env;
> -    cpu_exec_init(cs, &error_abort);
> =20
>      if (tcg_enabled() && !inited) {
>          inited =3D true;
> @@ -222,13 +228,6 @@ static void m68k_cpu_class_init(ObjectClass *c, void=
 *data)
>      cc->gdb_core_xml_file =3D "cf-core.xml";
> =20
>      dc->vmsd =3D &vmstate_m68k_cpu;
> -
> -    /*
> -     * Reason: m68k_cpu_initfn() calls cpu_exec_init(), which saves
> -     * the object in cpus -> dangling pointer after final
> -     * object_unref().
> -     */
> -    dc->cannot_destroy_with_object_finalize_yet =3D true;
>  }
> =20
>  static void register_cpu_type(const M68kCPUInfo *info)
> diff --git a/target-microblaze/cpu.c b/target-microblaze/cpu.c
> index 8edc00a..389c7b6 100644
> --- a/target-microblaze/cpu.c
> +++ b/target-microblaze/cpu.c
> @@ -138,6 +138,13 @@ static void mb_cpu_realizefn(DeviceState *dev, Error=
 **errp)
>      CPUMBState *env =3D &cpu->env;
>      uint8_t version_code =3D 0;
>      int i =3D 0;
> +    Error *local_err =3D NULL;
> +
> +    cpu_exec_realizefn(cs, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> =20
>      qemu_init_vcpu(cs);
> =20
> @@ -199,7 +206,6 @@ static void mb_cpu_initfn(Object *obj)
>      static bool tcg_initialized;
> =20
>      cs->env_ptr =3D env;
> -    cpu_exec_init(cs, &error_abort);
> =20
>      set_float_rounding_mode(float_round_nearest_even, &env->fp_status);
> =20
> @@ -267,12 +273,6 @@ static void mb_cpu_class_init(ObjectClass *oc, void =
*data)
>      cc->gdb_num_core_regs =3D 32 + 5;
> =20
>      cc->disas_set_info =3D mb_disas_set_info;
> -
> -    /*
> -     * Reason: mb_cpu_initfn() calls cpu_exec_init(), which saves the
> -     * object in cpus -> dangling pointer after final object_unref().
> -     */
> -    dc->cannot_destroy_with_object_finalize_yet =3D true;
>  }
> =20
>  static const TypeInfo mb_cpu_type_info =3D {
> diff --git a/target-mips/cpu.c b/target-mips/cpu.c
> index 64ad112..65ca607 100644
> --- a/target-mips/cpu.c
> +++ b/target-mips/cpu.c
> @@ -124,6 +124,13 @@ static void mips_cpu_realizefn(DeviceState *dev, Err=
or **errp)
>  {
>      CPUState *cs =3D CPU(dev);
>      MIPSCPUClass *mcc =3D MIPS_CPU_GET_CLASS(dev);
> +    Error *local_err =3D NULL;
> +
> +    cpu_exec_realizefn(cs, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> =20
>      cpu_reset(cs);
>      qemu_init_vcpu(cs);
> @@ -138,7 +145,6 @@ static void mips_cpu_initfn(Object *obj)
>      CPUMIPSState *env =3D &cpu->env;
> =20
>      cs->env_ptr =3D env;
> -    cpu_exec_init(cs, &error_abort);
> =20
>      if (tcg_enabled()) {
>          mips_tcg_init();
> @@ -177,13 +183,6 @@ static void mips_cpu_class_init(ObjectClass *c, void=
 *data)
> =20
>      cc->gdb_num_core_regs =3D 73;
>      cc->gdb_stop_before_watchpoint =3D true;
> -
> -    /*
> -     * Reason: mips_cpu_initfn() calls cpu_exec_init(), which saves
> -     * the object in cpus -> dangling pointer after final
> -     * object_unref().
> -     */
> -    dc->cannot_destroy_with_object_finalize_yet =3D true;
>  }
> =20
>  static const TypeInfo mips_cpu_type_info =3D {
> diff --git a/target-moxie/cpu.c b/target-moxie/cpu.c
> index 50a0899..b0be4a7 100644
> --- a/target-moxie/cpu.c
> +++ b/target-moxie/cpu.c
> @@ -61,6 +61,13 @@ static void moxie_cpu_realizefn(DeviceState *dev, Erro=
r **errp)
>  {
>      CPUState *cs =3D CPU(dev);
>      MoxieCPUClass *mcc =3D MOXIE_CPU_GET_CLASS(dev);
> +    Error *local_err =3D NULL;
> +
> +    cpu_exec_realizefn(cs, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> =20
>      qemu_init_vcpu(cs);
>      cpu_reset(cs);
> @@ -75,7 +82,6 @@ static void moxie_cpu_initfn(Object *obj)
>      static int inited;
> =20
>      cs->env_ptr =3D &cpu->env;
> -    cpu_exec_init(cs, &error_abort);
> =20
>      if (tcg_enabled() && !inited) {
>          inited =3D 1;
> @@ -124,13 +130,6 @@ static void moxie_cpu_class_init(ObjectClass *oc, vo=
id *data)
>      cc->vmsd =3D &vmstate_moxie_cpu;
>  #endif
>      cc->disas_set_info =3D moxie_cpu_disas_set_info;
> -
> -    /*
> -     * Reason: moxie_cpu_initfn() calls cpu_exec_init(), which saves
> -     * the object in cpus -> dangling pointer after final
> -     * object_unref().
> -     */
> -    dc->cannot_destroy_with_object_finalize_yet =3D true;
>  }
> =20
>  static void moxielite_initfn(Object *obj)
> diff --git a/target-openrisc/cpu.c b/target-openrisc/cpu.c
> index 155913f..698e87b 100644
> --- a/target-openrisc/cpu.c
> +++ b/target-openrisc/cpu.c
> @@ -81,6 +81,13 @@ static void openrisc_cpu_realizefn(DeviceState *dev, E=
rror **errp)
>  {
>      CPUState *cs =3D CPU(dev);
>      OpenRISCCPUClass *occ =3D OPENRISC_CPU_GET_CLASS(dev);
> +    Error *local_err =3D NULL;
> +
> +    cpu_exec_realizefn(cs, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> =20
>      qemu_init_vcpu(cs);
>      cpu_reset(cs);
> @@ -95,7 +102,6 @@ static void openrisc_cpu_initfn(Object *obj)
>      static int inited;
> =20
>      cs->env_ptr =3D &cpu->env;
> -    cpu_exec_init(cs, &error_abort);
> =20
>  #ifndef CONFIG_USER_ONLY
>      cpu_openrisc_mmu_init(cpu);
> @@ -180,13 +186,6 @@ static void openrisc_cpu_class_init(ObjectClass *oc,=
 void *data)
>      dc->vmsd =3D &vmstate_openrisc_cpu;
>  #endif
>      cc->gdb_num_core_regs =3D 32 + 3;
> -
> -    /*
> -     * Reason: openrisc_cpu_initfn() calls cpu_exec_init(), which saves
> -     * the object in cpus -> dangling pointer after final
> -     * object_unref().
> -     */
> -    dc->cannot_destroy_with_object_finalize_yet =3D true;
>  }
> =20
>  static void cpu_register(const OpenRISCCPUInfo *info)
> diff --git a/target-ppc/translate_init.c b/target-ppc/translate_init.c
> index b66b40b..40dae70 100644
> --- a/target-ppc/translate_init.c
> +++ b/target-ppc/translate_init.c
> @@ -9678,7 +9678,7 @@ static void ppc_cpu_realizefn(DeviceState *dev, Err=
or **errp)
>      }
>  #endif
> =20
> -    cpu_exec_init(cs, &local_err);
> +    cpu_exec_realizefn(cs, &local_err);
>      if (local_err !=3D NULL) {
>          error_propagate(errp, local_err);
>          return;
> diff --git a/target-s390x/cpu.c b/target-s390x/cpu.c
> index 35ae2ce..9e2f239 100644
> --- a/target-s390x/cpu.c
> +++ b/target-s390x/cpu.c
> @@ -207,7 +207,7 @@ static void s390_cpu_realizefn(DeviceState *dev, Erro=
r **errp)
>          goto out;
>      }
> =20
> -    cpu_exec_init(cs, &err);
> +    cpu_exec_realizefn(cs, &err);
>      if (err !=3D NULL) {
>          goto out;
>      }
> @@ -440,12 +440,6 @@ static void s390_cpu_class_init(ObjectClass *oc, voi=
d *data)
>      cc->gdb_core_xml_file =3D "s390x-core64.xml";
>      cc->gdb_arch_name =3D s390_gdb_arch_name;
> =20
> -    /*
> -     * Reason: s390_cpu_realizefn() calls cpu_exec_init(), which saves
> -     * the object in cpus -> dangling pointer after final
> -     * object_unref().
> -     */
> -    dc->cannot_destroy_with_object_finalize_yet =3D true;
>      s390_cpu_model_class_register_props(oc);
>  }
> =20
> diff --git a/target-sh4/cpu.c b/target-sh4/cpu.c
> index f589532..a38f6a6 100644
> --- a/target-sh4/cpu.c
> +++ b/target-sh4/cpu.c
> @@ -244,6 +244,13 @@ static void superh_cpu_realizefn(DeviceState *dev, E=
rror **errp)
>  {
>      CPUState *cs =3D CPU(dev);
>      SuperHCPUClass *scc =3D SUPERH_CPU_GET_CLASS(dev);
> +    Error *local_err =3D NULL;
> +
> +    cpu_exec_realizefn(cs, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> =20
>      cpu_reset(cs);
>      qemu_init_vcpu(cs);
> @@ -258,7 +265,6 @@ static void superh_cpu_initfn(Object *obj)
>      CPUSH4State *env =3D &cpu->env;
> =20
>      cs->env_ptr =3D env;
> -    cpu_exec_init(cs, &error_abort);
> =20
>      env->movcal_backup_tail =3D &(env->movcal_backup);
> =20
> @@ -303,13 +309,6 @@ static void superh_cpu_class_init(ObjectClass *oc, v=
oid *data)
>      cc->gdb_num_core_regs =3D 59;
> =20
>      dc->vmsd =3D &vmstate_sh_cpu;
> -
> -    /*
> -     * Reason: superh_cpu_initfn() calls cpu_exec_init(), which saves
> -     * the object in cpus -> dangling pointer after final
> -     * object_unref().
> -     */
> -    dc->cannot_destroy_with_object_finalize_yet =3D true;
>  }
> =20
>  static const TypeInfo superh_cpu_type_info =3D {
> diff --git a/target-sparc/cpu.c b/target-sparc/cpu.c
> index 800a25a..4e07b92 100644
> --- a/target-sparc/cpu.c
> +++ b/target-sparc/cpu.c
> @@ -792,7 +792,9 @@ static bool sparc_cpu_has_work(CPUState *cs)
> =20
>  static void sparc_cpu_realizefn(DeviceState *dev, Error **errp)
>  {
> +    CPUState *cs =3D CPU(dev);
>      SPARCCPUClass *scc =3D SPARC_CPU_GET_CLASS(dev);
> +    Error *local_err =3D NULL;
>  #if defined(CONFIG_USER_ONLY)
>      SPARCCPU *cpu =3D SPARC_CPU(dev);
>      CPUSPARCState *env =3D &cpu->env;
> @@ -802,7 +804,13 @@ static void sparc_cpu_realizefn(DeviceState *dev, Er=
ror **errp)
>      }
>  #endif
> =20
> -    qemu_init_vcpu(CPU(dev));
> +    cpu_exec_realizefn(cs, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
> +    qemu_init_vcpu(cs);
> =20
>      scc->parent_realize(dev, errp);
>  }
> @@ -814,7 +822,6 @@ static void sparc_cpu_initfn(Object *obj)
>      CPUSPARCState *env =3D &cpu->env;
> =20
>      cs->env_ptr =3D env;
> -    cpu_exec_init(cs, &error_abort);
> =20
>      if (tcg_enabled()) {
>          gen_intermediate_code_init(env);
> @@ -867,13 +874,6 @@ static void sparc_cpu_class_init(ObjectClass *oc, vo=
id *data)
>  #else
>      cc->gdb_num_core_regs =3D 72;
>  #endif
> -
> -    /*
> -     * Reason: sparc_cpu_initfn() calls cpu_exec_init(), which saves
> -     * the object in cpus -> dangling pointer after final
> -     * object_unref().
> -     */
> -    dc->cannot_destroy_with_object_finalize_yet =3D true;
>  }
> =20
>  static const TypeInfo sparc_cpu_type_info =3D {
> diff --git a/target-tilegx/cpu.c b/target-tilegx/cpu.c
> index 7017cb6..454793f 100644
> --- a/target-tilegx/cpu.c
> +++ b/target-tilegx/cpu.c
> @@ -92,6 +92,13 @@ static void tilegx_cpu_realizefn(DeviceState *dev, Err=
or **errp)
>  {
>      CPUState *cs =3D CPU(dev);
>      TileGXCPUClass *tcc =3D TILEGX_CPU_GET_CLASS(dev);
> +    Error *local_err =3D NULL;
> +
> +    cpu_exec_realizefn(cs, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> =20
>      cpu_reset(cs);
>      qemu_init_vcpu(cs);
> @@ -107,7 +114,6 @@ static void tilegx_cpu_initfn(Object *obj)
>      static bool tcg_initialized;
> =20
>      cs->env_ptr =3D env;
> -    cpu_exec_init(cs, &error_abort);
> =20
>      if (tcg_enabled() && !tcg_initialized) {
>          tcg_initialized =3D true;
> @@ -162,13 +168,6 @@ static void tilegx_cpu_class_init(ObjectClass *oc, v=
oid *data)
>      cc->set_pc =3D tilegx_cpu_set_pc;
>      cc->handle_mmu_fault =3D tilegx_cpu_handle_mmu_fault;
>      cc->gdb_num_core_regs =3D 0;
> -
> -    /*
> -     * Reason: tilegx_cpu_initfn() calls cpu_exec_init(), which saves
> -     * the object in cpus -> dangling pointer after final
> -     * object_unref().
> -     */
> -    dc->cannot_destroy_with_object_finalize_yet =3D true;
>  }
> =20
>  static const TypeInfo tilegx_cpu_type_info =3D {
> diff --git a/target-tricore/cpu.c b/target-tricore/cpu.c
> index 35d4ee4..785b76b 100644
> --- a/target-tricore/cpu.c
> +++ b/target-tricore/cpu.c
> @@ -69,6 +69,13 @@ static void tricore_cpu_realizefn(DeviceState *dev, Er=
ror **errp)
>      TriCoreCPU *cpu =3D TRICORE_CPU(dev);
>      TriCoreCPUClass *tcc =3D TRICORE_CPU_GET_CLASS(dev);
>      CPUTriCoreState *env =3D &cpu->env;
> +    Error *local_err =3D NULL;
> +
> +    cpu_exec_realizefn(cs, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> =20
>      /* Some features automatically imply others */
>      if (tricore_feature(env, TRICORE_FEATURE_161)) {
> @@ -95,7 +102,6 @@ static void tricore_cpu_initfn(Object *obj)
>      CPUTriCoreState *env =3D &cpu->env;
> =20
>      cs->env_ptr =3D env;
> -    cpu_exec_init(cs, &error_abort);
> =20
>      if (tcg_enabled()) {
>          tricore_tcg_init();
> @@ -172,13 +178,6 @@ static void tricore_cpu_class_init(ObjectClass *c, v=
oid *data)
>      cc->dump_state =3D tricore_cpu_dump_state;
>      cc->set_pc =3D tricore_cpu_set_pc;
>      cc->synchronize_from_tb =3D tricore_cpu_synchronize_from_tb;
> -
> -    /*
> -     * Reason: tricore_cpu_initfn() calls cpu_exec_init(), which saves
> -     * the object in cpus -> dangling pointer after final
> -     * object_unref().
> -     */
> -    dc->cannot_destroy_with_object_finalize_yet =3D true;
>  }
> =20
>  static void cpu_register(const TriCoreCPUInfo *info)
> diff --git a/target-unicore32/cpu.c b/target-unicore32/cpu.c
> index e7a4984..c169972 100644
> --- a/target-unicore32/cpu.c
> +++ b/target-unicore32/cpu.c
> @@ -101,9 +101,17 @@ static const UniCore32CPUInfo uc32_cpus[] =3D {
> =20
>  static void uc32_cpu_realizefn(DeviceState *dev, Error **errp)
>  {
> +    CPUState *cs =3D CPU(dev);
>      UniCore32CPUClass *ucc =3D UNICORE32_CPU_GET_CLASS(dev);
> +    Error *local_err =3D NULL;
> =20
> -    qemu_init_vcpu(CPU(dev));
> +    cpu_exec_realizefn(cs, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
> +    qemu_init_vcpu(cs);
> =20
>      ucc->parent_realize(dev, errp);
>  }
> @@ -116,7 +124,6 @@ static void uc32_cpu_initfn(Object *obj)
>      static bool inited;
> =20
>      cs->env_ptr =3D env;
> -    cpu_exec_init(cs, &error_abort);
> =20
>  #ifdef CONFIG_USER_ONLY
>      env->uncached_asr =3D ASR_MODE_USER;
> @@ -160,13 +167,6 @@ static void uc32_cpu_class_init(ObjectClass *oc, voi=
d *data)
>      cc->get_phys_page_debug =3D uc32_cpu_get_phys_page_debug;
>  #endif
>      dc->vmsd =3D &vmstate_uc32_cpu;
> -
> -    /*
> -     * Reason: uc32_cpu_initfn() calls cpu_exec_init(), which saves
> -     * the object in cpus -> dangling pointer after final
> -     * object_unref().
> -     */
> -    dc->cannot_destroy_with_object_finalize_yet =3D true;
>  }
> =20
>  static void uc32_register_cpu_type(const UniCore32CPUInfo *info)
> diff --git a/target-xtensa/cpu.c b/target-xtensa/cpu.c
> index 5ad08a2..e8e9f91 100644
> --- a/target-xtensa/cpu.c
> +++ b/target-xtensa/cpu.c
> @@ -99,6 +99,13 @@ static void xtensa_cpu_realizefn(DeviceState *dev, Err=
or **errp)
>  {
>      CPUState *cs =3D CPU(dev);
>      XtensaCPUClass *xcc =3D XTENSA_CPU_GET_CLASS(dev);
> +    Error *local_err =3D NULL;
> +
> +    cpu_exec_realizefn(cs, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> =20
>      cs->gdb_num_regs =3D xcc->config->gdb_regmap.num_regs;
> =20
> @@ -117,7 +124,6 @@ static void xtensa_cpu_initfn(Object *obj)
> =20
>      cs->env_ptr =3D env;
>      env->config =3D xcc->config;
> -    cpu_exec_init(cs, &error_abort);
> =20
>      if (tcg_enabled() && !tcg_inited) {
>          tcg_inited =3D true;
> @@ -158,13 +164,6 @@ static void xtensa_cpu_class_init(ObjectClass *oc, v=
oid *data)
>  #endif
>      cc->debug_excp_handler =3D xtensa_breakpoint_handler;
>      dc->vmsd =3D &vmstate_xtensa_cpu;
> -
> -    /*
> -     * Reason: xtensa_cpu_initfn() calls cpu_exec_init(), which saves
> -     * the object in cpus -> dangling pointer after final
> -     * object_unref().
> -     */
> -    dc->cannot_destroy_with_object_finalize_yet =3D true;
>  }
> =20
>  static const TypeInfo xtensa_cpu_type_info =3D {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--DMLl6fZPX8o7hGmc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYBEjXAAoJEGw4ysog2bOSnQMQAKXRuZJ5spgj5PvKKSeg0ou7
7lXhBjkeAJcuBRKaoyU/qzA5v57A87F1D8UMwNfORQ7a1rHrHkkyz64yl9nF2tdB
mc22Fq3Kax+5MUi5AcaZU2lPwBHk9Z2lfU7wAJy/YKNxeqmarMh1eCCdwYTdlhTB
kpiyRPKYx8ljD5pUjA5BZhYq62jBpCERxWf/TdPNtGaBXJSktnB0oTNF569BLgNH
OA4/D2nykqRXwlIRlfW6kn+dnOXyPdxyWbOd+MIcVy7gFZBzhxPeo08bfZ171mbk
BcmO/BH4rLi6Lbd8rj9p2mBIJS2PZ85lTjX5a8NNh2rxl9cwNrJSkU5cFvXUfHUY
++/Ynjg+8VKuaUESBtmV+/R5GZ+ZgMM+Vrht9+8WiuoA7gMaetJeNBKuXMekaJpX
G8gcTAnTVT2rQjQMhl1ldrMdAdiJQye4ZOxGgYHP4PmlhjkT+lDW2P3qSQtFuuvN
xkqX/tdCajRGP45+METorRc3uCT448GWB2ktObH6wTbvg13FvIgorKj4Z2sng9Ct
GCd2jQt7GKWccsKwDyAfwKDTy3mDFbkYOE3mIldA34EN4uEYjGN6k+VpQqNwiC0E
/zKGCzB0cM4+EEDlZSWCCNTyHY/uberFR4miskiGfybEZ2rvLkQ2nRvZ7on7tTJe
qhnwLd48n+sTFaR47c/Z
=xx4W
-----END PGP SIGNATURE-----

--DMLl6fZPX8o7hGmc--
