Received: by 10.25.208.194 with SMTP id h185csp789284lfg;
        Mon, 25 Apr 2016 02:06:08 -0700 (PDT)
X-Received: by 10.55.201.70 with SMTP id q67mr16504010qki.121.1461575168293;
        Mon, 25 Apr 2016 02:06:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r6si4446490qhc.6.2016.04.25.02.06.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Apr 2016 02:06:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58600 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aucT1-0007Qb-PM
	for alex.bennee@linaro.org; Mon, 25 Apr 2016 05:06:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aucSz-0007MB-68
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 05:06:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aucSv-0000Ps-8C
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 05:06:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50668)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1aucSv-0000Po-2W; Mon, 25 Apr 2016 05:06:01 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 821D885538;
	Mon, 25 Apr 2016 09:06:00 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-112.brq.redhat.com [10.34.1.112])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3P95uLD009163
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 25 Apr 2016 05:05:59 -0400
Date: Mon, 25 Apr 2016 11:05:56 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20160425090556.3e6hbepkbhyx3jxn@hawk.localdomain>
References: <1461405855-15576-1-git-send-email-zhaoshenglong@huawei.com>
	<1461405855-15576-3-git-send-email-zhaoshenglong@huawei.com>
	<20160424172827.x5pmdjnsgdkivktc@hawk.localdomain>
	<571DBEBD.5060001@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <571DBEBD.5060001@huawei.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/3] hw/arm/virt: Add PMU
 node for virt machine
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
Cc: peter.maydell@linaro.org, peter.huangpeng@huawei.com, qemu-arm@nongnu.org,
	shannon.zhao@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MDzX/sVB6hQq

On Mon, Apr 25, 2016 at 02:52:45PM +0800, Shannon Zhao wrote:
> 
> 
> On 2016/4/25 1:28, Andrew Jones wrote:
> > On Sat, Apr 23, 2016 at 06:04:14PM +0800, Shannon Zhao wrote:
> >> > From: Shannon Zhao <shannon.zhao@linaro.org>
> >> > 
> >> > Add a virtual PMU device for virt machine while use PPI 7 for PMU
> >> > overflow interrupt number.
> >> > 
> >> > Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> >> > ---
> >> >  hw/arm/virt.c         | 31 +++++++++++++++++++++++++++++++
> >> >  include/hw/arm/virt.h |  4 ++++
> >> >  include/sysemu/kvm.h  |  1 +
> >> >  stubs/kvm.c           |  5 +++++
> >> >  target-arm/kvm64.c    | 39 +++++++++++++++++++++++++++++++++++++++
> >> >  5 files changed, 80 insertions(+)
> >> > 
> >> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >> > index 56d35c7..d77b314 100644
> >> > --- a/hw/arm/virt.c
> >> > +++ b/hw/arm/virt.c
> >> > @@ -428,6 +428,35 @@ static void fdt_add_gic_node(VirtBoardInfo *vbi, int type)
> >> >      qemu_fdt_setprop_cell(vbi->fdt, "/intc", "phandle", vbi->gic_phandle);
> >> >  }
> >> >  
> >> > +static void fdt_add_pmu_nodes(const VirtBoardInfo *vbi)
> >> > +{
> >> > +    CPUState *cpu;
> >> > +    ARMCPU *armcpu;
> >> > +    uint32_t irqflags = GIC_FDT_IRQ_FLAGS_LEVEL_HI;
> >> > +
> >> > +    CPU_FOREACH(cpu) {
> >> > +        armcpu = ARM_CPU(cpu);
> >> > +        if (!armcpu->has_pmu) {
> >> > +            return;
> >> > +        }
> >> > +
> >> > +        kvm_arm_pmu_create(cpu, PPI(VIRTUAL_PMU_IRQ));
> >> > +    }
> >> > +
> >> > +    irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
> >> > +                         GIC_FDT_IRQ_PPI_CPU_WIDTH, (1 << vbi->smp_cpus) - 1);
> > The shift will overflow when configuring a machine to have more than
> > 32 cpus. You should confirm smp_cpus is <= GIC_FDT_IRQ_PPI_CPU_WIDTH
> > before generating a mask this way, otherwise you can just pass in 0xff.
> > 
> Ah, right. So it could check the gictype like what we do in
> fdt_add_timer_nodes.

Oh, now that I look closer we definitely need that condition. Otherwise
we're losing the LEVEL_HI flag that irqflags is initialized to for no
reason.

Thanks,
drew
