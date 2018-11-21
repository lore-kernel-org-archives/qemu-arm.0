Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1896515wrt;
        Wed, 21 Nov 2018 05:55:10 -0800 (PST)
X-Google-Smtp-Source: AJdET5cZSWflEbSBkDMrHtJCFcRY6RB47trjsGwzUBjuP6plsJAMuR+bYT5SojgIVkaMpYGBLxxY
X-Received: by 2002:a0d:f883:: with SMTP id i125-v6mr6449348ywf.55.1542808510177;
        Wed, 21 Nov 2018 05:55:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542808510; cv=none;
        d=google.com; s=arc-20160816;
        b=P6q4FnB8tqn9TwAgNgA5V0YL6k+W/qeemUpzNkxTG9jBWuw+imlLzPYHux5dY8/EXb
         EJCtlvQ3NziXtjuu7cXg6CN30BVHFBbS2u9ZGDo3QkC7iu9q0UM3Xm1g7ouzRRZlJmwC
         mtaNgFYgi4YybY49JQk1LqXpnkqHU05R2KcKAZPgqM/7xxLPg1t37TmR4Bd8fk3nXpib
         75zZB37RfVj69wKfvyRQcKXMPTrHm1lW3tJu+ak7+mJtv3LFJZv0XL5nAt4uhDvZ2hz3
         J078AY6N7S39lxTDgXRUrL7QvdfWZuvWgme8n/CxL7+58rTQVNVmdkVj8TqIqltuSH1P
         T9kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=jFf409Y4nNRTE3As3vp+2L+1iqfgkdsnVmTMqeRt0r8=;
        b=TnlmT7tCIFKBhMI390pB5jE5XJYI/IXMjQfGoifIIsT91cu+PFGMzHbmssGHNJbm/8
         knK717lEOQ+TEwAcfUB+eMN/nH+tsdmy0pj2nhdCaULiVDXL5ad5myDiOebaSuyMTqmX
         VBQiWnwfjNUerIml/GQgGlvDlqE4AcK4zNlzijJ4Y6i+UJru6egxCAH9zKe8bawQYIw6
         aGC5KRHUHBliOe+4ivenmSnNTFTMm7BEW7GvFsiv5/z5r1rFnVf9X5UATXZ0Uq9radyx
         z+3gj3kg4gF3V/iv2rbCBb1SfXFY3nlENroouHMIZInDgmrBythR351vrRZPyEn2qEVL
         GgXA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r1-v6si20164335ywg.404.2018.11.21.05.55.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Nov 2018 05:55:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:39256 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPSyD-0006rr-Kk
	for alex.bennee@linaro.org; Wed, 21 Nov 2018 08:55:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41653)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gPSxv-0006ll-9m
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 08:54:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gPSuL-0006Uj-Pg
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 08:51:12 -0500
Received: from mga07.intel.com ([134.134.136.100]:60184)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gPSuL-0006T6-GL; Wed, 21 Nov 2018 08:51:09 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Nov 2018 05:51:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,261,1539673200"; d="scan'208";a="91047352"
Received: from tterrive-mobl2.ger.corp.intel.com (HELO caravaggio)
	([10.252.4.181])
	by orsmga007.jf.intel.com with ESMTP; 21 Nov 2018 05:51:02 -0800
Date: Wed, 21 Nov 2018 14:50:30 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20181121135030.GC4426@caravaggio>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181116172919.43f3e27d@redhat.com>
	<d4f6f0ef-1333-a917-e3eb-d9bad47c9648@redhat.com>
	<20181119163110.2f357f40@redhat.com>
	<20181121072954-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181121072954-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.100
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
	Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HY2bGxGa6AhT

Hi Michael,

On Wed, Nov 21, 2018 at 07:35:47AM -0500, Michael S. Tsirkin wrote:
> On Mon, Nov 19, 2018 at 04:31:10PM +0100, Igor Mammedov wrote:
> > On Fri, 16 Nov 2018 17:37:54 +0100
> > Paolo Bonzini <pbonzini@redhat.com> wrote:
> > 
> > > On 16/11/18 17:29, Igor Mammedov wrote:
> > > > General suggestions for this series:
> > > >   1. Preferably don't do multiple changes within a patch
> > > >      neither post huge patches (unless it's pure code movement).
> > > >      (it's easy to squash patches later it necessary)
> > > >   2. Start small, pick a table generalize it and send as
> > > >      one small patchset. Tables are often independent
> > > >      and it's much easier on both author/reviewer to agree upon
> > > >      changes and rewrite it if necessary.  
> > > 
> > > How would that be done?  This series is on the bigger side, agreed, but
> > > most of it is really just code movement.  It's a starting point, having
> > > a generic ACPI library is way beyond what this is trying to do.
> > I've tried to give suggestions how to restructure series
> > on per patch basis. In my opinion it quite possible to split
> > series in several smaller ones and it should really help with
> > making series cleaner and easier/faster to review/amend/merge
> > vs what we have in v5.
> > (it's more frustrating to rework large series vs smaller one)
> > 
> > If something isn't clear, it's easy to reach out to me here
> > or directly (email/irc/github) for clarification/feed back.
> 
> I assume the #1 goal is to add reduced HW support.
From our perspective, yes. From the project's point of view, it's about
making the current ACPI code more generic and not bound to any specific
machine type.

> So another
> option to speed up merging is to just go ahead and duplicate a
> bunch of code e.g. in pc_virt.c acpi/reduced.c or in any other
> file.
It's precisely what we wanted to avoid in the very first place and we
assumed this would be largely frowned upon by the community. It's also a
burden for everyone to maintain that amount of duplicated code. Also I
suppose this would also mean we'd have to eventually de-duplicate and
factorize things in.
Honestly I'd rather not rush things out and work on code sharing first.
I'll answer Igor's numerous comments today and will start addressing
some of his concerns right aways as well.

Cheers,
Samuel.
