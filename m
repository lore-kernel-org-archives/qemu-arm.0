Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4226855ejb;
        Tue, 20 Dec 2022 03:04:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4KZg0X655G7e+lh0649IS/93j3gHm7tU8ifdkj+BUaFPZEgYbV1Bvb0BT5rytYT2hMC9Rl
X-Received: by 2002:a05:622a:488d:b0:3a8:14ce:73db with SMTP id fc13-20020a05622a488d00b003a814ce73dbmr55118033qtb.17.1671534291358;
        Tue, 20 Dec 2022 03:04:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671534291; cv=none;
        d=google.com; s=arc-20160816;
        b=RTVIiw5eW0ejk7rRg0aHa5sVj6vrOF10s3+vFyQbxVj0m+kQ+f9H8mV87GNXWUGbNc
         jfv/R12EkH5ukA8VTZvftsiHVv2nDV2kA0+JbR9g8TTVheVyuKuYMcAm6uGMuqCaTr7o
         7ISsOID9yV9g5BhK/PbeTT1dd7tmbri+4p0J7XSpfBhuB1U6v/7fi4FBDU3a45Pd257P
         PrvY8suLWKU/FqYS4U6yIIsBfVFd/H4m2UqOv4xr9g/e9XT/bUTm6S9YBtC5wLyi/kM6
         w3GnUT/Am2Mlp0JXhEGrIYCsJGE+w7lIyMmzuZwSHVzzD4D3oNS1+a8Sdcw2Wt97ahun
         QO6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MyQMRgrRRtBuBRaMJJ8Zm89RkSug1TwSfRjxwE6LfEk=;
        b=NYg2hh+JFyQWwdcUoJAjtmAJIddo2VCZ7maxH3l6jMUxx3LhkPqlpKriGWu1p2caKB
         h6nXsxIC9g+mcifCy7jHxua6VB3MzTcLsPNrUbwTUgzbA3ZQ+LugmnzZ1vm1sRQVDPHV
         lH7u6A9X2Je/kiaQQvV/p2AMm7+5Fn9e9ZXSgUv8EWNphEARwZZegVCGWFuyExlcoVsO
         jLyQEZWR8Bqy2ikVsRhQ19V74mHaEXSHnxx4wpHUiZnyguUI9+Apf1F3OSaESag0ptUT
         jcXwzATWcB9CKmdExYDeAZata7pBeAIt2Zuo/h2B560y2GXz+ISTKZptVn+0BlUYAoeI
         XS9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q0Cut2wm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fy27-20020a05622a5a1b00b003a98535c543si2529527qtb.515.2022.12.20.03.04.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 03:04:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q0Cut2wm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7aPJ-0000ik-Di; Tue, 20 Dec 2022 06:03:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aPG-0000hx-VG
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:03:34 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aPF-0002HH-1k
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:03:34 -0500
Received: by mail-wr1-x42b.google.com with SMTP id i7so11353792wrv.8
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 03:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MyQMRgrRRtBuBRaMJJ8Zm89RkSug1TwSfRjxwE6LfEk=;
 b=Q0Cut2wmR9oBCCzWT5DAOFNRC8FUk6WgBGMlJZpOPD34TpOoUo3oDx0Xwtm2I6dC+s
 wt51Ptf/FIWQJ8XqLie/exdfPbwkquYWB9tELzDCKeF/a+Q+FwZ0OjGPkIP4UmR+Va4p
 HfAvUsCF18YsJ6aH+jLLk/0BXsZR0xNN7kkz2fXosSaBIeNCcTX2nLTmmmGih5ikAJ15
 Pyo53I8+DJXi45a6Vd82mtowG+5GxRNUsDTaL0+7R1gtOk24t3xdILVT5t5LIXivX6UY
 77agTD4GEFosHtK+twOpJ9O8K9tfONhRh8sNdaiq4J5Pe9J++z62vCYiD0o8RHFdQXfM
 nQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MyQMRgrRRtBuBRaMJJ8Zm89RkSug1TwSfRjxwE6LfEk=;
 b=ShiPrxpgU5c1OVaRn5+UPJzUWiJ95H1jRBFCjT6aP47JCBWhL/1WnusWdN7R2EVGVr
 93sv2f6XUbBwlOWWocp3E1L0pxl9W/iq+6JH9v2jH5fdvuK9BBhlxcT7MdS46jYs+0lb
 QMkwKrYakopJnDRBFq2FV79z81yqtz5gGiH72YjiJ7Hcfo+NcmfINTMxEvJE2bjIfYaA
 ngIU6AfC6no/y61/xtIKvjtNGUxjWfm/NZxo/9I9gVu4BDx0vjwKU7qeRtsEkjn4NNGU
 TNDopZl5PH0tj6cdYTUmHEhQ+p3KNP24B9IFeQXZa5npIEav238ktuxTMZbRqkNV8qKV
 J+bQ==
X-Gm-Message-State: AFqh2ko2hfNT1kryAKKGoyLSXdBixmJpEiDaz/ZrhnJXJKlw6A4rlDSg
 +3iFbjlsF3HAEryoJ5g+jtf2TmuLbC+qE2kt/fU=
X-Received: by 2002:adf:e78d:0:b0:268:2971:465f with SMTP id
 n13-20020adfe78d000000b002682971465fmr679925wrm.50.1671534211968; 
 Tue, 20 Dec 2022 03:03:31 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a5d4606000000b0022cc0a2cbecsm12248203wrq.15.2022.12.20.03.03.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 03:03:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Song Gao <gaosong@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-arm@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 3/5] target/loongarch: Restrict 'qapi-commands-machine.h'
 to system emulation
Date: Tue, 20 Dec 2022 12:03:08 +0100
Message-Id: <20221220110310.8656-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220110310.8656-1-philmd@linaro.org>
References: <20221220110310.8656-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: QOoVgzGhYhqO

Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
user-mode builds") we don't generate the "qapi-commands-machine.h"
header in a user-emulation-only build.

Extract the QMP functions from cpu.c (which is always compiled)
to the new 'monitor.c' unit (which is only compiled when system
emulation is selected).

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/loongarch/cpu.c       | 27 --------------------------
 target/loongarch/meson.build |  1 +
 target/loongarch/monitor.c   | 37 ++++++++++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 27 deletions(-)
 create mode 100644 target/loongarch/monitor.c

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index e7b0e12be6..0fb853d915 100644
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
@@ -744,29 +743,3 @@ static const TypeInfo loongarch_cpu_type_infos[] = {
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
diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
index 6376f9e84b..48a7eb7c40 100644
--- a/target/loongarch/meson.build
+++ b/target/loongarch/meson.build
@@ -18,6 +18,7 @@ loongarch_tcg_ss.add(zlib)
 loongarch_softmmu_ss = ss.source_set()
 loongarch_softmmu_ss.add(files(
   'machine.c',
+  'monitor.c',
   'tlb_helper.c',
   'constant_timer.c',
   'csr_helper.c',
diff --git a/target/loongarch/monitor.c b/target/loongarch/monitor.c
new file mode 100644
index 0000000000..6c25957881
--- /dev/null
+++ b/target/loongarch/monitor.c
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
-- 
2.38.1

