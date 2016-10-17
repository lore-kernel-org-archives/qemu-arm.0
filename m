Received: by 10.80.166.35 with SMTP id d32csp412609edc;
        Mon, 17 Oct 2016 04:32:52 -0700 (PDT)
X-Received: by 10.200.45.9 with SMTP id n9mr22814884qta.52.1476703971964;
        Mon, 17 Oct 2016 04:32:51 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q4si17652258qkq.193.2016.10.17.04.32.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Oct 2016 04:32:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60599 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bw69y-0001ma-Vy
	for alex.bennee@linaro.org; Mon, 17 Oct 2016 07:32:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44089)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bw68R-0000wb-49
	for qemu-devel@nongnu.org; Mon, 17 Oct 2016 07:31:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bw68N-00078O-0T
	for qemu-devel@nongnu.org; Mon, 17 Oct 2016 07:31:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44852)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1bw68H-000771-VK; Mon, 17 Oct 2016 07:31:06 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D10F53F1E1;
	Mon, 17 Oct 2016 11:31:04 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9HBUwu9016876; Mon, 17 Oct 2016 07:30:58 -0400
Date: Mon, 17 Oct 2016 13:30:56 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20161017133056.739fa6fd@nial.brq.redhat.com>
In-Reply-To: <1476485569-6744-4-git-send-email-lvivier@redhat.com>
References: <1476485569-6744-1-git-send-email-lvivier@redhat.com>
	<1476485569-6744-4-git-send-email-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 17 Oct 2016 11:31:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 3/3] exec: call cpu_exec_exit() from a
 CPU unrealize common function
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
	Alexander Graf <agraf@suse.de>, Max Filippov <jcmvbkbc@gmail.com>,
	Greg Ungerer <gerg@uclinux.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Chen Gang <gang.chen.5i5j@gmail.com>, Jia Liu <proljc@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Bharata B Rao <bharata@linux.vnet.ibm.com>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Matthew Rosato <mjrosato@linux.vnet.ibm.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vinQ7/RTxosx

On Sat, 15 Oct 2016 00:52:49 +0200
Laurent Vivier <lvivier@redhat.com> wrote:

> As cpu_exec_exit() mirrors the cpu_exec_realizefn(),
> rename it as cpu_exec_unrealizefn().
> 
> Create and register a cpu_common_unrealizefn() function for
> the CPU device class and call cpu_exec_unrealizefn() from
> this function.
> 
> Remove cpu_exec_exit() from cpu_common_finalize()
> (which mirrors init, not realize), and as x86_cpu_unrealizefn()
> overwrites the device class unrealize function, add a call to
> cpu_exec_unrealizefn() (as in ppc_cpu_unrealizefn()).
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  exec.c                      | 2 +-
>  include/qom/cpu.h           | 2 +-
>  qom/cpu.c                   | 8 +++++++-
>  target-i386/cpu.c           | 2 ++
>  target-ppc/translate_init.c | 2 +-
>  5 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/exec.c b/exec.c
> index 203eb52..3cd25db 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -596,7 +596,7 @@ AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx)
>  }
>  #endif
>  
> -void cpu_exec_exit(CPUState *cpu)
> +void cpu_exec_unrealizefn(CPUState *cpu)
>  {
>      CPUClass *cc = CPU_GET_CLASS(cpu);
>  
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index 5520c6c..633c3fc 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -948,7 +948,7 @@ void QEMU_NORETURN cpu_abort(CPUState *cpu, const char *fmt, ...)
>      GCC_FMT_ATTR(2, 3);
>  void cpu_exec_initfn(CPUState *cpu);
>  void cpu_exec_realizefn(CPUState *cpu, Error **errp);
> -void cpu_exec_exit(CPUState *cpu);
> +void cpu_exec_unrealizefn(CPUState *cpu);
>  
>  #ifdef CONFIG_SOFTMMU
>  extern const struct VMStateDescription vmstate_cpu_common;
> diff --git a/qom/cpu.c b/qom/cpu.c
> index 85f1132..03d9190 100644
> --- a/qom/cpu.c
> +++ b/qom/cpu.c
> @@ -345,6 +345,12 @@ static void cpu_common_realizefn(DeviceState *dev, Error **errp)
>      trace_init_vcpu(cpu);
>  }
>  
> +static void cpu_common_unrealizefn(DeviceState *dev, Error **errp)
> +{
> +    CPUState *cpu = CPU(dev);
> +    cpu_exec_unrealizefn(cpu);
> +}
> +
>  static void cpu_common_initfn(Object *obj)
>  {
>      CPUState *cpu = CPU(obj);
> @@ -369,7 +375,6 @@ static void cpu_common_initfn(Object *obj)
>  static void cpu_common_finalize(Object *obj)
>  {
>      CPUState *cpu = CPU(obj);
> -    cpu_exec_exit(cpu);
>      g_free(cpu->trace_dstate);
>  }
>  
> @@ -403,6 +408,7 @@ static void cpu_class_init(ObjectClass *klass, void *data)
>      k->cpu_exec_exit = cpu_common_noop;
>      k->cpu_exec_interrupt = cpu_common_exec_interrupt;
>      dc->realize = cpu_common_realizefn;
> +    dc->unrealize = cpu_common_unrealizefn;
>      /*
>       * Reason: CPUs still need special care by board code: wiring up
>       * IRQs, adding reset handlers, halting non-first CPUs, ...
> diff --git a/target-i386/cpu.c b/target-i386/cpu.c
> index 3476d46..399a3e4 100644
> --- a/target-i386/cpu.c
> +++ b/target-i386/cpu.c
> @@ -3253,6 +3253,8 @@ static void x86_cpu_unrealizefn(DeviceState *dev, Error **errp)
>          object_unparent(OBJECT(cpu->apic_state));
>          cpu->apic_state = NULL;
>      }
> +
> +    cpu_exec_unrealizefn(CPU(dev));
perhaps it should mirror the same pattern as realize override

i.e.
child class is it has it's own unrealize()
should have parent_unrealize field where it save original
unrealize pointer before override.

grep for parent_realize to see used pattern.

>  }
>  
>  typedef struct BitProperty {
> diff --git a/target-ppc/translate_init.c b/target-ppc/translate_init.c
> index 40dae70..2de6a06 100644
> --- a/target-ppc/translate_init.c
> +++ b/target-ppc/translate_init.c
> @@ -9910,7 +9910,7 @@ static void ppc_cpu_unrealizefn(DeviceState *dev, Error **errp)
>      opc_handler_t **table, **table_2;
>      int i, j, k;
>  
> -    cpu_exec_exit(CPU(dev));
> +    cpu_exec_unrealizefn(CPU(dev));
>  
>      for (i = 0; i < PPC_CPU_OPCODES_LEN; i++) {
>          if (env->opcodes[i] == &invalid_handler) {

