Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756114njj;
        Sat, 3 May 2025 22:29:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWb5qs+q0z2ddBDaz6N7tcRdCInCDGaCEE7qPqTAWMuOTZAtyPktdBtrzwl1rOO4r/nFwVranojHF6sEw==@linaro.org
X-Received: by 2002:a17:903:2f83:b0:227:e980:919d with SMTP id d9443c01a7336-22e18c4f079mr67596435ad.47.1746336570408;
        Sat, 03 May 2025 22:29:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336570; cv=none;
        d=google.com; s=arc-20240605;
        b=PfTv0VuS9bvC4bQRiFQv1Y0bk/u/FFq2BsKuv1kQjpyKmIMSVPxHdRA/Ty/65R/SKr
         a9X3f5T8xZ3B93+lcxPqDcAIok/PT3mSbQdhVq7TnZy7bEwV9FMmdRd4OUnBZautJB26
         GY9Fw0bO5XzT/1HeMRgoyuMlvKt8n3Srh1ignPpEriiHsHFhfBeGGnHdf7i0+y5ZgRX1
         eOzzOIRVs3mE+jN3vwuJdeu+3JfxzlcwU5Zs61lLFux+LSNXsUwYtxiK0/5z0FtUTA7S
         ucu20dArUN8T5jzmOQez3TFto8Zz/q/sIO87Gx6nns7vBFFMBDt9DVf/WOYUkrnEjhDy
         Ezhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xML4J0OK01b5ZM+8qKTIYRySQNd3gi0WVCRNgOjS4SA=;
        fh=1d+16w23y0YDJ6R3DqvsHslYHMDHPk3aQZMft0oYWm0=;
        b=TiGOf4NjSWnlergdHson9P53FzEAZC0uWF3oNwKsVRC/Oz2/YH4aclLwytx2ruELAK
         jg97ky6E1FN0/3HMypTVQlEEj74Gr5LWkRADAOIDZyH7/P+av++NfZULQZQerD8RzVT8
         VgU7mzpG5fizCYFUHHhEY8P5JgNQs5KTbOfBjJOEsz7UhxHhpRKZnVzVG+p5349Cs5mw
         gbr8TUyqASkOnzDLJtMBHxIOkeRe+tW6j5A3jSka2MRkAvmPJ9ZHj1CMR7nJWEa5YZwM
         ZCxr7n06TkjztKU7Lf32LjazMQuKB+wOzzlCy1lMnidIkemaYIb3IMPFpot2lvZMLfBy
         xRkg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a58VLNCY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0be73807sor39135595ad.15.2025.05.03.22.29.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a58VLNCY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336570; x=1746941370; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xML4J0OK01b5ZM+8qKTIYRySQNd3gi0WVCRNgOjS4SA=;
        b=a58VLNCY6bJo3snZqp19Gqjum7ZRF9ndJXZOV1JiPJxFhBtF4TLuyQFIqBcbtm6xG3
         QEiTFqkTsnzA6jj9gzhI4kH6lsNJq0zJTFicIwTZYHpJ0cCBM788tNEWY9oUHrYPEvNB
         gCx6k9EJypxher73rfNYA6liU/JfubfAkpCu0HkRW7M7QWkz8BA0zEOaCVM6DsCuAQba
         QKGdEtf9Bqu8kB0yMvj1ISlEbETmIxBJk4R66AtWA8Uqq+ZLTnqieYDAJB5xqz0i20WE
         mYU5cY+lq7bqfg4UaLUR/DBRoo0zOX/Z1BeIe1zWhOTbPxs+hAQSveic6FJQl3Kdakg5
         mJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336570; x=1746941370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xML4J0OK01b5ZM+8qKTIYRySQNd3gi0WVCRNgOjS4SA=;
        b=RbnQjvEuO2e/xxJA0hDv/RYcpXZRqv26iVBcq9B4As+iwva0Dtt2qSSHAxlRYqPA7f
         pJOoNu2Ou28bADrpUCRvnkZcS1Wu37YquXMKDUDiqqKGZOEAKVvoYBy1Y6vDETEB2YEa
         WsqzGk0LGy6Paqg4audRJsSHX2C3SF8keNe8Tsga1rjXTWagqUbQN8xCL7qoXNNV1mpN
         0pAazw7FaifY6yaEnFMiDYyVfSjQbwJXQQKeZLZ+YlBTr5IyXx5WqMhjDn2kts/lig2I
         T67th7xErisP2Sp1MZOgtb5SXFWRfZhIq4r+/7RoBQB0a3dRTkkzcrtehMiO3PbzXrUE
         hbWg==
X-Forwarded-Encrypted: i=1; AJvYcCX5wMRhQ+1LpnPDsnvLucn4Abv/kFR03DtonpZWttuq31mi//OYEKBng/aJ6LqKMi/gy91T7WgDHY9mLQ==@linaro.org
X-Gm-Message-State: AOJu0YzLhOF4maJDpGHNyVHID5NhqvcnxNaquiWcO71IxF3ThCz4h1Ev
	NR74crfqC0otMATt5pF9GBzgsHrro7F5hHDdn1NDW2+37z4wMFuIqXmxPDQDswMknA==
X-Gm-Gg: ASbGncsB8q0FuYa82vjlpwGZ01X3NtGRwtKdOL/Bu4LSUEK8yzNU/d4LcezNN9ByQQq
	KGaZquwp0Iis99qABC2dzVxYyj2IE+3PNOiZFg4BtSe7kQpebw+cG0r6XTI+RLcf6rCPDQOt10I
	9EJePLpfN2wo6CcTo2yS8pPWX6OqT+gDSUPEUGPBvYq57sbemu69uBoEyuZDGlMnR8TN5tUnllF
	ZDDfmQ43CKdbAYDJ92Ks1V7VQdx7nvFPteS1qsUU0bCbOeNKNx1PNRC1EAhhhHDak6UglJA0Vdn
	1bLutUcei4GHI6jX3ia9LjvUd2TjkjJQc3g4qGX+
X-Google-Smtp-Source: AGHT+IGNaTTaB8sCjmP0kKNqXdhjM/rwql0XWgva5vnqXht3KrNf9a4sAy7Da4m17fBBAvj9OgJobQ==
X-Received: by 2002:a17:903:2452:b0:225:abd2:5e39 with SMTP id d9443c01a7336-22e18bfb5e1mr69676795ad.30.1746336569982;
        Sat, 03 May 2025 22:29:29 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:29 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	kvm@vger.kernel.org,
	richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 11/40] target/arm/cpu: remove TARGET_AARCH64 in arm_cpu_finalize_features
Date: Sat,  3 May 2025 22:28:45 -0700
Message-ID: <20250504052914.3525365-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: J9ox2yCASwY5

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
