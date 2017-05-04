Received: by 10.25.0.198 with SMTP id 189csp555935lfa;
        Thu, 4 May 2017 05:43:44 -0700 (PDT)
X-Received: by 10.31.11.213 with SMTP id 204mr19152896vkl.58.1493901824768;
        Thu, 04 May 2017 05:43:44 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g57si938042uaa.176.2017.05.04.05.43.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 May 2017 05:43:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41780 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d6G6i-0002bb-82
	for alex.bennee@linaro.org; Thu, 04 May 2017 08:43:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34542)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1d6G6a-0002aN-1f
	for qemu-arm@nongnu.org; Thu, 04 May 2017 08:43:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1d6G6W-0001bN-V0
	for qemu-arm@nongnu.org; Thu, 04 May 2017 08:43:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41606)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1d6G6W-0001b8-OV; Thu, 04 May 2017 08:43:32 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 917D280E7A;
	Thu,  4 May 2017 12:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 917D280E7A
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 917D280E7A
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CD301715B;
	Thu,  4 May 2017 12:43:29 +0000 (UTC)
Date: Thu, 4 May 2017 14:43:27 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170504124327.kn5jpivkomijohwi@kamzik.brq.redhat.com>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-21-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1493816238-33120-21-git-send-email-imammedo@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 04 May 2017 12:43:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 20/24] machine: call machine init from
 wrapper
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
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dTfpEzHozXa+

On Wed, May 03, 2017 at 02:57:14PM +0200, Igor Mammedov wrote:
> add machine_run_board_init() wrapper that calls machine
> init for now but in follow up patches it will be used
> to run generic machine code that should run before
> machine init.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  include/hw/boards.h | 1 +
>  hw/core/machine.c   | 6 ++++++
>  vl.c                | 2 +-
>  3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 1f518a1..0e74484 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -32,6 +32,7 @@ void memory_region_allocate_system_memory(MemoryRegion *mr, Object *owner,
>  MachineClass *find_default_machine(void);
>  extern MachineState *current_machine;
>  
> +void machine_run_board_init(MachineState *machine);
>  bool machine_usb(MachineState *machine);
>  bool machine_kernel_irqchip_allowed(MachineState *machine);
>  bool machine_kernel_irqchip_required(MachineState *machine);
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index a63f17b..217b4f4 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -648,6 +648,12 @@ bool machine_mem_merge(MachineState *machine)
>      return machine->mem_merge;
>  }
>  
> +void machine_run_board_init(MachineState *machine)
> +{
> +    MachineClass *machine_class = MACHINE_GET_CLASS(machine);
> +    machine_class->init(machine);
> +}
> +
>  static void machine_class_finalize(ObjectClass *klass, void *data)
>  {
>      MachineClass *mc = MACHINE_CLASS(klass);
> diff --git a/vl.c b/vl.c
> index fe4741d..ac46d6e 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -4562,7 +4562,7 @@ int main(int argc, char **argv, char **envp)
>      current_machine->boot_order = boot_order;
>      current_machine->cpu_model = cpu_model;
>  
> -    machine_class->init(current_machine);
> +    machine_run_board_init(current_machine);
>  
>      realtime_init();
>  
> -- 
> 2.7.4
>

Reviewed-by: Andrew Jones <drjones@redhat.com> 
