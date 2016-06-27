Received: by 10.25.21.96 with SMTP id l93csp1000379lfi;
        Mon, 27 Jun 2016 01:32:22 -0700 (PDT)
X-Received: by 10.200.47.156 with SMTP id l28mr22070215qta.20.1467016342039;
        Mon, 27 Jun 2016 01:32:22 -0700 (PDT)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id a3si16080278qkc.229.2016.06.27.01.32.21;
        Mon, 27 Jun 2016 01:32:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 5535349B3F;
	Mon, 27 Jun 2016 04:27:14 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.202
X-Spam-Level: 
X-Spam-Status: No, score=-4.202 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5, SPF_HELO_PASS=-0.001]
	autolearn=unavailable
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FJWijXUmUOdP; Mon, 27 Jun 2016 04:27:13 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 4D72249B2E;
	Mon, 27 Jun 2016 04:27:13 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id AA57E412D0
 for <kvmarm@lists.cs.columbia.edu>; Mon, 27 Jun 2016 04:27:12 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Ge9pINaYmoA for <kvmarm@lists.cs.columbia.edu>;
 Mon, 27 Jun 2016 04:27:11 -0400 (EDT)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 42034411E3
 for <kvmarm@lists.cs.columbia.edu>; Mon, 27 Jun 2016 04:27:11 -0400 (EDT)
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
 (int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 865A16438E;
 Mon, 27 Jun 2016 08:32:17 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-79.brq.redhat.com [10.40.204.79])
 by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id
 u5R8WDGB016999
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 27 Jun 2016 04:32:15 -0400
Date: Mon, 27 Jun 2016 10:32:12 +0200
From: Andrew Jones <drjones@redhat.com>
To: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [Qemu-devel] [PATCH] hw/arm/virt: gicv3: use all target-list bits
Message-ID: <20160627083212.jyanolgait7yrzs6@hawk.localdomain>
References: <1466535515-18092-1-git-send-email-drjones@redhat.com>
 <CAFEAcA-56LUe_jYK=V-H890WVL12YuDeRSZn9FK3yReiJ4p2Hw@mail.gmail.com>
 <20160624160321.nvn5run4kmywk7kc@hawk.localdomain>
 <20160624161513.zgqxspxhdre3d67c@hawk.localdomain>
 <CAFEAcA8xQV3PJ7BgFa=ohYDGqyVEtQ9bssoB+0JkGaGJqtaK=w@mail.gmail.com>
 <20160624172223.gxbd7nsna6spflxt@hawk.localdomain>
 <CAFEAcA9o57GET+mWOfrVhdRo=5a1w-AJeRPwssmJG1BcD4Ag8Q@mail.gmail.com>
 <20160627064154.h3npws4voswo3z7d@hawk.localdomain>
 <5770DB0F.8050203@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5770DB0F.8050203@arm.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 27 Jun 2016 08:32:17 +0000 (UTC)
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 kvmarm@lists.cs.columbia.edu
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: OCdz9ITN06ji

On Mon, Jun 27, 2016 at 08:51:43AM +0100, Marc Zyngier wrote:
> On 27/06/16 07:41, Andrew Jones wrote:
> > On Fri, Jun 24, 2016 at 06:27:20PM +0100, Peter Maydell wrote:
> >> On 24 June 2016 at 18:22, Andrew Jones <drjones@redhat.com> wrote:
> >>> On Fri, Jun 24, 2016 at 05:41:55PM +0100, Peter Maydell wrote:
> >>>> KVM AArch32 is 4 CPUs per cluster:
> >>>> http://lxr.free-electrons.com/source/arch/arm/kvm/coproc.c#L109
> >>>
> >>> Hmm... yes, it should use coproc.c, but here's what I get when I
> >>> test
> >>>
> >>> qemu-system-aarch64 \
> >>>   -machine virt,gic-version=2,accel=kvm \
> >>>   -cpu host,aarch64=off \
> >>>   -device virtio-serial-device \
> >>>   -device virtconsole,chardev=ctd \
> >>>   -chardev testdev,id=ctd \
> >>>   -display none -serial stdio \
> >>>   -kernel arm/selftest.flat \
> >>>   -append smp -smp 8
> >>
> >> This suggests that 32-bit-guest-on-64-bit-host and
> >> 32-bit-guest-on-32-bit-host differ...
> > 
> > Yes, this is the case. I just looked at KVM and, it shouldn't use coproc.c
> > (that's not one of the shared files between 32 and 64 bit hosts), and
> > there's no special handing in reset_mpidr for KVM_ARM_VCPU_EL1_32BIT.
> > The only special handing is in handlers for trapped coproc accesses,
> > which MPIDR is not.
> > 
> > I think it makes sense that the 32bit guest view be consistent. This
> > means we need one of two patches in KVM. Either
> > 
> >  a) decide we don't need to emulate clusters of 4, and just use the
> >     max the gic supports, or
> >  b) modify arm64's reset_mpidr to change behavior based on
> >     KVM_ARM_VCPU_EL1_32BIT.
> > 
> > If the clusters of 4 thing is a hard requirement, then we should go
> > that way. If not, as it doesn't seem to break guests today (aarch64=off
> > and tcg guests have never done it) then I say we stop doing it on 32bit
> > hosts too, as it will increase SGI efficiency.
> 
> I've never been fond of the 32bit behaviour, to be honest, and I'd
> rather stick to the default being to max Aff0 on 64bit hosts (and before
> anyone asks, yes, GICv3 support is coming to 32bit as well).

OK

> 
> What I think we should have though is a way for userspace to override
> the defaults presented by KVM. That way, 64bit userspace can enforce 4
> CPU clusters if it sees fit.

OK, so it sounds like you'd rather not get any KVM patches now, but rather
just wait for userspace to take control. That means, in the case of non-
userspace MPIDR controlled systems, we'll still have a difference between
32-on-64 and 32-on-32.

Anyway, userspace controlled MPIDR is definitely the goal. I'm sneaking up
on it. In order to justify it, I also need to add cpu topology support to
mach-virt. In order to do that, I need to 1) cleanup cpu topology
parameters in QEMU (RFC posted), 2) write the DT and ACPI generation
patches (written, will post soon), 3) determine how to inform KVM of the
desired MPIDR (set-one-reg or maybe change the vcpu-id to be the MPIDR?)
4) adjust the MPIDR.

The patch that spurred this immediate discussion is loosely related to
(4), as it starts adjusting MPIDR (but, atm, it's just to be consistent
with KVM)

Thanks,
drew
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
