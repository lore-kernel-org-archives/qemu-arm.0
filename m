Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp228498njx;
        Thu, 24 Oct 2024 03:32:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU0BuETRijS6344u6dkjBo/kHe8XNcbIC1UZaOp/MEwyNf+JqdN7cfaL2r/fsH7HZmzjBmSE2jxCkr1yw==@linaro.org
X-Google-Smtp-Source: AGHT+IHgZMcRooPkZBZ4l1hLCpyqr6Yk+r8SpZ3F1KifUOXfPuZVcJyqDpuIz7pedscLSaZMdkeh
X-Received: by 2002:a05:622a:19a5:b0:458:4d0a:608 with SMTP id d75a77b69052e-46125950ed6mr14378471cf.51.1729765928654;
        Thu, 24 Oct 2024 03:32:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729765928; cv=none;
        d=google.com; s=arc-20240605;
        b=bOzzDsP2yoC1q/aSNI4g+LzFvyXlxQqAuT4qoclRBBpjqdpjtkTjEBPo0K55n9ZViS
         R1GDhXqXTB3zBxk5ljVQnmzEKoLCMU/NXAOToMdkRF2lIo1NBcN2P24x9NoA1FOioE0E
         ftrC0BtIu8638to5zc1tpNu2x/uyUs8/p0Ed7Cz9esX2AaTPsWkl06P1qCKXikYrHP9q
         xnVckGgpyb+tcPR/PNId6rSZ+DWX2p9grP8vy3lFicjanY25zaQQqojj5THt1h6KsK4r
         ZffLfnyE+YnVBPMu95dq3zTq9vGCUp306KX9Bya55j2edOlViGYh7daGsw6iao2a1uw4
         8/zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=PPD2MeijQg9aae0XcACDeNwbhvpqmvRYh0QEXh5TIl0=;
        fh=uXai7q4G0XgJJgQYy92YonDb26RRrgDDBa/p+gpIjEk=;
        b=NzFmwaNiYhEBJhTJuawFeXGa/2TVs8jSMlQdubeu83xLhuViKUpJ/XeZlQ5yqd9tIG
         rSetT7HYaEAEAU8m8YRa4G+XbV5MMwQlXh+H1i2jjVlzJdAgCAXEraAGzzAVUqP4Sm4Z
         nREBjtHkAh9N+Vh5ipPZ6NnX9eo/WHD7mQ9gZ7nStII9xAYGNNSOVrA1xaJT/uxRAV8y
         AvcdDH5GWFL5Jl6KmHSw/MXEzxkVw7IONQuzl/yIPy87xDjQ54BHwSmO5iKO0I1BbCj5
         L9mfvO/32tED1wwji1b9BXC2xIOLLmBP1JVCkUp0gDy9My8WuasawiLCi9lz13UtoZJl
         MJFw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=mr6LvGrd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-461252f57b3si11581411cf.657.2024.10.24.03.32.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Oct 2024 03:32:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=mr6LvGrd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t3v51-0000lJ-TD; Thu, 24 Oct 2024 06:28:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t3v4z-0000k9-7G
 for qemu-arm@nongnu.org; Thu, 24 Oct 2024 06:28:33 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t3v4t-00087Y-CE
 for qemu-arm@nongnu.org; Thu, 24 Oct 2024 06:28:32 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5cb6704ff6bso917774a12.3
 for <qemu-arm@nongnu.org>; Thu, 24 Oct 2024 03:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1729765702; x=1730370502;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PPD2MeijQg9aae0XcACDeNwbhvpqmvRYh0QEXh5TIl0=;
 b=mr6LvGrdONrO7ATGiN+MPsnKhEo8cHIX2V63oKV3xuwBO9xhdTF4XFmW3Z7GLE2SFo
 rpRbfMkXE/6IQwQuZ0d6vuzsPp7Z7JMG05KSz7YJALtlmfgh9od91XLMEZT+YVd5pPBm
 r30GpGaSMpijoHqhVkCX06N1bYrOfZUxDdFldILWuFJ7DaA3YLGP5t10yNvfyVj4FSXX
 YH2V62a2B1PBuX1aQULSTLGHw/fh9ox+GLhj814Q+qN4bYrwFp1qzJObXz858LADvAIw
 MNYRrWxNVDTZhKEGnf6iEC9E02WRoLL0oysi9QFcJNmKbpdDtQfD81+fq7icFTkANpph
 IoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729765702; x=1730370502;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PPD2MeijQg9aae0XcACDeNwbhvpqmvRYh0QEXh5TIl0=;
 b=rgmFB71YgUHPa4bHHuQpkLfgeXFTc7KY128DQJRKjNN8KpnflPz3P6p5QC8nqTRLoL
 BTawpwP8snZH3RbTJ9bGJFI8G7A0NgXOiov4wtczEhel4yBreHrdDNGyB6laCtzwOwRF
 DPL+8JnwplhThyXCtO9C3/bg3ZcvRb43uVH4zY+LE/dw8I62ZKTCFHQaxNpRyjnQwjGq
 XWR0KTSRateLjqDaF9i5Vyg6BTOxjAsZpyZH3m87RhJEBHkL1X1xejKmX1hSoSlGIgF6
 T9NzHiiG8EjmTf8ynTlEdPJoH1AID4VLwhwMtLevF/VncvZrZXRb74w+T1/S0lY6w6dK
 uaCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1GbdKNZz6Sp1wd/6hsx42/w85TwUMMmJ2ncqwHm8L91ea0cuwMilkVXDsJxxrMcPFn4XD2DwHrg==@nongnu.org
X-Gm-Message-State: AOJu0YwpYcsGFU3bc9ft1Gobbiy0wl1wb/d79O9yGa3DxtYveJBvYQ0W
 nlMKga6fKAwuPaGPUNKp0cZc+ilpBDl6Ga952veqaIZvyJ4eYAvlBEXewCA3mg==
X-Received: by 2002:a17:907:7fa7:b0:a9a:f84:fefd with SMTP id
 a640c23a62f3a-a9abf8b06b0mr582591766b.36.1729765702353; 
 Thu, 24 Oct 2024 03:28:22 -0700 (PDT)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a913706d3sm601019066b.134.2024.10.24.03.28.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 24 Oct 2024 03:28:21 -0700 (PDT)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, stefanha@redhat.com, mst@redhat.com,
 slp@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v4 00/15] macOS PV Graphics and new vmapple machine type
Date: Thu, 24 Oct 2024 12:27:58 +0200
Message-Id: <20241024102813.9855-1-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::531;
 envelope-from=phil@philjordan.eu; helo=mail-ed1-x531.google.com
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
X-TUID: ystzPIBGzWhJ

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
 docs/system/arm/vmapple.rst    |  63 +++
 docs/system/target-arm.rst     |   1 +
 hw/Kconfig                     |   1 +
 hw/arm/sbsa-ref.c              |   2 +-
 hw/arm/virt.c                  |   2 +-
 hw/block/virtio-blk.c          |  58 +--
 hw/display/Kconfig             |  13 +
 hw/display/apple-gfx-mmio.m    | 292 ++++++++++++
 hw/display/apple-gfx-pci.m     | 159 +++++++
 hw/display/apple-gfx.h         |  70 +++
 hw/display/apple-gfx.m         | 816 +++++++++++++++++++++++++++++++++
 hw/display/meson.build         |   5 +
 hw/display/trace-events        |  28 ++
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
 hw/vmapple/aes.c               | 572 +++++++++++++++++++++++
 hw/vmapple/bdif.c              | 259 +++++++++++
 hw/vmapple/cfg.c               | 197 ++++++++
 hw/vmapple/meson.build         |   5 +
 hw/vmapple/trace-events        |  23 +
 hw/vmapple/trace.h             |   1 +
 hw/vmapple/virtio-blk.c        | 233 ++++++++++
 hw/vmapple/vmapple.c           | 652 ++++++++++++++++++++++++++
 hw/xtensa/virt.c               |   2 +-
 include/hw/misc/pvpanic.h      |   1 +
 include/hw/pci-host/gpex.h     |   7 +-
 include/hw/pci/pci_ids.h       |   1 +
 include/hw/virtio/virtio-blk.h |  11 +-
 include/hw/vmapple/vmapple.h   |  21 +
 include/qemu-main.h            |   3 +-
 include/qemu/cutils.h          |  15 +
 include/qemu/typedefs.h        |   1 +
 include/sysemu/os-posix.h      |   2 +
 include/sysemu/os-win32.h      |   2 +
 include/ui/console.h           |  12 +
 meson.build                    |   5 +
 os-posix.c                     |  20 +
 system/main.c                  |  45 +-
 system/vl.c                    |   2 +
 target/arm/hvf/hvf.c           |   9 +
 ui/cocoa.m                     |  55 +--
 ui/console.c                   |  32 +-
 ui/sdl2.c                      |   2 +
 ui/trace-events                |   1 +
 util/hexdump.c                 |  14 +
 55 files changed, 3790 insertions(+), 112 deletions(-)
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

