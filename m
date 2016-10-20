Received: by 10.80.166.35 with SMTP id d32csp792235edc;
        Thu, 20 Oct 2016 05:08:00 -0700 (PDT)
X-Received: by 10.13.193.197 with SMTP id c188mr516724ywd.104.1476965280118;
        Thu, 20 Oct 2016 05:08:00 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y62si11222693yba.259.2016.10.20.05.07.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 20 Oct 2016 05:08:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54359 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bxC8d-0000tl-EC
	for alex.bennee@linaro.org; Thu, 20 Oct 2016 08:07:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bxC8U-0000r4-UT
	for qemu-arm@nongnu.org; Thu, 20 Oct 2016 08:07:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bxC8Q-0007r5-G6
	for qemu-arm@nongnu.org; Thu, 20 Oct 2016 08:07:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36472)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1bxC8Q-0007qa-8p; Thu, 20 Oct 2016 08:07:46 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E0617769F7;
	Thu, 20 Oct 2016 12:07:44 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9KC7bTh028735
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 20 Oct 2016 08:07:39 -0400
Date: Thu, 20 Oct 2016 14:07:37 +0200
From: Andrew Jones <drjones@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20161020120737.dz5572e6jt2sgzfk@kamzik.brq.redhat.com>
References: <1476962764-12166-1-git-send-email-lvivier@redhat.com>
	<1476962764-12166-3-git-send-email-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1476962764-12166-3-git-send-email-lvivier@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 20 Oct 2016 12:07:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 2/3] exec: move
 cpu_exec_init() calls to realize functions
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
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Greg Ungerer <gerg@uclinux.org>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Chen Gang <gang.chen.5i5j@gmail.com>, Jia Liu <proljc@gmail.com>,
	Alexander Graf <agraf@suse.de>, Bharata B Rao <bharata@linux.vnet.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Matthew Rosato <mjrosato@linux.vnet.ibm.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rueqaFMPJ4Zz

On Thu, Oct 20, 2016 at 01:26:03PM +0200, Laurent Vivier wrote:
> Modify all CPUs to call it from XXX_cpu_realizefn() function.
> 
> Remove all the cannot_destroy_with_object_finalize_yet as
> unsafe references have been moved to cpu_exec_realizefn().
> (tested with QOM command provided by commit 4c315c27)
> 
> for arm:
> 
> Setting of cpu->mp_affinity is moved from arm_cpu_initfn()
> to arm_cpu_realizefn() as setting of cpu_index is now done
> in cpu_exec_realizefn(). To avoid to overwrite an user defined
> value, we set it to an invalid value by default, and update
> it in realize function only if the value is still invalid.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
[...]
> diff --git a/target-arm/cpu-qom.h b/target-arm/cpu-qom.h
> index 3991173..a42495b 100644
> --- a/target-arm/cpu-qom.h
> +++ b/target-arm/cpu-qom.h
> @@ -80,9 +80,11 @@ void arm_gt_stimer_cb(void *opaque);
>  #define ARM_AFF2_MASK  (0xFFULL << ARM_AFF2_SHIFT)
>  #define ARM_AFF3_SHIFT 32
>  #define ARM_AFF3_MASK  (0xFFULL << ARM_AFF3_SHIFT)
> +#define ARM_DEFAULT_CPUS_PER_CLUSTER 8
>  
>  #define ARM32_AFFINITY_MASK (ARM_AFF0_MASK|ARM_AFF1_MASK|ARM_AFF2_MASK)
>  #define ARM64_AFFINITY_MASK \
>      (ARM_AFF0_MASK|ARM_AFF1_MASK|ARM_AFF2_MASK|ARM_AFF3_MASK)
> +#define ARM64_AFFINITY_INVALID (~ARM64_AFFINITY_MASK)
>  
>  #endif
> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
> index 1b9540e..fb272a8 100644
> --- a/target-arm/cpu.c
> +++ b/target-arm/cpu.c
> @@ -434,29 +434,16 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
>      }
>  }
>  
> -#define ARM_CPUS_PER_CLUSTER 8
> -
>  static void arm_cpu_initfn(Object *obj)
>  {
>      CPUState *cs = CPU(obj);
>      ARMCPU *cpu = ARM_CPU(obj);
>      static bool inited;
> -    uint32_t Aff1, Aff0;
>  
>      cs->env_ptr = &cpu->env;
> -    cpu_exec_init(cs, &error_abort);
>      cpu->cp_regs = g_hash_table_new_full(g_int_hash, g_int_equal,
>                                           g_free, g_free);
>  
> -    /* This cpu-id-to-MPIDR affinity is used only for TCG; KVM will override it.
> -     * We don't support setting cluster ID ([16..23]) (known as Aff2
> -     * in later ARM ARM versions), or any of the higher affinity level fields,
> -     * so these bits always RAZ.
> -     */
> -    Aff1 = cs->cpu_index / ARM_CPUS_PER_CLUSTER;
> -    Aff0 = cs->cpu_index % ARM_CPUS_PER_CLUSTER;
> -    cpu->mp_affinity = (Aff1 << ARM_AFF1_SHIFT) | Aff0;
> -
>  #ifndef CONFIG_USER_ONLY
>      /* Our inbound IRQ and FIQ lines */
>      if (kvm_enabled()) {
> @@ -576,6 +563,13 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>      ARMCPU *cpu = ARM_CPU(dev);
>      ARMCPUClass *acc = ARM_CPU_GET_CLASS(dev);
>      CPUARMState *env = &cpu->env;
> +    Error *local_err = NULL;
> +
> +    cpu_exec_realizefn(cs, &local_err);
> +    if (local_err != NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
>  
>      /* Some features automatically imply others: */
>      if (arm_feature(env, ARM_FEATURE_V8)) {
> @@ -631,6 +625,17 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          set_feature(env, ARM_FEATURE_THUMB_DSP);
>      }
>  
> +    /* This cpu-id-to-MPIDR affinity is used only for TCG; KVM will override it.
> +     * We don't support setting cluster ID ([16..23]) (known as Aff2
> +     * in later ARM ARM versions), or any of the higher affinity level fields,
> +     * so these bits always RAZ.
> +     */
> +    if (cpu->mp_affinity == ARM64_AFFINITY_INVALID) {
> +        uint32_t Aff1 = cs->cpu_index / ARM_DEFAULT_CPUS_PER_CLUSTER;
> +        uint32_t Aff0 = cs->cpu_index % ARM_DEFAULT_CPUS_PER_CLUSTER;

These should have been uint8_t, but I should have pointed that out before
and it probably doesn't really matter (it was uint32_t before...)

> +        cpu->mp_affinity = (Aff1 << ARM_AFF1_SHIFT) | Aff0;
> +    }
> +
>      if (cpu->reset_hivecs) {
>              cpu->reset_sctlr |= (1 << 13);
>      }
> @@ -1461,7 +1466,8 @@ static Property arm_cpu_properties[] = {
>      DEFINE_PROP_BOOL("start-powered-off", ARMCPU, start_powered_off, false),
>      DEFINE_PROP_UINT32("psci-conduit", ARMCPU, psci_conduit, 0),
>      DEFINE_PROP_UINT32("midr", ARMCPU, midr, 0),
> -    DEFINE_PROP_UINT64("mp-affinity", ARMCPU, mp_affinity, 0),
> +    DEFINE_PROP_UINT64("mp-affinity", ARMCPU,
> +                        mp_affinity, ARM64_AFFINITY_INVALID),
>      DEFINE_PROP_END_OF_LIST()
>  };
>  
> @@ -1533,17 +1539,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>      cc->debug_check_watchpoint = arm_debug_check_watchpoint;
>  
>      cc->disas_set_info = arm_disas_set_info;
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
> -    dc->cannot_destroy_with_object_finalize_yet = true;
>  }

For the ARM part

Reviewed-by: Andrew Jones <drjones@redhat.com>

Thanks,
drew
