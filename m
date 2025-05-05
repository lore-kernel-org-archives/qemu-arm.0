Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778201njj;
        Mon, 5 May 2025 16:20:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVGg4HlJebQlQQYAs/zT4BPU+ZW/L8H/JqMkzgXDlGrnwLF1Y8YhR3vjgJMvjQo+n5i8Hg+Fua36D4bFg==@linaro.org
X-Received: by 2002:a17:902:cecd:b0:216:644f:bc0e with SMTP id d9443c01a7336-22e361ebcdcmr15861815ad.24.1746487230771;
        Mon, 05 May 2025 16:20:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487230; cv=none;
        d=google.com; s=arc-20240605;
        b=K4NU58+BwPndAtiT7nyRQG3UiVGKf7JLVJpWGx8UHj+tbTWZVcPeqmpg/kXVaI+//7
         m8BW5CK+4oNxM1O43Kz8Anmc3UkUm+WCMEYArwFeJaOAPDqzKauAi8591xOv6q3Q7pUP
         6xLMExk5RBki6H7bcEe6a7wyby0HxEEqD+05sFNhmNjivNLYIUmMBprxrd2Ebn0gsLCj
         DxTJui03q1PXoJ+KF1NLb4tcCxmftyw9TPWUVlV37hbwpLGH3aEvAyIIa+KcaUZxwUa/
         Q5zkc20DBfMX+gp6DGLei5WPl8KsA2ZfMiEWfuKOnd3iJllvso+BTOx9MI4FuFTxL5Jo
         ZO5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xML4J0OK01b5ZM+8qKTIYRySQNd3gi0WVCRNgOjS4SA=;
        fh=4amz0nN2DMYrbd8WtTT9lJnILmkupJrxEmruc7nvpMw=;
        b=LHwKufMA+W2R3qFmsMQGl/C/LRimnW3D1hyFGQC5McsEjG9XSFJse+MuJW0H9Vx5df
         VRKCeaKdL8c7jovBLYu9h1pLtoRJsDbWvCLAS08DBfivequyUx3wTSgAoAQosd1owqdR
         M1VV1G8tZJ5S3tMrai7pkV2szVUlJrbbPGWUFL70dSyhm80IgU4Gse1GZzjZyGTeVbix
         7ONWZH2NYUdDywPBo3LcUpM5wnkG02f6zm3ZIyC8uHGPnI6RmMyWMHEhmauS42d2xfl9
         65fXINFJFrBNOMWSeqRo5VyS+G3c6saihFG/VL0NDNVu69ek5No+4Rrf427ex15MsTAe
         8/hA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TC9WLaNh;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e37217641sor2450555ad.16.2025.05.05.16.20.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TC9WLaNh;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487230; x=1747092030; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xML4J0OK01b5ZM+8qKTIYRySQNd3gi0WVCRNgOjS4SA=;
        b=TC9WLaNhPJ0H7jst4chbvW6RPWqVp3FUiYYKp8J8RYqwrmEJfAfGQrRvld+L6GeUH0
         hQ70c6ME98CP6Zh8qVtuYSCkgeel/YuoQ51qQsQQVlMAoxq8GPF+ZFN5TEoYIEdZXBC5
         q0HhpYENjrktOjBjf9JM/jSebUtkjCuzsAuWHcpJWBbWaHPL+cEdHeenZA3Yosnc46Z8
         cCUbYrNMtcmNr+gP44FuWDMR78OhI1E/iaWQAVcQqkYStRswQoTSYVKCBg549lsIElVs
         EKKxBGRf7iZyyUrqGu2Jk8MzRliffilSfQuym8UWYziumXOHfGbkSBEX9DGn4qxLo1D3
         oPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487230; x=1747092030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xML4J0OK01b5ZM+8qKTIYRySQNd3gi0WVCRNgOjS4SA=;
        b=D41Zk5f4m3lSW8acCdnZn7QCAuVyYcPiSobg6CbKjWHIHQaVOcA7YscpjB6D4XVmKU
         5RnzoCAYVgwAbVKzvsBjRFCOym49I4H8aDZNghOLNX4RYAiHb90MM3lEfk3n3ZmCOm3m
         1ugNB1y68yoFKeloT2vBnknC+EVb0GGyBZtdmRBxq1MXKwcYw1yR45Pm+58hDJPg59BZ
         lYu6L4KTQLInE9wyEntkZjGjQrV22iQQkxEkqkxmffS+0GjcXIld69lXgIzRBPt2hZQ5
         0XZXv2/BhGCMo6BrUGs5HYtp/ShlI9TWgd6Xh5gaWLlUjS0+mTcRCjxIE83srdw6Vrx9
         M4kg==
X-Forwarded-Encrypted: i=1; AJvYcCVITXNAAvD9INzqIWnR6vA1NGyPiuA4VLTrw6L94woiw/y83PFVAtBCX7N5+qf6SUJg/cnfEuyjqA7QOg==@linaro.org
X-Gm-Message-State: AOJu0YxR5i65pg3icQDAgjqrO0LIP34c2H7dCyLfTqgZNFgdo+bIukRQ
	2FQH5zz5baWgJkvUPz8cBVij2BMRWvxiozziR7ICUTjV3nTuTUkZwGm+KyS+UIHd46D4ep3AiY1
	zricCNw==
X-Gm-Gg: ASbGncv+I/xvuN5xSuLUF6hTmWxTiF1KVK8s54iQr4A4VCTPIn9qkYdGKbE4Mhvf1x+
	HEbs16IE6eUqQhIOlQllxUwTkudhl5VqE3X3Xg6ipleBjHogMIY9vRrszaizzKXfn9P68/Yl61z
	JVC8gpSl3rFzREetG1tzxbVqVlzcRrYdeFJEiICD2Kw3Q7Khh7c9XKgIZAofcmhP+VBN4omsOvZ
	c/rVsz/CnrTIEFvf9Cz8kCsUCkcytSG81g+ZeD7lcPh8m0G3YPQDzTnEkTseH+HqAK7quLWYXC1
	h86GvppJp3NWFBswQC7gW604R52Y1ihdTbuUC1iZ+Me1cnCiNdE=
X-Google-Smtp-Source: AGHT+IHC2Jo05pn952wK+Shdz+FACMdNmO9OlVTSCdZkPIpQy/IzGCCRrr1li/1SwgK+QzI+o9r6dw==
X-Received: by 2002:a17:903:1ce:b0:220:faa2:c911 with SMTP id d9443c01a7336-22e35fdf665mr13164945ad.14.1746487230235;
        Mon, 05 May 2025 16:20:30 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:29 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 11/50] target/arm/cpu: remove TARGET_AARCH64 in arm_cpu_finalize_features
Date: Mon,  5 May 2025 16:19:36 -0700
Message-ID: <20250505232015.130990-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7SeJovXDUt9s

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
index 00ae2778058..c3a1e8e284d 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1878,7 +1878,6 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
 {
     Error *local_err = NULL;
 
-#ifdef TARGET_AARCH64
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         arm_cpu_sve_finalize(cpu, &local_err);
         if (local_err != NULL) {
@@ -1914,7 +1913,6 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
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
