Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793E5C982ED
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 21:52:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8lrX-0006C4-29; Mon, 21 Sep 2026 17:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lrO-000667-4z
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:47:40 -0400
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lrM-00007E-G3
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:47:37 -0400
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49cd38e0f79so19676575e9.3
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790027255; x=1790632055; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EKSAnmYv14gw5tUyYikFWhvF6ivlQzDp0mFzgIwqxlM=;
 b=Z1Gojlg0LAEooacqPxpo9ssr8W/N+BxqcJRYby/+kmcDbciZ8V2O6X2dPs0uwO3gsn
 4pCpcpPhAtOsREB/aMCZDVr7enl8VmLWv6/UT4ieL57i/ddVG27qkAiarkguK/RbzGt3
 NcIDpcmGoR6u2TQeLsLwa0uMdQNLY+Cwnz+GG0SkIyC1+pVH9ETH3sCygc9o5UQFjfqE
 tqT7eyjoaTZI/b2HGGOG3SpgouRPBHc/1niA6oo08sGWkpuSMBKCtK2t9yePJdu5GYPf
 Ju5lEqijxGCUPEka98vTLGIcVjhjn2DLiw/TumY+zCCXIXCRwH3Gbfb/YJQJKlBKZ+8L
 eyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790027255; x=1790632055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=EKSAnmYv14gw5tUyYikFWhvF6ivlQzDp0mFzgIwqxlM=;
 b=IM+D/GgnnUC4nLcCHSAaW3rtiVjmlbVXMcChbfWB0Wgrzq0R1oLsxNvUIQRAzD8TjO
 EbLxwDQJKjDRZaXJWP5y7yk+IhSbTOKdJC7N33wKGhBMqn9/14ZZ4bnUWqYDhAzarBV+
 OTe9Lv+Fzz89VUCCjEUnx32z6uYAXLJw6rA+vMJYO8ZghxrASWWCDz2T9OBN5FQzcrZc
 r/EXAkCYwZqh7sevFfPVtmb32LeZS3UYMaDmC+xh/rZ4sQ/78BVBz5Ljabf/gA142Wx5
 qJGo6lrE71Xrilu90aposHT6kMohRCpmWUvF00dzn5Tt2qgXi/JH6iwSU8kS+cKaA57J
 GPww==
X-Forwarded-Encrypted: i=1;
 AKwUvBz+/0EWQwoO6XPFxtSZl8+MBWC+lb1VhHPxUY3dqgcCJqMqSB4bcBZHHH3LwAeNGuJ1q4Q+SQbDlg==@nongnu.org
X-Gm-Message-State: AFuF++kFs6B+MiQVr7yRqzhAlxddgOzxKV8SoL+6EGM/RaSoGiOXllv1
 Ds4KQgUZdf6emOnDS+EIzWRw4wqgf9Atljfowqfp+ClOKU3X0pxoEIIw
X-Gm-Gg: AYBFou3fuvl4j78NpfAfNI3tG0ijQNR3KXhjXWEeYnAcw21D/B/ZyscgExd9THVF+mz
 00bVFm4Y6f8tXlA7AQl5jaOWvp1vFXBj3jE3+ZZprxltnagT6mCt9rMnlcW7A42pe9fnU5NIaaU
 bzmkwqxEebIAQFnfNpEqhF/VNoiUSiyEHi7KZSJwUOS0NWCJ0mtYEtNsU40V+aX4xxy+R5CiNza
 j4nRyggadUvFDhYclhnkezXh+g27zlv3433XVirNPDqD8Q3beG28vo+d3cIsAdQ4Eo7cdVab2TJ
 CvVZ03ZbB3VXl3otpJYL+m0crv8pgE2JgtKVLtm0LUYTFuHZreUmk3lNX7E3htqDRTnFXr0MWNy
 pMA+WYpIH5PYA2yQNM22PLyeAQTHPMN/xzPN08vYAAchU4TwGMYVheS1jPIYgX+Mt+yQuJngIq6
 4wSyZkOtBvVARwJn4XdXh5b5Tp8lkF/WHxuEG/v4GI2yv+NtFdblJbOeoJU/YAMKdtaXWGCQLQP
 cCKLC4RCu8w7iBAVZvf7VMnUP+kCpCkwMxf7W7zaWccjpnZivdCZOsqZ1GaoLeNb6JBwmTUHjK1
 yVU=
X-Received: by 2002:a05:600c:470d:b0:49f:ce78:356b with SMTP id
 5b1f17b1804b1-49fce7836bdmr110430645e9.28.1790027254687; 
 Mon, 21 Sep 2026 14:47:34 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-1c91-bf00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c91:bf00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fda0ce29fsm4986905e9.6.2026.09.21.14.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 14:47:34 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Jason Wang <jasowangio@gmail.com>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Subject: [PATCH 06/42] hw/arm/sabrelite: Have 4 CPUs and 1 GiB of RAM by
 default
Date: Mon, 21 Sep 2026 23:46:34 +0200
Message-ID: <20260921214710.29422-7-shentey@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921214710.29422-1-shentey@gmail.com>
References: <20260921214710.29422-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::10;
 envelope-from=shentey@gmail.com; helo=mail-wm2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Having four CPUs and 1 GiB of RAM matches real hardware. Fix the machine
defaults to make its use more ergonomic and less error-prone. Also
reflect this in the board documentation.

To reproduce the old default behavior for e.g. migration purposes,
`-smp 1 -m 128M` needs to be passed on the command line.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 docs/system/arm/sabrelite.rst | 4 ++--
 hw/arm/sabrelite.c            | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/sabrelite.rst b/docs/system/arm/sabrelite.rst
index d3a3c01dd6..b8ac9548f5 100644
--- a/docs/system/arm/sabrelite.rst
+++ b/docs/system/arm/sabrelite.rst
@@ -55,7 +55,7 @@ To boot the newly built Linux kernel in QEMU with the SABRE Lite machine, use:
 
 .. code-block:: bash
 
-  $ qemu-system-arm -M sabrelite -smp 4 -m 1G \
+  $ qemu-system-arm -M sabrelite \
       -display none -serial null -serial stdio \
       -kernel arch/arm/boot/zImage \
       -dtb arch/arm/boot/dts/imx6q-sabrelite.dtb \
@@ -89,7 +89,7 @@ the -kernel argument, along with an SD card image with rootfs:
 
 .. code-block:: bash
 
-  $ qemu-system-arm -M sabrelite -smp 4 -m 1G \
+  $ qemu-system-arm -M sabrelite \
       -display none -serial null -serial stdio \
       -kernel u-boot
 
diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
index 05dfabd937..34f302f83c 100644
--- a/hw/arm/sabrelite.c
+++ b/hw/arm/sabrelite.c
@@ -17,6 +17,7 @@
 #include "hw/core/boards.h"
 #include "hw/core/qdev-properties.h"
 #include "qemu/error-report.h"
+#include "qemu/units.h"
 #include "system/qtest.h"
 
 struct SabreliteMachineState {
@@ -139,7 +140,9 @@ static void sabrelite_machine_class_init(ObjectClass *oc, const void *data)
     mc->desc = "Freescale i.MX6 Quad SABRE Lite Board (Cortex-A9)";
     mc->init = sabrelite_init;
     mc->max_cpus = FSL_IMX6_NUM_CPUS;
+    mc->default_cpus = FSL_IMX6_NUM_CPUS;
     mc->ignore_memory_transaction_failures = true;
+    mc->default_ram_size = 1 * GiB;
     mc->default_ram_id = "sabrelite.ram";
     mc->auto_create_sdcard = true;
 }
-- 
2.55.0


