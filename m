Received: by 2002:a05:7022:611:b0:8f:43c:4b5e with SMTP id 17csp2905276dlb;
        Tue, 5 Nov 2024 07:31:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX7TbI1fqeBIK+l1D5OlyaoY+6W8bBwTOqYRR+Y8NQtNBONs9AoQ6kkH26VNYRR3MB7idRBMauJudDjUg==@linaro.org
X-Google-Smtp-Source: AGHT+IG1z/Ggfghi9ctFAb/x/S5IUqDdP1ANlMig5rwnkfqEMu0rHSIl68YMax+Z7eCl5rKkfk2u
X-Received: by 2002:a05:620a:2944:b0:7b1:4fc3:f2f8 with SMTP id af79cd13be357-7b2f24edf36mr2464279385a.30.1730820665135;
        Tue, 05 Nov 2024 07:31:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730820665; cv=none;
        d=google.com; s=arc-20240605;
        b=h6ehN9nAcktgXIvaIHvMqHJSdRUQ7/JEoo5ZukPOrcsrRBvksGomJSw4mangKbt8fE
         kUOVAsNBHvFdmHPiw7zzmsP/jkjEOdO9S/beZKm+1yMbAhj9gaNF1WWhI6ppbQzv6Irz
         VSs5RsWdTQrj4dj1fP3L2kyzoNl987lwLWMMgcV9Ol2llSt1JWgrXzcMyq5RQs9qWhFL
         n20Q1+mq7OB4fbJbgcq/gyIIwlMjLrWJR86+8PYBSEIuJtF31EsJjbin8h3dK6lfLDeA
         QaQoCvCu0E+2keM4KFb1bdhHx0KPZofqS9/qK9Vjpi4hL20RYpCD9uCp6LaA8QkGIkyZ
         ZXIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=C1zZqndEjQrRfeARcc9wghPSA3uaiHyYpQLOLBZo4FI=;
        fh=0hGRFP4pUsBHres+dUH2q+OOF0bldQaqJp2N6Znbttg=;
        b=RbvheTGzPeLEYIoIgurfAj2HwIsIIyurGwfc6LxFCP18evsov0Ru9TZA4BMEyitQUi
         Kztl9M3pHUjzhOXk6FEU/9eksXcTxvrDNh35ACZUeFGesIU/gX7M3K+Pq+zIB7B5wzL3
         frLcmJsdp39LTta6EFvYKn6IuhoI8v9A7VQx7XIgdo9y7rAvwM7rs40p8ie9b6hfCkfr
         TCXb0KU904ezzJh6KBzbzRCbsJYERy0n9FTc3e4r3H668M9gwkymnXODeK1B2U4MR4nE
         EPhF8HfJQPBy26/M2ByvWomXIiYhpAlcUoLIaKSSsxISBsDcBugWauVfJ/MgGMD2Ydjd
         q6Xg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=BzjhRjrc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f3ab822fsi1468460985a.637.2024.11.05.07.31.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 07:31:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=BzjhRjrc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8LVz-0005Pg-10; Tue, 05 Nov 2024 10:30:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t8LVx-0005PE-Kt
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 10:30:41 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t8LVu-0003yC-Pj
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 10:30:41 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c903f5bd0eso10380534a12.3
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 07:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1730820637; x=1731425437;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C1zZqndEjQrRfeARcc9wghPSA3uaiHyYpQLOLBZo4FI=;
 b=BzjhRjrcnis3eYM6/seeFfkSUlYa+b/qIUEJVawoRuNvT2BSyUPsbRBmlDMkL/DSCD
 PYYyB9DpnTeDooGCm5JvNnIXkEce53sVnhkpFtvqp6W3GBKSBlqD9I42kaO7l/E+REox
 OUF46qDXUi5LBysUSDxa0JFCxed/ykEZgZ2AODBeVCfcY5DkZjE5CH1spIG7nFXIvD4m
 l+wSlUq4lsbQqb6XU+iFNBH4V6g1zZ7dWNM3ePlzcJScyvOzhhIC+a9IaU+ahh9z87Ee
 inc3PHcn8PjC4OOxHmuv+JBcYf5ePmHKEe+nlCK9ojCrB65wKXXkSwsj6LNnG5thQc2W
 A4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730820637; x=1731425437;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C1zZqndEjQrRfeARcc9wghPSA3uaiHyYpQLOLBZo4FI=;
 b=rjask2GaUkkS8NF0bwVIKcTpmBt+ZG3+MQiFAnlVNAm+pXFSShVHpjAjU26LBFGqfP
 0nQXuFeFV085mUmhsjdMgmb44EhHBbpZBhyHU7gKAolBCxCQR/GHiq8qh+uZowbcihWf
 z0sbrAjWCMUqhcLUWa3Laoth5zxS0iboFHpCp11gAYDLw2fouse/4OHhj1UGfQZAG743
 BoWFm35SKaXBgWkVAmjpHU1uKHzQEiw3YNRZAfWYXEpXqL87r5hHwfoDhAAdVn6OLcPg
 8jRZTkiuxCLf6He9a3be8kVA7qLJAOMQCnwecMrU9ZYkzMVWcjihyYHV0KWoy+3rroY+
 /aJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDfDMf6ComvktY1OtzxXeoMRxNblIAhNIReDq1bxvDK/Z3URty5I7cme147MWfvCMnKhYyoE+oiA==@nongnu.org
X-Gm-Message-State: AOJu0YwX7J3agDOgQnJ/lG14iuJWfUhkfBqXmtF2S252cUdP+bvtYN/G
 2Ou+gF+aZDtbHwjWiITpEl0+7tRO8fjRmD6cfJKCM5dwnjvJ3GzfEsh18RwEWQ==
X-Received: by 2002:a05:6402:2109:b0:5ce:e62e:13bb with SMTP id
 4fb4d7f45d1cf-5cee62e1716mr3095838a12.36.1730820636368; 
 Tue, 05 Nov 2024 07:30:36 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6aae3fcsm1419415a12.21.2024.11.05.07.30.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Nov 2024 07:30:35 -0800 (PST)
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
 qemu-riscv@nongnu.org
Subject: [PATCH v7 00/15] macOS PV Graphics and new vmapple machine type
Date: Tue,  5 Nov 2024 16:30:07 +0100
Message-Id: <20241105153022.91101-1-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::533;
 envelope-from=phil@philjordan.eu; helo=mail-ed1-x533.google.com
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
X-TUID: ofu3VzHDDsHT

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

My part of this work has been sponsored by Sauce Labs Inc.

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

 MAINTAINERS                    |  15 +
 contrib/vmapple/uuid.sh        |   9 +
 docs/system/arm/vmapple.rst    |  60 +++
 docs/system/target-arm.rst     |   1 +
 hw/Kconfig                     |   1 +
 hw/arm/sbsa-ref.c              |   2 +-
 hw/arm/virt.c                  |   2 +-
 hw/block/virtio-blk.c          |  58 ++-
 hw/display/Kconfig             |  13 +
 hw/display/apple-gfx-mmio.m    | 289 +++++++++++
 hw/display/apple-gfx-pci.m     | 155 ++++++
 hw/display/apple-gfx.h         |  77 +++
 hw/display/apple-gfx.m         | 868 +++++++++++++++++++++++++++++++++
 hw/display/meson.build         |   5 +
 hw/display/trace-events        |  30 ++
 hw/i386/microvm.c              |   2 +-
 hw/loongarch/virt.c            |   2 +-
 hw/meson.build                 |   1 +
 hw/mips/loongson3_virt.c       |   2 +-
 hw/misc/Kconfig                |   4 +
 hw/misc/meson.build            |   1 +
 hw/misc/pvpanic-mmio.c         |  61 +++
 hw/openrisc/virt.c             |  12 +-
 hw/pci-host/gpex.c             |  43 +-
 hw/riscv/virt.c                |  12 +-
 hw/vmapple/Kconfig             |  32 ++
 hw/vmapple/aes.c               | 578 ++++++++++++++++++++++
 hw/vmapple/bdif.c              | 261 ++++++++++
 hw/vmapple/cfg.c               | 196 ++++++++
 hw/vmapple/meson.build         |   5 +
 hw/vmapple/trace-events        |  21 +
 hw/vmapple/trace.h             |   1 +
 hw/vmapple/virtio-blk.c        | 226 +++++++++
 hw/vmapple/vmapple.c           | 659 +++++++++++++++++++++++++
 hw/xtensa/virt.c               |   2 +-
 include/hw/misc/pvpanic.h      |   1 +
 include/hw/pci-host/gpex.h     |   7 +-
 include/hw/pci/pci_ids.h       |   1 +
 include/hw/virtio/virtio-blk.h |  11 +-
 include/hw/vmapple/vmapple.h   |  25 +
 include/qemu-main.h            |   3 +-
 include/qemu/cutils.h          |  15 +
 include/qemu/typedefs.h        |   1 +
 meson.build                    |   5 +
 system/main.c                  |  50 +-
 target/arm/hvf/hvf.c           |   9 +
 ui/cocoa.m                     |  54 +-
 ui/sdl2.c                      |   4 +
 util/hexdump.c                 |  18 +
 49 files changed, 3804 insertions(+), 106 deletions(-)
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
2.39.3 (Apple Git-145)

