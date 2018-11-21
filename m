Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1950414wrt;
        Wed, 21 Nov 2018 06:39:06 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X9jp7uC16/g2goze+N3bFoUhY4PimPHEJ/gvFaWepT4HBZ+jfUqt28VukULDD6sbjh1ohk
X-Received: by 2002:a5b:412:: with SMTP id m18-v6mr6524013ybp.132.1542811146268;
        Wed, 21 Nov 2018 06:39:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542811146; cv=none;
        d=google.com; s=arc-20160816;
        b=slk5b8Wiq3Fx3EfwgRSv6CI6o5fzCaye+QWmONEqavVOibLfs+/RdYyF3Os3iPm3nT
         XLMTvqDsjX/wLDuBPJ2kZUIC46sQBkMhi2YmKleRcmrGBS7EN0B/R9N3V7DBzMnjGgrh
         iHNuRwCP50Rr61Y1d3vP11hhUhi6pijqYtq8rNbkbVsqsWmA2iv0lNIvjp5GrYx6kNiP
         PCIMMdHtBPkGK9nNByrFC4A/t6Avzg0v9Qljf2euae4jlc35mS+gA2T+rz0NUEpNpsOw
         Rl9618c2L6eCbGkabqiVsMxpkwbX2Z1B0zqfHJIXF48HQA6tcTL4gaWV8c6Qes0IbvzJ
         JRCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=G9w2wsDqbpLj/fgNlV1c1bG4FRLBfTijgyhGSNIINFk=;
        b=NjpqjQupCKBaCLqPcMtNLofA8RzNnMpWUQTSDvSO4ytxnga5rgMuQxbbLDpLZhDSHE
         nd8ScJBI9UCFuHNf8O9lsSWxTK3GBNHFCvKg1rSkrmioO7YlrDXwsVoc7ke5nI1kDzwm
         /OhuG7FxNytmva+kDdtu8z7+JXvDbRq1HO1eqWA0baVI0q8y7nom3VF4MnfWUTjNlsfJ
         P4RQa9csnAUA09eykyGJzoFa448crg6Sf5v0oU8LbYdHHh+l2ut16x5vYfDww8OSfp+W
         lCHBuDVtfb/yg9xyXMiIYq3GzqkvhbUuyynbht3P5PilERSrZA9mA4h4iGDEIPZ574fc
         nfEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r9-v6si28513731ywc.21.2018.11.21.06.39.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Nov 2018 06:39:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:39517 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPTej-0006rf-Om
	for alex.bennee@linaro.org; Wed, 21 Nov 2018 09:39:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60044)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gPTec-0006rT-JF
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 09:38:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gPTeY-0005P8-L8
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 09:38:58 -0500
Received: from mga03.intel.com ([134.134.136.65]:5151)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gPTeY-0005OH-D9; Wed, 21 Nov 2018 09:38:54 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Nov 2018 06:38:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,261,1539673200"; d="scan'208";a="93814622"
Received: from tterrive-mobl2.ger.corp.intel.com (HELO caravaggio)
	([10.252.4.181])
	by orsmga008.jf.intel.com with ESMTP; 21 Nov 2018 06:38:49 -0800
Date: Wed, 21 Nov 2018 15:38:16 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20181121143816.GD4426@caravaggio>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181116172919.43f3e27d@redhat.com>
	<d4f6f0ef-1333-a917-e3eb-d9bad47c9648@redhat.com>
	<20181119163110.2f357f40@redhat.com>
	<20181121072954-mutt-send-email-mst@kernel.org>
	<20181121151526.5785b43f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181121151526.5785b43f@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 00/24] ACPI reorganization
 for hardware-reduced API addition
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yC7MExs3gthX

Igor,

On Wed, Nov 21, 2018 at 03:15:26PM +0100, Igor Mammedov wrote:
> On Wed, 21 Nov 2018 07:35:47 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Mon, Nov 19, 2018 at 04:31:10PM +0100, Igor Mammedov wrote:
> > > On Fri, 16 Nov 2018 17:37:54 +0100
> > > Paolo Bonzini <pbonzini@redhat.com> wrote:
> > >   
> > > > On 16/11/18 17:29, Igor Mammedov wrote:  
> > > > > General suggestions for this series:
> > > > >   1. Preferably don't do multiple changes within a patch
> > > > >      neither post huge patches (unless it's pure code movement).
> > > > >      (it's easy to squash patches later it necessary)
> > > > >   2. Start small, pick a table generalize it and send as
> > > > >      one small patchset. Tables are often independent
> > > > >      and it's much easier on both author/reviewer to agree upon
> > > > >      changes and rewrite it if necessary.    
> > > > 
> > > > How would that be done?  This series is on the bigger side, agreed, but
> > > > most of it is really just code movement.  It's a starting point, having
> > > > a generic ACPI library is way beyond what this is trying to do.  
> > > I've tried to give suggestions how to restructure series
> > > on per patch basis. In my opinion it quite possible to split
> > > series in several smaller ones and it should really help with
> > > making series cleaner and easier/faster to review/amend/merge
> > > vs what we have in v5.
> > > (it's more frustrating to rework large series vs smaller one)
> > > 
> > > If something isn't clear, it's easy to reach out to me here
> > > or directly (email/irc/github) for clarification/feed back.  
> > 
> > I assume the #1 goal is to add reduced HW support.  So another
> > option to speed up merging is to just go ahead and duplicate a
> > bunch of code e.g. in pc_virt.c acpi/reduced.c or in any other
> > file.
> > This way it might be easier to see what's common code and what isn't.
> > And I think offline Igor said he might prefer that way. Right Igor?
> You mean probably 'x86 reduced hw' support. That's was what I've
> already suggested for PCI AML code during patch review. Just don't
> call it generic when it's not and place code in hw/i386/ directory beside
> acpi-build.c. It might apply to some other tables (i.e. complex cases).
> 
> On per patch review I gave suggestions how to amend series to make
> it acceptable without doing complex refactoring and pointed out
> places we probably shouldn't refactor now and just duplicate as
> it's too complex or not clear how to generalize it yet.
> 
> Problem with duplication is that a random contributor is not
> around to clean code up after a feature is merged and we end up
> with a bunch of messy code.
> 
> A word to the contributors,
> Don't do refactoring in silence, keep discussing approaches here,
> suggest alternatives. That way it's easier to reach a compromise
> and merge it with less iterations. And if you do split it in smaller
> parts, the process should go even faster.
> 
> I'll sent a small RSDP refactoring series for reference.
I was already working on the RSDP changes. Let me know if I should drop
that work too.

Cheers,
Samuel.
