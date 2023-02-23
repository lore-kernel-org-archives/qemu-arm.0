Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp852391ejc;
        Thu, 23 Feb 2023 07:56:32 -0800 (PST)
X-Google-Smtp-Source: AK7set+S5gxZIkS+2GAcmO0suQNox/1N5aHv5XSScSQPi7xL7wn0TLHFL6KaHiyRLcV1zUzLljx3
X-Received: by 2002:a05:6214:518f:b0:571:698:eac9 with SMTP id kl15-20020a056214518f00b005710698eac9mr20341545qvb.18.1677167792450;
        Thu, 23 Feb 2023 07:56:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677167792; cv=none;
        d=google.com; s=arc-20160816;
        b=j4ih8ZR9jajLfosg+DiZJ6829W0sykhZbh3vkEqCsJlH/p9kGF/zDABeZCTIZxhW9T
         oAvBjjCT5pR/k+m0T6AwpTX6tszcKYvAFkddOo+J+wl17Ew6JZUF5IAsT6mA6dFYlDaj
         KnH8Ai+krWNb8cC4cn++JauQxk5EUQW16Y0b6fMot9k5ZPKv+1XH8qBZlhGPpPby2N2H
         ujRFWA4B8zdzDecX4WSSXBKtZ+/xHrwu1csuQ8gspaOLBnnFCoVi1EqnzdceaZTzrJ2s
         8vmT+0rQf+8UccqdUKJHVqm4wXdgTAM08fK9dkm9wparlUdCtZApuKCMdL316+KXYmHR
         v7Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=I08xnbCAg9THlmYOfaTYm5NT+g+TJhbsT75T9PCPFbc=;
        b=U22qfEfgzNE/UvNG/hxTA0WUgAdRrKk3jpOzzpCoM9jOd8tgzkXrssRmRzpKufRWtT
         VPmScdIKiqd8TNO90+rP0GT1D8Z72ABUeclSXgimCOPtx5TFnBSAaiE/nBnY0NODdtO9
         JeX5V/NyL0i9oF1A28FgcrBQ5FdZ1J+3V5A4cwQdnvfFM4W1gXoludtR49pwUQofYPGW
         lc43bzhr8mcbKEtIalxqWaRupwCWxk5OS2ZsnPvtGMJRr/Hlu1+CHp1CIe81I9qIoYoa
         6lriLVwlj7bf1aqwcA7ogDcaUkVc82I8KBVg3ygMCWEM2AsxJodaxn97UQHgbEnhW8iS
         K5EA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iqCzEfcT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16-20020a0cf2d0000000b0056ec161bbecsi7657737qvm.550.2023.02.23.07.56.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 07:56:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iqCzEfcT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDx2-0005Vc-L1; Thu, 23 Feb 2023 10:56:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVDx1-0005Tx-Pu
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:56:07 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVDwv-0004OF-WD
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:56:07 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 l2-20020a05600c1d0200b003e1f6dff952so10973830wms.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I08xnbCAg9THlmYOfaTYm5NT+g+TJhbsT75T9PCPFbc=;
 b=iqCzEfcTqtj8SbW2sZ2v5aY5W47vSQ2ZGFxXz+kcncFlzHySWdHVIfbvvhs46wUOAo
 inbAVbX+vFl/OkcApjQ/tKizmHnZY7LqTinODyJSSEYHpc9HckAOSra4tGvozkT2yjT9
 FSNfXdXksPLvuL407CTcQm2JeQsCEj82IyXRUiWS7ZOmoG7xEu6rqSCu0qZW3kpacvoy
 jSvCj/4ShXdfZUgUzVk3KtvBUykYSow3EXkADfzg1tpMD3lypiRsTKvdzgist4gkRtpC
 BK2h3HfvyvCsBzi2iPZIsddLaiCOX+VJEn6fLtP53Yc7tujx5RTmT/iwFXwjINrzcd+V
 niZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I08xnbCAg9THlmYOfaTYm5NT+g+TJhbsT75T9PCPFbc=;
 b=WDtNp9S6glVVZIUXsHRGe3iE+LIX2rK6sq2rXL/ed06LT8Z589K3HImK0YL7qo39oe
 B8y8/3F0ovZzMtOyh3XxvTUq3TL4bY9Ug9j11VV+Xc9CQxpKrqWp6ZFIoz9LOES33rUI
 vD5XeCVDDQfxIXGM67xQdLobvoFQa4TVy0NJgNgY6hdnvXL0XfVklOQtT6xK245Um9QB
 ZiZHBWCOgxN60p69i9hj2AXC9zP03TaSlBr/RtC2vRo3Avb/LJ8cVDEbJTpTZuryacKc
 Ih/X3AoRfDOH7xckKMZDd6tmK8w5DfW5qhs3uXle24Qxd24A65Y6D6EzCCb+6hl0aSaK
 VB5g==
X-Gm-Message-State: AO0yUKWNbil5OvEeRW1c8tDwCheFqDNt/OfjdwiMA0nONqnUQHjXXAi0
 jXPF06NSj5rMqbVDCQGAdWFfnw==
X-Received: by 2002:a05:600c:929:b0:3df:e6bb:768 with SMTP id
 m41-20020a05600c092900b003dfe6bb0768mr8601117wmp.24.1677167760098; 
 Thu, 23 Feb 2023 07:56:00 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a05600c4f4600b003df245cd853sm14571119wmq.44.2023.02.23.07.55.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Feb 2023 07:55:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 3/4] target/loongarch: Restrict 'qapi-commands-machine.h'
 to system emulation
Date: Thu, 23 Feb 2023 16:55:39 +0100
Message-Id: <20230223155540.30370-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230223155540.30370-1-philmd@linaro.org>
References: <20230223155540.30370-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: bwxUIEKApO8d

Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
user-mode builds") we don't generate the "qapi-commands-machine.h"
header in a user-emulation-only build.

Extract the QMP functions from cpu.c (which is always compiled)
to the new 'loongarch-qmp-cmds.c' unit (which is only compiled
when system emulation is selected).

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

