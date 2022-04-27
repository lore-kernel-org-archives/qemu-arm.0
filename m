Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1362859lfu;
        Wed, 27 Apr 2022 16:48:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjgVdICv1QIkSsPI5Y3GaedBlMlmE3NFQOz3DSOqrQ3S/TDznuTQq/XzaaXAjpjK00Ne9W
X-Received: by 2002:a05:6214:5089:b0:456:4ce5:2d16 with SMTP id kk9-20020a056214508900b004564ce52d16mr6129551qvb.61.1651103297491;
        Wed, 27 Apr 2022 16:48:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651103297; cv=none;
        d=google.com; s=arc-20160816;
        b=hEe4UsSImdnieUrgJi37aI0lbVU2eBwufWdr9sc2tkcTNa8JGhKy9w6WV78p7I8dok
         8SPi4fvLFt4o0CMZCeiEFc5nD03wShLa8NB9W0KQvcPHXIzQpdqSDUKqF+APeEa1SmJ3
         IsVM+ILpvwC51nfngpPYmLhhTC0Zuq8oa5qLF4LuezYPWOMuQ6E4Rk67nCshZcaxC6mk
         sckrCySFR7vVGVbtuw4AqeX0EnpdnBKofylvhlZlvzdsEixlUa4bj5M9M3f6g6KEJHmU
         r+nOJ4HcQmqJYMaL/HD24yOSmsg2BtimdVpLG34OKTPEaUWCERwuIXgN6YlD1c+d5yae
         nD+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:wdcironportexception:ironport-sdr:ironport-sdr
         :dkim-signature;
        bh=/ERuHHP68rPBxRy1X7i5RDW42BviCkV6OJuI7suCLCY=;
        b=WtmvWpgoZOc9gczXCL2fH4wsmpEkQWjb5cMUfhQitoz1cqNjQsLQAolgTebcLUjQ8a
         f1A2PJYxaHlUCbd011e6bH4V5yWs69PE0zZIUxG0aE5t/aUVkRI1pfrbbbFrXW8ynEpD
         ixGRRTpB7a86Aec0+ePoowz19VwwkTcpdZ4N8GRapR+ENT2yLxIgFQcUZAq1Ootlj9oW
         xDZeTLIuvKpq6MPOT8ZwNBIpsX2HGDrxYqz+Xtmc5UtTMbMzrIZZ/cKsuWjd15FjR+K5
         OYSh2pyiMZBvUYU5Gj/tgJqNXajupwekoiQur/f+RzyjWVI8rVxNYzBv81pzzV8wD/PR
         2CHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@wdc.com header.s=dkim.wdc.com header.b=XSqjCzhr;
       dkim=pass header.i=@opensource.wdc.com header.s=dkim header.b=r+BvutMl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=opensource.wdc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h6-20020ac85846000000b002f3862b08e8si838706qth.557.2022.04.27.16.48.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Apr 2022 16:48:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@wdc.com header.s=dkim.wdc.com header.b=XSqjCzhr;
       dkim=pass header.i=@opensource.wdc.com header.s=dkim header.b=r+BvutMl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=opensource.wdc.com
Received: from localhost ([::1]:59660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njrOK-0002QI-Vh
	for alex.bennee@linaro.org; Wed, 27 Apr 2022 19:48:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=109fe075d=alistair.francis@opensource.wdc.com>)
 id 1njrIO-0004js-3x
 for qemu-arm@nongnu.org; Wed, 27 Apr 2022 19:42:08 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:48831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=109fe075d=alistair.francis@opensource.wdc.com>)
 id 1njrIM-0004US-8J
 for qemu-arm@nongnu.org; Wed, 27 Apr 2022 19:42:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651102926; x=1682638926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VDMqwzAuMleBEfUbybBP0LToT0CiGMl/sjF8ifOru0A=;
 b=XSqjCzhrOZt7bwtlEw6LZIGtHJ9NOHn75D/5vwWXDZUJwZUV64o/4XwS
 2tMukfUhR//YiWtSZ14ljHj6KlUA9h15k+GL3Otb+obeRgeISaFRHCkJH
 IB1MT72Omn8iszC76MGMmoSE7A61Bikprb/LD9uFfnZmM/qaHCfIrkatN
 v9IRu5qY4qXk8aTkC5GnB6kW4SVej1+vKqdggnD36QkpxBcINpd9YvGCN
 f15cSqEIbJfyjkZPtyB3ar6yJC6XyUc1C4WX/jJEPL02ofLEjY6KMWNxb
 qcEAYC/y48QRob2EvBNfGfq2akta2x0QNT79kq+p9BFcJ1SudXi3/xoti w==;
X-IronPort-AV: E=Sophos;i="5.90,294,1643644800"; d="scan'208";a="197844530"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Apr 2022 07:42:04 +0800
IronPort-SDR: MH71YeU5jRPdis9mFaM03xlNeuYOatUcFDtGYfP5EkxB818GuaVUotRcvf5FWPdj0nNbkrprZQ
 B1ea4RgWdFNknkNTVgzRmt8O7LsggW1pk97/q3FnM0KwSGZx0JIfBBPStGRIRUp2HpnHYrn9cn
 NeFEI/OCMC5xGzw4fYdwzvqW78gr6BAFyM8an1Txk4xZIBNG9UhrLPZHtawl+Cfm6aZoJa8Icm
 b0/lDart/q6sTmwmMt3OsZf2Ousx0Nrq42xjoF98lixfzK3Rab98FQ0XQgJB3MerWdHErj92G6
 Hf5ggdrFLiIjg45DGvoRpFn7
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:12:56 -0700
IronPort-SDR: IGQNkylyEv9S2OZILvkxvidSKIbUhSjhMRSBfeqkojgCSMM9OWOWhnCmh50x0/2rt6TQGDEJGl
 eaMBtBq/fxsi+UkVtpIBcAqcHdv2K3gY5jKTL2QMOCYt2QknJByex+GnUTsezg4jLR1irclS2E
 7HtVTHW9iPRc9dYMnFPP+J9vrs/LjuMC8zM5h5sWfSfPELyPCrW4Ypkc8+jteNSQDQPLZR+a/e
 0fnmOdtF3wgbFnYB2WD7U5wjxR4t7X24mjXRU1XaKJgMuGf0nf61Em8BIWZH6Z9hEhSM85D5dr
 kPY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:42:05 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KpZzJ238Cz1SVny
 for <qemu-arm@nongnu.org>; Wed, 27 Apr 2022 16:42:04 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651102923; x=1653694924; bh=VDMqwzAuMleBEfUbyb
 BP0LToT0CiGMl/sjF8ifOru0A=; b=r+BvutMlphBtwKfSNvbZFO3qMd77WR0IIA
 +M5MKvqgvWCyu1QCLilpU95tRO9kFx5e96XfD6ywn+DcerAoywlwztvVAKbDH8RP
 Wy1FcuDzAGbSIrwUm6UAO5CIb4G5yjsZYaBil/fSLyaKkrANppeCfFlATYClIMe+
 5059ztnMM8zNy3QYWSQOrvsUBRvcmX5erxOXGt+hXWrB9PfWxcOfkeb5QgNITOyK
 6Rkd+FRZ9JowIAEQ1Gq0U1hZpkuDCbnHGcd/uKxtLBDCWXO39jmf0cEqLfKMuo7q
 rSkmpmHxyjTSXRlLSdHPLJUCaIygHGLHVVT6Ahsy5iCdk1piqzwQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id wqngm7Bleoos for <qemu-arm@nongnu.org>;
 Wed, 27 Apr 2022 16:42:03 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KpZzD0HrBz1Rvlc;
 Wed, 27 Apr 2022 16:41:59 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, alistair23@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH v5 2/6] hw/core: Move the ARM sysbus-fdt to core
Date: Thu, 28 Apr 2022 09:41:42 +1000
Message-Id: <20220427234146.1130752-3-alistair.francis@opensource.wdc.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: rFhPle4an7pu

From: Alistair Francis <alistair.francis@wdc.com>

The ARM virt machine currently uses sysbus-fdt to create device tree
entries for dynamically created MMIO devices.

The RISC-V virt machine can also benefit from this, so move the code to
the core directory.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
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
index 5bdd98e4a1..f94278935f 100644
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
index 66a2de7e13..37fc9b919c 100644
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

