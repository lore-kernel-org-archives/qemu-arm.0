Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2815CA5FF1
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 11:54:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEQE4-0000um-3n; Wed, 07 Oct 2026 07:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xEQDj-0000bT-8U
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 07:54:03 -0400
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xEQDh-00080t-DI
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 07:54:03 -0400
Received: by mail-dl1-x1236.google.com with SMTP id
 a92af1059eb24-1419d3416ceso7176086c88.0
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 04:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791374040; x=1791978840; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Od2zQ51QJBllyumaHQgyeq88/JO3LIBRCqtXjtMjW4I=;
 b=lCZgq2HDmEob0c3v2FSaDAwdQDjCfTnHtJbhlWMKn7Tzjnp6UPD4DDNjQK/Xj07Hkv
 5vNK3iX5UB3n8CHpnXzh/ZZdO6mgS3Eo5o/fiTOedNkhUoaAyCCUjkt9j4ccvUI0XeJU
 U5FV0dJYkL9sTkgTz5hkWiqtmKuPy3giKL0wtf01CAtaK/381AgCIwNP91UkmM1KgEpO
 kvrzTpomQJhoukw+wg0pTR4w4v1pHHlkWlK3zfo+WFqbFtMQfrozqxyOZhQjNYyJfCfy
 nF1ihGj4NBi9OdZk2QtUeNBLvunwlkjEKKOi2HZX2S/UXRDqo+SM8mqZoGR/X0Gif4sk
 jlQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791374040; x=1791978840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Od2zQ51QJBllyumaHQgyeq88/JO3LIBRCqtXjtMjW4I=;
 b=KVwNXW1kIIeY66ZkueKD/dK8bGm41VV4jM6ph6WUSlFIbWtPkyxEQrKcMV9WOfOXOo
 zQi3XyLitWFajn1qiJXGwfUOGWhg7DfKFC0FY9j7yBz2wkub6zgi07s67ybO8N7rtuLV
 ULS9GruygC/XA7ApPmD8xHUITl1A4mRaaBQQPZGY0tkGJ0JtiqPeIQrFSHkPngKDnRwM
 btgaLfwCzEMny2o7lz2mahUt94vZEMsZFu3qgoVJQPHVygiA2JTIkKp9E0oYyr/xDrKo
 CEClBFMJKeheGvQu7eU4NkR++eHsN6kDf4iA4EbqoBXwWEs7sD3+E4fW1X9yiycD3hkr
 kxXQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBw/kH3otXORBgpYA9dOhLVQNQiLo/r6skUMZ+n+1RRWOXseLvPrzxRON0VX+cMlHznoCMm0VcEUIA==@nongnu.org
X-Gm-Message-State: AFuF++myGQBxur9dfc+X0YJQG3muIfGewBnUCZ9xadQouP7mb/1jUIhx
 tDbxWfcK1eQYnPM0yzn+LsHcTtzn/k702ImnMGJwOvnNsUvvk1oZzl8V
X-Gm-Gg: AYBFou1n1yJyiXgf0k4WXcQM/vjGfwDgOwkCSPeavYjxK6zJKk6vCnbxgys+N9PL757
 adGamtLLaVX0t+KhbmxltHOL+BZZXkc3tqO+9nwHFMdVwK++sixEKkFlUR1PHjjDFmSGV9DHAJB
 mJMSCSBPfhqBuvXFH9qlNq18jS7XsnGHlAInwRVKWQxMQ/PFuvlDQIYYMbniTa0w7SUyWOF+c8g
 cvCqefmwrpqYlkde/vV3aiocyjkGqcf+pnRr7oPtK1c4S7O8HuprIw8d+smgVaqITXmSaZom+CQ
 arApr10bqQtsB58bhWXcRd39PHWZORQYM/7hSgBJ6nnix9QCq+sgvZupzYcLq/m1n/PAq2u7iuK
 0oScDrq8xLmu9e3STlfsFfT1fnEReDGQ1uEamfPsiIsg/t37a2jZWysYE7+/qDETckKwtSTsA4W
 dJLSYOjdc5pq3qYATNrx5IMRpI6fSZ1oHVFeCJQMNLRQZG5X5xMxYbX4mDTi9ugO6Qo3awdH/tz
 p1eh2CiSumAOE7+5w==
X-Received: by 2002:a05:7022:28a:b0:143:8188:fafe with SMTP id
 a92af1059eb24-162076c603dmr2150505c88.41.1791374039619; 
 Wed, 07 Oct 2026 04:53:59 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1616980c3b7sm6429520c88.16.2026.10.07.04.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2026 04:53:58 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Stafford Horne <shorne@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>
Subject: [PATCH 8/8] qom: pass TargetInfo to is_available for later use
Date: Wed,  7 Oct 2026 19:48:05 +0800
Message-ID: <20261007115253.328-9-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261007115253.328-1-luoyonggang@gmail.com>
References: <20261007115253.328-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1236;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Change TypeInfo.is_available to the new TypeIsAvailable type, which
takes a const TargetInfo *. Registration passes target_info(), so
behavior is unchanged. object.h only forward-declares TargetInfo.

Switch the existing users (raspi, raspi4b, ast27x0 evb and fc) and the
generated machine parents to the matching target_is_<arch> helpers.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/arm/aspeed_ast27x0-fc.c  |  2 +-
 hw/arm/aspeed_ast27x0_evb.c |  4 ++--
 hw/arm/raspi.c              |  4 ++--
 hw/arm/raspi4b.c            |  2 +-
 hw/arm/virt.c               |  4 ++--
 hw/m68k/virt.c              |  4 ++--
 hw/or1k/virt.c              |  2 +-
 include/qom/object.h        | 12 +++++++++++-
 qom/object.c                |  3 ++-
 9 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/hw/arm/aspeed_ast27x0-fc.c b/hw/arm/aspeed_ast27x0-fc.c
index 73362b60d2a..8a7c6a116ac 100644
--- a/hw/arm/aspeed_ast27x0-fc.c
+++ b/hw/arm/aspeed_ast27x0-fc.c
@@ -234,7 +234,7 @@ static const TypeInfo ast2700fc_types[] = {
         .parent         = TYPE_MACHINE,
         .class_init     = ast2700fc_class_init,
         .instance_size  = sizeof(Ast2700FCState),
-        .is_available   = target_aarch64,
+        .is_available   = target_is_aarch64,
     },
 };
 
diff --git a/hw/arm/aspeed_ast27x0_evb.c b/hw/arm/aspeed_ast27x0_evb.c
index 460c9ff0d2e..02a8cff1d9d 100644
--- a/hw/arm/aspeed_ast27x0_evb.c
+++ b/hw/arm/aspeed_ast27x0_evb.c
@@ -75,13 +75,13 @@ static const TypeInfo aspeed_ast27x0_evb_types[] = {
         .name          = MACHINE_TYPE_NAME("ast2700a1-evb"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_ast2700a1_evb_class_init,
-        .is_available  = target_aarch64,
+        .is_available  = target_is_aarch64,
     },
     {
         .name          = MACHINE_TYPE_NAME("ast2700a2-evb"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_ast2700a2_evb_class_init,
-        .is_available  = target_aarch64,
+        .is_available  = target_is_aarch64,
     }
 };
 
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index fadbacb2534..22b06c6ca22 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -403,12 +403,12 @@ static const TypeInfo raspi_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("raspi3ap"),
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi3ap_machine_class_init,
-        .is_available   = target_aarch64,
+        .is_available   = target_is_aarch64,
     }, {
         .name           = MACHINE_TYPE_NAME("raspi3b"),
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi3b_machine_class_init,
-        .is_available   = target_aarch64,
+        .is_available   = target_is_aarch64,
     }, {
         .name           = TYPE_RASPI_MACHINE,
         .parent         = TYPE_RASPI_BASE_MACHINE,
diff --git a/hw/arm/raspi4b.c b/hw/arm/raspi4b.c
index 566d64572db..a1dc477f25e 100644
--- a/hw/arm/raspi4b.c
+++ b/hw/arm/raspi4b.c
@@ -121,7 +121,7 @@ static const TypeInfo raspi4b_machine_type = {
     .parent         = TYPE_RASPI_BASE_MACHINE,
     .instance_size  = sizeof(Raspi4bMachineState),
     .class_init     = raspi4b_machine_class_init,
-    .is_available   = target_aarch64,
+    .is_available   = target_is_aarch64,
 };
 
 static void raspi4b_machine_register_type(void)
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9d192515d85..18160f7fad3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -132,7 +132,7 @@ static void arm_virt_compat_default_set(MachineClass *mc)
         .name = MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
         .parent = TYPE_VIRT_MACHINE, \
         .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
-        .is_available = target_base_arm, \
+        .is_available = target_is_base_arm, \
     }; \
     static void MACHINE_VER_SYM(register, virt, __VA_ARGS__)(void) \
     { \
@@ -4430,7 +4430,7 @@ static const TypeInfo virt_machine_info = {
          { TYPE_HOTPLUG_HANDLER },
          { }
     },
-    .is_available = target_base_arm,
+    .is_available = target_is_base_arm,
 };
 
 static void machvirt_machine_init(void)
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index e52546e4fab..ad2a43ef3fb 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -327,7 +327,7 @@ static const TypeInfo virt_machine_info = {
     .parent       = TYPE_MACHINE,
     .abstract     = true,
     .class_init   = virt_machine_class_init,
-    .is_available = target_m68k,
+    .is_available = target_is_m68k,
 };
 
 static void virt_machine_register_types(void)
@@ -355,7 +355,7 @@ type_init(virt_machine_register_types)
         .name = MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
         .parent = MACHINE_TYPE_NAME("virt"), \
         .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
-        .is_available = target_m68k, \
+        .is_available = target_is_m68k, \
     }; \
     static void MACHINE_VER_SYM(register, virt, __VA_ARGS__)(void) \
     { \
diff --git a/hw/or1k/virt.c b/hw/or1k/virt.c
index a3ff903839b..89fb786641f 100644
--- a/hw/or1k/virt.c
+++ b/hw/or1k/virt.c
@@ -559,7 +559,7 @@ static const TypeInfo or1ksim_machine_typeinfo = {
     .parent     = TYPE_MACHINE,
     .class_init = openrisc_virt_machine_init,
     .instance_size = sizeof(OR1KVirtState),
-    .is_available = target_or1k,
+    .is_available = target_is_or1k,
 };
 
 static void or1ksim_machine_init_register_types(void)
diff --git a/include/qom/object.h b/include/qom/object.h
index 4c0645817a5..7d52a15f6b8 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -17,6 +17,7 @@
 #include "qapi/qapi-builtin-types.h"
 #include "qemu/module.h"
 
+typedef struct TargetInfo TargetInfo;
 struct TypeImpl;
 typedef struct TypeImpl *Type;
 
@@ -117,6 +118,15 @@ typedef void (ObjectUnparent)(Object *obj);
  */
 typedef void (ObjectFree)(void *obj);
 
+/**
+ * typedef TypeIsAvailable:
+ * @ti: TargetInfo to test.
+ *
+ * Returns whether a type is available for @ti. Typical implementations
+ * are target_is_*().
+ */
+typedef bool (TypeIsAvailable)(const TargetInfo *ti);
+
 #define OBJECT_CLASS_CAST_CACHE 4
 
 /**
@@ -498,7 +508,7 @@ struct TypeInfo
     void (*class_base_init)(ObjectClass *klass, const void *data);
     const void *class_data;
 
-    bool (*is_available)(void);
+    TypeIsAvailable *is_available;
     const InterfaceInfo *interfaces;
 };
 
diff --git a/qom/object.c b/qom/object.c
index 96498f3d001..253b9562b41 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -15,6 +15,7 @@
 #include "qom/compat-properties.h"
 #include "qom/object.h"
 #include "qom/object_interfaces.h"
+#include "qemu/target-info.h"
 #include "qemu/cutils.h"
 #include "qemu/memalign.h"
 #include "qapi/visitor.h"
@@ -167,7 +168,7 @@ static TypeImpl *type_register_internal(const TypeInfo *info)
         abort();
     }
 
-    if (info->is_available && !info->is_available()) {
+    if (info->is_available && !info->is_available(target_info())) {
         return NULL;
     }
 
-- 
2.55.0.windows.3


