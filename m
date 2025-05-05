Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178758njj;
        Sun, 4 May 2025 18:52:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWnp0kQ0Ouv/0uS9H95yS85rXrPjoTqneBrJbUsjnotlVs3ujCpSKZupkOB4L+l9/oQj50eysBOz1qlkg==@linaro.org
X-Received: by 2002:a17:902:db12:b0:224:3d:2ffd with SMTP id d9443c01a7336-22e0863a1f7mr218253585ad.17.1746409958574;
        Sun, 04 May 2025 18:52:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409958; cv=none;
        d=google.com; s=arc-20240605;
        b=f5O8UCP4DXyvszFYQ76vUBajYUVB1AiViPtGCXzYJ8oR8Em7xNeAk9P3Qlgg6yu0Do
         Pjw1/OwwoUzeE/RebCxpor9JxM/3LKNdekZeJfvha1omCagPrNvF393DnVh5Mo6uq+Wb
         zdxLGFtqOlarjq73MivAAg/ib5Qzw9Ra7PGfNXVHzlEVV1rxLDpCbqrswOsTCzG8Xyw2
         4897Ba5ac/HdqOTnTxflP/zaBV/G7CS/iuD/OuMX/C9TmmPvdIWZxhKsuana9nDdJflc
         9gfBdUg8Uwq4CZXOouK0VU2Ben0ZRHtMsm0B5IjRuUhRfhQ4+KUeTVXwVKLLg9gVFRNe
         IPQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xML4J0OK01b5ZM+8qKTIYRySQNd3gi0WVCRNgOjS4SA=;
        fh=zxXggSU0nKvrScICiSC52WLhK4k5ez7g/l3GU1rzZwc=;
        b=cveyQOSTd8HOwP/gIVj0wmz+BNuH40nVkrBcxhSbpDyou7qh4sfs1pQSqVVg7tzALW
         ScvoiPqQOw8RYutVnLQiGEnt2OdEFLNDF6NsDfkv9B1ebn3nU/guSifxXJr3ro5en/EG
         YyusUHfzh12prTCi2FfWZR9GNc76roRIJ3Ub7QHRcKmrSenfnKm+KwUutHlTEff44Y9U
         Wf2vePKuJ8/c9xHHBnJVnhlZTiT8JK8QUd/12ObCyNYdmChnF/cHXoPoxX+2UYZXhyCJ
         KSLzmp6siB0j/NI/ljlT+W+z72otTDwu0K1M1AYBk6yHgzoA8OwNJTDXzsFWMcu8Fafh
         Z2tA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N/te1TYU";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22df5616e7fsor66918735ad.1.2025.05.04.18.52.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="N/te1TYU";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409958; x=1747014758; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xML4J0OK01b5ZM+8qKTIYRySQNd3gi0WVCRNgOjS4SA=;
        b=N/te1TYUtfunooxKrts0QtQLlvLlGxdjJSjW+lkCxDNqwMfmgsv4z0TpbLbBiryu/r
         bqG9rwS8IcNf/5vEE3tcNU/zaZwqrP8T+WeB54JTBhW7pYvphOMKDebH5mu5JxDdfCrD
         o3ms6nPm3YADdMai8zgpZIFURXZ4h2SAAZGa2+PBz8162GmN5B1zlgfr4oWJfqQdzmCK
         Lc8mJ/gtD7fb/b4HpWayOSFKVdkA1vSv2LQNsX8ELTUdRoK78nuEUpwN1Bq8LkZZypGr
         WELhAxVMbQFi1v8D9DE/v8YLueAcamk6yxysE+N2ly+fOMlIxVGMvdtzajgUff7Po3tu
         eq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409958; x=1747014758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xML4J0OK01b5ZM+8qKTIYRySQNd3gi0WVCRNgOjS4SA=;
        b=S5z0zZ/LIefp9AbACBWX1dcTStPu5A8K0atjXySaIRnEhap33MiLWz1A6M3wMqi1gD
         0/Wno9vtMFx3/nR1hlmWbYw3ywdU1xoBcaYW5Iks/J9spSTQ4ZYzuNO62OcEtd1ncm/R
         eaAVOo9mc50LW3aKeNUxSBWm+LJWrVj52Ep/VjSXy6SJyBMp3karN87ox/WxF59fkPB6
         gYK8Ue5ELysY2swOEmzw/PvS9UQ3auyJVVRLPUJA38aAolidy00Y9YB7voapjFl8QwFM
         NrVoNSbI9Uj/YGaV+J7PlhXhSHsDkQmpfZiEGWn9qH/ndg+0SWjwURPHJSZnMlfzZPw6
         99aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQdeeXE3HIDbxxOQ6eU/BbKqYCxF3tDs7dHjVBbp9a4Vvl1vKGCVOGPC3V7+SHvBXztfi50LnsIL/yow==@linaro.org
X-Gm-Message-State: AOJu0YyMWJntEWT4buS3/QKElnlvpOV2k92qGEBOrjksBQ7RUNgyME4e
	0T/ecPzORdNVbME7MjN/452hwAJP5YMjk+B8rnoQC7HMgmXAr8xJAx/sk3EANU6sdQ==
X-Gm-Gg: ASbGncu9T/NpFag+nIxwRIan+rK7LPimMe5cAhMGYUP3xcyiFoC/K98p+KQPDOBX+8M
	elFMKpx1Zo8d6PosedqZPENpDFcsg+RS/p0YxS5i8Vm+F31Nda3c6jXS2DRZilcMeSVICG54/j7
	5aW5/xgtPxTZt2xzhvST5VUtfzD9mB5smYil3fe05tRA3Wfjxl7IIQoBgV33WwuUEl1xkSr5VbD
	FWrW9flfajLADKQ/1OFssH84UntETRNzu5GDs420U4LspvMZhpuJbXtKJT9o/SyHFSez4b4uK9O
	HYFmKuhUTpfTYDFH0+MWHsIFU9QHrttzwX2FtRUw
X-Google-Smtp-Source: AGHT+IEtIVHuMX4JePWDBmODChoDsS023u64Klr4UMTovaWNd58dYG/vCBHgFErrNE7uDGnIEc9MDA==
X-Received: by 2002:a17:902:e541:b0:21f:5063:d3ca with SMTP id d9443c01a7336-22e0863a1cbmr212774085ad.16.1746409958142;
        Sun, 04 May 2025 18:52:38 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:37 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 11/48] target/arm/cpu: remove TARGET_AARCH64 in arm_cpu_finalize_features
Date: Sun,  4 May 2025 18:51:46 -0700
Message-ID: <20250505015223.3895275-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +TaXDGRLaDsn

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
