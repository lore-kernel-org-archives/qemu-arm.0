Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1393427ejx;
        Fri, 2 Dec 2022 07:40:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4PCpD4Nu9xa97nfZrhhuiGeQvUMtIcyDyBTCHrd4lMg0vk4rj99CRpKlVm4tBZxOztBtVM
X-Received: by 2002:a05:6214:3c87:b0:4c6:5bac:4456 with SMTP id ok7-20020a0562143c8700b004c65bac4456mr55634175qvb.128.1669995658517;
        Fri, 02 Dec 2022 07:40:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669995658; cv=none;
        d=google.com; s=arc-20160816;
        b=EtK4CRIEASXdo8JWBfYEUnefdgtGDb9FrkRnWfk/fozO4tJtY1BFzc0aYtioxJyKq/
         4S0Y8dveeFtxj1sx+WmZdqKgraXHEoepRj89oDJ12FbKsON2sIjO5jf+GKSB8q6gaj6p
         iuko70nJs4A/XWhsSSMaPGYF+nTrYuvAay3FxMBvauBK+5pr8B7WWWD9DZWOr9vCq5wQ
         Fd4utM8FB99Tq3owHUqkQWaXejkzFuHzZ8caTNnuTaiBSO1m7Xm0Xv67DFY/i/KqxLYp
         TOgHCwEnTRHTfk1VC/S65tZlVo4O3DgJxoe+aeX4YjwvH+ErlOVC0p6zsw1wlrSSwl6Q
         TVeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=k31gxd363+rUh2suHaYSb16ogW0CYQz/oUuU7ri+gT4=;
        b=Z5RaVCkYgLdT0msXENpWjvBiz/CyKxI1mmyi1Qvg74eCgHwEaCC67K/gcxiNko9iSX
         tr30+GTaRUk1/qKEuCcnvOpg/AwIdJjrhJDMZTGRUflslR8es0n/hr4M8xhX7B8tLNOT
         n5jcOR86T6f505KIFmWoz2g9IsTLyshchAx2u+GsdQONSXPz5iZ8tL2QcZgQha5knc2b
         u38bmrlUf7HnUR/ldHpdN7D2Q+pmIKqbnBTfLLM+HUPJmIpR/sZoTinC3mqlLjoBfjr0
         Q0BXcgP9EamE3orkRS124USXiDj2/CX1qrZ94kmJMbIEfXHOHC0fPv8pD5kNY2LPgBCG
         ILDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QavpOHZY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10-20020ac8514a000000b00399ae6c0b72si4182555qtn.538.2022.12.02.07.40.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Dec 2022 07:40:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QavpOHZY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p189U-0001RA-Qi; Fri, 02 Dec 2022 10:40:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p189T-0001Qs-Nw
 for qemu-arm@nongnu.org; Fri, 02 Dec 2022 10:40:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p189R-000133-H0
 for qemu-arm@nongnu.org; Fri, 02 Dec 2022 10:40:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669995631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=k31gxd363+rUh2suHaYSb16ogW0CYQz/oUuU7ri+gT4=;
 b=QavpOHZYhZgrzeTBXmw3kcINfVnrudgQEEZccu42TLG4spkOk7DeOP1GV1r8R4w//Hs4w4
 FKOXrPffvRu8ReOXj7sdTwwlRozE9pyvQ3wCER4DlOqpPfpjfKyY3r20Bt4E8/KckvCFey
 zLQqRhtAKXHpNKD4ZWcCWtNM02Ay6Gk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-ABQYHRjCPFK9TJH82YeZ_A-1; Fri, 02 Dec 2022 10:40:30 -0500
X-MC-Unique: ABQYHRjCPFK9TJH82YeZ_A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFFD9185A79C;
 Fri,  2 Dec 2022 15:40:29 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C30B0403165;
 Fri,  2 Dec 2022 15:40:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 for-8.0] hw/misc: Move some arm-related files from
 specific_ss into softmmu_ss
Date: Fri,  2 Dec 2022 16:40:23 +0100
Message-Id: <20221202154023.293614-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: C5vxDICUMqV7

The header arget/arm/kvm-consts.h checks CONFIG_KVM which is marked as
poisoned in common code, so the files that include this header have to
be added to specific_ss and recompiled for each, qemu-system-arm and
qemu-system-aarch64. However, since the kvm headers are only optionally
used in kvm-constants.h for some sanity checks, we can additionally
check the NEED_CPU_H macro first to avoid the poisoned CONFIG_KVM macro,
so kvm-constants.h can also be used from "common" files (without the
sanity checks - which should be OK since they are still done from other
target-specific files instead). This way, and by adjusting some other
include statements in the related files here and there, we can move some
files from specific_ss into softmmu_ss, so that they only need to be
compiled once during the build process.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Use NEED_CPU_H wrapper in kvm-consts.h instead of avoiding to include it

 include/hw/misc/xlnx-zynqmp-apu-ctrl.h |  2 +-
 target/arm/kvm-consts.h                |  8 ++++----
 hw/misc/imx6_src.c                     |  2 +-
 hw/misc/iotkit-sysctl.c                |  1 -
 hw/misc/meson.build                    | 11 +++++------
 5 files changed, 11 insertions(+), 13 deletions(-)

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
diff --git a/target/arm/kvm-consts.h b/target/arm/kvm-consts.h
index faacf96fdc..09967ec5e6 100644
--- a/target/arm/kvm-consts.h
+++ b/target/arm/kvm-consts.h
@@ -14,16 +14,16 @@
 #ifndef ARM_KVM_CONSTS_H
 #define ARM_KVM_CONSTS_H
 
+#ifdef NEED_CPU_H
 #ifdef CONFIG_KVM
 #include <linux/kvm.h>
 #include <linux/psci.h>
-
 #define MISMATCH_CHECK(X, Y) QEMU_BUILD_BUG_ON(X != Y)
+#endif
+#endif
 
-#else
-
+#ifndef MISMATCH_CHECK
 #define MISMATCH_CHECK(X, Y) QEMU_BUILD_BUG_ON(0)
-
 #endif
 
 #define CP_REG_SIZE_SHIFT 52
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
index 95268eddc0..ed0598dc9e 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -51,6 +51,7 @@ softmmu_ss.add(when: 'CONFIG_IMX', if_true: files(
   'imx25_ccm.c',
   'imx31_ccm.c',
   'imx6_ccm.c',
+  'imx6_src.c',
   'imx6ul_ccm.c',
   'imx7_ccm.c',
   'imx7_gpr.c',
@@ -84,8 +85,8 @@ softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files(
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
@@ -101,6 +102,7 @@ softmmu_ss.add(when: 'CONFIG_TZ_MPC', if_true: files('tz-mpc.c'))
 softmmu_ss.add(when: 'CONFIG_TZ_MSC', if_true: files('tz-msc.c'))
 softmmu_ss.add(when: 'CONFIG_TZ_PPC', if_true: files('tz-ppc.c'))
 softmmu_ss.add(when: 'CONFIG_IOTKIT_SECCTL', if_true: files('iotkit-secctl.c'))
+softmmu_ss.add(when: 'CONFIG_IOTKIT_SYSCTL', if_true: files('iotkit-sysctl.c'))
 softmmu_ss.add(when: 'CONFIG_IOTKIT_SYSINFO', if_true: files('iotkit-sysinfo.c'))
 softmmu_ss.add(when: 'CONFIG_ARMSSE_CPU_PWRCTRL', if_true: files('armsse-cpu-pwrctrl.c'))
 softmmu_ss.add(when: 'CONFIG_ARMSSE_CPUID', if_true: files('armsse-cpuid.c'))
@@ -126,15 +128,12 @@ softmmu_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_ahb_apb_pnp.c'))
 
 specific_ss.add(when: 'CONFIG_AVR_POWER', if_true: files('avr_power.c'))
 
-specific_ss.add(when: 'CONFIG_IMX', if_true: files('imx6_src.c'))
-specific_ss.add(when: 'CONFIG_IOTKIT_SYSCTL', if_true: files('iotkit-sysctl.c'))
-
 specific_ss.add(when: 'CONFIG_MAC_VIA', if_true: files('mac_via.c'))
 
 specific_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_cmgcr.c', 'mips_cpc.c'))
 specific_ss.add(when: 'CONFIG_MIPS_ITU', if_true: files('mips_itu.c'))
 
-specific_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa_ec.c'))
+softmmu_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa_ec.c'))
 
 # HPPA devices
 softmmu_ss.add(when: 'CONFIG_LASI', if_true: files('lasi.c'))
-- 
2.31.1

