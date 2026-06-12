Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D663BCD98DB
	for <qemu-arm@archiver.kernel.org>; Fri, 12 Jun 2026 11:23:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXzyF-0000m0-9x; Fri, 12 Jun 2026 07:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wXzyE-0000lN-5w
 for qemu-arm@nongnu.org; Fri, 12 Jun 2026 07:22:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wXzyC-0004Xd-8b
 for qemu-arm@nongnu.org; Fri, 12 Jun 2026 07:22:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781263358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h+w5YGRW8FzfMaiUfx9ak/Drfqr1MfcJuCTJUwqhn8E=;
 b=P1deL6e6oUAdjlzbb8cTrZeooySRhCxPDYcPfrRVLvE9dJTJixcFXgVHo14dzgc75ZrQgG
 o8Hi+OsPtJEqNgFJu3QrXSmq1eaubFD+DwfyI7uVr7htuu8v4LO61Kg7BMg6p+m+RnAI4k
 DdsGYo4O0QwxaN3k7zCpt8SFB97Gb18=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-9OrOKdhoN5C4TKjH6pGOhA-1; Fri, 12 Jun 2026 07:22:35 -0400
X-MC-Unique: 9OrOKdhoN5C4TKjH6pGOhA-1
X-Mimecast-MFC-AGG-ID: 9OrOKdhoN5C4TKjH6pGOhA_1781263354
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-46067399d5dso387448f8f.2
 for <qemu-arm@nongnu.org>; Fri, 12 Jun 2026 04:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781263354; x=1781868154;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h+w5YGRW8FzfMaiUfx9ak/Drfqr1MfcJuCTJUwqhn8E=;
 b=sXXM7rWDrRNFS2rsx5y/bfT8Xnz4IjtFLH0qoTvnR39vuMKnbFLg5CBF747XF3gY6/
 f1Vi1oumusl5K0HgJZC+8Mn70l2FNlj7/5yolEhLisdrnA1FJ/oezdRd4f6yVkAbGSK3
 P0sJVaWEr1x65mPaPSvCI9jdrxm7W1NEiq5Kc0qTmQCkaqUkWPto6aHe3IdWvVtkK8cl
 0XZgl0xmC9xhPbTR4C964R7qRbFQwRNk5f9ng0ox23EDusZr5ps9KFCcIxM+XoLazQ/X
 9jVqzdg2qd+GLHm/M4RMMPiOK+PykhKg3aWlDG6esvrSi6Fu86wG4mdmIJ6BrHqaSIkF
 xfEg==
X-Gm-Message-State: AOJu0YwxAy+S2Ro6i0bilEJCAvVAMJ1bRcx2zuSrPX0jbeDMcTl/wdj4
 EoBOSFWIMeVmtCpP+StOMUDGxO//6+/RoBuwdRVJjActn51PAz2ZnOyR5YA2NrZ/UXHEuzn+VfX
 +UdTs5k7Hlt2Sm93rtHyiOphRWqY0YZ8q2HCbA0MsuB3eJRy6ZwA0CA==
X-Gm-Gg: Acq92OGvN5bsWXRoq6pTpRcHY/3DItKoEbn66Mh0v7nVMMtK4x8NFuumWpN+swL+4CJ
 pn1mA5RUK+UXkCNExJj2UgBgb8DlZBXhMByXkknKuXCYPOb3krj84c8YFCtFHpNLTaUN8CVTQ0D
 s5L7iHVAXVF1cWPvFaaB8DxQoorpgln0V67AggG5vNTH4cem/uIzCUKMgLwF6N4OqH4tX47VuPo
 s6Aye3qqcA18EnBKY+XGAjazN8zDB+pquAOrGOZRnOwOk6VL7dUgsaZm8tdL2MBxKY4xd0zc7cW
 /pK8/u+M7NDZb5uwycYhkpu9nfv6rgwSp12J96deYbC5REgQ+uL3+OJ0WStDSJtukRrBu0o09ez
 SMewAnGOkbEfQPj/+HdD1iE7FAEsj4y7H3kyKAYN2kV4=
X-Received: by 2002:a05:600c:820c:b0:490:4b89:5361 with SMTP id
 5b1f17b1804b1-490ec4c5984mr30723385e9.7.1781263353883; 
 Fri, 12 Jun 2026 04:22:33 -0700 (PDT)
X-Received: by 2002:a05:600c:820c:b0:490:4b89:5361 with SMTP id
 5b1f17b1804b1-490ec4c5984mr30723045e9.7.1781263353253; 
 Fri, 12 Jun 2026 04:22:33 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea961f18sm47145415e9.2.2026.06.12.04.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:22:32 -0700 (PDT)
Date: Fri, 12 Jun 2026 07:22:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peterx@redhat.com,
 peter.maydell@linaro.org, berrange@redhat.com, david@kernel.org,
 alex@shazbot.org, clg@redhat.com, pbonzini@redhat.com,
 philmd@mailo.com, phrdina@redhat.com, jugraham@redhat.com,
 shan.gavin@gmail.com
Subject: Re: [PATCH 1/2] system/memory: Use __builtin_mem{cpy, move} in
 accessors of ram device region
Message-ID: <20260612072144-mutt-send-email-mst@kernel.org>
References: <20260612110307.1264798-1-gshan@redhat.com>
 <20260612110307.1264798-2-gshan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20260612110307.1264798-2-gshan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JYTXmfPigNdCzU-iCq8jMRqCpbOvw_SlvOevPO2XcFQ_1781263354
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

On Fri, Jun 12, 2026 at 09:03:06PM +1000, Gavin Shan wrote:
> All ram device regions was turned to be indirectly accessible by commit
> 4a2e242bbb ("memory: Don't use memcpy for ram_device regions"). This leads
> to guest hang on compiling 'cuda-samples' as reported by Julia. The guest
> is started by the following command lines, with a GH100 GPU card.
> 
>    host$ lspci | grep GH100
>    0009:01:00.0 3D controller: NVIDIA Corporation GH100 [GH200 120GB / 480GB] (rev a1)
>    host$ /home/sandbox/gavin/qemu.main/build/qemu-system-aarch64            \
>          -machine virt,gic-version=host,ras=on,highmem-mmio-size=4T         \
>          -accel kvm -cpu host -smp cpus=48 -m size=8G                       \
>          -drive file=/home/gavin/sandbox/images/disk.qcow2,if=none,id=d0    \
>          -device virtio-blk-pci,id=vb0,bus=pcie.0,drive=d0,num-queues=4     \
>          -device vfio-pci-nohotplug,host=0009:01:00.0,bus=pcie.1.0
>            :
>    guest$ cd cuda-samples/build
>    guest$ make -j 20 clean
>    guest$ make -j 20
>            :
>    [ 54%] Linking CUDA executable graphMemoryNodes
>    [ 54%] Built target graphMemoryNodes
>    <no more output afterwards, guest becomes frozen here>
> 
>    guest$ qemu-system-aarch64: virtio: bogus descriptor or out of resources
>    [  555.814025] virtio_blk virtio0: [vda] new size: 268435456 512-byte logical blocks (137 GB/128 GiB)
> 
> When the GPU's driver (NVidia open driver) is loaded on guest bootup,
> the memory blocks residing in the PCI BAR#4 can be presented to the
> guest through memory hot-add. The page cache can be allocated from the
> hot added memory blocks when cuda-samples is being compiled. Afterwards,
> the page cache is sent to QEMU's virtio-blk device as part of the DMA
> request, the bounce buffer has to be used to accomodate the request as
> the corresponding memory region (MemoryRegion) is a RAM DEVICE region
> and indirectly accessible in qemu. However, the max bounce bufer size
> is only 4096 bytes by default. We're running out of that space quickly.
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
>   memory-region: pci_bridge_pci
>     0000000000000000-ffffffffffffffff (prio 0, container): pci_bridge_pci
>       0000042000000000-0000043fffffffff (prio 1, i/o): 0009:01:00.0 base BAR 4
>         0000042000000000-0000043fffffffff (prio 0, i/o): 0009:01:00.0 BAR 4
>           0000042000000000-000004379fffffff (prio 0, ramd): 0009:01:00.0 BAR 4 mmaps[0]
> 
> This replaces mem{cpy, move} with __builtin_mem{cpy, move} in the memory
> accessors to ram device memory region, preparatory work to make ram device
> region directly accessible and bypass the bounce buffer in the DMA path
> in next patch.
> 
> Reported-by: Julia Graham <jugraham@redhat.com>
> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> Suggested-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/remote/vfio-user-obj.c |  4 ++--
>  include/system/memory.h   | 42 ++++++++++++++++++++++++++++++++++++++-
>  system/physmem.c          |  8 ++++----
>  3 files changed, 47 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
> index 87fa7b6572..fe6f661fe2 100644
> --- a/hw/remote/vfio-user-obj.c
> +++ b/hw/remote/vfio-user-obj.c
> @@ -375,9 +375,9 @@ static int vfu_object_mr_rw(MemoryRegion *mr, uint8_t *buf, hwaddr offset,
>          ram_ptr = memory_region_get_ram_ptr(mr);
>  
>          if (is_write) {
> -            memcpy((ram_ptr + offset), buf, size);
> +            address_space_memcpy(ram_ptr + offset, buf, size);
>          } else {
> -            memcpy(buf, (ram_ptr + offset), size);
> +            address_space_memcpy(buf, ram_ptr + offset, size);
>          }
>  
>          return 0;
> diff --git a/include/system/memory.h b/include/system/memory.h
> index 1417132f6d..6bb2e13eea 100644
> --- a/include/system/memory.h
> +++ b/include/system/memory.h
> @@ -2938,6 +2938,46 @@ static inline bool memory_access_is_direct(const MemoryRegion *mr,
>      return true;
>  }
>  
> +static inline void address_space_memcpy(void *dest, const void *src, size_t n)
> +{
> +    switch (n) {
> +    case 1:
> +        __builtin_memcpy(dest, src, 1);
> +        break;
> +    case 2:
> +        __builtin_memcpy(dest, src, 2);
> +        break;
> +    case 4:
> +        __builtin_memcpy(dest, src, 4);
> +        break;
> +    case 8:
> +        __builtin_memcpy(dest, src, 8);
> +        break;
> +    default:
> +        __builtin_memcpy(dest, src, n);
> +    }
> +}
> +
> +static inline void address_space_memmove(void *dest, const void *src, size_t n)
> +{
> +    switch (n) {
> +    case 1:
> +        __builtin_memmove(dest, src, 1);
> +        break;
> +    case 2:
> +        __builtin_memmove(dest, src, 2);
> +        break;
> +    case 4:
> +        __builtin_memmove(dest, src, 4);
> +        break;
> +    case 8:
> +        __builtin_memmove(dest, src, 8);
> +        break;
> +    default:
> +        __builtin_memmove(dest, src, n);
> +    }
> +}
> +
>  /**
>   * address_space_read: read from an address space.
>   *


The variable length probably should use the regular memcpy/memmove -
no reason to bypass fortification for these.


> @@ -2970,7 +3010,7 @@ MemTxResult address_space_read(AddressSpace *as, hwaddr addr,
>              mr = flatview_translate(fv, addr, &addr1, &l, false, attrs);
>              if (len == l && memory_access_is_direct(mr, false, attrs)) {
>                  ptr = qemu_map_ram_ptr(mr->ram_block, addr1);
> -                memcpy(buf, ptr, len);
> +                __builtin_memcpy(buf, ptr, len);
>              } else {
>                  result = flatview_read_continue(fv, addr, attrs, buf, len,
>                                                  addr1, l, mr);
> diff --git a/system/physmem.c b/system/physmem.c
> index 7bcbf87573..5f46a9d676 100644
> --- a/system/physmem.c
> +++ b/system/physmem.c
> @@ -3272,7 +3272,7 @@ static MemTxResult flatview_write_continue_step(MemTxAttrs attrs,
>          uint8_t *ram_ptr = qemu_ram_ptr_length(mr->ram_block, mr_addr, l,
>                                                 false, true);
>  
> -        memmove(ram_ptr, buf, *l);
> +        address_space_memmove(ram_ptr, buf, *l);
>          invalidate_and_set_dirty(mr, mr_addr, *l);
>  
>          return MEMTX_OK;
> @@ -3365,7 +3365,7 @@ static MemTxResult flatview_read_continue_step(MemTxAttrs attrs, uint8_t *buf,
>          uint8_t *ram_ptr = qemu_ram_ptr_length(mr->ram_block, mr_addr, l,
>                                                 false, false);
>  
> -        memcpy(buf, ram_ptr, *l);
> +        address_space_memcpy(buf, ram_ptr, *l);
>  
>          return MEMTX_OK;
>      }
> @@ -3503,8 +3503,8 @@ MemTxResult address_space_write_rom(AddressSpace *as, hwaddr addr,
>              l = memory_access_size(mr, l, addr1);
>          } else {
>              /* ROM/RAM case */
> -            void *ram_ptr = qemu_map_ram_ptr(mr->ram_block, addr1);
> -            memcpy(ram_ptr, buf, l);
> +            address_space_memcpy(qemu_map_ram_ptr(mr->ram_block, addr1),
> +                                 buf, l);
>              invalidate_and_set_dirty(mr, addr1, l);
>          }
>          len -= l;
> -- 
> 2.54.0


