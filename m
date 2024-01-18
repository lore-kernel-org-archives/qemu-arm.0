Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp520242ejg;
        Thu, 18 Jan 2024 12:09:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaB2HLQdvwkxRtUkxRoh8IzY9ZZa2QkAYr25/4jtm88DyzS+ooneI9/s6W5XRLepji0PLE
X-Received: by 2002:a17:90a:ca01:b0:290:19b2:3ad0 with SMTP id x1-20020a17090aca0100b0029019b23ad0mr1255404pjt.7.1705608565620;
        Thu, 18 Jan 2024 12:09:25 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1705608565; cv=pass;
        d=google.com; s=arc-20160816;
        b=HZpdkVy9EWJoU8D3QWDL7RI4i+Htwz01wHpGEevD/qx5PZGXt1S7Mg/5nkoa/bAL2a
         wxw1S8nS5+1KE5/hOcfMPS+0tvMxvS9ARt0tr364I3zg2G92wUOeHfGaQaCBm75jWD9L
         Mo6V6MAOwM2XRyJTBgq8Q0wVCJdmeytwI+Cy5f+/GuE30zViNTl+C+NUCj9zGUzo3Amn
         N3v/u0GlxP4fqRAqo02W7qLmFXwpci6/09jgzGWyvABNBNRZg3N1h+SlhLu48Y4OMZbM
         FUcMEpQu1WYZ+oR0MA4jQXB4ZA4QyQpkGWBOih8o6MNg8AsVtoLWv6bkaHG0Zb3Ut7C2
         eNqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=/2EqqFckSbhbAC8zOQO19ZG9GyZSFLJsrPZ+inqnxX0=;
        fh=cUgEM3TMHOIH70RmHTmTZxZmItZJnKfBWHSaci49aLY=;
        b=kFVU76w9+VzpnMheYU4TEn45PQExAmbm0JqMw/KH3d1YlowNeSjU2h2n9BqDCjPqHI
         TT5br7O2vapydCLuGkyifivWkzToSbA9faRpMFjgGasiq7aCN6oHq9ZZz/9wdbMZSgEu
         Pg1S3Sm593RXxZkTVkM5BvwrCyHe2QkvXKkzSrGNwDJg8WhH853Bj9IKx1u2MAVJyc+9
         5Cjj601Q7DVk1aNqdfSpZ0WKK2YhT0R9C3lEY6mX+9SmV3u39cfMDdHO+DfM5arKHBTb
         02lgX56jZl4mGawzQj+sGQuFv2WjhYei2qemzVn+SYs1rJ7OH8dCx3Ok0/8kM9Ih+w+n
         pOUQ==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yCNvq5zW;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-6451-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-6451-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-6451-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id w6-20020a17090aad4600b00290328f9c7esi943734pjv.111.2024.01.18.12.09.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 12:09:25 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-6451-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yCNvq5zW;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-6451-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-6451-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FD57B2140D
	for <alex.bennee@linaro.org>; Thu, 18 Jan 2024 20:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BDAF2E83D;
	Thu, 18 Jan 2024 20:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yCNvq5zW"
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE072E829
	for <kvm@vger.kernel.org>; Thu, 18 Jan 2024 20:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705608525; cv=none; b=LAsah1GZPHJRDwh+1u3wrGCMQfbE5f2jCAcuDN6huilVRY9QLTnuZhnscGV/bgUlaAUXIWs4eYMTOd1Z3nRF9HxOolPU94YgRi2IvumXeXbUd82GDsQ/rV985YVuAn0kcCZOyC3W4iOdXlF1L+VkyVq2Q5zxopkW8nKoYg73kkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705608525; c=relaxed/simple;
	bh=i5GbNcbu+BFVLWAt1KxCOTUbI6yROQ61G0LB6TGRwoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZcyR7O65tQtdy28bhIFpwBTftqbrBAJUbj8038zsoz2UvPd6NZlsoZkm/rVCrlDwr5PLqGKl0a/ko/Pv9I9eLnjycKRSKLCoB64mm9RjCRE55toHC8vz5fbzbdoQ7Kb/uoyYNnrMSkH+mjWBZM4PshJeMUopEYIMwBtFmkOTwK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yCNvq5zW; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40e779f030aso529475e9.0
        for <kvm@vger.kernel.org>; Thu, 18 Jan 2024 12:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705608522; x=1706213322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2EqqFckSbhbAC8zOQO19ZG9GyZSFLJsrPZ+inqnxX0=;
        b=yCNvq5zWGYo8XP+eAkMkB+w+4TDAwCy41z/6yUndkPXhFErtQDEonKTdTZv35Tyttj
         VkQo3plNuC1p/vHPrfkiwoPP/q/UOaUpgU51Iq8PDKJY813rRYdylFE/wRYnY5iPaRbF
         fiJe7BqyBS6MHou0cg2xqtayQYP57daV6Ncp2cICkL4L7wiGMP9U8XW++nENATQawV/u
         QUtOxjjZa4ibvTEZUft1hAXpZT7EQvdHTcN/CbEQ0FY5ZPDcrXKsI1Y5idNO4bV3OQPF
         n43ZxX2U2MYRqmt8KdaGGB0p21PbZBtQKU1EkI0TMYCR8JX/FiyvQU0gTaKIkIvVwWvA
         YAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705608522; x=1706213322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2EqqFckSbhbAC8zOQO19ZG9GyZSFLJsrPZ+inqnxX0=;
        b=wfEUjLmmbbpOmuMIXL/2d5kiZbzGTC2qXJ8i3FfyN3nUJ/FwiZX+QrQ/r1WMAXdGSG
         2+jl6BZkteFfdp5WIcd3fSeQAtX9D7ZIpi8a28myWOxBp1FJzkFNxWjtd6xUf+RHEelT
         hLLjX168z+mNMzl94NE5Mdb5g+P8qPYFgozoL6HGNKXK848XMIgp35pZMPD9o2KMDzlr
         tNEih6r/86meypHauF7hMphnwAMug7ZgW/iMvk187apYVZeYOZRxYbZ3f/hwk0uiGt5x
         yMC5R/28Dy/+ZXfO7ZBXprRmyHEnfXNn18fQlXidw66h8y1+VVKRdxqxY/ZVGI8bxYjW
         KraQ==
X-Gm-Message-State: AOJu0Yzs/9xWErYQAoeFgqk4SgL8IeLYdCUSB9PyQI2sfTaM/QmMsrsO
	MaoWFx7lil8Zgn8QzkBW+NTEAJUqYRja5qUY+UrOnORbP7DW1iykVuEvsVjYmDI=
X-Received: by 2002:a1c:4c18:0:b0:40d:5897:bf52 with SMTP id z24-20020a1c4c18000000b0040d5897bf52mr868484wmf.183.1705608521804;
        Thu, 18 Jan 2024 12:08:41 -0800 (PST)
Received: from localhost.localdomain ([78.196.4.158])
        by smtp.gmail.com with ESMTPSA id l22-20020a05600c4f1600b0040d6b91efd9sm30506762wmq.44.2024.01.18.12.08.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Jan 2024 12:08:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	qemu-arm@nongnu.org,
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Eric Auger <eric.auger@redhat.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Alexander Graf <agraf@csgraf.de>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Ani Sinha <anisinha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Joel Stanley <joel@jms.id.au>,
	Hao Wu <wuhaotsh@google.com>,
	kvm@vger.kernel.org
Subject: [PATCH 20/20] hw/arm: Build various units only once
Date: Thu, 18 Jan 2024 21:06:41 +0100
Message-ID: <20240118200643.29037-21-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240118200643.29037-1-philmd@linaro.org>
References: <20240118200643.29037-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2oyl5q0RdCft

Various files in hw/arm/ don't require "cpu.h" anymore.
Except virt-acpi-build.c, all of them don't require any
ARM specific knowledge anymore and can be build once as
target agnostic units. Update meson accordingly.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/collie.c           |  1 -
 hw/arm/gumstix.c          |  1 -
 hw/arm/integratorcp.c     |  1 -
 hw/arm/mainstone.c        |  1 -
 hw/arm/musicpal.c         |  1 -
 hw/arm/omap2.c            |  1 -
 hw/arm/omap_sx1.c         |  1 -
 hw/arm/palm.c             |  1 -
 hw/arm/spitz.c            |  1 -
 hw/arm/strongarm.c        |  1 -
 hw/arm/versatilepb.c      |  1 -
 hw/arm/vexpress.c         |  1 -
 hw/arm/virt-acpi-build.c  |  1 -
 hw/arm/xilinx_zynq.c      |  1 -
 hw/arm/xlnx-versal-virt.c |  1 -
 hw/arm/z2.c               |  1 -
 hw/arm/meson.build        | 23 ++++++++++++-----------
 17 files changed, 12 insertions(+), 27 deletions(-)

diff --git a/hw/arm/collie.c b/hw/arm/collie.c
index a0ad1b8dc7..eaa5c52d45 100644
--- a/hw/arm/collie.c
+++ b/hw/arm/collie.c
@@ -17,7 +17,6 @@
 #include "hw/arm/boot.h"
 #include "hw/block/flash.h"
 #include "exec/address-spaces.h"
-#include "cpu.h"
 #include "qom/object.h"
 #include "qemu/error-report.h"
 
diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index 2ca4140c9f..3f2bcaa24e 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -44,7 +44,6 @@
 #include "hw/boards.h"
 #include "exec/address-spaces.h"
 #include "sysemu/qtest.h"
-#include "cpu.h"
 
 #define CONNEX_FLASH_SIZE   (16 * MiB)
 #define CONNEX_RAM_SIZE     (64 * MiB)
diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index 5600616a4d..793262eca8 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -9,7 +9,6 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "cpu.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "hw/boards.h"
diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index 68329c4617..fc14e05060 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -23,7 +23,6 @@
 #include "hw/block/flash.h"
 #include "hw/sysbus.h"
 #include "exec/address-spaces.h"
-#include "cpu.h"
 
 /* Device addresses */
 #define MST_FPGA_PHYS	0x08000000
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index d89824f600..e46aa91807 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -12,7 +12,6 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
-#include "cpu.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "hw/arm/boot.h"
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index f159fb73ea..d9683276c6 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -21,7 +21,6 @@
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
-#include "cpu.h"
 #include "exec/address-spaces.h"
 #include "sysemu/blockdev.h"
 #include "sysemu/qtest.h"
diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index 4bf1579f8c..62d7915fb8 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -35,7 +35,6 @@
 #include "hw/block/flash.h"
 #include "sysemu/qtest.h"
 #include "exec/address-spaces.h"
-#include "cpu.h"
 #include "qemu/cutils.h"
 #include "qemu/error-report.h"
 
diff --git a/hw/arm/palm.c b/hw/arm/palm.c
index b86f2c331b..8c4c831614 100644
--- a/hw/arm/palm.c
+++ b/hw/arm/palm.c
@@ -29,7 +29,6 @@
 #include "hw/input/tsc2xxx.h"
 #include "hw/irq.h"
 #include "hw/loader.h"
-#include "cpu.h"
 #include "qemu/cutils.h"
 #include "qom/object.h"
 #include "qemu/error-report.h"
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 1d680b61e2..643a02b180 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -33,7 +33,6 @@
 #include "hw/adc/max111x.h"
 #include "migration/vmstate.h"
 #include "exec/address-spaces.h"
-#include "cpu.h"
 #include "qom/object.h"
 #include "audio/audio.h"
 
diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
index 75637869cb..7fd99a0f14 100644
--- a/hw/arm/strongarm.c
+++ b/hw/arm/strongarm.c
@@ -28,7 +28,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "cpu.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index 15b5ed0ced..1d813aa23b 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -9,7 +9,6 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "cpu.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "hw/arm/boot.h"
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 49dbcdcbf0..f1b45245d5 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -24,7 +24,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/datadir.h"
-#include "cpu.h"
 #include "hw/sysbus.h"
 #include "hw/arm/boot.h"
 #include "hw/arm/primecell.h"
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 43ccc60f43..17aeec7a6f 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -32,7 +32,6 @@
 #include "qemu/error-report.h"
 #include "trace.h"
 #include "hw/core/cpu.h"
-#include "target/arm/cpu.h"
 #include "hw/acpi/acpi-defs.h"
 #include "hw/acpi/acpi.h"
 #include "hw/nvram/fw_cfg_acpi.h"
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 5809fc32af..66d0de139f 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -18,7 +18,6 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
-#include "cpu.h"
 #include "hw/sysbus.h"
 #include "hw/arm/boot.h"
 #include "net/net.h"
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 29f4d2c2dc..94942c55df 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -16,7 +16,6 @@
 #include "hw/boards.h"
 #include "hw/sysbus.h"
 #include "hw/arm/fdt.h"
-#include "cpu.h"
 #include "hw/qdev-properties.h"
 #include "hw/arm/xlnx-versal.h"
 #include "hw/arm/boot.h"
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 83741a4909..a67fba2cfd 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -25,7 +25,6 @@
 #include "hw/audio/wm8750.h"
 #include "audio/audio.h"
 #include "exec/address-spaces.h"
-#include "cpu.h"
 #include "qom/object.h"
 #include "qapi/error.h"
 
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index bb92b27db3..c401779067 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -9,23 +9,14 @@ arm_ss.add(when: 'CONFIG_INTEGRATOR', if_true: files('integratorcp.c'))
 arm_ss.add(when: 'CONFIG_MAINSTONE', if_true: files('mainstone.c'))
 arm_ss.add(when: 'CONFIG_MICROBIT', if_true: files('microbit.c'))
 arm_ss.add(when: 'CONFIG_MUSICPAL', if_true: files('musicpal.c'))
-arm_ss.add(when: 'CONFIG_NETDUINO2', if_true: files('netduino2.c'))
 arm_ss.add(when: 'CONFIG_NETDUINOPLUS2', if_true: files('netduinoplus2.c'))
 arm_ss.add(when: 'CONFIG_OLIMEX_STM32_H405', if_true: files('olimex-stm32-h405.c'))
 arm_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx.c', 'npcm7xx_boards.c'))
 arm_ss.add(when: 'CONFIG_NSERIES', if_true: files('nseries.c'))
-arm_ss.add(when: 'CONFIG_SX1', if_true: files('omap_sx1.c'))
-arm_ss.add(when: 'CONFIG_CHEETAH', if_true: files('palm.c'))
-arm_ss.add(when: 'CONFIG_GUMSTIX', if_true: files('gumstix.c'))
-arm_ss.add(when: 'CONFIG_SPITZ', if_true: files('spitz.c'))
-arm_ss.add(when: 'CONFIG_Z2', if_true: files('z2.c'))
 arm_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview.c'))
 arm_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa-ref.c'))
 arm_ss.add(when: 'CONFIG_STELLARIS', if_true: files('stellaris.c'))
 arm_ss.add(when: 'CONFIG_STM32VLDISCOVERY', if_true: files('stm32vldiscovery.c'))
-arm_ss.add(when: 'CONFIG_COLLIE', if_true: files('collie.c'))
-arm_ss.add(when: 'CONFIG_VERSATILE', if_true: files('versatilepb.c'))
-arm_ss.add(when: 'CONFIG_VEXPRESS', if_true: files('vexpress.c'))
 arm_ss.add(when: 'CONFIG_ZYNQ', if_true: files('xilinx_zynq.c'))
 arm_ss.add(when: 'CONFIG_SABRELITE', if_true: files('sabrelite.c'))
 
@@ -33,8 +24,7 @@ arm_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m.c'))
 arm_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210.c'))
 arm_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx.c', 'pxa2xx_gpio.c', 'pxa2xx_pic.c'))
 arm_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic.c'))
-arm_ss.add(when: 'CONFIG_OMAP', if_true: files('omap1.c', 'omap2.c'))
-arm_ss.add(when: 'CONFIG_STRONGARM', if_true: files('strongarm.c'))
+arm_ss.add(when: 'CONFIG_OMAP', if_true: files('omap1.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('allwinner-a10.c', 'cubieboard.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orangepi.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_R40', if_true: files('allwinner-r40.c', 'bananapi_m2u.c'))
@@ -69,8 +59,19 @@ arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
 arm_ss.add(when: 'CONFIG_XEN', if_true: files('xen_arm.c'))
 
 system_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
+system_ss.add(when: 'CONFIG_CHEETAH', if_true: files('palm.c'))
+system_ss.add(when: 'CONFIG_COLLIE', if_true: files('collie.c'))
 system_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
+system_ss.add(when: 'CONFIG_GUMSTIX', if_true: files('gumstix.c'))
+system_ss.add(when: 'CONFIG_NETDUINO2', if_true: files('netduino2.c'))
+system_ss.add(when: 'CONFIG_OMAP', if_true: files('omap2.c'))
 system_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c'))
+system_ss.add(when: 'CONFIG_SPITZ', if_true: files('spitz.c'))
+system_ss.add(when: 'CONFIG_STRONGARM', if_true: files('strongarm.c'))
+system_ss.add(when: 'CONFIG_SX1', if_true: files('omap_sx1.c'))
 system_ss.add(when: 'CONFIG_TOSA', if_true: files('tosa.c'))
+system_ss.add(when: 'CONFIG_VERSATILE', if_true: files('versatilepb.c'))
+system_ss.add(when: 'CONFIG_VEXPRESS', if_true: files('vexpress.c'))
+system_ss.add(when: 'CONFIG_Z2', if_true: files('z2.c'))
 
 hw_arch += {'arm': arm_ss}
-- 
2.41.0

