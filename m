Received: by 10.25.208.194 with SMTP id h185csp944612lfg;
        Mon, 25 Apr 2016 07:17:56 -0700 (PDT)
X-Received: by 10.55.164.145 with SMTP id n139mr18896448qke.190.1461593876525;
        Mon, 25 Apr 2016 07:17:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n77si10667811qkn.9.2016.04.25.07.17.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Apr 2016 07:17:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60241 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1auhKk-0006zA-Lt
	for alex.bennee@linaro.org; Mon, 25 Apr 2016 10:17:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37053)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1auhKh-0006wM-T8
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 10:17:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1auhKd-0005LD-Sj
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 10:17:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53132)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1auhKd-0005L9-Lm; Mon, 25 Apr 2016 10:17:47 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E0DAF710AC;
	Mon, 25 Apr 2016 14:17:46 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-112.brq.redhat.com [10.34.1.112])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3PEHhAB031486
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 25 Apr 2016 10:17:45 -0400
Date: Mon, 25 Apr 2016 16:17:42 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <shannon.zhao@linaro.org>
Message-ID: <20160425141742.37d774ucb4qz7nx7@hawk.localdomain>
References: <1461568306-14624-1-git-send-email-zhaoshenglong@huawei.com>
	<1461568306-14624-3-git-send-email-zhaoshenglong@huawei.com>
	<20160425092239.qhmyqjlrvms3auim@hawk.localdomain>
	<571E0169.5030705@huawei.com>
	<20160425115211.gszhulcveh65egro@hawk.localdomain>
	<571E21AA.5000503@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <571E21AA.5000503@linaro.org>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 25 Apr 2016 14:17:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
	qemu-devel@nongnu.org, Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zF8etVTajagT

On Mon, Apr 25, 2016 at 09:54:50PM +0800, Shannon Zhao wrote:
> On 2016=E5=B9=B404=E6=9C=8825=E6=97=A5 19:52, Andrew Jones wrote:
> > On Mon, Apr 25, 2016 at 07:37:13PM +0800, Shannon Zhao wrote:
> >> >=20
> >> >=20
> >> > On 2016/4/25 17:22, Andrew Jones wrote:
> >>> > > On Mon, Apr 25, 2016 at 03:11:45PM +0800, Shannon Zhao wrote:
> >>>>> > >> > From: Shannon Zhao <shannon.zhao@linaro.org>
> >>>>> > >> >=20
> >>>>> > >> > Add a virtual PMU device for virt machine while use PPI 7 =
for PMU
> >>>>> > >> > overflow interrupt number.
> >>>>> > >> >=20
> >>>>> > >> > Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> >>>>> > >> > ---
> >>>>> > >> >  hw/arm/virt.c         | 34 ++++++++++++++++++++++++++++++=
++++
> >>>>> > >> >  include/hw/arm/virt.h |  4 ++++
> >>>>> > >> >  include/sysemu/kvm.h  |  1 +
> >>>>> > >> >  stubs/kvm.c           |  5 +++++
> >>>>> > >> >  target-arm/kvm64.c    | 39 ++++++++++++++++++++++++++++++=
+++++++++
> >>>>> > >> >  5 files changed, 83 insertions(+)
> >>>>> > >> >=20
> >>>>> > >> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >>>>> > >> > index 56d35c7..c3632d8 100644
> >>>>> > >> > --- a/hw/arm/virt.c
> >>>>> > >> > +++ b/hw/arm/virt.c
> >>>>> > >> > @@ -428,6 +428,38 @@ static void fdt_add_gic_node(VirtBoar=
dInfo *vbi, int type)
> >>>>> > >> >      qemu_fdt_setprop_cell(vbi->fdt, "/intc", "phandle", v=
bi->gic_phandle);
> >>>>> > >> >  }
> >>>>> > >> > =20
> >>>>> > >> > +static void fdt_add_pmu_nodes(const VirtBoardInfo *vbi, i=
nt gictype)
> >>>>> > >> > +{
> >>>>> > >> > +    CPUState *cpu;
> >>>>> > >> > +    ARMCPU *armcpu;
> >>>>> > >> > +    uint32_t irqflags =3D GIC_FDT_IRQ_FLAGS_LEVEL_HI;
> >>>>> > >> > +
> >>>>> > >> > +    CPU_FOREACH(cpu) {
> >>>>> > >> > +        armcpu =3D ARM_CPU(cpu);
> >>>>> > >> > +        if (!armcpu->has_pmu) {
> >>>>> > >> > +            return;
> >>>>> > >> > +        }
> >>>>> > >> > +
> >>>>> > >> > +        kvm_arm_pmu_create(cpu, PPI(VIRTUAL_PMU_IRQ));
> >>> > > I think we need to return a failure code from kvm_arm_pmu_creat=
e, and
> >>> > > then do
> >>> > >=20
> >>> > >            if (!kvm_arm_pmu_create(...)) {
> >>> > >                return;
> >>> > >            }
> >>> > >=20
> >>> > > Otherwise we create a /pmu node for the guest that won't work.
> >>> > >=20
> >> > Ok, will update.
> >> >=20
> >>>>> > >> > +    }
> >>>>> > >> > +
> >>>>> > >> > +    if (gictype =3D=3D 2) {
> >>>>> > >> > +        irqflags =3D deposit32(irqflags, GIC_FDT_IRQ_PPI_=
CPU_START,
> >>>>> > >> > +                             GIC_FDT_IRQ_PPI_CPU_WIDTH,
> >>>>> > >> > +                             (1 << vbi->smp_cpus) - 1);
> >>> > > So, if we're using gicv3, then we're level triggered and these =
cpu
> >>> > > mask bits aren't defined by the arm,gic-v3.txt bindings spec. G=
ood.
> >>> > >=20
> >>> > > If we're using gicv2, then we're edge triggered and this mask i=
s
> >>> > > defined. Assuming the GIC implementation requires using edge
> >>> > > triggered interrupts (as the comment in fdt_add_timer_nodes say=
s),
> >>> > > then OK.
> >>> > >=20
> >> > IIRC the comments in fdt_add_timer_nodes are not correct now since=
 KVM
> >> > makes PPI level triggered.
> >> >=20
> >> >     /* Note that on A15 h/w these interrupts are level-triggered,
> >> >      * but for the GIC implementation provided by both QEMU and KV=
M
> >> >      * they are edge-triggered.
> >> >      */
> > OK, in that case the comment should be updated to say something like
> > "used to", but I suspect it's too late for the timer to switch to
> > level at this point anyway, unless KVM can be probed to determine if
> > level is OK.
> >=20
> > However, for PMU, we know that if the PMU feature exists, then level =
is
> > OK, so if we want a level triggered interrupt for PMU, then we should
> > change the giv2 irqflags assignment to an '|=3D' of the cpu mask.
> Since for gicv2, the maximum of vbi->smp_cpus is 8, so it will not
> overflow and the result of deposit32 is right, I think.

Yes. I was actually referring to the level flag, thinking it was getting
overwritten with zero, but now I see in deposit32's description that
"Bits of @value outside the bit field are not modified." So this is
fine.

Thanks,
drew
