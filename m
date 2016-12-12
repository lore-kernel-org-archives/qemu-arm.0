Received: by 10.25.205.13 with SMTP id d13csp1572542lfg;
        Mon, 12 Dec 2016 03:09:58 -0800 (PST)
X-Received: by 10.200.52.4 with SMTP id u4mr87536179qtb.186.1481540998149;
        Mon, 12 Dec 2016 03:09:58 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id d54si26049194qta.294.2016.12.12.03.09.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Dec 2016 03:09:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38458 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGOUX-0008PO-Jk
	for alex.bennee@linaro.org; Mon, 12 Dec 2016 06:09:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59349)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cGORw-0007hi-GW
	for qemu-arm@nongnu.org; Mon, 12 Dec 2016 06:07:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cGORr-0002pf-N8
	for qemu-arm@nongnu.org; Mon, 12 Dec 2016 06:07:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41128)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1cGORr-0002p4-F8; Mon, 12 Dec 2016 06:07:11 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8EC0CC037F76;
	Mon, 12 Dec 2016 11:07:10 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBCB77a8020760
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 12 Dec 2016 06:07:09 -0500
Date: Mon, 12 Dec 2016 12:07:06 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161212110706.aec6ivktofuhxim7@kamzik.brq.redhat.com>
References: <1481301020-21777-1-git-send-email-peter.maydell@linaro.org>
	<1481301020-21777-5-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481301020-21777-5-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 12 Dec 2016 11:07:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 4/4] hw/arm/virt: Don't incorrectly claim
 architectural timer to be edge-triggered
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jT9bJxkGavAz

On Fri, Dec 09, 2016 at 04:30:20PM +0000, Peter Maydell wrote:
> The architectural timers in ARM CPUs all have level triggered interrupts
> (unless you're using KVM on a host kernel before 4.4, which misimplemented
> them as edge-triggered).
> 
> We were incorrectly describing them in the device tree as edge triggered.
> This can cause problems for guest kernels in 4.8 before rc6:
>  * pre-4.8 kernels ignore the values in the DT
>  * 4.8 before rc6 write the DT values to the GIC config registers
>  * newer than rc6 ignore the DT and insist that the timer interrupts
>    are level triggered regardless
> 
> Fix the DT so we're describing reality. For backwards-compatibility
> purposes, only do this for the virt-2.9 machine onward.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/virt.c | 34 ++++++++++++++++++++++++++++++----
>  1 file changed, 30 insertions(+), 4 deletions(-)

Reviewed-by: Andrew Jones <drjones@redhat.com>

I'll submit the ACPI counterpart, which would require we add
claim_edge_triggered_timers to VirtGuestInfo, but I have plans
for VirtGuestInfo - killing it, just like x86 killed PcGuestInfo.
So the need for this timer patch just bumped the kill VirtGuestInfo
patch up in the priority queue. I'll start working on it today.

Thanks,
drew

> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 54498ea..2ca9527 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -71,6 +71,7 @@ typedef struct {
>      bool disallow_affinity_adjustment;
>      bool no_its;
>      bool no_pmu;
> +    bool claim_edge_triggered_timers;
>  } VirtMachineClass;
>  
>  typedef struct {
> @@ -309,12 +310,31 @@ static void fdt_add_psci_node(const VirtMachineState *vms)
>  
>  static void fdt_add_timer_nodes(const VirtMachineState *vms, int gictype)
>  {
> -    /* Note that on A15 h/w these interrupts are level-triggered,
> -     * but for the GIC implementation provided by both QEMU and KVM
> -     * they are edge-triggered.
> +    /* On real hardware these interrupts are level-triggered.
> +     * On KVM they were edge-triggered before host kernel version 4.4,
> +     * and level-triggered afterwards.
> +     * On emulated QEMU they are level-triggered.
> +     *
> +     * Getting the DTB info about them wrong is awkward for some
> +     * guest kernels:
> +     *  pre-4.8 ignore the DT and leave the interrupt configured
> +     *   with whatever the GIC reset value (or the bootloader) left it at
> +     *  4.8 before rc6 honour the incorrect data by programming it back
> +     *   into the GIC, causing problems
> +     *  4.8rc6 and later ignore the DT and always write "level triggered"
> +     *   into the GIC
> +     *
> +     * For backwards-compatibility, virt-2.8 and earlier will continue
> +     * to say these are edge-triggered, but later machines will report
> +     * the correct information.
>       */
>      ARMCPU *armcpu;
> -    uint32_t irqflags = GIC_FDT_IRQ_FLAGS_EDGE_LO_HI;
> +    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
> +    uint32_t irqflags = GIC_FDT_IRQ_FLAGS_LEVEL_HI;
> +
> +    if (vmc->claim_edge_triggered_timers) {
> +        irqflags = GIC_FDT_IRQ_FLAGS_EDGE_LO_HI;
> +    }
>  
>      if (gictype == 2) {
>          irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
> @@ -1556,8 +1576,14 @@ static void virt_2_8_instance_init(Object *obj)
>  
>  static void virt_machine_2_8_options(MachineClass *mc)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> +
>      virt_machine_2_9_options(mc);
>      SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_8);
> +    /* For 2.8 and earlier we falsely claimed in the DT that
> +     * our timers were edge-triggered, not level-triggered.
> +     */
> +    vmc->claim_edge_triggered_timers = true;
>  }
>  DEFINE_VIRT_MACHINE(2, 8)
>  
> -- 
> 2.7.4
> 
