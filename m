Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9277FCD98C7
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 09:49:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXFZ0-00011x-9N; Wed, 10 Jun 2026 05:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wXFYy-0000wT-Bz
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 05:49:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wXFYv-00048t-FQ
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 05:49:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781084967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HJpIq4DO8bdfcDx0wh13Foq0nFERFPIB0/DgZ0IKkY4=;
 b=KF+YLDa4YZO9Xc+v6k+dAqB9TviLFlJzMAvlO32jqPrsrskm4Kr03AM+NzS7FCVNRI4wZi
 jEQNDDOwp17nG0Lkfsa8eaYslyaiqceoWfZbqxzYQwUupL3aDdnUDb0uV6Rwn82fw7vuJx
 vOPIjIcWQLIYfOxv3BTLxBtLRSOlPc4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-coW1cIAfOBC2AmzVYjwsmQ-1; Wed, 10 Jun 2026 05:49:26 -0400
X-MC-Unique: coW1cIAfOBC2AmzVYjwsmQ-1
X-Mimecast-MFC-AGG-ID: coW1cIAfOBC2AmzVYjwsmQ_1781084965
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-46010392f89so5944712f8f.2
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 02:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781084965; x=1781689765;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HJpIq4DO8bdfcDx0wh13Foq0nFERFPIB0/DgZ0IKkY4=;
 b=eKbGR7ug9dI69yXy3gvZKIgDGSLyaW65nOGkgr1VI4CNykaQLXxiMPvvwqqEvAXoi4
 lZABwlpXtg4Jxch3ZtCMvWYRpHUoROeoxPP4nbAb4rJkEybMO5xLce3n6DAvPKyQGcvK
 fYK4WQQvcZvcMgvcQfj133jF6DQfcsEXS8bg8P7+hyIdJLmGoSEJ+qszUeNhFJIbrv9y
 et14kIY+Adeq8ttPhDTLIm29uqLLW8ff802YfOkp+uq7qGpqWkJoGgQYvxTvgqMzPq2j
 Ua/wAwLifcY7HfKTDO0PEAtICfvHKOuuGXy+P5D5Qw5HQkY2kv2wxywINua3YND8iNcs
 PcYg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8YoTP/SUqes/feP9f5LIODi96HfCuF4KdeEkMDOC4SvXoLE0FFENuwLezk5sgIXhXTD+kMj7pXSA==@nongnu.org
X-Gm-Message-State: AOJu0Yw1cb4QgpLu0lD1jzg3ijNncfJkpGyLJFt3dBU8xu90Bd57bJQ9
 w9Bq/TZOUNRKqqMm9odXgYImnnrNvCfOgB+fNKGDZ5U4iBAEwbTDPXV8aShdaF5DXL9BRSOBszs
 J4Va8nKUq9/Rd9tYX90vgqJxm2hItYhgsZ3Eg4qoRpwYIf+ImkLHgKQ==
X-Gm-Gg: Acq92OGjUjsY/xiVrwmuLAHthZi3j4ciISrXz31pC3xa6Oem4hojBQrabwUhtwWHpAg
 BPOWrmH9Mq3UaluNZJ4MqPIFS0cDYbGuotWJrAJob1s2lDKQUalbipy2UKQYbe31M6G1Lq5Yitv
 88nPrEbCnzspYvKpnq7Rnk+Ml/sV3K5X9c+Yroxnwyje+mQt5Jw6nfBMuLwE7u6vJLPhca70Tji
 HPY9BUjfct+C5c+2CgqH+sTn06jP/N+nv0Rq/MXLTkgCHh2ffjDW423zKilzx7865qqvrZB4x+T
 NnmhN5OGfVhFcllCI3m3KmQUECWWUsjYRSYXzz1DKGSc6oBtfqHUX/oRGYY1bTCK9uOeoEZ09UQ
 KlLRVsuaMO1Vc0IPeQMDHtZfr/J6OSrT2NnoBocB3fAdDa0VZ4SM90g==
X-Received: by 2002:a5d:4b41:0:b0:45e:f3b2:122a with SMTP id
 ffacd0b85a97d-46030652fcemr29809772f8f.26.1781084965234; 
 Wed, 10 Jun 2026 02:49:25 -0700 (PDT)
X-Received: by 2002:a5d:4b41:0:b0:45e:f3b2:122a with SMTP id
 ffacd0b85a97d-46030652fcemr29809736f8f.26.1781084964737; 
 Wed, 10 Jun 2026 02:49:24 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4602cda3651sm58967771f8f.32.2026.06.10.02.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 02:49:24 -0700 (PDT)
Date: Wed, 10 Jun 2026 05:49:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, jugraham@redhat.com,
 shan.gavin@gmail.com, stefanha@redhat.com, qemu-block@nongnu.org
Subject: Re: [PATCH RFCv1] virtio: Inherit max bounce buffer size from bus
 parent if possible
Message-ID: <20260610041036-mutt-send-email-mst@kernel.org>
References: <20260608001821.850921-1-gshan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20260608001821.850921-1-gshan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p4MNFaK9266S2CK6fb0dYc-PDoC-rNAk5J8I50_0PmM_1781084965
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

On Mon, Jun 08, 2026 at 10:18:21AM +1000, Gavin Shan wrote:
> On the guest where a NVidia's GH100 card is passed from the host, the
> guest system hang can be observed on attempt to compile 'cuda-samples',
> as reported by Julia.
> 
>    host$ lspci | grep GH100
>    0009:01:00.0 3D controller: NVIDIA Corporation GH100 [GH200 120GB / 480GB] (rev a1)
>    host$ /home/sandbox/gavin/qemu.main/build/qemu-system-aarch64 -accel kvm \
>          -machine virt,gic-version=host,ras=on,highmem-mmio-size=4T         \
>          -cpu host -smp cpus=32 -m size=8G                                  \
>          -drive file=/home/gavin/sandbox/images/disk.qcow2,if=none,id=d0    \
>          -device virtio-blk-pci,id=vb0,bus=pcie.0,drive=d0,num-queues=4     \
>          -device vfio-pci-nohotplug,host=0009:01:00.0,bus=pcie.1.0
> 
>    guest$ cd cuda-samples/build
>    guest$ make -j 20 clean
>    guest$ make -j 20
>                :
>    [ 54%] Linking CUDA executable graphMemoryNodes
>    [ 54%] Built target graphMemoryNodes
>    <no more output afterwards, guest becomes frozen here>
> 
>    guest$ qemu-system-aarch64: virtio: bogus descriptor or out of resources
>    [  555.814025] virtio_blk virtio0: [vda] new size: 268435456 512-byte logical blocks (137 GB/128 GiB)
> 
> When the GPU's driver (NVidia open driver) is loaded on guest bootup,
> the memory blocks residing in the PCI BAR can be presented to the guest
> through memory hot-add. The page cache can be allocated from the hot added
> memory blocks when cuda-samples is being built. Afterwards, he page cache
> is sent to QEMU's virtio-blk device as part of the DMA request, the bounce
> buffer is used to accomodate the request as the corresponding memory
> region (MemoryRegion) is a RAM DEVICE region in qemu. For this specific
> case, false is returned from memory_access_is_direct() in the path where
> the DMA request is handled.
> 
>   QEMU
>   ====
>   virtio_blk_handle_output
>     virtio_blk_handle_vq
>       virtio_blk_get_request
>         virtqueue_pop
>           virtqueue_split_pop
>             virtqueue_map_desc
>               address_space_map
>                 memory_access_is_direct         # Return false
>                   memory_region_supports_direct_access
> 
>   (qemu) info mtree
>           :
>   memory-region: pci_bridge_pci
>     0000000000000000-ffffffffffffffff (prio 0, container): pci_bridge_pci
>       0000042000000000-0000043fffffffff (prio 1, i/o): 0009:01:00.0 base BAR 4
>         0000042000000000-0000043fffffffff (prio 0, i/o): 0009:01:00.0 BAR 4
>           0000042000000000-000004379fffffff (prio 0, ramd): 0009:01:00.0 BAR 4 mmaps[0]
> 
> By default, the max bounce buffer size is only 4096 bytes, even less
> than one page when the guest page is 64KB. This tries to fix the issue
> by inheriting the customized max bounce buffer size of the virtio bus's
> parent through property 'x-max-bounce-buffer-size' when the customized
> size is a larger one. With this applied, no guest system hang is seen
> with '-device virtio-blk-pci,...,x-max-bounce-buffer-size=268435456'.
> 
> Reported-by: Julia Graham <jugraham@redhat.com>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/virtio/virtio-bus.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> index cef944e015..e0933823f3 100644
> --- a/hw/virtio/virtio-bus.c
> +++ b/hw/virtio/virtio-bus.c
> @@ -42,6 +42,7 @@ do { printf("virtio_bus: " fmt , ## __VA_ARGS__); } while (0)
>  /* A VirtIODevice is being plugged */
>  void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>  {
> +    AddressSpace *as;
>      DeviceState *qdev = DEVICE(vdev);
>      BusState *qbus = BUS(qdev_get_parent_bus(qdev));
>      VirtioBusState *bus = VIRTIO_BUS(qbus);
> @@ -100,6 +101,19 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>                  return;
>              }
>          }
> +    } else {
> +        /*
> +         * The maximal bounce buffer size of the virtio bus's parent may
> +         * have been customized by property 'x-max-bounce-buffer-size'.
> +         * Lets inherit the customized size if it's larger than the
> +         * current one.
> +         */
> +        as = klass->get_dma_as ? klass->get_dma_as(qbus->parent) : NULL;
> +        if (as) {
> +            vdev->dma_as->max_bounce_buffer_size = MAX(
> +                    vdev->dma_as->max_bounce_buffer_size,
> +                    as->max_bounce_buffer_size);
> +        }
>      }
>  }
>  
> -- 
> 2.54.0


Problem with all this is, users would not know how to size this.

So fundamentally, is not the issue that virtio blk (and scsi!) maps
all of the buffer all the time?

It's not hard to add something like virtio_pop_unmapped that would not map,
then build QEMUSGLists out of addr/len pairs and submit these.

Stefan, do you think doing it like this would be bad for perf? Good for
perf?

-- 
MST


