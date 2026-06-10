Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84C3CD98C7
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 19:11:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXOKH-0000En-Ar; Wed, 10 Jun 2026 15:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wXOKG-0000EH-FY
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 15:10:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wXOKE-00032q-Lr
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 15:10:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781118653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dbZuCAR3Qw3b3+uFels71RaLeXUJjBvUUefXt7mDflE=;
 b=WmvLrtMrRXY32I+rX6q1l1XtrQAQKqtCSKcgKskRfHZ9DYMp5MlWFyg9jHg2Qge5JTWTDR
 RSdAFtt59IMCJC/awa/oTJrCD1S7Jbh0/asTtiPgM0KLce28uFoKV7BKsce5YwLYwHD0Fs
 XnWBHPnebV7ltoJET+flQ+MWuYQa7Ww=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-dDil65BqMEiE_bA1p-YEzw-1; Wed, 10 Jun 2026 15:10:49 -0400
X-MC-Unique: dDil65BqMEiE_bA1p-YEzw-1
X-Mimecast-MFC-AGG-ID: dDil65BqMEiE_bA1p-YEzw_1781118649
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51776d4355cso4395871cf.0
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 12:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781118649; x=1781723449;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dbZuCAR3Qw3b3+uFels71RaLeXUJjBvUUefXt7mDflE=;
 b=WRHHBq0L1cZjwrKXuJGeOrXwKiw+UFfeCAgHKP/443kFokuiEALdAuDlGlIu5eaSlK
 UjfbInXiHCLv8ShxJ+Y73cMJGUeQT+rpfcUS4Z4dDBzVDOVcQpXAKG/LQwuXDqYzN4i2
 bEndhuypLZJ98YLFqvxK6iGd8TE3mU3ehp/mabnDcX6QVBM7x0QysUcUrRgJxfJ3rc9X
 Iac5iEAflIfuWOq4FpP/0bTtgWzmgmy6nvZXQJLydLTc9eGCCwz9pQ88lswRl7K4iN/S
 QW3r+XwQE/rK9dlrFXcMNj+uZrQ1ju+4j+vPLvGkloPgv/XcPp372kampiJ9U9jGEc3T
 Hu+Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8BA/mz9ScZpXDCl+tAz9VhzkjC93lX/NHz1s83Nzf/dZ4bAV33Aw8MFYhjjGvRFzpWWWz3wXkNFw==@nongnu.org
X-Gm-Message-State: AOJu0Yy4HtSQMHGQJGlsiYpKHzvkPao7mjvj10Y9f21F5J4JEkTT8pso
 0wgCp0CRUd032V1vo7dsiaBcKWOu85G6aA3Yh3wCVCXdZfaIXm4sgkfutew/u7vYEvP0OzMBfLI
 QR0paBsMyuZ9oRmHSkOnPuVk4JoitBnyuAcCmRrAz+AuTcRVNUGt66A==
X-Gm-Gg: Acq92OH6hdtVe/UfupnTF00JDVrx69NgdRZ2zuZxRncTaqt1mhWFGqgs7BoGTZzFzCC
 2X9Pv4A/NvNDUGZzNPovkgyfDFbCFwdR0ijZywPnXja8OeBLHCofuCS0zPjYHkB7HDUvvcIdb2W
 nrd2GvIzLZqnPyyp+GLPZ+d5VFIW9rpKjfU7btIIAJCtc6Ix6eebkFSsc+XZzSrVXXM1jv4ZQPG
 XbGrBbCac5gKpsoPbY4PZvdlqPL1Dpue1CFF7rPz7TcHlNhnRh0HEesVsIyZ9JYbKAdrVcxlcA3
 BpRd6b+Y9zq/pQZfRxY+yWSvKVzXizUoyMildzdzUPGytXjGAv3xquRRR/UE8Pb2K/xPk6FKxMa
 sy6JLUUgnIpnlvkKFVWsaZMBE7g==
X-Received: by 2002:a05:622a:4010:b0:516:dc75:1aca with SMTP id
 d75a77b69052e-517987df360mr280200431cf.26.1781118649104; 
 Wed, 10 Jun 2026 12:10:49 -0700 (PDT)
X-Received: by 2002:a05:622a:4010:b0:516:dc75:1aca with SMTP id
 d75a77b69052e-517987df360mr280199731cf.26.1781118648633; 
 Wed, 10 Jun 2026 12:10:48 -0700 (PDT)
Received: from x1.local ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51775dbd2c9sm228149321cf.23.2026.06.10.12.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 12:10:48 -0700 (PDT)
Date: Wed, 10 Jun 2026 15:10:46 -0400
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
Message-ID: <aim2tpHiev3iOkDE@x1.local>
References: <674d5e21-88fa-4a10-a83c-eb6f7ce7032f@redhat.com>
 <20260610080947-mutt-send-email-mst@kernel.org>
 <eb0f0da1-11dd-4437-94fd-a65af55851e1@redhat.com>
 <20260610082637-mutt-send-email-mst@kernel.org>
 <5d8cbd4b-3725-437e-88a3-e0af32164815@redhat.com>
 <e7cc9f2d-ccb4-442f-a1ed-7c5474395099@redhat.com>
 <20260610095712-mutt-send-email-mst@kernel.org>
 <aimEl9QQ_LTRPLtd@x1.local>
 <CAFEAcA8HhC-=KwdbNE5jgqdP+H1VF1aJXdGaME8KsaDHhnBG9Q@mail.gmail.com>
 <20260610121846-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260610121846-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ujphGdcS65ZJYdbXpznyotuqoDkmiodbwiHv9eu7vbU_1781118649
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

On Wed, Jun 10, 2026 at 12:19:39PM -0400, Michael S. Tsirkin wrote:
> On Wed, Jun 10, 2026 at 05:11:40PM +0100, Peter Maydell wrote:
> > On Wed, 10 Jun 2026 at 16:37, Peter Xu <peterx@redhat.com> wrote:
> > >
> > > On Wed, Jun 10, 2026 at 10:06:24AM -0400, Michael S. Tsirkin wrote:
> > > > This is the change that broke it I think?
> > > >
> > > >
> > > > commit 4a2e242bbb306ef5c16ce9e7bb2da3bd8a4eb098
> > > > Author: Alex Williamson <alex@shazbot.org>
> > > > Date:   Mon Oct 31 09:53:03 2016 -0600
> > > >
> > > >     memory: Don't use memcpy for ram_device regions
> > > >
> > > >
> > > > Maybe Alex has an opinion on what to do.
> > >
> > > I can offer one idea here..
> > >
> > > IIUC the major issue was vector ops but the mr ops might be too heavy, then
> > > another way to fix it is in memory API instead of using memcpy()/memmove(),
> > > we always use a helper (say, memmove_no_vector()) to do the split and
> > > properly aligned IOs as what ram_device_mem_ops does right now, this should
> > > only applies to ram_device.
> > 
> > If the underlying memory needs to be accessed only with specific
> > alignment/size, as the 4a2e242bbb30 commit message suggests, then
> > we cannot expose it via address_space_map(), so we must have
> > a bounce-buffer.

I get the point; this is technically a concern, but IMHO it's still
slightly different, and I expect it non-issue in reality.

Essentially we can have two ways to iteract with the pci bar:

1) via vCPU / CPU access
2) via DMA targets

Alex can correct me, but IIUC that problem was when the CPU accesses the
mapped region with memcpy(), rather than making that bar to be DMA target.
Hence, use case 1) only.  So my current understanding is the proposal
shouldn't (hopefully..) regress that realtek problem because use case 1) is
properly covered.

I always think it is very bogus to have any register-like MMIO regions to
be passed over, maybe it's a bug already?  It's because I don't know any
way to guarantee DMA performs in a way that will be compatible with a pci
bar that is register-based and will not have any side effect.  Say, if some
pci bar (real register-backed) must be accessed in 4B and aligned, how
would a DMA request guarantee that?

From that perspective, IMHO it's a guest (driver or app, I'm not sure..)
bug to make such region to be DMA target in the first place.  The outcome
of such setup should be undefined.  It'll be the same after applying the
proposal I raised, that QEMU will have undefined behavior for such pci bars
to be used as DMA targets.

Thanks,

> 
> Right. And virtio currently isn't friendly to the bounce buffer.
> We can fix that but I worry about the perf impact.
> 
> > The address_space_map() function says
> > "here's a host pointer to  memory, do what you like to it", and
> > the caller is entitled to memcpy to/from it or otherwise
> > access it with any C operations, which are not guaranteed to
> > respect any kind of alignment or similar restrictions.
> > 
> > My guess from commit 4a2e242bbb30 is that that applied an
> > overly broad "don't do direct access" hammer to all
> > vfio assigned devices, and that there needs to be some
> > concept of "this vfio assigned device's region is OK for
> > direct access" vs "this other one is not", such that if
> > this GH100 card's BAR guarantees it can be treated entirely
> > as RAM then we can have memory_region_supports_direct_access()
> > return true for it.
> > 
> > thanks
> > -- PMM
> 

-- 
Peter Xu


