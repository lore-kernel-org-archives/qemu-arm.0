Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1363688lfu;
        Wed, 27 Apr 2022 16:50:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuQWdiYLB/CVVQOQ1HejnEqP+LJbaoD60ryVoKZdXeUjFOcbSnllB28qlwcA49z227Qe9R
X-Received: by 2002:ac8:7f53:0:b0:2e0:77a0:1d35 with SMTP id g19-20020ac87f53000000b002e077a01d35mr20694485qtk.496.1651103434539;
        Wed, 27 Apr 2022 16:50:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651103434; cv=none;
        d=google.com; s=arc-20160816;
        b=AbIJQ6+/93vcjeDQ1w0O1nNNLTO8LgyrzJJxntiK05vqVzysVZgVaWL3wjGP07rXqM
         g4sugQ5f6/GtUWYsiHq3PS9ZGxtvQBQx8ZQDhbPrlCj3naqtMK8CWIrLHv9zZ0uNuBXi
         rEyY/CoP9giwxOFRlU5gDDIIBv3Qv5f358IuRA3DxC7r3ZdGHvhA5g7JXYVgxKt8vtGc
         eTkGCnD4yuzihMJkdc5rXCjaDpnj3OoWgJtdUt6qzu3tZZ/PSeUX/rq8J8UHZZwA8sGn
         bycFBkwv60ddW14iLJ9oY2VrbIDhHYKFafP9EjvWArAYn7ucfyCwjYK8qeSfnQaPuYLs
         BpyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:wdcironportexception:ironport-sdr:ironport-sdr
         :dkim-signature;
        bh=yWVwF36k1UURFAEd49Dob2SUuHJTV//YmHnagrFczcI=;
        b=Zs/fbINqBu4jh5k5Fo7GjgxDRlnRK8g9aRZIg7iP8Lacsktwgni0AIHNsBe+sBVKwz
         PohkgdgN+sHuba5iqIufsdp3w9cVswmGzv6TVbC4XKxn4K3gQUDwkObj64p1/hHkd002
         prMHRXRlNVygP11EeITZoZ0qBqPbcPAAIpEtEBxfUSkeCLX0mMy855sQ7DbV8YGl7n5X
         FF/zFUKPFzez/oGy5CFrgBIYd94rkPRag4sEybqYTzSurcrHqHHmM9Yh32cf9pJgl6+I
         SRCjWPmfaSh1NADvRskhwBGYsG+P0C973PsjiNMaad8KFp4JNqeV+7TICdrecqb6fKmy
         HxHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@wdc.com header.s=dkim.wdc.com header.b=oOjVBRpt;
       dkim=pass header.i=@opensource.wdc.com header.s=dkim header.b=qhVky5MS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=opensource.wdc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l3-20020a05620a28c300b0069f6b8aa4e3si1122728qkp.449.2022.04.27.16.50.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Apr 2022 16:50:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@wdc.com header.s=dkim.wdc.com header.b=oOjVBRpt;
       dkim=pass header.i=@opensource.wdc.com header.s=dkim header.b=qhVky5MS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=opensource.wdc.com
Received: from localhost ([::1]:38112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njrQY-0006rg-1g
	for alex.bennee@linaro.org; Wed, 27 Apr 2022 19:50:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=109fe075d=alistair.francis@opensource.wdc.com>)
 id 1njrIX-0004vg-Po
 for qemu-arm@nongnu.org; Wed, 27 Apr 2022 19:42:20 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:48842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=109fe075d=alistair.francis@opensource.wdc.com>)
 id 1njrIV-0004WI-8t
 for qemu-arm@nongnu.org; Wed, 27 Apr 2022 19:42:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651102935; x=1682638935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l40sjyCp0l/BFK8+rhXyzxzFyGa7+yrMxywVjzjn3c0=;
 b=oOjVBRptU2EuCrD8WVWoiDKsOrDQ9MkYfNWlXYTBaUgJcW9V6N/wjx5Y
 oBlwbSYGu64UsQ9kTtbWoImpgRcD6EVFJI24h8GDD5+Lpn88rDYU4i/RM
 bH6OG3kit3bWGh53D1mrU0OWabJ9RAbTArtrcm325cJ/YOljcOG1xOzZE
 xNbBchnG6zTPNVlr3n2L/X1s9r9xyRvveLsUJsYQni7H3yRzh+UGb51ta
 F+pvizoeJ8AOquIForNx3e0hBV6srIxDr6qYFrjyA5S2E9o3LEf4G61Yq
 3EDuktl2pYIQlEtuddDMB8Jcbe6fQWn1MLM3l0pHSLTNZoG57p3q0HV3S g==;
X-IronPort-AV: E=Sophos;i="5.90,294,1643644800"; d="scan'208";a="197844547"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Apr 2022 07:42:13 +0800
IronPort-SDR: fuym3voKUTQOPZyfqcs1uVHS1tGsxCoFjo4A3IHA3CU80gbDTfmual89MjwhmAcFAmzN0ySQhI
 lgbmO83cA+Vn1eEjBdqMw7Q2eRHiRKg95Gh6THkEqcp6GulgrzTleqhSbmYwL9v+lquK0UtCKW
 rZbXqeCzz8//ms30DRsA/sRyUdy4kxYa/Kvs8KK/XcKCceGsYkWIr/LBGnw7N/4hnHa0r3iiYZ
 Dqh4SPfTb0LfxA4To4m3Xyr4z89QnYYxwHh8EJ86BzGU7TOmJ6vhdkMkR55oUBLOiZkAr+Fjce
 ikpFnUDA347e/8AJmjLTmcp+
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:12:22 -0700
IronPort-SDR: HseFq1l6Sh1NGJQtKtVFo+Lppc/wivpDFWAWGRdSlETcgO+js/13uZVlwDt4jyd2S6HBx4eruQ
 vyOX0dCqhDYZ1+1szjCTknriFpgam/WT9HUan0IO7w4NLrQUIRps0soVqcVL1E1Y8PVkm7sLC3
 js3lxmwME0zt4sJoLueK9IjDaKPTlODl/m76SysjoxRorfjgyZFGqAy94cGTcDnCPVWqTfhY5c
 c757J7uDrdlyMNquY77WmICo1ghdIN7WZd1iqucU8KvqeyFxAseUI/A89GOCNruUapYzO88KWA
 CdI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:42:13 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KpZzS3pfcz1SVp3
 for <qemu-arm@nongnu.org>; Wed, 27 Apr 2022 16:42:12 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651102931; x=1653694932; bh=l40sjyCp0l/BFK8+rh
 XyzxzFyGa7+yrMxywVjzjn3c0=; b=qhVky5MSkVeCOMD8I9vNFzl7Spz5R+s1Xh
 aWHZ9cz7/GpHPT7nU5EZGeqIr3+Ocsq5p0xQLSVvQLIiPM+FVOavojqSoN6Qxzi6
 r5aH+8HImotWgrz3klMTgvwCSQYbwUT+l4uiSHONsZBu8xWnm5oqP2wkj4TG6S23
 ePfrPFn5wNB+E8KzZ6MjM5Q9ZbWw/RL6Oh98w+nG2SxX86ahddvpYp2/502oPgyZ
 SIRP8WQEPSYdrtIfpZ2bT+a1QfX1zcMJD8lH2iM9LixIwAstp7cUeCpHcu0lajrK
 Ur0voFffn3bQDP33DdDq4lk+CyKsZfXVErZ+wQiMRsa0GaqHp86A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id g7OKIgG25xCf for <qemu-arm@nongnu.org>;
 Wed, 27 Apr 2022 16:42:11 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KpZzN0wFSz1Rvlc;
 Wed, 27 Apr 2022 16:42:07 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, alistair23@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH v5 4/6] hw/riscv: virt: Add support for generating platform
 FDT entries
Date: Thu, 28 Apr 2022 09:41:44 +1000
Message-Id: <20220427234146.1130752-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427234146.1130752-1-alistair.francis@opensource.wdc.com>
References: <20220427234146.1130752-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=109fe075d=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-TUID: sEaSpMKCT47K

From: Alistair Francis <alistair.francis@wdc.com>

Similar to the ARM virt machine add support for adding device tree
entries for dynamically created devices.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/riscv/virt.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 312138e7bf..a2ffd04a78 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -28,6 +28,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/char/serial.h"
 #include "target/riscv/cpu.h"
+#include "hw/core/sysbus-fdt.h"
 #include "hw/riscv/riscv_hart.h"
 #include "hw/riscv/virt.h"
 #include "hw/riscv/boot.h"
@@ -475,6 +476,12 @@ static void create_fdt_socket_plic(RISCVVirtState *s=
,
     riscv_socket_fdt_write_id(mc, mc->fdt, plic_name, socket);
     qemu_fdt_setprop_cell(mc->fdt, plic_name, "phandle",
         plic_phandles[socket]);
+
+    platform_bus_add_all_fdt_nodes(mc->fdt, plic_name,
+                                   memmap[VIRT_PLATFORM_BUS].base,
+                                   memmap[VIRT_PLATFORM_BUS].size,
+                                   VIRT_PLATFORM_BUS_IRQ);
+
     g_free(plic_name);
=20
     g_free(plic_cells);
@@ -552,6 +559,12 @@ static void create_fdt_imsic(RISCVVirtState *s, cons=
t MemMapEntry *memmap,
             IMSIC_MMIO_GROUP_MIN_SHIFT);
     }
     qemu_fdt_setprop_cell(mc->fdt, imsic_name, "phandle", *msi_m_phandle=
);
+
+    platform_bus_add_all_fdt_nodes(mc->fdt, imsic_name,
+                                   memmap[VIRT_PLATFORM_BUS].base,
+                                   memmap[VIRT_PLATFORM_BUS].size,
+                                   VIRT_PLATFORM_BUS_IRQ);
+
     g_free(imsic_name);
=20
     /* S-level IMSIC node */
@@ -689,6 +702,12 @@ static void create_fdt_socket_aplic(RISCVVirtState *=
s,
         VIRT_IRQCHIP_NUM_SOURCES);
     riscv_socket_fdt_write_id(mc, mc->fdt, aplic_name, socket);
     qemu_fdt_setprop_cell(mc->fdt, aplic_name, "phandle", aplic_s_phandl=
e);
+
+    platform_bus_add_all_fdt_nodes(mc->fdt, aplic_name,
+                                   memmap[VIRT_PLATFORM_BUS].base,
+                                   memmap[VIRT_PLATFORM_BUS].size,
+                                   VIRT_PLATFORM_BUS_IRQ);
+
     g_free(aplic_name);
=20
     g_free(aplic_cells);
--=20
2.35.1

