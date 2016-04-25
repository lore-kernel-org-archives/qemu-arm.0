Received: by 10.25.208.194 with SMTP id h185csp739639lfg;
        Sun, 24 Apr 2016 23:56:13 -0700 (PDT)
X-Received: by 10.140.219.200 with SMTP id p191mr27104941qhb.90.1461567373336;
        Sun, 24 Apr 2016 23:56:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e66si9967992qgf.125.2016.04.24.23.56.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 24 Apr 2016 23:56:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57864 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1auaRG-0006sz-Mt
	for alex.bennee@linaro.org; Mon, 25 Apr 2016 02:56:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49737)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1auaR9-0006lv-W4
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 02:56:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1auaR4-0005Pq-Vb
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 02:56:03 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:56868)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1auaR3-0005PE-Jn; Mon, 25 Apr 2016 02:55:58 -0400
Received: from 172.24.1.36 (EHLO SZXEML423-HUB.china.huawei.com)
	([172.24.1.36])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DJK21790; Mon, 25 Apr 2016 14:55:33 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by SZXEML423-HUB.china.huawei.com
	(10.82.67.154) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 25 Apr 2016 14:53:12 +0800
Message-ID: <571DBEBD.5060001@huawei.com>
Date: Mon, 25 Apr 2016 14:52:45 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Andrew Jones <drjones@redhat.com>
References: <1461405855-15576-1-git-send-email-zhaoshenglong@huawei.com>
	<1461405855-15576-3-git-send-email-zhaoshenglong@huawei.com>
	<20160424172827.x5pmdjnsgdkivktc@hawk.localdomain>
In-Reply-To: <20160424172827.x5pmdjnsgdkivktc@hawk.localdomain>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.571DBF69.00AA, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 95fcbd89cc1859a93fe55b46da1ba040
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Subject: Re: [Qemu-arm] [PATCH v2 2/3] hw/arm/virt: Add PMU node for virt
 machine
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
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wGdo3lG6UI4E



On 2016/4/25 1:28, Andrew Jones wrote:
> On Sat, Apr 23, 2016 at 06:04:14PM +0800, Shannon Zhao wrote:
>> > From: Shannon Zhao <shannon.zhao@linaro.org>
>> > 
>> > Add a virtual PMU device for virt machine while use PPI 7 for PMU
>> > overflow interrupt number.
>> > 
>> > Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> > ---
>> >  hw/arm/virt.c         | 31 +++++++++++++++++++++++++++++++
>> >  include/hw/arm/virt.h |  4 ++++
>> >  include/sysemu/kvm.h  |  1 +
>> >  stubs/kvm.c           |  5 +++++
>> >  target-arm/kvm64.c    | 39 +++++++++++++++++++++++++++++++++++++++
>> >  5 files changed, 80 insertions(+)
>> > 
>> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> > index 56d35c7..d77b314 100644
>> > --- a/hw/arm/virt.c
>> > +++ b/hw/arm/virt.c
>> > @@ -428,6 +428,35 @@ static void fdt_add_gic_node(VirtBoardInfo *vbi, int type)
>> >      qemu_fdt_setprop_cell(vbi->fdt, "/intc", "phandle", vbi->gic_phandle);
>> >  }
>> >  
>> > +static void fdt_add_pmu_nodes(const VirtBoardInfo *vbi)
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
>> > +    }
>> > +
>> > +    irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
>> > +                         GIC_FDT_IRQ_PPI_CPU_WIDTH, (1 << vbi->smp_cpus) - 1);
> The shift will overflow when configuring a machine to have more than
> 32 cpus. You should confirm smp_cpus is <= GIC_FDT_IRQ_PPI_CPU_WIDTH
> before generating a mask this way, otherwise you can just pass in 0xff.
> 
Ah, right. So it could check the gictype like what we do in
fdt_add_timer_nodes.

Thanks,
-- 
Shannon

