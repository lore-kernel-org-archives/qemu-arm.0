Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1922846wrt;
        Wed, 21 Nov 2018 06:15:57 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XfuFQQMTuiraxkalL8Wozk9CURqERrA3lsMuSY0VturBbz72vOpcuN92BZm6+EbzKgJExQ
X-Received: by 2002:a25:be12:: with SMTP id h18-v6mr6190526ybk.80.1542809757571;
        Wed, 21 Nov 2018 06:15:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542809757; cv=none;
        d=google.com; s=arc-20160816;
        b=0MZbtTTZTx5RUvQjvxBt4MOo2LJNF1aaxxidINUTHY8BhNKiOOuISDxXuCUM5RYsY6
         B13Ws2CGiegKDcJwmVbBU2IuAxbv/wkIF4T2d9/NWwiS6zEgplsRElb7u7pAzYFmPSTL
         XstXkKaj/o2QTaav4qe55GRCM3ALPwb0sLgBgsuOGa1wGZyckCNSE65LxPAx+Q+Sr90G
         Br1yUTMTCDp9vAFVguC6nhPNaxJKL112ZCMFvrP/p+Xlib9C5ED2SgeUJ/Fz0sj5Oqoh
         9jaH4hrlY5FxacCXD3fIpwhTm6fp0VyJKIyCjSkxqASUQgDeRrQQAZZbgZ0eJ5Fy8BLb
         gknQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=dDPruojQKkAqLnvjAphCKZP6a7fNV3+pI/6fp8f4Fuw=;
        b=bs2j5wjiumP8szjw3Easb1B7LFCyyMs/H1udTT6Ptd0gnUxS+byVEQMdGxuBC8qAEK
         0H8j6yoBayfBWBe1F9E12MArSUE4HVOrYHJBW7GaYdTy3fsmzSJx+JGqGzlgi9AEPwdp
         7KWFZH5XvmGO3Mzo7O8GPvMX45ZHqzQ3BMLbmx+s36UmPgN+xVq04wrvRyoOd4YvhaFy
         2YdcHlxg59MAnhgkmsPJpUszoBIDPvjiMd4z0FRbVurmBB7Uqfcvq+LoG9DZZAmIgSEh
         I8TPqXKT2DhAmWSGfKm6+qHMw9VZxtDCmEXSRyLtVijHSoE/RsqbFPi341MSrOFopeFB
         iUCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l78si10239122ywe.174.2018.11.21.06.15.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Nov 2018 06:15:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39411 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPTIL-0000lG-2P
	for alex.bennee@linaro.org; Wed, 21 Nov 2018 09:15:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50653)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gPTIF-0000lB-06
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 09:15:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gPTIB-0001s6-TO
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 09:15:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53342)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gPTIB-0001rZ-Lz; Wed, 21 Nov 2018 09:15:47 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9FED7C068BE1;
	Wed, 21 Nov 2018 14:15:46 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8FF4B605AF;
	Wed, 21 Nov 2018 14:15:33 +0000 (UTC)
Date: Wed, 21 Nov 2018 15:15:26 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20181121151526.5785b43f@redhat.com>
In-Reply-To: <20181121072954-mutt-send-email-mst@kernel.org>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181116172919.43f3e27d@redhat.com>
	<d4f6f0ef-1333-a917-e3eb-d9bad47c9648@redhat.com>
	<20181119163110.2f357f40@redhat.com>
	<20181121072954-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 21 Nov 2018 14:15:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
	Samuel Ortiz <sameo@linux.intel.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KJzoya/FQMMu

On Wed, 21 Nov 2018 07:35:47 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

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
> I assume the #1 goal is to add reduced HW support.  So another
> option to speed up merging is to just go ahead and duplicate a
> bunch of code e.g. in pc_virt.c acpi/reduced.c or in any other
> file.
> This way it might be easier to see what's common code and what isn't.
> And I think offline Igor said he might prefer that way. Right Igor?
You mean probably 'x86 reduced hw' support. That's was what I've
already suggested for PCI AML code during patch review. Just don't
call it generic when it's not and place code in hw/i386/ directory beside
acpi-build.c. It might apply to some other tables (i.e. complex cases).

On per patch review I gave suggestions how to amend series to make
it acceptable without doing complex refactoring and pointed out
places we probably shouldn't refactor now and just duplicate as
it's too complex or not clear how to generalize it yet.

Problem with duplication is that a random contributor is not
around to clean code up after a feature is merged and we end up
with a bunch of messy code.

A word to the contributors,
Don't do refactoring in silence, keep discussing approaches here,
suggest alternatives. That way it's easier to reach a compromise
and merge it with less iterations. And if you do split it in smaller
parts, the process should go even faster.

I'll sent a small RSDP refactoring series for reference.

> > > Paolo
> > >   
> > > >   3. when you think about refactoring acpi into a generic API
> > > >      think about it as routines that go into a separate library
> > > >      (pure acpi spec code) and qemu/acpi glue routines and
> > > >       divide them correspondingly.    
> > >   

