Received: by 10.182.158.201 with SMTP id ww9csp2022617obb;
        Thu, 19 Nov 2015 07:25:50 -0800 (PST)
X-Received: by 10.13.231.199 with SMTP id q190mr7607144ywe.273.1447946750927;
        Thu, 19 Nov 2015 07:25:50 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z6si6158792ywf.197.2015.11.19.07.25.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Nov 2015 07:25:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:42435 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZzR5q-0000q4-F0
	for alex.bennee@linaro.org; Thu, 19 Nov 2015 10:25:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33399)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1ZzR2R-0003J3-Fs
	for qemu-devel@nongnu.org; Thu, 19 Nov 2015 10:22:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1ZzR2O-0000gs-5C
	for qemu-devel@nongnu.org; Thu, 19 Nov 2015 10:22:19 -0500
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:35041)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1ZzR2N-0000ga-UX
	for qemu-devel@nongnu.org; Thu, 19 Nov 2015 10:22:16 -0500
Received: by wmdw130 with SMTP id w130so244786106wmd.0
	for <qemu-devel@nongnu.org>; Thu, 19 Nov 2015 07:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=/9CMAVc37pBtRQVwKEwKbLeOBi188fRTfxZFmLdKwDM=;
	b=fdVYHL5abTN0BacMWOBMmvULMoQs9cXUMFG2KtvqhYTagxpKs6Z7hGy46Il3aWjuWz
	6J3OQ1LI8q+ZZkcICcN2NxGAt0dVXIfG0iPbV/pqHxQ9gh9g1Hc1OLDF0G+ZXkRzf/tv
	2HW+g5Aarp0kUPGMjTcreLBXDcKr1qaZ3eVEw5KiBFcKxNXQCc8ZTiK01qxt7D1uUkFO
	mDfR5q7JO38PtK6pdi8ickQ5fr48UqYfR7zfsPcU3rFKBMBzhAYQHHOs8Omkxu8RMGu4
	3QfNkTLz4vbAePITGgJrjXbDh9usnX4PUEoNg6dRP0K3Z+7YdXayioOuhCWtbQ22eCP4
	TC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/9CMAVc37pBtRQVwKEwKbLeOBi188fRTfxZFmLdKwDM=;
	b=W7lGcUxejRJi3kvDDEuj5a9K9XCLfaGDJig6jk0irtTetAbgarzW6qWsjsWTHYJJCA
	YOv9TX9jxqhce8gCFUpDPLggoHZwYGT10aYGfGYuZWiIv+zW+iSd/zEZn5p62Qea1omW
	nP4PiaASW2RoEkKV66BHEOgjnBGVI4nQgtqW6cddk4EdSBf/8tfTAkRet+/WhaDn/vgA
	DfGJW0aqA8hABY86gEHa+EraB4btxn8AZwqBKyKRSWyL1QRDyFDxIBtlz2lv4F1O9MBj
	qAnSUNFWhpXI5TJIIILY0yFc/RQKkVYW7ktyEfeMtiMyKuglOlhZHb983V9SIP6hFxrC
	Qa7Q==
X-Gm-Message-State: ALoCoQkXlPP1Jz/WlbHbIHHy96wZLNcUM4QDyAkQDJu+eMFMjAaJoD+hdHRkQ7iuSRIvg/GvJj86
X-Received: by 10.28.11.71 with SMTP id 68mr11894084wml.77.1447946534873;
	Thu, 19 Nov 2015 07:22:14 -0800 (PST)
Received: from midway01-04-00.lavalab ([81.128.185.50])
	by smtp.gmail.com with ESMTPSA id
	vr10sm8367221wjc.38.2015.11.19.07.22.13
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Nov 2015 07:22:13 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com, eric.auger@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, alex.williamson@redhat.com, peter.maydell@linaro.org
Date: Thu, 19 Nov 2015 15:22:02 +0000
Message-Id: <1447946528-1533-1-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.8.3.2
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::235
Cc: thomas.lendacky@amd.com, b.reynal@virtualopensystems.com,
	patches@linaro.org, suravee.suthikulpanit@amd.com,
	pbonzini@redhat.com, christoffer.dall@linaro.org
Subject: [Qemu-devel] [RESEND RFC 0/6] AMD XGBE KVM platform passthrough
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qyRR6dkQx8sJ

I am resending this RFC from Oct 12, after kernel 4.4-rc1 and
QEMU 2.5-rc1, hoping things have calmed down a little bit.

This RFC allows to set up AMD XGBE passthrough. This was tested on AMD
Seattle.

The first upstreamed device supporting KVM platform passthrough was the
Calxeda Midway XGMAC. Compared to this latter, the XGBE XGMAC exposes a
much more complex device tree node. Generating the device tree node for
the guest is the challenging and controversary part of this series.

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
cannot be hardcoded. That series proposes a way to parse the host device
tree blob and retrieve host values to feed guest representation. Current
approach relies on dtc binary availability plus libfdt usage.
Other alternatives were discussed in:
http://www.spinics.net/lists/kvm-arm/msg16648.html.

- Currently host booted with ACPI is not supported.

The patches can be found at
https://git.linaro.org/people/eric.auger/qemu.git/shortlog/refs/heads/v2.4.0-xgbe-rfc

Best Regards

Eric


Eric Auger (6):
  hw/vfio/platform: amd-xgbe device
  device_tree: introduce load_device_tree_from_sysfs
  device_tree: introduce qemu_fdt_node_path
  device_tree: introduce qemu_fdt_getprop_optional
  hw/arm/sysbus-fdt: helpers for clock node generation
  hw/arm/sysbus-fdt: enable amd-xgbe dynamic instantiation

 device_tree.c                   |  97 ++++++++++++++
 hw/arm/sysbus-fdt.c             | 273 ++++++++++++++++++++++++++++++++++++++++
 hw/vfio/Makefile.objs           |   1 +
 hw/vfio/amd-xgbe.c              |  55 ++++++++
 include/hw/vfio/vfio-amd-xgbe.h |  51 ++++++++
 include/sysemu/device_tree.h    |   6 +
 6 files changed, 483 insertions(+)
 create mode 100644 hw/vfio/amd-xgbe.c
 create mode 100644 include/hw/vfio/vfio-amd-xgbe.h

-- 
1.8.3.2

