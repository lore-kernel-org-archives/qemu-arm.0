Received: by 10.25.21.96 with SMTP id l93csp1156074lfi;
        Fri, 24 Jun 2016 10:22:37 -0700 (PDT)
X-Received: by 10.55.142.132 with SMTP id q126mr5879254qkd.81.1466788957872;
        Fri, 24 Jun 2016 10:22:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a133si5595495qkb.166.2016.06.24.10.22.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Jun 2016 10:22:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45124 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGUoP-00071e-4p
	for alex.bennee@linaro.org; Fri, 24 Jun 2016 13:22:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bGUoH-0006nd-M4
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 13:22:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bGUoF-0004vJ-Et
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 13:22:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32870)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bGUoF-0004vD-9M; Fri, 24 Jun 2016 13:22:27 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E54CDCF61A;
	Fri, 24 Jun 2016 17:22:26 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5OHMNFS019282
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 24 Jun 2016 13:22:26 -0400
Date: Fri, 24 Jun 2016 19:22:23 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160624172223.gxbd7nsna6spflxt@hawk.localdomain>
References: <1466535515-18092-1-git-send-email-drjones@redhat.com>
	<CAFEAcA-56LUe_jYK=V-H890WVL12YuDeRSZn9FK3yReiJ4p2Hw@mail.gmail.com>
	<20160624160321.nvn5run4kmywk7kc@hawk.localdomain>
	<20160624161513.zgqxspxhdre3d67c@hawk.localdomain>
	<CAFEAcA8xQV3PJ7BgFa=ohYDGqyVEtQ9bssoB+0JkGaGJqtaK=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8xQV3PJ7BgFa=ohYDGqyVEtQ9bssoB+0JkGaGJqtaK=w@mail.gmail.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 24 Jun 2016 17:22:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt: gicv3: use all
 target-list bits
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e0RopffbpZjF

On Fri, Jun 24, 2016 at 05:41:55PM +0100, Peter Maydell wrote:
> On 24 June 2016 at 17:15, Andrew Jones <drjones@redhat.com> wrote:
> > On Fri, Jun 24, 2016 at 06:03:21PM +0200, Andrew Jones wrote:
> >> So we can either
> >> a) play it safe and always use clusters of 4 for ARM guests, and
> >>    KVM will get "fixed" when we start managing the guest's MPIDR
> >>    from userspace, or
> >> b) use 8 here, as TCG always has, and KVM does for AArch32 guests.
> >>    This might be less safe, but also improves SGI efficiency.
> >
> > Actually AArch32 guests would even use all 16 tlist bits on gicv3, if
> > there was a KVM host available to try it. So the (b) option shouldn't
> > be "use 8" it should be "don't treat 32-bit guests differently"
> 
> KVM AArch32 is 4 CPUs per cluster:
> http://lxr.free-electrons.com/source/arch/arm/kvm/coproc.c#L109

Hmm... yes, it should use coproc.c, but here's what I get when I
test

qemu-system-aarch64 \
  -machine virt,gic-version=2,accel=kvm \
  -cpu host,aarch64=off \
  -device virtio-serial-device \
  -device virtconsole,chardev=ctd \
  -chardev testdev,id=ctd \
  -display none -serial stdio \
  -kernel arm/selftest.flat \
  -append smp -smp 8

PSCI version 0.2
PASS: selftest: smp: PSCI version
PASS: selftest: smp: CPU(  1) mpidr=80000001
PASS: selftest: smp: CPU(  2) mpidr=80000002
PASS: selftest: smp: CPU(  3) mpidr=80000003
PASS: selftest: smp: CPU(  4) mpidr=80000004
PASS: selftest: smp: CPU(  5) mpidr=80000005
PASS: selftest: smp: CPU(  6) mpidr=80000006
PASS: selftest: smp: CPU(  7) mpidr=80000007
PASS: selftest: smp: CPU(  0) mpidr=80000000

SUMMARY: 9 tests

(arm/selftest.flat built from
 https://github.com/rhdrjones/kvm-unit-tests/tree/arm/gic)

Other configurations give the expected mpidrs. I'll look into
it more next week.

Thanks,
drew
