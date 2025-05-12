Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42613njb;
        Mon, 12 May 2025 11:05:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUXwVuTujUbodUY9h2Swcir0tYR8OfaPUZx1fO9ZjK9y0b8yBCXZ+cAntRjIfYiaUvv7cCQzMM8rAGLdw==@linaro.org
X-Received: by 2002:a17:903:3ba7:b0:224:c76:5e57 with SMTP id d9443c01a7336-22fc8e99d3fmr167317825ad.39.1747073120419;
        Mon, 12 May 2025 11:05:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073120; cv=none;
        d=google.com; s=arc-20240605;
        b=DYqPICkQ1mAPoBYnkCltDwqHc0BE7HdKROtySJB57mTO4oQuTzKPtkvd0WwqxfWweu
         LMBmbDQpF3g+PCxPDouj3TkUa+gY++ul1RGtAW+xT/ANBYmlnYClhUDFLxKZrZNyHwcF
         +z/ZSOTO74ukvj/pey3ihhvm8HACDnZx8+j4NfyaOzGz7jzpoeRRGW7w41m4Ix6Rq6wd
         Dp0e4JNBjmnINjFdnMEBjz8r8t+Fry2sWChHv2gUPQN0Ut8Qu/oOSxMz3m+LkfBhL0ML
         ml786J8B9lA3qn2iZuTkse67vrALj/kGMWJy2iEkBDLj/9Yae/atHoErFnQ9NVk4XAN9
         CcZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PtoWRnhexqhEbtmi9AyX1L5MqLgfQdzBe/SXZsSvaEY=;
        fh=2u5bX0ghPUMjyO3LmsAFIUXkEnSmieVonJwuccKN8gM=;
        b=NwB0kqUxz9JCXyhJmHSSX3ZNoJ8/l5+7rB3WVdTP3lmE+X/gS0TqBWL4KS86QAwen0
         tO5WYY8VTP+dG8vp/AlE565ZJn2cL9B6qmRDwhMIC4K1ZOYFfwIjZ8mpB7eUHxX5UNPN
         oeLN2qStlX2JdAvTfku3RluTbf+IVAKlH9McOHFyC+nev/zZtugXXkywb4zZlFgDqUhi
         SKwHFzmxHB9q6OhCKsN/Um5i52f3ytpIYqTjKe+6IMymdBaXw1Lgk6voHokYjQ24qcnw
         Ii0A6sZt0aekma6YkaP+OTyRy1tHEbGfvfesbS86We/gv8oUtG8obumC5y4V7DvzBWyL
         OlUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n627H8G4;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc5a2bcabsor63619085ad.5.2025.05.12.11.05.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n627H8G4;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073120; x=1747677920; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PtoWRnhexqhEbtmi9AyX1L5MqLgfQdzBe/SXZsSvaEY=;
        b=n627H8G46LRPudif1C+c41BKiyFQPB5TFEs0+HtLhi6L/HS60cCVKDBR66phqZKMJ0
         MkJD0yXfoabZ0lSnRqHjtLMHO+OY3CWG3z5TFfcLYDNVf91VWVj2jL1giOJVjrX6jF5c
         h357ExZIIwBJ7qw3adM9V/xY5SeZSOMNiepYd6sGFU6ZTzjHub8HEBmMalRD8GfsahzQ
         aDSaUW2bycnvgv3LPsMKXw7jxL410pNsPJIGpyTu4+7tri+hSths+w8xiAROnHwWISmX
         tBePtgIGr4TibpKxaIGP2fhy1MX/hqiaaXjOrZ1n3CJvccr3K2VIW+GTbaV5ywlObCJa
         sl7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073120; x=1747677920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PtoWRnhexqhEbtmi9AyX1L5MqLgfQdzBe/SXZsSvaEY=;
        b=DqGyXtIVv42ojImKLd1xYXM3qkwGkdFVZhfNZZ/qKbQjMxLUnmwZekE2Av4Tj/K4ob
         FcXIipiibo3+ctuM6U/0gWEq6S/Iil2MAz1HcXkGllm+1Tbt3CSuUidSlH6NpRs7/eiu
         5O8/pqJfxm2J+WWei6IY2QB6mWvPr0lfIVZqPmW4vybVDRVs8HUNvNvQ+YujDJ47/bLy
         tM7rnllXnTj1/rn2ORctLXA1ura45B8aJfkde2GIpqjOf8hRANKMjIiqY+AXi8EbTKU4
         rw4PXwA6ORJXXfk44g0XgkM0Nu+1/X191fZPWtICfSwaYaAv5GE4ZCG7H54MTIrM7LfI
         Tm5A==
X-Forwarded-Encrypted: i=1; AJvYcCXzLHncGxtSx2qiBbj9FI6DEVXvLrg50u77a5a2K/jgwWnCkLs2B8qkaoitLrr7Rh3bFKYVKUBld5EEWw==@linaro.org
X-Gm-Message-State: AOJu0YxmaYrcaA4sR6DUtW+SATx/cJIpLZYKSQ6LtsJO+5WdSzpPPY8T
	7V9lLDboXz6PvsWw7WhBT/c3K3gwWztHlJ9TlwX/JIxgUL5sot4C/Qb5Z9qxNclShw==
X-Gm-Gg: ASbGnct4UbervwlFPz8l1OTuJZfrdDSy9tubC1MV/5T1KSop2ZWjwVQP1P4DKn8wbVa
	qDpGy5H83ECa1YluAvxbpaN7TZuDUaSf/vPVQo9uT+OYtlupBy4XxRFyHYV+cgAIiZVE3aVe/cu
	/jXddi/iVSh+Si1p0GSsyL1f3ijI2r9erIzvSRQu4PlffDs82340Pqp4cit805+jfqIA/eJgFwz
	5UL1BxxUPz+2UVr96D2DpOkMVeSCCZfJpWz6tFwA7eoZI9j5r7yxf0O4HSIaOQvSj9JcEduLS99
	gqN0b+h3w8DqZESsAGo06CRDL1jHvcnL4spAl8Jw1fh70StBoEY=
X-Google-Smtp-Source: AGHT+IG//ZC2tU4+ufVtxaRs88BbVlF8JqsECFJysIZkUPjN2rUU+hJ5AjlLR0rJIxAeA0859MMfvg==
X-Received: by 2002:a17:902:e747:b0:22e:5e70:b2d3 with SMTP id d9443c01a7336-22fc8afeec8mr204881035ad.1.1747073119969;
        Mon, 12 May 2025 11:05:19 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:19 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	anjo@rev.ng,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v8 09/48] target/arm/cpu: remove TARGET_AARCH64 in arm_cpu_finalize_features
Date: Mon, 12 May 2025 11:04:23 -0700
Message-ID: <20250512180502.2395029-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BFo95LNMfB+x

Need to stub cpu64 finalize functions.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.c         |  2 --
 target/arm/cpu32-stubs.c | 26 ++++++++++++++++++++++++++
 target/arm/meson.build   | 11 +++++++----
 3 files changed, 33 insertions(+), 6 deletions(-)
 create mode 100644 target/arm/cpu32-stubs.c

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b97746faa87..a604e4ccac8 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1877,7 +1877,6 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
 {
     Error *local_err = NULL;
 
-#ifdef TARGET_AARCH64
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         arm_cpu_sve_finalize(cpu, &local_err);
         if (local_err != NULL) {
@@ -1913,7 +1912,6 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
             return;
         }
     }
-#endif
 
     if (kvm_enabled()) {
         kvm_arm_steal_time_finalize(cpu, &local_err);
diff --git a/target/arm/cpu32-stubs.c b/target/arm/cpu32-stubs.c
new file mode 100644
index 00000000000..81be44d8462
--- /dev/null
+++ b/target/arm/cpu32-stubs.c
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include "qemu/osdep.h"
+#include "target/arm/cpu.h"
+#include "target/arm/internals.h"
+#include <glib.h>
+
+void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp)
+{
+    g_assert_not_reached();
+}
+
+void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
+{
+    g_assert_not_reached();
+}
+
+void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
+{
+    g_assert_not_reached();
+}
+
+void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp)
+{
+    g_assert_not_reached();
+}
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 3065081d241..c39ddc4427b 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -11,10 +11,13 @@ arm_ss.add(zlib)
 arm_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'), if_false: files('kvm-stub.c'))
 arm_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
 
-arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
-  'cpu64.c',
-  'gdbstub64.c',
-))
+arm_ss.add(when: 'TARGET_AARCH64',
+  if_true: files(
+    'cpu64.c',
+    'gdbstub64.c'),
+  if_false: files(
+    'cpu32-stubs.c'),
+)
 
 arm_system_ss = ss.source_set()
 arm_system_ss.add(files(
-- 
2.47.2
