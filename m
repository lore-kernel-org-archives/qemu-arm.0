Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB87EC982FA
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 21:52:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8lrm-0006JH-Bt; Mon, 21 Sep 2026 17:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lrj-0006Gj-90
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:47:59 -0400
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lrh-0000Hn-GM
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:47:58 -0400
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49d1fb0cf5eso24694355e9.3
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790027266; x=1790632066; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9Wbz4ZGk1ZRJg8frLDAcIdnA3seasqKtMV8wqIkAtHw=;
 b=tHZetRht2/z9ovL9iWG47rzE4g5kvsN32y0wGgIvoI1ALHLFnk8x7yYPmrhMO4NKNx
 SOH2lDAB234hgoPfS4+MADiXdxUsOzK2Pm9QByPrjJpqXWXsf0ukzCyWmtSE6sctmPAp
 LMO/qY1wO+dY6LHCXMgR4CVfhvkhuqvIRusq3U2LCw7qGU+HZAy6eqhp0yfGgkZ1qsEK
 M8/RQqNdSHgqW187WCN2f1ywILP1YTDM0jOPutUD3iHvcDqZI3FPjCyreJizCx8/yDgW
 VAL+G26AN5Mrps+LO0mt8aN0g967IRF8Zzmdb2myU+Vd/7JxzYoknx96BBNo4OD81+H8
 eBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790027266; x=1790632066;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9Wbz4ZGk1ZRJg8frLDAcIdnA3seasqKtMV8wqIkAtHw=;
 b=dXSbBKZnTS0pXhoeYUZ+Mv25tfT3Ihbo0bDQ3eVuXBaP2sfB0GroKxqAzbd1UT4WQb
 H7akdr0WdBr2xl3q32wgYMvaJdU0hj9T/W2FnOD4ZlYoIc2lEnJSZBE5tAl40iKPBFZu
 iS5Ku9HQYgmFsqquiLmbNApAtDOqfcp7YN3lFr9zCtQWt7uQ0ZeyzH5snbcH6F7qLMY2
 W/ZxX0kbTGg8b7+1nL9KI9WN0wREKw83K1Iczdp5SEfciTNxv4XSVgtDszGUK6cgA9uD
 BeybbylyLb4b5Ja6B+LIaRMl2JylF4Qztc8BrJkah72Pm6qUZCTuhy2fp0XhxMrzAaAO
 n1kg==
X-Forwarded-Encrypted: i=1;
 AKwUvBz8VziWjOJLduVD5DooP5HEMFD/m5JItXgi29PASnL2XBgwcFuZt7n+HM78Woti23xv7dlnhnGhhw==@nongnu.org
X-Gm-Message-State: AFuF++nKIyooa6x+QhQZPoxJA6Dv3soIAMGBj33qxUavYN0pU5nAk+az
 cCtF6dnSpxYsEEkxuGp6EQAjhSW6cpvzIIkzWVlkFRXT/OqVfaWZT0UO
X-Gm-Gg: AYBFou0ptjjzcA9XvRwYD3nB7a02UqSY+8MctjGJCeuA0DuR+Eb/HfWRRC8H5tkOvLf
 rD5THJD+qJvFQrlgcqAFq/3Dqp0hcGkHof6jxWotYl+NwqfGmLRIF+GywFUMODhDU4uygX17/sc
 5sqpUrWNuNi/NgHFeJkC/d8/inQaQbzqvWSc6HS+6RG9ThNarYOrj+bopXjExudLIH2hIxbOaxI
 zmwzKXUy97TTZXAdfSvbLFJQM3zJpusKALF6QkPkXJSv2iovKtYqHcobJdlfosRcfgVsPXWUtvh
 x2bxMtr4TMoe8Mf8T8hxK+M91JEBgM3FN8AcQIIhjqFb8ceX4RqxpxIiMRQwWuAN3qULgsYW3Mg
 ZSPlcKfoBlBZPSbUQDSybViwzVRgx0LulnJQxygH8W/6yp1VMqW1AUUeMVjvfYMy8NxHe4SpeAP
 mSz2C0iLvjKQ2taPkeMbDNSsEIxD/+CWd1GZOMP2RwidoDVa+x69guPN9faz2Xi8V71NCIk6Vm6
 3YiqmYE9f8jDJIDszZFL8h+PPiec8PjK1rH1tpOqgqIkFiubrJiAHxFMezj0bJ5yqC/muHMoUWe
 Btfc+A539F+4Eg==
X-Received: by 2002:a05:600c:3b0a:b0:49f:bd3c:bc20 with SMTP id
 5b1f17b1804b1-49fc573b7a2mr155976375e9.27.1790027266060; 
 Mon, 21 Sep 2026 14:47:46 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-1c91-bf00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c91:bf00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fda0ce29fsm4986905e9.6.2026.09.21.14.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 14:47:45 -0700 (PDT)
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
Subject: [PATCH 14/42] hw/arm/fsl-imx6ul: Derive from TYPE_SYS_BUS_DEVICE
Date: Mon, 21 Sep 2026 23:46:42 +0200
Message-ID: <20260921214710.29422-15-shentey@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921214710.29422-1-shentey@gmail.com>
References: <20260921214710.29422-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::11;
 envelope-from=shentey@gmail.com; helo=mail-wm2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Deriving from TYPE_SYS_BUS_DEVICE fixes the SoC object to be reset upon
machine reset.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/arm/fsl-imx6ul.h | 5 ++---
 hw/arm/fsl-imx6ul.c         | 4 +---
 hw/arm/mcimx6ul-evk.c       | 2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
index 6205fe6b77..9ae0488990 100644
--- a/include/hw/arm/fsl-imx6ul.h
+++ b/include/hw/arm/fsl-imx6ul.h
@@ -18,6 +18,7 @@
 #define FSL_IMX6UL_H
 
 #include "hw/cpu/a15mpcore.h"
+#include "hw/core/sysbus.h"
 #include "hw/misc/imx6ul_ccm.h"
 #include "hw/misc/imx6_src.h"
 #include "hw/misc/imx7_snvs.h"
@@ -64,10 +65,8 @@ enum FslIMX6ULConfiguration {
 };
 
 struct FslIMX6ULState {
-    /*< private >*/
-    DeviceState    parent_obj;
+    SysBusDevice   parent_obj;
 
-    /*< public >*/
     ARMCPU             cpu;
     A15MPPrivState     a7mpcore;
     IMXGPTState        gpt[FSL_IMX6UL_NUM_GPTS];
diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index 1863558a0d..84451c9909 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -730,13 +730,11 @@ static void fsl_imx6ul_class_init(ObjectClass *oc, const void *data)
     device_class_set_props(dc, fsl_imx6ul_properties);
     dc->realize = fsl_imx6ul_realize;
     dc->desc = "i.MX6UL SOC";
-    /* Reason: Uses serial_hds and nd_table in realize() directly */
-    dc->user_creatable = false;
 }
 
 static const TypeInfo fsl_imx6ul_type_info = {
     .name = TYPE_FSL_IMX6UL,
-    .parent = TYPE_DEVICE,
+    .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(FslIMX6ULState),
     .instance_init = fsl_imx6ul_init,
     .class_init = fsl_imx6ul_class_init,
diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
index 4964cb9345..53d221b4a9 100644
--- a/hw/arm/mcimx6ul-evk.c
+++ b/hw/arm/mcimx6ul-evk.c
@@ -44,7 +44,7 @@ static void mcimx6ul_evk_init(MachineState *machine)
     object_property_set_uint(OBJECT(s), "fec2-phy-num", 1, &error_fatal);
     object_property_set_bool(OBJECT(s), "fec1-phy-connected", false,
                              &error_fatal);
-    qdev_realize(DEVICE(s), NULL, &error_fatal);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(s), &error_fatal);
 
     memory_region_add_subregion(get_system_memory(), FSL_IMX6UL_MMDC_ADDR,
                                 machine->ram);
-- 
2.55.0


