Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19550njj;
        Wed, 30 Apr 2025 23:24:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWcbsz5Czo7f1LP9nwuWb5lAguYr4IksLgTCSnjbdQ+z43ax0nE+kCGomROCSFbRbZCfFyM469ogthPmA==@linaro.org
X-Received: by 2002:a05:6a20:ce45:b0:1f5:839e:ecdd with SMTP id adf61e73a8af0-20bd6656f39mr1900749637.9.1746080640773;
        Wed, 30 Apr 2025 23:24:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080640; cv=none;
        d=google.com; s=arc-20240605;
        b=cHTNRdXpA4YIECM2rsiVmeWDv207O1z4NlhYYkqskzt0nMecDVwtuLSxsmiEEhz6cI
         XnI7+JPyoytaeDkEMxxXIzP41YzyYNO3rbPqcKILum1v1h5pfirzkVP1y5hSyBEjYPAX
         78sY2U2stXVIIZPW+WHs6B3YPyZ4LPe8OxokS9/ciYVzkTSOyU4hiQZF+9CqqSYVGpwx
         MQAQSMIzUKQZGdi76/QgfsgmA9ySyfxuudp+SGdwqHQE1YxSrXdqmdyvDEU1ubwj3DZf
         4+Zm8OT7/TgeRTXF3262t6glTYTeV/OnFDehZl3FrUAmEuRWsv+3hNADoe6JYwchnYNZ
         7edQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iUi/Pm8PBuXUf0tGsedeIwPfTJbQS6s9US0oEnWDi/c=;
        fh=ZhTCu3HvvWoSsSqyz8fB4ZA4k/wXlgy+OPCqcOLqDNg=;
        b=fYgnuchbFGmHP9MhiBdXW8J1nk8Z58s/061drS5VDnm7JHGnp80k9KiNZBirxBXsZe
         ULzltov9kD0LDun2wD7idm8i3AjWu6v0tQRSZEqchk6fSq9J1+FQjJBVTX5i+2tzcCk9
         KY6ffs64VV61a9ozaHlGfqV3ym0nzU0y+NngJARw+cRJRHwRg4UlDspQQYzBuTuEFxSc
         7TDNuFP+VLoTdFrpGRXJeZOb2i7AGnu/hNEBfJvqYxgh1wJdYWXeBs6ztSS6tETT+5fW
         DFurSZY/1qQaCrEYBFT6JH8vA4w6kCDIzBQyG8TO/qFqQopj+sLfrcQ6+4Ot63cat0HF
         EDLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LXRRs0km;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404fa0b34esor77010b3a.10.2025.04.30.23.24.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:24:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LXRRs0km;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080640; x=1746685440; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iUi/Pm8PBuXUf0tGsedeIwPfTJbQS6s9US0oEnWDi/c=;
        b=LXRRs0km8QBBsI+wfbGyAK9g3btfv0poD6TWW7tSNFD6VxW7hJfn5H+GpGYMLNnWb2
         ANZ7DhNyJk+NtNsFbkDs5SHIngL6sncmcyJgWYba4dGd1iAOu3iqqGFU2Rgp/TRaLqh7
         HhQcNJodtk+RONuOJUWKP81qXfaVBGfeimKHJVM8UgEUjT42ufzxhs6xmaBwXV2OEZpq
         CNX2hU44DuImuDg6lW+tUZ0/7dUnNq9Fkx6CJQP1eo0VupQMbOnHtUHpcAK6CHWlVQD0
         URhFJVkPYnUyHqw/4s4G3UrTq+5NlW7L4DPlkxlvDQhaDnNCtlssCnP+VFeRmCdle74s
         JtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080640; x=1746685440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iUi/Pm8PBuXUf0tGsedeIwPfTJbQS6s9US0oEnWDi/c=;
        b=liAga8dtkZFUV8pO1+mn21wbINaV7iXAGj0p4pWuzT9KAzxZDprUQV0C4rykCFX6Vi
         56Ux51ROtFMJCIFXagxOPGnPPGVpLVOQM5A9KIEVi5u5hdmoSDdAEy9D7ai2fBLy5NcA
         i88b8QUbJap8Ylz6W1m0ZeMBcz9BwIU1Q8uFWWANq/wxi59dLncCloHf0Pdh1s94SUuw
         HkN0lY6h8SL319sxVXUKctRrhaEE2Am06Plizq8a0zo5j7XY13kVRiUiRZMbtQxoBeef
         s9MdG3xBjr/hSNz68HlC9FUbGJhgj3fMML5xl/dbEz02sMvfIzCQ/Lk6bjUG7pzYyN6k
         +alA==
X-Forwarded-Encrypted: i=1; AJvYcCVSX9XAf6TKi3GItqTZIBVcQHz7XFeLMYszh8cizloIBrqNZ6mKmalHvKIXU5S6tdVAo5/W8LUxd4jATQ==@linaro.org
X-Gm-Message-State: AOJu0YxeongwUvlq1zZOcQpMNeKD/guBQ9zvSiCIwHic8g5zgtO37iJH
	7c63A+FgGGKEfi5kD/N3s6NISl7lrBUqCZKW8cpbNZ9kndXBH3vN9ywsiHmkl2pCZw==
X-Gm-Gg: ASbGnctxGYO2cUY5tP1i8M39voDhdQyTwJU9zDrJ9Fv7jx3tN71rFmzpC0vSVm6mOBZ
	mSw9jes9NK7VSsZ0M9IBpBGvAEDGvfhlAvL1h65tdtt6zUoNc0kPf0qGodDigfKFUsT6tEfrN52
	U5j2/gDUq2NKmlYkGH+bjisSgor4OIgjd2iRUCHnxvCVRzmiAzWNPHgJlUHQcAYLCXSz0mOv3zD
	mCi0dp/m1cbHExCNPm696E2yAC2kQ1G4BsjF1lUWHNSUg+8pQx0NGchbLGVt9CLF7KN2DrziP2d
	riCEtn26UP+l2yTc4JMd5p79cvyPS9lQqWLYncJH
X-Google-Smtp-Source: AGHT+IEKCWILcumjzPYh4K88LZx1Ow96si8ow9v9pGjanxvrTsUmYYaf0THPQ+j/vY9E0cJ9TrpOqw==
X-Received: by 2002:a05:6a20:3942:b0:1f5:7007:9eb8 with SMTP id adf61e73a8af0-20bd6a55a1fmr1761624637.16.1746080640303;
        Wed, 30 Apr 2025 23:24:00 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:23:59 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 10/33] target/arm/cpu: remove TARGET_AARCH64 in arm_cpu_finalize_features
Date: Wed, 30 Apr 2025 23:23:21 -0700
Message-ID: <20250501062344.2526061-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 1vpU72AWmcdm

Need to stub cpu64 finalize functions.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
