Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp1853429njk;
        Thu, 19 Dec 2024 10:32:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWHaTsbCItu4IYXC2EzsWAVW/tonTlUmbC9dxOJXw+QAk8Yz0hbH/F4Q3jCcSWHW1tHYDdSx6gvvzJdOg==@linaro.org
X-Received: by 2002:a05:6a21:2d05:b0:1e1:a647:8a54 with SMTP id adf61e73a8af0-1e5e05ac4cbmr180228637.20.1734633135520;
        Thu, 19 Dec 2024 10:32:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734633135; cv=none;
        d=google.com; s=arc-20240605;
        b=WjgbQK8hBVGfy6titGrXEi1Xe1WbO0HsQX8dfv7+Pp5CX9oBXyRyStFgOjXhs4LvFd
         pOUhrky8BB4B6Z7j7rpmhN0KU/nKuNhSQuIaMqdjrteZyEDXxNqhlz16j0SQV/JklD6I
         qjqTaqqo02IVphkEtaT7b73Gs1b0yF3qHOCNLl5nVSRU+UaTJFOgjGDvG5qomutTTpf/
         MzeeuzZwTh3isSrbg/a87yPcCX3I13ABF0zopap+gPvvuj1mB/Cz/FOhh273PER/izE1
         /JXL0fFor08AtOpIbciJndNnxZ0rg2YkNUdcycsUdnDJYwtHRvkPAz+5soL28LYqQQvH
         ZtPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bgg3DZOeSktQgwpMFQWYfQpPjrdNqQXpM4wVQei4S9U=;
        fh=HyzgfnNcq+W0PW2RqZXeLVqksQawO00tkX2n4vYBvfU=;
        b=AkdN+9OVi52Gk9bYbcVuHpf71eyyZDjOtbBmc8XMrP6wBGLa2k1u648qcdh3sQJYyI
         ryEW/mK8K+UXBsxGvKu23qv8EWEAnH0ZxKmhhdoEnEl1SI1+ItqdfdCLb8l/kosYmXXL
         jFcXwOCwfg0cpvdIDZciEAr/NsUBQGHT4HuQNncY7ZxusUMyX9WboWield2H1i7BvZkj
         8v/JhwWl58Dp/kpRtf8rJ1lJp3WpRv77kPhfp9JTm73yhTzWfh9ywooqp994WnepINb1
         t8DL2khRjphSvszFfbmi5xRW7pXVUEqOFwlloV7ybxevObdt0r6b3e5GAWs54GtRUOJG
         7gDA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DyQME/+X";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-72aad881892sor1794551b3a.5.2024.12.19.10.32.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Dec 2024 10:32:15 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DyQME/+X";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734633135; x=1735237935; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgg3DZOeSktQgwpMFQWYfQpPjrdNqQXpM4wVQei4S9U=;
        b=DyQME/+XINzFUqsdtsTKmSDrcVV+T6dz4HqSCW0KmMKXLK8QQw3F/XbCbK6o4DP/y1
         ckyZq98ag3LRoMea7e6py655XRXRW99N0YhqOtGJHuUSpQnMi0ISpUwfEb80DvVJdRbj
         hGVGs71p8omxDuYWIVonMhRQMNYMtmFCk15NuMohJCVb4EyiG2Prg63Tddim5R2pQm9E
         NPXW2++G3BRXOu6dO2FokEmr+mkqRV+UAc8IoPagNTRNqNcxmh/Fs/zFwc0Q4tL4Lsq0
         n8CtyHcmjqpxw72PY68aQArEZ2GVBRiMIeck+BaYONaG59U/UFLQcu13GXS+8sGWn0hg
         dgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734633135; x=1735237935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgg3DZOeSktQgwpMFQWYfQpPjrdNqQXpM4wVQei4S9U=;
        b=dti98Aa85a1W26mL/aSd4hE+LJfXIIk1v1Tn2ZNFFaQo2cjXBtbspWaZpZc42N8vxB
         U0p4FVtz8O5DXeIK5HE00yRbTzXGh2jKhQSGL7J8esOAjwuBarbDhmk4dS4WsgLAFjd8
         +oGSGiIOLLSzxRNuLi4tPF5w4w5U3c6LLRT0rUMmCtGE3GHk4fYDE+24Crjc3F+u5dM2
         mOGZuLW37saDrFa2JVU1jBGwEZwFwvgWidNdbP1Qsif/CT87bo8c+BMgplQD1QHwD3D8
         Ks1knzF/es3x6Hwr7BcWnWOVQUsgKheUVN9/ezZnQyxr1PDtkGXhCq0ypwOSgKQN50VE
         78Fg==
X-Forwarded-Encrypted: i=1; AJvYcCV/JRzOCYplpHVwhrdQd3jxJIAW5ipLvl0NyLPVQ5rVNd6bP+ILQwUUaucpowqhhbDdwAkuLXjjIpIafw==@linaro.org
X-Gm-Message-State: AOJu0YzxmfcTiSoulWWs8PQhO4JUm40OsU9KDtGjTRCAJFR9y5UQSzJV
	7rMGlSKeiyIbeZUWCzZ9TYwLluIQCYwYJASVT2/Q56QOzMQhINHnQhlr9fVWov8Fig==
X-Gm-Gg: ASbGncukfHXRFW4G88nc8mDTfZOpCrj5ZNeikLXQPqsfLyCD3La4XnviCbKWYH9jKey
	cn2DzdKxCaaUpUjAaqvtr1f2I1zrIfplsoFZXBOMnWw8NiyGHEsYgn58pHpjdIVqM5TsdrYfhbs
	W4bc/ERJUjl9/ghvPx/lMpXCRj8yWoogKPMplNvzjxkenwCDhmz2PvdprEH85QyKngTfL8UlBq3
	V7MgiyI3p1TQVMp8Tvrpm0psUXteS7sKYoBdWVfeipRzwhmSGyHwno3
X-Google-Smtp-Source: AGHT+IGF+rRqeIO/bCUN5wAwJFBz7SmxzQKFiaqqz696UQGWaKpxx8rf70FBqiqEPKLWfIIKZTyu+Q==
X-Received: by 2002:a05:6a00:1909:b0:71e:6b8:2f4a with SMTP id d2e1a72fcca58-72aa8d3a152mr6906058b3a.12.1734633135047;
        Thu, 19 Dec 2024 10:32:15 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90b302sm1624733b3a.175.2024.12.19.10.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 10:32:14 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
	Fabiano Rosas <farosas@suse.de>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	qemu-arm@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>,
	alex.bennee@linaro.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 1/3] target/arm: add new property to select pauth-qarma5
Date: Thu, 19 Dec 2024 10:32:09 -0800
Message-Id: <20241219183211.3493974-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241219183211.3493974-1-pierrick.bouvier@linaro.org>
References: <20241219183211.3493974-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 5T7rtW16mL0L

Before changing default pauth algorithm, we need to make sure current
default one (QARMA5) can still be selected.

$ qemu-system-aarch64 -cpu max,pauth-qarma5=on ...

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/system/arm/cpu-features.rst |  5 ++++-
 target/arm/cpu.h                 |  1 +
 target/arm/arm-qmp-cmds.c        |  2 +-
 target/arm/cpu64.c               | 20 ++++++++++++++------
 tests/qtest/arm-cpu-features.c   | 15 +++++++++++----
 5 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index a5fb929243c..d69ebc2b852 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -219,7 +219,10 @@ Below is the list of TCG VCPU features and their descriptions.
 ``pauth-qarma3``
   When ``pauth`` is enabled, select the architected QARMA3 algorithm.
 
-Without either ``pauth-impdef`` or ``pauth-qarma3`` enabled,
+``pauth-qarma5``
+  When ``pauth`` is enabled, select the architected QARMA5 algorithm.
+
+Without ``pauth-impdef``, ``pauth-qarma3`` or ``pauth-qarma5`` enabled,
 the architected QARMA5 algorithm is used.  The architected QARMA5
 and QARMA3 algorithms have good cryptographic properties, but can
 be quite slow to emulate.  The impdef algorithm used by QEMU is
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d86e641280d..b7500bebd7f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1062,6 +1062,7 @@ struct ArchCPU {
     bool prop_pauth;
     bool prop_pauth_impdef;
     bool prop_pauth_qarma3;
+    bool prop_pauth_qarma5;
     bool prop_lpa2;
 
     /* DCZ blocksize, in log_2(words), ie low 4 bits of DCZID_EL0 */
diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
index 3cc8cc738bb..33cea080d11 100644
--- a/target/arm/arm-qmp-cmds.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -94,7 +94,7 @@ static const char *cpu_model_advertised_features[] = {
     "sve640", "sve768", "sve896", "sve1024", "sve1152", "sve1280",
     "sve1408", "sve1536", "sve1664", "sve1792", "sve1920", "sve2048",
     "kvm-no-adjvtime", "kvm-steal-time",
-    "pauth", "pauth-impdef", "pauth-qarma3",
+    "pauth", "pauth-impdef", "pauth-qarma3", "pauth-qarma5",
     NULL
 };
 
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index ec77c5b34ad..9a193d2b489 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -520,9 +520,12 @@ void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
         }
 
         if (cpu->prop_pauth) {
-            if (cpu->prop_pauth_impdef && cpu->prop_pauth_qarma3) {
+            if ((cpu->prop_pauth_impdef && cpu->prop_pauth_qarma3) ||
+                (cpu->prop_pauth_impdef && cpu->prop_pauth_qarma5) ||
+                (cpu->prop_pauth_qarma3 && cpu->prop_pauth_qarma5)) {
                 error_setg(errp,
-                           "cannot enable both pauth-impdef and pauth-qarma3");
+                           "cannot enable pauth-impdef, pauth-qarma3 and "
+                           "pauth-qarma5 at the same time");
                 return;
             }
 
@@ -532,13 +535,15 @@ void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
             } else if (cpu->prop_pauth_qarma3) {
                 isar2 = FIELD_DP64(isar2, ID_AA64ISAR2, APA3, features);
                 isar2 = FIELD_DP64(isar2, ID_AA64ISAR2, GPA3, 1);
-            } else {
+            } else { /* default is pauth-qarma5 */
                 isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, APA, features);
                 isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, GPA, 1);
             }
-        } else if (cpu->prop_pauth_impdef || cpu->prop_pauth_qarma3) {
-            error_setg(errp, "cannot enable pauth-impdef or "
-                       "pauth-qarma3 without pauth");
+        } else if (cpu->prop_pauth_impdef ||
+                   cpu->prop_pauth_qarma3 ||
+                   cpu->prop_pauth_qarma5) {
+            error_setg(errp, "cannot enable pauth-impdef, pauth-qarma3 or "
+                       "pauth-qarma5 without pauth");
             error_append_hint(errp, "Add pauth=on to the CPU property list.\n");
         }
     }
@@ -553,6 +558,8 @@ static const Property arm_cpu_pauth_impdef_property =
     DEFINE_PROP_BOOL("pauth-impdef", ARMCPU, prop_pauth_impdef, false);
 static const Property arm_cpu_pauth_qarma3_property =
     DEFINE_PROP_BOOL("pauth-qarma3", ARMCPU, prop_pauth_qarma3, false);
+static Property arm_cpu_pauth_qarma5_property =
+    DEFINE_PROP_BOOL("pauth-qarma5", ARMCPU, prop_pauth_qarma5, false);
 
 void aarch64_add_pauth_properties(Object *obj)
 {
@@ -573,6 +580,7 @@ void aarch64_add_pauth_properties(Object *obj)
     } else {
         qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_impdef_property);
         qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_qarma3_property);
+        qdev_property_add_static(DEVICE(obj), &arm_cpu_pauth_qarma5_property);
     }
 }
 
diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index cfd6f773535..98d6c970ea5 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -419,21 +419,28 @@ static void pauth_tests_default(QTestState *qts, const char *cpu_type)
     assert_has_feature_enabled(qts, cpu_type, "pauth");
     assert_has_feature_disabled(qts, cpu_type, "pauth-impdef");
     assert_has_feature_disabled(qts, cpu_type, "pauth-qarma3");
+    assert_has_feature_disabled(qts, cpu_type, "pauth-qarma5");
     assert_set_feature(qts, cpu_type, "pauth", false);
     assert_set_feature(qts, cpu_type, "pauth", true);
     assert_set_feature(qts, cpu_type, "pauth-impdef", true);
     assert_set_feature(qts, cpu_type, "pauth-impdef", false);
     assert_set_feature(qts, cpu_type, "pauth-qarma3", true);
     assert_set_feature(qts, cpu_type, "pauth-qarma3", false);
+    assert_set_feature(qts, cpu_type, "pauth-qarma5", true);
+    assert_set_feature(qts, cpu_type, "pauth-qarma5", false);
     assert_error(qts, cpu_type,
-                 "cannot enable pauth-impdef or pauth-qarma3 without pauth",
+                 "cannot enable pauth-impdef, pauth-qarma3 or pauth-qarma5 without pauth",
                  "{ 'pauth': false, 'pauth-impdef': true }");
     assert_error(qts, cpu_type,
-                 "cannot enable pauth-impdef or pauth-qarma3 without pauth",
+                 "cannot enable pauth-impdef, pauth-qarma3 or pauth-qarma5 without pauth",
                  "{ 'pauth': false, 'pauth-qarma3': true }");
     assert_error(qts, cpu_type,
-                 "cannot enable both pauth-impdef and pauth-qarma3",
-                 "{ 'pauth': true, 'pauth-impdef': true, 'pauth-qarma3': true }");
+                 "cannot enable pauth-impdef, pauth-qarma3 or pauth-qarma5 without pauth",
+                 "{ 'pauth': false, 'pauth-qarma5': true }");
+    assert_error(qts, cpu_type,
+                 "cannot enable pauth-impdef, pauth-qarma3 and pauth-qarma5 at the same time",
+                 "{ 'pauth': true, 'pauth-impdef': true, 'pauth-qarma3': true,"
+                 "  'pauth-qarma5': true }");
 }
 
 static void test_query_cpu_model_expansion(const void *data)
-- 
2.39.5
