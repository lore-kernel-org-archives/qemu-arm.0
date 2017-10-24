Received: by 10.223.161.27 with SMTP id o27csp433278wro;
        Tue, 24 Oct 2017 03:20:44 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+T8byIzZxye6UleLGVUn5PiCjBj/n0UWkjmRIoKOHq7/InPgwH7ofy3theOnANT2kUQCChO
X-Received: by 10.129.121.77 with SMTP id u74mr10195388ywc.75.1508840444890;
        Tue, 24 Oct 2017 03:20:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508840444; cv=none;
        d=google.com; s=arc-20160816;
        b=Eg84LjndVZWGjG53erStPyCPL2PQrkATknw0AFLnosCscy9FfKef9mGpsyaXtcvGaY
         ekDQxhiWlDNvKBh2YCz4p0llgw6PPTURDqcZ2iTO9gxBiz94YE5YcQ8n+q8YTy4kq1F8
         UoKHX0LkLjTSZAA4LzcZsZZfvfD+HEa4xtAea31QIIXWiMoZuhf3g9vkweTev1aFu8Wa
         YvQNFcCEXMk7RpBx+3+uY9t+g8FB9AuIMPHthzswipxphydvHhiUGT2mlN729HmZ80fE
         Q+h55gBFzcLuYISzeE7+MsrvjFfJDFfBbkLbgmCcCCs1/LfUZoWzyEQ9yVSd4Xb9SMC4
         3m7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=SzJU2eiY3OvvDSyOWMGi3psBkbiu+BfNEiIXfl5ACtA=;
        b=gsuVoqEsPXzRAdISCznSw3ddAgOTn5UgoDj0I5SGw/eekoVZmGNYXTrkht669sTkcm
         uqRJOVljproWltOQOr6uyyrPynJOFb6eU2SES3GdlRHQfILNwFTyOpbqa6gFHaiXV+oq
         ABz0hRFxiSkm+Quj0zV0cp84tpSzJ1OuE5xqAyataQCjcTiAyfnMLlp2rQJyEsDVQhV4
         YLw/L8IQ6XTVYAriui2J6f9yzrwsyaTnd7u89wWmDXxGHNbciBAjps2BtAi3JGUH8yb2
         o4fyzqnC07v9mK5N+eDKIwer76adZGOf31ePBTaI2YU38KEBJimiKg1yp3VBXytyi3KC
         Ee5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n2si1449414ywi.27.2017.10.24.03.20.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Oct 2017 03:20:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43021 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6wKC-0005iN-CI
	for alex.bennee@linaro.org; Tue, 24 Oct 2017 06:20:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46051)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <will.deacon@arm.com>) id 1e6wK4-0005hy-LF
	for qemu-arm@nongnu.org; Tue, 24 Oct 2017 06:20:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <will.deacon@arm.com>) id 1e6wK0-0005jn-KJ
	for qemu-arm@nongnu.org; Tue, 24 Oct 2017 06:20:36 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:60436
	helo=foss.arm.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <will.deacon@arm.com>)
	id 1e6wK0-0005il-Cr; Tue, 24 Oct 2017 06:20:32 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75E4780D;
	Tue, 24 Oct 2017 03:20:29 -0700 (PDT)
Received: from edgewater-inn.cambridge.arm.com
	(usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 45ACF3F25D; 
	Tue, 24 Oct 2017 03:20:29 -0700 (PDT)
Received: by edgewater-inn.cambridge.arm.com (Postfix, from userid 1000)
	id CB7711AE319C; Tue, 24 Oct 2017 11:20:29 +0100 (BST)
Date: Tue, 24 Oct 2017 11:20:29 +0100
From: Will Deacon <will.deacon@arm.com>
To: Linu Cherian <linuc.decode@gmail.com>
Message-ID: <20171024102029.GE17909@arm.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<20171024053802.GA22835@virtx40>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171024053802.GA22835@virtx40>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-arm] [PATCH v7 00/20] ARM SMMUv3 Emulation Support
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mohun106@gmail.com, jean-philippe.brucker@arm.com,
	tn@semihalf.com, bharat.bhushan@nxp.com, mst@redhat.com,
	qemu-devel@nongnu.org, peterx@redhat.com,
	Eric Auger <eric.auger@redhat.com>, alex.williamson@redhat.com,
	qemu-arm@nongnu.org, christoffer.dall@linaro.org,
	wtownsen@redhat.com, robin.murphy@arm.com,
	prem.mallappa@gmail.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PVAdSewlJjKM

On Tue, Oct 24, 2017 at 11:08:02AM +0530, Linu Cherian wrote:
> On Fri Sep 01, 2017 at 07:21:03PM +0200, Eric Auger wrote:
> > This series implements the emulation code for ARM SMMUv3.
> > 
> > Changes since v6:
> > - DPDK testpmd now running on guest with 2 assigned VFs
> > - Changed the instantiation method: add the following option to
> >   the QEMU command line
> >   -device smmuv3 # for virtio/vhost use cases
> >   -device smmuv3,caching-mode # for vfio use cases (based on [1])
> > - splitted the series into smaller patches to allow the review
> > - the VFIO integration based on "tlbi-on-map" smmuv3 driver
> >   is isolated from the rest: last 2 patches, not for upstream.
> >   This is shipped for testing/bench until a better solution is found.
> > - Reworked permission flag checks and event generation
> > 
> > testing:
> > - in dt and ACPI modes
> > - virtio-net-pci and vhost-net devices using dma ops with various
> >   guest page sizes [2]
> > - assigned VFs using dma ops [3]:
> >   - AMD Overdrive and igbvf passthrough (using gsi direct mapping)
> >   - Cavium ThunderX and ixgbevf passthrough (using KVM MSI routing)
> > - DPDK testpmd on guest running with VFIO user space drivers (2 igbvf) [3]
> >   with guest and host page size equal (4kB)
> > 
> > Known limitations:
> > - no VMSAv8-32 suport
> > - no nested stage support (S1 + S2)
> > - no support for HYP mappings
> > - register fine emulation, commands, interrupts and errors were
> >   not accurately tested. Handling is sufficient to run use cases
> >   described above though.
> > - interrupts and event generation not observed yet.
> > 
> > Best Regards
> > 
> > Eric
> >
> 
> Was looking at options to get rid of the existing hacks we have
> in this implementation (last two patches) and also to reduce the map/unmap/translation 
> overhead for the guest kernel devices.
> 
> Interestingly, the nested stage translation + smmu emulation at kernel
>  that we were exploring, has been already tried by Will Deacon. 
> https://www.linuxplumbersconf.org/2014/ocw/system/presentations/2019/original/vsmmu-lpc14.pdf
> https://lists.gnu.org/archive/html/qemu-devel/2015-06/msg03379.html
> 
> 
> It would be nice to understand, why this solution was not pursued atleast for vfio-pci devices.
> OR
> If you have already plans to do nested stage support in the future, would be interested to know 
> about it.

I don't plan to revive that code. I got something well on the way to working
for SMMUv2, but it had some pretty major issues:

1. A huge amount of emulation code in the kernel
2. A horribly complicated user ABI
3. Keeping track of internal hardware caching state was a nightmare, so
   over-invalidation was rife
4. Errata workarounds meant trapping all SMMU accesses (inc. for stage 1)
5. I remember having issues with interrupts, but this was likely
   SMMUv2-specific
6. There was no scope for code re-use with other SMMU implementations (e.g.
   SMMUv3)

Overall, it was just an unmaintainable, non-performant
security-flaw-waiting-to-happen so I parked it. That's some of the
background behind me preferring a virtio-iommu approach, because there's
the potential for kernel acceleration using something like vhost.

Will
