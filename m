Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26758CD98C7
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Jun 2026 20:55:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXmQS-0004NZ-So; Thu, 11 Jun 2026 16:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wXmQJ-0004Lx-I1
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 16:54:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wXmQH-0002yf-9i
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 16:54:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781211284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IqEtC0ksoHIeuhIPaO0q1hhw3KmTyrN9JhP/hlWFukI=;
 b=G64gwAYTfrNOOhzWyDYE4WK8x+YBpQOncQdZaa1ALFvUjSM1GVn4ePXsil18TwHDa+InjN
 CDqwEguOrQdp6ugl9e/eAjGIasFyVUas14hi0iQOM8tlVPYRa362OFErSpkDn3cdpfFlLW
 VIvOIfMG9LlcOrFBNsjG1cXbap3NKoA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68--G36Nv5GMi-zM1I8lHSK0Q-1; Thu, 11 Jun 2026 16:54:41 -0400
X-MC-Unique: -G36Nv5GMi-zM1I8lHSK0Q-1
X-Mimecast-MFC-AGG-ID: -G36Nv5GMi-zM1I8lHSK0Q_1781211280
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-45eee3f9f03so215407f8f.1
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 13:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781211280; x=1781816080;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IqEtC0ksoHIeuhIPaO0q1hhw3KmTyrN9JhP/hlWFukI=;
 b=JiZBUMWQBnk/oKgz/wTBDa7cNlEQyIv8HlKHuBrskaFvTd0wFnl/Z/Nt2vWo3XuTzL
 cIO8lSqhkGz8jfkc2Wg7kXLuL16kai/3OY4k7FgLibXR5k1MXoh0qikTDW2F5wisjvMp
 XhfUg3KuqOZiYt+plGa+Er5EvqNAYt0Q6aB3aOmrXd7yIEaJP9fS1gAgY2rqwHKxtyQv
 1uhHfdovxdAH6Iexm9ByI3hkJ2UETwI0rnfUxHsIIu65WwEnQSwP9cRW/tj2k1izEWnm
 6j3g38lHcgUikAJYdeD8TKl9vzILhqKNqQD/lQipSP8PflQni/42HQYrA5+ahHG5uqNv
 XC1Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+1qg2YJsI0KzF7zpeQgUimZQy8Q/AeJ4LS0NUjT/HvnaW1mMwVUU9y+XZ7bkRglM5AhDFm1QEDhQ==@nongnu.org
X-Gm-Message-State: AOJu0YxuAgpy5rgY17cE2re9lEIYMgrDvju8d13xf1j9Ap3AgiPfoU85
 Iuk9JGZe+Mo1Gac4wzIN/vtpsXQpGte+aYzEAcsXfqRd6LnMM650h7jillCFAG2VOXCVmeInKJN
 YUjzJy0y819/qScRtuoow256IM3exYRzaxaigtugDfCezJnl56H6nHw==
X-Gm-Gg: Acq92OEhZ4tsS+c84XqXU5Tm/46dFfeyHN5mdifGWonVdyebCzZ89JOPB7gf3McjlDr
 Iu5ZeF1xmG9hI4QAKp1nPbdD9jDMEA6cThaenx+8UdauOAVvtoQsmIm+pi0cfzovUgNd8OZTsxE
 vH4gN7fswAxaYWyFOJ6e8BI8ENRVgkFSavbRvlTK+/8gzvdbY57tGOT9Na+QpwMwLZTAlO98pFf
 p4nvxW0971Hhrz/D1O31u9UP0ZnT0KJOkglp/jg27TiGtkH//00+QcXad8c0GU0J1qEdg5UcMQx
 uoaPiABNa8pg22cDw3wSBo1NdgB7GkJVwyThDmgMoaeSxrBTIUgI4QXphd3c2ME/Th6kxEDckMK
 U4VSRK07J4q+ud+sXVTvVuU2YhkOiWkmCLJFFzl5pJyA=
X-Received: by 2002:a05:6000:2508:b0:45e:a314:ce0c with SMTP id
 ffacd0b85a97d-4606da5f2bemr91014f8f.1.1781211280164; 
 Thu, 11 Jun 2026 13:54:40 -0700 (PDT)
X-Received: by 2002:a05:6000:2508:b0:45e:a314:ce0c with SMTP id
 ffacd0b85a97d-4606da5f2bemr90984f8f.1.1781211279694; 
 Thu, 11 Jun 2026 13:54:39 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606c0c2059sm1543733f8f.6.2026.06.11.13.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 13:54:39 -0700 (PDT)
Date: Thu, 11 Jun 2026 16:54:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Gavin Shan <gshan@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, jugraham@redhat.com,
 shan.gavin@gmail.com, qemu-block@nongnu.org
Subject: Re: [PATCH RFCv1] virtio: Inherit max bounce buffer size from bus
 parent if possible
Message-ID: <20260611165238-mutt-send-email-mst@kernel.org>
References: <20260608001821.850921-1-gshan@redhat.com>
 <20260610041036-mutt-send-email-mst@kernel.org>
 <20260610183046.GB121666@fedora>
 <20260610165710-mutt-send-email-mst@kernel.org>
 <20260611142022.GA202155@fedora>
 <20260611103513-mutt-send-email-mst@kernel.org>
 <CAFEAcA8RAsmrAArKz0X7NU6sCnKTC-e413TgwLp1gt2vJGLgPw@mail.gmail.com>
 <20260611110543-mutt-send-email-mst@kernel.org>
 <20260611183708.GA222320@fedora>
MIME-Version: 1.0
In-Reply-To: <20260611183708.GA222320@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uZPVapKakK_0yA8B7ODZywZsIBHGoSnpD4Oqpe6WPQc_1781211280
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, Jun 11, 2026 at 02:37:08PM -0400, Stefan Hajnoczi wrote:
> On Thu, Jun 11, 2026 at 11:09:35AM -0400, Michael S. Tsirkin wrote:
> > On Thu, Jun 11, 2026 at 04:04:20PM +0100, Peter Maydell wrote:
> > > On Thu, 11 Jun 2026 at 15:46, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Thu, Jun 11, 2026 at 10:20:22AM -0400, Stefan Hajnoczi wrote:
> > > > > Gavin posted the lspci output:
> > > > >
> > > > >   Region 0: Memory at 661ffd000000 (64-bit, prefetchable) [size=16M]
> > > > >   Region 2: Memory at 662000000000 (64-bit, prefetchable) [size=128G]
> > > > >   Region 4: Memory at 661ffe000000 (64-bit, prefetchable) [size=32M]
> > > > >
> > > > > These are prefetchable memory BARs, so I would expect them to be
> > > > > mmappable. Why does QEMU have no way of knowing upfront whether they can
> > > > > be mmapped?
> > > >
> > > >
> > > > They can be mmapped.  The issue is just that after mmap flatview uses
> > > > memcpy/memmove on them, and that might not match what guest driver is
> > > > expecting specifically for 1/2/4/8 byte accesses.
> > > 
> > > Huh? The guest driver has nothing to do with it, surely.
> > 
> > My answer is I don't know.
> > 
> > But the commit that introduced the regression says:
> > 
> > 	 The assumption here is that accesses initiated by the VM are
> > 	    driven by a device specific driver, which knows the device
> > 	    capabilities. 
> > 
> > > The
> > > problem is that for some PCI devices (like the network card
> > > mentioned in 4a2e242bbb30's commit message) the BAR is *not*
> > > safe for arbitrary access (because the actual real host hardware
> > > inside it is not RAM).
> > 
> > But we don't do arbitrary access. Why would we?
> > 
> > > That commit disabled direct access
> > > for all vfio MRs, which is safe but overcautious. Would
> > > "direct access is OK if this is a prefetchable memory BAR" be OK?
> > > Or do some prefetchable memory BARs still have restrictions
> > > beyond those of real RAM?
> 
> I wonder the same thing.

pci spec mostly made prefetcheable the default, and made
it a very weak signal.

but really, direct access is just always ok. bounce buffers
just do not have the bug of memory core besides that
they buy us nothing.

> > > 
> > > > Removing mmap is one solution, this is what vfio does now.
> > > > Fixing flatview is another.
> > > 
> > > No, you can't fix this in flatview. If a BAR is not safe for
> > > direct access then it is not safe for direct access.
> > > 
> > > -- PMM
> > 
> > There's no such thing as "not safe for direct access" in PCI.
> > All operations are memory operations.
> > What can be unsafe is accesses of specific width and length.
> > 
> > So we should not use variable length memcpy/memmove which
> > do that. Fixes length memcpy/memmove exactly mimic what
> > guest does, so they are safe.
> 
> The bounce buffer approach doesn't seem like a solution to me: if the
> device has alignment and size restrictions on accesses, then the bounce
> buffer won't get them right because it doesn't know where the registers
> live within the BAR.
> 
> Also, the guest initiated I/O to a VIRTIO device pointing to a buffer in
> another PCI device's BAR. In this case any failure to handle BAR
> accesses would be the guest's problem. It cannot assume that the VIRTIO
> device follows a specific DMA transfer pattern with respect to
> alignment/size.
> 
> Stefan



