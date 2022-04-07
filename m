Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp1143013lfu;
        Wed, 6 Apr 2022 19:09:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAIAZyBTkp3hERquouN+8TY9dZfoXpyGN51j0UE0MS/MMefx6J+Yi8bl5B43gaa9j2Sjl3
X-Received: by 2002:a05:6214:4011:b0:443:e253:61fc with SMTP id kd17-20020a056214401100b00443e25361fcmr9516088qvb.110.1649297365293;
        Wed, 06 Apr 2022 19:09:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649297365; cv=none;
        d=google.com; s=arc-20160816;
        b=vW4VNowy2uGsqBRZ8Kykn30rgGXmwYUlY6gKTMd4txybK/DdBFFEaTz5s3Jaleat58
         N+pa3YaLP87ZxJG9rrc8iKkmhjcxfGDQsR4E0xXC8pTMFh9eFOxFl3JrhPxn5etrSm35
         RTj3qwu5wkTi1zdM9LiRkAgwsjyqlV3+Jc7IvKqnkm6aLPDoZcrXqAm9YjPo/3mt2qsN
         Mpo2xZcUlmptlJen3zuQOF1c5B+r9gcohG47eGtE4XsgGIBRWpcgoMujh3yE6qGfBCZ2
         a0xn+do2NU1mPQe/Y43LNVkVxWHpO7th9j/6zONsAS2yy+76R/mmnLtQxu3f+vVbaPeL
         D7qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:wdcironportexception:ironport-sdr:ironport-sdr
         :dkim-signature;
        bh=mxgKIqqx4reJ9NRguoBmwsLx2sGaHar0VPBFwFCEGVY=;
        b=0rldbQxxCZPTjIvHoCkwUZHL6By+n60slsYy5+ldNjOOcQkgDyfFm1qzXjiNEwBpFi
         3+njfrUkhntEwgqoiZOJokANAfgm3nxNq07ZN2SzoQdYnZq8Cps5KuLpe7o1rAAQCQy2
         rctr+GzCmDkiBPP3ZGl/FX5Narsh+XczCQ5ktug4Y27rxfSM2nlzIKVbteFrdPeF5wcA
         NwU0MoXZhbneHu9/3SU34wbG/ZBdlxEopKJL0zAHKXblQb88hORLy2/MovHzsSTcPKGK
         hHhG6Drp0nD2TjbXu1+Sgq8+K1OzlGV3deH7oxZ8arq+P/YTMtVawnFroUzh8PmqKoPU
         d8/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@wdc.com header.s=dkim.wdc.com header.b=TaHjfZC9;
       dkim=pass header.i=@opensource.wdc.com header.s=dkim header.b=fuxKffGP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=opensource.wdc.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13-20020ac84d4d000000b002e1fbf3c0basi6245860qtv.683.2022.04.06.19.09.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Apr 2022 19:09:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@wdc.com header.s=dkim.wdc.com header.b=TaHjfZC9;
       dkim=pass header.i=@opensource.wdc.com header.s=dkim header.b=fuxKffGP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=opensource.wdc.com
Received: from localhost ([::1]:47244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncHaO-0004LY-Ob
	for alex.bennee@linaro.org; Wed, 06 Apr 2022 22:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=089d0ce6d=alistair.francis@opensource.wdc.com>)
 id 1ncHW5-0004ah-9H
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 22:04:57 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:26706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=089d0ce6d=alistair.francis@opensource.wdc.com>)
 id 1ncHW3-0007AG-Gt
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 22:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649297095; x=1680833095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4TrWRfAssvbebPXP9akNoVfP3330KVmeRlr0w6+t8uc=;
 b=TaHjfZC9Yi/pFN59DqkkQC6c9d2FdoNQ/BEZS1rHawcOeFaQvtJ4h3Tq
 1dEI8s8J3BjxKaAuASQlS2z7E+taytny7InorNva3RPP03w2uoBFs1h3O
 rFmU3/IuYmKsRVhOsq7K+KOIcEhBofanigb4HMPzwHezUFpl/gnlLwbUj
 8os5mLwoTrB8G8Ps8tRkUh0NWA9IN4JEkNtTaY+++pWhPV5KWk8HY4Pf7
 TQuLsCPGrreNYlgQ2jRRoZfxtdzvcsL6GXI4LxPXRIFhDqs2HHxAiPm0v
 O7e8AKS53AcwVLfzaCRTtKfJpG2UuKDkLYuL6Qi7Pk60UPZin71d1V+xL g==;
X-IronPort-AV: E=Sophos;i="5.90,241,1643644800"; d="scan'208";a="301467848"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Apr 2022 10:04:54 +0800
IronPort-SDR: YLYVXnuCpGlyxW2Xq+BueX1z0yCm23Uqxe4TSauuyZQrJUl35rUWZAb+i+VbnM6yZcZcjlh5ol
 O5jkF6R098bEHCRWAS2p18mwMw4a58zjjtE0/QxVI1cw6ccDWnAv6MchPejmb+Regn9CoywI6w
 L2cbo6tRHzzKuYQw4EB1Vrf3db1worG76JsGvB4FSdIFXHvBdwXqABvpZWdh84B1CYiy31bm0z
 AYdmKsJDMg/asJ6YwhMxKp9Ttt+pRx0cvv7TASkTjsHDWxQYhM928Kii3shDD2ZVG1M6YqhGf7
 Svio9vjR46TuMYmGBMYlexFs
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2022 18:35:35 -0700
IronPort-SDR: Afshs6K+b96ezGnoTuXFwFltpGFzyLDlLbbXaVAYBDiKJmea5U9KXPmiNJqX2FwmdEwb8fKbIG
 OJJr5zJJW/iczaQ2r+TEQ9kULANfxNBPdOeCiMRTQG0oPIwZqS964DYe3y3Ug52MK01HRz0iT/
 OxIPW+psNfmUUrogo8srsTPBpgycwZehRb9PG8AzxN/jcXOq4OraGUR+ni59V0643UfUXOcA+e
 66dpMf4uebfLtyONTJnicXopLAD8sAQEl6FrQZb0HwcNpbl7UvJpsy9oxQEikaTuLeK7fTNnGW
 GsU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2022 19:04:55 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KYl7n72HWz1SVp4
 for <qemu-devel@nongnu.org>; Wed,  6 Apr 2022 19:04:53 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1649297093; x=1651889094; bh=4TrWRfAssvbebPXP9a
 kNoVfP3330KVmeRlr0w6+t8uc=; b=fuxKffGPC0xjziGoFDoepkPyeDVsJ171pK
 DhdwCy58tjKuPCHxbW4WfSabN/P7XZT94GucxdUL1g4l6YQsI7wpVj3IVNTHkMxo
 a7AWSn4mirgGGybqiO3tAnmG7D3JQcIzWAs2RS/wNXzcR/xb1xCCfxFcien2EieN
 ++Glu5YT7YotdG93zAZkf67xoCbO1KzM1OfMGxBTXeVywV+IvJOKDNPdhVV2nf70
 R2+/PqrQ87NpaObomCxwCaYqA8CTqJDRU/YbfElr+gtFJM3P9QqIeimh/SXMBsJs
 cAngpeJoy2qleCdfNT5okeqgoLiw4y9D84iBiLlpe+8izmiuyKFQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id HkGI90wWO7ZN for <qemu-devel@nongnu.org>;
 Wed,  6 Apr 2022 19:04:53 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KYl7g6xx2z1Rvlx;
 Wed,  6 Apr 2022 19:04:47 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, alistair23@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>, bmeng.cn@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 2/6] hw/core: Move the ARM sysbus-fdt to core
Date: Thu,  7 Apr 2022 12:04:28 +1000
Message-Id: <20220407020432.4062829-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407020432.4062829-1-alistair.francis@opensource.wdc.com>
References: <20220407020432.4062829-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=089d0ce6d=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KajICFiJpF0T

From: Alistair Francis <alistair.francis@wdc.com>

The ARM virt machine currently uses sysbus-fdt to create device tree
entries for dynamically created MMIO devices.

The RISC-V virt machine can also benefit from this, so move the code to
the core directory.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
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

