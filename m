Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5745607wrt;
        Mon, 26 Nov 2018 07:48:24 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U8DqEfnnFShgYBWJvkc9BSdyXL8PnnwJAnWSWRch3X7L2DIawAY9ikhiE/lNGtCjxYWxdg
X-Received: by 2002:a25:ad4a:: with SMTP id l10-v6mr28601523ybe.10.1543247304134;
        Mon, 26 Nov 2018 07:48:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543247304; cv=none;
        d=google.com; s=arc-20160816;
        b=VC0ko/F8pQHz25BkUO7Ebz6agpUy4TSXWWQqcR0xsGEtxofGON5LM2qlT18pIHwnk1
         lJzbLIu2aKegA8h/DlA157QFsEKfmAi35Iyum2HBU5G+7wnXkux6M6v66lLT4UEPsCSw
         SnDyJ40od8TzyxGYTykj/v3TlJh/Gw8rANM33uw9/gZ60Js/KALep16VjfPcKss2TmHb
         3YpmVocJB3kZ/RToW8fhbKJzgTYinFfL8bTEvXDiCC80Eibbl+X+/X4CTYGroby3t+Rr
         mMfaiBPsxcWScpqxjw8mCoRnb7Qq27xvRaCbZA6jS8m1FVN+p2pir1+ObYwWY5wgZBQa
         O8jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=a22Efh3VWmrIv/mL2Fn7McCrW7sEvSi8YqsaRoZiYcI=;
        b=NdIxLARDdx9QciD1aroSqSEUh2jXcw8m0ESpUSvSogg58zSHEv+plqBLBVNS+IKxR3
         o1mjsv48kIjM7iPsU8SdHD4kk853rEDEGtal8bjpilll/+VODOuhb1DvTnkWodMO4mlr
         fiMi2BTVDSLegCuCTNFAutDb+psNyNuZCrGGcM83X3zsEiu4iCIEokbmXCgrnO5L5ZcP
         c+Y0mrekrIXGnrOh5nkw73RQ1qORxWij0KP1d1s2d0+P/J7FFGD359RHzPfDrJpMzrwc
         EfeWPRO1Q8PLpRs2YlJNmUKoVymRgcLCp8ViQssjiOHDh5SHyABeVdcdrkmyysRTXUdY
         PD0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y1si496280ywf.391.2018.11.26.07.48.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 07:48:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37336 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRJ7X-00062v-KC
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 10:48:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gRJ7N-00061L-0a
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 10:48:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gRJ7H-00026U-4v
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 10:48:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43373)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gRJ7E-0001si-AJ; Mon, 26 Nov 2018 10:48:04 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4B2B1C01F621;
	Mon, 26 Nov 2018 15:48:02 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D8C026269C;
	Mon, 26 Nov 2018 15:47:53 +0000 (UTC)
Date: Mon, 26 Nov 2018 16:47:51 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181126164751.4e304b46@redhat.com>
In-Reply-To: <20181121232733.GC4450@caravaggio>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-16-sameo@linux.intel.com>
	<20181115142854.1c62f32f@redhat.com>
	<20181121232733.GC4450@caravaggio>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 26 Nov 2018 15:48:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
	Eduardo Habkost <ehabkost@redhat.com>, "Michael
	S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CtPmXPAg9D4X

On Thu, 22 Nov 2018 00:27:33 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> On Thu, Nov 15, 2018 at 02:28:54PM +0100, Igor Mammedov wrote:
> > On Mon,  5 Nov 2018 02:40:38 +0100
> > Samuel Ortiz <sameo@linux.intel.com> wrote:
> >   
> > > This is the standard way of building SRAT on x86 platfoms. But future
> > > machine types could decide to define their own custom SRAT build method
> > > through the ACPI builder methods.
> > > Moreover, we will also need to reach build_srat() from outside of
> > > acpi-build in order to use it as the ACPI builder SRAT build method.  
> > SRAT is usually highly machine specific (memory holes, layout, guest OS
> > specific quirks) so it's hard to generalize it.  
> Hence the need for an SRAT builder interface.
so far builder interface (trying to generalize acpi_build()) looks
not necessary.
I'd suggest to drop and call build_start() directly.

> > I'd  drop SRAT related patches from this series and introduce
> > i386/virt specific SRAT when you post patches for it.  
> virt uses the existing i386 build_srat() routine, there's nothing
> special about it. So this would be purely duplicated code.
Looking at build_srat(), it has a bunch of code to handle legacy
PC layout. You probably don't need any of it for new is86/virt
machine and can make simpler version of it.

In addition (probably repeating question I've asked elsewhere),
Do you have to use split initial memory model for new machine?
Is it possible to use only pc-dimms both for initial and hotplugged memory
at some address (4Gb?) without cutting out PCI hole or any toher holes in RAM layout?

> Cheers,
> Samuel.
> 

