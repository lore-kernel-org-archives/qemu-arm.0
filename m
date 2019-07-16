Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp656516wrv;
        Tue, 16 Jul 2019 01:30:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx9B9l4b3+92N9SQAHoUAACZYdApt+bjVx++2sPrjSv+r5DzaPBQ2isS7D21b7EIBQtVEOA
X-Received: by 2002:a37:48d8:: with SMTP id v207mr19174116qka.316.1563265858458;
        Tue, 16 Jul 2019 01:30:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563265858; cv=none;
        d=google.com; s=arc-20160816;
        b=DpR6YicB/lI9sejnlezx1jvBcwVXPpQQL8cFeOcRsZw5n8OSTNSe/W4E4KPVah3gsx
         Ox9kYO+uiFp617zlut3jU0Evo8rrB5dobW4XBDoGmeTUJAZrRTKdTdA4njRiBlXBPP09
         a0HONems+C8L1b3ztC31R6WgPRLcoQ4NQ5VruNfzYP/UGJU4JvkioaIFMfJ14u/BsgIt
         jy6jfIxjRn33FiUe6JD3/HriIs7N1reRcWl2hpqx+Xlr+oqizXwLQJFMlCzdhSgsCKaY
         Lxr/i3HgvdENruPlS86KEHHHfqyD9jxsn1GC3znCp1/mvUH/XhTHdmATMdSdLQSB6mYu
         NgOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date;
        bh=09i99GothlE6DdHMkadijpj9QrCGa4ck+Uqnfy21z3g=;
        b=dnzTgfnQ22rl3nPFl1dcTPdDTWu0TU9UVPO3aaovdv1X0+xYkZszAJsyFcrzVGMCy6
         Gk6H6xap8FWoy/pjb452GnoAC8hzuu9uZYBDzTsSoefLhZ5RDdXEpoDBaXek3LhTbH+W
         89i1ih40FEdYb9o4BiSEfTFpUSgpxCt33M6fGjSlcstytGHaxVHqhI1OGHe8IJDc4LGo
         xKVIPMhewmpI2FynG8NcNAUz1PkaT/M8QONUK1UgzQZCOIlbNY2JiwR6dfe/gpmXLdJ0
         7wGfQoRdWsGFzKrgm3MuZ9RWXwYiu7XRKmj3SAEuEtpn0H/b90aKcF9n/gDJcOCwIh+0
         G7EA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id 32si14514288qvj.16.2019.07.16.01.30.58;
        Tue, 16 Jul 2019 01:30:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 179DD4A53A;
	Tue, 16 Jul 2019 04:30:58 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.799
X-Spam-Level: 
X-Spam-Status: No, score=0.799 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UPUFH7nFLTj4; Tue, 16 Jul 2019 04:30:57 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id F2B524A4F3;
	Tue, 16 Jul 2019 04:30:56 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id AFBD84A4F3
 for <kvmarm@lists.cs.columbia.edu>; Tue, 16 Jul 2019 04:30:55 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KLUjs5Mnok03 for <kvmarm@lists.cs.columbia.edu>;
 Tue, 16 Jul 2019 04:30:54 -0400 (EDT)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 608064A4E9
 for <kvmarm@lists.cs.columbia.edu>; Tue, 16 Jul 2019 04:30:54 -0400 (EDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F095B2B;
 Tue, 16 Jul 2019 01:30:53 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC4B03F59C;
 Tue, 16 Jul 2019 01:30:52 -0700 (PDT)
Date: Tue, 16 Jul 2019 09:30:50 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC] Add virtual SDEI support in qemu
Message-ID: <20190716083050.GK2790@e103592.cambridge.arm.com>
References: <1b0aa6b2-80b1-a72e-6849-7323c3b9c6bc@huawei.com>
 <20190715134059.GJ2790@e103592.cambridge.arm.com>
 <20190715134848.GI56232@lakrids.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190715134848.GI56232@lakrids.cambridge.arm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Marc Zyngier <marc.zyngier@arm.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Guoheyi <guoheyi@huawei.com>,
 kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
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
X-TUID: StLvEv262cBM

On Mon, Jul 15, 2019 at 02:48:49PM +0100, Mark Rutland wrote:
> On Mon, Jul 15, 2019 at 02:41:00PM +0100, Dave Martin wrote:

[...]

> > So long as KVM_EXIT_HYPERCALL reports sufficient information so that
> > userspace can identify the cause as an SMC and retrieve the SMC
> > immediate field, this seems feasible.
> > 
> > For its own SMCCC APIs, KVM exclusively uses HVC, so rerouting SMC to
> > userspace shouldn't conflict.
> 
> Be _very_ careful here! In systems without EL3 (and without NV), SMC
> UNDEFs rather than trapping to EL2. Given that, we shouldn't build a
> hypervisor ABI that depends on SMC.

Good point.  I was hoping that was all ancient history by now, but if
not...

[...]

Cheers
---Dave
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
