Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650C5CD98C7
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 21:28:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXQSd-00028v-J7; Wed, 10 Jun 2026 17:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wXQSb-00028R-TS
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 17:27:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wXQSa-0005Pf-5r
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 17:27:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781126859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oktp8Pas9YaCpF/tWy9A6ZVZtdsYSHYanoVUwn0XCnM=;
 b=FM27SQX198DRXnlMSgQ1fQzeUSR1zIBL57ZpPJqTjkDBr1oXl04RvXaeSEQXBue6FFiek5
 8rEA437xqUYrhBDGE1obb3tT16duDf2rnVm68bP4vbJWUYBIaJmSj40ygw8qX2ebSbl08s
 aryGnJOTHyS1qsXbTYuSjn/hIHjGDVU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-RyRvq1yGMFyFYjb9WAsDXw-1; Wed, 10 Jun 2026 17:27:35 -0400
X-MC-Unique: RyRvq1yGMFyFYjb9WAsDXw-1
X-Mimecast-MFC-AGG-ID: RyRvq1yGMFyFYjb9WAsDXw_1781126855
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-915d3261c5cso882565285a.3
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 14:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781126855; x=1781731655;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oktp8Pas9YaCpF/tWy9A6ZVZtdsYSHYanoVUwn0XCnM=;
 b=JJcw3HcJrtRAaPe3e5OIuKOvFRTbcTek9v9uOb+u/hiv/F9Y+xrNn2j6K3Qz15IUsp
 KQRBcgti2Y68jFBd8GQlQ1afZ9SSRrSwFi8X0+yHthepAprKYp8LIOJCdiZf6QBMktkN
 zKC0VXAAI1p8j4d2fzcAp3pnusGLqBGa0gAtRucbfJMk9jNtBaj4iCcj0Ze1bFKh/ctW
 T+6TMKPlwl0lkPFGr2b67COK/kc3bu1eqW53Mf69ma98bXq6Y9Y326l0CiqL5g4aBhZC
 /rJoO5QStNQW0rsBRzhS09U0L1PvOhoKJoXVBrfdpycaK0k0FBslT3m07gYmXu4fGLDF
 FilQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8pNyqzofI3kKduaJ/iJIyz4IWxTZReGDTtPYtisw+4ZMYIv8M5rk6DFgimdCcs6VFe3pvYtingYw==@nongnu.org
X-Gm-Message-State: AOJu0YwSQjtt+CwIWyT1Vb4oT400urZIvYhJV8MVP79ojKHFxlspDMmm
 aVRIZ6M6fFBh4qqhwR+D4Ia4gSY/g6iT6gj0Rh2c0cbf4bBsCWfTsX1IEoQYH1DVd/QampuXaaG
 8ktOQH0uRh2qBKCBY8pv2YyTcpe+uKn1LSNSOXO3vGHYGTuAfGgYTgIogGKhKKw==
X-Gm-Gg: Acq92OFXGln0291UVD2q6OyTx5gAG8aumoDhsi9B6QCCzc7oi1zSO3+AjZ3BRuE/zam
 lIKZKic+HRGNjEnE0JUMQkvbgXLgPpnFL26Vp6w06IPGoxxraR4LpJnxk969y4zh4BbjltY1DvI
 IckrYfOJHQTsMBH9wlO0WZ7gOQ4wpS/x7i+emsTR/SndDjwqp2L+0wj0S8xdtbksxr1uiLT97Tr
 m/liTVs/DkX1c4cz6Q6L7SgP8lhFE4AlTOVskBk6KaH8uOhvfGvaTeEN0DzYRwZk8AgmoNTmrn+
 myqbtTwFCFDYR8fKXaIxrgy2eAjSak3n6fM3Vo6Qcu1Bd1Azq1QbOp5QexnUbh07vqwARqCAGCh
 yOCG3l+Iiw9R7csNz6gorDklsDg==
X-Received: by 2002:a05:620a:690d:b0:915:a457:bf94 with SMTP id
 af79cd13be357-915a9da93f1mr4540585885a.48.1781126855168; 
 Wed, 10 Jun 2026 14:27:35 -0700 (PDT)
X-Received: by 2002:a05:620a:690d:b0:915:a457:bf94 with SMTP id
 af79cd13be357-915a9da93f1mr4540580085a.48.1781126854600; 
 Wed, 10 Jun 2026 14:27:34 -0700 (PDT)
Received: from x1.local ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9159cd628f8sm2219398585a.4.2026.06.10.14.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 14:27:33 -0700 (PDT)
Date: Wed, 10 Jun 2026 17:27:31 -0400
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
Message-ID: <ainWw13-_TfX_vln@x1.local>
References: <eb0f0da1-11dd-4437-94fd-a65af55851e1@redhat.com>
 <20260610082637-mutt-send-email-mst@kernel.org>
 <5d8cbd4b-3725-437e-88a3-e0af32164815@redhat.com>
 <e7cc9f2d-ccb4-442f-a1ed-7c5474395099@redhat.com>
 <20260610095712-mutt-send-email-mst@kernel.org>
 <aimEl9QQ_LTRPLtd@x1.local>
 <CAFEAcA8HhC-=KwdbNE5jgqdP+H1VF1aJXdGaME8KsaDHhnBG9Q@mail.gmail.com>
 <20260610121846-mutt-send-email-mst@kernel.org>
 <aim2tpHiev3iOkDE@x1.local>
 <20260610170146-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260610170146-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KGPxpwc0losFRr--8f28M49OAPoGFhwgRKpOETnLR8g_1781126855
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

On Wed, Jun 10, 2026 at 05:03:59PM -0400, Michael S. Tsirkin wrote:
> On Wed, Jun 10, 2026 at 03:10:46PM -0400, Peter Xu wrote:
> > On Wed, Jun 10, 2026 at 12:19:39PM -0400, Michael S. Tsirkin wrote:
> > > On Wed, Jun 10, 2026 at 05:11:40PM +0100, Peter Maydell wrote:
> > > > On Wed, 10 Jun 2026 at 16:37, Peter Xu <peterx@redhat.com> wrote:
> > > > >
> > > > > On Wed, Jun 10, 2026 at 10:06:24AM -0400, Michael S. Tsirkin wrote:
> > > > > > This is the change that broke it I think?
> > > > > >
> > > > > >
> > > > > > commit 4a2e242bbb306ef5c16ce9e7bb2da3bd8a4eb098
> > > > > > Author: Alex Williamson <alex@shazbot.org>
> > > > > > Date:   Mon Oct 31 09:53:03 2016 -0600
> > > > > >
> > > > > >     memory: Don't use memcpy for ram_device regions
> > > > > >
> > > > > >
> > > > > > Maybe Alex has an opinion on what to do.
> > > > >
> > > > > I can offer one idea here..
> > > > >
> > > > > IIUC the major issue was vector ops but the mr ops might be too heavy, then
> > > > > another way to fix it is in memory API instead of using memcpy()/memmove(),
> > > > > we always use a helper (say, memmove_no_vector()) to do the split and
> > > > > properly aligned IOs as what ram_device_mem_ops does right now, this should
> > > > > only applies to ram_device.
> > > > 
> > > > If the underlying memory needs to be accessed only with specific
> > > > alignment/size, as the 4a2e242bbb30 commit message suggests, then
> > > > we cannot expose it via address_space_map(), so we must have
> > > > a bounce-buffer.
> > 
> > I get the point; this is technically a concern, but IMHO it's still
> > slightly different, and I expect it non-issue in reality.
> > 
> > Essentially we can have two ways to iteract with the pci bar:
> > 
> > 1) via vCPU / CPU access
> > 2) via DMA targets
> > 
> > Alex can correct me, but IIUC that problem was when the CPU accesses the
> > mapped region with memcpy(), rather than making that bar to be DMA target.
> > Hence, use case 1) only.  So my current understanding is the proposal
> > shouldn't (hopefully..) regress that realtek problem because use case 1) is
> > properly covered.
> > 
> > I always think it is very bogus to have any register-like MMIO regions to
> > be passed over, maybe it's a bug already?  It's because I don't know any
> > way to guarantee DMA performs in a way that will be compatible with a pci
> > bar that is register-based and will not have any side effect.  Say, if some
> > pci bar (real register-backed) must be accessed in 4B and aligned, how
> > would a DMA request guarantee that?
> > 
> > >From that perspective, IMHO it's a guest (driver or app, I'm not sure..)
> > bug to make such region to be DMA target in the first place.  The outcome
> > of such setup should be undefined.  It'll be the same after applying the
> > proposal I raised, that QEMU will have undefined behavior for such pci bars
> > to be used as DMA targets.
> > 
> > Thanks,
> 
> Sorry, wasting gibabytes and GB/s of main
> RAM and PCI BW just to shuffle data back out the PCI bus
> is out of the question.
> 
> You don't have to like it)

I'm not sure if my previous comment wasn't clear, but just to make sure it
is..

The proposal was exactly about making ram_device to be directly accessible
by default.  That is, make memory_region_supports_direct_access() return
true for ram_device like before, however when doing direct access from
QEMU, QEMU should use memmove_no_vector() version instead of memcpy().

We leave DMA maps like virtio-blk to be directly accessible without
auditing device emulations using memcpy() or not: then QEMU faces the same
risk to bare metal where MMIO regions used for DMA buffers, then it's
undefined behavior.

In case of GPU bar mapping, it should then work like RAM for virtio-blk.

Thanks,

> 
> > > 
> > > Right. And virtio currently isn't friendly to the bounce buffer.
> > > We can fix that but I worry about the perf impact.
> > > 
> > > > The address_space_map() function says
> > > > "here's a host pointer to  memory, do what you like to it", and
> > > > the caller is entitled to memcpy to/from it or otherwise
> > > > access it with any C operations, which are not guaranteed to
> > > > respect any kind of alignment or similar restrictions.
> > > > 
> > > > My guess from commit 4a2e242bbb30 is that that applied an
> > > > overly broad "don't do direct access" hammer to all
> > > > vfio assigned devices, and that there needs to be some
> > > > concept of "this vfio assigned device's region is OK for
> > > > direct access" vs "this other one is not", such that if
> > > > this GH100 card's BAR guarantees it can be treated entirely
> > > > as RAM then we can have memory_region_supports_direct_access()
> > > > return true for it.
> > > > 
> > > > thanks
> > > > -- PMM
> > > 
> > 
> > -- 
> > Peter Xu
> 
> 

-- 
Peter Xu


