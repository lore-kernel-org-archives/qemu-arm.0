Received: by 10.80.166.35 with SMTP id d32csp1170930edc;
        Tue, 18 Oct 2016 12:56:26 -0700 (PDT)
X-Received: by 10.129.45.194 with SMTP id t185mr2257563ywt.49.1476820586213;
        Tue, 18 Oct 2016 12:56:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h5si10240446yba.31.2016.10.18.12.56.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Oct 2016 12:56:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43588 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwaUr-0008JL-Ex
	for alex.bennee@linaro.org; Tue, 18 Oct 2016 15:56:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bwaUl-0008IN-42
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 15:56:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bwaUi-0004yY-0p
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 15:56:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44692)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1bwaUh-0004xk-PO; Tue, 18 Oct 2016 15:56:15 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 97F8F4E4D9;
	Tue, 18 Oct 2016 19:56:14 +0000 (UTC)
Received: from localhost (ovpn-116-197.phx2.redhat.com [10.3.116.197])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9IJu7B3028619; Tue, 18 Oct 2016 15:56:08 -0400
Date: Tue, 18 Oct 2016 17:56:07 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20161018195606.GA5057@thinpad.lan.raisama.net>
References: <1476818573-5228-1-git-send-email-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1476818573-5228-1-git-send-email-lvivier@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.0 (2016-08-17)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 18 Oct 2016 19:56:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v4 0/3] Split cpu_exec_init() into an init
 and a realize part
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
	Artyom Tarasenko <atar4qemu@gmail.com>, Andrew Jones <drjones@redhat.com>,
	Chen Gang <gang.chen.5i5j@gmail.com>, Greg Kurz <groug@kaod.org>,
	qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Matthew Rosato <mjrosato@linux.vnet.ibm.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yLl/EbO5687g

On Tue, Oct 18, 2016 at 09:22:50PM +0200, Laurent Vivier wrote:
> Since commit 42ecaba ("target-i386: Call cpu_exec_init() on realize"),
> , commit 6dd0f83 ("target-ppc: Move cpu_exec_init() call to realize function"),
> and commit c6644fc ("s390x/cpu: Get rid of side effects when creating a vcpu"),
> cpu_exec_init() has been moved to realize function for some architectures
> to implement CPU htoplug. This allows any failures from cpu_exec_init() to be
> handled appropriately.
> 
> This series tries to do the same work for all the other CPUs.
> 
> But as the ARM Virtual Machine ("virt") needs the "memory" property of the CPU
> in the machine init function (the "memory" property is created in
> cpu_exec_init() we want to move to the realize part), split cpu_exec_init() in
> two parts: a realize part (cpu_exec_realizefn(), adding the CPU in the
> environment) and an init part (cpu_exec_initfn(), initializing the CPU, like
> adding the "memory" property). To mirror the realize part, add an unrealize
> part, and remove the cpu_exec_exit() call from the finalize part.
> 
> This also allows to remove all the "cannot_destroy_with_object_finalize_yet"
> properties from the CPU device class.
> 
> v4:
> - arm: update mp_affinity in realize only if it s not set by the user
> - i386 and ppc: add an parent_unrealize to call the Device unrealize
>   because it is overwritten by the CPU unrealize
> - update commit messages

Series:

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

But I will wait for Drew or other ARM people to review the ARM
hunks on patch 2/3 before applying.

v3 -> v4 diff, for reference:

  diff --git a/target-arm/cpu.c b/target-arm/cpu.c
  index 364a45d..f0d2074 100644
  --- a/target-arm/cpu.c
  +++ b/target-arm/cpu.c
  @@ -33,6 +33,8 @@
   #include "sysemu/kvm.h"
   #include "kvm_arm.h"
   
  +#define MP_AFFINITY_INVALID (~ARM64_AFFINITY_MASK)
  +
   static void arm_cpu_set_pc(CPUState *cs, vaddr value)
   {
       ARMCPU *cpu = ARM_CPU(cs);
  @@ -633,9 +635,11 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
        * in later ARM ARM versions), or any of the higher affinity level fields,
        * so these bits always RAZ.
        */
  -    Aff1 = cs->cpu_index / ARM_CPUS_PER_CLUSTER;
  -    Aff0 = cs->cpu_index % ARM_CPUS_PER_CLUSTER;
  -    cpu->mp_affinity = (Aff1 << ARM_AFF1_SHIFT) | Aff0;
  +    if (cpu->mp_affinity == MP_AFFINITY_INVALID) {
  +        Aff1 = cs->cpu_index / ARM_CPUS_PER_CLUSTER;
  +        Aff0 = cs->cpu_index % ARM_CPUS_PER_CLUSTER;
  +        cpu->mp_affinity = (Aff1 << ARM_AFF1_SHIFT) | Aff0;
  +    }
   
       if (cpu->reset_hivecs) {
               cpu->reset_sctlr |= (1 << 13);
  @@ -1467,7 +1471,7 @@ static Property arm_cpu_properties[] = {
       DEFINE_PROP_BOOL("start-powered-off", ARMCPU, start_powered_off, false),
       DEFINE_PROP_UINT32("psci-conduit", ARMCPU, psci_conduit, 0),
       DEFINE_PROP_UINT32("midr", ARMCPU, midr, 0),
  -    DEFINE_PROP_UINT64("mp-affinity", ARMCPU, mp_affinity, 0),
  +    DEFINE_PROP_UINT64("mp-affinity", ARMCPU, mp_affinity, MP_AFFINITY_INVALID),
       DEFINE_PROP_END_OF_LIST()
   };
   
  diff --git a/target-i386/cpu-qom.h b/target-i386/cpu-qom.h
  index 5dde658..07030d2 100644
  --- a/target-i386/cpu-qom.h
  +++ b/target-i386/cpu-qom.h
  @@ -64,6 +64,7 @@ typedef struct X86CPUClass {
       bool kvm_required;
   
       DeviceRealize parent_realize;
  +    DeviceUnrealize parent_unrealize;
       void (*parent_reset)(CPUState *cpu);
   } X86CPUClass;
   
  diff --git a/target-i386/cpu.c b/target-i386/cpu.c
  index 399a3e4..95ce067 100644
  --- a/target-i386/cpu.c
  +++ b/target-i386/cpu.c
  @@ -3243,6 +3243,8 @@ out:
   static void x86_cpu_unrealizefn(DeviceState *dev, Error **errp)
   {
       X86CPU *cpu = X86_CPU(dev);
  +    X86CPUClass *xcc = X86_CPU_GET_CLASS(dev);
  +    Error *local_err = NULL;
   
   #ifndef CONFIG_USER_ONLY
       cpu_remove_sync(CPU(dev));
  @@ -3254,7 +3256,11 @@ static void x86_cpu_unrealizefn(DeviceState *dev, Error **errp)
           cpu->apic_state = NULL;
       }
   
  -    cpu_exec_unrealizefn(CPU(dev));
  +    xcc->parent_unrealize(dev, &local_err);
  +    if (local_err != NULL) {
  +        error_propagate(errp, local_err);
  +        return;
  +    }
   }
   
   typedef struct BitProperty {
  @@ -3504,6 +3510,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
       DeviceClass *dc = DEVICE_CLASS(oc);
   
       xcc->parent_realize = dc->realize;
  +    xcc->parent_unrealize = dc->unrealize;
       dc->realize = x86_cpu_realizefn;
       dc->unrealize = x86_cpu_unrealizefn;
       dc->props = x86_cpu_properties;
  diff --git a/target-ppc/cpu-qom.h b/target-ppc/cpu-qom.h
  index 713deef..d46c31a 100644
  --- a/target-ppc/cpu-qom.h
  +++ b/target-ppc/cpu-qom.h
  @@ -174,6 +174,7 @@ typedef struct PowerPCCPUClass {
       /*< public >*/
   
       DeviceRealize parent_realize;
  +    DeviceUnrealize parent_unrealize;
       void (*parent_reset)(CPUState *cpu);
   
       uint32_t pvr;
  diff --git a/target-ppc/translate_init.c b/target-ppc/translate_init.c
  index 2de6a06..208fa1e 100644
  --- a/target-ppc/translate_init.c
  +++ b/target-ppc/translate_init.c
  @@ -9906,11 +9906,17 @@ static void ppc_cpu_realizefn(DeviceState *dev, Error **errp)
   static void ppc_cpu_unrealizefn(DeviceState *dev, Error **errp)
   {
       PowerPCCPU *cpu = POWERPC_CPU(dev);
  +    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
       CPUPPCState *env = &cpu->env;
  +    Error *local_err = NULL;
       opc_handler_t **table, **table_2;
       int i, j, k;
   
  -    cpu_exec_unrealizefn(CPU(dev));
  +    pcc->parent_unrealize(dev, &local_err);
  +    if (local_err != NULL) {
  +        error_propagate(errp, local_err);
  +        return;
  +    }
   
       for (i = 0; i < PPC_CPU_OPCODES_LEN; i++) {
           if (env->opcodes[i] == &invalid_handler) {
  @@ -10521,6 +10527,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
       DeviceClass *dc = DEVICE_CLASS(oc);
   
       pcc->parent_realize = dc->realize;
  +    pcc->parent_unrealize = dc->unrealize;
       pcc->pvr_match = ppc_pvr_match_default;
       pcc->interrupts_big_endian = ppc_cpu_interrupts_big_endian_always;
       dc->realize = ppc_cpu_realizefn;

> 
> v3:
> - reorganize the series in 3 patches:
>   1- split cpu_exec_init() and call the init part from
>      cpu_common_initfn()
>   2- move all the cpu_exec_realize() calls to the
>      XXX_cpu_realizefn() functions
>   3- create a cpu_common_unrealizefn() function
>       and call the cpu_exec_unrealize() function from here,
>       except for ppc64 and i386 that have their own XX_cpu_unrealizefn()
>       functions
> - rename cpu_exec_init(), cpu_exec_realize(), cpu_exec_unrealize()
>   to cpu_exec_initfn(), cpu_exec_realizefn() and cpu_exec_unrealizefn(),
> - move cpu_exec_unrealizefn() to the device class unrealize
>   and declare it in qom/cpu.h instead of exec/exec-all.h
> 
> v2:
> - rename cpu_exec_exit() as cpu_exec_unrealize(),
>   as it un-does what cpu_exec_realize() does,
> - remove cpu_exec_exit() from ppc_cpu_unrealizefn() as
>   it is called from cpu_common_finalize(),
> - add a patch to move all cpu_exec_init() from
>   all XX_cpu_initfn() to cpu_common_initfn(),
> - arm: move setting of cpu->mp_affinity to
>   arm_cpu_realizefn() as the cpu_index is now set in
>   cpu_exec_realizefn().
> - update some commit messages
> 
> Laurent Vivier (3):
>   exec: split cpu_exec_init()
>   exec: move cpu_exec_init() calls to realize functions
>   exec: call cpu_exec_exit() from a CPU unrealize common function
> 
>  exec.c                      | 12 +++++++-----
>  include/exec/exec-all.h     |  1 -
>  include/qom/cpu.h           |  4 +++-
>  qom/cpu.c                   | 10 +++++++++-
>  target-alpha/cpu.c          | 15 +++++++--------
>  target-arm/cpu.c            | 45 ++++++++++++++++++++++-----------------------
>  target-cris/cpu.c           | 15 +++++++--------
>  target-i386/cpu-qom.h       |  1 +
>  target-i386/cpu.c           | 20 ++++++++++++++------
>  target-lm32/cpu.c           | 15 +++++++--------
>  target-m68k/cpu.c           | 15 +++++++--------
>  target-microblaze/cpu.c     | 14 +++++++-------
>  target-mips/cpu.c           | 15 +++++++--------
>  target-moxie/cpu.c          | 15 +++++++--------
>  target-openrisc/cpu.c       | 15 +++++++--------
>  target-ppc/cpu-qom.h        |  1 +
>  target-ppc/translate_init.c | 11 +++++++++--
>  target-s390x/cpu.c          |  8 +-------
>  target-sh4/cpu.c            | 15 +++++++--------
>  target-sparc/cpu.c          | 18 +++++++++---------
>  target-tilegx/cpu.c         | 15 +++++++--------
>  target-tricore/cpu.c        | 15 +++++++--------
>  target-unicore32/cpu.c      | 18 +++++++++---------
>  target-xtensa/cpu.c         | 15 +++++++--------
>  24 files changed, 169 insertions(+), 159 deletions(-)
> 
> -- 
> 2.7.4
> 

-- 
Eduardo
