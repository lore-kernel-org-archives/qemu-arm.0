Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp989302eju;
        Fri, 15 Mar 2024 06:10:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVtDXBjkEY5N91c/OWZ0Y6fC2UeuDyA65hC9yz2JMHyCpOc/6OzA2PS/UXQT/8lMBNhiMC3Hlpq9zTaAI+w6uB3Xm3x72tC
X-Received: by 2002:a2e:be0f:0:b0:2d4:714b:4c5d with SMTP id z15-20020a2ebe0f000000b002d4714b4c5dmr3026258ljq.44.1710508201017;
        Fri, 15 Mar 2024 06:10:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508200; cv=none;
        d=google.com; s=arc-20160816;
        b=S7P9ygTOHAh4HTUe5pFpMs9KVLhcMMbX76ApfIfv9oOK7n7KlowbVYbibZC8rWWeEH
         snc2q7alnWCRD9QE2iNfXxqkNw+VPP7dCv1Ftb5A1vFRVhIH8hxYtn0xU0nwiMeTm61T
         MRG6NDfrRQCvdLXOxmjyyuG/qmmlnLOCbguMzTFfoRod9rQHFY+++axQsHLHquYQoD5a
         0RxHWUaC4XLdEK0iKnrwyAsQZdTzehL1H4wXXLVjSlc/6ZKFmG4wttQiwqFwGYvq4Ej9
         ByXOQJWkuJXxurXiBxoS9J+qpYECl+xtGM53OGSnMtznawRbeLdAmgM3amhe6IrLMSCm
         5frQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fQB6SJNy6yiy7zdv0lmI6ciVyOB2Uy024AmMoGafIwE=;
        fh=uGDXzmKbmjlSe9dUq8jUXPnibTrwFrON6Pcrsns2IVs=;
        b=od6xsi3VTt9+6zY9P9ju8kMntb4hJLE3AmNBkmSR6Zz6YrY4HiTPhU0JiDBOHPZbK9
         lxKZSaqrSWeb+7slC0CNkV607QuZ9UJ0xIekpbN9fN7gKkDLGG7/qHeVMipGtuinus+7
         Q2RM3dPDwEKN4aU1gplQd9FZZHBwvYXD2csvMDbB+tfrtcS1gtNr8c3JsXyp4pe7Yi9k
         Q6u5O4UKaOEKmR8ITefl2XN6e0OCba/yGhwiUvuuuoWKorfdQQQ3+mb3/s9XMIqDe44L
         9XRAwjk8RhXdjZqevP01jxxjP4rctpe48js3X5eq0F/fVwY9Aoos4oVdVUCNMilMzlrp
         iGLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qrXK0rET;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id dv19-20020a170906b81300b00a45f5f775bcsor953420ejb.18.2024.03.15.06.10.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Mar 2024 06:10:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qrXK0rET;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710508200; x=1711113000; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQB6SJNy6yiy7zdv0lmI6ciVyOB2Uy024AmMoGafIwE=;
        b=qrXK0rETo46aw5uEJ7PsCn+lSUMJ3DvYrjupeRSu+QhxU43STkUaTizHVMGwdKfhI3
         yYAwydMl+KJq3ZrEhnyzx2LHcYULFR43swiLnHsJqPgTbiiOJiQ90p5XJcLc+bTXidtu
         DZHxSuNXjbNcadbS7Lc56o6r1pV9PmLBpFbYAHtjjoMBtTkTntOHtqijwWfTpmCmfzYX
         WwDjihAyck18CMbuXgk7GSXjxSsf2e7ePCy/rrPGCqPSu7duHVD+th2QkyyBN6CByvAa
         E07MSmASekYBmzeovJhHxO/2kLyOHm26GANBrzbdLH59mpm0qrSmG7jTg4rCypqs77Kt
         eEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710508200; x=1711113000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQB6SJNy6yiy7zdv0lmI6ciVyOB2Uy024AmMoGafIwE=;
        b=OrfxsX6XTgpsSeaF+BdG09GHzWo03R9BjrIS5Lumsv5h7ydJgmJGyiaeQdT9MiFYrM
         St3FVOSueuZGv1m+p69VJraWOPqD9eR2HTh7cOTqwJjcaS6fRojB5Bqzo4t7dFkO84Yg
         VhEZB/pvrg+SLTQzsSqcZBY/fNF9gajoyoAP3xi4pcLiRNe93F0v/aC1VyGRIzNfA9i/
         EY4dfyXd2vEF4GboFAcE4OgNUo+wj4ESSFvGWNecSlTQaMa1ny8/WxmN0+kj9b9A9DP5
         TYD8jLeo5YOqlBNlDhWxJ1lsWnRJiDOVzpOVmjbWMPDWR6i6XdgfGB40XXiaoYqSe3uz
         6Z/w==
X-Forwarded-Encrypted: i=1; AJvYcCXAVYPx2EH5KmuH9EmVKICKotptJmx14bxs7FlGFq6U4zhKwjALSfTnJ/aoJ5TjWQssf9I8N98sYEZX/shfDvoUgTswn4qW
X-Gm-Message-State: AOJu0Yx1+kUjypWKTgYEf0vl4/ty7ofjx7vz4jyE7CKxis3u+hBQXsj3
	CxjVGVwiI2MbhxCzU7GKewbjs/wU60VX4DTNHOTH1v2ubTLlAKzW/OVI+Vni2BtQmw==
X-Google-Smtp-Source: AGHT+IERNJD9BeD1ZTNKcgjKR1YrxbrTZMT90NVR2wKIdl/tZTRzhcTVHamLl8tpd/LjDM8xLQUvNQ==
X-Received: by 2002:aa7:dd0f:0:b0:565:b456:435d with SMTP id i15-20020aa7dd0f000000b00565b456435dmr2931558edv.17.1710508200588;
        Fri, 15 Mar 2024 06:10:00 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.145.26])
        by smtp.gmail.com with ESMTPSA id q10-20020aa7d44a000000b005689d0a97d1sm1657891edr.24.2024.03.15.06.09.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 15 Mar 2024 06:10:00 -0700 (PDT)
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
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Huacai Chen <chenhuacai@kernel.org>
Subject: [PATCH-for-9.1 07/21] target/mips: Make MIPS_CPU common to new MIPS32_CPU / MIPS64_CPU types
Date: Fri, 15 Mar 2024 14:08:55 +0100
Message-ID: <20240315130910.15750-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240315130910.15750-1-philmd@linaro.org>
References: <20240315130910.15750-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +z6qdl+RUTBk

"target/foo/cpu-qom.h" can not use any target specific definitions.

Currently "target/mips/cpu-qom.h" defines TYPE_MIPS_CPU depending
on the mips(32)/mips64 build type. This doesn't scale in a
heterogeneous context where we need to access both types concurrently.

In order to do that, introduce the new MIPS32_CPU / MIPS64_CPU types,
both inheriting a common TYPE_MIPS_CPU base type.

Keep the current CPU types registered in mips_register_cpudef_type()
as 32 or 64-bit, but instead of depending on the binary built being
targeting 32/64-bit, check whether the CPU is 64-bit by looking at
the CPU_MIPS64 bit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/cpu-qom.h              | 13 +++++++------
 target/mips/cpu.c                  | 11 ++++++++++-
 target/mips/sysemu/mips-qmp-cmds.c | 26 ++------------------------
 3 files changed, 19 insertions(+), 31 deletions(-)

diff --git a/target/mips/cpu-qom.h b/target/mips/cpu-qom.h
index 0eea2a2598..bf464f16b6 100644
--- a/target/mips/cpu-qom.h
+++ b/target/mips/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * QEMU MIPS CPU
+ * QEMU MIPS CPU QOM header (target agnostic)
  *
  * Copyright (c) 2012 SUSE LINUX Products GmbH
  *
@@ -22,14 +22,15 @@
 
 #include "hw/core/cpu.h"
 
-#ifdef TARGET_MIPS64
-#define TYPE_MIPS_CPU "mips64-cpu"
-#else
-#define TYPE_MIPS_CPU "mips-cpu"
-#endif
+#define TYPE_MIPS_CPU   "mips-cpu"
+#define TYPE_MIPS32_CPU "mips32-cpu"
+#define TYPE_MIPS64_CPU "mips64-cpu"
 
 OBJECT_DECLARE_CPU_TYPE(MIPSCPU, MIPSCPUClass, MIPS_CPU)
 
+OBJECT_DECLARE_CPU_TYPE(MIPS32CPU, MIPSCPUClass, MIPS32_CPU)
+OBJECT_DECLARE_CPU_TYPE(MIPS64CPU, MIPSCPUClass, MIPS64_CPU)
+
 #define MIPS_CPU_TYPE_SUFFIX "-" TYPE_MIPS_CPU
 #define MIPS_CPU_TYPE_NAME(model) model MIPS_CPU_TYPE_SUFFIX
 
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index c096d97fe3..f3ea6175f2 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -604,6 +604,14 @@ static const TypeInfo mips_cpu_types[] = {
         .abstract       = true,
         .class_size     = sizeof(MIPSCPUClass),
         .class_init     = mips_cpu_class_init,
+    }, {
+        .name           = TYPE_MIPS32_CPU,
+        .parent         = TYPE_MIPS_CPU,
+        .abstract       = true,
+    }, {
+        .name           = TYPE_MIPS64_CPU,
+        .parent         = TYPE_MIPS_CPU,
+        .abstract       = true,
     }
 };
 
@@ -620,7 +628,8 @@ static void mips_register_cpudef_type(const struct mips_def_t *def)
     char *typename = mips_cpu_type_name(def->name);
     TypeInfo ti = {
         .name = typename,
-        .parent = TYPE_MIPS_CPU,
+        .parent = def->insn_flags & CPU_MIPS64
+                  ? TYPE_MIPS64_CPU : TYPE_MIPS32_CPU,
         .class_init = mips_cpu_cpudef_class_init,
         .class_data = (void *)def,
     };
diff --git a/target/mips/sysemu/mips-qmp-cmds.c b/target/mips/sysemu/mips-qmp-cmds.c
index 7340ac70ba..329db3a028 100644
--- a/target/mips/sysemu/mips-qmp-cmds.c
+++ b/target/mips/sysemu/mips-qmp-cmds.c
@@ -8,31 +8,9 @@
 
 #include "qemu/osdep.h"
 #include "qapi/qapi-commands-machine-target.h"
-#include "cpu.h"
-
-static void mips_cpu_add_definition(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    CpuDefinitionInfoList **cpu_list = user_data;
-    CpuDefinitionInfo *info;
-    const char *typename;
-
-    typename = object_class_get_name(oc);
-    info = g_malloc0(sizeof(*info));
-    info->name = cpu_model_from_type(typename);
-    info->q_typename = g_strdup(typename);
-
-    QAPI_LIST_PREPEND(*cpu_list, info);
-}
+#include "qapi/commands-target-compat.h"
 
 CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
 {
-    CpuDefinitionInfoList *cpu_list = NULL;
-    GSList *list;
-
-    list = object_class_get_list(TYPE_MIPS_CPU, false);
-    g_slist_foreach(list, mips_cpu_add_definition, &cpu_list);
-    g_slist_free(list);
-
-    return cpu_list;
+    return generic_query_cpu_definitions(errp);
 }
-- 
2.41.0
