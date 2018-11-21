Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2489195wrt;
        Wed, 21 Nov 2018 15:28:23 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U7IJrOK5BBibuNI4B5RgkpnECAjlDBIXrdslJ90cBdg62a9IK8VnmOXuueAm14rHhi5ODf
X-Received: by 2002:a25:7e46:: with SMTP id z67-v6mr8473332ybc.90.1542842903362;
        Wed, 21 Nov 2018 15:28:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542842903; cv=none;
        d=google.com; s=arc-20160816;
        b=D+P/h1T1JpFBZ0+0gZlPecsVpFkKRDm8txxQN/jQ/6hsUA6ON4bx1X/1vxwgS5gqW2
         BZmKx2GCK8k5uwKSeQbrxrlIA0iuxZSQ6wJqB0jXGn5D+c5WA6fFu/uxjTmeULcYcWpn
         G0y8yXmpz4uA5xFRpN05G0V9VXGhLJ2gXB8H8Cj+GpRNuSno7Agb/EURYWbV1cc3cSb6
         cOBgbYwgQyMMSHnHCNdXteDF5kJcRco91UuQVvr2v2PpwcUIV8yDRw81Ziwk7+wqcJ44
         b3JLxqfmQ+EU6985JWlLj/dQ0CzNf796IM1oWYphw34gQ0Ko+Wfdv8saAAhgOeADCP+9
         /g8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=xj6G+1Tr/iODSYyHx0FXC9MAghBg9hoEiR3F+vdYt44=;
        b=AJxbdeb3myowFujAKdcS9l/oohqSiEnzv6LjHjnkAcKmdxYMHO+SAw9XMC6UAkqVp6
         VpV/pFRtB/4sCunbHWrxHD4kKTC0Kfjn2jWafIONLHrPSFsPMRA+97nVjpJbIbpV4wzq
         4AUSvp837mTushL+c29kmFRkEJFz8vZzMUOxTeQvJtb/KbpMF85oNvoOtir41PZjhEia
         LZsQFDXs+63KXi7jzBoaI0+ciCfBBq0tSdHI88+LEBfNHa3yjsFnGjZ5FQAy/3SpsTR7
         qqtTr+r7uu0FbHBeikLluTF29OuejsgrSXo/KccwDP5MAS2NMq4UOQ8skTnCRgHWsvUv
         2BYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f125si1505378ywa.280.2018.11.21.15.28.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Nov 2018 15:28:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:43071 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPbuw-0007Sv-P1
	for alex.bennee@linaro.org; Wed, 21 Nov 2018 18:28:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gPbup-0007Sq-Mg
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 18:28:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gPbum-0007Go-9m
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 18:28:15 -0500
Received: from mga05.intel.com ([192.55.52.43]:45902)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gPbul-00079f-Uy; Wed, 21 Nov 2018 18:28:12 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Nov 2018 15:28:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,262,1539673200"; d="scan'208";a="110513764"
Received: from slgibson-mobl1.ger.corp.intel.com (HELO caravaggio)
	([10.252.29.202])
	by orsmga002.jf.intel.com with ESMTP; 21 Nov 2018 15:28:06 -0800
Date: Thu, 22 Nov 2018 00:27:33 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20181121232733.GC4450@caravaggio>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-16-sameo@linux.intel.com>
	<20181115142854.1c62f32f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181115142854.1c62f32f@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.43
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 15/24] hw: i386: Export the
 i386 ACPI SRAT build method
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
	xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q5ojEvNP9so/

On Thu, Nov 15, 2018 at 02:28:54PM +0100, Igor Mammedov wrote:
> On Mon,  5 Nov 2018 02:40:38 +0100
> Samuel Ortiz <sameo@linux.intel.com> wrote:
> 
> > This is the standard way of building SRAT on x86 platfoms. But future
> > machine types could decide to define their own custom SRAT build method
> > through the ACPI builder methods.
> > Moreover, we will also need to reach build_srat() from outside of
> > acpi-build in order to use it as the ACPI builder SRAT build method.
> SRAT is usually highly machine specific (memory holes, layout, guest OS
> specific quirks) so it's hard to generalize it.
Hence the need for an SRAT builder interface.

> I'd  drop SRAT related patches from this series and introduce
> i386/virt specific SRAT when you post patches for it.
virt uses the existing i386 build_srat() routine, there's nothing
special about it. So this would be purely duplicated code.

Cheers,
Samuel.
