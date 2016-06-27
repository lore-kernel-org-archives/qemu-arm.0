Received: by 10.25.21.96 with SMTP id l93csp964649lfi;
        Sun, 26 Jun 2016 23:42:04 -0700 (PDT)
X-Received: by 10.200.39.33 with SMTP id g30mr20828604qtg.16.1467009724098;
        Sun, 26 Jun 2016 23:42:04 -0700 (PDT)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id n185si15813298qkc.7.2016.06.26.23.42.03;
        Sun, 26 Jun 2016 23:42:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 8BAE740F9B;
	Mon, 27 Jun 2016 02:36:56 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.202
X-Spam-Level: 
X-Spam-Status: No, score=-4.202 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5, SPF_HELO_PASS=-0.001]
	autolearn=unavailable
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LmCFf5lBdNQl; Mon, 27 Jun 2016 02:36:55 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 840EA412ED;
	Mon, 27 Jun 2016 02:36:55 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id C8E2140FA6
 for <kvmarm@lists.cs.columbia.edu>; Mon, 27 Jun 2016 02:36:54 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5JkJe1INgCKJ for <kvmarm@lists.cs.columbia.edu>;
 Mon, 27 Jun 2016 02:36:53 -0400 (EDT)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 465A240F9B
 for <kvmarm@lists.cs.columbia.edu>; Mon, 27 Jun 2016 02:36:52 -0400 (EDT)
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
 (int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E0D82C049D7F;
 Mon, 27 Jun 2016 06:41:58 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-54.brq.redhat.com [10.40.204.54])
 by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id
 u5R6fsk7009607
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 27 Jun 2016 02:41:56 -0400
Date: Mon, 27 Jun 2016 08:41:54 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-devel] [PATCH] hw/arm/virt: gicv3: use all target-list bits
Message-ID: <20160627064154.h3npws4voswo3z7d@hawk.localdomain>
References: <1466535515-18092-1-git-send-email-drjones@redhat.com>
 <CAFEAcA-56LUe_jYK=V-H890WVL12YuDeRSZn9FK3yReiJ4p2Hw@mail.gmail.com>
 <20160624160321.nvn5run4kmywk7kc@hawk.localdomain>
 <20160624161513.zgqxspxhdre3d67c@hawk.localdomain>
 <CAFEAcA8xQV3PJ7BgFa=ohYDGqyVEtQ9bssoB+0JkGaGJqtaK=w@mail.gmail.com>
 <20160624172223.gxbd7nsna6spflxt@hawk.localdomain>
 <CAFEAcA9o57GET+mWOfrVhdRo=5a1w-AJeRPwssmJG1BcD4Ag8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFEAcA9o57GET+mWOfrVhdRo=5a1w-AJeRPwssmJG1BcD4Ag8Q@mail.gmail.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Mon, 27 Jun 2016 06:41:59 +0000 (UTC)
Cc: marc.zyngier@arm.com, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, kvmarm@lists.cs.columbia.edu
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
X-TUID: H78EnfzcCj2P

On Fri, Jun 24, 2016 at 06:27:20PM +0100, Peter Maydell wrote:
> On 24 June 2016 at 18:22, Andrew Jones <drjones@redhat.com> wrote:
> > On Fri, Jun 24, 2016 at 05:41:55PM +0100, Peter Maydell wrote:
> >> KVM AArch32 is 4 CPUs per cluster:
> >> http://lxr.free-electrons.com/source/arch/arm/kvm/coproc.c#L109
> >
> > Hmm... yes, it should use coproc.c, but here's what I get when I
> > test
> >
> > qemu-system-aarch64 \
> >   -machine virt,gic-version=2,accel=kvm \
> >   -cpu host,aarch64=off \
> >   -device virtio-serial-device \
> >   -device virtconsole,chardev=ctd \
> >   -chardev testdev,id=ctd \
> >   -display none -serial stdio \
> >   -kernel arm/selftest.flat \
> >   -append smp -smp 8
> 
> This suggests that 32-bit-guest-on-64-bit-host and
> 32-bit-guest-on-32-bit-host differ...

Yes, this is the case. I just looked at KVM and, it shouldn't use coproc.c
(that's not one of the shared files between 32 and 64 bit hosts), and
there's no special handing in reset_mpidr for KVM_ARM_VCPU_EL1_32BIT.
The only special handing is in handlers for trapped coproc accesses,
which MPIDR is not.

I think it makes sense that the 32bit guest view be consistent. This
means we need one of two patches in KVM. Either

 a) decide we don't need to emulate clusters of 4, and just use the
    max the gic supports, or
 b) modify arm64's reset_mpidr to change behavior based on
    KVM_ARM_VCPU_EL1_32BIT.

If the clusters of 4 thing is a hard requirement, then we should go
that way. If not, as it doesn't seem to break guests today (aarch64=off
and tcg guests have never done it) then I say we stop doing it on 32bit
hosts too, as it will increase SGI efficiency.

(I've added kvmarm and Chistoffer and Marc to CC)

Thanks,
drew
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
