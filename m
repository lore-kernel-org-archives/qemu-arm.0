Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCD9C624DB
	for <qemu-arm@archiver.kernel.org>; Thu,  3 Sep 2026 20:51:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2EOM-0000rt-Lp; Thu, 03 Sep 2026 16:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x2EOL-0000rF-70
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 16:50:37 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x2EOJ-0002LC-Ab
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 16:50:36 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-39647aa9d52so355489a91.0
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2026 13:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788468634; x=1789073434; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OHqXa1Je19E/e4B+GnDgGce6rjSmcnOFDuW0MG/IjQo=;
 b=McOiiDg6H7msr2KNIkVhIhgtOi6NAXIFRkPO6M+xrv6SoHSaL09t4bG3m+Pb3crFgZ
 xmGaUFSDAj4vS9uXJdrylKi8I7dGuDOTXKQeWi0YjK0bIYs9eFatAi2OIy6V0BbfFR1u
 WyagKp0f2oSGRt+94E5WgYTkxWktl38WRciYV6S/e/6n4Jw+tUE33fxPFyxn9PH3Ywy0
 QuAGULWOHSsz/1e4uvkG9vdxjTFuP5GD40XMqw5kEOnE8oIW2G0zFoHfT+PuD46LEMcf
 J91yLqcnTNvdZkWMBBqf6Wl1ZWHcOYwxXg3Gxg7GqIyMX6Yfm3AhgNEWa9+ezK1d7zaF
 KZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788468634; x=1789073434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=OHqXa1Je19E/e4B+GnDgGce6rjSmcnOFDuW0MG/IjQo=;
 b=Nqh2NP7JXyZkMpNpQD6mp5mcu5XAXnnpwq3nHTPpx6hHyjjMH0ll/EdjUKTcuugQUE
 mHP2CkYaLOGT2vIuonzS9bM/J39/AcRohn9glOHR7x0hOJJoptIpALsaewf6cIyjfqe8
 O1wDUNeC9P0vdnnGF74q2oF0Mzh/i0sThIDf+la0DxW6pEXE2vQodb/2WbrPDwIKvJkK
 Ft+l/q+aPe8CpIB+3ADfrY5MJy/22FS8ELeGMZQyuQEkVKVCSNU+G7a3CnIkYDQZ2+aI
 Oc0dp7B3NWddmZXqPCCJ4/yGul9SKayTXtLtfqwdHLzavskbBmbyVbn28nnDrvlcNo3F
 gwvQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzAs0Kh1dZOpJCgdhICWtlPxDHWSfDvkbX9b5bg9+/7N46Mr4m5xcNTQyk2kiQ8RTGB4CAMezs2WQ==@nongnu.org
X-Gm-Message-State: AFuF++nqBWyANhrMSR9moUh3mYt9dHOsnXhq9xJYdnv0eltQmIS8tKpx
 a2LzN4Dgcz1kKRi4BYq7fJZpLZLgKx67XXPifUsu1HbqQxTdxIFLTp8n
X-Gm-Gg: AYBFou3wBo9SqkYx7xb5/5YCXNOZxWDoKE1E6m5ftp4S3dwuZ/Lz8+wv+ORmIGZ16fD
 yO/6+YT5LwBxujKYowIvl1CR8S7bnaekhtFdlbWGaZzetXv2KbHNdto6kqcSqp2b7e+F2BXM8xg
 8su2sd/Z46bGmgc+NGAm2Wlc1jGt7CyL6Y/Dvi9+DkLLVyoeYRLDWLlg/HzO7JbnSwuxC1KljmL
 B8ZY0y6ceE1+ajgRPjGGx1jqu9GAs6oGt46Lz20eV5xV7KE+jG19WyD5M7Gyp7197mxeFDX54jb
 dk9mItVfPDviCrKjFGX6gP0VBF0UF6KalnG7Dk3Km1XVGPhMvpcCzqsexmRfrRFySh7YkHeCNhn
 iY5pd1xbh8bU6N60eWAxJ6I7TeCDakPyRQMkfXDN1aDYNZVNKHL7AfOD276O1J+jCI7fd3fVNWt
 p4ooF8N7Q7e4IYebotaHPNzvchRouE7SCtS/KhTHBQbj/b18UiaSfFqPEe2N7j4qOaag99gRKBZ
 kRp/rirG5YvxQLK21Z3Jg==
X-Received: by 2002:a17:90b:5804:b0:398:9beb:a2b6 with SMTP id
 98e67ed59e1d1-39b087e4c2fmr9602207a91.24.1788468633696; 
 Thu, 03 Sep 2026 13:50:33 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-3339a534152sm1279679eec.10.2026.09.03.13.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 13:50:32 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Troy Lee <leetroy@gmail.com>, Kane Chen <kane_chen@aspeedtech.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Helge Deller <deller@gmx.de>, Kyle Evans <kevans@freebsd.org>,
 Warner Losh <imp@bsdimp.com>, Joel Stanley <joel@jms.id.au>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 1/2] target-info: move selection into QOM
Date: Fri,  4 Sep 2026 04:50:16 +0800
Message-ID: <20260903205018.975-2-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260903205018.975-1-luoyonggang@gmail.com>
References: <20260903205018.975-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x102e.google.com
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

- Move target_info() from target-info-qom.c into qom/object.c so QOM
  can read the current TargetInfo without a target-info-qom cycle.
- Add target_info_select() to install the TargetInfo once. Return NULL
  from target_info() until it is called.
- Keep TargetInfo as an incomplete type in object.h; define the struct
  only in target-info-impl.h.
- Select the sole user-mode TargetInfo from MODULE_INIT_TARGET_INFO
  instead of defining target_info() in that binary.
- Have target_info_qom_set_target() call target_info_select().
- Call MODULE_INIT_TARGET_INFO before MODULE_INIT_QOM in linux-user
  and bsd-user so target_info() is set before QOM class_init.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 bsd-user/main.c                 |  1 +
 include/qemu/target-info-impl.h | 13 ++++---------
 include/qemu/target-info-init.h | 18 ++++++++++--------
 include/qom/object.h            | 18 ++++++++++++++++++
 linux-user/main.c               |  1 +
 qom/object.c                    | 13 +++++++++++++
 target-info-qom.c               |  9 +--------
 7 files changed, 48 insertions(+), 25 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 694481ae3ec..592c04f1e79 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -285,6 +285,7 @@ int main(int argc, char **argv)
     error_init(argv[0]);
     module_call_init(MODULE_INIT_TRACE);
     qemu_init_cpu_list();
+    module_call_init(MODULE_INIT_TARGET_INFO);
     module_call_init(MODULE_INIT_QOM);
 
     envlist = envlist_create();
diff --git a/include/qemu/target-info-impl.h b/include/qemu/target-info-impl.h
index cf42aabbc8b..61404baa4b5 100644
--- a/include/qemu/target-info-impl.h
+++ b/include/qemu/target-info-impl.h
@@ -9,10 +9,12 @@
 #ifndef QEMU_TARGET_INFO_IMPL_H
 #define QEMU_TARGET_INFO_IMPL_H
 
+#include "qemu/target-info.h"
+#include "qom/object.h"
 #include "qapi/qapi-types-common.h"
 #include "qapi/qapi-types-machine.h"
 
-typedef struct TargetInfo {
+struct TargetInfo {
     /* runtime equivalent of TARGET_NAME definition */
     const char *target_name;
     /* related to TARGET_ARCH definition */
@@ -30,13 +32,6 @@ typedef struct TargetInfo {
     unsigned page_bits_init;
     /* runtime equivalent of TARGET_PAGE_BITS_VARY definition */
     bool page_bits_vary;
-} TargetInfo;
-
-/**
- * target_info:
- *
- * Returns: The TargetInfo structure definition for this target binary.
- */
-const TargetInfo *target_info(void);
+};
 
 #endif
diff --git a/include/qemu/target-info-init.h b/include/qemu/target-info-init.h
index b7024c9faef..2a19918ae08 100644
--- a/include/qemu/target-info-init.h
+++ b/include/qemu/target-info-init.h
@@ -12,6 +12,8 @@
 #ifndef QEMU_TARGET_INFO_INIT_H
 #define QEMU_TARGET_INFO_INIT_H
 
+#include "qom/object.h"
+
 #define DEFINE_TARGET_INFO_TYPE(info)                                       \
 static void do_qemu_init_target_info(void)                                  \
 {                                                                           \
@@ -23,19 +25,19 @@ module_init(do_qemu_init_target_info, MODULE_INIT_TARGET_INFO)
 #ifdef CONFIG_USER_ONLY
 
 /*
- * User mode does not support multiple targets in the same binary, so just
- * define target_info().
+ * User mode does not support multiple targets in the same binary.
+ * Install the sole TargetInfo before MODULE_INIT_QOM.
  */
-#define target_info_init(ti_var)        \
-const TargetInfo *target_info(void)     \
-{                                       \
-    return &ti_var;                     \
-}
+#define target_info_init(ti_var)                                        \
+static void do_qemu_init_target_info(void)                              \
+{                                                                       \
+    target_info_select(&ti_var);                                        \
+}                                                                       \
+module_init(do_qemu_init_target_info, MODULE_INIT_TARGET_INFO)
 
 #else /* CONFIG_USER_ONLY */
 
 #include "qemu/target-info-qom.h"
-#include "qom/object.h"
 
 #define target_info_init(ti_var)                                            \
 static const TypeInfo target_info_qom_target_type_info = {                  \
diff --git a/include/qom/object.h b/include/qom/object.h
index 7ecd0f210fb..49956388098 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -117,6 +117,24 @@ typedef void (ObjectUnparent)(Object *obj);
  */
 typedef void (ObjectFree)(void *obj);
 
+typedef struct TargetInfo TargetInfo;
+
+/**
+ * target_info:
+ *
+ * Returns: The current TargetInfo, or NULL before target_info_select().
+ */
+const TargetInfo *target_info(void);
+
+/**
+ * target_info_select:
+ * @ti: TargetInfo to select
+ *
+ * Sets the TargetInfo returned by target_info(). Must be called only
+ * once. @ti must not be NULL.
+ */
+void target_info_select(const TargetInfo *ti);
+
 #define OBJECT_CLASS_CAST_CACHE 4
 
 /**
diff --git a/linux-user/main.c b/linux-user/main.c
index 60a695b7ca3..36d5c6ded4f 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -700,6 +700,7 @@ int main(int argc, char **argv, char **envp)
     error_init(argv[0]);
     module_call_init(MODULE_INIT_TRACE);
     qemu_init_cpu_list();
+    module_call_init(MODULE_INIT_TARGET_INFO);
     module_call_init(MODULE_INIT_QOM);
 
     envlist = envlist_create();
diff --git a/qom/object.c b/qom/object.c
index b1834a57cc9..c5a1bd74a38 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -15,6 +15,7 @@
 #include "qom/compat-properties.h"
 #include "qom/object.h"
 #include "qom/object_interfaces.h"
+#include "qemu/target-info-impl.h"
 #include "qemu/cutils.h"
 #include "qemu/memalign.h"
 #include "qapi/visitor.h"
@@ -83,6 +84,18 @@ static GHashTable *type_table;
 
 static bool enumerating_types;
 
+static const TargetInfo *target_info_ptr;
+
+const TargetInfo *target_info(void)
+{
+    return target_info_ptr;
+}
+
+void target_info_select(const TargetInfo *ti)
+{
+    target_info_ptr = ti;
+}
+
 static void type_table_add(TypeImpl *ti)
 {
     assert(!enumerating_types);
diff --git a/target-info-qom.c b/target-info-qom.c
index 6965e4d1169..aba1f954496 100644
--- a/target-info-qom.c
+++ b/target-info-qom.c
@@ -33,13 +33,6 @@ static const TypeInfo target_info_parent_type = {
 
 DEFINE_TARGET_INFO_TYPE(target_info_parent_type)
 
-static const TargetInfo *target_info_ptr;
-
-const TargetInfo *target_info(void)
-{
-    return target_info_ptr;
-}
-
 void target_info_qom_set_target(void)
 {
     g_autoptr(GSList) targets = object_class_get_list(TYPE_TARGET_INFO, false);
@@ -51,5 +44,5 @@ void target_info_qom_set_target(void)
                                  "more than one target-info is available");
     }
 
-    target_info_ptr = TARGET_INFO_CLASS(targets->data)->target_info;
+    target_info_select(TARGET_INFO_CLASS(targets->data)->target_info);
 }
-- 
2.52.0.windows.1


