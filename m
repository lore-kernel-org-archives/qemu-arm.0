Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0F4CD4F21
	for <qemu-arm@archiver.kernel.org>; Tue, 12 May 2026 23:12:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMwH7-0005R3-CV; Tue, 12 May 2026 19:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wMwH1-0005Nb-GG
 for qemu-arm@nongnu.org; Tue, 12 May 2026 19:12:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wMwGs-0006LU-B4
 for qemu-arm@nongnu.org; Tue, 12 May 2026 19:12:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778627531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YasJDCzxfNBcrakQ0lPIeppZdyED0d1agrLsSyUi29A=;
 b=bsbDpKH0ZCLUcOK7Ac0tx0KFXj2TZxoQnYKV9JtW+r68P4qHUgITlymtu1LOaj6/k43BZj
 eJ4Poji1VSF+10uO38cL39U1lRgb5HrDB60d5JeqsMqzkJxEoyhPEdnXlusaz3BcPT+fWG
 1lKglkw1hx55+lNmjs0GOlHYg9udCA8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-hxcXmOi0Pdi5MoAgf5yG2w-1; Tue, 12 May 2026 19:12:10 -0400
X-MC-Unique: hxcXmOi0Pdi5MoAgf5yG2w-1
X-Mimecast-MFC-AGG-ID: hxcXmOi0Pdi5MoAgf5yG2w_1778627529
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-44696b11265so6883307f8f.0
 for <qemu-arm@nongnu.org>; Tue, 12 May 2026 16:12:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778627529; x=1779232329;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YasJDCzxfNBcrakQ0lPIeppZdyED0d1agrLsSyUi29A=;
 b=rqQ1gOKB5RMOStzr/o9aAHt1S+8iCBcl5lWy7+P5v+wzKJFXNloG/9rcYbXFhNRvkr
 WBXs/cYBb1r7V6T3aQnlaKYbq/QmYgW0a/DvhU5t30TiF0MuR3Wn/4FUF7b4+fcRmFBn
 0Z9zvwv779D7lahQE5Lwrs8pmKIfBx+6LGfXwR0cOGzo0oqPse31ZiQnbKXTDoJU7XfH
 BHLXAjK7I/rtiFRS0HTuwfmgZlWekOUq25gtVk5gv8LavDivaSmh9AA5yxHf8DDLd6tA
 ftIn+aJNikKt/kzwdTABuUUWTA3MketDq9+8X2Qwxrq0k03YihtBOUUSbjP2MFGWpCjz
 PviA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/P7jpisYmHdpAEPgtazQH2/qIaxuiwlONinhjnf4D75o/2mxJydxbTGBp2e6SXa2vYOJRuw3aKQw==@nongnu.org
X-Gm-Message-State: AOJu0Yz2L9YI/Lo3TU/D7dJVC6mJSksCta27EDvczJU7+Q+dtSeg9wdP
 VCLht6rMzUhJCohPxVjI2pRm+6PgcVZMzCwtjLx3cFX/8XeKB+S0ZcbN3FpdcNmJvTtMwRrsTQ1
 w8TXObA/Vi47B3S4zjnDEK70lmiF0c6Q8Z9bU+EkF+4KJDwm11iZV5Q==
X-Gm-Gg: Acq92OFZfDtaSDnGhkQdVDoduAvggeLFw4X9h9S43NWqCxHW1feUPZ/swJJULFy87Ei
 xFj5UcOfLzXaapk5DdwoqWMuXvpvg7LcVzjVT0EDrG61PmysHe8J6O2rvgHKcNo2CzNZcoZhU1x
 k6zxnreDen8AUHnZUitAM0NhoPh1w4cGT3Q0042y311AVYe0kMCAC8+KKd/jaSyZNABY41JSsIN
 TS8ItEvzGsGJ8JaOqNTtKEeEzF8/Yn9MmAwxr51xvXrLQ2ahBXVNIERkoitx+7jvz2gNTJQpbp9
 pjiLpWfd4Vpacsq9Zc1gSJydVCJKNM9h7R5F0cbV99qWEDtBamyCLkjhge7YRyaAOFHiSfe6Nfh
 g0jyqyVuNK69GpLONi5rYAQrZ82Tb84JvBpKBcM8i
X-Received: by 2002:a05:6000:4028:b0:449:a07a:9676 with SMTP id
 ffacd0b85a97d-45c5a68a7d6mr960269f8f.29.1778627529075; 
 Tue, 12 May 2026 16:12:09 -0700 (PDT)
X-Received: by 2002:a05:6000:4028:b0:449:a07a:9676 with SMTP id
 ffacd0b85a97d-45c5a68a7d6mr960237f8f.29.1778627528615; 
 Tue, 12 May 2026 16:12:08 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-48-7.inter.net.il. [80.230.48.7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4549130549bsm36930151f8f.18.2026.05.12.16.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 16:12:07 -0700 (PDT)
Date: Tue, 12 May 2026 19:12:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex Williamson <alex.williamson@nvidia.com>
Cc: Tushar Dave <tdave@nvidia.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 "devel@edk2.groups.io" <devel@edk2.groups.io>,
 qemu-devel@nongnu.org, jgg@nvidia.com, skolothumtho@nvidia.com,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, marcel.apfelbaum@gmail.com
Subject: Re: [edk2-devel] [RFC PATCH 0/8] hw/arm/virt, hw/pci: PCI
 pre-enumeration and fixed BAR allocation
Message-ID: <20260512191140-mutt-send-email-mst@kernel.org>
References: <20260508183717.193630-1-tdave@nvidia.com>
 <22cf37c2-b2b1-40db-b8b7-393b6c36a921@app.fastmail.com>
 <db604efd-9c1f-44e0-9921-71e4d97a81b3@nvidia.com>
 <20260512170650.4551c9f6@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20260512170650.4551c9f6@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aRDfRWHJT00IISxPdgIqkyfRhJkJe9e75K8rC38eyOM_1778627529
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, May 12, 2026 at 05:06:50PM -0600, Alex Williamson wrote:
> On Tue, 12 May 2026 12:25:45 -0500
> Tushar Dave <tdave@nvidia.com> wrote:
> 
> > On 5/11/2026 6:43 AM, Ard Biesheuvel wrote:
> > > Hello Tushar,
> > > 
> > > On Fri, 8 May 2026, at 20:37, Tushar Dave via groups.io wrote:  
> > >> This RFC introduces a mechanism to specify Guest Physical Addresses
> > >> (GPAs) for PCI BARs, allowing explicit placement of guest MMIO BAR
> > >> addresses to match host physical addresses for assigned devices.
> > >>
> > >> On some platforms, P2P DMA is performed between devices within the same
> > >> IOMMU group. The PCI fabric ACS is configured to permit direct P2P
> > >> without going through the host bridge in order to achieve the required
> > >> performance.
> > >>
> > >> To support this multi-device IOMMU group P2P scenario in virtualization,
> > >> the VM may need to use the same MMIO BAR addresses as the host physical
> > >> address layout.
> > >>  
> > > 
> > > Did you consider implementing this using Enhanced Allocation (EA)? If so,
> > > could you explain why it is not suitable here?  
> > 
> > I have not evaluated EA for this design. When I looked at EDK2, I
> > chose PcdPciDisableBusEnumeration because it cleanly preserves fixed
> > BAR programming established by the hypervisor — at the cost of QEMU
> > performing PCI bus number and resource assignment.
> > 
> > I did a quick search and do not see EA support in EDK2. Any pointers
> > to EA being used in a similar fashion to achieve fixed BAR placement
> > would be appreciated.
> 
> EA wasn't on my radar either, but I did some research and chatted with
> Tushar and I think it could work.  I'll sketch out a rough idea of what
> it might looks like.
> 
> EA describes BAR equivalents (fixed base address, size, and type) in a
> separate capability while the corresponding device BAR registers appear
> unimplemented.  Linux already consumes endpoint EA capabilities and
> marks the resulting resources IORESOURCE_PCI_FIXED.  EDK2 doesn't know
> about EA (cap 0x14 isn't defined anywhere in MdePkg, and PciBusDxe
> never consults it afaict), but that turns out to be useful here rather
> than a problem.
> 
> Starting at the QEMU device, for a vfio-pci device we'd need to
> virtualize the real BARs as unimplemented and surface that information
> via a synthesized EA capability instead.  It's debatable whether this
> is a generic PCI mechanism or vfio-pci specific, whether HPA is
> automatically used as the base address for vfio-pci devices or
> user-specified, and the capability offset in config space.  None of
> those fundamentally change the shape of the flow.
> 
> For the absolute bare-minimum level of support (EA device on the root
> complex, EA resources don't overlap the VM address space or MMIO range,
> EDK2 firmware, Linux guest booted with pci=nocrs) I think this actually
> works with just adding the EA capability above.  Let's walk through
> those constraints and how we relax them.
> 
> At the firmware level we lean on the real BAR registers being
> unimplemented for EA devices, so EDK2 allocates no MMIO or IO resources
> for them.  Only bus numbers get assigned if the EA device sits in a PCI
> hierarchy.  That's exactly what we want, EDK2 doing conventional bus
> assignment but staying out of the EA resource flow entirely.
> 
> Instead of firmware EA enlightenment we lean on the guest OS.  Linux
> reads endpoint EA today, but the bridge aperture sizing path ignores
> those fixed resources.  As Tushar's series demonstrates, generically
> handling mixed "fixed-BAR" and programmable-BAR devices in one
> hierarchy is hard.  An incremental Linux enhancement that greatly
> simplifies the problem space would be to program bridge apertures only
> for hierarchies consisting entirely of fixed resources.  The math
> becomes trivial (window spans min..max of fixed children, aligned to
> bridge granularity), and there's no regression risk, these hierarchies
> currently fail silently.  The sizer ignores fixed children and the
> fixed-claim walk-up finds no containing parent.  This enhancement,
> plus the homogeneous-hierarchy constraint, removes the root-complex
> constraint and lets us mirror the bare-metal topologies we need.
> 
> Resource ranges are a bit messier.  The extent of the EA device ranges
> could be determined in QEMU and the VM address map adjusted to prevent
> overlap.  Tushar already has a similar user-specified machine option in
> this series.  That range also needs to reach the guest as a CRS (to
> avoid pci=nocrs) but needs to stay distinct from the DT range passed to
> EDK2 for programmable BAR devices so EDK2 won't place a programmable
> BAR or bridge window into the EA region.  So long as we keep EA and
> programmable devices in separate hierarchies, EDK2 only needs the
> programmable range via DT and we can add the EA range as additional CRS
> ranges visible only to the guest.
> 
> In practice, EDK2 programs all the programmable devices and the EA
> devices live entirely in the additional CRS.  A possibly cleaner
> alternative is additional PXB host bridges for the EA devices, each
> with its own CRS.  That sidesteps the DT/CRS split entirely since the
> EA PXB has nothing for EDK2 to allocate anyway.
> 
> If we agree that homogeneous hierarchies (no mixing of EA and
> programmable BARs) is a reasonable constraint, and possibly extend that
> to homogeneous per host bridge to simplify the CRS mapping, we have the
> following work items:
> 
>  * Extend Linux EA support to program bridge apertures for subordinate
>    homogeneous EA hierarchies.
> 
>  * Develop options to virtualize programmable BARs as EA for vfio-pci
>    devices, if not generically for the benefit of testing.
> 
>  * Implement a way to poke holes in the VM address space and plumb
>    through to account for addresses used by EA devices.
> 
>  * Provide those same ranges to the guest via CRS (but not via DT to
>    EDK2), or alternatively expose them through additional PXB host
>    bridges.
> 
> Does that shape roughly seem accurate?  Are there additional gaps I've
> missed?  Thanks,
> 
> Alex


just one question why not do it in firmware so windows
is thinkably also handled?


