Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp990468eju;
        Fri, 15 Mar 2024 06:11:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXkGLbEI69ZXpLHXiQf/xKLrKwe/x/LdUNOFZZpPG1Df46tCvon//ZTFZTSWmI9advfj824oPaldKPqoLkTQdzCy+E7CVcA
X-Received: by 2002:aa7:d491:0:b0:568:a14b:5cd1 with SMTP id b17-20020aa7d491000000b00568a14b5cd1mr3549667edr.3.1710508289304;
        Fri, 15 Mar 2024 06:11:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508289; cv=none;
        d=google.com; s=arc-20160816;
        b=KWP/lMGrRYVQsyyEdUCaJyJobAFc/gVwKiDyObIfGOaQgitYj8/0+/ONHU8B2k73HN
         D1ZDUjs/LtFvanmLlNWRmdlkBxS+38pXRyFMrMhdROiQG8FyUnWganfYkFuXxOkikKZ9
         ziHWlQgwFDhLDdnCZlzI4arFv309lNxeG1MtG1wA683UWqmK1bv1jhkFxKZQ4oSRnlK3
         paK4isudQiWZSxawGQB/0+SaIg0H3KJimEJ5mWmlBsbhDeN83TJ6pXQ99Pw3gacj+BzM
         FoewxeiKX3RA44eYDjeq34AnMcBb+hyyJWUHXLhImgv19yVu0lA5vBaFbDJwE/JThJKf
         Duzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7krNd92WPqJ39NLap53W9GJe07xrMw6PHe3R7xrqxWM=;
        fh=9uB6G2+3wVG5TZ7bVXp7qBvRYfNvc5S6dattFURoaag=;
        b=C6hLd9qRjbFGHvJtMIA2dNfGHybL7ycdDsarTWYnlbSkL9z4M5vuz0FQJewsg5/o6a
         YQ5ULLjf8PK846tC1WMK2lAe8fu0bmLcuiUwGRpTTB+NRLmbcPcBkpqL+EHUtufvN214
         qRP5+aux5O8lLS4yIR2vv2LlWDjXcz1/M2wN86SD/OcrCImYo2mWMMWwCXGHyS8HwomB
         IBt2+IP4S/chMIEdd795tBwywMaTNimMUO+VnNM5OsXvouItcnyhXdnGAeEnsM9IQ12+
         J2mem0zwvYlwvOK93DH7qu0opG3B/Be7u0zLf+zkQq3QgN7hGfMiCfhnJtwQMHK7l2BI
         fkyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tYZSToKt;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bc21-20020a056402205500b0056812bfadb2sor1634205edb.0.2024.03.15.06.11.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Mar 2024 06:11:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tYZSToKt;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710508289; x=1711113089; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7krNd92WPqJ39NLap53W9GJe07xrMw6PHe3R7xrqxWM=;
        b=tYZSToKt4uHFOFXrWy5ghhHv68WWZ2wWOZ90p0IY51wtEJ5LJNvh+cnq6riQgNSg8n
         fZqRIOs69hbybBtkC4sPpQP0BCM6eeHN1T0cNw31cSWjmOepng9dfcxs2oboE19cjcGU
         1Hs2lkQQvqtxNy89Yt9mtxqnCwFdw2R1RJlXEai3QZH4Gbs01PQgNnVg17ZjpyiY27QQ
         idU4DsOi4C4AQlT9HGpyjy+rkGBfdcrR5CQNQe8Gs5vj5TpE+AjSLbiE4PK+QX/N77X6
         r0ULYLDvrPekD+qLP5u4Vl/OJppN9B+7IYgGskLTpGn6YZKXuCoEliARFv8snHiY3FgU
         qlHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710508289; x=1711113089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7krNd92WPqJ39NLap53W9GJe07xrMw6PHe3R7xrqxWM=;
        b=TuuZVqgtpDPUiRFowdZXBvx23c7k51Kp2q7a9oGm8Bw19EhabIev+mme9/quoVmhRW
         LpGFIsLUYT744kCr2DFDtEmVwEl1BIaJYSZoreyroxwzk4BZT/FaIuxp7ZbthuYEOBsM
         ZGGYqsw1C/Em0+uZivWD4++Yagt+4lp8xclKOT8fo41GACUDB6hLBM17lKyaRfSBUO0Y
         35v6Say4RcqPbvqzmzUpuFx+P4GxVAW1gcViohWYoJDEAinUu7kBKfMIsUdrSoEdiVkg
         5BS6VJuXfcZbJfgbR5QYG55bK5Vwl1hKYB8fxQoUYturvf/ZjeI5lhaB9ejokSmN/qAe
         e0sg==
X-Forwarded-Encrypted: i=1; AJvYcCUYOq+uq1TdTaKBvUl3xuDgYZLbOzCPdZ0tZcltlwxOJwil6q3SX77PkEASWhzKENltGxHs4PX6+VnOvh1yZQ1oVQaZ53T5
X-Gm-Message-State: AOJu0YxRYn3pVJzDdY1hT/ug9OQ5EV1xTi2uQba8bWM/eK3eZH6tn8Hi
	Xk/NFae74o1QKg5XVcWa91NCUzhMBmVznzWZZMXPPt2XmPTALIz0gZruKoYxK7xvLg==
X-Google-Smtp-Source: AGHT+IEb42cna/x04lM5DiSdhs0k3LjaIjnT6Wg5Bf0xjqY0TjKqIhJx4flZw37llsIVeEyPObqtng==
X-Received: by 2002:a50:8e03:0:b0:566:1952:afc4 with SMTP id 3-20020a508e03000000b005661952afc4mr8530918edw.6.1710508289058;
        Fri, 15 Mar 2024 06:11:29 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.145.26])
        by smtp.gmail.com with ESMTPSA id p15-20020a05640243cf00b00566a461e1ecsm1656368edc.73.2024.03.15.06.11.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 15 Mar 2024 06:11:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-riscv@nongnu.org,
	Anton Johansson <anjo@rev.ng>,
	qemu-s390x@nongnu.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [RFC PATCH-for-9.1 20/21] target/ppc: Use QMP generic_query_cpu_definitions()
Date: Fri, 15 Mar 2024 14:09:08 +0100
Message-ID: <20240315130910.15750-21-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240315130910.15750-1-philmd@linaro.org>
References: <20240315130910.15750-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: LHbUEWwhtI2I

Register ppc_add_alias_definitions() as handler so we can
use the QMP generic_query_cpu_definitions() method.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/cpu_init.c     |  1 +
 target/ppc/ppc-qmp-cmds.c | 26 ++------------------------
 2 files changed, 3 insertions(+), 24 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index d5e227a6fb..3b500c95a4 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7348,6 +7348,7 @@ static Property ppc_cpu_properties[] = {
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps ppc_sysemu_ops = {
+    .add_alias_definitions = ppc_add_alias_definitions,
     .get_phys_page_debug = ppc_cpu_get_phys_page_debug,
     .write_elf32_note = ppc32_cpu_write_elf32_note,
     .write_elf64_note = ppc64_cpu_write_elf64_note,
diff --git a/target/ppc/ppc-qmp-cmds.c b/target/ppc/ppc-qmp-cmds.c
index 528cc3e4af..267dd84718 100644
--- a/target/ppc/ppc-qmp-cmds.c
+++ b/target/ppc/ppc-qmp-cmds.c
@@ -29,6 +29,7 @@
 #include "monitor/hmp-target.h"
 #include "monitor/hmp.h"
 #include "qapi/qapi-commands-machine-target.h"
+#include "qapi/commands-target-compat.h"
 #include "cpu-models.h"
 #include "cpu-qom.h"
 
@@ -175,20 +176,6 @@ int target_get_monitor_def(CPUState *cs, const char *name, uint64_t *pval)
     return -EINVAL;
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
-    info->name = cpu_model_from_type(typename);
-
-    QAPI_LIST_PREPEND(*first, info);
-}
-
 void ppc_add_alias_definitions(CpuDefinitionInfoList **cpu_list)
 {
     for (unsigned i = 0; ppc_cpu_aliases[i].alias != NULL; i++) {
@@ -211,14 +198,5 @@ void ppc_add_alias_definitions(CpuDefinitionInfoList **cpu_list)
 
 CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
 {
-    CpuDefinitionInfoList *cpu_list = NULL;
-    GSList *list;
-
-    list = object_class_get_list(TYPE_POWERPC_CPU, false);
-    g_slist_foreach(list, ppc_cpu_defs_entry, &cpu_list);
-    g_slist_free(list);
-
-    ppc_add_alias_definitions(&cpu_list);
-
-    return cpu_list;
+    return generic_query_cpu_definitions(errp);
 }
-- 
2.41.0
