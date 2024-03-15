Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp990369eju;
        Fri, 15 Mar 2024 06:11:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVzHxDdBLqrhre2z1WImia1JAXxKvU5Uf0H2EIxr9D/K34wJLMOF4BESYEyuesynhjOlPTcO9ZZDW0VYNx+CCoNdkbV2oSB
X-Received: by 2002:a05:6402:2411:b0:566:b442:16cf with SMTP id t17-20020a056402241100b00566b44216cfmr3609871eda.13.1710508282850;
        Fri, 15 Mar 2024 06:11:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508282; cv=none;
        d=google.com; s=arc-20160816;
        b=L5WUNnjIQgevTdtHL8FXcewh6r8JxbdRV9gXyTqFmY/NXAjrgEKUvUFBaGB9e6qohJ
         IXftP4rANXeBNaXITsuElzfv5+Dm46TcLbZtkzvnroVOkv6RSpHq1DtQEu21ZKhbfKiZ
         A2PJOyPAsPyzhOBVi9Oml6s252hiRI3nNOoHPsrvANXKBe7sgG5K0xVw3FTqa26HVVY2
         RdcN1RRQqQ1XFl93vKvuh/bFBDhu/WDr7uet+Ifo3uDP4jZD8V/gSEaIrRz3Ar5ailcv
         jR0NZ7F6m4izUTPPRhixUdxULqq9uA6Yr7rMSIvYDKQcPRyOnCSiakb6Y0zezkj3cHMm
         P8tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JlSnNkdCGhkGJY+zh070ayuUxIbMNrgyLxLLZYypnXY=;
        fh=QuHV69ou5r5fAAfBpaWI/KP9LPQgyuvceX1WY4smLZY=;
        b=VjCvGimF+C7usVqIRhpcL873ggrLXahesyX8qqrG9BS5bhsEvnvNxmWtwwzoKnLRlq
         XsqXRsJIhWvROfSAmBFTgcFY4tJ4o9GzhhkUVe7kEdFMIURGRMCQI9p7g/k3vr4bkzcC
         y92LSI+z4nUEgBITS6bwLOEgXSGLVFNkbGORHJUwigmyUgGTgcOrjV4ubHJywdIWcN7B
         pQq4InsZ17Zq9TZg3M/samCH0p+/QXwWMhH5gRryN3O/rdTFwpltyEdxFfejpSMXUopK
         1QB+n9JGwOV5UydIKWJLJGrXUomGH8Wt+bMmwvNfCqXRoiy7tMGSFTRRFHDtBxW9Qr+b
         SYiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IAm9aqd2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a20-20020aa7d754000000b00568b7e8e772sor108503eds.8.2024.03.15.06.11.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Mar 2024 06:11:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IAm9aqd2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710508282; x=1711113082; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlSnNkdCGhkGJY+zh070ayuUxIbMNrgyLxLLZYypnXY=;
        b=IAm9aqd2GCJQwp0/qFPSADOoz5ksFcNY/3KTpW+Abqb9xpLR4oak0w3UEWM95tjA87
         BZkXaZrXGr80eyVJgGU8zW9tqInHcJ7uhep+c9vmlZ8fCAqFYnyXUpgseNd6tDz2vbac
         NBqtHCiylAJ+xNrTqlmpeGCB1CjV9cpBhJo6j9SVMvixNeB064hTvMGII77t/iGFw72q
         HTgTWW/oAWtcpoWTwtk7QKErd5MonJcKoAquZifqd/9abmsmWOVMsG6c6B8NR2CizAj/
         uOoCqVbGTO6x1bVib/pm7DlVKIiwwJ5/drTrDQvgEMqaalqgaV0Hfr5huBNqtvkHQpa4
         8z4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710508282; x=1711113082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JlSnNkdCGhkGJY+zh070ayuUxIbMNrgyLxLLZYypnXY=;
        b=U5aFjpkgvYkXkG+pSn5msc1Ox38V7uTRLbtL/3ScU5MBkLSil4VcgE3mCFL5cDVpcx
         QAszRk3xqQ9Hpd9ew90wyzTya8l952Ng6Wz/Sg3loQaYVamYY2ll3eNC17XPsIyNc5Cz
         izCcqySKWws4z2HLHe8Q/5T0KQMN5M5rzqlw6kjwAVF+tJNxiTqb3kZJFTxmmbLuIiqx
         iJWbD6MEwnAfS3asyVqaG5TfMDia5hh9g0w/iMiksCTB0mWl4kCC34IBC3sFKHXuGN30
         wuv+TNKVkRT+aY7epFvm60ROGsI7PxLlRQh/UEjIp+abF+64yTcPdserECv7cCQ7NaO9
         VyFA==
X-Forwarded-Encrypted: i=1; AJvYcCUCpERWtrvG33iaCrBiw0m1aiacfHRptHiC5i8NCORG9J7gcRonNsR4JzwSbu5H3BmnrLZbtbAKgvk47QnhKHlwlXZq1kRX
X-Gm-Message-State: AOJu0YxrF1tlm1IBW9ZwVAN/wby8PxUnkGil1g1K7fX+Cl+laiNJYF3b
	Jf5TAKJlnZMgZd8jZdWfaZp0WJfoyWEfETZaokQX6FSwrqSTH6U/V+8VPj9rvd7MEA==
X-Google-Smtp-Source: AGHT+IFr5RaqknL50rJ/ULGqKtzSQvYODwR3uxqq5WvgAEMCCYd8EWNHRLvED+eSeGFqUTaVtHbaiA==
X-Received: by 2002:a05:6402:3819:b0:566:ff31:7974 with SMTP id es25-20020a056402381900b00566ff317974mr2662833edb.34.1710508282572;
        Fri, 15 Mar 2024 06:11:22 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.145.26])
        by smtp.gmail.com with ESMTPSA id er18-20020a056402449200b0056899fc9a94sm1673226edb.12.2024.03.15.06.11.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 15 Mar 2024 06:11:22 -0700 (PDT)
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
Subject: [PATCH-for-9.1 19/21] target/ppc: Factor ppc_add_alias_definitions() out
Date: Fri, 15 Mar 2024 14:09:07 +0100
Message-ID: <20240315130910.15750-20-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240315130910.15750-1-philmd@linaro.org>
References: <20240315130910.15750-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 700p6BTkIVrZ

Factor ppc_add_alias_definitions() out of qmp_query_cpu_definitions()
to clearly see the generic pattern used in all targets.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/cpu-models.h   |  4 ++++
 target/ppc/ppc-qmp-cmds.c | 26 +++++++++++++++-----------
 2 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/target/ppc/cpu-models.h b/target/ppc/cpu-models.h
index 0229ef3a9a..89a5e232b7 100644
--- a/target/ppc/cpu-models.h
+++ b/target/ppc/cpu-models.h
@@ -21,6 +21,8 @@
 #ifndef TARGET_PPC_CPU_MODELS_H
 #define TARGET_PPC_CPU_MODELS_H
 
+#include "qapi/qapi-types-machine.h"
+
 /**
  * PowerPCCPUAlias:
  * @alias: The alias name.
@@ -480,4 +482,6 @@ enum {
     POWERPC_SVR_8641D              = 0x80900121,
 };
 
+void ppc_add_alias_definitions(CpuDefinitionInfoList **cpu_list);
+
 #endif
diff --git a/target/ppc/ppc-qmp-cmds.c b/target/ppc/ppc-qmp-cmds.c
index a25d86a8d1..528cc3e4af 100644
--- a/target/ppc/ppc-qmp-cmds.c
+++ b/target/ppc/ppc-qmp-cmds.c
@@ -189,17 +189,9 @@ static void ppc_cpu_defs_entry(gpointer data, gpointer user_data)
     QAPI_LIST_PREPEND(*first, info);
 }
 
-CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
+void ppc_add_alias_definitions(CpuDefinitionInfoList **cpu_list)
 {
-    CpuDefinitionInfoList *cpu_list = NULL;
-    GSList *list;
-    int i;
-
-    list = object_class_get_list(TYPE_POWERPC_CPU, false);
-    g_slist_foreach(list, ppc_cpu_defs_entry, &cpu_list);
-    g_slist_free(list);
-
-    for (i = 0; ppc_cpu_aliases[i].alias != NULL; i++) {
+    for (unsigned i = 0; ppc_cpu_aliases[i].alias != NULL; i++) {
         PowerPCCPUAlias *alias = &ppc_cpu_aliases[i];
         ObjectClass *oc;
         CpuDefinitionInfo *info;
@@ -213,8 +205,20 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
         info->name = g_strdup(alias->alias);
         info->q_typename = g_strdup(object_class_get_name(oc));
 
-        QAPI_LIST_PREPEND(cpu_list, info);
+        QAPI_LIST_PREPEND(*cpu_list, info);
     }
+}
+
+CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
+{
+    CpuDefinitionInfoList *cpu_list = NULL;
+    GSList *list;
+
+    list = object_class_get_list(TYPE_POWERPC_CPU, false);
+    g_slist_foreach(list, ppc_cpu_defs_entry, &cpu_list);
+    g_slist_free(list);
+
+    ppc_add_alias_definitions(&cpu_list);
 
     return cpu_list;
 }
-- 
2.41.0
