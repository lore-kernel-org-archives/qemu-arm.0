Received: by 10.80.166.35 with SMTP id d32csp167464edc;
        Wed, 19 Oct 2016 01:31:28 -0700 (PDT)
X-Received: by 10.237.36.179 with SMTP id t48mr4539491qtc.19.1476865888258;
        Wed, 19 Oct 2016 01:31:28 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r82si4204760qki.45.2016.10.19.01.31.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Oct 2016 01:31:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46330 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwmHX-0008Pb-OH
	for alex.bennee@linaro.org; Wed, 19 Oct 2016 04:31:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bwmHE-00089i-1p
	for qemu-arm@nongnu.org; Wed, 19 Oct 2016 04:31:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bwmH9-0001Rd-Af
	for qemu-arm@nongnu.org; Wed, 19 Oct 2016 04:31:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55246)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1bwmH9-0001Qa-2H; Wed, 19 Oct 2016 04:31:03 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7E3E41173A;
	Wed, 19 Oct 2016 08:31:01 +0000 (UTC)
Received: from [10.36.112.25] (ovpn-112-25.ams2.redhat.com [10.36.112.25])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9J8UrSD000347; Wed, 19 Oct 2016 04:30:53 -0400
To: Andrew Jones <drjones@redhat.com>
References: <1476818573-5228-1-git-send-email-lvivier@redhat.com>
	<1476818573-5228-3-git-send-email-lvivier@redhat.com>
	<20161019081323.b4tle74njsh3locg@hawk.localdomain>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <7fd3c507-9a24-956e-d794-f15a87473f49@redhat.com>
Date: Wed, 19 Oct 2016 10:30:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20161019081323.b4tle74njsh3locg@hawk.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 19 Oct 2016 08:31:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 2/3] exec: move
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
X-TUID: a4qzVkx0bIbf



On 19/10/2016 10:13, Andrew Jones wrote:
> On Tue, Oct 18, 2016 at 09:22:52PM +0200, Laurent Vivier wrote:
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
>> in cpu_exec_realizefn(). To avoid to overwrite an user defined
>> value, we set it to an invalid value by default, and update
>> it in realize function only if the value is still invalid.
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>> ---
> [...]
>> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
>> index 1b9540e..f0d2074 100644
>> --- a/target-arm/cpu.c
>> +++ b/target-arm/cpu.c
>> @@ -33,6 +33,8 @@
>>  #include "sysemu/kvm.h"
>>  #include "kvm_arm.h"
>>  
>> +#define MP_AFFINITY_INVALID (~ARM64_AFFINITY_MASK)
> 
> I would have defined this next to ARM64_AFFINITY_MASK in
> target-arm/cpu-qom.h

It was my first idea, but all macros in cpu-qom.h start by ARM_ or
ARM64_, this one looks like a local macro (the name is too generic), so
I put it in cpu.c.

>> +
>>  static void arm_cpu_set_pc(CPUState *cs, vaddr value)
>>  {
>>      ARMCPU *cpu = ARM_CPU(cs);
>> @@ -441,22 +443,11 @@ static void arm_cpu_initfn(Object *obj)
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
>> @@ -576,6 +567,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
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
>> @@ -631,6 +630,17 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>>          set_feature(env, ARM_FEATURE_THUMB_DSP);
>>      }
>>  
>> +    /* This cpu-id-to-MPIDR affinity is used only for TCG; KVM will override it.
>> +     * We don't support setting cluster ID ([16..23]) (known as Aff2
>> +     * in later ARM ARM versions), or any of the higher affinity level fields,
>> +     * so these bits always RAZ.
>> +     */
>> +    if (cpu->mp_affinity == MP_AFFINITY_INVALID) {
>> +        Aff1 = cs->cpu_index / ARM_CPUS_PER_CLUSTER;
>> +        Aff0 = cs->cpu_index % ARM_CPUS_PER_CLUSTER;
> 
> I think ARM_CPUS_PER_CLUSTER should be renamed to
> ARM_DEFAULT_CPUS_PER_CLUSTER and either moved from where
> it's currently defined (above arm_cpu_initfn) to just above
> arm_cpu_realizefn, or to the same place as ARM64_AFFINITY_MASK
> and MP_AFFINITY_INVALID.
> 
> Aff0 and Aff1 could be declared in this scope, as they're only
> used here.

The goal was to have as less diff as possible with my previous patch, so
I didn't move the declaration. This will not change the generated code.
> 
>> +        cpu->mp_affinity = (Aff1 << ARM_AFF1_SHIFT) | Aff0;
>> +    }
>> +
>>      if (cpu->reset_hivecs) {
>>              cpu->reset_sctlr |= (1 << 13);
>>      }
>> @@ -1461,7 +1471,7 @@ static Property arm_cpu_properties[] = {
>>      DEFINE_PROP_BOOL("start-powered-off", ARMCPU, start_powered_off, false),
>>      DEFINE_PROP_UINT32("psci-conduit", ARMCPU, psci_conduit, 0),
>>      DEFINE_PROP_UINT32("midr", ARMCPU, midr, 0),
>> -    DEFINE_PROP_UINT64("mp-affinity", ARMCPU, mp_affinity, 0),
>> +    DEFINE_PROP_UINT64("mp-affinity", ARMCPU, mp_affinity, MP_AFFINITY_INVALID),
>>      DEFINE_PROP_END_OF_LIST()
>>  };
>>  
>> @@ -1533,17 +1543,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
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
> [...]
> 
> Otherwise looks good to me.

Thanks,
Laurent
