Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp687975ejc;
        Thu, 23 Feb 2023 04:44:38 -0800 (PST)
X-Google-Smtp-Source: AK7set/1V8T+NrEzs5tpUI6Xs3f05kMn+5eaHefmozjb+AJZCdjb7L/qm8neYBwCW6dMaPHEJRwP
X-Received: by 2002:a05:622a:5:b0:3bf:a72f:d0bd with SMTP id x5-20020a05622a000500b003bfa72fd0bdmr12200473qtw.3.1677156278612;
        Thu, 23 Feb 2023 04:44:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677156278; cv=none;
        d=google.com; s=arc-20160816;
        b=z0pvEwbO6euNMgrtecU1rtKvbWpyEI8D5P4zMh/vhKG/K/flczEu+Pj8gz/JCkvmrZ
         3KUwf5t7euJVnWoUdzCEKinkdfXL3d5OWciiItP1eH2cf5IgT3XBvqaBX274t9Ss4AWZ
         FVFqkxDRbQAAKz8TCBCfvtVbYouoGRKIMa7MB/7wpYxVf/Y8Nk3/MzKMSCukTkMKi8sJ
         qiz6h0aqcG9coQFN4l9G67ETHEory7rfK61M/7SsSr6z3dS7t9hLIDQra9/m0Oy6ML+D
         +EFwb5tt2UpgYtSKwllytZntOQF6wwqhApV3/Dt6Zdqxg/7B82K0foi06jUPEu7fWMtY
         kktg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qtEwrwiZiBlfPqk1KEi8MCm+IMA1ZynfZmqmAy1Ob7k=;
        b=vN70Fb70IFonXJLude05dx+WPCdwebwFmYSxe8K+S9DIVGSpovpuxx4F+BoX4apok3
         Nb+bqGUmCKRC+FzQK+ps/cI3CyWwbtiG2vhvjOm5vCUAOs62BhLKbJY/o3uicPBJM1Cm
         FF7J2pKI/DY6l4JlKmQO8xI1a2k+C72fxOyv8CjYL+Dwy39B1o6VS4/HmhKDjnpBI5rP
         HKQEF1ALSOsna2oibtW2gqghOaZj8pZLj0zv4UISn9p3YIc4vcLzrjTeg7QfU6dH6C6S
         9VqW1GBIUTVHLgEfFw6WGLjsTdYkEQVC8ezdHCxw3W0O/Mqxlz1e/HubQKMry+mKd87M
         WHRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zzyI2Ait;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k11-20020a05622a03cb00b003bd07be14b6si4725201qtx.190.2023.02.23.04.44.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 04:44:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zzyI2Ait;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVAxG-0007g4-D6; Thu, 23 Feb 2023 07:44:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVAxF-0007fX-1m
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 07:44:09 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVAxD-00034z-2a
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 07:44:08 -0500
Received: by mail-wr1-x42d.google.com with SMTP id bt28so3921901wrb.8
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 04:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qtEwrwiZiBlfPqk1KEi8MCm+IMA1ZynfZmqmAy1Ob7k=;
 b=zzyI2Ait5ebup8A2+GYN3I4d5GlhPEHdZPopQDcUJbQKK8g86fuh7afmTPzl8M6eVY
 ysN+2eL5hoGcqTTYS9MX+nSXqNTbs+XOELBfUkZjzrm6BNaP1dgbGwy8T1D1Ov+J7j7e
 6iSWsodIZ9uaL657YyJHsi5ZSWXylutgEhITlnVig1rqx9mRekiKTjVaNdVU6LqC5OSH
 /Q5M+JyUcKyrDhYBUvLJzcT3d0HdPZREKArqEm0EX11LSZJLP3i29BtufHi0kIB0w6U+
 /lyrHDnVcNwUpgLSCM3EHeN5+x9efb110bhspCXH531QEgk1y81adlDNdDVG9w550k7d
 AhOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qtEwrwiZiBlfPqk1KEi8MCm+IMA1ZynfZmqmAy1Ob7k=;
 b=El2Rf2VHCS1geIOzeUwNlX62IMilMZYxEqP6OltTglNN9N9ZNXO88uKqJ3vM10615A
 IFLjCr9ype4vvRPJq+lV4DoF4Czl4OUshXMeb+5xtM+vnV0w0CnXwhPLVP789gQjMqM6
 Gj5K8byN/eXcLulT1zJHbtweU9mKKh3Nb1lCaiJvkSQWAp9NJdFrj8m5EKhyaLg/OCrx
 GL1l2TQpnz+pIzrnSgcD4bygAx7DQYXdHqqKzXXtS/osWb2tdXa3Yx5JWN8X7v1DqlCW
 hKplP25YRbMJ9yBDD32YHbKB7hWXAZAIMYnYmzRPaDfXvxUJFM1rjDbETMpmhIi34dUp
 vJYw==
X-Gm-Message-State: AO0yUKVeAyAcMNqmvrLvSuPBlmLdjDwvt3mtkSiKxroXtUUjE4IUs/J7
 f2q6fySlh+oIq8cXdZCZOJH9PA==
X-Received: by 2002:adf:dece:0:b0:2c5:544b:8e64 with SMTP id
 i14-20020adfdece000000b002c5544b8e64mr10153121wrn.71.1677156245518; 
 Thu, 23 Feb 2023 04:44:05 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a5d4ed1000000b002c4084d3472sm6961029wrv.58.2023.02.23.04.44.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Feb 2023 04:44:05 -0800 (PST)
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
Subject: [PATCH v3 4/4] target/ppc: Restrict 'qapi-commands-machine.h' to
 system emulation
Date: Thu, 23 Feb 2023 13:43:40 +0100
Message-Id: <20230223124340.95367-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230223124340.95367-1-philmd@linaro.org>
References: <20230223124340.95367-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: i+Eu+MroITRP

Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
user-mode builds") we don't generate the "qapi-commands-machine.h"
header in a user-emulation-only build.

Move the QMP functions from cpu_init.c (which is always compiled) to
monitor.c (which is only compiled when system-emulation is selected).
Note ppc_cpu_class_by_name() is used by both file units, so we expose
its prototype in "cpu-qom.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 target/ppc/cpu-qom.h                     |  2 +
 target/ppc/cpu_init.c                    | 48 +----------------------
 target/ppc/meson.build                   |  2 +-
 target/ppc/{monitor.c => ppc-qmp-cmds.c} | 50 +++++++++++++++++++++++-
 4 files changed, 53 insertions(+), 49 deletions(-)
 rename target/ppc/{monitor.c => ppc-qmp-cmds.c} (78%)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 0fbd8b7246..9666f54f65 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -31,6 +31,8 @@
 
 OBJECT_DECLARE_CPU_TYPE(PowerPCCPU, PowerPCCPUClass, POWERPC_CPU)
 
+ObjectClass *ppc_cpu_class_by_name(const char *name);
+
 typedef struct CPUArchState CPUPPCState;
 typedef struct ppc_tb_t ppc_tb_t;
 typedef struct ppc_dcr_t ppc_dcr_t;
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index abee71d407..d62ffe8a6f 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -40,7 +40,6 @@
 #include "qemu/cutils.h"
 #include "disas/capstone.h"
 #include "fpu/softfloat.h"
-#include "qapi/qapi-commands-machine-target.h"
 
 #include "helper_regs.h"
 #include "internal.h"
@@ -6841,7 +6840,7 @@ static const char *ppc_cpu_lookup_alias(const char *alias)
     return NULL;
 }
 
-static ObjectClass *ppc_cpu_class_by_name(const char *name)
+ObjectClass *ppc_cpu_class_by_name(const char *name)
 {
     char *cpu_model, *typename;
     ObjectClass *oc;
@@ -6981,51 +6980,6 @@ void ppc_cpu_list(void)
 #endif
 }
 
-static void ppc_cpu_defs_entry(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    CpuDefinitionInfoList **first = user_data;
-    const char *typename;
-    CpuDefinitionInfo *info;
-
-    typename = object_class_get_name(oc);
-    info = g_malloc0(sizeof(*info));
-    info->name = g_strndup(typename,
-                           strlen(typename) - strlen(POWERPC_CPU_TYPE_SUFFIX));
-
-    QAPI_LIST_PREPEND(*first, info);
-}
-
-CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
-{
-    CpuDefinitionInfoList *cpu_list = NULL;
-    GSList *list;
-    int i;
-
-    list = object_class_get_list(TYPE_POWERPC_CPU, false);
-    g_slist_foreach(list, ppc_cpu_defs_entry, &cpu_list);
-    g_slist_free(list);
-
-    for (i = 0; ppc_cpu_aliases[i].alias != NULL; i++) {
-        PowerPCCPUAlias *alias = &ppc_cpu_aliases[i];
-        ObjectClass *oc;
-        CpuDefinitionInfo *info;
-
-        oc = ppc_cpu_class_by_name(alias->model);
-        if (oc == NULL) {
-            continue;
-        }
-
-        info = g_malloc0(sizeof(*info));
-        info->name = g_strdup(alias->alias);
-        info->q_typename = g_strdup(object_class_get_name(oc));
-
-        QAPI_LIST_PREPEND(cpu_list, info);
-    }
-
-    return cpu_list;
-}
-
 static void ppc_cpu_set_pc(CPUState *cs, vaddr value)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index 79beaff147..7929de8360 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -39,7 +39,7 @@ ppc_softmmu_ss.add(files(
   'machine.c',
   'mmu-hash32.c',
   'mmu_common.c',
-  'monitor.c',
+  'ppc-qmp-cmds.c',
 ))
 ppc_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
   'mmu_helper.c',
diff --git a/target/ppc/monitor.c b/target/ppc/ppc-qmp-cmds.c
similarity index 78%
rename from target/ppc/monitor.c
rename to target/ppc/ppc-qmp-cmds.c
index 8250b1304e..36e5b5eff8 100644
--- a/target/ppc/monitor.c
+++ b/target/ppc/ppc-qmp-cmds.c
@@ -1,5 +1,5 @@
 /*
- * QEMU monitor
+ * QEMU PPC (monitor definitions)
  *
  * Copyright (c) 2003-2004 Fabrice Bellard
  *
@@ -28,6 +28,9 @@
 #include "qemu/ctype.h"
 #include "monitor/hmp-target.h"
 #include "monitor/hmp.h"
+#include "qapi/qapi-commands-machine-target.h"
+#include "cpu-models.h"
+#include "cpu-qom.h"
 
 static target_long monitor_get_ccr(Monitor *mon, const struct MonitorDef *md,
                                    int val)
@@ -172,3 +175,48 @@ int target_get_monitor_def(CPUState *cs, const char *name, uint64_t *pval)
 
     return -EINVAL;
 }
+
+static void ppc_cpu_defs_entry(gpointer data, gpointer user_data)
+{
+    ObjectClass *oc = data;
+    CpuDefinitionInfoList **first = user_data;
+    const char *typename;
+    CpuDefinitionInfo *info;
+
+    typename = object_class_get_name(oc);
+    info = g_malloc0(sizeof(*info));
+    info->name = g_strndup(typename,
+                           strlen(typename) - strlen(POWERPC_CPU_TYPE_SUFFIX));
+
+    QAPI_LIST_PREPEND(*first, info);
+}
+
+CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
+{
+    CpuDefinitionInfoList *cpu_list = NULL;
+    GSList *list;
+    int i;
+
+    list = object_class_get_list(TYPE_POWERPC_CPU, false);
+    g_slist_foreach(list, ppc_cpu_defs_entry, &cpu_list);
+    g_slist_free(list);
+
+    for (i = 0; ppc_cpu_aliases[i].alias != NULL; i++) {
+        PowerPCCPUAlias *alias = &ppc_cpu_aliases[i];
+        ObjectClass *oc;
+        CpuDefinitionInfo *info;
+
+        oc = ppc_cpu_class_by_name(alias->model);
+        if (oc == NULL) {
+            continue;
+        }
+
+        info = g_malloc0(sizeof(*info));
+        info->name = g_strdup(alias->alias);
+        info->q_typename = g_strdup(object_class_get_name(oc));
+
+        QAPI_LIST_PREPEND(cpu_list, info);
+    }
+
+    return cpu_list;
+}
-- 
2.38.1

