Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EDBCD4F2C
	for <qemu-arm@archiver.kernel.org>; Fri, 12 Jun 2026 08:43:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXxTt-0003wT-JU; Fri, 12 Jun 2026 04:43:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wXxTr-0003vq-RF
 for qemu-arm@nongnu.org; Fri, 12 Jun 2026 04:43:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wXxTq-0003Bo-63
 for qemu-arm@nongnu.org; Fri, 12 Jun 2026 04:43:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781253789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CiQsaORxtMIvHq95jZcjcnF36rd1YYR82LOVNgV3M+Q=;
 b=AnVf4B8w1IedTkUqEPC30Ltmk0IGP8W8mdi6YCedfVodXJInPKoKUdQjPGZKzoV4I+hmcG
 B7ZU6wZKH16rhk4l8fQe5+a+83niFwF01GP/M5EAZqBgtMgImmi0AFAZyQjYGiyvyR8YOI
 3TMLoCRvqyhJ8KN2auL9XMN2HpKa6Gs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-KJwR8qVYOtyP4GhdPxxRoA-1; Fri, 12 Jun 2026 04:43:05 -0400
X-MC-Unique: KJwR8qVYOtyP4GhdPxxRoA-1
X-Mimecast-MFC-AGG-ID: KJwR8qVYOtyP4GhdPxxRoA_1781253785
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-490b5d2e394so4605795e9.3
 for <qemu-arm@nongnu.org>; Fri, 12 Jun 2026 01:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781253784; x=1781858584;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CiQsaORxtMIvHq95jZcjcnF36rd1YYR82LOVNgV3M+Q=;
 b=FH5TXTjCRvUtsTEY2GWvpgWZ1iLhDYbZ7z7WaQIUoBVRnbL1Fb+rz3OCK+BQe/l1za
 cTDpnWYoBCnf0kC3/c0C0CT3FQDtDjo9bt8qBIRPnZsutSeX6JpPY/xj7NzAmyJaF2XG
 tbwREih3Q8GFscN+A3GmwH+M6y7Ud8dqVjwN2Dzk8uqEhV08WMcHVIurDduib+bukkE/
 8YlWrtbB2ONKJi11XSxCkrqK+wqqzcSj21zv3BvEEZzrPSpWYQp88b63n6GU6MJbJHkk
 unFm5O5pzXzCMXV7T28n54EfBIzRDfP3UPv23BVf+KPKZa4ckPVbyh3FuyTV+0mQLHkE
 1jgw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9owr/uUQ0opTVIt3RUzoP8P3bjywzJ+Uxg8b95XF1wV9tFTz1qVmq9Rza/1UgGjVrv83UQ63UUVw==@nongnu.org
X-Gm-Message-State: AOJu0YxNnhCJ1dTOdLHV0EsP4/JboicsS6JPPCnzRB5v7XxEtbKgoCh+
 hu5MBcVOr6E5fHybdWokJpwT54o+k+qas9gvlUDs1NvZbwgRw5IUclN2kMRB40z/5Yq1gFQu6aZ
 mSvWun+LGmkCoXkUeD9EnHIiq9jnr8x/VSaJXemboTk4lN0DU4iMKEg==
X-Gm-Gg: Acq92OGVvpOmYjzwQmxKz7JVG5Ydxs7MfMZ49gwXkzq3aAFGmwx2GvdTn8qNF8zMprI
 1LThyc/2UrbzAFQxwiaugfFVUmLfp9Br47M9m+UKZgOQPhBiiUCwLkpx8J+bu3wqWm/pBnYOCb+
 w2sRKLgVU3WqBXYdN8l9x9zUl9Z50TTG19lClrrUV0oh/xMb1WTPWoR5ueuBF4B3uF6TrdISpM1
 qaOTJPZkE0bECRh9m1h6/1slSBQ2ARRw9cTFtuYDenYKGZemfCTr065zDDAqTkRunyZrKU9U/d1
 1oHRFGzCl/odKPtftiw9i18xy7691QUFjZTJ3bk+9jz5i+qljnzmJir2Fuu6croGxK3uWMwA1v+
 EzUN2IBe+15T5O032HJbYR49gNGpdhDWD4e+Mlo27o4Q=
X-Received: by 2002:a05:600c:820c:b0:490:bcf6:46bf with SMTP id
 5b1f17b1804b1-490ec4cdf95mr21839265e9.9.1781253784334; 
 Fri, 12 Jun 2026 01:43:04 -0700 (PDT)
X-Received: by 2002:a05:600c:820c:b0:490:bcf6:46bf with SMTP id
 5b1f17b1804b1-490ec4cdf95mr21838565e9.9.1781253783662; 
 Fri, 12 Jun 2026 01:43:03 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2e6a8fsm3701992f8f.37.2026.06.12.01.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 01:43:03 -0700 (PDT)
Date: Fri, 12 Jun 2026 04:43:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Xu <peterx@redhat.com>,
 Pavel Hrdina <phrdina@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, jugraham@redhat.com,
 shan.gavin@gmail.com, Alex Williamson <alex@shazbot.org>,
 David Hildenbrand <david@kernel.org>
Subject: Re: [PATCH RFCv1] virtio: Inherit max bounce buffer size from bus
 parent if possible
Message-ID: <20260612044147-mutt-send-email-mst@kernel.org>
References: <20260610095712-mutt-send-email-mst@kernel.org>
 <aimEl9QQ_LTRPLtd@x1.local>
 <20260610121026-mutt-send-email-mst@kernel.org>
 <1e9515c9-7e32-4d95-9b73-aab8bf10bddc@redhat.com>
 <20260611012217-mutt-send-email-mst@kernel.org>
 <3726a607-6cac-41f1-b402-0eed7c4e3fe3@redhat.com>
 <20260611023428-mutt-send-email-mst@kernel.org>
 <0c3f1dba-3b2c-43c5-b181-1426f6da0951@redhat.com>
 <CAFEAcA8Q9qEaZS8wCpZQ-4jpAnQ9JXvnb7iSeRTdhJ9Y3BcCRg@mail.gmail.com>
 <ec32c5ae-782c-4c83-8432-23d979552fbe@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ec32c5ae-782c-4c83-8432-23d979552fbe@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RkvhXBlhFzjrVu-Z2aUQnabNWc8Llt-4mWnfl8xFCQo_1781253785
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Fri, Jun 12, 2026 at 02:25:07PM +1000, Gavin Shan wrote:
> On 6/11/26 10:48 PM, Peter Maydell wrote:
> > On Thu, 11 Jun 2026 at 13:34, Gavin Shan <gshan@redhat.com> wrote:
> > > 
> > > Let me try to summarize what I understood. As VFIO is concerned, there
> > > are multiple memory regions for one particular PCI BAR, and they're stacked
> > > up. The memory regions for PCI BAR#4 of the GH100 card looks as below.
> > > 
> > >     (qemu) info mtree
> > >                :
> > >     address-space: pci_bridge_pci_mem
> > >       0000000000000000-ffffffffffffffff (prio 0, container): pci_bridge_pci
> > >         0000042000000000-0000043fffffffff (prio 1, i/o): 0009:01:00.0 base BAR 4          <---- (1) VFIOBAR::mr
> > >           0000042000000000-0000043fffffffff (prio 0, i/o): 0009:01:00.0 BAR 4             <---- (2) VFIOBAR::VFIORegion::mem
> > >             0000042000000000-000004379fffffff (prio 0, ramd): 0009:01:00.0 BAR 4 mmaps[0] <---- (3) VFIOBAR::VFIORegion::VFIOMap::mem
> > > 
> > >     (1) Its MemoryRegionOps is NULL. No data accesses are routed to this region
> > >     (2) The data accesses routed to this region is handled by pread() and pwrite()
> > >     (3) The data accesses routed to this region is handled by memcpy() before
> > >         commit 4a2e242bbb.
> > > 
> > > There are identified PCI devices who have quirks, see vfio_bar_quirk_setup().
> > > Accesses to part of the PCI BAR have to be emulated by the extra IO regions,
> > > something like below for rtl8168 PCI device, where two extra IO regions are
> > > stacked up for the quirks.
> > > 
> > >     address-space: pci_bridge_pci_mem
> > >       0000000000000000-ffffffffffffffff (prio 0, container): pci_bridge_pci
> > >         0000042000000000-0000043fffffffff (prio 1, i/o): 0009:01:00.0 base BAR 4          <---- (1) VFIOBAR::mr
> > >           0000042000000000-0000043fffffffff (prio 0, i/o): 0009:01:00.0 BAR 4             <---- (2) VFIOBAR::VFIORegion::mem
> > >             0000042000000000-000004379fffffff (prio 0, ramd): 0009:01:00.0 BAR 4 mmaps[0] <---- (3) VFIOBAR::VFIORegion::VFIOMap::mem
> > >             0000042000000010-0000042000000014 (prio 1, i/o): 0009:01:00.0 BAR 4 quirk[0]  <---- (4) quirk[0]
> > >             0000042000000018-000004200000001c (prio 1, i/o): 0009:01:00.0 BAR 4 quirk[1]  <---- (5) quirk[1]
> > > 
> > > Access on 0000042000000010-0000042000000014 should be routed to region (4) quirk[0]
> > > and access on 0000042000000018-000004200000001c should be routed to region (5) quirk[1].
> > > However, accesses to 0000042000000000-0000042000000020 are routed to region (3) before
> > > commit 4a2e242bbb and the data transfer is done by memcpy(), bypassing region (4) and
> > > (5). It's not the expected behavior and why memcpy() isn't expected on device rtl8168's
> > > PCI BAR due to the quirks, answering your question.
> > > 
> > > With commit 4a2e242bbb applied, the accesses will be routed to the correct region.
> > 
> > The way I read 4a2e242bbb's commit message, it isn't about things being routed
> > to the wrong region. It's about the handling of areas which aren't in the small
> > quirk regions but which are in the same 4K page as them. These have to
> > be handled
> > via the memory subsystem's "subpage" mechanism. This does route
> > everything to the
> > correct region, but if the region (3) is marked as "direct access is OK" then
> > QEMU assumes that any kind of direct access is OK, i.e. this behaves
> > like true RAM.
> > It then does a memcpy access to a BAR that's really a bank of device registers,
> > and this goes wrong.
> > 
> 
> Ok, thanks for your followup and explanation. I also spent some time going through
> system/memory.h and system/physmem.c. I think I fully understood the issue now. There
> are two concerning paths as mentioned by Peter Xu in another reply: (a) vCPU accessors
> like address_space_rw(), address_space_write_rom(), address_space_ldq(), address_space_stq()
> and their variants; (b) functions used in the DMA path like address_space_map() and
> address_space_unmap().
> 
> For (a), memmove() and memcpy() are used, and they can be replaced something else that
> is safe. However, the replacement in (a) can't fix the issue existing in (b). In (b),
> the host's pointer is returned by address_space_map() and the memory block (perhaps not
> a real RAM block) can be accessed in all means after that. I guess we have to ensure
> the memory region is a real RAM block before the pointer can be returned in (b). Otherwise,
> we still fall back to the bounce buffer in (b).


No guest will DMA into a "non RAM block". Whatever is a DMA target, is a
'real RAM block'.

> > > Back to our case (GH100 card), there are no quirks for the PCI BAR (0009:01:00.0 BAR 4)
> > > so it's fine mark the RAM DEVICE region as directly accessible. We perhaps needn't host
> > > to export the capability (VFIO_REGION_INFO_CAP_DIRECT_ACCESS) suggested by you. It's
> > > safe to mark any PCI BARs as directly accessible if they have no quirks attached. All
> > > the devices except those listed in vfio_bar_quirk_setup() are capable of this.
> > 
> > I still feel like there are different kinds of PCI BAR here ("this BAR is
> > true RAM and can be accessed arbitrarily" vs "this BAR is full of registers
> > and can't be handled that way") and the vfio code in QEMU needs to set up
> > the memory regions differently for the two cases. For your example I think
> > it would be fine to have direct-access even if there were some kind of
> > quirk memory region, because for the parts of the BAR that aren't covered
> > by a quirk overlay the underlying BAR still allows "entirely like RAM,
> > any alignment and size is OK" accesses.
> > 
> 
> Agreed. If the PCI BAR is a 'real RAM block' is determined by hardware vendor. I
> think the solution proposed by Michael is a nice one as this specific case is concerned:
> A flag (capability) is returned by nvgrace_gpu_vfio_pci driver to indicate that the
> PCI BAR is a 'real RAM block' and tolerant to all kinds of memory accessor. QEMU marks
> the memory region for this PCI BAR as directly accessible. Alternatively, qemu also
> can determine the capability by the PCI device's vendor/device/subsystem/version information
> in hw/vfio/region.c.
> 


I sent it before I understood the issue.

> > -- PMM
> > 
> 
> Thanks,
> Gavin


