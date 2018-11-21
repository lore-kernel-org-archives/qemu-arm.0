Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1809474wrt;
        Wed, 21 Nov 2018 04:36:04 -0800 (PST)
X-Google-Smtp-Source: AJdET5fKcpee13W0AIkWXrrxv1RhtlEe8ZAgKbOMykohFhCbfm9/ytskGs7/kad8RedlmjPPr0dH
X-Received: by 2002:a81:27cc:: with SMTP id n195mr6147177ywn.243.1542803764393;
        Wed, 21 Nov 2018 04:36:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542803764; cv=none;
        d=google.com; s=arc-20160816;
        b=mzvgctMqaDvh4rTvLGFw0IvTWbmrblFdsviCxR02WjTVco8YB77KgZiKhINwRZh3CJ
         xBeNj9s44DP8p9L+YkSK24JuvDvwg92qveqn255hvJmHl8eo3qf/HV3HTXvnBWuqZdWw
         BZ6t/YudVNFoc23XUiecTJlx1kfi6JcTCDhbKU2O0mPfiEwP7nu9vhHeY/CG1xY8ASyc
         mJJCyiyttKt4r1fHeKyaPsb9it/Vh6jbw5hyBeZbjc3aW2AugIwGtuaRz3+WRBwMcmL4
         G6g2v9dNkEHTcQrTZr8g8WvBqIQFnt9i1qHJLB/afSgjHUg9QHGinKiSA3PPDuoMMxDL
         vwAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=Ppq4NdIpNpNzwMRjifesghd5dd12vpt8XfSWDq+4Jvo=;
        b=DN6rTW4kg5utlYcel1s28ruC7WXsm13svFxg9Dv4TJL6h6D3s+qrh2vC4ihvSu5aga
         NC1AdWeP5MYAHeQzMw2ekX7Yi/fIm3NOYLqOutAa52mfIlkHIUN4gTTyYcWPqgP/rwkW
         ESpe75rZ2kuCWO5IZo8RooZvmxi47DvWek/yvk2wSz3v81/87v5nSbAHfL3/s9F/QO+P
         pE/T8Qj8ZI1TSJTVy0KrZccISM773QwZraq5nLf59BIhxiE7u3Tm7drsdUriCrijEMry
         y7rt9xfiLzOZ7+5y00468nPaQiCUaL3zWHi1cOb+8qrqIKwhJGqR+zQTFLmIZS3LweQP
         D2QQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t4-v6si28049289ybo.253.2018.11.21.04.36.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Nov 2018 04:36:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38805 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPRjf-0004S2-Ri
	for alex.bennee@linaro.org; Wed, 21 Nov 2018 07:36:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44495)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gPRjX-0004Rm-8y
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 07:35:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gPRjT-00072I-Af
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 07:35:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41852)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1gPRjT-000729-5c; Wed, 21 Nov 2018 07:35:51 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33B163086272;
	Wed, 21 Nov 2018 12:35:50 +0000 (UTC)
Received: from redhat.com (ovpn-120-136.rdu2.redhat.com [10.10.120.136])
	by smtp.corp.redhat.com (Postfix) with SMTP id 868BE60565;
	Wed, 21 Nov 2018 12:35:47 +0000 (UTC)
Date: Wed, 21 Nov 2018 07:35:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20181121072954-mutt-send-email-mst@kernel.org>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181116172919.43f3e27d@redhat.com>
	<d4f6f0ef-1333-a917-e3eb-d9bad47c9648@redhat.com>
	<20181119163110.2f357f40@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181119163110.2f357f40@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Wed, 21 Nov 2018 12:35:50 +0000 (UTC)
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
X-TUID: iMqVA1BGxkUC

On Mon, Nov 19, 2018 at 04:31:10PM +0100, Igor Mammedov wrote:
> On Fri, 16 Nov 2018 17:37:54 +0100
> Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
> > On 16/11/18 17:29, Igor Mammedov wrote:
> > > General suggestions for this series:
> > >   1. Preferably don't do multiple changes within a patch
> > >      neither post huge patches (unless it's pure code movement).
> > >      (it's easy to squash patches later it necessary)
> > >   2. Start small, pick a table generalize it and send as
> > >      one small patchset. Tables are often independent
> > >      and it's much easier on both author/reviewer to agree upon
> > >      changes and rewrite it if necessary.  
> > 
> > How would that be done?  This series is on the bigger side, agreed, but
> > most of it is really just code movement.  It's a starting point, having
> > a generic ACPI library is way beyond what this is trying to do.
> I've tried to give suggestions how to restructure series
> on per patch basis. In my opinion it quite possible to split
> series in several smaller ones and it should really help with
> making series cleaner and easier/faster to review/amend/merge
> vs what we have in v5.
> (it's more frustrating to rework large series vs smaller one)
> 
> If something isn't clear, it's easy to reach out to me here
> or directly (email/irc/github) for clarification/feed back.

I assume the #1 goal is to add reduced HW support.  So another
option to speed up merging is to just go ahead and duplicate a
bunch of code e.g. in pc_virt.c acpi/reduced.c or in any other
file.
This way it might be easier to see what's common code and what isn't.
And I think offline Igor said he might prefer that way. Right Igor?

> > 
> > Paolo
> > 
> > >   3. when you think about refactoring acpi into a generic API
> > >      think about it as routines that go into a separate library
> > >      (pure acpi spec code) and qemu/acpi glue routines and
> > >       divide them correspondingly.  
> > 
