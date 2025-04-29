Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp23016njm;
        Mon, 28 Apr 2025 22:00:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU83VIlwNUbdYLsa5b2w1sji5ZWe+9m7qIgYcFVxalaVDkgCTg/Ceg2voBu20FE+0skwieY6TVzsEBvqw==@linaro.org
X-Received: by 2002:a17:902:ec89:b0:224:1ef:1e00 with SMTP id d9443c01a7336-22dc6a0495cmr182565115ad.19.1745902826718;
        Mon, 28 Apr 2025 22:00:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745902826; cv=none;
        d=google.com; s=arc-20240605;
        b=W9NK1hYW7QeTo1Rg7FoZl3OOYqhNnFWAOL8B1A0B8kCJsszy+14H2Gj34R09bmaBWD
         C7qzitj6AvSMwZmskG5xVwVVgnMQxuwP7dDi6N3MIq3in8aSii4Khe/EllLaK5ShOkpu
         WKoc1o1J4YPo4gFPP3vTyCW4Frf/Yv9V7Z5vd1M2zoVObrAw7bODQvlUfZV+nO9T/O5F
         HROXno6HnZ22rytaoD4rAGBxgm8Ww5H0r1EWVo7zltzYNs56iRzEICGLr3kcBuX7ukGS
         tI1HbaGRgaf+dVznsP+Lbpfz8eN1Hl8DJ5Mmyk0CkxGSgKPRhmdNnmMGCCEthGaVUAxM
         BYig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=T48CGR80HJJotOhNXvyZIfy4YYqwAzwBstE/RhDVQ28=;
        fh=jnYultAy9ysXgWtNrVhfZnx66LC1DWY0zurZH8xcLwc=;
        b=R9R4HF6HbUooEcGOSN3fXoFPXbTsUqpUNdon4e7CrBh+WEj6BxTu9VfOe6qKuK5p3X
         JjTUe4OE5rxUI1CZ0t//aGPqUdqmYiHnSmZXe2lrz8MyJpoNCh60JTmyi//v/P9oBtPE
         1G6NbmUNHlP6HkQr/Uwaj4ow1Ng7yxVpVc/zpI4vw9HM/7ocXBRE8lDA/emdG+wcSxfP
         D6H/9HoRBVySqmu2hFosMu+jtbMo1K+d5l9ckYYmc0Zeqo93M8Vg2arW+Ng+39F6cGUF
         wNYao1K8WI50otF+IB39snesyZ50j63ja6ShotQnC0bPTWzKfQKzQH0pAHXXngUDr8M0
         1USA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="q5QF/rPX";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db50f05a8sor85150205ad.13.2025.04.28.22.00.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Apr 2025 22:00:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="q5QF/rPX";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745902826; x=1746507626; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T48CGR80HJJotOhNXvyZIfy4YYqwAzwBstE/RhDVQ28=;
        b=q5QF/rPXT1igwRUizw9/wRBC55k2sT/4whOiiyvP/sPIg2J7/+hCNd+LVojcYN7R2s
         CRv8pH+HxGg4ZHmF9e/9CrXrl6kWkYU+huGFUNZVrjACj3YZqYddSju42A/DZ2qFhAkr
         KcA8W8cvBqjkFU+j/+1uIzJM/yqMELVqQ9kfN3MVMEggQ1RPcQcxheb4EVNxRdUiJpSE
         mTD+nJNgKRLwpEv1eiKW+9r05gVeGeXL7M9bKnO+H8z9m9R0kzCwTZR3yCiFGHoTUwxs
         HexxiQcwXyg8lQGzomxMvh6Lo6gUWwptL3nWS7rALLRaSLdzUwTeQ9j8W4BlyQa7COfe
         Wr2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745902826; x=1746507626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T48CGR80HJJotOhNXvyZIfy4YYqwAzwBstE/RhDVQ28=;
        b=ukzfqp/K1X0hNcrWqRUjlJrzJrA70XZh86wnj/juOLeF8l1AMWM+JeXSEF2vyxWsvm
         TSThWIE0gGL9dgHN+ox+h2E2kXMX+wfz50+uQjknT+TeZ9FgX9HcsC7R5D3zRpYDGpXn
         AD3ErXSL3EcTSc6y6I8E9AoSP8bZxlLC2eUMJkVDRpqjshkW/O24GFOf9r0LCWu8+PBM
         RaZ5JwTod5+Qwu0r5uxrikCoPrFtzhBxGtN8OIx/bhoG8E1Pj/MDpuODgP5OYBgNSwPz
         k39cKdOyamOVxO2G4THOir1cwDMqy8h7gk0pod5msRoBnH83TcEWk5TLIGBJZ4Y5NnVO
         2P+g==
X-Forwarded-Encrypted: i=1; AJvYcCUWPJu0o1EvwPKIkJJWZT1p4bhM17OEiruMwVfdkYnktMwo4RPOEHVNAbO8sxaaZ3NRTZewqd0A3y/dBw==@linaro.org
X-Gm-Message-State: AOJu0YyXH3zprMa/2jOZXQ+UU226/2j2PDo9HAdiHOlNCpYjGC13MxB7
	ZZLx/3arw6SVgyENf3xJt2njXZFpxDhxb0AlplXobe8p/nMEpWpdplKT5vc4jjCJ+Q==
X-Gm-Gg: ASbGncut7rhzRCWXzSdYasNY+RHY4D4RkGiZPzPuhF28FY1AGB0EmjtcHKyxoWhm+tT
	owco3svBsBf5IJmFjSeE8d9422YNVg/Mn6jRVgfy0dmhewUgKUOUcjaT/D7kjbHaVhCaU1uM7xm
	udk+ZIESBzilSj/UUK/tE33zZRdv6EZZqXSxhME9sH4qB/DKFQHiGDAZq19x5L3o8s5MvUvA27P
	S/kz/3s17qDHRu2oNxU+qhumyvKI/ZPUjBJQK9BTo3eT7orl+UTtPEHtf4avHP9n/OVo3glKx3z
	UwuW5M7e1IO7f8kJxh1j3mx6ZtxK5EcxSKmCpAOg
X-Google-Smtp-Source: AGHT+IG/bsI8Plp6wLuUi6N8xxtzsYztKsAI19kdOE80Gua3/ANpLwzdO+O+AKBzWj5n2J/cQnM0Ug==
X-Received: by 2002:a17:902:ea01:b0:224:1ce1:a3f4 with SMTP id d9443c01a7336-22dc69f83eamr176304425ad.1.1745902826200;
        Mon, 28 Apr 2025 22:00:26 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd6f7sm93004015ad.76.2025.04.28.22.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 22:00:25 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	richard.henderson@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 11/13] target/arm/cpu: remove TARGET_AARCH64 in arm_cpu_finalize_features
Date: Mon, 28 Apr 2025 22:00:08 -0700
Message-ID: <20250429050010.971128-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
References: <20250429050010.971128-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: LU0lYYniA5iM

Need to stub cpu64 finalize functions.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.c         |  2 --
 target/arm/cpu32-stubs.c | 24 ++++++++++++++++++++++++
 target/arm/meson.build   | 11 +++++++----
 3 files changed, 31 insertions(+), 6 deletions(-)
 create mode 100644 target/arm/cpu32-stubs.c

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 48ebaf614ee..79a853609dd 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1908,7 +1908,6 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
 {
     Error *local_err = NULL;
 
-#ifdef TARGET_AARCH64
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         arm_cpu_sve_finalize(cpu, &local_err);
         if (local_err != NULL) {
@@ -1944,7 +1943,6 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
             return;
         }
     }
-#endif
 
     if (kvm_enabled()) {
         kvm_arm_steal_time_finalize(cpu, &local_err);
diff --git a/target/arm/cpu32-stubs.c b/target/arm/cpu32-stubs.c
new file mode 100644
index 00000000000..fda7ccee4b5
--- /dev/null
+++ b/target/arm/cpu32-stubs.c
@@ -0,0 +1,24 @@
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
