Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1118565ejx;
        Wed, 30 Nov 2022 03:16:41 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6czAwxnH4T58Pa2moLeFisrJSxsEEBZqdhynU/6SiYqyZN7xomskygkVSKwZGYnVs/8irG
X-Received: by 2002:a05:622a:1f93:b0:3a6:3dd6:6335 with SMTP id cb19-20020a05622a1f9300b003a63dd66335mr28489413qtb.495.1669807001728;
        Wed, 30 Nov 2022 03:16:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669807001; cv=none;
        d=google.com; s=arc-20160816;
        b=stChh3ntbxhR9BTRMSF1lmmh8TXMN6hodF8z/UZmeE2bnqECximH49sA6nmdHeN+vM
         g19WZA12xdIFocTWZfKyGpiuYObJRlc+2o5LtYMtZSNXIV+ZrAKrUqtfuHpcDBwNNtEm
         ek6+5yOxP1at+W7Y7mghsxZk+MWU+SY0GpSRHnouNpgclu63q//IXF06HH2j7tD5WdVi
         MFFpEG5PunEVo5PsibhNl2mn9TzcZtP0wcTjz53TlhejVV35ErM0WGLSHK3WkpzSxEcc
         oXnA8AnxnU7C7/ij9XR2pzGXIAM9dBILM37maGxOaCZ1rf3TEdIvkMfd0sLCX419rvSc
         CUhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=cLuBE4CwVyOCpRNM63N+ORYMhi8Tq1mrFfZw4JOemkc=;
        b=FY0sUt6BtEPKUwhqUnh+P0JtOKZV6r47VZEzcNmoeOlSvdnjaYon3/iTNGfjo7H/1r
         Ob5PS7tmyJ7qywp6BRda6t3Pm/xUrnr6Jgw7LiF5zpPZZrJMjeQpYLC7n/Ko/03TaCcR
         1d2GuKg/m6JUbdK3VmG8TEC1gZ9NiQgneUN3ngL53xFvT76waxAlvwKNxleB6oRC1qFv
         VeVp27AS8dKHJSjZWZVcfueHNpgvU6jfbtd9NcTfcLLx7Py9uepmNixgUANCl+4Qew73
         GwC6kPL/WIN5712JVY9QGHltz8xMjfsICI39QZWGEeCWehVobGH0mp8sicmasci1WNhe
         6Tqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FFnmTLCU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j19-20020ac874d3000000b003a4f6a6c4e4si568714qtr.101.2022.11.30.03.16.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Nov 2022 03:16:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FFnmTLCU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0L4Y-0001wv-AS; Wed, 30 Nov 2022 06:16:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p0L4W-0001wT-90
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 06:16:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p0L4U-0002hK-Kp
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 06:16:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669806969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=cLuBE4CwVyOCpRNM63N+ORYMhi8Tq1mrFfZw4JOemkc=;
 b=FFnmTLCUcyh8Iwx32txaAcGHa4JDSK88K7k3a3P+ga54PD4eicJiPytjw6rMrNpa8UObLF
 E2MSEsF4RjpRcm393O/wkt7cxm2VfTMRrjj9EtKoh5bLbPC4u/yHoui8nHm3VCdN1n8ThU
 fcnB6lte54hKuXz4ORz3aid2cucjogk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-x45v4UzUPFieMpThyMqsgA-1; Wed, 30 Nov 2022 06:16:05 -0500
X-MC-Unique: x45v4UzUPFieMpThyMqsgA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6046985A59D;
 Wed, 30 Nov 2022 11:16:05 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91DB440C6EC4;
 Wed, 30 Nov 2022 11:16:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH for-8.0] hw/misc: Move some arm-related files from specific_ss
 into softmmu_ss
Date: Wed, 30 Nov 2022 12:15:59 +0100
Message-Id: <20221130111559.52150-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: M2l3Zr5MSBul

By removing #include "kvm-consts.h" from arm-powerctl.h (seems not to
be required there) and adjusting the header includes in some files, we
can move them from specific_ss into softmmu_ss, so that they only need
to be compiled once and not for qemu-system-arm and qemu-system-aarch64
individually.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/misc/xlnx-zynqmp-apu-ctrl.h | 2 +-
 target/arm/arm-powerctl.h              | 2 --
 hw/misc/imx6_src.c                     | 2 +-
 hw/misc/iotkit-sysctl.c                | 1 -
 hw/misc/meson.build                    | 8 ++++----
 5 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/include/hw/misc/xlnx-zynqmp-apu-ctrl.h b/include/hw/misc/xlnx-zynqmp-apu-ctrl.h
index b8ca9434af..c3bf3c1583 100644
--- a/include/hw/misc/xlnx-zynqmp-apu-ctrl.h
+++ b/include/hw/misc/xlnx-zynqmp-apu-ctrl.h
@@ -13,7 +13,7 @@
 
 #include "hw/sysbus.h"
 #include "hw/register.h"
-#include "target/arm/cpu.h"
+#include "target/arm/cpu-qom.h"
 
 #define TYPE_XLNX_ZYNQMP_APU_CTRL "xlnx.apu-ctrl"
 OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPAPUCtrl, XLNX_ZYNQMP_APU_CTRL)
diff --git a/target/arm/arm-powerctl.h b/target/arm/arm-powerctl.h
index 37c8a04f0a..35e048ce14 100644
--- a/target/arm/arm-powerctl.h
+++ b/target/arm/arm-powerctl.h
@@ -11,8 +11,6 @@
 #ifndef QEMU_ARM_POWERCTL_H
 #define QEMU_ARM_POWERCTL_H
 
-#include "kvm-consts.h"
-
 #define QEMU_ARM_POWERCTL_RET_SUCCESS QEMU_PSCI_RET_SUCCESS
 #define QEMU_ARM_POWERCTL_INVALID_PARAM QEMU_PSCI_RET_INVALID_PARAMS
 #define QEMU_ARM_POWERCTL_ALREADY_ON QEMU_PSCI_RET_ALREADY_ON
diff --git a/hw/misc/imx6_src.c b/hw/misc/imx6_src.c
index 7b0e968804..a9c64d06eb 100644
--- a/hw/misc/imx6_src.c
+++ b/hw/misc/imx6_src.c
@@ -15,7 +15,7 @@
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
-#include "arm-powerctl.h"
+#include "target/arm/arm-powerctl.h"
 #include "hw/core/cpu.h"
 
 #ifndef DEBUG_IMX6_SRC
diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c
index 7147e2f84e..e664215ee6 100644
--- a/hw/misc/iotkit-sysctl.c
+++ b/hw/misc/iotkit-sysctl.c
@@ -30,7 +30,6 @@
 #include "hw/qdev-properties.h"
 #include "hw/arm/armsse-version.h"
 #include "target/arm/arm-powerctl.h"
-#include "target/arm/cpu.h"
 
 REG32(SECDBGSTAT, 0x0)
 REG32(SECDBGSET, 0x4)
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 95268eddc0..9ca6bf1d17 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -84,8 +84,8 @@ softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files(
 ))
 softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_misc.c'))
 softmmu_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq_slcr.c'))
-specific_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-crf.c'))
-specific_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-apu-ctrl.c'))
+softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-crf.c'))
+softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-apu-ctrl.c'))
 specific_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-crl.c'))
 softmmu_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files(
   'xlnx-versal-xramc.c',
@@ -126,8 +126,8 @@ softmmu_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_ahb_apb_pnp.c'))
 
 specific_ss.add(when: 'CONFIG_AVR_POWER', if_true: files('avr_power.c'))
 
-specific_ss.add(when: 'CONFIG_IMX', if_true: files('imx6_src.c'))
-specific_ss.add(when: 'CONFIG_IOTKIT_SYSCTL', if_true: files('iotkit-sysctl.c'))
+softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx6_src.c'))
+softmmu_ss.add(when: 'CONFIG_IOTKIT_SYSCTL', if_true: files('iotkit-sysctl.c'))
 
 specific_ss.add(when: 'CONFIG_MAC_VIA', if_true: files('mac_via.c'))
 
-- 
2.31.1

