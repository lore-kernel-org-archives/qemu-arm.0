Received: by 10.80.166.35 with SMTP id d32csp145732edc;
        Fri, 14 Oct 2016 00:50:01 -0700 (PDT)
X-Received: by 10.237.48.164 with SMTP id 33mr10917172qtf.95.1476431401555;
        Fri, 14 Oct 2016 00:50:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t69si8943164qki.156.2016.10.14.00.50.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Oct 2016 00:50:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45842 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1buxFg-00038S-Ug
	for alex.bennee@linaro.org; Fri, 14 Oct 2016 03:50:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60456)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1buxEK-0002H5-9O
	for qemu-arm@nongnu.org; Fri, 14 Oct 2016 03:48:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1buxEH-0003Wy-4H
	for qemu-arm@nongnu.org; Fri, 14 Oct 2016 03:48:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:14814)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1buxEG-0003Wf-Qm; Fri, 14 Oct 2016 03:48:33 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2E0449F725;
	Fri, 14 Oct 2016 07:48:32 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-76.brq.redhat.com [10.40.204.76])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9E7mSw7022524
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 14 Oct 2016 03:48:30 -0400
Date: Fri, 14 Oct 2016 09:48:28 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161014074828.ewvvz2hn3cwtfpve@hawk.localdomain>
References: <1475617134-28180-1-git-send-email-wei@redhat.com>
	<CAFEAcA_vTEjMK1Eex8Z41L2reWHK8oZ_XyekKv1r7eby+J+y7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_vTEjMK1Eex8Z41L2reWHK8oZ_XyekKv1r7eby+J+y7A@mail.gmail.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 14 Oct 2016 07:48:32 +0000 (UTC)
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
Cc: Shannon Zhao <shannon.zhao@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iA+0CMYHRbqs

On Thu, Oct 13, 2016 at 05:19:37PM +0100, Peter Maydell wrote:
> On 4 October 2016 at 22:38, Wei Huang <wei@redhat.com> wrote:
> > This patchset adds a pmu=[on/off] option to enable/disable vPMU support
> > for guest VM. There are several reasons to justify this option. First,
> > vPMU can be problematic for cross-migration between different SoC as perf
> > counters are architecture-dependent. It is more flexible to have an option
> > to turn it on/off. Secondly this option matches the "pmu" option as
> > supported in libvirt. To make sure backward compatible, a PMU-related
> > property is added to mach-virt machine types.
> >
> > The following are testing results with this patchset. Other combinations
> > should have similar results:
> >   CONFIG (qemu-system-aarch64)                       vPMU   WARNING
> >   -M virt-2.8/virt,accel=kvm -cpu host               NO     NO
> 
> What's the rationale for defaulting to no-pmu? Other cpu features
> we have tend to default to present unless you ask not to have them.

The feature needs to be managed in order for users to be able to trade-off
features exposed vs. migratability. If the lack of an explicit pmu=on
means either you get a PMU, when it's available, or you don't, when it's
not, then managing the feature becomes more difficult. Also, libvirt
already manages this cpu property for x86, and there it defaults off.

Maybe we should revisit the other features that default on, but may
be turned off, to make sure they make sense. Can you point them out?
I took a quick look, but it appears the cpu property defaults are all
pretty much determined by vms->secure, which defaults to false.

> 
> >   -M virt-2.8/virt,accel=kvm -cpu host,pmu=off       NO     NO
> >   -M virt-2.8/virt,accel=kvm -cpu host,pmu=on        YES    NO
> >   -M virt-2.7,accel=kvm -cpu host                    YES    NO
> >   -M virt-2.7,accel=kvm -cpu host,pmu=off            NO     NO
> >   -M virt-2.7,accel=kvm -cpu host,pmu=on             YES    NO
> 
> in virt-2.7 you always got a pmu regardless, so why does pmu=off here give
> you no pmu?

Hmm, I think you're right that the property should just be a nop, or
even invalid (causing an error) for 2.7 and down.

> 
> >   -M virt-2.6,accel=kvm -cpu host                    NO     NO
> >   -M virt-2.6,accel=kvm -cpu host,pmu=off            NO     NO
> >   -M virt-2.6,accel=kvm -cpu host,pmu=on             YES    NO
> >
> >   -M virt-2.8/virt,accel=tcg -cpu cortex-a57         NO     NO
> >   -M virt-2.8/virt,accel=tcg -cpu cortex-a57,pmu=off NO     NO
> >   -M virt-2.8/virt,accel=tcg -cpu cortex-a57,pmu=on  NO     "No KVM"
> >   -M virt-2.7,accel=tcg -cpu cortex-a57              NO     NO
> >   -M virt-2.7,accel=tcg -cpu cortex-a57,pmu=off      NO     NO
> >   -M virt-2.7,accel=tcg -cpu cortex-a57,pmu=on       NO     "No KVM"
> >   -M virt-2.6,accel=tcg -cpu cortex-a57              NO     NO
> >   -M virt-2.6,accel=tcg -cpu cortex-a57,pmu=off      NO     NO
> >   -M virt-2.6,accel=tcg -cpu cortex-a57,pmu=on       NO     "No KVM"
> 
> This patchset doesn't actually change whether the pmu is present
> or not under TCG so this is all a little bit odd.

The goal here is to allow the property on the command line, i.e. not
error and fail, when using tcg. Otherwise more than just s/kvm/tcg/
would be required when switching, and accel=kvm:tcg wouldn't work either.

> 
> >   -M virt-2.8/virt,accel=tcg -cpu cortex-a15         NO     NO
> >   -M virt-2.8/virt,accel=tcg -cpu cortex-a15,pmu=off NO     "No PMU property"
> >   -M virt-2.8/virt,accel=tcg -cpu cortex-a15,pmu=on  NO     "No PMU property"
> >   -M virt-2.7,accel=tcg -cpu cortex-a15              NO     NO
> >   -M virt-2.7,accel=tcg -cpu cortex-a15,pmu=off      NO     "No PMU property"
> >   -M virt-2.7,accel=tcg -cpu cortex-a15,pmu=on       NO     "No PMU property"
> >   -M virt-2.6,accel=tcg -cpu cortex-a15              NO     NO
> >   -M virt-2.6,accel=tcg -cpu cortex-a15,pmu=off      NO     "No PMU property"
> >   -M virt-2.6,accel=tcg -cpu cortex-a15,pmu=on       NO     "No PMU property"
> >
> >   * "NO KVM" msg
> >     warning: pmu can't be enabled without KVM acceleration
> >   * "No PMU property" msg
> >     can't apply global cortex-a15-arm-cpu.pmu=off: Property '.pmu' not found
> 
> I'm really not a fan of the tristate has_pmu, so I'm hoping
> there's a setup which lets us avoid it...

Probably keeping PMU on no matter what for 2.7 and down will allow
the removal of the tristate.

Thanks,
drew
