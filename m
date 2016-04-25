Received: by 10.25.208.194 with SMTP id h185csp931165lfg;
        Mon, 25 Apr 2016 06:55:07 -0700 (PDT)
X-Received: by 10.140.102.193 with SMTP id w59mr34051445qge.58.1461592507755;
        Mon, 25 Apr 2016 06:55:07 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t17si10814798qgt.85.2016.04.25.06.55.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Apr 2016 06:55:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60173 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1augyf-0000Hp-7O
	for alex.bennee@linaro.org; Mon, 25 Apr 2016 09:55:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1augyc-0000DO-KO
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 09:55:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1augyY-0003Kt-UL
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 09:55:02 -0400
Received: from mail-pf0-x22c.google.com ([2607:f8b0:400e:c00::22c]:34908)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1augyY-0003Ke-Bb
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 09:54:58 -0400
Received: by mail-pf0-x22c.google.com with SMTP id n1so68638431pfn.2
	for <qemu-arm@nongnu.org>; Mon, 25 Apr 2016 06:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=PNyKbFJnrnHqwr0hNTea9b4l0Foa4lluvgrcd4HSicw=;
	b=UdC17YmkFv2InQndEDLvWxNiJDS6GdRSenM1VWo51kK3bT1GS3vqMIzjBT/jBB/GF3
	rEGiOCUZG8OvsYLUWI+25g1QN8LwgF1S2Q55Z/dlVAQz3rzSjKiIvnLzr+2hVjgPquOS
	zac6VzAfriWG7GDo43X+yurAvSJtdNxnO5jUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=PNyKbFJnrnHqwr0hNTea9b4l0Foa4lluvgrcd4HSicw=;
	b=c5M9kq4qZdz8hOjYuSsCJiejx2064DBvT7Z31hjWYzccpWxDYI8+if47dHfyp4xfIb
	OzR3B2Yfe9GrTsBvF/igbSCAp53FwN6CTviY8Xnh3NwcO1NGoaVPPVdqLdTCQYdtD/sM
	dUKrk347/hO7oZ5N5seufUkyseeU6c48zNa/0GdtuDAKm3g8xbjcZWcJJ4j5lMx/anUQ
	Q+AnzF9v583B1tKoBSfVtfPzBfvHQe+HOned9OR9dADZ+ey+VfzGwyBw5TWpr86ong9l
	DXuxJiK1i2tnJDXepPUkTJkLU8Detv6hnyhhj6ungbg8jf+4lwHiZEcozUKTrwzzl1ac
	alUg==
X-Gm-Message-State: AOPr4FV2TmqgU3/7tKSkq3n8vxEML9F2sZKsy83AAAsypR+/S0oa3d9WLmiZvR4RiusDFm8O
X-Received: by 10.98.87.220 with SMTP id i89mr2458480pfj.107.1461592496318;
	Mon, 25 Apr 2016 06:54:56 -0700 (PDT)
Received: from [10.16.153.166] ([104.237.91.77])
	by smtp.gmail.com with ESMTPSA id
	zn7sm10946632pac.41.2016.04.25.06.54.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2016 06:54:55 -0700 (PDT)
To: Andrew Jones <drjones@redhat.com>, Shannon Zhao <zhaoshenglong@huawei.com>
References: <1461568306-14624-1-git-send-email-zhaoshenglong@huawei.com>
	<1461568306-14624-3-git-send-email-zhaoshenglong@huawei.com>
	<20160425092239.qhmyqjlrvms3auim@hawk.localdomain>
	<571E0169.5030705@huawei.com>
	<20160425115211.gszhulcveh65egro@hawk.localdomain>
From: Shannon Zhao <shannon.zhao@linaro.org>
Message-ID: <571E21AA.5000503@linaro.org>
Date: Mon, 25 Apr 2016 21:54:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160425115211.gszhulcveh65egro@hawk.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::22c
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BxxuqDPFpM+e

On 2016年04月25日 19:52, Andrew Jones wrote:
> On Mon, Apr 25, 2016 at 07:37:13PM +0800, Shannon Zhao wrote:
>> > 
>> > 
>> > On 2016/4/25 17:22, Andrew Jones wrote:
>>> > > On Mon, Apr 25, 2016 at 03:11:45PM +0800, Shannon Zhao wrote:
>>>>> > >> > From: Shannon Zhao <shannon.zhao@linaro.org>
>>>>> > >> > 
>>>>> > >> > Add a virtual PMU device for virt machine while use PPI 7 for PMU
>>>>> > >> > overflow interrupt number.
>>>>> > >> > 
>>>>> > >> > Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>>>>> > >> > ---
>>>>> > >> >  hw/arm/virt.c         | 34 ++++++++++++++++++++++++++++++++++
>>>>> > >> >  include/hw/arm/virt.h |  4 ++++
>>>>> > >> >  include/sysemu/kvm.h  |  1 +
>>>>> > >> >  stubs/kvm.c           |  5 +++++
>>>>> > >> >  target-arm/kvm64.c    | 39 +++++++++++++++++++++++++++++++++++++++
>>>>> > >> >  5 files changed, 83 insertions(+)
>>>>> > >> > 
>>>>> > >> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>>> > >> > index 56d35c7..c3632d8 100644
>>>>> > >> > --- a/hw/arm/virt.c
>>>>> > >> > +++ b/hw/arm/virt.c
>>>>> > >> > @@ -428,6 +428,38 @@ static void fdt_add_gic_node(VirtBoardInfo *vbi, int type)
>>>>> > >> >      qemu_fdt_setprop_cell(vbi->fdt, "/intc", "phandle", vbi->gic_phandle);
>>>>> > >> >  }
>>>>> > >> >  
>>>>> > >> > +static void fdt_add_pmu_nodes(const VirtBoardInfo *vbi, int gictype)
>>>>> > >> > +{
>>>>> > >> > +    CPUState *cpu;
>>>>> > >> > +    ARMCPU *armcpu;
>>>>> > >> > +    uint32_t irqflags = GIC_FDT_IRQ_FLAGS_LEVEL_HI;
>>>>> > >> > +
>>>>> > >> > +    CPU_FOREACH(cpu) {
>>>>> > >> > +        armcpu = ARM_CPU(cpu);
>>>>> > >> > +        if (!armcpu->has_pmu) {
>>>>> > >> > +            return;
>>>>> > >> > +        }
>>>>> > >> > +
>>>>> > >> > +        kvm_arm_pmu_create(cpu, PPI(VIRTUAL_PMU_IRQ));
>>> > > I think we need to return a failure code from kvm_arm_pmu_create, and
>>> > > then do
>>> > > 
>>> > >            if (!kvm_arm_pmu_create(...)) {
>>> > >                return;
>>> > >            }
>>> > > 
>>> > > Otherwise we create a /pmu node for the guest that won't work.
>>> > > 
>> > Ok, will update.
>> > 
>>>>> > >> > +    }
>>>>> > >> > +
>>>>> > >> > +    if (gictype == 2) {
>>>>> > >> > +        irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
>>>>> > >> > +                             GIC_FDT_IRQ_PPI_CPU_WIDTH,
>>>>> > >> > +                             (1 << vbi->smp_cpus) - 1);
>>> > > So, if we're using gicv3, then we're level triggered and these cpu
>>> > > mask bits aren't defined by the arm,gic-v3.txt bindings spec. Good.
>>> > > 
>>> > > If we're using gicv2, then we're edge triggered and this mask is
>>> > > defined. Assuming the GIC implementation requires using edge
>>> > > triggered interrupts (as the comment in fdt_add_timer_nodes says),
>>> > > then OK.
>>> > > 
>> > IIRC the comments in fdt_add_timer_nodes are not correct now since KVM
>> > makes PPI level triggered.
>> > 
>> >     /* Note that on A15 h/w these interrupts are level-triggered,
>> >      * but for the GIC implementation provided by both QEMU and KVM
>> >      * they are edge-triggered.
>> >      */
> OK, in that case the comment should be updated to say something like
> "used to", but I suspect it's too late for the timer to switch to
> level at this point anyway, unless KVM can be probed to determine if
> level is OK.
> 
> However, for PMU, we know that if the PMU feature exists, then level is
> OK, so if we want a level triggered interrupt for PMU, then we should
> change the giv2 irqflags assignment to an '|=' of the cpu mask.
Since for gicv2, the maximum of vbi->smp_cpus is 8, so it will not
overflow and the result of deposit32 is right, I think.

Thanks,
-- 
Shannon
