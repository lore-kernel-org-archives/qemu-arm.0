Received: by 10.80.163.71 with SMTP id 65csp286093edn;
        Thu, 22 Sep 2016 23:43:51 -0700 (PDT)
X-Received: by 10.55.154.195 with SMTP id c186mr6855015qke.36.1474613031036;
        Thu, 22 Sep 2016 23:43:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v32si4190079qtc.76.2016.09.22.23.43.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Sep 2016 23:43:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41336 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bnKD8-0002b8-Gb
	for alex.bennee@linaro.org; Fri, 23 Sep 2016 02:43:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bnKD2-0002XE-OY
	for qemu-arm@nongnu.org; Fri, 23 Sep 2016 02:43:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bnKCx-0002W9-OP
	for qemu-arm@nongnu.org; Fri, 23 Sep 2016 02:43:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53626)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bnKCx-0002W1-Eb; Fri, 23 Sep 2016 02:43:39 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B268288E60;
	Fri, 23 Sep 2016 06:43:38 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-80.brq.redhat.com [10.40.204.80])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8N6hYk5002710
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 23 Sep 2016 02:43:36 -0400
Date: Fri, 23 Sep 2016 08:43:33 +0200
From: Andrew Jones <drjones@redhat.com>
To: Wei Huang <wei@redhat.com>
Message-ID: <20160923064333.ltpc3wcvz7of4mtk@hawk.localdomain>
References: <1474557203-4977-1-git-send-email-wei@redhat.com>
	<1474557203-4977-3-git-send-email-wei@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1474557203-4977-3-git-send-email-wei@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 23 Sep 2016 06:43:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V5 2/2] arm: virt: add PMU
 property to mach-virt machine type
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
Cc: peter.maydell@linaro.org, shannon.zhao@linaro.org, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, abologna@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H62MjZONLuCs

On Thu, Sep 22, 2016 at 11:13:23AM -0400, Wei Huang wrote:
> CPU vPMU is now turned off by default, but it was ON in virt-2.7
> machine type. To solve this problem, this patch adds a PMU option
> in machine state, which is used to control CPU's vPMU status. This
> PMU option is not exposed to command line and is turned on in
> virt-2.7 machine type to make sure it is backward compatible.
> 
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  hw/arm/virt.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a781ad0..a211b22 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -84,6 +84,7 @@ typedef struct {
>      MachineClass parent;
>      VirtBoardInfo *daughterboard;
>      bool disallow_affinity_adjustment;
> +    bool pmu_default_on;
>  } VirtMachineClass;
>  
>  typedef struct {
> @@ -1287,6 +1288,8 @@ static void machvirt_init(MachineState *machine)
>  
>      for (n = 0; n < smp_cpus; n++) {
>          Object *cpuobj = object_new(typename);
> +        ARMCPU *cpu = ARM_CPU(cpuobj);
> +
>          if (!vmc->disallow_affinity_adjustment) {
>              /* Adjust MPIDR like 64-bit KVM hosts, which incorporate the
>               * GIC's target-list limitations. 32-bit KVM hosts currently
> @@ -1317,6 +1320,12 @@ static void machvirt_init(MachineState *machine)
>              }
>          }
>  
> +        if (cpu->has_pmu == ON_OFF_AUTO_AUTO &&
> +            object_property_find(cpuobj, "pmu", NULL)) {
> +            cpu->has_pmu = vmc->pmu_default_on && kvm_enabled() ?
> +                ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
> +        }
> +
>          if (object_property_find(cpuobj, "reset-cbar", NULL)) {
>              object_property_set_int(cpuobj, vbi->memmap[VIRT_CPUPERIPHS].base,
>                                      "reset-cbar", &error_abort);
> @@ -1514,6 +1523,9 @@ static void virt_2_7_instance_init(Object *obj)
>  
>  static void virt_machine_2_7_options(MachineClass *mc)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> +
> +    vmc->pmu_default_on = true;
>  }
>  DEFINE_VIRT_MACHINE_AS_LATEST(2, 7)
>  
> @@ -1532,5 +1544,9 @@ static void virt_machine_2_6_options(MachineClass *mc)
>      virt_machine_2_7_options(mc);
>      SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_6);
>      vmc->disallow_affinity_adjustment = true;
> +    /* Disable PMU for 2.6 and down as PMU support was first introduced
> +     * and enabled in 2.7.
> +     */
> +    vmc->pmu_default_on = false;
>  }
>  DEFINE_VIRT_MACHINE(2, 6)
> -- 
> 1.8.3.1
> 
>

Reviewed-by: Andrew Jones <drjones@redhat.com>

I'll send the 2.8 machine type patch.
