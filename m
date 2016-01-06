Received: by 10.182.158.201 with SMTP id ww9csp9730obb;
        Wed, 6 Jan 2016 07:13:26 -0800 (PST)
X-Received: by 10.28.12.9 with SMTP id 9mr11157685wmm.76.1452093206330;
        Wed, 06 Jan 2016 07:13:26 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x22b.google.com (mail-wm0-x22b.google.com. [2a00:1450:400c:c09::22b])
        by mx.google.com with ESMTPS id v80si13111069wmv.94.2016.01.06.07.13.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Jan 2016 07:13:26 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22b as permitted sender) client-ip=2a00:1450:400c:c09::22b;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22b as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x22b.google.com with SMTP id u188so63733418wmu.1
        for <alex.bennee@linaro.org>; Wed, 06 Jan 2016 07:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version:content-type
         :content-transfer-encoding;
        bh=ttUjILUM3RaUK1cIq0gM2tpCSj2bzytWkz0/3vp/pGU=;
        b=I6ws4kDRQD0XTv9eZqmZJmjwre4SUGepWu2HwvCkL51sJYw1Y0xOikbdRtflxvps5A
         AFlmIb1c6r8twKbHz1MkAUYINOVOQmyLXf+Es2rD3oG8F9Uqn5bidUT52zr0he/DBmz9
         CJX77GTUq6seKfuGA15pc2EG638cGatrDt380=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-type:content-transfer-encoding;
        bh=ttUjILUM3RaUK1cIq0gM2tpCSj2bzytWkz0/3vp/pGU=;
        b=Pop6ktDyOhsLCovWeqGTQj4exI1uSDGnsFWQpGXyIHpZfftXPCk8UZPS+jbK3uHCyW
         Vi5sgy2ncxaLPNAWfwY/Zn/JD+euLXJgXAVz0vr5S5og5lU2shiUQlD/RwYs5+i3t3tV
         J0EjutxG5a63+8WiipS+j1myeeuqHjkHx9pfyz7ZSBcyJnJ2pEojLTHej8eVjrhZ1px6
         4gQEU2CHdo7t7zaSB9nvp6J3G2SKo+e3OHUTrP2WJJc1VQfpHwWM0Xs/Lt2BMocDgGjF
         FpSrnW1K0Yr9dsysh8YUMZ1eF/2l90lSD4UFrlAV+VNbxAjN2dwUEvWd0e/vLi+FJeWE
         NJyw==
X-Gm-Message-State: ALoCoQkj/GsnJV1gpuG9j3ujO5zkYMXDsM5tSTlS/sMvEfroELEo8D+CKCYlSsia2hTzkplOjdGV6v8mMYGWNUeAJvLrvzk3JA==
X-Received: by 10.28.187.198 with SMTP id l189mr11230237wmf.89.1452093206002;
        Wed, 06 Jan 2016 07:13:26 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-6.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id df10sm81858826wjb.44.2016.01.06.07.13.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 06 Jan 2016 07:13:24 -0800 (PST)
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
Subject: [PATCH v2 0/7] AMD XGBE KVM platform passthrough
Date: Wed,  6 Jan 2016 15:13:18 +0000
Message-Id: <1452093205-30167-1-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lgylMv8xljOE

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
https://git.linaro.org/people/eric.auger/qemu.git/shortlog/refs/heads/v2.5.0-xgbe-v2

Previous version can be found at
https://git.linaro.org/people/eric.auger/qemu.git/shortlog/refs/heads/v2.5.0-xgbe-v1

HISTORY:
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


Eric Auger (7):
  hw/vfio/platform: amd-xgbe device
  device_tree: introduce load_device_tree_from_sysfs
  device_tree: introduce qemu_fdt_node_path
  device_tree: qemu_fdt_getprop converted to use the error API
  hw/arm/sysbus-fdt: helpers for clock node generation
  hw/arm/sysbus-fdt: enable amd-xgbe dynamic instantiation
  hw/arm/sysbus-fdt: remove qemu_fdt_setprop returned value check

 device_tree.c                   | 148 ++++++++++++++++++-
 hw/arm/sysbus-fdt.c             | 306 ++++++++++++++++++++++++++++++++++++++--
 hw/vfio/Makefile.objs           |   1 +
 hw/vfio/amd-xgbe.c              |  55 ++++++++
 include/hw/vfio/vfio-amd-xgbe.h |  51 +++++++
 include/sysemu/device_tree.h    |  32 ++++-
 6 files changed, 577 insertions(+), 16 deletions(-)
 create mode 100644 hw/vfio/amd-xgbe.c
 create mode 100644 include/hw/vfio/vfio-amd-xgbe.h

-- 
1.9.1
