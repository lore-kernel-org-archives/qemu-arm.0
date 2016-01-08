Received: by 10.25.134.130 with SMTP id i124csp325815lfd;
        Fri, 8 Jan 2016 01:32:13 -0800 (PST)
X-Received: by 10.194.243.6 with SMTP id wu6mr116500877wjc.14.1452245533327;
        Fri, 08 Jan 2016 01:32:13 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x230.google.com (mail-wm0-x230.google.com. [2a00:1450:400c:c09::230])
        by mx.google.com with ESMTPS id o125si26370438wma.42.2016.01.08.01.32.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Jan 2016 01:32:13 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::230 as permitted sender) client-ip=2a00:1450:400c:c09::230;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::230 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x230.google.com with SMTP id f206so128682443wmf.0
        for <alex.bennee@linaro.org>; Fri, 08 Jan 2016 01:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version:content-type
         :content-transfer-encoding;
        bh=rwgaQ90RAJuu9N0XRqtnk5b1tr2vdw1XEtxmC1Mje8E=;
        b=BRPBaVGGQnzL4+wxkuS4nndoP1FQ8MHg/tjYZFLECawkYLoSIU8HTJgeoPMHZJeiRf
         DORZFHovfatORcTicY7TuQEgTcp6bFNeUkP0e/mkMSsCEuTeYnQLSIuvZRPer2sT05Lt
         tzoJlcKiNTW+ANCfeY8Mb6CKKLfdj8pQF328k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-type:content-transfer-encoding;
        bh=rwgaQ90RAJuu9N0XRqtnk5b1tr2vdw1XEtxmC1Mje8E=;
        b=M2WEh/yYpIP8o1MvmSkODmvkm3hk0P/n15Gbbpm3l+s8Yb6GzWfVC6uT1EDGsZli75
         HozZqrJPl0s+OUE5VGny3Upn1Cj+CcKGdvzVtmTksj1TjsPXLPIrjITfkWRU7HYQyp/3
         hnh0LU6YFQiulTrQyeTWVcmoWud0oj5IX2TN0iMqe5u0cRZiPv3nPW6GUvRIqnCjtKq2
         LLn8WkLX4PGkTt9abmUKXZ/c0GULAi4vzNTMOIhKMonVtrDVK77DOIYYEEd4nJa0O297
         ztGXtP1fYuGVV3Xp49E9Ydoaq1j+VzU2St5zOU0H+axlrhkgXJY+5ZMZ6Pxa/fn1FNmy
         U/5A==
X-Gm-Message-State: ALoCoQkTC9ilMMF3JzeaUuahMUbR7lXTKFSzZ80xRxZeO3/6Jdkq/OXKdxEiHzkCQX5tD2wLzOZ4fOMhKU++Cj92P7gFYXKQ3A==
X-Received: by 10.28.212.85 with SMTP id l82mr20623266wmg.11.1452245532950;
        Fri, 08 Jan 2016 01:32:12 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-8.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id av8sm30226968wjc.13.2016.01.08.01.32.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 08 Jan 2016 01:32:11 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com,
	eric.auger@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	david@gibson.dropbear.id.au,
	alex.williamson@redhat.com
Cc: alex.bennee@linaro.org,
	thuth@redhat.com,
	crosthwaitepeter@gmail.com,
	patches@linaro.org,
	christoffer.dall@linaro.org,
	pbonzini@redhat.com,
	b.reynal@virtualopensystems.com,
	suravee.suthikulpanit@amd.com,
	thomas.lendacky@amd.com
Subject: [PATCH v4 0/8] AMD XGBE KVM platform passthrough
Date: Fri,  8 Jan 2016 09:31:57 +0000
Message-Id: <1452245525-3886-1-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: eceXudxw17z2

This series allows to set up AMD XGBE passthrough. This was tested on AMD
Seattle.

The first upstreamed device supporting KVM platform passthrough was the
Calxeda Midway XGMAC. Compared to this latter, the XGBE XGMAC exposes a
much more complex device tree node.

- First There are 2 device tree node formats:
one where XGBE and PHY are described in separate nodes and another one
that combines both description in a single node (only supported by 4.2
onwards kernels). Only the combined description is supported for passthrough,
meaning the host must be >= 4.2 and must feature a device tree with a combined
description. The guest will also be exposed with a combined description,
meaning only >= 4.2 guest are supported. It is not planned to support
separate node representation since assignment of the PHY is less
straigtforward.

- the XGMAC/PHY node depends on 2 clock nodes (DMA and PTP).
The code checks those clocks are fixed to make sure they cannot be
switched off at some point after the native driver gets unbound.

- there are many property values to populate on guest side. Most of them
cannot be hardcoded. That series implements host device tree blob extraction
from the host /proc/device-tree (inspired from dtc implementation)
and retrieve host property values to populate guest dtb.

- the case where the host uses ACPI is not yet covered since there is
  no usable ACPI description for this HW yet.

The patches can be found at
https://git.linaro.org/people/eric.auger/qemu.git/shortlog/refs/heads/v2.5.0-xgbe-v4

Previous versions can be found at
https://git.linaro.org/people/eric.auger/qemu.git/shortlog/refs/heads/v2.5.0-xgbe-v<n>

HISTORY:
v3 -> v4:
- explicitly return 0 in node creation functions

v2 -> v3:
- added "device_tree: qemu_fdt_getprop_cell converted to use the error API"

v1 -> v2:
- take into account Peter's comments:
  - add CONFIG_LINUX protection
  - improve error handling and messages
  - no fixed size buffer anymore
  - fix read_fstree error handling
- use /proc/device-tree symlink instead of /sys/firmware/devicetree/base
- added hw/arm/sysbus-fdt: remove qemu_fdt_setprop returned value check
- see individual commits for full details

RFC -> v1:
- no dependency anymore on dtc binary: load_device_tree_from_sysfs is
  self-contained and implements something similar to dtc read_fstree.
- take into account Alex' comments
- remove qemu_fdt_getprop_optional and use error API instead

Best Regards

Eric


Eric Auger (8):
  hw/vfio/platform: amd-xgbe device
  device_tree: introduce load_device_tree_from_sysfs
  device_tree: introduce qemu_fdt_node_path
  device_tree: qemu_fdt_getprop converted to use the error API
  device_tree: qemu_fdt_getprop_cell converted to use the error API
  hw/arm/sysbus-fdt: helpers for clock node generation
  hw/arm/sysbus-fdt: enable amd-xgbe dynamic instantiation
  hw/arm/sysbus-fdt: remove qemu_fdt_setprop returned value check

 device_tree.c                   | 165 +++++++++++++++++++--
 hw/arm/boot.c                   |   6 +-
 hw/arm/sysbus-fdt.c             | 312 ++++++++++++++++++++++++++++++++++++++--
 hw/arm/vexpress.c               |   6 +-
 hw/vfio/Makefile.objs           |   1 +
 hw/vfio/amd-xgbe.c              |  55 +++++++
 include/hw/vfio/vfio-amd-xgbe.h |  51 +++++++
 include/sysemu/device_tree.h    |  48 ++++++-
 8 files changed, 616 insertions(+), 28 deletions(-)
 create mode 100644 hw/vfio/amd-xgbe.c
 create mode 100644 include/hw/vfio/vfio-amd-xgbe.h

-- 
1.9.1
