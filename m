Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp687771ejc;
        Thu, 23 Feb 2023 04:44:15 -0800 (PST)
X-Google-Smtp-Source: AK7set9Q/DU+GKmhJXXaKbBnIW7jXgr0cbAgtLGf1AcF8Gg20protcJ6hVDIo5kFIyvYNC60PbqE
X-Received: by 2002:ad4:5d4c:0:b0:56e:fb1b:3c7b with SMTP id jk12-20020ad45d4c000000b0056efb1b3c7bmr24048133qvb.38.1677156255653;
        Thu, 23 Feb 2023 04:44:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677156255; cv=none;
        d=google.com; s=arc-20160816;
        b=RLZZ74TheMR0rfEXu68POTRVqazbxp6n30VrZqHXsSr3aFCcPCA91vsGnYaGQg47HG
         k3zN+/5mdfv7+CYD0j3F0PCnfcfwfna7Wn21UIheB9drhvc3duT1M/i5HQ77PdOWoarf
         MNXffScGJvZ/88t/VZjRLmaIdDEOQvoYwJY5WJv3zPqqi3lHgiqky0P8J+cpZXWgUrKv
         O/RHAw+alcKKXy1w+JSM3DNUoTaycTaRkWzBKVaoFUOGjQqr56kXi3djbMAv0cRm8Wnc
         vsqkrYD/dim/bCSEmujI8ny0G3eeXVCLDZOhRftaauA2uMPM9k2/Mo6Fb5BWZNgsMndm
         FNdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=k0k3YaD196s7IoVbwQsB4O8AuR6esyLbrwlewHL7j90=;
        b=R0GDTv5pkh2Bnjhz/CVwsRNrrD8BGrTXKhOM+3+YBB99W4V7KYfPoy2jodvz07Lw8k
         w4aRN5cmK8FbGQ7LuJzXjhRPUlpBOr5tamWlXMunc4LwUaPmprofPMxsbG1d/zRxyp2q
         BTfsdoc4VAB4Dy5GDz2O0EEPSCtJa//Sqb68uhZF18AZ60i7RfqngZSo1qtSwQ0G6Vva
         A1hPONpM2HNfO9eAiw88y4Kij8mjK1CiDiWGhzL4PTn0nv+9Gi1cxcIWQJqAOeKFFEad
         wkbQNFEIQv3uPASpqcvVfWy0gx9Yh2f6kd4FnET8w4ZbFhe599DgzL/DbxNeFmYjrIG7
         YJxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sRoy4p+f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x22-20020a05620a259600b007023e988bdcsi3948690qko.1.2023.02.23.04.44.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 04:44:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sRoy4p+f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVAxB-0007dw-CP; Thu, 23 Feb 2023 07:44:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVAxA-0007ck-5y
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 07:44:04 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVAx7-00033e-8g
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 07:44:03 -0500
Received: by mail-wm1-x330.google.com with SMTP id o14so9059900wms.1
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 04:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k0k3YaD196s7IoVbwQsB4O8AuR6esyLbrwlewHL7j90=;
 b=sRoy4p+fHrQvJXNyKOSy93/cUpgZ/obx9agK+QvDmloGvU6kBNDM98yuJDk3+A0cq2
 J3ctaK6Leg5E4dWPNUxSwU9Ibxp9sZHJcxw/i171wZxGNg1xxvQpt9KInSiJgtVecjQJ
 dZv75yIBH35s1YYI9bvKI1RXOfApVZp2oWUAHigN+aLYUm72dxesjyfSv0GxPir2HC+2
 +JPT4GdH0eJ2vSGV03geqhZ1MYi3oAUhMCzVTEKNYtVPvHd26xjy+2rWGv4jmowG0BfB
 zXZeex51uiQFaZ+qBkQn6Op1nqPtDffswmqLB+GsuPbRNiHnm8XY8hKTavDVZpJIyI7v
 iqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k0k3YaD196s7IoVbwQsB4O8AuR6esyLbrwlewHL7j90=;
 b=7RLfwtRSh7pIOUvv155qiSVtlJ1+5EPm2d26edvzYNzwta+leE+XvqtntddNMw7pSN
 dwdu3v7SHcBt3cV4siSlRcbtrpbU1TCRGQi5XeodoONrgXTv9/Y7emC8/iH9IIzKo34c
 iF1rEJJfNeqxwTDVBqapTBkBmjQVSBbKTkJ4vVTA4hl7W/b4YMmPbj8ZH8yoMrN6+nRL
 3ZMr0T2R+XW3py1RQ4D6TSB4hJUBpor7AyGvv7rgpa9jndzm274pev5nHNlPeoKZ5Ix2
 JFQvjQvUgtZuS8RGrWTitIMi04XPbt8+y3BuUHPDJVPGSCiXEOJgohgUK+CrJyovXs4A
 7JyA==
X-Gm-Message-State: AO0yUKUs4uXNUbSep+iB3qJC7MC/jmVMGG8ScI98z4b8crosvVQUvgc6
 HqHe7M7EPP/LiBQ7nXG3xkKSCw==
X-Received: by 2002:a05:600c:1818:b0:3e8:96d9:579f with SMTP id
 n24-20020a05600c181800b003e896d9579fmr5312579wmp.40.1677156239870; 
 Thu, 23 Feb 2023 04:43:59 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r1-20020adfdc81000000b002c5503a8d21sm7954749wrj.70.2023.02.23.04.43.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Feb 2023 04:43:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 3/4] target/loongarch: Restrict 'qapi-commands-machine.h'
 to system emulation
Date: Thu, 23 Feb 2023 13:43:39 +0100
Message-Id: <20230223124340.95367-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230223124340.95367-1-philmd@linaro.org>
References: <20230223124340.95367-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ecHM8Xe6WACM

Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
user-mode builds") we don't generate the "qapi-commands-machine.h"
header in a user-emulation-only build.

Extract the QMP functions from cpu.c (which is always compiled)
to the new 'monitor.c' unit (which is only compiled when system
emulation is selected).

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/loongarch/cpu.c                | 27 -------------------
 target/loongarch/loongarch-qmp-cmds.c | 37 +++++++++++++++++++++++++++
 target/loongarch/meson.build          |  1 +
 3 files changed, 38 insertions(+), 27 deletions(-)
 create mode 100644 target/loongarch/loongarch-qmp-cmds.c

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 290ab4d526..4e845ba29b 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -12,7 +12,6 @@
 #include "qemu/module.h"
 #include "sysemu/qtest.h"
 #include "exec/exec-all.h"
-#include "qapi/qapi-commands-machine-target.h"
 #include "cpu.h"
 #include "internals.h"
 #include "fpu/softfloat-helpers.h"
@@ -748,29 +747,3 @@ static const TypeInfo loongarch_cpu_type_infos[] = {
 };
 
 DEFINE_TYPES(loongarch_cpu_type_infos)
-
-static void loongarch_cpu_add_definition(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    CpuDefinitionInfoList **cpu_list = user_data;
-    CpuDefinitionInfo *info = g_new0(CpuDefinitionInfo, 1);
-    const char *typename = object_class_get_name(oc);
-
-    info->name = g_strndup(typename,
-                           strlen(typename) - strlen("-" TYPE_LOONGARCH_CPU));
-    info->q_typename = g_strdup(typename);
-
-    QAPI_LIST_PREPEND(*cpu_list, info);
-}
-
-CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
-{
-    CpuDefinitionInfoList *cpu_list = NULL;
-    GSList *list;
-
-    list = object_class_get_list(TYPE_LOONGARCH_CPU, false);
-    g_slist_foreach(list, loongarch_cpu_add_definition, &cpu_list);
-    g_slist_free(list);
-
-    return cpu_list;
-}
diff --git a/target/loongarch/loongarch-qmp-cmds.c b/target/loongarch/loongarch-qmp-cmds.c
new file mode 100644
index 0000000000..6c25957881
--- /dev/null
+++ b/target/loongarch/loongarch-qmp-cmds.c
@@ -0,0 +1,37 @@
+/*
+ * QEMU LoongArch CPU (monitor definitions)
+ *
+ * SPDX-FileCopyrightText: 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/qapi-commands-machine-target.h"
+#include "cpu.h"
+
+static void loongarch_cpu_add_definition(gpointer data, gpointer user_data)
+{
+    ObjectClass *oc = data;
+    CpuDefinitionInfoList **cpu_list = user_data;
+    CpuDefinitionInfo *info = g_new0(CpuDefinitionInfo, 1);
+    const char *typename = object_class_get_name(oc);
+
+    info->name = g_strndup(typename,
+                           strlen(typename) - strlen("-" TYPE_LOONGARCH_CPU));
+    info->q_typename = g_strdup(typename);
+
+    QAPI_LIST_PREPEND(*cpu_list, info);
+}
+
+CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
+{
+    CpuDefinitionInfoList *cpu_list = NULL;
+    GSList *list;
+
+    list = object_class_get_list(TYPE_LOONGARCH_CPU, false);
+    g_slist_foreach(list, loongarch_cpu_add_definition, &cpu_list);
+    g_slist_free(list);
+
+    return cpu_list;
+}
diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
index 690633969f..9293a8ab78 100644
--- a/target/loongarch/meson.build
+++ b/target/loongarch/meson.build
@@ -16,6 +16,7 @@ loongarch_tcg_ss.add(zlib)
 
 loongarch_softmmu_ss = ss.source_set()
 loongarch_softmmu_ss.add(files(
+  'loongarch-qmp-cmds.c',
   'machine.c',
   'tlb_helper.c',
   'constant_timer.c',
-- 
2.38.1

