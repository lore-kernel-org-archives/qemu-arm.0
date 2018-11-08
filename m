Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp214291wrw;
        Thu, 8 Nov 2018 06:45:24 -0800 (PST)
X-Google-Smtp-Source: AJdET5fDyeslYuEPTESbgbMCHR4nlhTJdSvQlpxvpjGNyuNDD6JCBc8O32yuItYMruyodCUzJyz2
X-Received: by 2002:ad4:5004:: with SMTP id s4mr4644844qvo.109.1541688323965;
        Thu, 08 Nov 2018 06:45:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541688323; cv=none;
        d=google.com; s=arc-20160816;
        b=GCYzUrcYmxNRWmjhYjDtob96HxcXLxYD8yW95Uwo1jxAkz3N4LyF/iFEWlMobCq0X4
         kbKRsj3t3/L0QEBo8FWd78DVY9xmqgGAyF8m8gLWY5TCD+f1DQTTrvs5pc5Bbv9qZsst
         /bHDOgXL03FsFdc/dnCfgRqAxk4rNaqTwnaWmkfaQRvLKbae8rkv3MmOlAY5FBkQbXWI
         5nfcFqvJBhd3ivCb8KaqKDE6Ho7SmWvFLsuccA0F/c7a3MstmFRAshVczniU9Tb0K0+i
         pRqIonJccVGQm68YiNqnE5g2JQt/9cgtjP6GjevU4oF4OEDqoJBTMHxsdZxYqWOW/s9v
         +nqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=QPlkRFTEYkDbhJH/wFXt0B7N50iP5KdFT1UXLVUse+A=;
        b=BXEx02obxuxSejzRJTsILRpwR7yU9iXpJze8DOsSzvIVSGu1iFKTEzwVPToLMj8CUz
         dBX6svePraG7kpRVAorR0sVScUKivJLPboEUyAA9b+vaDgmmQ0yWxHrQZHfJNrAAZDML
         zfyLusOKiQP7K/v6431jyIRYPlR5kwmEsXnu8DibBxD3J3UIxeUzdjk96tqTmuLpb1VS
         JNpfhpwzBCbAQlqfcdeDKB9E3a+m9BTvGifXiDn3HWkXWK4CNS+FqgJm5Z+BfNmXsSYH
         0ZEr2gRwDR2rTQACw6vLa46XAOs8C5J8UsG8ERnRRzpcv509Wy138PL3v/32ETJ9HVSa
         72Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p11si3261168qtn.50.2018.11.08.06.45.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Nov 2018 06:45:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:57142 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKlYh-0006EJ-Cf
	for alex.bennee@linaro.org; Thu, 08 Nov 2018 09:45:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gKlUX-0001PF-4h
	for qemu-devel@nongnu.org; Thu, 08 Nov 2018 09:41:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gKlQc-0004lO-TT
	for qemu-devel@nongnu.org; Thu, 08 Nov 2018 09:37:03 -0500
Received: from mga07.intel.com ([134.134.136.100]:49165)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gKlQY-0004f0-02; Thu, 08 Nov 2018 09:36:58 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Nov 2018 06:36:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,478,1534834800"; d="scan'208";a="94668196"
Received: from apakula-mobl1.ger.corp.intel.com (HELO caravaggio)
	([10.252.18.126])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Nov 2018 06:36:50 -0800
Date: Thu, 8 Nov 2018 15:36:11 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20181108143611.GD32519@caravaggio>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-6-sameo@linux.intel.com>
	<20181108151623.4de26ecb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181108151623.4de26ecb@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.100
Subject: Re: [Qemu-devel] [PATCH v5 05/24] hw: acpi: Implement XSDT support
 for RSDP
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7noAvvPIFDng

Hi Igor,

On Thu, Nov 08, 2018 at 03:16:23PM +0100, Igor Mammedov wrote:
> On Mon,  5 Nov 2018 02:40:28 +0100
> Samuel Ortiz <sameo@linux.intel.com> wrote:
> 
> > XSDT is the 64-bit version of the legacy ACPI RSDT (Root System
> > Description Table). RSDT only allow for 32-bit addressses and have thus
> > been deprecated. Since ACPI version 2.0, RSDPs should point at XSDTs and
> > no longer RSDTs, although RSDTs are still supported for backward
> > compatibility.
> > 
> > Since version 2.0, RSDPs should add an extended checksum, a complete table
> > length and a version field to the table.
> 
> This patch re-implements what arm/virt board already does
> and fixes checksum bug in the later and at the same time
> without a user (within the patch).
> 
> I'd suggest redo it a way similar to FADT refactoring
>   patch 1: fix checksum bug in virt/arm
>   patch 2: update reference tables in test
I now see what you meant with the ACPI reference tables, thanks.
I'll follow your advice.

Cheers,
Samuel.
