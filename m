Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1893wrt;
        Wed, 21 Nov 2018 15:58:37 -0800 (PST)
X-Google-Smtp-Source: AJdET5ej/QdOr/Mvq0sNt2BalUOcFeL8jIoDz45ZwLixNEJ3/BGF6dRKbkV7A6VRxUoPGI9HMGjX
X-Received: by 2002:a81:9ad5:: with SMTP id r204mr8738088ywg.215.1542844717857;
        Wed, 21 Nov 2018 15:58:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542844717; cv=none;
        d=google.com; s=arc-20160816;
        b=yCJG9HXae/4cbQiG1D6+5aJggAzB5DpH62lLisHV1DKk39e7gfEiL/rWSVsfT8/Goz
         nYR3uSq5+QgAgka/QqljQtUyI9ErfiPqK+lkBsmBTgad7zFDotGA5WE+Yrw6wCih0CQe
         p1I/TTiVQy1gksKEHlXlVSBwmQxVj/bTZHJgMmHLZVWURFYWsKIED6YnRf/EJjvSmqc+
         jMoYmaVx5+4QONpbyUmdPmoradH3v5ihoBof6NUvkQ269+TaWKeEMs6SH+siGG7QY4Xi
         geo09dWexQPV+fc6L5q396mm2V+FIkmG4t5+UaJA+UmSqaR/Ttqzvku+Z6I+M48f8fhs
         uPMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=YppKVQf4eV+m2P9OzmqDh2y40xaKCyseacSBFAv9tmE=;
        b=jBKbqMystiMQ8JchOlS6Xio3wCfb8NcCDZD4RrdsbuAELtJ4L3u4lyOz49VZBzxn/4
         jFutcvt8veCRNXT0y1ZGcGy2x8bCu3ANXc6nEfl1+kekY/XBY8dVptUq4iwRXvLUol4V
         op5bwnN6TCPdhD8eJ7s+aVlk8uXxAo+teyOxJ9yj4suELfayBRpeedXEZ4MllsCkTZqL
         OdpjOHiR0XHqwFiPIqMG0yBsPywP0S6TRHCzGX+uglszUkzsi7T78xdpyOIMLA9Fu9Qw
         e5mmjrvPOkiJ6h9doDBuJ2RqQiuP20STXNZvnpaDsGBAyeJwykhEfrKWWB0d1PGnjVLL
         mYug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h20-v6si18564786ybk.339.2018.11.21.15.58.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Nov 2018 15:58:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:43163 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPcOD-0000Mb-4k
	for alex.bennee@linaro.org; Wed, 21 Nov 2018 18:58:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40845)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gPcNu-0000G1-2v
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 18:58:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gPcNm-0000NP-6a
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 18:58:14 -0500
Received: from mga04.intel.com ([192.55.52.120]:30807)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gPcNg-0008Uc-VN; Wed, 21 Nov 2018 18:58:07 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Nov 2018 15:57:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,262,1539673200"; d="scan'208";a="283131587"
Received: from slgibson-mobl1.ger.corp.intel.com (HELO caravaggio)
	([10.252.29.202])
	by fmsmga006.fm.intel.com with ESMTP; 21 Nov 2018 15:57:54 -0800
Date: Thu, 22 Nov 2018 00:57:21 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20181121235721.GE4450@caravaggio>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-21-sameo@linux.intel.com>
	<20181116170226.35385388@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181116170226.35385388@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.120
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 20/24] hw: acpi: Define ACPI
 tables builder interface
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
X-TUID: Qu9dWBTXTkIf

On Fri, Nov 16, 2018 at 05:02:26PM +0100, Igor Mammedov wrote:
> On Mon,  5 Nov 2018 02:40:43 +0100
> Samuel Ortiz <sameo@linux.intel.com> wrote:
> 
> > In order to decouple ACPI APIs from specific machine types, we are
> > creating an ACPI builder interface that each ACPI platform can choose to
> > implement.
> > This way, a new machine type can re-use the high level ACPI APIs and
> > define some custom table build methods, without having to duplicate most
> > of the existing implementation only to add small variations to it.
> I'm not sure about motivation behind so high APIs,
> what obvious here is an extra level of indirection for not clear gain.
> 
> Yep using table callbacks, one can attempt to generalize
> acpi_setup() and help boards to decide which tables do not build
> (MCFG comes to the mind). But I'm not convinced that acpi_setup()
> could be cleanly generalized as a whole (probably some parts but
> not everything)
It's more about generalizing acpi_build(), and then having one
acpi_setup for non hardware-reduced ACPI and a acpi_reduced_setup() for
hardware-reduced.

Right now there's no generalization at all but with this patch we could
already use the same acpi_reduced_setup() implementation for both arm
and i386/virt.

> so it's minor benefit for extra headache of
> figuring out what callback will be actually called when reading code.
This is the same complexity that already exists for essentially all
current interfaces.

> However if board needs a slightly different table, it will have to
> duplicate an exiting one and then modify to suit its needs.
> 
> to me it pretty much looks the same as calling build_foo()
> we use now but with an extra indirection level and then
> duplicating the later for usage in another board in slightly
> different manner.
I believe what you're trying to say is that this abstraction may be
useful but you're arguing the granularity is not properly defined? Am I
getting this right?

Cheers,
Samuel.
