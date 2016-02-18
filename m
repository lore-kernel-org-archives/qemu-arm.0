Received: by 10.25.208.211 with SMTP id h202csp736842lfg;
        Thu, 18 Feb 2016 09:45:54 -0800 (PST)
X-Received: by 10.194.48.7 with SMTP id h7mr10015506wjn.81.1455817554416;
        Thu, 18 Feb 2016 09:45:54 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x22d.google.com (mail-wm0-x22d.google.com. [2a00:1450:400c:c09::22d])
        by mx.google.com with ESMTPS id l3si11905711wjf.0.2016.02.18.09.45.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Feb 2016 09:45:54 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22d as permitted sender) client-ip=2a00:1450:400c:c09::22d;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::22d as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x22d.google.com with SMTP id b205so35908481wmb.1
        for <alex.bennee@linaro.org>; Thu, 18 Feb 2016 09:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version:content-type
         :content-transfer-encoding;
        bh=fIbJ1S/XRNvCcqqeo6aCvsehtHUoPGRKUJ+NDg5Ktg4=;
        b=MEHFIyHQFGAK9N2iQAV1HwuAV1oooB/7isyLK/F+EcH6vNlCfsLCAH2622Cemk3CDl
         uVwajv56zzWi4m6KUbXLprdK0YtSvdF9aZK6tucr9ZZYZi6oj/jxh7UT2/L4ZWHj1fiU
         cdzkImlAZ2jZ+vOQZaDnsNIYwT0FxeGsJ2A18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-type:content-transfer-encoding;
        bh=fIbJ1S/XRNvCcqqeo6aCvsehtHUoPGRKUJ+NDg5Ktg4=;
        b=e2D1+3w76E9Inx0vN7FWIMNGK04JKDQ0rpjsIcKpn+hPW6tUbj4CfwyDGLTShlsVmn
         8Weh+BeBDDGovdy4VoN9NLwtl3uWqUsm9qHqU9jmYJi2jMscoF51e0hygO/w/TF07CCt
         i7dkRNbryrNLhocnSvmYTFF9J9NqcZ3ziANRWPYaFvYm2rS2upeiC3mW2YDJsoKtwfxN
         dCCmhUONL4sb6j1wDgXVd1u3zwu+gvRp8AhWWANRbiuAwUrab09mw86e6khYUHIvviAa
         wJbN9twZsCgtgwTKTHh2UAW5i7M4qygRrWxu2YC/W1AJtoRFz6F1rDmUxIohx5/HToRm
         4JPQ==
X-Gm-Message-State: AG10YOTswCM8c2PMwqwcCbWOOW83MPkmltQ7/zGJ4bdt4Xs5ZBKRSKgcRp+odL+h4F2S84TJX0s=
X-Received: by 10.194.61.19 with SMTP id l19mr8784994wjr.148.1455817554148;
        Thu, 18 Feb 2016 09:45:54 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from midway01-04-00.lavalab ([81.128.185.50])
        by smtp.gmail.com with ESMTPSA id ct2sm7592997wjb.46.2016.02.18.09.45.51
        (version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 09:45:52 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com,
	eric.auger@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.williamson@redhat.com,
	david@gibson.dropbear.id.au
Cc: christoffer.dall@linaro.org,
	suravee.suthikulpanit@amd.com,
	alex.bennee@linaro.org,
	thuth@redhat.com,
	crosthwaitepeter@gmail.com,
	patches@linaro.org,
	pbonzini@redhat.com,
	b.reynal@virtualopensystems.com,
	thomas.lendacky@amd.com
Subject: [PATCH v7 0/8] AMD XGBE KVM platform passthrough
Date: Thu, 18 Feb 2016 17:45:38 +0000
Message-Id: <1455817546-6564-1-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: eovtE6AVETQk

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
https://git.linaro.org/people/eric.auger/qemu.git/shortlog/refs/heads/v2.5.0-xgbe-v7

Previous versions can be found at
https://git.linaro.org/people/eric.auger/qemu.git/shortlog/refs/heads/v2.5.0-xgbe-v<n>

HISTORY:

v6 -> v7:
- rebase on "all: Clean up include"
- add Peter's Reviewed-by

v5 -> v6:
- main functional modification is in qemu_fdt_node_path where I
  free all allocated resources in case of blob parsing failure and return
  NULL
- fix error handling in sysfs_to_dt_name and take into account possible
  NULL returned value from qemu_fdt_node_path
- remove any reference to self-asserts
- fix style/spelling issues reported by Peter
- add Peter's R-b on "hw/arm/sysbus-fdt: helpers for clock node generation"

v4 -> v5:
- add Peter's R-b on qemu_fdt_getprop patches + remove comment on
  error_fatal
- renamed inherit_properties* into copied_properties
- qemu_fdt_node_path now returns a char **: it supports the case where
  several nodes match the name/compat
- add_amd_xgbe_fdt_node now checks a single node is found

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

 device_tree.c                   | 179 ++++++++++++++++++++--
 hw/arm/boot.c                   |   6 +-
 hw/arm/sysbus-fdt.c             | 319 ++++++++++++++++++++++++++++++++++++++--
 hw/arm/vexpress.c               |   6 +-
 hw/vfio/Makefile.objs           |   1 +
 hw/vfio/amd-xgbe.c              |  55 +++++++
 include/hw/vfio/vfio-amd-xgbe.h |  51 +++++++
 include/sysemu/device_tree.h    |  53 ++++++-
 8 files changed, 641 insertions(+), 29 deletions(-)
 create mode 100644 hw/vfio/amd-xgbe.c
 create mode 100644 include/hw/vfio/vfio-amd-xgbe.h

-- 
1.8.3.2
