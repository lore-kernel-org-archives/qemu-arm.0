Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D60CDE008
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 10:10:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wch1j-0003jc-U4; Thu, 25 Jun 2026 06:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wch1i-0003ic-4Y
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 06:09:42 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wch1f-0006yZ-9s
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 06:09:41 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-663c66669ddso1587024d50.0
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 03:09:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782382178; cv=none;
 d=google.com; s=arc-20260327;
 b=hhebnDAyfW/NlGTI32P63Bu1z2jd3mOXj1GxCvdJ4n36FDH/nrx469SJ8GVtED8rd+
 YqywYB6LM9eL0E5qU6dcVcopoFOhhatOPSmw/JiX5zmisRuIyzrwV90lnAZKJILvmbW7
 YgZE6DpOr2oer9c1S2hucQsIFCPrXfvZJ5PN97u1G7jLAD4F2fsUoxck+cKlQqxD3QVr
 B6zwM8fCfDsTD+0yQA3pdYpoSTeeBUCOFdG2lgtp1sm1bHHqelcFNValOBiMeG+S7JSi
 WIoDl+ZpuN/fLiLLYLaN+oQoaoPMbVgHDG4FfbmnLv7WrUJeSILAfSMu5yBNaHB0zpa5
 kt3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=2nKcH8qE38wjQVeLh7HJGzQCXcEvMXoIqFdsSAingxM=;
 fh=w90OkhXHIOYSOmZWdZC3cQSvA4EPbbOVsMQJEMWVOEo=;
 b=i+Id1Ip6rVv+yBgq6AkuGyKpOLawju6q9HMOMuXvFX9Tnw1212/65tXb8axst5rge1
 TE+aJzOMgE4MDWZFfBsPdB6Exkzz+V79hXydxJoqQHBVgTvhWjHoczGuaa12CU1seavV
 2MhY51CtmCYNk+7+nrKRKz+ai4EXzF51c28jw6hYOUG44bf9+cAf9oL7taW2J+fKsI3I
 3ZNo1uT2M3SgqSDSsdyI9obXVmZKoMLbeW25CAAqLQDWSNRCv59YeEi+MDe2ubDksjFl
 223ibQRTFGHMPjhgMLAhUUY/uKNUquLRR5ZrsnOalos0d8KvH266K0C9uGYD0mqLldrj
 Ij2w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782382178; x=1782986978; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2nKcH8qE38wjQVeLh7HJGzQCXcEvMXoIqFdsSAingxM=;
 b=tWzxUtfAU0cZ+mddu7gsuvkaNpAwQUMvca980hoW22wZXLuhP8abVWe7FZVBpcfVJF
 9A+l1ZddkQVz4MiaqBpkkVqaxb1r8hgmt1kACQW3sijWB2g8cHLTWqpuj4PAgM71f2n6
 HtdWx1bPYt+kFC1j81UmGMj7P2tTDfNJ763qQdMuHpo0uePkrvb2X7ty1eHqhJKHMWUj
 VYmqbqiNvlguo/dk2+YzztTjRLS1b/KljzQ9qCyiInddD1ZxqEYW2ct62KleHm0TSc2Z
 itHZPvZlzs/ltTl++tRXRe/FHW0zQkFzLg2re1BtYZtRwYxaDHg7EL6SmgmfnoqjmQp+
 E4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782382178; x=1782986978;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2nKcH8qE38wjQVeLh7HJGzQCXcEvMXoIqFdsSAingxM=;
 b=r6hHmcHyra9p01EwjBA+8uuYWGiON8nXtK0OEfTJmfO2l636QKXv7/WWu8Zk/DK1OA
 wxPNaNQfBlCZ/AkzDjt9z4ByW2mhw9yAsdhGdvasW1bfVAt/rjSj17lVCVxsuadGw1Gl
 HeyoeWI4679cYR+e+umrcpWcFgsc/1z8oaDmcv5QXcKP8nj9VlgiiQw99cYSoWHYa8zv
 RD7Opj7zfMP+Ao1xksr0RH2olfr4U0IqGgjnCQiGGplor7IuosO4HjWswdINUdvpqStN
 CaT4gFadiEx5NqhMlQ9qxq0+NArGa3rwPEQawIaVJYnu/RWh9r7SdJ6Ezsd45xf7bifj
 B6lg==
X-Gm-Message-State: AOJu0Yyi0daPLN6iydd1GPUAeUUGreo44DM4pu+rcPRIXoR19NGpRuiV
 hhH59U8S9CUatEBKpN1JIXwJfA1i3SIhP62vHnL0lyz4FNCT7QURZLUNL0eNu1GXwSRtzdnzgjs
 fldoyU/cvxqEBSqr8ZUFqIFjnM4n72RthI7kNl0HDZA==
X-Gm-Gg: AfdE7ck4/V+Vj1fIsHYdoFFlmH6E4h8WBt//mywMQAmZO0s3mIhuXUDXqYSamx3hjZN
 z4I9S7vZEhpEWeO3tDifWrIXRvUMYb2XM4Lg6Wo+BR/x3rUJBVn3xxRXbUB+B2tu+xgPPhUFSEc
 9BZFvgxigEY2MOvWZN4sA+TT4IIE4QsMEM2dA/T4mmPN21y5n1kwCQbLh1fWCQOBf02vPZA8ZZI
 Mhp1wp8u/OUtEND5StmEkGvrMeffme+sFOs5Lz9QRP3kjM0SBMavz+4vSOZMTbP1HOT2OR+1UR/
 NepqnhMI2VLqXFDTEHpw/k3HBL+1aouK0Dh8k4p7YgIUyZDTthsqH84/
X-Received: by 2002:a05:690e:d45:b0:658:f1c8:eab5 with SMTP id
 956f58d0204a3-66487f3f47dmr1179067d50.5.1782382177644; Thu, 25 Jun 2026
 03:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260616052552.389021-1-gshan@redhat.com>
 <20260616052552.389021-2-gshan@redhat.com>
In-Reply-To: <20260616052552.389021-2-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2026 11:09:26 +0100
X-Gm-Features: AVVi8CdWV9N7rq0uuq6ckKY00_Ql_SZuCncvodGyVc97tYPyf19w0MvVKl5PK5I
Message-ID: <CAFEAcA-mf14=jpRFHarAbN6AbQwvW=Yu6WB1JiNMsECEdaxD3A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com, 
 peterx@redhat.com, alex@shazbot.org, richard.henderson@linaro.org, 
 berrange@redhat.com, philmd@oss.qualcomm.com, philmd@mailo.com, 
 david@kernel.org, clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com, 
 jugraham@redhat.com, liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn, 
 shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 16 Jun 2026 at 06:26, Gavin Shan <gshan@redhat.com> wrote:
>
> All ram device regions were turned to be indirectly accessible by commit
> 4a2e242bbb ("memory: Don't use memcpy for ram_device regions"). This leads
> to guest hang on attempt to build 'cuda-samples' as reported by Julia. The
> guest is started by the following command lines, with GH100 GPU card passed
> from the host.
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
> the memory blocks residing in the PCI BAR#4 of the GH100 GPU card can
> be presented to the guest through memory hot-add. The page cache can
> then be allocated from the hot added memory blocks when cuda-samples
> is being built. Afterwards, the page cache is sent to QEMU's virtio-blk
> device as part of the DMA request, the bounce buffer has to be used to
> accomodate the request as the corresponding memory region (MemoryRegion)
> is an indirectly accessible ram device region in qemu. However, the max
> bounce bufer size is only 4096 bytes by default and that is exhausted
> quickly, leading to a reset on the virtio-blk device and frozen guest
> eventually.
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
> This adds qemu_ram_{copy, move}() and replaces {memcpy, memmove}() with
> them in the ram device memory region accessors, similar to what's done
> in commit 4a2e242bbb so that the issue (MMIO access instructions were
> optimized to SSE instructions) covered by that commit is fixed. This
> makes 'ram_device_mem_ops' redundant, paving the way to revert that
> commit to make ram device region directly accessible again in the next
> patch.
>
> Reported-by: Julia Graham <jugraham@redhat.com>
> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> Suggested-by: Peter Xu <peterx@redhat.com>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
> v3: Documentation for qemu_ram_{copy, move}           (Peter/Michael)
>     Support qemu_ram_move() for overlapped src/dest   (Richard)
>     Use {memcpy, memmove} if step is 16-bytes or more (Michael)
>     Code improvements                                 (Richard/Michael)
> ---
>  hw/remote/vfio-user-obj.c |   4 +-
>  include/system/memory.h   |  32 ++++++-
>  system/physmem.c          | 178 +++++++++++++++++++++++++++++++++++++-
>  3 files changed, 207 insertions(+), 7 deletions(-)
>
> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
> index 87fa7b6572..97a6c88780 100644
> --- a/hw/remote/vfio-user-obj.c
> +++ b/hw/remote/vfio-user-obj.c
> @@ -375,9 +375,9 @@ static int vfu_object_mr_rw(MemoryRegion *mr, uint8_t *buf, hwaddr offset,
>          ram_ptr = memory_region_get_ram_ptr(mr);
>
>          if (is_write) {
> -            memcpy((ram_ptr + offset), buf, size);
> +            qemu_ram_copy(ram_ptr + offset, buf, size);
>          } else {
> -            memcpy(buf, (ram_ptr + offset), size);
> +            qemu_ram_copy(buf, ram_ptr + offset, size);
>          }
>
>          return 0;
> diff --git a/include/system/memory.h b/include/system/memory.h
> index 1417132f6d..84203c312d 100644
> --- a/include/system/memory.h
> +++ b/include/system/memory.h
> @@ -2897,6 +2897,36 @@ void address_space_register_map_client(AddressSpace *as, QEMUBH *bh);
>  void address_space_unregister_map_client(AddressSpace *as, QEMUBH *bh);
>
>  /* Internal functions, part of the implementation of address_space_read.  */
> +
> +/**
> + * qemu_ram_copy: copy data to ramblock
> + *
> + * @dst: destination where the data is copied to
> + * @src: source where the data is copied from
> + * @n: length of data to be copied
> + *
> + *
> + * Copy @n bytes from @src to @dst with the assumption that @src and @dst
> + * do not overlap. Handles special cases such as uncacheable ramblocks
> + * correctly. Use this for accessing ramblock in response to DMA/VCPU IO,
> + * in preference to memcpy().
> + */

The documentation for these functions needs to say what semantics
the function is providing (e.g. can I rely on it to do a 4 byte aligned
load as a single 4 byte read?). This does not.

> +/* x86 should work with __builtin_{memcpy, memmove}() for IO access */
> +#if defined(__i386__) || defined(__x86_64__)
> +#define HOST_UNALIGNED_MMIO_OK 1
> +#else
> +#define HOST_UNALIGNED_MMIO_OK 0
> +#endif

This is still wrong. We should not have "x86 magically works
and all other hosts do something different" ifdefs. Define what
semantics you need and then we can figure out how to
implement them.

My current thought is that we need to handle accesses of
1, 2, 4 and 8 bytes that are naturally aligned by ensuring that we
do exactly one host load/store of that type, and that anything else
is "the guest isn't relying on specific semantics here, we can just
assume it's plain old RAM and do whatever". That would not
require any architecture specific ifdefs.

thanks
-- PMM

