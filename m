Received: by 10.25.159.19 with SMTP id i19csp974293lfe;
        Fri, 5 Feb 2016 03:01:12 -0800 (PST)
X-Received: by 10.55.75.144 with SMTP id y138mr15541719qka.96.1454670072203;
        Fri, 05 Feb 2016 03:01:12 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id 1si15342855qkv.22.2016.02.05.03.01.11;
        Fri, 05 Feb 2016 03:01:12 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id BC7AE495BD;
	Fri,  5 Feb 2016 05:55:38 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.201
X-Spam-Level: 
X-Spam-Status: No, score=-4.201 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5] autolearn=unavailable
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C1jkhdMhiFpH; Fri,  5 Feb 2016 05:55:36 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 968CA49616;
	Fri,  5 Feb 2016 05:55:36 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 1B45449616
 for <kvmarm@lists.cs.columbia.edu>; Fri,  5 Feb 2016 05:55:35 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x5TSybEtRNxU for <kvmarm@lists.cs.columbia.edu>;
 Fri,  5 Feb 2016 05:55:32 -0500 (EST)
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id B3C99495BD
 for <kvmarm@lists.cs.columbia.edu>; Fri,  5 Feb 2016 05:55:32 -0500 (EST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B4843A1;
 Fri,  5 Feb 2016 03:00:19 -0800 (PST)
Received: from leverpostej (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 40A823F213;
 Fri,  5 Feb 2016 03:01:03 -0800 (PST)
Date: Fri, 5 Feb 2016 11:00:33 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: MPIDR Aff0 question
Message-ID: <20160205110032.GA19614@leverpostej>
References: <20160204183801.GF3890@hawk.localdomain> <56B39D9A.7000008@arm.com>
 <20160205092353.GA3873@hawk.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20160205092353.GA3873@hawk.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Marc Zyngier <marc.zyngier@arm.com>, andre.przywara@arm.com,
 qemu-arm@nongnu.org, kvmarm@lists.cs.columbia.edu
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
X-TUID: ZaUbNnDaJ+kz

On Fri, Feb 05, 2016 at 10:23:53AM +0100, Andrew Jones wrote:
> On Thu, Feb 04, 2016 at 06:51:06PM +0000, Marc Zyngier wrote:
 > What would the benefit of defining a "socket"?
> 
> That's a good lead in for my next question. While I don't believe
> there needs to be any relationship between socket and numa node, I
> suspect on real machines there is, and quite possibly socket == node.
> Shannon is adding numa support to QEMU right now. Without special
> configuration there's no gain other than illusion, but with pinning,
> etc. the guest numa nodes will map to host nodes, and thus passing
> that information on to the guest's kernel is useful. Populating a
> socket/node affinity field seems to me like a needed step. But,
> question time, is it? Maybe not. 

I don't think it's necessary.

When using ACPI, NUMA info comes from SRAT+SLIT, and the MPIDR.Aff*
fields do not provide NUMA topology info. I expect the same to be true
with DT using something like numa-distance-map [1].

> Also, the way Linux currently handles non-thread using MPIDRs
> (Aff1:socket, Aff0:core) throws a wrench at the Aff2:socket,
> Aff1:"cluster", Aff0:core(max 16) plan.  Either the plan or Linux
> would need to be changed.

The topology can be explicitly overridden in DT using cpu-map [2]. I
don't know what the story for ACPI is.

Mark.

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2016-February/404057.html
[2] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/arm/topology.txt?h=v4.5-rc2&id=36f90b0a2ddd60823fe193a85e60ff1906c2a9b3
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
