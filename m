Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1B3CD98CF
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Jun 2026 18:21:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXk1e-0006Z0-H1; Thu, 11 Jun 2026 14:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wXk1Z-0006Xc-Q2
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 14:21:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wXk1V-0003D6-1x
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 14:21:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781202059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0WLt1Fk1RQDczmAZOq2+lKfmteOOCS1rLgGIB4ASalI=;
 b=NG137qGoeV8vfEvYJ0ywSxHa4qs+xrbKgodjKGdQ9L+PIf+OOxJe+caajMoxB2Zvgtvnix
 QaxMgZB8gPxt5Q27nDlJMlB0vbu9/QmbE/cCClYzwasEl1GdLl+kgvJk/li3d1tmWTAm6H
 7p6QwGayTKed4WeoNLRvbg3hA7soxso=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-PiRBXLztOaSM1zPA-mQDZw-1; Thu, 11 Jun 2026 14:20:58 -0400
X-MC-Unique: PiRBXLztOaSM1zPA-mQDZw-1
X-Mimecast-MFC-AGG-ID: PiRBXLztOaSM1zPA-mQDZw_1781202057
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5176d949c58so1876081cf.0
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 11:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781202057; x=1781806857;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0WLt1Fk1RQDczmAZOq2+lKfmteOOCS1rLgGIB4ASalI=;
 b=gK24dcsEHdD6uuyoQOfqaSnHD18BYy+hCREk7wZqemgvN90NDihQAcIUp45aINj+iL
 zjzzL5YKDZxxbrW9SFjO6W0WcUdP3bC01xGRdDPN85lvX/AWzYUptB11zKfTbBFxJ4cU
 OmHNHpe/arBU7D7ErHaj596+rrOPyXzuIE9N6I3++4BZTPT4a/TH/Kwibig0k2Lyt0x0
 9V9v3Ue27unluOLUrVGo9GQLKyzXQaFUgZBDoTfxYbFi0xuMAmkOBRG6D2/vYX/9ahB2
 BYuPNQ2ZqiqW/yKzBoifDraIPIGIYJd9Rh2GZviCMoAYKcBcS1FfE95EwCFuTuuCwRRG
 vrAg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/INud3GXF6ycZ2fryuyXNsRi44VmfFpd+23ZpdthjvsoyXP0d0MX71UUn5sKza5PU9F7x76O7Vpw==@nongnu.org
X-Gm-Message-State: AOJu0YywvdsNXPmplxA/wBr5fot2FKMuL6X1SHan/d/UncgjQD0sr81O
 y3q071LfbujV/MexqeEssdUoTtQfvLNK9kvRjQF/MTdULB5VwgsRcggGNebSnWO3Bn+kYpZVfj7
 90b22vYbEvbO4mhDXRL65mwdem7/GV82QRAtA81v3hbgH+2VK8BhGTQ==
X-Gm-Gg: Acq92OHUYMTDk3et7UJq0Qt7YYVzgK4Kq1PE66+6BItRVeOQVTmLQoMFY3WhrFnAlyg
 Mhl/QXmkePK5O4295iGB4KS9GVJLyZdSjCRLdHXdMX4Llb5Pn4KkSI66ns3dnnJhSOvgp7lgW2p
 GRX0G5Eq5TgxLL9j4BevKx4AuHxVWUNdyNOafRwBEnao5cXGoD0+1S5Z5XenaOBUBrBM9cwfX0U
 TOKwLYA1gHaRVs6VLL7bRgu+UaMqk8Co5vbOnYJBdP/HuNeLamEQfg5lSnGAJE71fXwS+cTtVjC
 zk2LzeHG1kt8wwgHZ4U63nuDgjA72BIBLbWLBHCrVPtbCWkvTnkL7XyQQyY6mOUYQnGG5cSxFnc
 ytGPM56l3Wz1Soic=
X-Received: by 2002:ac8:7d52:0:b0:516:eaf9:f6f1 with SMTP id
 d75a77b69052e-517edd2fb18mr59854931cf.13.1781202057230; 
 Thu, 11 Jun 2026 11:20:57 -0700 (PDT)
X-Received: by 2002:ac8:7d52:0:b0:516:eaf9:f6f1 with SMTP id
 d75a77b69052e-517edd2fb18mr59854421cf.13.1781202056591; 
 Thu, 11 Jun 2026 11:20:56 -0700 (PDT)
Received: from x1.local ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8d302114676sm785016d6.20.2026.06.11.11.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 11:20:56 -0700 (PDT)
Date: Thu, 11 Jun 2026 14:20:54 -0400
From: Peter Xu <peterx@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Gavin Shan <gshan@redhat.com>,
 Pavel Hrdina <phrdina@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, jugraham@redhat.com,
 shan.gavin@gmail.com, Alex Williamson <alex@shazbot.org>,
 David Hildenbrand <david@kernel.org>
Subject: Re: [PATCH RFCv1] virtio: Inherit max bounce buffer size from bus
 parent if possible
Message-ID: <air8hrlhrkaoJ4wi@x1.local>
References: <CAFEAcA8Q9qEaZS8wCpZQ-4jpAnQ9JXvnb7iSeRTdhJ9Y3BcCRg@mail.gmail.com>
 <20260611093049-mutt-send-email-mst@kernel.org>
 <CAFEAcA-8Hv0o3PibjH=8jixsHyunH2HkOAMQVqHkGr34b1Ascg@mail.gmail.com>
 <20260611110156-mutt-send-email-mst@kernel.org>
 <CAFEAcA_2oZepwCoPS+cMgdnrSTj=mCGzdFZf5gGRHJK13yqaKQ@mail.gmail.com>
 <20260611114811-mutt-send-email-mst@kernel.org>
 <CAFEAcA9HUGfDgHjvCemPPNkp6FfvQp+4y7qCnw+ROFpG3+ybMw@mail.gmail.com>
 <20260611123952-mutt-send-email-mst@kernel.org>
 <CAFEAcA8vOMd64cCkfCyc1wNbjEY+bnhFPce-V_WbAuXrUnP8cw@mail.gmail.com>
 <20260611130037-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260611130037-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Aobhts2yf3FNlldfv-m1CuLaOpJ4rndYWlRxg83hHJ8_1781202057
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Thu, Jun 11, 2026 at 01:02:34PM -0400, Michael S. Tsirkin wrote:
> On Thu, Jun 11, 2026 at 05:53:54PM +0100, Peter Maydell wrote:
> > On Thu, 11 Jun 2026 at 17:42, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Thu, Jun 11, 2026 at 05:16:09PM +0100, Peter Maydell wrote:
> > > > On Thu, 11 Jun 2026 at 16:57, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > Then I'd like to see an example where we have an actual good reason
> > > > > to do execute arbitrary width accesses on device RAM when the
> > > > > driver does not execute them, please.
> > > >
> > > > That's the case we started with, with this GPU where the
> > > > virtio data structures are in this PCI BAR. We want the
> > > > virtio backend to have the freedom to say "I'm just going
> > > > to assume the ring buffer etc is in RAM, and I don't need to
> > > > care about carefully ensuring that I only do word accesses".
> > >
> > > virtio backend does not need to assume anything. any spec
> > > compliant guest guarantees it. any address given to
> > > a virtio device is ram.
> > 
> > OK, but how do we tell if the mmap() PCI BAR we have is RAM
> > or not ? Some of them are, some of them aren't...
> > 
> > -- PMM
> 
> We don't care? If guest asked a virtio device to access
> memory then that memory better support accesses guest
> requested, and on virtio that means any width.

Yes that's also my understanding that QEMU shouldn't care, if on bare metal
if it is a grey area with undefined behavior, then QEMU should also be fine
to make it undefined.

Only one (IMHO, very slight..) concern is, if such "undefined behavior"
operation may crash QEMU rather than causing a sigbus like what normally
would happen on a bare metal.  I'll put that discussion at last since I
don't know if it's that important.

So taking that e1000 bug into account, looks like we have more of such user
that wants explicit control over the memory operations, likely with
attibutes:

- Aligned only

- No vectored inst

- No possible duplication (perhaps it means, only use atomic access??? per
  PeterM's explanation in another email)

I wonder if we should do this by default to all IOs, I think it might have
an unwanted impact on general perf.  One idea is we can introduce a new bit
in MemTxAttrs: say, mmio_strict, which will follow above stricter rule of
doing IO.

Then for ram_device, when doing memory access we should also use the same
set, hence something like:

  if (memory_access_is_direct(mr, ...)) {
    if (MemTxAttrs.mmio_strict || memory_region_is_ram_device(mr)) {
        memmove_strict_mmio(); // or memmove_no_vector(), or ...
    }
  }

I also want to bring us to the same page on differenciating two things:

- about direct access definition: so far, I want to define this almost as
  "it is directly accessible from host virtual address space".  It means
  ram_device definitely falls into this category, so it's a sub-category
  only but enforces strict mmio as above

- bounce buffer: I want to make sure we're on the same page this is
  something totally solving different problem of what we're looking at for
  ram_device.  Essentially this is only needed if mem is not "direct
  access".  Otherwise we shouldn't need it (including ram_device).

I'm not sure if above sounds reasonable.  The hope is with that we should
fix both this GPU and e1000 issues (e1000, and maybe other places, needs to
start passing MemTxAttrs.mmio_strict, though, if we want to keep the
default to be still fast-path to use memcpy()/memmove()?).

Thanks,

=========================

Two cases here on the concern:

(1) if fully emulated device, non-issue afaiu because whatever DMA does
(with vectored ops) will only apply to QEMU process (like a bounce
buffer..) so it won't crash,

(2) if it's a VFIO device (not the GPU case, but when like realtek and some
guest driver registers it as a DMA target), logically the guest should
receive a bus error, but for QEMU's case it may crash QEMU with SIGBUS:
sigbus_handler() doesn't process anything except memory failures so far, it
seems.  The right thing might be that we forward this sigbus to guest, but
I didn't check further.

But I don't know if it would really happen, better verify it, and even if
it will happen I still think it's a very niche security use case to cover
so far.  Doesn't seem to be a blocker to fix a real perf problem first with
RAM-like GPU devices.

-- 
Peter Xu


