Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1899073wrt;
        Wed, 21 Nov 2018 05:57:55 -0800 (PST)
X-Google-Smtp-Source: AJdET5dwDBaZRvduwU1KCFdArUVAc7sri1M1+mMD9dz0eETiKalVS7mSYvVmaMr0K811Dy2nlBc/
X-Received: by 2002:a81:3149:: with SMTP id x70mr6377539ywx.420.1542808675101;
        Wed, 21 Nov 2018 05:57:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542808675; cv=none;
        d=google.com; s=arc-20160816;
        b=h3P36O3HEjHHg9jUW0BLqv9RTKsqzu0RvCIMulx/HteQe6JDjx4xT3oR840K9d1kax
         J/UH8wUzX0GsC9E28bvwhJwgSXkQ1fqjqaWxMDgyXM1nFls/seDaVCho0Egk2ZgUYIn/
         rRO/M337QIxup8AbV+9cXMf4iKKyjyc4GMdbjdMXVlONnZ4CTY0I6Z/BSH7BFoOhx1K5
         YWe+p4sOIsUXvKCbCk4YPpfaB8PSvjg3L+XHG7t8H3Ca56ZrNQHhXnsPQLg6CG74qgcd
         FHiVu9trzxVSShNm5NgWmPM7sRktix/rNShXGMd6857m5AT6al5F6RpfFHW+Zv4JfuxQ
         tpXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=TuTdQ9hdRjQkrSxaNK8ATXjKkXAlwSKUJmGs/1p5bwk=;
        b=qJl2TjradrsXU0fgp0Elx0lJj37/dpR2Mc6UU5qYgkmvHAhnbOpqSun2Ei9apk2fAc
         x6Tvttnb3MqhAAlG1mrqqN7xSMBjwYzSPeUzJhlwMsO3qxM/yT0HGuDOdOQcEQlG2bH+
         g1cXzjX67yO3TFaf4HzdqlXLLC9GI3I4mfBx4+aD5uS0CpaxuYL7YVFFcMu6bp66wZww
         nqGGAybopjrRcJvtKJxGNqRat6JqV/ulAcFH5ew1XzksYl0TqjWYqWieJrk9TfLhnlRY
         R1GT89BjGSni7lkarIjDWegsgicfAoJXnkwkxIGEAtt3pjDbQFkWbD92KFamZQiiv8hj
         YoFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f5si7709438ywf.397.2018.11.21.05.57.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Nov 2018 05:57:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39287 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPT0s-0000Lb-Gh
	for alex.bennee@linaro.org; Wed, 21 Nov 2018 08:57:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44052)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gPT0e-0000IU-7g
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 08:57:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gPT0b-0004GH-H7
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 08:57:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45310)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1gPT0b-0004Fm-9a; Wed, 21 Nov 2018 08:57:37 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 57CD481254;
	Wed, 21 Nov 2018 13:57:36 +0000 (UTC)
Received: from redhat.com (ovpn-120-136.rdu2.redhat.com [10.10.120.136])
	by smtp.corp.redhat.com (Postfix) with SMTP id 33157601AD;
	Wed, 21 Nov 2018 13:57:32 +0000 (UTC)
Date: Wed, 21 Nov 2018 08:57:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181121085557-mutt-send-email-mst@kernel.org>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181116172919.43f3e27d@redhat.com>
	<d4f6f0ef-1333-a917-e3eb-d9bad47c9648@redhat.com>
	<20181119163110.2f357f40@redhat.com>
	<20181121072954-mutt-send-email-mst@kernel.org>
	<20181121135030.GC4426@caravaggio>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181121135030.GC4426@caravaggio>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 21 Nov 2018 13:57:36 +0000 (UTC)
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
	Eduardo Habkost <ehabkost@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +KnYDiUj5TSc

On Wed, Nov 21, 2018 at 02:50:30PM +0100, Samuel Ortiz wrote:
> Hi Michael,
> 
> On Wed, Nov 21, 2018 at 07:35:47AM -0500, Michael S. Tsirkin wrote:
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
> > I assume the #1 goal is to add reduced HW support.
> >From our perspective, yes. From the project's point of view, it's about
> making the current ACPI code more generic and not bound to any specific
> machine type.
> 
> > So another
> > option to speed up merging is to just go ahead and duplicate a
> > bunch of code e.g. in pc_virt.c acpi/reduced.c or in any other
> > file.
> It's precisely what we wanted to avoid in the very first place and we
> assumed this would be largely frowned upon by the community. It's also a
> burden for everyone to maintain that amount of duplicated code. Also I
> suppose this would also mean we'd have to eventually de-duplicate and
> factorize things in.

For sure, that's the plan.

> Honestly I'd rather not rush things out and work on code sharing first.
> I'll answer Igor's numerous comments today and will start addressing
> some of his concerns right aways as well.
> 
> Cheers,
> Samuel.

OK, no problem then - just trying to make sure you aren't blocked.

-- 
MST
