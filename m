Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp520365njb;
        Fri, 13 Dec 2024 07:20:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWn/zjkpS8tnqktCWm4soHkM9DsQtitLbG+yeARwPE/kLykB1YI5DdBRdgs6Hr+LKPxSsBtGBtNp0xc2w==@linaro.org
X-Google-Smtp-Source: AGHT+IFQiwQLM7hsZ4cXFYTqqdZi0AsXu/Qeya23bAUsXnM791cqzYhJq6Dt+Ov80Yc37J/xzzEG
X-Received: by 2002:a05:6122:828a:b0:518:97c2:f21a with SMTP id 71dfb90a1353d-518ca251ac7mr3044032e0c.6.1734103234014;
        Fri, 13 Dec 2024 07:20:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734103234; cv=none;
        d=google.com; s=arc-20240605;
        b=lJeCoOxs21vP5j9UidlgDMKCH7l6xt2c0GTGI+FuY+c2doujFRg3J/8Rkb8QxA75qM
         f+BLqu2qasEZaStigFTNYoFmi85UZcjv7919bl01L3dKu4MeiKCf7q48DNB2s5+ezlqj
         xi3KPP5hfcbBvOvuBDv+Yj9uLNBjk9aCbqhe7RdV7HalZVsIaDPXm+tWmw6h1tZNdFXT
         y5JfeSCevKn9ocflvRFBqNRMPa5b4ZX1z5DR4tBqFzS6gOXr1eh+4DbWV8jH+ZUjYXBY
         JUK++eS8ReuER/WIbmbFZijt9AntsOD+qG5dAg76m9WE+Y5nfoEvs4e9IiYwMLcx9E4f
         S4hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=4/Ec6nOtWdcwq1cHZ1x/2dKDUUOEZBhkOyPBjT0KUZI=;
        fh=ztSqZoORT0m7IT2dNQmcRYEmGtV+pg+y0VK9G0QOIAA=;
        b=OqWOiulprj7xSNR54w9ehPaAXAh7Iqq6ur5vmyRklBiNPFb80HGVUNusUpxsF+E+c/
         03R03A/A+jaPUwK9jEdKYI9vP3wfgvo3PbLR9tX96BS8wF3/+kdkPue5X1weyeG2ntG1
         f6aprHUaRJBcslzgEY1OCiU7URgELZ+Y2CQeH9OUv39+x39AgmBoKQUbskP+XxDf9Uzr
         UxZbPC3+p4JZJ6zUdZlI3j6lXS0zTWgxVX/Mt9HIdav7QqXXoAZ8QREuY9mD6mDSJksN
         PeipmRaPjeasiLt9b3AzVSh++JwpSiL1RGt/LPfpurQAGuswsWSRNXOJ9RWwKrOndUE6
         OfpA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=BNi5s+My;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51625a7d7f9si4038659e0c.254.2024.12.13.07.20.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 07:20:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=BNi5s+My;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tM7RL-0004NO-Qi; Fri, 13 Dec 2024 10:18:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7RI-0004LR-Dd
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 10:18:48 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7R9-00053S-Vh
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 10:18:48 -0500
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aa6c0d1833eso317439766b.1
 for <qemu-arm@nongnu.org>; Fri, 13 Dec 2024 07:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1734103117; x=1734707917;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4/Ec6nOtWdcwq1cHZ1x/2dKDUUOEZBhkOyPBjT0KUZI=;
 b=BNi5s+Mycmumza2p6mQ/miUYMSA6SuW0acZ5+F/p+aLZsf6hC8R20IjZMBWQbUtMdW
 f5+PpivlKmey/tMrGegLsrbBsGyLu+W93mX7WE3GXOGS+FdOti50Ecp80j8DZrWkPSJs
 dCgGCB+P9q8WfCxjhXEY+DELqHZJTSqmOLCZnT5TjT0RwR6QwqzvEOZuHZ5wiQ0WnO9u
 XiXf73Z/x3vA+Cz9VqJssz/W4PQHdqpngkQb2ljkiNGrchX8EpRcwwYP2amaYaOJ6oGi
 QkjX4vXZbEPoIfEx4HZakU7+0ylbOw4jdPvLOvErxvFoeypkzN/OVDdwO0MFGYL86Cct
 +kFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734103117; x=1734707917;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4/Ec6nOtWdcwq1cHZ1x/2dKDUUOEZBhkOyPBjT0KUZI=;
 b=ht10E0Bek/byps3tZG3xRyJLrXfJ+8lRYgiYOU3bO1QczzqvBEdrlXHyF7xTsaqcla
 MEz/bPfxVXsNbtEnz+iE7XEjkAX0Sd/29c9ayzjKUnvzjSUF1JOyb2/5hYu45lRf51mN
 EXsrP6dDlG5VdK5uUcohD941VTbS0UO/VCY+gaxUaXijiRt9EnTQIDzPkt3gT6d4oHUn
 MA4YheKHJfAM/eI8/Zos8YDm0uCWeNz8raGAB+QmYwclqp3P7B8Y2x2gmbN/6tkodJuI
 xXhi9JAYlWaEppuv/dxow+2ir8FRNnG2XYrKzQpeJ9ZEHWuzaHfQLjCFVfIuONuUqWTY
 15gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3Yp6Z84k/TGPyCUzHqQhqm6T8HMC/mEJiLtdI0TIbmMjmXsXCoB8ojCXlcQDCHdVPDua5tMV46A==@nongnu.org
X-Gm-Message-State: AOJu0YxyRmjvyMuIU6Z5K9s9whtYvc4a8nAW1H1dqKJ/avnAXP5/nuia
 nv45jt6xUT+NwyroewGqy83XSdhG6aZZsLQPTN3dTk8/L854wj4aY5gfKMocFA==
X-Gm-Gg: ASbGncue9ObF4hTWoo2/Ayc3EEPfoQ8oBzzMwO59SZTlZZrvn3y0LtHLUvoG4L6GWTL
 wuXzura5yeBkB5s4ddgDJhMqFZs9vEE/IxmRkiUE6+9Q0SCJ8vkSGuJxBm92/werjiMA0fvX31o
 azl1AFOoDnonPZvUqZ4zfoJfdVhlvqD6gKDxxewkQNwk+EevKV3VLxq6c1kaSLadYDfufTYJ6l9
 tNIUEQVhYMmtEbZk4zc++LPpV2hmrokz/Rn65P3mNRKI0zaB9Zv7+gQwULWiKJtVuMMQtwYKv1Q
 jPaYZzdhfRBp73af+cFRFqoZJ44LNNnZ
X-Received: by 2002:a17:906:31cc:b0:aa6:423c:8502 with SMTP id
 a640c23a62f3a-aab77ef7ec8mr264456366b.60.1734103117166; 
 Fri, 13 Dec 2024 07:18:37 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab8dd35b19sm29284166b.33.2024.12.13.07.18.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Dec 2024 07:18:36 -0800 (PST)
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
Subject: [PATCH v13 00/15] macOS PV Graphics and new vmapple machine type
Date: Fri, 13 Dec 2024 16:17:50 +0100
Message-Id: <20241213151821.65748-1-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::629;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: dxNwQAyeXTOs

<meta>
This patch series has been through months of review and
refinement. It now has end-to-end Reviewed-by: tags and
all code patches but one have Tested-by: tags. No significant
issues have been found via review for some weeks.

The patch set creates two new subsystems:
hw/display/apple-gfx
hw/vmapple
so it doesn't fall within the responsibility of existing
maintainers. How do we proceed to get this merged now that
10.0 development is open?
</meta>


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
 * Due to a quirk (bug?) in the macOS XHCI driver when MSI-X is not
   available, correct functioning of the USB controller (and thus
   keyboard/tablet) requires a small workaround in the XHCI controller
   device. This is part of another patch series:
   https://patchew.org/QEMU/20241208191646.64857-1-phil@philjordan.eu/
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

v12 -> v13:

 * 15/15 (vmapple machine type): Bumped the machine type version from 9.2
   to 10.0.
 * All patches in the series now have been positively reviewed and received
   corresponding reviewed-by tags.

v13 -> v14:

 * 6/15 (hw/vmapple directory): Changed myself from reviewer
   to maintainer, as that seemed appropriate at this point.
 * 15/15 (vmapple machine type): Gate creation of XHCI and
   USB HID devices behind if (defaults_enabled()).

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

