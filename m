Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp813034njk;
        Fri, 29 Nov 2024 07:28:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXxUDPybnkw9o7yPE1yv/YuAGHETHkteQBR+B/9EYsDNvJ5lE0ppC39DSbT9uOlrNkgKiDvi3uN56b43Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFpD1vCbjtm948vISQunYgmh07A8asJ96Kcr3Dr/g2Xt9d/0pOAQsz3fDJJLu3PHhwv96J2
X-Received: by 2002:a05:620a:2b82:b0:7b6:773f:4bd1 with SMTP id af79cd13be357-7b67c2906b9mr1683624285a.26.1732894115426;
        Fri, 29 Nov 2024 07:28:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732894115; cv=none;
        d=google.com; s=arc-20240605;
        b=YOHL3Lo4RQAld7VGOuh1Wlx+K28od22qNc0ckPPP2t3ZVTvOHcKjgsDxo3NEpK4Jdk
         6dyxX0JrEn4cZOt2/Xt9YVGnsPv8y866gZ/Yg03/EEDoH+B/eZpKE2S0dotrJUyZ6FEA
         SmITH0bWnAjdVNpUx9tUav1fSVbd2XYzB0A1Lk5M3xBbPLZ3Znat4pbHwvQpc7EBkxUX
         CcUTU2BQIKqdEEk3SzupOJ5dd3wov0LCnq7niR1EbNM1R2Q1v3dHXP2zoI4bPmW1oxXv
         7HDNr9e6XSxDsskXBadvvCmchxs3FpJP1NMTGU0eCT4XoB6GVMHkTi0HolStrH98FU9C
         k5tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=PifvGBLeJ1S0se6mZ6yuxt7j6z7H3W+/gux+em09+1w=;
        fh=uEOJKYQz7smoVZsMAlZ5HS7V2FNBLrECdrqiuxtyS08=;
        b=TrlRPn1ss/g9ExaKdXyMxguS737v6LnAWeJX8QAdcHjRZulA+ugBJtHo8jHPGfaj9Q
         ZtsXksW47mI+nZYG4D+wftvIpBOlHtME7rcEHmnY0PEmvI1Ma/dKGSlZtoJrwUG5Hps0
         810qZxQUG3Gu6hLOSWHoFMCc4lVJZ7tmT1k6k13XKsm9cU8GB5hfYbp8ltyCuMcKeTSl
         PsoafToSrTm43KoAg8mSLMKTTKLM6VvikiYdK55DvWT262VNKhrD8EdcsAS9OrndC1kD
         zONL/VDpJfGUq2O2W2fuP+Mpv25AjcNUWN6SuvWcgj3M+nllU7wbow4X+40SUstXyhdE
         JcXA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b="y1t1Kr/4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b684923ffesi459616885a.82.2024.11.29.07.28.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2024 07:28:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b="y1t1Kr/4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tH2rw-0008Jo-7c; Fri, 29 Nov 2024 10:25:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tH2ru-0008IS-6c
 for qemu-arm@nongnu.org; Fri, 29 Nov 2024 10:25:18 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tH2rp-00020q-Aw
 for qemu-arm@nongnu.org; Fri, 29 Nov 2024 10:25:17 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-382376fcc4fso1422400f8f.2
 for <qemu-arm@nongnu.org>; Fri, 29 Nov 2024 07:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1732893911; x=1733498711;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PifvGBLeJ1S0se6mZ6yuxt7j6z7H3W+/gux+em09+1w=;
 b=y1t1Kr/4G5o/IRDM/u4d+Xwdz1tV3tNKk40WX12Epzd/aXMxIQuovYjYW0pO2Y7Kae
 lBUu8+8KFrS3tQGEF5oBxaSotISVMsKau1WIclL6bXeP2qhNK75KraWIfm/CgGIhQGaj
 Pn2egPHC7Yd/2ZtAaYn/GhoktXjkW+la/89+pAFcHZxJwZoiKIqNqRJkXprCg6fsx4JI
 oPuTybwtVYucfNY4HjIC9/1uM40BTzJnTxnJ3G046YJvcRnrRO/2aJLYRX1z949u1hwp
 CpM7seDU9TzMGvs92OeofCmupcVhCFgpXWdDojnCq35JZdYVhzAeg/2YZVH/dBySRwta
 npaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732893911; x=1733498711;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PifvGBLeJ1S0se6mZ6yuxt7j6z7H3W+/gux+em09+1w=;
 b=TXhhMhsCLrEX7nqQjX5PhznimNDFUqffmGHrm+wh0XkmF90QvmNPv2lxlFJqpiu05x
 XM4XWYpXHg22jBHF30NG/UrhPGki9RbNAbMNTpxQ3OuKbV7C6Bf8WLFbfiL4T5tGHPFk
 KrDUdkOSRohZPYte5ok1XAXKfWhrRcgLWlJltmj7vl2/IFWYemWOEl31c4MG92QvjQpQ
 5ijZT4r4U60Bs9tguN464JaNaNVtPslPgRk1fmeHBj0+/VJuomkqk5Rgx6qe/eT5bRST
 3PV8ykjlrQ8ygc+IemEz+Ts/my/I8PotZ1uxKXq97+Qdt1N5C1ifqcOfkwPMzMvhCo2f
 SV4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1FFE6/reBo2oV0aQNbuB8W+IS2/avaldNUuQU7vzDjPzd7+U4orYW/vp2pSEt2S8UbIkYa0jSRQ==@nongnu.org
X-Gm-Message-State: AOJu0YytGSPAzcaEd08DbWlKX8Z6+XJfiEBlBAJcQiIiYDuO6WHXu8yk
 dqSwvFBfRS652i0YBo9SGxeXpOyWq/dhdBafYg56l6x1wvLsTqfIPf80sSk3vg==
X-Gm-Gg: ASbGncssxC3HC/i3zvy+G6R/FL3eOcTUYopY4dJH4PvzCoouy1gCBEHcMNwFSFGbH7a
 GFmHwdHAEMSZZ+O2S8/VA5VrYx1+njv8jq0xv13pECPzRqFOgEnN4e2WJ1ElTKIlo7mlw0hzb4v
 ByAh5scBrCYG2Aa/5UdPQNjfU/41ZzbkBCsTWhO54+qMi0qD1DDWStVRDGeFiRkelulM2ggMGXc
 VV23nBiXANwFye8V8i+++v0LhE4DgMpWoxncj9a6bb04AWjxptKHYN9f2u9TyoEHULfNHvqmW3h
 +bf5IOycoHxFx9oRpM6eMxsFgw==
X-Received: by 2002:a5d:5984:0:b0:385:df44:12cb with SMTP id
 ffacd0b85a97d-385df4415c6mr2087416f8f.0.1732893910680; 
 Fri, 29 Nov 2024 07:25:10 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385ccd2db2dsm4685119f8f.14.2024.11.29.07.25.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 Nov 2024 07:25:09 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, balaton@eik.bme.hu
Subject: [PATCH v12 00/15] macOS PV Graphics and new vmapple machine type
Date: Fri, 29 Nov 2024 16:24:51 +0100
Message-Id: <20241129152506.59390-1-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::433;
 envelope-from=phil@philjordan.eu; helo=mail-wr1-x433.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KRBgKCJk4Liw

This patch set introduces a new ARM and macOS HVF specific machine type
called "vmapple", as well as a family of display devices based on the
ParavirtualizedGraphics.framework in macOS. One of the display adapter
variants, apple-gfx-mmio, is required for the new machine type, while
apple-gfx-pci can be used to enable 3D graphics acceleration with x86-64
macOS guest OSes.

Previous versions of this patch set were submitted semi-separately:
the original vmapple patch set by Alexander Graf included a monolithic
implementation of apple-gfx-mmio. I subsequently reviewed and reworked
the latter to support the PCI variant of the device as well and submitted
the result in isolation. As requested in subsequent review, I have now
recombined this with the original vmapple patch set, which I have updated
and improved in a few ways as well.

The vmapple machine type approximates the configuration in macOS's own
Virtualization.framework when running arm64 macOS guests. In addition to
generic components such as a GICv3 and an XHCI USB controller, it
includes nonstandard extensions to the virtio block device, a special
"hardware" aes engine, a configuration device, a pvpanic variant, a
"backdoor" interface, and of course the apple-gfx paravirtualised display
adapter.

There are currently a few limitations to this which aren't intrinsic,
just imperfect emulation of the VZF, but it's good enough to be just
about usable for some purposes:

 * macOS 12 guests only. Versions 13+ currently fail during early boot.
 * macOS 11+ arm64 hosts only, with hvf accel. (Perhaps some differences
   between Apple M series CPUs and TCG's aarch64 implementation? macOS
   hosts only because ParavirtualizedGraphics.framework is a black box
   implementing most of the logic behind the apple-gfx device.)
 * PCI devices use legacy IRQs, not MSI/MSI-X. As far as I can tell,
   we'd need to include the GICv3 ITS, but it's unclear to me what
   exactly needs wiring up.
 * Due to lack of MSI(-X), event delivery from USB devices to the guest
   macOS isn't working correctly. My current conclusion is that the
   OS's XHCI driver simply was never designed to work with legacy IRQs.
   The upshot is that keyboard and mouse/tablet input is very laggy.
   The solution would be to implement MSI(-X) support or figure out how
   to make hcd-xhci-sysbus work with the macOS guest, if at all possible.
   (EHCI and UHCI/OHCI controllers are not an option as the VMAPPLE
   guest kernel does not include drivers for these.)
 * The guest OS must first be provisioned using Virtualization.framework;
   the disk images can subsequently be used in Qemu. (See docs.)

The apple-gfx device can be used independently from the vmapple machine
type, at least in the PCI variant. It mainly targets x86-64 macOS guests
from version 11 on, but also includes a UEFI bootrom for basic
framebuffer mode. macOS 11 is also required on the host side, as well
as a GPU that supports the Metal API. On the guest side, this provides
3D acceleration/GPGPU support with a baseline Metal feature set,
irrespective of the host GPU's feature set. A few limitations in the
current integration:

 * Although it works fine with TCG, it does not work correctly
   cross-architecture: x86-64 guests on arm64 hosts appear to make
   some boot progress, but rendering is corrupted. I suspect
   incompatible texture memory layouts; I have no idea if this is
   fixable.
 * ParavirtualizedGraphics.framework and the guest driver support
   multi-headed configurations. The current Qemu integration always
   connects precisely 1 display.
 * State serialisation and deserialisation is currently not
   implemented, though supported in principle by the framework.
   Both apple-gfx variants thus set up a migration blocker.
 * Rendering efficiency could be better. The GPU-rendered guest
   framebuffer is copied to system memory and uses Qemu's usual
   CPU-based drawing. For maximum efficiency, the Metal texture
   containing the guest framebuffer could be drawn directly to
   a Metal view in the host window, staying on the GPU. (Similar
   to the OpenGL/virgl render path on other platforms.)

Some of my part of this work has been sponsored by Sauce Labs Inc.

---

v2 -> v3:

 * Merged the apple-gfx and vmapple patchsets.
 * Squashed a bunch of later apple-gfx patches into the main one.
   (dGPU support, queried MMIO area size, host GPU picking logic.)
 * Rebased on latest upstream, fixing any breakages due to internal
   Qemu API changes.
 * apple-gfx: Switched to re-entrant MMIO. This is supported by the
   underlying framework and simplifies the MMIO forwarding code which
   was previously different on x86-64 vs aarch64.
 * vmapple: Fixes for minor bugs and comments from the last round of
   review.
 * vmapple aes, conf, apple-gfx: Switched reset methods to implement
   the ResettableClass base's interface.
 * vmapple: switched from virtio-hid to an XHCI USB controller and
   USB mouse and tablet devices. macOS does not provide drivers for
   virtio HID devices, at least not in version 12's vmapple kernel.
   So input now sort of works (interrupt issues) rather than not
   at all. Use network-based remote access to the guest OS as a
   work-around.

v3 -> v4:

 * Complete rework of the mechanism for handling runloop/libdispatch
   events on the main thread. PV graphics now work with the SDL UI.
 * Renamed 'apple-gfx-vmapple' device to 'apple-gfx-mmio'
 * hw/display/apple-gfx: threading model overhaul to be more consistent,
   safer, and more QEMU-idiomatic.
 * display-modes property on the apple-gfx devices now uses the
   native array property mechanism and works on both device variants.
 * hw/vmapple/aes: Improvements to logging and error handling.
 * hw/vmapple/cfg: Bug fixes around device property default values.
 * hw/vmapple/{aes,cfg,virtio-blk/vmapple}: Most header code moved into
   .c files, only a single vmapple.h now contains the #defines for the
   vmapple machine model-specific device type names.
 * hw/block/virtio-blk: New patch for replacing virtio_blk_free_request
   with g_free. (Optional)
 * Various smaller changes following comments in v3 code review in
   apple-gfx, aes, cfg, bdif, virtio-blk-vmapple, and the vmapple
   machine type itself. See patch-specific v4 change notes for details.

v4 -> v5:

 * Simplified the main thread runloop mechanism. Back to setting
	 qemu_main directly, but narrowing the scope of what it needs to do,
	 and it can now be NULL. (Meaning run the QEMU main event loop on
	 the main thread as is traditional.)
 * hw/display/apple-gfx: Further improvements to the BH based job code bridging
   the libdispatch & QEMU thread synchronisation impedance mismatch.
 * hw/display/apple-gfx: Thread safety and object lifetime improvements.
 * hw/display/apple-gfx-*: Better buffer and error handling in display mode
   property setters and getters.
 * hw/vmapple/aes: More consistent and safer logging/tracing
 * hw/vmapple/cfg: Better error reporting on overlong property strings.
 * hw/vmapple/virtio-blk: Fixed theoretically-unaligned write to config buffer.
 * vmapple machine type: Moved ecam region into machine state, improved device
   property setting error handling, improved ECID/UUID extraction script and
   docs.
 * Various smaller fixes in apple-gfx/-mmio, apple-gfx-pci, vmapple/aes,
   vmapple/cfg, vmapple/virtio-blk, and vmapple machine type.
 * Added SPDX license identifiers where they were missing.

v5 -> v6:

 * 01/15 (main/Cocoa/runloop): Combined functions, fixed whitespace
 * 02/15 (apple-gfx): Further refinement of PVG threading: reduced some callback
   tasks from BHs to merely acquiring RCU read lock; replaced some libdispatch
   tasks with BHs; last remaining synchronous BH now uses emphemeral
   QemuSemaphore.
 * 02/15 (apple-gfx): Readability improvements and other smaller tweaks
   (see patch change notes for details)
 * 04/15 (display modes): Replaced use of alloca() with NSMutableArray.

v6 -> v7:

 * 02/15 (apple-gfx): Use g_ptr_array_find() helper function, coding style tweak
 * 03/15 (apple-gfx-pci): Removed an unused function parameter
 * 04/15 (apple-gfx display mode property): Simplified error handling in
   property parsing.
 * 10/15 (vmapple/aes): Coding style tweaks.
 * 12/15 (vmapple/cfg): Changed error messages for overrun of properties with
   fixed-length strings to be more useful to users than developers.
 * 15/15 (vmapple machine type): Tiny error handling fix, un-inlined function

v7 -> v8:

 * 02/15 (apple-gfx): Naming and type use improvements, fixes for a bug and a
   leak.
 * 04/15 (apple-gfx display mode property): Type use improvement
 * 10/15 (vmapple/aes): Guest error logging tweaks.
 * 11/15 (vmapple/bdif): Replaced uses of cpu_physical_memory_read with
   dma_memory_read, and a g_free call with g_autofree.
 * 12/15 (vmapple/cfg): Macro hygiene fix: consistently enclosing arguments in
   parens.
 * 15/15 (vmapple machine type): Use less verbose pattern for defining uuid
   property.

v8 -> v9:

 * 01/16 (ui & main loop): Set qemu_main to NULL for GTK UI as well.
 * 02/16 (apple-gfx): Pass device pointer to graphic_console_init(), various
	 non-functional changes.
 * 03/16 (apple-gfx-pci): Fixup of changed common call, whitespace and comment
   formatting tweaks.
 * 04/16 (apple-gfx display modes): Re-ordered type definitions so we can drop
   a 'struct' keyword.
 * 10/16 (vmapple/aes): Replaced a use of cpu_physical_memory_write with
   dma_memory_write, minor style tweak.
 * 11/16 (vmapple/bdif): Replaced uses of cpu_physical_memory_write with
   dma_memory_write.
 * 13/16 (vmapple/virtio-blk): Correctly specify class_size for
   VMAppleVirtIOBlkClass.
 * 15/16 (vmapple machine type): Documentation improvements, fixed variable
   name and struct field used during pvpanic device creation.
 * 16/16 (NEW/RFC vmapple/virtio-blk): Proposed change to replace type hierarchy
   with a variant property. This seems cleaner and less confusing than the
   original approach to me, but I'm not sure if it warrants creation of a new
   QAPI enum and property type definition.

v9 -> v10:

 * 01/15 (ui & main loop): Added comments to qemu_main declaration and GTK.
 * 02/15 (apple-gfx): Reworked the way frame rendering code is threaded to use
   BHs for sections requiring BQL.
 * 02/15 (apple-gfx): Fixed ./configure error on non-macOS platforms.
 * 10/15 (vmapple/aes): Code style and comment improvements.
 * 12/15 (vmapple/cfg): Slightly tidier error reporting for overlong property
   values.
 * 13/15 (vmapple/virtio-blk): Folded v9 patch 16/16 into this one, changing
   the device type design to provide a single device type with a variant
	 property instead of 2 different subtypes for aux and root volumes.
 * 15/15 (vmapple machine type): Documentation fixup for changed virtio-blk
   device type; small improvements to shell commands in documentation;
   improved propagation of errors during cfg device instantiation.

v10 -> v11:

 * 01/15 (ui & main loop): Simplified main.c, better comments & commit message
 * 02/15 (apple-gfx): Give each PV display instance a unique serial number.
 * 02 & 03/15 (apple-gfx, -pci): Formatting/style tweaks
 * 15/15 (vmapple machine type): Improvements to shell code in docs

v11 -> v12:

 * 01/15 (ui & main loop): More precise wording of code comments.
 * 02/15 (apple-gfx): Fixed memory management regressions introduced in v10;
   improved error handling; various more conmetic code adjustments
 * 09/15 (GPEX): Fixed uses of deleted GPEX_NUM_IRQS constant that have been
   added to QEMU since this patch was originally written.

Alexander Graf (9):
  hw: Add vmapple subdir
  hw/misc/pvpanic: Add MMIO interface
  hvf: arm: Ignore writes to CNTP_CTL_EL0
  gpex: Allow more than 4 legacy IRQs
  hw/vmapple/aes: Introduce aes engine
  hw/vmapple/bdif: Introduce vmapple backdoor interface
  hw/vmapple/cfg: Introduce vmapple cfg region
  hw/vmapple/virtio-blk: Add support for apple virtio-blk
  hw/vmapple/vmapple: Add vmapple machine type

Phil Dennis-Jordan (6):
  ui & main loop: Redesign of system-specific main thread event handling
  hw/display/apple-gfx: Introduce ParavirtualizedGraphics.Framework
    support
  hw/display/apple-gfx: Adds PCI implementation
  hw/display/apple-gfx: Adds configurable mode list
  MAINTAINERS: Add myself as maintainer for apple-gfx, reviewer for HVF
  hw/block/virtio-blk: Replaces request free function with g_free

 MAINTAINERS                         |  15 +
 contrib/vmapple/uuid.sh             |   9 +
 docs/system/arm/vmapple.rst         |  63 ++
 docs/system/target-arm.rst          |   1 +
 hw/Kconfig                          |   1 +
 hw/arm/sbsa-ref.c                   |   2 +-
 hw/arm/virt.c                       |   2 +-
 hw/block/virtio-blk.c               |  58 +-
 hw/core/qdev-properties-system.c    |   8 +
 hw/display/Kconfig                  |  13 +
 hw/display/apple-gfx-mmio.m         | 289 +++++++++
 hw/display/apple-gfx-pci.m          | 157 +++++
 hw/display/apple-gfx.h              |  77 +++
 hw/display/apple-gfx.m              | 880 ++++++++++++++++++++++++++++
 hw/display/meson.build              |   7 +
 hw/display/trace-events             |  30 +
 hw/i386/microvm.c                   |   2 +-
 hw/loongarch/virt.c                 |  12 +-
 hw/meson.build                      |   1 +
 hw/mips/loongson3_virt.c            |   2 +-
 hw/misc/Kconfig                     |   4 +
 hw/misc/meson.build                 |   1 +
 hw/misc/pvpanic-mmio.c              |  61 ++
 hw/openrisc/virt.c                  |  12 +-
 hw/pci-host/gpex.c                  |  43 +-
 hw/riscv/virt.c                     |  12 +-
 hw/vmapple/Kconfig                  |  32 +
 hw/vmapple/aes.c                    | 581 ++++++++++++++++++
 hw/vmapple/bdif.c                   | 275 +++++++++
 hw/vmapple/cfg.c                    | 196 +++++++
 hw/vmapple/meson.build              |   5 +
 hw/vmapple/trace-events             |  21 +
 hw/vmapple/trace.h                  |   1 +
 hw/vmapple/virtio-blk.c             | 205 +++++++
 hw/vmapple/vmapple.c                | 646 ++++++++++++++++++++
 hw/xen/xen-pvh-common.c             |   2 +-
 hw/xtensa/virt.c                    |   2 +-
 include/hw/misc/pvpanic.h           |   1 +
 include/hw/pci-host/gpex.h          |   7 +-
 include/hw/pci/pci_ids.h            |   1 +
 include/hw/qdev-properties-system.h |   5 +
 include/hw/virtio/virtio-blk.h      |  11 +-
 include/hw/vmapple/vmapple.h        |  23 +
 include/qemu-main.h                 |  14 +-
 include/qemu/cutils.h               |  15 +
 meson.build                         |   5 +
 qapi/virtio.json                    |  14 +
 system/main.c                       |  37 +-
 target/arm/hvf/hvf.c                |   9 +
 ui/cocoa.m                          |  54 +-
 ui/gtk.c                            |   4 +
 ui/sdl2.c                           |   4 +
 util/hexdump.c                      |  18 +
 53 files changed, 3840 insertions(+), 110 deletions(-)
 create mode 100755 contrib/vmapple/uuid.sh
 create mode 100644 docs/system/arm/vmapple.rst
 create mode 100644 hw/display/apple-gfx-mmio.m
 create mode 100644 hw/display/apple-gfx-pci.m
 create mode 100644 hw/display/apple-gfx.h
 create mode 100644 hw/display/apple-gfx.m
 create mode 100644 hw/misc/pvpanic-mmio.c
 create mode 100644 hw/vmapple/Kconfig
 create mode 100644 hw/vmapple/aes.c
 create mode 100644 hw/vmapple/bdif.c
 create mode 100644 hw/vmapple/cfg.c
 create mode 100644 hw/vmapple/meson.build
 create mode 100644 hw/vmapple/trace-events
 create mode 100644 hw/vmapple/trace.h
 create mode 100644 hw/vmapple/virtio-blk.c
 create mode 100644 hw/vmapple/vmapple.c
 create mode 100644 include/hw/vmapple/vmapple.h

-- 
2.39.5 (Apple Git-154)

