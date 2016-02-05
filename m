Received: by 10.25.159.19 with SMTP id i19csp1005192lfe;
        Fri, 5 Feb 2016 04:09:01 -0800 (PST)
X-Received: by 10.140.147.11 with SMTP id 11mr16987907qht.93.1454674141360;
        Fri, 05 Feb 2016 04:09:01 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id b18si6435861qka.112.2016.02.05.04.09.01;
        Fri, 05 Feb 2016 04:09:01 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 4002E4972F;
	Fri,  5 Feb 2016 07:03:28 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.202
X-Spam-Level: 
X-Spam-Status: No, score=-4.202 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5, SPF_HELO_PASS=-0.001]
	autolearn=unavailable
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SIp2RRFssR5D; Fri,  5 Feb 2016 07:03:26 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 0BB23496E4;
	Fri,  5 Feb 2016 07:03:26 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 5CB3A49680
 for <kvmarm@lists.cs.columbia.edu>; Fri,  5 Feb 2016 07:03:24 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H0HByTj9nTvJ for <kvmarm@lists.cs.columbia.edu>;
 Fri,  5 Feb 2016 07:03:23 -0500 (EST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 75B5E49616
 for <kvmarm@lists.cs.columbia.edu>; Fri,  5 Feb 2016 07:03:22 -0500 (EST)
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
 (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
 by mx1.redhat.com (Postfix) with ESMTPS id C99598E921;
 Fri,  5 Feb 2016 12:08:54 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-158.brq.redhat.com [10.34.1.158])
 by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id
 u15C8oYY012701
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 5 Feb 2016 07:08:53 -0500
Date: Fri, 5 Feb 2016 13:08:50 +0100
From: Andrew Jones <drjones@redhat.com>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: MPIDR Aff0 question
Message-ID: <20160205120850.GE3873@hawk.localdomain>
References: <20160204183801.GF3890@hawk.localdomain> <56B39D9A.7000008@arm.com>
 <20160205092353.GA3873@hawk.localdomain>
 <20160205110032.GA19614@leverpostej>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20160205110032.GA19614@leverpostej>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
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
X-TUID: 97hlb41GEVS+

On Fri, Feb 05, 2016 at 11:00:33AM +0000, Mark Rutland wrote:
> On Fri, Feb 05, 2016 at 10:23:53AM +0100, Andrew Jones wrote:
> > On Thu, Feb 04, 2016 at 06:51:06PM +0000, Marc Zyngier wrote:
>  > What would the benefit of defining a "socket"?
> > 
> > That's a good lead in for my next question. While I don't believe
> > there needs to be any relationship between socket and numa node, I
> > suspect on real machines there is, and quite possibly socket == node.
> > Shannon is adding numa support to QEMU right now. Without special
> > configuration there's no gain other than illusion, but with pinning,
> > etc. the guest numa nodes will map to host nodes, and thus passing
> > that information on to the guest's kernel is useful. Populating a
> > socket/node affinity field seems to me like a needed step. But,
> > question time, is it? Maybe not. 
> 
> I don't think it's necessary.
> 
> When using ACPI, NUMA info comes from SRAT+SLIT, and the MPIDR.Aff*
> fields do not provide NUMA topology info. I expect the same to be true
> with DT using something like numa-distance-map [1].

Thanks Mark. So it appears my NUMA connection was just muddying the
water. Modeling sockets may or may not have any value to a guest,
but in any case it's a separate issue.

> 
> > Also, the way Linux currently handles non-thread using MPIDRs
> > (Aff1:socket, Aff0:core) throws a wrench at the Aff2:socket,
> > Aff1:"cluster", Aff0:core(max 16) plan.  Either the plan or Linux
> > would need to be changed.
> 
> The topology can be explicitly overridden in DT using cpu-map [2]. I
> don't know what the story for ACPI is.

Thanks for the cpu-map pointer. That was indeed the piece I'd missed
that allows me to make sense of MPIDR affinity level use. I think I'll
still look into modeling sockets/cores/threads with QEMU, by also
adding cpu-map generation. I'll look into what the ACPI equivalent is
as well.

drew

> 
> Mark.
> 
> [1] http://lists.infradead.org/pipermail/linux-arm-kernel/2016-February/404057.html
> [2] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/arm/topology.txt?h=v4.5-rc2&id=36f90b0a2ddd60823fe193a85e60ff1906c2a9b3
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
