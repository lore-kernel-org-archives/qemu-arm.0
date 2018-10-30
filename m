Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5722509wro;
        Tue, 30 Oct 2018 08:21:56 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eHHDgEsZ6i4UMVozrwU0hYY1TaJgRcxId2xlmVKlT754UL1i3No+5mzqBH5MwrOua79PPL
X-Received: by 2002:a37:14a4:: with SMTP id 36mr15996601qku.126.1540912916180;
        Tue, 30 Oct 2018 08:21:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540912916; cv=none;
        d=google.com; s=arc-20160816;
        b=hb7kxSQn9YmoR5qGGmd9EM4Kd7yhFiC3aa5muXKloiNxxRDn+8Gm7pKbKmZLzqDVYw
         vtKyIkMys5qNEz1v8jRQk+ATRhV2OwAywPmzV/Y0u/EnD8GOtaZk9ciiGPVeVugebYWc
         KZCEhi5HBv92BDDhVRCJtlBKYkNGDw2fPUeWgUlOyRUZ9PdSnd3SYasRIiniEmMrm8li
         7aat/U4ECXpDU21nWlSqLcUdZVn7DNcMrnaMoosW0twGvfJOZHMhOAekcJ2Fwry1h/DG
         LInCj0KtN0lQFH/Gn6xM1V9thPNjlMF09IbXqoArUyWpV//pVA2sgxjwTyaWGiVBtJez
         mz8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=yZcsrN8KKbhdfelGFCb//XQ6yDk2xRIx3CgdIdmnaiI=;
        b=FTyqlpYAlds2vxehmBcPcjHbSLiP2J//HQGI4U2l2zJMmrKKapVpRs3RByU6yZmsGm
         PpPfM55/U+6gkomSKfoVRhD4OU3LIFh23jqiuS5i550W4UALCH0Z/iMA0hOfX8dkWl+C
         EJIVGzr4WNE3o2l7ccnFceSvzYsvXY24AyBloSU/AVZBhShl+md5yaWlZ4Jg2h7W8Ug8
         dFzSCQrS8NuoQ2GyCTcPv98DkosND6O4mxiC3xhoGqoplTDL2Wm5b1/piUwRUcGy9418
         LSjdAgHxJ6o1dHpGv6+yvTPti9ylV5a7w6TGL1eJawBSxUEdBylDAINmBTF3NybrsunA
         yzzg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k18si255237qtb.401.2018.10.30.08.21.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Oct 2018 08:21:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:53858 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHVq7-0001lL-C8
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 11:21:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gHVpq-0001jK-No
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 11:21:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gHVpk-0000H3-N6
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 11:21:36 -0400
Received: from mga01.intel.com ([192.55.52.88]:36634)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gHVpi-0008L9-9l; Tue, 30 Oct 2018 11:21:30 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Oct 2018 08:21:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,444,1534834800"; d="scan'208";a="101937491"
Received: from davidbur-mobl1.ger.corp.intel.com (HELO caravaggio)
	([10.252.4.36])
	by fmsmga004.fm.intel.com with ESMTP; 30 Oct 2018 08:21:23 -0700
Date: Tue, 30 Oct 2018 16:20:41 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20181030152041.GD5291@caravaggio.home>
References: <20181029162441.31631-1-sameo@linux.intel.com>
	<874ld4mzlb.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874ld4mzlb.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.88
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 00/19] ACPI reorganization
 for hardware-reduced support
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hu7MZ/5R8YX6

Hi Markus,

On Mon, Oct 29, 2018 at 06:28:48PM +0100, Markus Armbruster wrote:
> You neglected to cc: maintainers.  I'm doing that for you now.
> scripts/get_maintainer.pl can help you finding maintainers.
Sorry about that. I sent a v3 with all maintainers cc'ed.

Cheers,
Samuel.


> Samuel Ortiz <sameo@linux.intel.com> writes:
> 
> > This patch set provides an ACPI code reorganization in preparation for
> > adding hardware-reduced support to QEMU.
> >
> > The changes are coming from the NEMU [1] project where we're defining
> > a new x86 machine type: i386/virt. This is an EFI only, ACPI
> > hardware-reduced platform and as such we had to implement support
> > for the latter.
> >
> > As a preliminary for adding hardware-reduced support to QEMU, we did
> > some ACPI code reorganization with the following goals:
> >
> > * Share as much as possible of the current ACPI build APIs between
> >   legacy and hardware-reduced ACPI.
> > * Share the ACPI build code across machine types and architectures and
> >   remove the typical PC machine type dependency.
> >   Eventually we hope to see arm/virt also re-use much of that code.
> >
> > The patches are also available in their own git branch [2].
> >
> > [1] https://github.com/intel/nemu
> > [2] https://github.com/intel/nemu/tree/topic/upstream/acpi
> >
> > v1 -> v2:
> >    * Drop the hardware-reduced implementation for now. Our next patch set
> >      will add hardware-reduced and convert arm/virt to it.
> >    * Implement the ACPI build methods as a QOM Interface Class and convert
> >      the PC machine type to it.
> [...]
> 
