Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A39A606A31A
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Oct 2026 13:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UBIbuNCk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xKFo1-0000mV-1S; Fri, 23 Oct 2026 09:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xKFnw-0000h7-Ek
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 09:59:32 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xKFns-0004nd-8W
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 09:59:31 -0400
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-93efc0452b5so60649685a.0
 for <qemu-arm@nongnu.org>; Fri, 23 Oct 2026 06:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792763967; x=1793368767; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hNSYRG3EQryGgDSjSSfogQ2REZqQlzejpzSjqnuA5HY=;
 b=UBIbuNCksrfiIyxszaKJEmECdBbtzf7GFiOhzkvUGWtgdGlG8/9XapKbElVsCu3KJ3
 obvGHvQ0vXB0wNjMhUgGMeCS38O7iQxL+YdHfrW1WXMpy/ue9HAGiBz05xRMZ1d9pnOw
 Abnh762uPuUThAuAiuFClE+l5dv1xgGTvlaHYshIMvkw06/0z4ZE4IYKcyQF46dWh7NE
 LKYmXwP5KDkdPkEPIFwawFR9z67yIL2+teqQqwehuJlPDh6lfYjP1BLaccPRAHTIk6R0
 6GjLz1GzROSpDpdoWzVQjX8mXfp7OS0UUFXXIOn3ITWy7pjnBFPo+FBaxJAXvEKO3i3R
 d8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792763967; x=1793368767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hNSYRG3EQryGgDSjSSfogQ2REZqQlzejpzSjqnuA5HY=;
 b=VNu1G3xrrYeVMcSomLGQwsSCvDt0ZGCJSsya9691PC+eUOPtUIkPGQectmttuZ4UL3
 tnEtwZ09+e/f9N5IHGnowcE6vORkpB8HRE1btIIaSSi3vBpzU1KF873YvPNREeqwIXTV
 XysAnih+X4LGrTgR5w9OPfqZsQEDsbtpwp8nuBkRZMEjzJQB+cKzhF9aRxe00NWdrdGi
 uPjk1wI54xmmBJMfclNKPiwdCdPC15umNbyr1P+0Cxe2oI3xCBjVP/9VOF4gVATresUZ
 hCrnZVKvysL9U+hQuaK2zbyPdqwMy1yFEc1bLQm8UP7D0Z5QPRrSKHVe0VsXwGNIcK2s
 oGZw==
X-Gm-Message-State: AFq9FYLl9h7EjimjdhJ7+LmiYbFkKqCDeILFeoXOV5uqyTp6LVPcSDdp
 m1j7mFuBXxp7PVzKdc/P2JVx0XwffJsjuOxQ27Y+NffgmB3UOX/EOfW8
X-Gm-Gg: AYBFou2Ge/DnADBl2KXvLn3C4JPLIzJP1xFI8tkHTQd6K0xI0Xad/EBdxCAgZojCxNO
 0YlVIr/o13VD3cSFPecUaRX16NoLYfxKHhb+Vb5ceiYoP9ghB8F+Tw/HmEfajCcB1Dn4v/JkK0j
 qKER0WZVK9OSvLALq5hVUxco3pB0H0NQRpkpSfKg7Y8D/g6sJLae6niIMflk4/18pbml0i6/V4u
 OsM2g4DkkX3ODJPzhKmtGMiptLXPrJrq6YShZI99u5xVoiu3UwSA0sexgE0O/Jyt0wQ2BeyQvPJ
 8C4wqCgSvvMBXCxfvruSj9VhGypOzgM8RrHE7BkvjN5HzpJ3bk330ugxQiO/lIEfhSdA7m0KMnt
 ZvPgGvmwH3JVNhg5TXwxkFCuJL/yRiWOtWjME0XqPaW5quB+tdie8HSjfE4azO11aQ1R5RzWNQ0
 XM4rJaoqtSfn59xMQj49TDMeMn8mr2IG/O2/dIzzsVeaKFK8awYbxzEbn/v1/C3u1MEzaJ2kZBM
 ILVkriKS0ORYO3SxfzBQtHtA/BCblxfMoel1CNPNsKTMwrXSl7jhIOQTlJutHxGB3MbLf2YBkFe
 qBT7KFErzAUysDuNkeL8FOCr7J3ZTP/Suqd5VivGdkTCpSum99e6
X-Received: by 2002:a05:620a:4042:b0:93a:48a:167 with SMTP id
 af79cd13be357-93f6f94e2afmr407899585a.39.1792763966800; 
 Fri, 23 Oct 2026 06:59:26 -0700 (PDT)
Received: from localhost.localdomain ([2606:6d00:159:2900:450e:e72b:156b:33d1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-94047811552sm23741285a.18.2026.10.23.06.59.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 23 Oct 2026 06:59:26 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, philmd@oss.qualcomm.com,
 Marcelo Manzo <marcelomanzo@gmail.com>
Subject: [PATCH v5 00/16] hw/arm/raspi4b: working PCIe and GENET (real
 networking)
Date: Fri, 23 Oct 2026 09:59:08 -0400
Message-ID: <20261023135924.64990-2-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023135924.64990-1-marcelomanzo@gmail.com>
References: <20261023135924.64990-1-marcelomanzo@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=marcelomanzo@gmail.com; helo=mail-qk1-x731.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series gets raspi4b's PCIe root complex and GENET Ethernet
controller working end to end: the PCIe link comes up and devices on
it enumerate, and GENET passes real network traffic (DHCP, SSH, bulk
downloads) under both older (Debian 11, 5.15) and newer (Debian 13,
6.18) guest kernels. Most of the GENET code is Sergey Kambalin's
2024 series (patchwork series 829638), carried forward with his
authorship and Signed-off-by kept.

v5: thanks to Peter for the review of v4.

  - Patch 1: the vmstate describes the PCI device and the AER log in
    the same way as the other PCIe root port models that add state
    of their own (gen_pcie_root_port.c, ioh3420.c,
    xio3130_downstream.c): through the PCIESlot that the root port
    embeds.
  - Patch 2: pass accesses to the EXT_CFG_DATA window to
    pci_host_config_read_common()/pci_host_config_write_common() for
    the function that EXT_CFG_INDEX selects, instead of calling the
    ECAM region's read/write ops; this also means that
    pcie_host_mmcfg_init() is no longer needed, so the call is gone
    and the commit message no longer lists it as a fixed defect (it
    also said "four" for a list of three). Set .impl.max_access_size
    to 8, and replace the comment on the unassigned-address windows,
    which had been copied from gpex.c, with one that only says what
    the code does. On map_irq: only slot 0 exists behind the root
    port, so there is nothing to swizzle; I added a comment saying
    so.
  - Patch 10: return early on an out-of-range access in the write
    handler, and assert that the register offset is a multiple of 4
    in bcm2838_genet_reg().
  - Patch 13: clamp the length of each copy so that it cannot exceed
    what is left of rx_packet[] after the status block, rather than
    relying on the caller's size check.
  - Dropped v4 patch 14 (GENET migration state): migration state for
    the GENET device was not asked for in review, and the points made
    on it (no post_load function is needed, and
    VMSTATE_BUFFER_UNSAFE is not right for registers) mean it would
    have to describe every register field by field. The series
    therefore no longer adds migration state for GENET; the root port
    keeps its vmstate from patch 1.
  - Added Peter's Reviewed-by to patches 10, 11 and 12 (patch 10 now
    includes the two changes he asked for).

v4: thanks to Peter for the review of v3.

  - Patch 1: move the dc->user_creatable rationale comment next to
    the line it explains; add a VMStateDescription for the root port
    (PCI device, AER log and the regs[] array).
  - Patch 2: treat root_port.regs[] as little-endian bytes and access
    it with ldn_le_p()/stn_le_p()/ldl_le_p() instead of memcpy() and
    a uint32_t * overlay. Drop pci_bus_set_route_irq_fn(), its
    callback and the irq_num[] storage that only fed it: INTx routing
    queries come only from VFIO (with KVM irqfds), some x86 code and
    hw/remote, none of which applies to raspi4b.
  - Patch 3: drop the call to the removed set_irq_num() helper.
  - Patch 4: set both min and max access size on impl and valid.
  - Patch 8: BCM2838GenetPhyAuxShdRegs becomes an array of uint16_t
    rather than a struct, as suggested on patch 11.
  - Patch 10: access the register block as host-order uint32_t at the
    register's offset instead of memcpy() of an arbitrary size (the
    HFB filter array becomes uint32_t too, so every register in the
    block is one); do not call qemu_macaddr_default_if_unset() when
    the guest programs a MAC address, just update the NIC info
    string; accept an access that ends exactly at the end of the
    register block.
  - Patch 11: do not call bcm2838_genet_phy_update_link() from the
    MDIO patch; it is only defined by the RX patch, so the series did
    not build at this point. The prototype and the call move to the
    RX patch. Reword the "8 bits" comment and assert that the
    expansion shadow register indexes are in range.
  - Patch 12: check that a TX frame is at least a status block plus
    an Ethernet header, and that a frame's descriptors fit in
    tx_packet[]; check that reading the frame from guest memory
    succeeded; use lduw_be_p()/stw_be_p(); lower-case local names; add
    a helper for building 64-bit values from register halves; drop
    redundant "!= 0" on bools; split the producer-index handling out
    of bcm2838_genet_tdma() to reduce nesting.
  - Patch 13: the same clean-ups as the TX path where they apply;
    replace the comment that described an old bug with one noting
    that we do not implement the hardware's partial RX checksum and
    rely on the guest checking in software.
  - Patch 16: call require_netdev('user') so the test is skipped on
    builds without the user-mode network backend.

Based on master (7e8d3c7fc4). It conflicts trivially (raspi4b.c and
bcm2838_peripherals.[ch]) with the RNG200/thermal series, which is in
target-arm.next; I will rebase once that lands.

Tested: checkpatch.pl reports no errors; every patch builds on its
own; tests/functional/aarch64/test_raspi4.py passes; and unmodified
Raspberry Pi OS Bullseye and Trixie images boot under raspi4b with a
working network (DHCP, ping) and SSH login.

Marcelo Manzo (7):
  hw/arm/bcm2838_pcie: add BCM2838 PCIe Root Complex
  hw/arm/bcm2838_pcie: add BCM2838 PCIe host
  hw/arm/bcm2838: enable BCM2838 PCIe host bridge
  hw/net/bcm2838_genet: add GENET stub device
  hw/arm/bcm2838: enable BCM2838 GENET controller
  docs/system/arm/raspi: move PCIe/GENET from missing to implemented
  tests/functional/aarch64: add raspi4b GENET networking test

Sergey Kambalin (9):
  hw/net/bcm2838_genet: add GENET register structs, part 1/4
  hw/net/bcm2838_genet: add GENET register structs, part 2/4
  hw/net/bcm2838_genet: add GENET register structs, part 3/4
  hw/net/bcm2838_genet: add GENET register structs, part 4/4
  hw/net/bcm2838_genet: add GENET register access macros
  hw/net/bcm2838_genet: implement GENET register ops
  hw/net/bcm2838_genet: implement GENET MDIO
  hw/net/bcm2838_genet: implement GENET TX path
  hw/net/bcm2838_genet: implement GENET RX path

 docs/system/arm/raspi.rst               |    6 +-
 hw/arm/bcm2838.c                        |   13 +
 hw/arm/bcm2838_pcie.c                   |  313 ++++++
 hw/arm/bcm2838_peripherals.c            |   46 +
 hw/arm/meson.build                      |    4 +-
 hw/arm/raspi4b.c                        |    2 -
 hw/arm/trace-events                     |    4 +
 hw/net/bcm2838_genet.c                  | 1162 +++++++++++++++++++++++
 hw/net/meson.build                      |    2 +
 hw/net/trace-events                     |   16 +
 include/hw/arm/bcm2838_pcie.h           |   73 ++
 include/hw/arm/bcm2838_peripherals.h    |    7 +
 include/hw/net/bcm2838_genet.h          |  439 +++++++++
 tests/functional/aarch64/test_raspi4.py |   31 +
 14 files changed, 2113 insertions(+), 5 deletions(-)
 create mode 100644 hw/arm/bcm2838_pcie.c
 create mode 100644 hw/net/bcm2838_genet.c
 create mode 100644 include/hw/arm/bcm2838_pcie.h
 create mode 100644 include/hw/net/bcm2838_genet.h

-- 
2.55.0


