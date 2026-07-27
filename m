Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2186FC5321C
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Jul 2026 12:52:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woKoR-0008MA-LB; Mon, 27 Jul 2026 08:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woKoL-0008JL-L0
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 08:52:02 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1woKoJ-0004Pc-Ha
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 08:52:01 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-66804667af2so1919328d50.0
 for <qemu-arm@nongnu.org>; Mon, 27 Jul 2026 05:51:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785156717; cv=none;
 d=google.com; s=arc-20260327;
 b=e8mT80uWITuvdKFLebwT2HtFhG0AlHpHlHbfiQzQV2o/PBcU2vji6+zSHhZI00HphI
 Z7Wwu0fWonBt+ZqJ0Afs0cnB0BKzA3jnz8IXNTOeqso8XwfKzr5tateBkAjgqEV6Lsgq
 9brGa95SGzxinf9/oM/szBdGsxvJyT4xS0S73OLntHbg//Ga9jpm33jHDxonTR80S0cR
 gz2UakpnvcPGOcL/9BkYGMzF7koiJRkx9mMOi6CsU2keoeWpRTPp9Cr6tEeu3X5QT+S+
 ZSXO5Wkp/+Hn1x7vCkfxYFoLN7GmZ3rdFTYGshEp5rbxUZZjYLjeXiH0OJGDkLyys8QX
 bzFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Yj4gbMvXfS0pY+jJ3jjbWR1E4XrhV1F6yhxCKKzJ2ZQ=;
 fh=X/0M8Hipi4oCnDiC1rXYRLNAP+KGnuM2DB3qE81F9Nc=;
 b=TtD7U9sWYVjkLpAs90JW21+rYUtRrPJn8QgAdZbreosEwkj69Fg/x4Pi4Wj+1Uc7CF
 6qedYT2Og05szCbH3JQ9liXooyqCaVTAhRXqcppk9BDp+WoAVuqcthFaienhJr4Kr3ha
 FR40TAqvShkvpGrrDfLIwsBCq47RH2DgKpcDLfSZ3Qph0MnwwJ1jKsu+gGlM8K49gYby
 YuqppZ6yQWw7ywOMbhrY3jpP1EYruG/KKFIDu3sHtS6BojAlE5EeK9YRbf+LnRA5IJC1
 nrGuLfNLYtMEgu9bLyy4wsooUkAOOmwe4FvWUBvqKVAMJceWjS3TwnFV6+WBvRsG0eA/
 4SVg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785156717; x=1785761517; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Yj4gbMvXfS0pY+jJ3jjbWR1E4XrhV1F6yhxCKKzJ2ZQ=;
 b=b2Gm9OxDzviuZ3ZTCU/UqiPVmAzi2krDfp6U/uUlUZiL1DG0U2zsgKPe0dW3mVpMBp
 kCkG4W7hAuyb8lDmiQePIeQqBjoJn0y3PU+FaYS/8prIgeKYDS2CFkEx7RIQjpkq/12z
 IPPu/jFEu1/HWOHQri8Y5qshlpGaih9/V8Gra8jxZjGniYYfTjXbmxTnJoZTqPVMYbSS
 QDXcDj0kKYFDt/rvjWAvsUqEN8M3N76ABzY7SiC9zUSD8i8hxT9bmnnyq4EKjYnbFukH
 MBsux1J2DVGy/HXJDFTPpB5yk/quyD4jEzItodb5kcBJnji0MaR5aOPw/p3UbA8CCNEq
 CPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785156717; x=1785761517;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Yj4gbMvXfS0pY+jJ3jjbWR1E4XrhV1F6yhxCKKzJ2ZQ=;
 b=LOS6ESrrPd3sAHKFPsmX9zKufIA2TwzLr4DeyBxKUaJUDHpSJkd8g9ez7ow+j68hZ4
 Bps882aIz854mYiBabEsoWrrgoyo8CpLBu+id0rN5qDxN0FvmDIDPsefNixvSrl/fhVU
 3SxKfkkn69mz1BCEknbedqpw/T07VakH27KVK4xsgelmHVBHF6aO4aK4pf1QK3OXtEBK
 HZMXnvkxyD3L8KoDTe5HohCNKD+BgHshJZKCyqy9iF5VkZtOnB7Muc2Mgq6aOpwCt6x2
 7muH/fk85DZFa0Mz7pzeCQ7MbiplLTLibJGJ+mZmd/Uj3YKwTB0QxRc3X5i5cuyKMCAK
 BPzQ==
X-Gm-Message-State: AOJu0Yzknwt7yzp1NGk4N9N1y6oxTA1C8dfuq3I7LBURCH3lcVS1wM4b
 CpdlUFshsH7nii+8ADTreDK1IZqgUxi+VOyQ4fP4ybv2SuZRCYIRnupaKxvsnJd1SHarBaIf1sS
 OxQYWfa47kgMkAEOdkptk3DTKk56pmfCUCzunXUw0sg==
X-Gm-Gg: AR+sD114ed6AO0x/929Yds/tY8sT2MU90tRlEdDD7L977lvG6rehxWVb3/mBwuCq1d9
 m80nPL0Ub4WuPl8uq9mwLUERtoFgEXAHfKsw/8BeqO3niF2j/yTLMLgnDpf296doHJWjUoJLQDM
 GVdlVAmhsVFP9zO4Vh98Z84nGN9Wl9RkGKCCpv3k5DhfRSImoBdfcshQq3FGy43q0DQz4XdBI9k
 EXacBNBdZF7ltt8QuPyFXWglD9KB0/V+y52lDES/JVf6IIX4MpDgRQSFNb09GaoFIKPWq3fGYmO
 qUAyUcoZyPPrZQpVM3cVoWtB2UDv9K/FgdozhiZNacIvig==
X-Received: by 2002:a05:690e:1915:b0:667:b16d:ed66 with SMTP id
 956f58d0204a3-668c79a0670mr2865299d50.25.1785156717352; Mon, 27 Jul 2026
 05:51:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260727032649.145381-1-gshan@redhat.com>
 <20260727032649.145381-3-gshan@redhat.com>
In-Reply-To: <20260727032649.145381-3-gshan@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jul 2026 13:51:45 +0100
X-Gm-Features: AUfX_mzQL5IKMmkX_Tc17VTySH_obu0j7WUByeY3Q9WwaadlCyt3M930s9evEgY
Message-ID: <CAFEAcA9_tDRAd97z4UtNhFPK+fMbq37LJhWTSmD5cueo61hvvg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] system/memory: Use qemu_ram_move() for directly
 accessible regions
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peterx@redhat.com, 
 mst@redhat.com, philmd@oss.qualcomm.com, richard.henderson@linaro.org, 
 alex@shazbot.org, berrange@redhat.com, philmd@mailo.com, david@kernel.org, 
 clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com, jugraham@redhat.com, 
 liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Mon, 27 Jul 2026 at 04:27, Gavin Shan <gshan@redhat.com> wrote:

Initial note: I think this is basically the right thing; I have
some suggestions for beefing up the doc comment and some minor
other things below.

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
> This adds qemu_ram_move() where the aligned and small-sized accesses are
> handled by qatomics, and fall back to memmove() otherwise. The memove()
> for the directly accessible regions is replaced by qemu_ram_move() so that
> the issue covered by commit 4a2e242bbb (MMIO access instructions were
> optimized to SSE instructions) is fixed. This makes 'ram_device_mem_ops'
> redundant, paving the way to revert that commit to make the ram device
> region directly accessible again in the next patch.

I think this commit message should also describe the second category
of bug that we intend it to fix: the one where a device does e.g.
address_space_stb() to a data structure in guest memory and requires
it to write exactly that byte exactly once.


> Reported-by: Julia Graham <jugraham@redhat.com>
> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> Suggested-by: Peter Xu <peterx@redhat.com>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> --- a/include/system/memory.h
> +++ b/include/system/memory.h
> @@ -2666,6 +2666,21 @@ void address_space_register_map_client(AddressSpace *as, QEMUBH *bh);
>  void address_space_unregister_map_client(AddressSpace *as, QEMUBH *bh);
>
>  /* Internal functions, part of the implementation of address_space_read.  */
> +
> +/**
> + * qemu_ram_move: move data from or to ramblock
> + *
> + * @dst: destination where the data is moved to
> + * @src: source where the data is moved from
> + * @n: length of data to be moved
> + *
> + * Move @n bytes from @src to @dst with the assumption that @src and @dst
> + * can overlap. The access is atomic if the source and destination buffer
> + * aren't overlapped for a well aligned and small-sized access. Otherwise,
> + * fall back to the standard memmove().
> + */

I think we could usefully expand this comment, because the reasons
we need it are not immediately obvious. How about:

===begin===
Move @n bytes from @src to @dst; the memory areas may overlap.
This provides the same semantics as memmove(), plus an additional
stronger guarantee: if @n is 1, 2 or 4 or 8 bytes, and @src
and @dst are both naturally aligned for that access size, and
the memory areas do not overlap, then both the load and the store
will be done as a single atomic access (with the semantics of
qatomic_read() and qatomic_set()).

This is the underlying function that we use to implement accesses
by a guest vCPU or a device DMA operation to a ram block. The
atomic guarantee is needed for two major cases:
 - when the ram block is backed by a PCI BAR passed through
   from a host device (and so it might be hardware registers
   that must be accessed exactly once at the right width)
 - when an emulated device updates a data structure shared in
   guest memory with guest software (e.g. a network device's
   set of tx and rx descriptor blocks), if a write to memory
   is accidentally performed multiple times then it can break
   the guest code.

We don't attempt to perform the exact access when it would
be unaligned, because this can't necessarily be done on
all host architectures; although this is strictly speaking
not doing what would happen on real hardware, we don't think
there are going to be situations where that matters in practice.
===endit===

?

(if you take my suggestion below, then delete "and the
memory areas do not overlap", because the only case
where the accesses are naturally aligned and they
overlap is the case of src == dst)


> diff --git a/system/physmem.c b/system/physmem.c
> index 2c42e365cb..18485f7b08 100644
> --- a/system/physmem.c
> +++ b/system/physmem.c
> @@ -3158,6 +3158,41 @@ void memory_region_flush_rom_device(MemoryRegion *mr, hwaddr addr, hwaddr size)
>      invalidate_and_set_dirty(mr, addr, size);
>  }
>
> +void qemu_ram_move(void *dst, const void *src, size_t n)
> +{
> +    uintptr_t test, len;
> +
> +    if (src == dst || n == 0) {

I think we should not bother testing for src == dst. It's
vanishingly unlikely to actually happen, and if it does
happen then the code will work fine, and it's probably better
to actually do the access in that case than to skip it.

> +        return;
> +    }
> +
> +    test = (uintptr_t)src | (uintptr_t)dst | n;
> +    len = test & -test;

What is this doing? I am not a fan of clever bit twiddling
that isn't commented to explain itself. Readers of the code
shouldn't have to go off and search for an explanation of what
is going on.

> +
> +    /* Overlapping buffers, unaligned or oversized access */
> +    if (n > 8 || len != n) {
> +        memmove(dst, src, n);
> +        return;
> +    }
> +
> +    switch (len) {
> +    case 1:
> +        qatomic_set((uint8_t *)dst, qatomic_read((uint8_t *)src));
> +        break;
> +    case 2:
> +        qatomic_set((uint16_t *)dst, qatomic_read((uint16_t *)src));
> +        break;
> +    case 4:
> +        qatomic_set((uint32_t *)dst, qatomic_read((uint32_t *)src));
> +        break;
> +    case 8:
> +        qatomic_set((uint64_t *)dst, qatomic_read((uint64_t *)src));
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}

thanks
-- PMM

