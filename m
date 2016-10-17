Received: by 10.80.166.35 with SMTP id d32csp493810edc;
        Mon, 17 Oct 2016 07:25:46 -0700 (PDT)
X-Received: by 10.129.135.132 with SMTP id x126mr25841051ywf.310.1476714346633;
        Mon, 17 Oct 2016 07:25:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j4si8444002ywf.334.2016.10.17.07.25.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Oct 2016 07:25:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33443 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bw8rK-00047t-01
	for alex.bennee@linaro.org; Mon, 17 Oct 2016 10:25:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bw8rC-00044z-Ns
	for qemu-arm@nongnu.org; Mon, 17 Oct 2016 10:25:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bw8r7-000898-J7
	for qemu-arm@nongnu.org; Mon, 17 Oct 2016 10:25:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36648)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1bw8r7-00088a-8m; Mon, 17 Oct 2016 10:25:33 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DA3507EA85;
	Mon, 17 Oct 2016 14:25:31 +0000 (UTC)
Received: from [10.36.112.25] (ovpn-112-25.ams2.redhat.com [10.36.112.25])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9HEPMON015769; Mon, 17 Oct 2016 10:25:23 -0400
To: Eduardo Habkost <ehabkost@redhat.com>
References: <1476485569-6744-1-git-send-email-lvivier@redhat.com>
	<1476485569-6744-3-git-send-email-lvivier@redhat.com>
	<20161017140310.GU3275@thinpad.lan.raisama.net>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <1146f2ee-1349-3a65-402c-725058aee3f7@redhat.com>
Date: Mon, 17 Oct 2016 16:25:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20161017140310.GU3275@thinpad.lan.raisama.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 17 Oct 2016 14:25:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 2/3] exec: rename cpu_exec_init() as
 cpu_exec_realizefn()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Anthony Green <green@moxielogic.com>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, Max Filippov <jcmvbkbc@gmail.com>,
	Greg Ungerer <gerg@uclinux.org>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Jia Liu <proljc@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Bharata B Rao <bharata@linux.vnet.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Chen Gang <gang.chen.5i5j@gmail.com>, Greg Kurz <groug@kaod.org>,
	qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Matthew Rosato <mjrosato@linux.vnet.ibm.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3EGXpwTh9fJl



On 17/10/2016 16:03, Eduardo Habkost wrote:
> On Sat, Oct 15, 2016 at 12:52:48AM +0200, Laurent Vivier wrote:
>> Modify all CPUs to call it from XXX_cpu_realizefn() function.
>>
>> Remove all the cannot_destroy_with_object_finalize_yet as
>> unsafe references have been moved to cpu_exec_realizefn().
>> (tested with QOM command provided by commit 4c315c27)
>>
>> for arm:
>>
>> Setting of cpu->mp_affinity is moved from arm_cpu_initfn()
>> to arm_cpu_realizefn() as setting of cpu_index is now done
>> in cpu_exec_realizefn().
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> 
> Subject line is misleading: it looks like a trivial function
> rename, but there are functional changes in multiple
> architectures.
> 
> Do you mind if subject is changed to "move cpu_exec_init() calls
> to realize functions" when committing? That's the main purpose of
> the patch, the rename is just a detail.

I agree.

Thanks,
Laurent

> I liked to have the "move cpu_exec_realize() to realize function"
> part split per architecture in v1/v2. But the rename would touch
> all architectures anyway, and making this as a single patch would
> help us avoid leaving some architecture behind.
> 
> 
>> ---
>>  exec.c                      |  2 +-
>>  include/exec/exec-all.h     |  1 -
>>  include/qom/cpu.h           |  1 +
>>  target-alpha/cpu.c          | 15 +++++++--------
>>  target-arm/cpu.c            | 39 +++++++++++++++++----------------------
>>  target-cris/cpu.c           | 15 +++++++--------
>>  target-i386/cpu.c           | 11 +++++------
>>  target-lm32/cpu.c           | 15 +++++++--------
>>  target-m68k/cpu.c           | 15 +++++++--------
>>  target-microblaze/cpu.c     | 14 +++++++-------
>>  target-mips/cpu.c           | 15 +++++++--------
>>  target-moxie/cpu.c          | 15 +++++++--------
>>  target-openrisc/cpu.c       | 15 +++++++--------
>>  target-ppc/translate_init.c |  2 +-
>>  target-s390x/cpu.c          |  8 +-------
>>  target-sh4/cpu.c            | 15 +++++++--------
>>  target-sparc/cpu.c          | 18 +++++++++---------
>>  target-tilegx/cpu.c         | 15 +++++++--------
>>  target-tricore/cpu.c        | 15 +++++++--------
>>  target-unicore32/cpu.c      | 18 +++++++++---------
>>  target-xtensa/cpu.c         | 15 +++++++--------
>>  21 files changed, 128 insertions(+), 151 deletions(-)
>>
>> diff --git a/exec.c b/exec.c
>> index d1e57c4..203eb52 100644
>> --- a/exec.c
>> +++ b/exec.c
>> @@ -634,7 +634,7 @@ void cpu_exec_initfn(CPUState *cpu)
>>  #endif
>>  }
>>  
>> -void cpu_exec_init(CPUState *cpu, Error **errp)
>> +void cpu_exec_realizefn(CPUState *cpu, Error **errp)
>>  {
>>      CPUClass *cc ATTRIBUTE_UNUSED = CPU_GET_CLASS(cpu);
>>  
>> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>> index 336a57c..9797d55 100644
>> --- a/include/exec/exec-all.h
>> +++ b/include/exec/exec-all.h
>> @@ -57,7 +57,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>>                                uint32_t flags,
>>                                int cflags);
>>  
>> -void cpu_exec_init(CPUState *cpu, Error **errp);
>>  void QEMU_NORETURN cpu_loop_exit(CPUState *cpu);
>>  void QEMU_NORETURN cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc);
>>  
>> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
>> index d7648a9..5520c6c 100644
>> --- a/include/qom/cpu.h
>> +++ b/include/qom/cpu.h
>> @@ -947,6 +947,7 @@ AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx);
>>  void QEMU_NORETURN cpu_abort(CPUState *cpu, const char *fmt, ...)
>>      GCC_FMT_ATTR(2, 3);
>>  void cpu_exec_initfn(CPUState *cpu);
>> +void cpu_exec_realizefn(CPUState *cpu, Error **errp);
>>  void cpu_exec_exit(CPUState *cpu);
>>  
>>  #ifdef CONFIG_SOFTMMU
>> diff --git a/target-alpha/cpu.c b/target-alpha/cpu.c
>> index 6d01d7f..30d77ce 100644
>> --- a/target-alpha/cpu.c
>> +++ b/target-alpha/cpu.c
>> @@ -59,6 +59,13 @@ static void alpha_cpu_realizefn(DeviceState *dev, Error **errp)
>>  {
>>      CPUState *cs = CPU(dev);
>>      AlphaCPUClass *acc = ALPHA_CPU_GET_CLASS(dev);
>> +    Error *local_err = NULL;
>> +
>> +    cpu_exec_realizefn(cs, &local_err);
>> +    if (local_err != NULL) {
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>>  
>>      qemu_init_vcpu(cs);
>>  
>> @@ -266,7 +273,6 @@ static void alpha_cpu_initfn(Object *obj)
>>      CPUAlphaState *env = &cpu->env;
>>  
>>      cs->env_ptr = env;
>> -    cpu_exec_init(cs, &error_abort);
>>      tlb_flush(cs, 1);
>>  
>>      alpha_translate_init();
>> @@ -309,13 +315,6 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
>>      cc->disas_set_info = alpha_cpu_disas_set_info;
>>  
>>      cc->gdb_num_core_regs = 67;
>> -
>> -    /*
>> -     * Reason: alpha_cpu_initfn() calls cpu_exec_init(), which saves
>> -     * the object in cpus -> dangling pointer after final
>> -     * object_unref().
>> -     */
>> -    dc->cannot_destroy_with_object_finalize_yet = true;
>>  }
>>  
>>  static const TypeInfo alpha_cpu_type_info = {
>> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
>> index 1b9540e..364a45d 100644
>> --- a/target-arm/cpu.c
>> +++ b/target-arm/cpu.c
>> @@ -441,22 +441,11 @@ static void arm_cpu_initfn(Object *obj)
>>      CPUState *cs = CPU(obj);
>>      ARMCPU *cpu = ARM_CPU(obj);
>>      static bool inited;
>> -    uint32_t Aff1, Aff0;
>>  
>>      cs->env_ptr = &cpu->env;
>> -    cpu_exec_init(cs, &error_abort);
>>      cpu->cp_regs = g_hash_table_new_full(g_int_hash, g_int_equal,
>>                                           g_free, g_free);
>>  
>> -    /* This cpu-id-to-MPIDR affinity is used only for TCG; KVM will override it.
>> -     * We don't support setting cluster ID ([16..23]) (known as Aff2
>> -     * in later ARM ARM versions), or any of the higher affinity level fields,
>> -     * so these bits always RAZ.
>> -     */
>> -    Aff1 = cs->cpu_index / ARM_CPUS_PER_CLUSTER;
>> -    Aff0 = cs->cpu_index % ARM_CPUS_PER_CLUSTER;
>> -    cpu->mp_affinity = (Aff1 << ARM_AFF1_SHIFT) | Aff0;
>> -
>>  #ifndef CONFIG_USER_ONLY
>>      /* Our inbound IRQ and FIQ lines */
>>      if (kvm_enabled()) {
>> @@ -576,6 +565,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>>      ARMCPU *cpu = ARM_CPU(dev);
>>      ARMCPUClass *acc = ARM_CPU_GET_CLASS(dev);
>>      CPUARMState *env = &cpu->env;
>> +    Error *local_err = NULL;
>> +    uint32_t Aff1, Aff0;
>> +
>> +    cpu_exec_realizefn(cs, &local_err);
>> +    if (local_err != NULL) {
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>>  
>>      /* Some features automatically imply others: */
>>      if (arm_feature(env, ARM_FEATURE_V8)) {
>> @@ -631,6 +628,15 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>>          set_feature(env, ARM_FEATURE_THUMB_DSP);
>>      }
>>  
>> +    /* This cpu-id-to-MPIDR affinity is used only for TCG; KVM will override it.
>> +     * We don't support setting cluster ID ([16..23]) (known as Aff2
>> +     * in later ARM ARM versions), or any of the higher affinity level fields,
>> +     * so these bits always RAZ.
>> +     */
>> +    Aff1 = cs->cpu_index / ARM_CPUS_PER_CLUSTER;
>> +    Aff0 = cs->cpu_index % ARM_CPUS_PER_CLUSTER;
>> +    cpu->mp_affinity = (Aff1 << ARM_AFF1_SHIFT) | Aff0;
>> +
>>      if (cpu->reset_hivecs) {
>>              cpu->reset_sctlr |= (1 << 13);
>>      }
>> @@ -1533,17 +1539,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>>      cc->debug_check_watchpoint = arm_debug_check_watchpoint;
>>  
>>      cc->disas_set_info = arm_disas_set_info;
>> -
>> -    /*
>> -     * Reason: arm_cpu_initfn() calls cpu_exec_init(), which saves
>> -     * the object in cpus -> dangling pointer after final
>> -     * object_unref().
>> -     *
>> -     * Once this is fixed, the devices that create ARM CPUs should be
>> -     * updated not to set cannot_destroy_with_object_finalize_yet,
>> -     * unless they still screw up something else.
>> -     */
>> -    dc->cannot_destroy_with_object_finalize_yet = true;
>>  }
>>  
>>  static void cpu_register(const ARMCPUInfo *info)
>> diff --git a/target-cris/cpu.c b/target-cris/cpu.c
>> index d680cfb..2e9ab97 100644
>> --- a/target-cris/cpu.c
>> +++ b/target-cris/cpu.c
>> @@ -142,6 +142,13 @@ static void cris_cpu_realizefn(DeviceState *dev, Error **errp)
>>  {
>>      CPUState *cs = CPU(dev);
>>      CRISCPUClass *ccc = CRIS_CPU_GET_CLASS(dev);
>> +    Error *local_err = NULL;
>> +
>> +    cpu_exec_realizefn(cs, &local_err);
>> +    if (local_err != NULL) {
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>>  
>>      cpu_reset(cs);
>>      qemu_init_vcpu(cs);
>> @@ -187,7 +194,6 @@ static void cris_cpu_initfn(Object *obj)
>>      static bool tcg_initialized;
>>  
>>      cs->env_ptr = env;
>> -    cpu_exec_init(cs, &error_abort);
>>  
>>      env->pregs[PR_VR] = ccc->vr;
>>  
>> @@ -326,13 +332,6 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
>>      cc->gdb_stop_before_watchpoint = true;
>>  
>>      cc->disas_set_info = cris_disas_set_info;
>> -
>> -    /*
>> -     * Reason: cris_cpu_initfn() calls cpu_exec_init(), which saves
>> -     * the object in cpus -> dangling pointer after final
>> -     * object_unref().
>> -     */
>> -    dc->cannot_destroy_with_object_finalize_yet = true;
>>  }
>>  
>>  static const TypeInfo cris_cpu_type_info = {
>> diff --git a/target-i386/cpu.c b/target-i386/cpu.c
>> index 1c57fce..3476d46 100644
>> --- a/target-i386/cpu.c
>> +++ b/target-i386/cpu.c
>> @@ -3158,7 +3158,11 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
>>              cpu->phys_bits = 32;
>>          }
>>      }
>> -    cpu_exec_init(cs, &error_abort);
>> +    cpu_exec_realizefn(cs, &local_err);
>> +    if (local_err != NULL) {
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>>  
>>      if (tcg_enabled()) {
>>          tcg_x86_init();
>> @@ -3537,11 +3541,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
>>      cc->cpu_exec_exit = x86_cpu_exec_exit;
>>  
>>      dc->cannot_instantiate_with_device_add_yet = false;
>> -    /*
>> -     * Reason: x86_cpu_initfn() calls cpu_exec_init(), which saves the
>> -     * object in cpus -> dangling pointer after final object_unref().
>> -     */
>> -    dc->cannot_destroy_with_object_finalize_yet = true;
>>  }
>>  
>>  static const TypeInfo x86_cpu_type_info = {
>> diff --git a/target-lm32/cpu.c b/target-lm32/cpu.c
>> index a783d46..8d939a7 100644
>> --- a/target-lm32/cpu.c
>> +++ b/target-lm32/cpu.c
>> @@ -144,6 +144,13 @@ static void lm32_cpu_realizefn(DeviceState *dev, Error **errp)
>>  {
>>      CPUState *cs = CPU(dev);
>>      LM32CPUClass *lcc = LM32_CPU_GET_CLASS(dev);
>> +    Error *local_err = NULL;
>> +
>> +    cpu_exec_realizefn(cs, &local_err);
>> +    if (local_err != NULL) {
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>>  
>>      cpu_reset(cs);
>>  
>> @@ -160,7 +167,6 @@ static void lm32_cpu_initfn(Object *obj)
>>      static bool tcg_initialized;
>>  
>>      cs->env_ptr = env;
>> -    cpu_exec_init(cs, &error_abort);
>>  
>>      env->flags = 0;
>>  
>> @@ -285,13 +291,6 @@ static void lm32_cpu_class_init(ObjectClass *oc, void *data)
>>      cc->gdb_stop_before_watchpoint = true;
>>      cc->debug_excp_handler = lm32_debug_excp_handler;
>>      cc->disas_set_info = lm32_cpu_disas_set_info;
>> -
>> -    /*
>> -     * Reason: lm32_cpu_initfn() calls cpu_exec_init(), which saves
>> -     * the object in cpus -> dangling pointer after final
>> -     * object_unref().
>> -     */
>> -    dc->cannot_destroy_with_object_finalize_yet = true;
>>  }
>>  
>>  static void lm32_register_cpu_type(const LM32CPUInfo *info)
>> diff --git a/target-m68k/cpu.c b/target-m68k/cpu.c
>> index 116b784..17e4be2 100644
>> --- a/target-m68k/cpu.c
>> +++ b/target-m68k/cpu.c
>> @@ -159,6 +159,13 @@ static void m68k_cpu_realizefn(DeviceState *dev, Error **errp)
>>      CPUState *cs = CPU(dev);
>>      M68kCPU *cpu = M68K_CPU(dev);
>>      M68kCPUClass *mcc = M68K_CPU_GET_CLASS(dev);
>> +    Error *local_err = NULL;
>> +
>> +    cpu_exec_realizefn(cs, &local_err);
>> +    if (local_err != NULL) {
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>>  
>>      m68k_cpu_init_gdb(cpu);
>>  
>> @@ -176,7 +183,6 @@ static void m68k_cpu_initfn(Object *obj)
>>      static bool inited;
>>  
>>      cs->env_ptr = env;
>> -    cpu_exec_init(cs, &error_abort);
>>  
>>      if (tcg_enabled() && !inited) {
>>          inited = true;
>> @@ -222,13 +228,6 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
>>      cc->gdb_core_xml_file = "cf-core.xml";
>>  
>>      dc->vmsd = &vmstate_m68k_cpu;
>> -
>> -    /*
>> -     * Reason: m68k_cpu_initfn() calls cpu_exec_init(), which saves
>> -     * the object in cpus -> dangling pointer after final
>> -     * object_unref().
>> -     */
>> -    dc->cannot_destroy_with_object_finalize_yet = true;
>>  }
>>  
>>  static void register_cpu_type(const M68kCPUInfo *info)
>> diff --git a/target-microblaze/cpu.c b/target-microblaze/cpu.c
>> index 8edc00a..389c7b6 100644
>> --- a/target-microblaze/cpu.c
>> +++ b/target-microblaze/cpu.c
>> @@ -138,6 +138,13 @@ static void mb_cpu_realizefn(DeviceState *dev, Error **errp)
>>      CPUMBState *env = &cpu->env;
>>      uint8_t version_code = 0;
>>      int i = 0;
>> +    Error *local_err = NULL;
>> +
>> +    cpu_exec_realizefn(cs, &local_err);
>> +    if (local_err != NULL) {
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>>  
>>      qemu_init_vcpu(cs);
>>  
>> @@ -199,7 +206,6 @@ static void mb_cpu_initfn(Object *obj)
>>      static bool tcg_initialized;
>>  
>>      cs->env_ptr = env;
>> -    cpu_exec_init(cs, &error_abort);
>>  
>>      set_float_rounding_mode(float_round_nearest_even, &env->fp_status);
>>  
>> @@ -267,12 +273,6 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
>>      cc->gdb_num_core_regs = 32 + 5;
>>  
>>      cc->disas_set_info = mb_disas_set_info;
>> -
>> -    /*
>> -     * Reason: mb_cpu_initfn() calls cpu_exec_init(), which saves the
>> -     * object in cpus -> dangling pointer after final object_unref().
>> -     */
>> -    dc->cannot_destroy_with_object_finalize_yet = true;
>>  }
>>  
>>  static const TypeInfo mb_cpu_type_info = {
>> diff --git a/target-mips/cpu.c b/target-mips/cpu.c
>> index 64ad112..65ca607 100644
>> --- a/target-mips/cpu.c
>> +++ b/target-mips/cpu.c
>> @@ -124,6 +124,13 @@ static void mips_cpu_realizefn(DeviceState *dev, Error **errp)
>>  {
>>      CPUState *cs = CPU(dev);
>>      MIPSCPUClass *mcc = MIPS_CPU_GET_CLASS(dev);
>> +    Error *local_err = NULL;
>> +
>> +    cpu_exec_realizefn(cs, &local_err);
>> +    if (local_err != NULL) {
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>>  
>>      cpu_reset(cs);
>>      qemu_init_vcpu(cs);
>> @@ -138,7 +145,6 @@ static void mips_cpu_initfn(Object *obj)
>>      CPUMIPSState *env = &cpu->env;
>>  
>>      cs->env_ptr = env;
>> -    cpu_exec_init(cs, &error_abort);
>>  
>>      if (tcg_enabled()) {
>>          mips_tcg_init();
>> @@ -177,13 +183,6 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
>>  
>>      cc->gdb_num_core_regs = 73;
>>      cc->gdb_stop_before_watchpoint = true;
>> -
>> -    /*
>> -     * Reason: mips_cpu_initfn() calls cpu_exec_init(), which saves
>> -     * the object in cpus -> dangling pointer after final
>> -     * object_unref().
>> -     */
>> -    dc->cannot_destroy_with_object_finalize_yet = true;
>>  }
>>  
>>  static const TypeInfo mips_cpu_type_info = {
>> diff --git a/target-moxie/cpu.c b/target-moxie/cpu.c
>> index 50a0899..b0be4a7 100644
>> --- a/target-moxie/cpu.c
>> +++ b/target-moxie/cpu.c
>> @@ -61,6 +61,13 @@ static void moxie_cpu_realizefn(DeviceState *dev, Error **errp)
>>  {
>>      CPUState *cs = CPU(dev);
>>      MoxieCPUClass *mcc = MOXIE_CPU_GET_CLASS(dev);
>> +    Error *local_err = NULL;
>> +
>> +    cpu_exec_realizefn(cs, &local_err);
>> +    if (local_err != NULL) {
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>>  
>>      qemu_init_vcpu(cs);
>>      cpu_reset(cs);
>> @@ -75,7 +82,6 @@ static void moxie_cpu_initfn(Object *obj)
>>      static int inited;
>>  
>>      cs->env_ptr = &cpu->env;
>> -    cpu_exec_init(cs, &error_abort);
>>  
>>      if (tcg_enabled() && !inited) {
>>          inited = 1;
>> @@ -124,13 +130,6 @@ static void moxie_cpu_class_init(ObjectClass *oc, void *data)
>>      cc->vmsd = &vmstate_moxie_cpu;
>>  #endif
>>      cc->disas_set_info = moxie_cpu_disas_set_info;
>> -
>> -    /*
>> -     * Reason: moxie_cpu_initfn() calls cpu_exec_init(), which saves
>> -     * the object in cpus -> dangling pointer after final
>> -     * object_unref().
>> -     */
>> -    dc->cannot_destroy_with_object_finalize_yet = true;
>>  }
>>  
>>  static void moxielite_initfn(Object *obj)
>> diff --git a/target-openrisc/cpu.c b/target-openrisc/cpu.c
>> index 155913f..698e87b 100644
>> --- a/target-openrisc/cpu.c
>> +++ b/target-openrisc/cpu.c
>> @@ -81,6 +81,13 @@ static void openrisc_cpu_realizefn(DeviceState *dev, Error **errp)
>>  {
>>      CPUState *cs = CPU(dev);
>>      OpenRISCCPUClass *occ = OPENRISC_CPU_GET_CLASS(dev);
>> +    Error *local_err = NULL;
>> +
>> +    cpu_exec_realizefn(cs, &local_err);
>> +    if (local_err != NULL) {
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>>  
>>      qemu_init_vcpu(cs);
>>      cpu_reset(cs);
>> @@ -95,7 +102,6 @@ static void openrisc_cpu_initfn(Object *obj)
>>      static int inited;
>>  
>>      cs->env_ptr = &cpu->env;
>> -    cpu_exec_init(cs, &error_abort);
>>  
>>  #ifndef CONFIG_USER_ONLY
>>      cpu_openrisc_mmu_init(cpu);
>> @@ -180,13 +186,6 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
>>      dc->vmsd = &vmstate_openrisc_cpu;
>>  #endif
>>      cc->gdb_num_core_regs = 32 + 3;
>> -
>> -    /*
>> -     * Reason: openrisc_cpu_initfn() calls cpu_exec_init(), which saves
>> -     * the object in cpus -> dangling pointer after final
>> -     * object_unref().
>> -     */
>> -    dc->cannot_destroy_with_object_finalize_yet = true;
>>  }
>>  
>>  static void cpu_register(const OpenRISCCPUInfo *info)
>> diff --git a/target-ppc/translate_init.c b/target-ppc/translate_init.c
>> index b66b40b..40dae70 100644
>> --- a/target-ppc/translate_init.c
>> +++ b/target-ppc/translate_init.c
>> @@ -9678,7 +9678,7 @@ static void ppc_cpu_realizefn(DeviceState *dev, Error **errp)
>>      }
>>  #endif
>>  
>> -    cpu_exec_init(cs, &local_err);
>> +    cpu_exec_realizefn(cs, &local_err);
>>      if (local_err != NULL) {
>>          error_propagate(errp, local_err);
>>          return;
>> diff --git a/target-s390x/cpu.c b/target-s390x/cpu.c
>> index 35ae2ce..9e2f239 100644
>> --- a/target-s390x/cpu.c
>> +++ b/target-s390x/cpu.c
>> @@ -207,7 +207,7 @@ static void s390_cpu_realizefn(DeviceState *dev, Error **errp)
>>          goto out;
>>      }
>>  
>> -    cpu_exec_init(cs, &err);
>> +    cpu_exec_realizefn(cs, &err);
>>      if (err != NULL) {
>>          goto out;
>>      }
>> @@ -440,12 +440,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
>>      cc->gdb_core_xml_file = "s390x-core64.xml";
>>      cc->gdb_arch_name = s390_gdb_arch_name;
>>  
>> -    /*
>> -     * Reason: s390_cpu_realizefn() calls cpu_exec_init(), which saves
>> -     * the object in cpus -> dangling pointer after final
>> -     * object_unref().
>> -     */
>> -    dc->cannot_destroy_with_object_finalize_yet = true;
>>      s390_cpu_model_class_register_props(oc);
>>  }
>>  
>> diff --git a/target-sh4/cpu.c b/target-sh4/cpu.c
>> index f589532..a38f6a6 100644
>> --- a/target-sh4/cpu.c
>> +++ b/target-sh4/cpu.c
>> @@ -244,6 +244,13 @@ static void superh_cpu_realizefn(DeviceState *dev, Error **errp)
>>  {
>>      CPUState *cs = CPU(dev);
>>      SuperHCPUClass *scc = SUPERH_CPU_GET_CLASS(dev);
>> +    Error *local_err = NULL;
>> +
>> +    cpu_exec_realizefn(cs, &local_err);
>> +    if (local_err != NULL) {
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>>  
>>      cpu_reset(cs);
>>      qemu_init_vcpu(cs);
>> @@ -258,7 +265,6 @@ static void superh_cpu_initfn(Object *obj)
>>      CPUSH4State *env = &cpu->env;
>>  
>>      cs->env_ptr = env;
>> -    cpu_exec_init(cs, &error_abort);
>>  
>>      env->movcal_backup_tail = &(env->movcal_backup);
>>  
>> @@ -303,13 +309,6 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
>>      cc->gdb_num_core_regs = 59;
>>  
>>      dc->vmsd = &vmstate_sh_cpu;
>> -
>> -    /*
>> -     * Reason: superh_cpu_initfn() calls cpu_exec_init(), which saves
>> -     * the object in cpus -> dangling pointer after final
>> -     * object_unref().
>> -     */
>> -    dc->cannot_destroy_with_object_finalize_yet = true;
>>  }
>>  
>>  static const TypeInfo superh_cpu_type_info = {
>> diff --git a/target-sparc/cpu.c b/target-sparc/cpu.c
>> index 800a25a..4e07b92 100644
>> --- a/target-sparc/cpu.c
>> +++ b/target-sparc/cpu.c
>> @@ -792,7 +792,9 @@ static bool sparc_cpu_has_work(CPUState *cs)
>>  
>>  static void sparc_cpu_realizefn(DeviceState *dev, Error **errp)
>>  {
>> +    CPUState *cs = CPU(dev);
>>      SPARCCPUClass *scc = SPARC_CPU_GET_CLASS(dev);
>> +    Error *local_err = NULL;
>>  #if defined(CONFIG_USER_ONLY)
>>      SPARCCPU *cpu = SPARC_CPU(dev);
>>      CPUSPARCState *env = &cpu->env;
>> @@ -802,7 +804,13 @@ static void sparc_cpu_realizefn(DeviceState *dev, Error **errp)
>>      }
>>  #endif
>>  
>> -    qemu_init_vcpu(CPU(dev));
>> +    cpu_exec_realizefn(cs, &local_err);
>> +    if (local_err != NULL) {
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>> +
>> +    qemu_init_vcpu(cs);
>>  
>>      scc->parent_realize(dev, errp);
>>  }
>> @@ -814,7 +822,6 @@ static void sparc_cpu_initfn(Object *obj)
>>      CPUSPARCState *env = &cpu->env;
>>  
>>      cs->env_ptr = env;
>> -    cpu_exec_init(cs, &error_abort);
>>  
>>      if (tcg_enabled()) {
>>          gen_intermediate_code_init(env);
>> @@ -867,13 +874,6 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
>>  #else
>>      cc->gdb_num_core_regs = 72;
>>  #endif
>> -
>> -    /*
>> -     * Reason: sparc_cpu_initfn() calls cpu_exec_init(), which saves
>> -     * the object in cpus -> dangling pointer after final
>> -     * object_unref().
>> -     */
>> -    dc->cannot_destroy_with_object_finalize_yet = true;
>>  }
>>  
>>  static const TypeInfo sparc_cpu_type_info = {
>> diff --git a/target-tilegx/cpu.c b/target-tilegx/cpu.c
>> index 7017cb6..454793f 100644
>> --- a/target-tilegx/cpu.c
>> +++ b/target-tilegx/cpu.c
>> @@ -92,6 +92,13 @@ static void tilegx_cpu_realizefn(DeviceState *dev, Error **errp)
>>  {
>>      CPUState *cs = CPU(dev);
>>      TileGXCPUClass *tcc = TILEGX_CPU_GET_CLASS(dev);
>> +    Error *local_err = NULL;
>> +
>> +    cpu_exec_realizefn(cs, &local_err);
>> +    if (local_err != NULL) {
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>>  
>>      cpu_reset(cs);
>>      qemu_init_vcpu(cs);
>> @@ -107,7 +114,6 @@ static void tilegx_cpu_initfn(Object *obj)
>>      static bool tcg_initialized;
>>  
>>      cs->env_ptr = env;
>> -    cpu_exec_init(cs, &error_abort);
>>  
>>      if (tcg_enabled() && !tcg_initialized) {
>>          tcg_initialized = true;
>> @@ -162,13 +168,6 @@ static void tilegx_cpu_class_init(ObjectClass *oc, void *data)
>>      cc->set_pc = tilegx_cpu_set_pc;
>>      cc->handle_mmu_fault = tilegx_cpu_handle_mmu_fault;
>>      cc->gdb_num_core_regs = 0;
>> -
>> -    /*
>> -     * Reason: tilegx_cpu_initfn() calls cpu_exec_init(), which saves
>> -     * the object in cpus -> dangling pointer after final
>> -     * object_unref().
>> -     */
>> -    dc->cannot_destroy_with_object_finalize_yet = true;
>>  }
>>  
>>  static const TypeInfo tilegx_cpu_type_info = {
>> diff --git a/target-tricore/cpu.c b/target-tricore/cpu.c
>> index 35d4ee4..785b76b 100644
>> --- a/target-tricore/cpu.c
>> +++ b/target-tricore/cpu.c
>> @@ -69,6 +69,13 @@ static void tricore_cpu_realizefn(DeviceState *dev, Error **errp)
>>      TriCoreCPU *cpu = TRICORE_CPU(dev);
>>      TriCoreCPUClass *tcc = TRICORE_CPU_GET_CLASS(dev);
>>      CPUTriCoreState *env = &cpu->env;
>> +    Error *local_err = NULL;
>> +
>> +    cpu_exec_realizefn(cs, &local_err);
>> +    if (local_err != NULL) {
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>>  
>>      /* Some features automatically imply others */
>>      if (tricore_feature(env, TRICORE_FEATURE_161)) {
>> @@ -95,7 +102,6 @@ static void tricore_cpu_initfn(Object *obj)
>>      CPUTriCoreState *env = &cpu->env;
>>  
>>      cs->env_ptr = env;
>> -    cpu_exec_init(cs, &error_abort);
>>  
>>      if (tcg_enabled()) {
>>          tricore_tcg_init();
>> @@ -172,13 +178,6 @@ static void tricore_cpu_class_init(ObjectClass *c, void *data)
>>      cc->dump_state = tricore_cpu_dump_state;
>>      cc->set_pc = tricore_cpu_set_pc;
>>      cc->synchronize_from_tb = tricore_cpu_synchronize_from_tb;
>> -
>> -    /*
>> -     * Reason: tricore_cpu_initfn() calls cpu_exec_init(), which saves
>> -     * the object in cpus -> dangling pointer after final
>> -     * object_unref().
>> -     */
>> -    dc->cannot_destroy_with_object_finalize_yet = true;
>>  }
>>  
>>  static void cpu_register(const TriCoreCPUInfo *info)
>> diff --git a/target-unicore32/cpu.c b/target-unicore32/cpu.c
>> index e7a4984..c169972 100644
>> --- a/target-unicore32/cpu.c
>> +++ b/target-unicore32/cpu.c
>> @@ -101,9 +101,17 @@ static const UniCore32CPUInfo uc32_cpus[] = {
>>  
>>  static void uc32_cpu_realizefn(DeviceState *dev, Error **errp)
>>  {
>> +    CPUState *cs = CPU(dev);
>>      UniCore32CPUClass *ucc = UNICORE32_CPU_GET_CLASS(dev);
>> +    Error *local_err = NULL;
>>  
>> -    qemu_init_vcpu(CPU(dev));
>> +    cpu_exec_realizefn(cs, &local_err);
>> +    if (local_err != NULL) {
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>> +
>> +    qemu_init_vcpu(cs);
>>  
>>      ucc->parent_realize(dev, errp);
>>  }
>> @@ -116,7 +124,6 @@ static void uc32_cpu_initfn(Object *obj)
>>      static bool inited;
>>  
>>      cs->env_ptr = env;
>> -    cpu_exec_init(cs, &error_abort);
>>  
>>  #ifdef CONFIG_USER_ONLY
>>      env->uncached_asr = ASR_MODE_USER;
>> @@ -160,13 +167,6 @@ static void uc32_cpu_class_init(ObjectClass *oc, void *data)
>>      cc->get_phys_page_debug = uc32_cpu_get_phys_page_debug;
>>  #endif
>>      dc->vmsd = &vmstate_uc32_cpu;
>> -
>> -    /*
>> -     * Reason: uc32_cpu_initfn() calls cpu_exec_init(), which saves
>> -     * the object in cpus -> dangling pointer after final
>> -     * object_unref().
>> -     */
>> -    dc->cannot_destroy_with_object_finalize_yet = true;
>>  }
>>  
>>  static void uc32_register_cpu_type(const UniCore32CPUInfo *info)
>> diff --git a/target-xtensa/cpu.c b/target-xtensa/cpu.c
>> index 5ad08a2..e8e9f91 100644
>> --- a/target-xtensa/cpu.c
>> +++ b/target-xtensa/cpu.c
>> @@ -99,6 +99,13 @@ static void xtensa_cpu_realizefn(DeviceState *dev, Error **errp)
>>  {
>>      CPUState *cs = CPU(dev);
>>      XtensaCPUClass *xcc = XTENSA_CPU_GET_CLASS(dev);
>> +    Error *local_err = NULL;
>> +
>> +    cpu_exec_realizefn(cs, &local_err);
>> +    if (local_err != NULL) {
>> +        error_propagate(errp, local_err);
>> +        return;
>> +    }
>>  
>>      cs->gdb_num_regs = xcc->config->gdb_regmap.num_regs;
>>  
>> @@ -117,7 +124,6 @@ static void xtensa_cpu_initfn(Object *obj)
>>  
>>      cs->env_ptr = env;
>>      env->config = xcc->config;
>> -    cpu_exec_init(cs, &error_abort);
>>  
>>      if (tcg_enabled() && !tcg_inited) {
>>          tcg_inited = true;
>> @@ -158,13 +164,6 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
>>  #endif
>>      cc->debug_excp_handler = xtensa_breakpoint_handler;
>>      dc->vmsd = &vmstate_xtensa_cpu;
>> -
>> -    /*
>> -     * Reason: xtensa_cpu_initfn() calls cpu_exec_init(), which saves
>> -     * the object in cpus -> dangling pointer after final
>> -     * object_unref().
>> -     */
>> -    dc->cannot_destroy_with_object_finalize_yet = true;
>>  }
>>  
>>  static const TypeInfo xtensa_cpu_type_info = {
>> -- 
>> 2.7.4
>>
> 
