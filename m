Received: by 10.25.21.156 with SMTP id 28csp2591729lfv;
        Mon, 1 Aug 2016 05:05:19 -0700 (PDT)
X-Received: by 10.129.169.10 with SMTP id g10mr28706686ywh.232.1470053119603;
        Mon, 01 Aug 2016 05:05:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p67si1690881qkd.97.2016.08.01.05.05.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Aug 2016 05:05:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49925 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUByB-0005mt-2R
	for alex.bennee@linaro.org; Mon, 01 Aug 2016 08:05:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49034)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1bUBy3-0005iv-2C
	for qemu-arm@nongnu.org; Mon, 01 Aug 2016 08:05:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1bUBxw-0001u2-S7
	for qemu-arm@nongnu.org; Mon, 01 Aug 2016 08:05:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60556)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>)
	id 1bUBxw-0001td-Jv; Mon, 01 Aug 2016 08:05:04 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 04EC537E63;
	Mon,  1 Aug 2016 12:05:03 +0000 (UTC)
Received: from dhcp129-212.brq.redhat.com (dhcp129-212.brq.redhat.com
	[10.34.129.212])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u71C50hx006833
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 1 Aug 2016 08:05:01 -0400
Message-ID: <1470053099.3971.11.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Andrew Jones <drjones@redhat.com>, Wei Huang <wei@redhat.com>
Date: Mon, 01 Aug 2016 14:04:59 +0200
In-Reply-To: <20160729065453.qq44y2hxohizk3yw@hawk.localdomain>
References: <1469723896-28049-1-git-send-email-wei@redhat.com>
	<20160729065453.qq44y2hxohizk3yw@hawk.localdomain>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 01 Aug 2016 12:05:03 +0000 (UTC)
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
X-TUID: hPq3QJEDHBwn

On Fri, 2016-07-29 at 08:54 +0200, Andrew Jones wrote:
> On Thu, Jul 28, 2016 at 11:38:16AM -0500, Wei Huang wrote:
> >=C2=A0
> > This patch adds a pmu=3D[on/off] option to enable/disable vpmu suppor=
t
> > in guest vm. There are several reasons to justify this option. First
> > vpmu can be problematic for cross-migration between different SoC as
> > perf counters is architecture-dependent. It is more flexible to
> > have an option to turn it on/off. Secondly it matches the -cpu pmu
> > option in libivrt. This patch has been tested on both DT/ACPI modes.
> >=C2=A0
> > Signed-off-by: Wei Huang <wei@redhat.com>
> > ---
> >=C2=A0=C2=A0hw/arm/virt-acpi-build.c |=C2=A0=C2=A02 +-
> >=C2=A0=C2=A0hw/arm/virt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A02 +-
> >=C2=A0=C2=A0target-arm/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0|=C2=A0=C2=A01 +
> >=C2=A0=C2=A0target-arm/cpu.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0|=C2=A0=C2=A05 +++--
> >=C2=A0=C2=A0target-arm/kvm64.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
| 10 +++++-----
> >=C2=A0=C2=A05 files changed, 11 insertions(+), 9 deletions(-)
> >=C2=A0
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index 28fc59c..dc5f66d 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -540,7 +540,7 @@ build_madt(GArray *table_data, BIOSLinker *linker=
, VirtGuestInfo *guest_info)
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gicc->uid =
=3D i;
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gicc->flag=
s =3D cpu_to_le32(ACPI_GICC_ENABLED);
> >=C2=A0=C2=A0
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (armcpu->has_pmu)=
 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (armcpu->enable_p=
mu) {
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0gicc->performance_interrupt =3D cpu_to_le32(PPI(VIRTUAL_PMU_I=
RQ));
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index a193b5a..6aea901 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -477,7 +477,7 @@ static void fdt_add_pmu_nodes(const VirtBoardInfo=
 *vbi, int gictype)
> >=C2=A0=C2=A0
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CPU_FOREACH(cpu) {
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0armcpu =3D=
 ARM_CPU(cpu);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!armcpu->has_pmu=
 ||
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!armcpu->enable_=
pmu ||
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0!kvm_arm_pmu_create(cpu, PPI(VIRTUAL_PMU_IRQ))) {
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0return;
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > diff --git a/target-arm/cpu.c b/target-arm/cpu.c
> > index ce8b8f4..f7daf81 100644
> > --- a/target-arm/cpu.c
> > +++ b/target-arm/cpu.c
> > @@ -1412,6 +1412,7 @@ static const ARMCPUInfo arm_cpus[] =3D {
> >=C2=A0=C2=A0};
> >=C2=A0=C2=A0
> >=C2=A0=C2=A0static Property arm_cpu_properties[] =3D {
> > +=C2=A0=C2=A0=C2=A0=C2=A0DEFINE_PROP_BOOL("pmu", ARMCPU, enable_pmu, =
true),
>=C2=A0
> x86's pmu property defaults to off. I'm not sure if it's necessary to
> have a consistent default between x86 and arm in order for libvirt to
> be able to use it in the same way. We should confirm with libvirt
> people. Anyway, I think I'd prefer we default off here, and then we
> can default on in machine code for configurations that we want it by
> default (only AArch64 KVM). Or, maybe we don't want it by default at
> all? Possibly we should only set it on by default for virt-2.6, and
> then, from 2.7 on, require users to opt-in to the feature. It makes
> sense to require opting-in to features that can cause problems with
> migration.

After thinking about this a bit, I don't think it matters that
much (from libvirt's point of view) whether the default is on
or off - there are a bunch of other situations where the user
is required to specify explicitly whether he wants the feature
or not, and if he doesn't choose either side he will get
whatever QEMU uses as a default.

What's important is that the user can pick one or the other
when it matters to him, and having a pmu property like the one
x86 already has fits the bill.

That said, defaulting to off looks like it would be the least
confusing behaviour.

> > +=C2=A0=C2=A0=C2=A0=C2=A0cpu->kvm_init_features[0] |=3D cpu->enable_p=
mu << KVM_ARM_VCPU_PMU_V3;
> >=C2=A0=C2=A0
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Do KVM_ARM_VCPU_INIT ioctl */
> >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D kvm_arm_vcpu_init(cs);
>=C2=A0
> OK, so this property will be exposed to all ARM cpu types, and if a use=
r
> turns it on, then it will stay on for all types, except when using KVM
> with an aarch64 cpu type, and KVM doesn't support it. This could mislea=
d
> users to believe they'll get a pmu, by simply adding pmu=3Don, even whe=
n
> they can't. I think we'd ideally keep has_pmu, and the current code tha=
t
> sets it, and then add code like
>=C2=A0
>=C2=A0=C2=A0if (enable_pmu && !has_pmu) {
>=C2=A0=C2=A0=C2=A0=C2=A0error_report("Warning: ...")
>=C2=A0=C2=A0}
>=C2=A0
> somewhere. Unfortunately I don't think there's any one place we could
> add that. We'd need to add it to every ARM machine type that cares abou=
t
> not misleading users. Too bad cpu properties aren't whitelisted by
> machines to avoid this issue.
>=C2=A0
> Anyway, all that said, I see this is just how cpu properties currently
> work, so we probably don't need to worry about it for every machine. I
> do still suggest we add the above warning to mach-virt though.

I'm not sure a warning is enough: if I start a guest and
explicitly ask for a PMU, I expect it to be there, or for
the guest not to start at all. How does x86 behave in this
regard?

--=C2=A0
Andrea Bolognani / Red Hat / Virtualization
