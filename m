Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C5DCD98C5
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 21:01:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXQ2t-0007Bm-1t; Wed, 10 Jun 2026 17:01:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wXQ2r-0007Ad-2d
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 17:01:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wXQ2n-0000wh-MC
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 17:01:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781125259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7kffMNPo7Vcq5I9EW/XMk0pRt0sVo3NtWbpiMoqnqpY=;
 b=Zqqeua37DnFAp1knAc5Bzomj60DNn6ZPrw3jmaALvqd3BBqTfuTKitfCAT/EXHy/ht8wL0
 tybKLwkjoByXXIXGjrq9uxo9K3LmV2lqD7zVuw4IhMB0h71hOBFneB+gp9q7EZoP7ORv8v
 0ysan327H0mOrjS5Av427VNj1hyevV8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-bFOvWZ9RMsylbmHzX6qM3g-1; Wed, 10 Jun 2026 17:00:57 -0400
X-MC-Unique: bFOvWZ9RMsylbmHzX6qM3g-1
X-Mimecast-MFC-AGG-ID: bFOvWZ9RMsylbmHzX6qM3g_1781125257
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-490b93debc8so58205315e9.1
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 14:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781125257; x=1781730057;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7kffMNPo7Vcq5I9EW/XMk0pRt0sVo3NtWbpiMoqnqpY=;
 b=I1csMqdoZuD0B5QYdfoOjj/M9zd6H69L8v4cOe/CclN1LnvMjXHNhHwgDbuEtDGaNP
 Klzmn+3TcDU98gCMzWhBEkbRBNk0X3ktih/TQMfEBbDp7XxcJu9gFB8Xxn+YIyMp7Bma
 eni7SjJKCdE/gfh0rpOZCfEk6u5PcJPSQ3FmaRNZ2QDSrvfe3O4BGMe1Rer0Wib9c87O
 SON80VN/ZDofOF/mCKDhVHwCPvJ/kdWNoJMWc/V7EXZEoA8SUxYBR20ApPK4Spr2jQCw
 ChCVLcKn8xf8F1BYXOQDOzWQZVrIBBzNNEY55cc2PwKkKU6LZQHbvCxlK3MuYaPmk/IL
 Diqw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+cLhR26bIAtzir9PMsx8FMJN6BXlWf+hMN+zerfFVx9/aWfob1MMynOHSVAirmdZJEIITibn1s/A==@nongnu.org
X-Gm-Message-State: AOJu0YyNvXMytmY3FwJb3qOxxqi3yh51vJLYUy8TKDA/LmTPQpm35mUJ
 RZMDv89FqO0AO1OV2NOKitF07Md/rdjVl0J5GWreGjmKQjoBd+UEryzLcE4O4qPQIqMMSeUFedW
 Bqf8cN/B3LzNKCBN1IAbVfxTRQ3Ey9K39kA51RPu7o8527r4SEuyHxw==
X-Gm-Gg: Acq92OE6dy+16iZTIyM8aZS+ivJbl39f5OyAgRqsn/u30LyFWboQMKSPo/Y/ryDDAF4
 GTO2QvN4B87nmE7yt3/ABQKh8jiax1z4gvrx38au9Gv3r5XBguEhsdAyiwUf2FTnVy631h/3uDi
 wwMelMLklrPQktLzs9r+vpwg7cX2VJO8n9mDG1TF5xcRP+SRqQt9KTMBkJ1ldx/GMGlnA1zKQfU
 9JB5qqbNUwLhnDerymOsiDVKpZWsZEBFS3IFJOn68StwyjBWGLk2A1+zqh/sgGOUBcma2K+I8C9
 i+4GFZIL6A5B4hncMHoloi7eVu+VjjknlmFAdkTQ3HkhH8dj1ZwWtWuzKKMUqb5E05fAXL5TYzK
 o6PkQ1UuavQefAOWg4XQCujyEHHpRmRkccUEp8WFrvrTXCFFrVEhHWQ==
X-Received: by 2002:a05:600c:4744:b0:490:e342:127 with SMTP id
 5b1f17b1804b1-490e342106amr4616745e9.34.1781125256563; 
 Wed, 10 Jun 2026 14:00:56 -0700 (PDT)
X-Received: by 2002:a05:600c:4744:b0:490:e342:127 with SMTP id
 5b1f17b1804b1-490e342106amr4616465e9.34.1781125256043; 
 Wed, 10 Jun 2026 14:00:56 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2d09a85sm10877425e9.14.2026.06.10.14.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 14:00:55 -0700 (PDT)
Date: Wed, 10 Jun 2026 17:00:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, jugraham@redhat.com, shan.gavin@gmail.com,
 qemu-block@nongnu.org
Subject: Re: [PATCH RFCv1] virtio: Inherit max bounce buffer size from bus
 parent if possible
Message-ID: <20260610165710-mutt-send-email-mst@kernel.org>
References: <20260608001821.850921-1-gshan@redhat.com>
 <20260610041036-mutt-send-email-mst@kernel.org>
 <20260610183046.GB121666@fedora>
MIME-Version: 1.0
In-Reply-To: <20260610183046.GB121666@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LoOpf_zhydL1rW4HRQa0e271vOaJC-EdtGCMYuliN-A_1781125257
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

On Wed, Jun 10, 2026 at 02:30:46PM -0400, Stefan Hajnoczi wrote:
> On Wed, Jun 10, 2026 at 05:49:21AM -0400, Michael S. Tsirkin wrote:
> > On Mon, Jun 08, 2026 at 10:18:21AM +1000, Gavin Shan wrote:
> > > On the guest where a NVidia's GH100 card is passed from the host, the
> > > guest system hang can be observed on attempt to compile 'cuda-samples',
> > > as reported by Julia.
> > > 
> > >    host$ lspci | grep GH100
> > >    0009:01:00.0 3D controller: NVIDIA Corporation GH100 [GH200 120GB / 480GB] (rev a1)
> > >    host$ /home/sandbox/gavin/qemu.main/build/qemu-system-aarch64 -accel kvm \
> > >          -machine virt,gic-version=host,ras=on,highmem-mmio-size=4T         \
> > >          -cpu host -smp cpus=32 -m size=8G                                  \
> > >          -drive file=/home/gavin/sandbox/images/disk.qcow2,if=none,id=d0    \
> > >          -device virtio-blk-pci,id=vb0,bus=pcie.0,drive=d0,num-queues=4     \
> > >          -device vfio-pci-nohotplug,host=0009:01:00.0,bus=pcie.1.0
> > > 
> > >    guest$ cd cuda-samples/build
> > >    guest$ make -j 20 clean
> > >    guest$ make -j 20
> > >                :
> > >    [ 54%] Linking CUDA executable graphMemoryNodes
> > >    [ 54%] Built target graphMemoryNodes
> > >    <no more output afterwards, guest becomes frozen here>
> > > 
> > >    guest$ qemu-system-aarch64: virtio: bogus descriptor or out of resources
> > >    [  555.814025] virtio_blk virtio0: [vda] new size: 268435456 512-byte logical blocks (137 GB/128 GiB)
> > > 
> > > When the GPU's driver (NVidia open driver) is loaded on guest bootup,
> > > the memory blocks residing in the PCI BAR can be presented to the guest
> > > through memory hot-add. The page cache can be allocated from the hot added
> > > memory blocks when cuda-samples is being built. Afterwards, he page cache
> > > is sent to QEMU's virtio-blk device as part of the DMA request, the bounce
> > > buffer is used to accomodate the request as the corresponding memory
> > > region (MemoryRegion) is a RAM DEVICE region in qemu. For this specific
> > > case, false is returned from memory_access_is_direct() in the path where
> > > the DMA request is handled.
> > > 
> > >   QEMU
> > >   ====
> > >   virtio_blk_handle_output
> > >     virtio_blk_handle_vq
> > >       virtio_blk_get_request
> > >         virtqueue_pop
> > >           virtqueue_split_pop
> > >             virtqueue_map_desc
> > >               address_space_map
> > >                 memory_access_is_direct         # Return false
> > >                   memory_region_supports_direct_access
> > > 
> > >   (qemu) info mtree
> > >           :
> > >   memory-region: pci_bridge_pci
> > >     0000000000000000-ffffffffffffffff (prio 0, container): pci_bridge_pci
> > >       0000042000000000-0000043fffffffff (prio 1, i/o): 0009:01:00.0 base BAR 4
> > >         0000042000000000-0000043fffffffff (prio 0, i/o): 0009:01:00.0 BAR 4
> > >           0000042000000000-000004379fffffff (prio 0, ramd): 0009:01:00.0 BAR 4 mmaps[0]
> > > 
> > > By default, the max bounce buffer size is only 4096 bytes, even less
> > > than one page when the guest page is 64KB. This tries to fix the issue
> > > by inheriting the customized max bounce buffer size of the virtio bus's
> > > parent through property 'x-max-bounce-buffer-size' when the customized
> > > size is a larger one. With this applied, no guest system hang is seen
> > > with '-device virtio-blk-pci,...,x-max-bounce-buffer-size=268435456'.
> > > 
> > > Reported-by: Julia Graham <jugraham@redhat.com>
> > > Signed-off-by: Gavin Shan <gshan@redhat.com>
> > > ---
> > >  hw/virtio/virtio-bus.c | 14 ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > > 
> > > diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> > > index cef944e015..e0933823f3 100644
> > > --- a/hw/virtio/virtio-bus.c
> > > +++ b/hw/virtio/virtio-bus.c
> > > @@ -42,6 +42,7 @@ do { printf("virtio_bus: " fmt , ## __VA_ARGS__); } while (0)
> > >  /* A VirtIODevice is being plugged */
> > >  void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
> > >  {
> > > +    AddressSpace *as;
> > >      DeviceState *qdev = DEVICE(vdev);
> > >      BusState *qbus = BUS(qdev_get_parent_bus(qdev));
> > >      VirtioBusState *bus = VIRTIO_BUS(qbus);
> > > @@ -100,6 +101,19 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
> > >                  return;
> > >              }
> > >          }
> > > +    } else {
> > > +        /*
> > > +         * The maximal bounce buffer size of the virtio bus's parent may
> > > +         * have been customized by property 'x-max-bounce-buffer-size'.
> > > +         * Lets inherit the customized size if it's larger than the
> > > +         * current one.
> > > +         */
> > > +        as = klass->get_dma_as ? klass->get_dma_as(qbus->parent) : NULL;
> > > +        if (as) {
> > > +            vdev->dma_as->max_bounce_buffer_size = MAX(
> > > +                    vdev->dma_as->max_bounce_buffer_size,
> > > +                    as->max_bounce_buffer_size);
> > > +        }
> > >      }
> > >  }
> > >  
> > > -- 
> > > 2.54.0
> > 
> > 
> > Problem with all this is, users would not know how to size this.
> > 
> > So fundamentally, is not the issue that virtio blk (and scsi!) maps
> > all of the buffer all the time?
> >
> > It's not hard to add something like virtio_pop_unmapped that would not map,
> > then build QEMUSGLists out of addr/len pairs and submit these.
> > 
> > Stefan, do you think doing it like this would be bad for perf? Good for
> > perf?
> 
> I'd like to first make sure that the BAR really cannot be mmapped.

The issue is that qemu has no way to know, up front.

What we could thinkably do, is map it and do the
accesses from QEMU through the bounce buffer, while
DMA through mmap.


> A bounce buffer is necessary when QEMU has no way of mmapping the memory
> (e.g. it needs to invoke a device model's callback to read/write the
> MemoryRegion).
> 
> The reason why the bounce buffer size is low is because it's normally
> only used on emulated machines where MMIO registers or similar small
> MemoryRegions are accessed by DMA. If we ran into this on modern
> machines there would also be other consequences like vhost devices would
> be unable to access that memory since it cannot be shared/mmapped.
> 
> This is why I think we need to understand why this BAR is a RAM DEVICE.


VFIO maps all memory BARS like this.

> If it can support mmap then this issue, plus anything else like vhost,
> would work.
> 
> Gavin, can you share the output of `lspci -vv -s 0009:01:00.0`?
> 
> Thanks,
> Stefan



