Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp688032ejc;
        Thu, 23 Feb 2023 04:44:45 -0800 (PST)
X-Google-Smtp-Source: AK7set8W5/rX7QFQB9JzT1ncFC9CZhxw5JGcRGXqC2viBQ4YaJ33KDU11l1rjjcT4EwdwtdNoHt/
X-Received: by 2002:ac8:5e0a:0:b0:3b3:7707:9b92 with SMTP id h10-20020ac85e0a000000b003b377079b92mr3884688qtx.15.1677156285116;
        Thu, 23 Feb 2023 04:44:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677156285; cv=none;
        d=google.com; s=arc-20160816;
        b=U2l54uercCLrhrP8kvayl9KQrnVB4o+rEL6J3w5CYsuGDpIHnHuCmItXTaVXRLIpuE
         sbdmsm3g3q1ONVVHwF1iy8zRpWjv78GMeFY7C9cJfqtG7Q8TJYsHgJ3V44D5jmqVwWJy
         yzf6NU0IokVQAaBVjAGaRTC5IFh3xxmH2gw8kycSzBBfRT25Mfx/KZqHKSzpTfX1Zqqa
         dWyDe9WZwqRyiZEe3kb0D5nkkG/7Bi9Lz4uyb73a3jPxJp82khLWF6vocziZ9JmqAewU
         YhiW7efAR7FtU3gbmZdZT4/ClRLgcKQ4/HxI9w0LNLz+5g4oTYvc/X26SrW+fDQ0leJL
         HZWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kk8+WybWrT+4XbLQ/Ff9Tr3FqtmYJrKEElH7cekw4R0=;
        b=a9tVTDzD6VywC+S80Nx/sTyMKayHjXoeJxnklIsaF60xxnqSLFClpzmwSM7z9TTz7f
         V2n+ItebIx8XGq1SDZbh/l8fyuNxWO8LcVXmL99wP/91v+yeKC0S4/ctfEZiipxPCZAf
         cqRIc13E8/POA0JwMZIHVJ7v6Z7XoQS3nR/0DtoQw8vAvD1sJz4oUzwwZHiVYpT2qOBP
         7TrBOXKy6prh3nxH/3QstGA9IPwzsAdgbQMpa/Rav81r7fNMKb9R00PHe0qOSDPW/7OC
         POE1jLdH+YyiaWLu0T5mv0Ygyk/vxgiY9M5bQbrdPA8c8PGiv2ghPBwfJ8+CwwBixMX8
         eBXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a2qMwwko;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14-20020a05622a048e00b003b86578a40csi4334057qtx.482.2023.02.23.04.44.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 04:44:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a2qMwwko;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVAx0-0007ZB-Iq; Thu, 23 Feb 2023 07:43:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVAwz-0007Yl-Go
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 07:43:53 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVAww-00031n-43
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 07:43:53 -0500
Received: by mail-wr1-x42e.google.com with SMTP id l1so10299744wry.10
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 04:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kk8+WybWrT+4XbLQ/Ff9Tr3FqtmYJrKEElH7cekw4R0=;
 b=a2qMwwkoCD5+cQfHxOYFVbIYvYsjXNsQEhoN1F/q7QPnU9kK2nycXp+NxlCAHhAQxL
 t9it53jvpJrdaPk8+azlsvTXGn9cvLfQPqOLeOCPaQrH2656p1VnGLcGxKTft0nAKELp
 EsNQb88k71slbvwGKck5p9rsAS+U0mdLn4EOIdHUMdKn8i5LtJpyp+WW5303MvD7D85n
 nYqTzX5Cew03VdMvW7M6eST136jy8PK5SGel8JtKErWOsaD1HJXizSoUrmeqpburzuwD
 NMT52TdM5UdAlNhnuMHcr6TAxzinV2RWWhsH6PZErtwtRrpo8oGRVz0jrlcwCxMvx9Bx
 B4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kk8+WybWrT+4XbLQ/Ff9Tr3FqtmYJrKEElH7cekw4R0=;
 b=e/BRXWu8JZG2TZBf5FXsu94E7NvhgKB2Tzu+3dPrpr7qQQ2aRaEK4GR+624XKx4E02
 PdfwaDRnkDnfj/k5pQ+3tgLF4tktnxsHjgbQJnRCxUo9exXDdjexp9dNY5Vmiu4nKahq
 jsaoJGw1RRl2ZhZvGNeeRDJUcPX2ak2PcggVDlhRqdR7Bhl2DIg6+Cb5TOiX2Z26Ab9j
 8Nb1bdCqd+AWAH/Jn12RSyASZOfO4Y6pzyKCPhw5VYvxZfR+xx9N3KE9un5o170ZLSiq
 e6gmSr8cqiDap5GwajHG4DCFiZ1KsfJq7f84+ESaKgcsHqvgkFQsrHe7S51Ozs+1/vCC
 YKdQ==
X-Gm-Message-State: AO0yUKWOnV2PQlPbubMc7V2AeiXbiMhJXEHCSNb48pUyeyHpS4J5mirw
 kw+7iSoMPQwExmDaV2LnnUFqxA==
X-Received: by 2002:adf:e941:0:b0:2c7:be8:4873 with SMTP id
 m1-20020adfe941000000b002c70be84873mr4810717wrn.58.1677156228444; 
 Thu, 23 Feb 2023 04:43:48 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bl1-20020adfe241000000b002c54d8b89efsm10883913wrb.26.2023.02.23.04.43.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Feb 2023 04:43:47 -0800 (PST)
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
Subject: [PATCH v3 1/4] target/arm: Restrict 'qapi-commands-machine.h' to
 system emulation
Date: Thu, 23 Feb 2023 13:43:37 +0100
Message-Id: <20230223124340.95367-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230223124340.95367-1-philmd@linaro.org>
References: <20230223124340.95367-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Kbt21wOXAdB3

Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
user-mode builds") we don't generate the "qapi-commands-machine.h"
header in a user-emulation-only build.

Move the QMP functions from helper.c (which is always compiled)
to arm-qmp-cmds.c (which is only compiled when system-emulation
is selected).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/{monitor.c => arm-qmp-cmds.c} | 28 +++++++++++++++++++++++
 target/arm/helper.c                      | 29 ------------------------
 target/arm/meson.build                   |  2 +-
 3 files changed, 29 insertions(+), 30 deletions(-)
 rename target/arm/{monitor.c => arm-qmp-cmds.c} (90%)

diff --git a/target/arm/monitor.c b/target/arm/arm-qmp-cmds.c
similarity index 90%
rename from target/arm/monitor.c
rename to target/arm/arm-qmp-cmds.c
index ecdd5ee817..c8fa524002 100644
--- a/target/arm/monitor.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -227,3 +227,31 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
 
     return expansion_info;
 }
+
+static void arm_cpu_add_definition(gpointer data, gpointer user_data)
+{
+    ObjectClass *oc = data;
+    CpuDefinitionInfoList **cpu_list = user_data;
+    CpuDefinitionInfo *info;
+    const char *typename;
+
+    typename = object_class_get_name(oc);
+    info = g_malloc0(sizeof(*info));
+    info->name = g_strndup(typename,
+                           strlen(typename) - strlen("-" TYPE_ARM_CPU));
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
+    list = object_class_get_list(TYPE_ARM_CPU, false);
+    g_slist_foreach(list, arm_cpu_add_definition, &cpu_list);
+    g_slist_free(list);
+
+    return cpu_list;
+}
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 07d4100365..77eed96761 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -23,7 +23,6 @@
 #include "sysemu/cpu-timers.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
-#include "qapi/qapi-commands-machine-target.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
 #ifdef CONFIG_TCG
@@ -9212,34 +9211,6 @@ void arm_cpu_list(void)
     g_slist_free(list);
 }
 
-static void arm_cpu_add_definition(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    CpuDefinitionInfoList **cpu_list = user_data;
-    CpuDefinitionInfo *info;
-    const char *typename;
-
-    typename = object_class_get_name(oc);
-    info = g_malloc0(sizeof(*info));
-    info->name = g_strndup(typename,
-                           strlen(typename) - strlen("-" TYPE_ARM_CPU));
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
-    list = object_class_get_list(TYPE_ARM_CPU, false);
-    g_slist_foreach(list, arm_cpu_add_definition, &cpu_list);
-    g_slist_free(list);
-
-    return cpu_list;
-}
-
 /*
  * Private utility function for define_one_arm_cp_reg_with_opaque():
  * add a single reginfo struct to the hash table.
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 87e911b27f..6d1ac4c471 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -59,8 +59,8 @@ arm_softmmu_ss = ss.source_set()
 arm_softmmu_ss.add(files(
   'arch_dump.c',
   'arm-powerctl.c',
+  'arm-qmp-cmds.c',
   'machine.c',
-  'monitor.c',
   'psci.c',
   'ptw.c',
 ))
-- 
2.38.1

