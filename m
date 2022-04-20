Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2899309lfk;
        Tue, 19 Apr 2022 22:57:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx30p3C2ZUyVayGkvnzZusB38JEsThaGugdFlLjo+gxvU0VD5vE8jlu9zTJH0j+YWzmoMLa
X-Received: by 2002:ad4:54a1:0:b0:444:3e92:4de3 with SMTP id r1-20020ad454a1000000b004443e924de3mr14223888qvy.131.1650434278877;
        Tue, 19 Apr 2022 22:57:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650434278; cv=none;
        d=google.com; s=arc-20160816;
        b=IUCv4Pz1Vpe1y7mfBuJMLFZ1j3CE8itWUVw8e/4T8kyHZm8zKJ9Bu5Aj9+TJkU8E2A
         BBKZRf1lCI56rEgp2epYUd50pq3UgkUujef78UUCaCFVd0z8uGmcNn1KsqltKZLwdffF
         MXnTNYH92pUDSixlVtnBS7JNYIitsOYSpG7r5wCckagIlDEhhaZaAGu161pQzzIGhDr6
         BpEoxkUNi451O8uXp1xFEvnrQrdHgjrjYMEK6hQoKC0GeARpxzfgeaoA8GDOiZo3GO2D
         h82LFc61xrFzX+UtYVqOwYuYEZyAaQgMxdk8bEGT2ZJxYBJL144yd8Eab9T+ZamCieTV
         nsng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:wdcironportexception:ironport-sdr:ironport-sdr
         :dkim-signature;
        bh=5xYe3EUBQx680UUNJzffwn76KF90uVCkMGOpDcAYemk=;
        b=PNf4ytxSf/D6YPli2Cdj8UheQifMYDOBCZWKi17pX17W2JfXZe80KFqwqD/oTEd44B
         p/dQJM4/QW31o0W0KdZ/wmPdZre7V7xbg61g5ZKPfxtdMF/gqxoGtKSWbK9vOaCKJXmW
         D6i9OJgKuYDnHGy/EVPaF5Y+zmlhBN6NQV++iEL6WoFAUvQqPl6zm92i14D3AhoprMRP
         yj/BCY8ny+F7PR1hJLHrnalcOzB1rgkwW10XROH5VR/Xx/EtAXiE7OdxWB4YJ9+ZK/2u
         o3exC3ombATX+yWYkEQWu970lOb0C1H8W3ob2HwtTrRAGttzgfbwA1aWkEFUbpqoJhCP
         +LCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@wdc.com header.s=dkim.wdc.com header.b=cKKspqsM;
       dkim=pass header.i=@opensource.wdc.com header.s=dkim header.b=QDWX1ErG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=opensource.wdc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p1-20020a378d01000000b0069eaaebd339si260453qkd.495.2022.04.19.22.57.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Apr 2022 22:57:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@wdc.com header.s=dkim.wdc.com header.b=cKKspqsM;
       dkim=pass header.i=@opensource.wdc.com header.s=dkim header.b=QDWX1ErG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=opensource.wdc.com
Received: from localhost ([::1]:40028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nh3Li-0002R6-CL
	for alex.bennee@linaro.org; Wed, 20 Apr 2022 01:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1021dae20=alistair.francis@opensource.wdc.com>)
 id 1nh3H7-0007wU-2w
 for qemu-arm@nongnu.org; Wed, 20 Apr 2022 01:53:13 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:55176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1021dae20=alistair.francis@opensource.wdc.com>)
 id 1nh3H5-0004RT-Bs
 for qemu-arm@nongnu.org; Wed, 20 Apr 2022 01:53:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650433991; x=1681969991;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MDWFWDRchKuYdI+t20XFRd6iszdOc+o4yz5MgNB95Fg=;
 b=cKKspqsMZztGz7VYNkORna57JoCfEe2bjAEoRViTgY6ZIoZs95dPfDjz
 sz/68PFR86jTqTX9e1ADrrSsFwBVEVDHlgwtHnvIQg5//sPl7cEIe35He
 WwY8Xm+Jcz27t1ZqAf1BVdAO51rOjixzf1xj26Y9KZ0K4PazHeuoXHIRD
 Suy6IXSv/E6UjL9phCiDy+9E77qpKUJP+7My7a663g2uis1U4LTqUovO9
 3I1EdtosZGwsVr/Lus11swQKgfm2LY+7pzR3yfE87sTPLU/GyVq4nAY+a
 2eRGOEI57mGd3rWvFWnjGTs3SdKNT77TbLIDQZxs2OfPYC9sohjpMxP8p w==;
X-IronPort-AV: E=Sophos;i="5.90,274,1643644800"; d="scan'208";a="302527751"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Apr 2022 13:53:08 +0800
IronPort-SDR: BKlaDJTQb+FDKn1MHIkZi5yv6aLr0kUlZdfIYv+USFxKMows1cvK1RFbGE8TJRUBUh48Gqt39D
 g0A6OTTM8k9I7RjKzmO1SjdFHHrNAmjN1J3y5Ekny+G/jYvSOszS3tzcNkauZR0656EWqE7SRq
 xbFovVGpmGTg3go/+97oPivtcvlXq468fd8TFNP/6r22oIJtZ5U8xZcdvMqTwhlD5mtV0YinCd
 CylRTCZvDP2dEnbfoO9wRAKtaENin9d0UgKEbw5zyKLkbp1Ug6Vj/xw/hXyMtEQfgy7bSBjCCa
 r6cyUWRpuOoc+pu5tMcaJZCb
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 22:23:27 -0700
IronPort-SDR: +EcJdJEZ1tCitsUfP/UATLfsQgCO48Sc833HXXfuLfCH43zmLAm2Mrc7hQjb6F/9i7GCpGETDh
 ZK884dE5gSUSH6QalzF1MF2W01YTsfhBACvoHWfH+DAuy4aXIz0zp2UtiDQFjjUl27SzsiVcm0
 +V+jCiDj+cXzb9mxP4FtQZz6+AaD66jvb8KRbC605R/HBtk1TFIxDnIAXIooYhLsncrWhdO3pl
 5Kh1oeud/XMsPe9hJkSUobK/6srGaSfGLD9P0ChjSF1CaUWi7MncL6SudJhi4jawLmP0stD126
 H3Y=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 22:53:09 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Kjqb82pRHz1SVp6
 for <qemu-arm@nongnu.org>; Tue, 19 Apr 2022 22:53:08 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650433987; x=1653025988; bh=MDWFWDRchKuYdI+t20
 XFRd6iszdOc+o4yz5MgNB95Fg=; b=QDWX1ErG+3VH3ItPU+6izieqKcQ7qdOfb4
 PKTgsNpYjReLUVeZBL0pNQPEOXngG3x1oc+0yY29m5lrmg49Bq7zljQsWFIYkZd4
 LxHQjjFYsE2cUrtFwCgx9A25IkDM8vZYewAXfhHvG3BTk6zWfdt9c1SlBgrFQ9Gs
 IzNLkjJZqFooG9AcSAHXY/rUj73HPze0ggwnOY8L+j7MJCBvYuDNg6h2qIeO+neQ
 fYbNC55Ssd02VsoYCM7+G7vjrgsVvqEujS4wgUSqOvUWuIWEpS3moITX/SYA2ngD
 zXF3ctX3d7dQ27Gmlba6mD/RbkllYZtXGE8bVLTK4PrckDyeLRcw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ShNQKkRA1TOb for <qemu-arm@nongnu.org>;
 Tue, 19 Apr 2022 22:53:07 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Kjqb26s2cz1Rvlx;
 Tue, 19 Apr 2022 22:53:02 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair@alistair23.me>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, bmeng.cn@gmail.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v4 2/6] hw/core: Move the ARM sysbus-fdt to core
Date: Wed, 20 Apr 2022 15:52:44 +1000
Message-Id: <20220420055248.960491-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
References: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1021dae20=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SJtpreLGxj87

From: Alistair Francis <alistair.francis@wdc.com>

The ARM virt machine currently uses sysbus-fdt to create device tree
entries for dynamically created MMIO devices.

The RISC-V virt machine can also benefit from this, so move the code to
the core directory.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 include/hw/{arm =3D> core}/sysbus-fdt.h | 0
 hw/arm/virt.c                         | 2 +-
 hw/arm/xlnx-versal-virt.c             | 1 -
 hw/{arm =3D> core}/sysbus-fdt.c         | 2 +-
 hw/arm/meson.build                    | 1 -
 hw/core/meson.build                   | 1 +
 6 files changed, 3 insertions(+), 4 deletions(-)
 rename include/hw/{arm =3D> core}/sysbus-fdt.h (100%)
 rename hw/{arm =3D> core}/sysbus-fdt.c (99%)

diff --git a/include/hw/arm/sysbus-fdt.h b/include/hw/core/sysbus-fdt.h
similarity index 100%
rename from include/hw/arm/sysbus-fdt.h
rename to include/hw/core/sysbus-fdt.h
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d2e5ecd234..cfababa292 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -56,7 +56,7 @@
 #include "qemu/module.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/virtio/virtio-pci.h"
-#include "hw/arm/sysbus-fdt.h"
+#include "hw/core/sysbus-fdt.h"
 #include "hw/platform-bus.h"
 #include "hw/qdev-properties.h"
 #include "hw/arm/fdt.h"
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 7c7baff8b7..bc20af4ba8 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -15,7 +15,6 @@
 #include "sysemu/device_tree.h"
 #include "hw/boards.h"
 #include "hw/sysbus.h"
-#include "hw/arm/sysbus-fdt.h"
 #include "hw/arm/fdt.h"
 #include "cpu.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/arm/sysbus-fdt.c b/hw/core/sysbus-fdt.c
similarity index 99%
rename from hw/arm/sysbus-fdt.c
rename to hw/core/sysbus-fdt.c
index 48c5fe9bf1..19d22cbe73 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/core/sysbus-fdt.c
@@ -27,7 +27,7 @@
 #ifdef CONFIG_LINUX
 #include <linux/vfio.h>
 #endif
-#include "hw/arm/sysbus-fdt.h"
+#include "hw/core/sysbus-fdt.h"
 #include "qemu/error-report.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/tpm.h"
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 721a8eb8be..122e5dd992 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -1,6 +1,5 @@
 arm_ss =3D ss.source_set()
 arm_ss.add(files('boot.c'), fdt)
-arm_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('sysbus-fdt.c'))
 arm_ss.add(when: 'CONFIG_ARM_VIRT', if_true: files('virt.c'))
 arm_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
 arm_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
diff --git a/hw/core/meson.build b/hw/core/meson.build
index 0f884d6fd4..7a4d02b6c0 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -33,6 +33,7 @@ softmmu_ss.add(when: 'CONFIG_PTIMER', if_true: files('p=
timer.c'))
 softmmu_ss.add(when: 'CONFIG_REGISTER', if_true: files('register.c'))
 softmmu_ss.add(when: 'CONFIG_SPLIT_IRQ', if_true: files('split-irq.c'))
 softmmu_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))
+softmmu_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('sysbus-fdt.c=
'))
=20
 softmmu_ss.add(files(
   'cpu-sysemu.c',
--=20
2.35.1

