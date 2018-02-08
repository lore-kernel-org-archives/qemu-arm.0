Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id y90sm623333wrc.24.2018.02.08.09.31.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 09:32:00 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id EC1BF3E0BB7;
	Thu,  8 Feb 2018 17:31:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 03/32] target/arm/cpu64: allow fp16 to be disabled
Date: Thu,  8 Feb 2018 17:31:28 +0000
Message-Id: <20180208173157.24705-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180208173157.24705-1-alex.bennee@linaro.org>
References: <20180208173157.24705-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: dqoodc3rDXuV

While for CONFIG_USER_ONLY it is policy for the "cpu" to be the most
capable is can be this does cause problems. For example legacy RISU
runs would fail as there are a bunch of implemented instructions which
would have caused failures that now trigger actual calculations.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu64.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 973614dfc6..0dc4debd9c 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -275,6 +275,26 @@ static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
     }
 }
 
+#ifdef CONFIG_USER_ONLY
+static bool aarch64_cpu_get_fp16(Object *obj, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    return arm_feature(&cpu->env, ARM_FEATURE_V8_FP16);
+}
+
+static void aarch64_cpu_set_fp16(Object *obj, bool value, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    if (value == false) {
+        unset_feature(&cpu->env, ARM_FEATURE_V8_FP16);
+    } else {
+        set_feature(&cpu->env, ARM_FEATURE_V8_FP16);
+    }
+}
+#endif
+
 static void aarch64_cpu_initfn(Object *obj)
 {
     object_property_add_bool(obj, "aarch64", aarch64_cpu_get_aarch64,
@@ -283,6 +303,13 @@ static void aarch64_cpu_initfn(Object *obj)
                                     "Set on/off to enable/disable aarch64 "
                                     "execution state ",
                                     NULL);
+#ifdef CONFIG_USER_ONLY
+    object_property_add_bool(obj, "fp16", aarch64_cpu_get_fp16,
+                             aarch64_cpu_set_fp16, NULL);
+    object_property_set_description(obj, "fp16",
+                                    "Set on/off to enable/disable FP16 extensions ",
+                                    NULL);
+#endif
 }
 
 static void aarch64_cpu_finalizefn(Object *obj)
-- 
2.15.1
