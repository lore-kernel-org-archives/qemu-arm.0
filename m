Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp25910wrt;
        Wed, 21 Nov 2018 16:24:49 -0800 (PST)
X-Google-Smtp-Source: AJdET5ckkVcFZvsebwtAIvdZB5GeRi4I93gCMUgImrUh8QZEZb5nWRxcmcwz8kaXHS5KBkIqhpLo
X-Received: by 2002:a0d:ed82:: with SMTP id w124-v6mr9069554ywe.447.1542846289707;
        Wed, 21 Nov 2018 16:24:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542846289; cv=none;
        d=google.com; s=arc-20160816;
        b=unnjUxrOk5lSidx666I6O+8NiffSUFuMsAkDPPZhxRmX6gN0rJ6eIVpivAati15beh
         ScmS7aiF2zcT8NpFDDdT8vAveGn1ulcpKBuBb2Ntazm2/AhrpKVmPxrGzAmVrFSZvBjV
         GJ4XAWmwY29cn+qUwFJT0CehjfH3EvlyxVDf10qgs1Z8teHazn4wRiXSddhpacWJNIQH
         ZjFJHIamjrv9+vJnWMbMHzygWHjnbT1eOJ4KMyjob+BhdmMoJPWCgRnlLPS680okYmSn
         z0XuD+GfIPKoecQxY6ZbwpkDR41h1wQuGMWfiok56HxkuFmNZu5S7dHhG5FsrQvbtpfF
         9PEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=tZirO+9o+foU0XsbZ+gyN6bN3oXSa+aeztmqwwlcpPo=;
        b=dbRmrOE/6DoaUbcTP9GjoIo9SKq1WJvqce5PksLtB+0UsSptPa5zNzShTVzQQMgdHf
         p4CLjf/aCVBvPekKGJZiMLxJdrtXU7aELlOwgJrur2ynVAqGJWW0spk5djn90m+nSC4o
         WuWWPFaBxWtu29y1Y/uFNQycP4/0FWx48a5EJQIxtdGpjTqYpE+7Cu3AtM/o3gGpWXN3
         USAHF86r9neD7omS5oL0Z5aOPAvsVKhyGkUj3F3ZAijy4A5Dgne/zng9Q9OOcdGHBjeb
         bzIX1ZogyCTdEyIJyyIiTfS2oaCRwuSm61Y9ICINFCI5h512xguZsXC8nGaRL2CVCUXz
         TZig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t33-v6si27658509ybd.337.2018.11.21.16.24.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Nov 2018 16:24:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:43235 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPcnZ-0007gU-93
	for alex.bennee@linaro.org; Wed, 21 Nov 2018 19:24:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56590)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gPcnL-0007TD-7h
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 19:24:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gPchS-0001fV-1S
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 19:18:33 -0500
Received: from mga01.intel.com ([192.55.52.88]:8475)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gPchR-0001X8-L0; Wed, 21 Nov 2018 19:18:29 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Nov 2018 16:18:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,263,1539673200"; d="scan'208";a="110522583"
Received: from slgibson-mobl1.ger.corp.intel.com (HELO caravaggio)
	([10.252.29.202])
	by orsmga002.jf.intel.com with ESMTP; 21 Nov 2018 16:18:23 -0800
Date: Thu, 22 Nov 2018 01:17:50 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20181122001750.GF4450@caravaggio>
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
X-Received-From: 192.55.52.88
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
X-TUID: pLE74AfiwE5F

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
> You mean probably 'x86 reduced hw' support.
That's what this is going to eventually look like, unfortunately.
And there's no technical reasons why we could not have a arch agnostic
hw-reduced support, so this should only be an intermediate step.

> That's was what I've
> already suggested for PCI AML code during patch review. Just don't
> call it generic when it's not and place code in hw/i386/ directory beside
> acpi-build.c. It might apply to some other tables (i.e. complex cases).
> 
> On per patch review I gave suggestions how to amend series to make
> it acceptable without doing complex refactoring and pointed out
> places we probably shouldn't refactor now and just duplicate as
> it's too complex or not clear how to generalize it yet.
I think I got the idea, and I will try to rework this serie according
to these directions.


> Problem with duplication is that a random contributor is not
> around to clean code up after a feature is merged and we end up
> with a bunch of messy code.
I'd argue that the same could be said of a potential "x86 hw-reduced"
solution. The same random contributor may not be around to push it to
the next step and make it more generic. I'd also argue we're not
planning to be random contributors, dropping code to the mailing list
and leaving.


> A word to the contributors,
> Don't do refactoring in silence, keep discussing approaches here,
> suggest alternatives.
Practically speaking, a large chunk of the NEMU work rely on having a
generic hardware-reduced ACPI implementation. We could not have blocked
the project waiting for an upstream acceptable solution for it and we
had to pick one route.
Retroactively I think we should have gone the self-contained, fully
duplicated route and move on with the rest of the NEMU work. Upstream
discussions could have then happened in parallel without much disruption
for the project.

Cheers,
Samuel.

