Received: by 10.80.166.35 with SMTP id d32csp1105035edc;
        Tue, 18 Oct 2016 10:16:52 -0700 (PDT)
X-Received: by 10.55.69.20 with SMTP id s20mr1596089qka.56.1476811012143;
        Tue, 18 Oct 2016 10:16:52 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g3si21579540qtd.71.2016.10.18.10.16.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Oct 2016 10:16:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42993 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwY0R-0006U4-Il
	for alex.bennee@linaro.org; Tue, 18 Oct 2016 13:16:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bwY0M-0006Tx-Hr
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 13:16:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bwY0J-00011X-Py
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 13:16:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60610)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1bwY0J-00010r-IZ; Tue, 18 Oct 2016 13:16:43 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C24C9C05678E;
	Tue, 18 Oct 2016 17:16:42 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9IHGdAA027988
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 18 Oct 2016 13:16:41 -0400
Date: Tue, 18 Oct 2016 19:16:38 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161018171638.vvpbc3ct4vztqntu@kamzik.brq.redhat.com>
References: <1475617134-28180-1-git-send-email-wei@redhat.com>
	<CAFEAcA_vTEjMK1Eex8Z41L2reWHK8oZ_XyekKv1r7eby+J+y7A@mail.gmail.com>
	<20161014074828.ewvvz2hn3cwtfpve@hawk.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161014074828.ewvvz2hn3cwtfpve@hawk.localdomain>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 18 Oct 2016 17:16:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V6 0/2] Add option to configure
 guest vPMU
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Andrea Bolognani <abologna@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7d+5rw7DD6ln

On Fri, Oct 14, 2016 at 09:48:28AM +0200, Andrew Jones wrote:
> On Thu, Oct 13, 2016 at 05:19:37PM +0100, Peter Maydell wrote:
> > On 4 October 2016 at 22:38, Wei Huang <wei@redhat.com> wrote:
> > > This patchset adds a pmu=[on/off] option to enable/disable vPMU support
> > > for guest VM. There are several reasons to justify this option. First,
> > > vPMU can be problematic for cross-migration between different SoC as perf
> > > counters are architecture-dependent. It is more flexible to have an option
> > > to turn it on/off. Secondly this option matches the "pmu" option as
> > > supported in libvirt. To make sure backward compatible, a PMU-related
> > > property is added to mach-virt machine types.
> > >
> > > The following are testing results with this patchset. Other combinations
> > > should have similar results:
> > >   CONFIG (qemu-system-aarch64)                       vPMU   WARNING
> > >   -M virt-2.8/virt,accel=kvm -cpu host               NO     NO
> > 
> > What's the rationale for defaulting to no-pmu? Other cpu features
> > we have tend to default to present unless you ask not to have them.
> 
> The feature needs to be managed in order for users to be able to trade-off
> features exposed vs. migratability. If the lack of an explicit pmu=on
> means either you get a PMU, when it's available, or you don't, when it's
> not, then managing the feature becomes more difficult. Also, libvirt
> already manages this cpu property for x86, and there it defaults off.

We discussed this today with Andrea. He says libvirt doesn't mind the
default being on. x86 defaults pmu off, ppc defaults pmu on. I guess
we might as well stick with on, it should make things easier.

> 
> Maybe we should revisit the other features that default on, but may
> be turned off, to make sure they make sense. Can you point them out?
> I took a quick look, but it appears the cpu property defaults are all
> pretty much determined by vms->secure, which defaults to false.
> 
> > 
> > >   -M virt-2.8/virt,accel=kvm -cpu host,pmu=off       NO     NO
> > >   -M virt-2.8/virt,accel=kvm -cpu host,pmu=on        YES    NO
> > >   -M virt-2.7,accel=kvm -cpu host                    YES    NO
> > >   -M virt-2.7,accel=kvm -cpu host,pmu=off            NO     NO
> > >   -M virt-2.7,accel=kvm -cpu host,pmu=on             YES    NO
> > 
> > in virt-2.7 you always got a pmu regardless, so why does pmu=off here give
> > you no pmu?
> 
> Hmm, I think you're right that the property should just be a nop, or
> even invalid (causing an error) for 2.7 and down.

Hmm... a no-op property wouldn't be exactly compatible. An error message
stating the property isn't allowed would be. That's not how QEMU currently
handles compat though. compat is only supported for going from an older-
version host to a newer-version host (and back). In those cases the
command line is older-version compatible and works in both places.
Starting on a newer-version, even when using a compat machine type,
doesn't guarantee we can go to an older, because, for example, the command
line may include properties that don't exist there.

We could address this, if we really want. We'd need to keep the auto
tri-state to detect that the user set the property. If they did, then
we should complain and fail to start, never allowing virt-2.7
instantiations to have the pmu property on the command line. I don't
know if it's worth it though.

> 
> > 
> > >   -M virt-2.6,accel=kvm -cpu host                    NO     NO
> > >   -M virt-2.6,accel=kvm -cpu host,pmu=off            NO     NO
> > >   -M virt-2.6,accel=kvm -cpu host,pmu=on             YES    NO
> > >
> > >   -M virt-2.8/virt,accel=tcg -cpu cortex-a57         NO     NO
> > >   -M virt-2.8/virt,accel=tcg -cpu cortex-a57,pmu=off NO     NO
> > >   -M virt-2.8/virt,accel=tcg -cpu cortex-a57,pmu=on  NO     "No KVM"
> > >   -M virt-2.7,accel=tcg -cpu cortex-a57              NO     NO
> > >   -M virt-2.7,accel=tcg -cpu cortex-a57,pmu=off      NO     NO
> > >   -M virt-2.7,accel=tcg -cpu cortex-a57,pmu=on       NO     "No KVM"
> > >   -M virt-2.6,accel=tcg -cpu cortex-a57              NO     NO
> > >   -M virt-2.6,accel=tcg -cpu cortex-a57,pmu=off      NO     NO
> > >   -M virt-2.6,accel=tcg -cpu cortex-a57,pmu=on       NO     "No KVM"
> > 
> > This patchset doesn't actually change whether the pmu is present
> > or not under TCG so this is all a little bit odd.
> 
> The goal here is to allow the property on the command line, i.e. not
> error and fail, when using tcg. Otherwise more than just s/kvm/tcg/
> would be required when switching, and accel=kvm:tcg wouldn't work either.
> 
> > 
> > >   -M virt-2.8/virt,accel=tcg -cpu cortex-a15         NO     NO
> > >   -M virt-2.8/virt,accel=tcg -cpu cortex-a15,pmu=off NO     "No PMU property"
> > >   -M virt-2.8/virt,accel=tcg -cpu cortex-a15,pmu=on  NO     "No PMU property"
> > >   -M virt-2.7,accel=tcg -cpu cortex-a15              NO     NO
> > >   -M virt-2.7,accel=tcg -cpu cortex-a15,pmu=off      NO     "No PMU property"
> > >   -M virt-2.7,accel=tcg -cpu cortex-a15,pmu=on       NO     "No PMU property"
> > >   -M virt-2.6,accel=tcg -cpu cortex-a15              NO     NO
> > >   -M virt-2.6,accel=tcg -cpu cortex-a15,pmu=off      NO     "No PMU property"
> > >   -M virt-2.6,accel=tcg -cpu cortex-a15,pmu=on       NO     "No PMU property"
> > >
> > >   * "NO KVM" msg
> > >     warning: pmu can't be enabled without KVM acceleration
> > >   * "No PMU property" msg
> > >     can't apply global cortex-a15-arm-cpu.pmu=off: Property '.pmu' not found
> > 
> > I'm really not a fan of the tristate has_pmu, so I'm hoping
> > there's a setup which lets us avoid it...
> 
> Probably keeping PMU on no matter what for 2.7 and down will allow
> the removal of the tristate.

If we switch to default on, then the only way to turn it off is with
pmu=off added to the command line. So we'll know if pmu=off is given
and we can just ignore it for virt-2.7. If we don't care about keeping
the property off the virt-2.7 command line then there's no need for a
tri-state.

Thanks,
drew
