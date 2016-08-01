Received: by 10.25.21.156 with SMTP id 28csp2621397lfv;
        Mon, 1 Aug 2016 06:08:27 -0700 (PDT)
X-Received: by 10.55.20.197 with SMTP id 66mr34023473qku.4.1470056907665;
        Mon, 01 Aug 2016 06:08:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id l127si19877491qkb.107.2016.08.01.06.08.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Aug 2016 06:08:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50187 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUCxG-0000HG-Vo
	for alex.bennee@linaro.org; Mon, 01 Aug 2016 09:08:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bUCx8-0000BT-NV
	for qemu-arm@nongnu.org; Mon, 01 Aug 2016 09:08:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bUCx3-0004sc-Uo
	for qemu-arm@nongnu.org; Mon, 01 Aug 2016 09:08:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40182)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bUCx3-0004sX-N9; Mon, 01 Aug 2016 09:08:13 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE93080F7D;
	Mon,  1 Aug 2016 13:08:12 +0000 (UTC)
Received: from kamzik.localdomain (dhcp-1-220.brq.redhat.com [10.34.1.220])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u71D894F022662
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 1 Aug 2016 09:08:11 -0400
Date: Mon, 1 Aug 2016 15:08:08 +0200
From: Andrew Jones <drjones@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Message-ID: <20160801130808.2igpsx52opi7ogvk@kamzik.localdomain>
References: <1469723896-28049-1-git-send-email-wei@redhat.com>
	<20160729065453.qq44y2hxohizk3yw@hawk.localdomain>
	<1470053099.3971.11.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1470053099.3971.11.camel@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 01 Aug 2016 13:08:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 1/1] arm64: add an option to
 turn on/off vpmu support
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
	shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WhIX6/R3kK+2

On Mon, Aug 01, 2016 at 02:04:59PM +0200, Andrea Bolognani wrote:
> On Fri, 2016-07-29 at 08:54 +0200, Andrew Jones wrote:
> > On Thu, Jul 28, 2016 at 11:38:16AM -0500, Wei Huang wrote:
> > >=A0
> > > This patch adds a pmu=3D[on/off] option to enable/disable vpmu supp=
ort
> > > in guest vm. There are several reasons to justify this option. Firs=
t
> > > vpmu can be problematic for cross-migration between different SoC a=
s
> > > perf counters is architecture-dependent. It is more flexible to
> > > have an option to turn it on/off. Secondly it matches the -cpu pmu
> > > option in libivrt. This patch has been tested on both DT/ACPI modes=
.
> > >=A0
> > > Signed-off-by: Wei Huang <wei@redhat.com>
> > > ---
> > >=A0=A0hw/arm/virt-acpi-build.c |=A0=A02 +-
> > >=A0=A0hw/arm/virt.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0|=A0=A02 +-
> > >=A0=A0target-arm/cpu.c=A0=A0=A0=A0=A0=A0=A0=A0=A0|=A0=A01 +
> > >=A0=A0target-arm/cpu.h=A0=A0=A0=A0=A0=A0=A0=A0=A0|=A0=A05 +++--
> > >=A0=A0target-arm/kvm64.c=A0=A0=A0=A0=A0=A0=A0| 10 +++++-----
> > >=A0=A05 files changed, 11 insertions(+), 9 deletions(-)
> > >=A0
> > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > index 28fc59c..dc5f66d 100644
> > > --- a/hw/arm/virt-acpi-build.c
> > > +++ b/hw/arm/virt-acpi-build.c
> > > @@ -540,7 +540,7 @@ build_madt(GArray *table_data, BIOSLinker *link=
er, VirtGuestInfo *guest_info)
> > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0gicc->uid =3D i;
> > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0gicc->flags =3D cpu_to_le32(ACPI_GICC_=
ENABLED);
> > >=A0=A0
> > > -=A0=A0=A0=A0=A0=A0=A0=A0if (armcpu->has_pmu) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0if (armcpu->enable_pmu) {
> > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0gicc->performance_interrup=
t =3D cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
> > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > >=A0=A0=A0=A0=A0=A0}
> > > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > > index a193b5a..6aea901 100644
> > > --- a/hw/arm/virt.c
> > > +++ b/hw/arm/virt.c
> > > @@ -477,7 +477,7 @@ static void fdt_add_pmu_nodes(const VirtBoardIn=
fo *vbi, int gictype)
> > >=A0=A0
> > >=A0=A0=A0=A0=A0=A0CPU_FOREACH(cpu) {
> > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0armcpu =3D ARM_CPU(cpu);
> > > -=A0=A0=A0=A0=A0=A0=A0=A0if (!armcpu->has_pmu ||
> > > +=A0=A0=A0=A0=A0=A0=A0=A0if (!armcpu->enable_pmu ||
> > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0!kvm_arm_pmu_create(cpu, P=
PI(VIRTUAL_PMU_IRQ))) {
> > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return;
> > >=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> > > diff --git a/target-arm/cpu.c b/target-arm/cpu.c
> > > index ce8b8f4..f7daf81 100644
> > > --- a/target-arm/cpu.c
> > > +++ b/target-arm/cpu.c
> > > @@ -1412,6 +1412,7 @@ static const ARMCPUInfo arm_cpus[] =3D {
> > >=A0=A0};
> > >=A0=A0
> > >=A0=A0static Property arm_cpu_properties[] =3D {
> > > +=A0=A0=A0=A0DEFINE_PROP_BOOL("pmu", ARMCPU, enable_pmu, true),
> >=A0
> > x86's pmu property defaults to off. I'm not sure if it's necessary to
> > have a consistent default between x86 and arm in order for libvirt to
> > be able to use it in the same way. We should confirm with libvirt
> > people. Anyway, I think I'd prefer we default off here, and then we
> > can default on in machine code for configurations that we want it by
> > default (only AArch64 KVM). Or, maybe we don't want it by default at
> > all? Possibly we should only set it on by default for virt-2.6, and
> > then, from 2.7 on, require users to opt-in to the feature. It makes
> > sense to require opting-in to features that can cause problems with
> > migration.
>=20
> After thinking about this a bit, I don't think it matters that
> much (from libvirt's point of view) whether the default is on
> or off - there are a bunch of other situations where the user
> is required to specify explicitly whether he wants the feature
> or not, and if he doesn't choose either side he will get
> whatever QEMU uses as a default.
>=20
> What's important is that the user can pick one or the other
> when it matters to him, and having a pmu property like the one
> x86 already has fits the bill.
>=20
> That said, defaulting to off looks like it would be the least
> confusing behaviour.

OK, so the default is still up for debate.

Pros of ON                Cons of ON
----------                ----------
We already do it          The default instance is less migratable
Less typing on cmdline
 (libvirt covers typing for us anyway...)

Pros of OFF               Cons of OFF
-----------               -----------
See 'Cons of ON'          See 'Pros on ON' (virt-2.6 needs compat code)

>=20
> > > +=A0=A0=A0=A0cpu->kvm_init_features[0] |=3D cpu->enable_pmu << KVM_=
ARM_VCPU_PMU_V3;
> > >=A0=A0
> > >=A0=A0=A0=A0=A0=A0/* Do KVM_ARM_VCPU_INIT ioctl */
> > >=A0=A0=A0=A0=A0=A0ret =3D kvm_arm_vcpu_init(cs);
> >=A0
> > OK, so this property will be exposed to all ARM cpu types, and if a u=
ser
> > turns it on, then it will stay on for all types, except when using KV=
M
> > with an aarch64 cpu type, and KVM doesn't support it. This could misl=
ead
> > users to believe they'll get a pmu, by simply adding pmu=3Don, even w=
hen
> > they can't. I think we'd ideally keep has_pmu, and the current code t=
hat
> > sets it, and then add code like
> >=A0
> >=A0=A0if (enable_pmu && !has_pmu) {
> >=A0=A0=A0=A0error_report("Warning: ...")
> >=A0=A0}
> >=A0
> > somewhere. Unfortunately I don't think there's any one place we could
> > add that. We'd need to add it to every ARM machine type that cares ab=
out
> > not misleading users. Too bad cpu properties aren't whitelisted by
> > machines to avoid this issue.
> >=A0
> > Anyway, all that said, I see this is just how cpu properties currentl=
y
> > work, so we probably don't need to worry about it for every machine. =
I
> > do still suggest we add the above warning to mach-virt though.
>=20
> I'm not sure a warning is enough: if I start a guest and
> explicitly ask for a PMU, I expect it to be there, or for
> the guest not to start at all. How does x86 behave in this
> regard?

Peter had a good suggestion for this. We need to wrap the property
addition in an arm_feature check like the has_el3 property. That will
remove it from all cpu types that don't support it. Then there's no
need for the enable_pmu && !has_pmu check as the has_pmu part is covered
very early with the feature flag in arm_cpu_post_init(). Peter also
suggested we keep the 'has_pmu' name, rather than change it to
'enable_pmu'. On that one I would disagree. 'has_pmu' indicates that the
feature is available at all, which it is to all cpu types that have the
arm feature, but not all users will want it enabled. 'enable_pmu', which
matches x86's naming, seems more appropriate for that.

Thanks,
drew

>=20
> --=A0
> Andrea Bolognani / Red Hat / Virtualization
