Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1771210wrt;
        Fri, 23 Nov 2018 01:41:57 -0800 (PST)
X-Google-Smtp-Source: AJdET5djZ/JGoigePU1YigwqrT8DJg6SWC7sM93vXSjzId3powYBDWpG9EWAQa0ix9lAsZtJEHz6
X-Received: by 2002:a81:4d42:: with SMTP id a63mr15267272ywb.189.1542966117227;
        Fri, 23 Nov 2018 01:41:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542966117; cv=none;
        d=google.com; s=arc-20160816;
        b=WsCG3kmfNGNdZus1xu30HJyJQWcWdKeRy2XNx1u7fGuv9MJpXXL+m1LgijQtUIb6OJ
         2XpcptE7RbMRrE96yaiERz2Je31aovfLMzzvHQidtOlwtCLle+YT2qW2rKFhTR+ziyXg
         WQL9TVaQbA30/TwgueDs8ABmkBDFDJnJ/7pAO3AZ7ntwX3gLxi37JUu053nhnAN5GmSJ
         9EscC6r2z5IXLPbUMy+vOZvKVmP9bnPF3FrgLR52LYw+qRco9tZ9FSxV8SlI1gvTO34v
         lD1RM+9e+gid7XPqtMV7sFuI6M2re6bVfMH/x6or3aW6yKqe13nVZBmG7SeU0pZGgfgX
         WnKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=NNDC1ARo+nbauMjW/Zkm/Ehv2meYuYeTNPPut+ELJh4=;
        b=A4er/QZG3On7JkdMkxkkbkn0a6CI9lRIw4lZKmgTrL4/TwqvYCGyJN2LoIfDWQAhtx
         nbFbiRd5Vfuzi5ML8wV82hkgk+xdof2IsUsHhx2i0g0I52PTMDR3D6rdJq82Y7IakiCq
         L5LzloyryLZKMBYpkDk+aGmDMnOOlN/gBYvJloTU0P1yYUfFuCMKmASvjQ6CQiqEp5Fy
         WMaRtW53IqzF/q1wFZ3aIRwAUz1zWsKScebSeISpYKEXuDStszPNwDFNq5vVcH+Ybghv
         tL8H9KBpZqJkojoACNi9vtHdeX5/Bom/3/wgJFocL7ISAQIoiulHBMNjJdRtoMgbheDK
         xEiw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d197-v6si31944526ybh.303.2018.11.23.01.41.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 01:41:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:51254 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQ7yG-0007fs-HI
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 04:41:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gQ7xs-0007cr-Sw
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:41:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gQ7te-0007jj-40
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:37:14 -0500
Received: from mga09.intel.com ([134.134.136.24]:42259)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gQ7tc-0007i7-4S; Fri, 23 Nov 2018 04:37:10 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Nov 2018 01:37:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,269,1539673200"; d="scan'208";a="98443040"
Received: from cdigorix-wtg1.ger.corp.intel.com (HELO caravaggio)
	([10.252.4.40])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Nov 2018 01:37:00 -0800
Date: Fri, 23 Nov 2018 10:36:27 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20181123093627.GH4450@caravaggio>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-6-sameo@linux.intel.com>
	<20181108151623.4de26ecb@redhat.com>
	<20181121144211.GE4426@caravaggio>
	<20181122172652.6b02aef6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181122172652.6b02aef6@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.24
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 05/24] hw: acpi: Implement
 XSDT support for RSDP
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
X-TUID: pSaFeAxbWQI/

On Thu, Nov 22, 2018 at 05:26:52PM +0100, Igor Mammedov wrote:
> On Wed, 21 Nov 2018 15:42:11 +0100
> Samuel Ortiz <sameo@linux.intel.com> wrote:
> 
> > Hi Igor,
> > 
> > On Thu, Nov 08, 2018 at 03:16:23PM +0100, Igor Mammedov wrote:
> > > On Mon,  5 Nov 2018 02:40:28 +0100
> > > Samuel Ortiz <sameo@linux.intel.com> wrote:
> > >   
> > > > XSDT is the 64-bit version of the legacy ACPI RSDT (Root System
> > > > Description Table). RSDT only allow for 32-bit addressses and have thus
> > > > been deprecated. Since ACPI version 2.0, RSDPs should point at XSDTs and
> > > > no longer RSDTs, although RSDTs are still supported for backward
> > > > compatibility.
> > > > 
> > > > Since version 2.0, RSDPs should add an extended checksum, a complete table
> > > > length and a version field to the table.  
> > > 
> > > This patch re-implements what arm/virt board already does
> > > and fixes checksum bug in the later and at the same time
> > > without a user (within the patch).
> > > 
> > > I'd suggest redo it a way similar to FADT refactoring
> > >   patch 1: fix checksum bug in virt/arm
> > >   patch 2: update reference tables in test
> > >   patch 3: introduce AcpiRsdpData similar to commit 937d1b587
> > >              (both arm and x86) wich stores all data in hos byte order
> > >   patch 4: convert arm's impl. to build_append_int_noprefix() API (commit 5d7a334f7)
> > >
> > >            ... move out to aml-build.c
> > >   patch 5: reuse generalized arm's build_rsdp() for x86, dropping x86 specific one
> > >       amending it to generate rev1 variant defined by revision in AcpiRsdpData
> > >       (commit dd1b2037a)  
> > I agree patches #1, #2 and #5 make sense. 3 and 4 as well, but here
> > you're asking about something that's out of scope of the current serie.
> /me guilty of that, but I have excuses for doing so:
>   * that's the only way to get rid of legacy approach given limited resources.
>     So task goes to whomever touches old code. /others and me included/
>     I'd be glad if someone would volunteer and do clean ups but in absence
>     of such, the victim is interested party.
>   * contributor to ACPI part learns how to use preferred approach,
>     makes code more robust and clear as it's not possible to make
>     endianness mistakes, very simple to review and notice mistakes
>     as end result practically matches row by row a table described in spec.
I understand and agree with that. And to be clear: I'm happy to
contribute and work on that. But I'm also lucky to have an employer
that can afford to let me spend as much time as needed to do this kind
of refactoring/modernizing work. I just want to point out that other
potential newcomers to the project may not have that luxury.
I wonder (I sincerely do, I'm not making any assumptions) how much code
is left unmerged because the original submitter did not have the time or
budget to polish it up to the expected level.

Cheers,
Samuel.

