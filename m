Received: by 10.25.208.194 with SMTP id h185csp859078lfg;
        Mon, 25 Apr 2016 04:37:42 -0700 (PDT)
X-Received: by 10.55.40.164 with SMTP id o36mr17215321qko.125.1461584262404;
        Mon, 25 Apr 2016 04:37:42 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w203si10465844qha.56.2016.04.25.04.37.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Apr 2016 04:37:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59479 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1auepg-0000gO-JG
	for alex.bennee@linaro.org; Mon, 25 Apr 2016 07:37:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40009)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1auepd-0000by-LK
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 07:37:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1auepY-0003U4-Rm
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 07:37:37 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:20187)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1auepY-0003TX-2y; Mon, 25 Apr 2016 07:37:32 -0400
Received: from 172.24.1.60 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.1.60])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CAN03462; Mon, 25 Apr 2016 19:37:25 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml431-hub.china.huawei.com
	(10.82.67.208) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 25 Apr 2016 19:37:14 +0800
Message-ID: <571E0169.5030705@huawei.com>
Date: Mon, 25 Apr 2016 19:37:13 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Andrew Jones <drjones@redhat.com>
References: <1461568306-14624-1-git-send-email-zhaoshenglong@huawei.com>
	<1461568306-14624-3-git-send-email-zhaoshenglong@huawei.com>
	<20160425092239.qhmyqjlrvms3auim@hawk.localdomain>
In-Reply-To: <20160425092239.qhmyqjlrvms3auim@hawk.localdomain>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.571E0177.0054, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: b93fb2e615f2dd7fbcfc220ed3709806
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 2/3] hw/arm/virt: Add PMU
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
X-TUID: PO02iVnjVgJK



On 2016/4/25 17:22, Andrew Jones wrote:
> On Mon, Apr 25, 2016 at 03:11:45PM +0800, Shannon Zhao wrote:
>> > From: Shannon Zhao <shannon.zhao@linaro.org>
>> > 
>> > Add a virtual PMU device for virt machine while use PPI 7 for PMU
>> > overflow interrupt number.
>> > 
>> > Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> > ---
>> >  hw/arm/virt.c         | 34 ++++++++++++++++++++++++++++++++++
>> >  include/hw/arm/virt.h |  4 ++++
>> >  include/sysemu/kvm.h  |  1 +
>> >  stubs/kvm.c           |  5 +++++
>> >  target-arm/kvm64.c    | 39 +++++++++++++++++++++++++++++++++++++++
>> >  5 files changed, 83 insertions(+)
>> > 
>> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> > index 56d35c7..c3632d8 100644
>> > --- a/hw/arm/virt.c
>> > +++ b/hw/arm/virt.c
>> > @@ -428,6 +428,38 @@ static void fdt_add_gic_node(VirtBoardInfo *vbi, int type)
>> >      qemu_fdt_setprop_cell(vbi->fdt, "/intc", "phandle", vbi->gic_phandle);
>> >  }
>> >  
>> > +static void fdt_add_pmu_nodes(const VirtBoardInfo *vbi, int gictype)
>> > +{
>> > +    CPUState *cpu;
>> > +    ARMCPU *armcpu;
>> > +    uint32_t irqflags = GIC_FDT_IRQ_FLAGS_LEVEL_HI;
>> > +
>> > +    CPU_FOREACH(cpu) {
>> > +        armcpu = ARM_CPU(cpu);
>> > +        if (!armcpu->has_pmu) {
>> > +            return;
>> > +        }
>> > +
>> > +        kvm_arm_pmu_create(cpu, PPI(VIRTUAL_PMU_IRQ));
> I think we need to return a failure code from kvm_arm_pmu_create, and
> then do
> 
>            if (!kvm_arm_pmu_create(...)) {
>                return;
>            }
> 
> Otherwise we create a /pmu node for the guest that won't work.
> 
Ok, will update.

>> > +    }
>> > +
>> > +    if (gictype == 2) {
>> > +        irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
>> > +                             GIC_FDT_IRQ_PPI_CPU_WIDTH,
>> > +                             (1 << vbi->smp_cpus) - 1);
> So, if we're using gicv3, then we're level triggered and these cpu
> mask bits aren't defined by the arm,gic-v3.txt bindings spec. Good.
> 
> If we're using gicv2, then we're edge triggered and this mask is
> defined. Assuming the GIC implementation requires using edge
> triggered interrupts (as the comment in fdt_add_timer_nodes says),
> then OK.
> 
IIRC the comments in fdt_add_timer_nodes are not correct now since KVM
makes PPI level triggered.

    /* Note that on A15 h/w these interrupts are level-triggered,
     * but for the GIC implementation provided by both QEMU and KVM
     * they are edge-triggered.
     */

Thanks,
-- 
Shannon

