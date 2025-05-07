Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94278njb;
        Wed, 7 May 2025 16:42:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXurEFj3dCKq+mWpBYFkTY9Io6iqO4RV+K+gVxaVJNHU672/Kpox/CuvH5PKzg+VHlHkD3k9lxehbSofw==@linaro.org
X-Received: by 2002:a17:90b:1a89:b0:2ff:5714:6a with SMTP id 98e67ed59e1d1-30aac1b406fmr6326138a91.19.1746661372569;
        Wed, 07 May 2025 16:42:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661372; cv=none;
        d=google.com; s=arc-20240605;
        b=kgU6k0rZbdC0Dz5TeQIbZo52wx1/GbuhnWUk37eTcl9cQpCL07YiDRkwwsTJp1/a2q
         nVzM4dgjM5BKgwCzd54M5+LBWXfvlYejIo2QKNnLTDNxA27llVMvsSKhvuiv9ws0Z1lI
         idZ52g5E2JVtJU6vlpvr1MSDw060InQhpYBMTuU9BxoVPqxHONQNj/TE4TI08JlGSewk
         mCtyR+hC0s7aENcPTk92cjdph1mzeogb/+J/lNejjzPA9MHR2Fpnl9WZ519TabtWQzh8
         eAqTNOSFzKaLHvltUsS2VpO1CHasdHsFmfz7C3wzvJTzixjt+SyL0PL5Cas/KI1ESIRp
         dL/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PtoWRnhexqhEbtmi9AyX1L5MqLgfQdzBe/SXZsSvaEY=;
        fh=SgtIE9mJyxlzqIENnvIAMhv4iuon3ne6BiBgqPZFO4M=;
        b=ICAJzou8g4hoGP3TWii4HXRvhDCPSHTwBybbZB/FCpPEqqMoRG9XYOK45dBhV+7qLy
         o++pos8rs/14aHe0GTuqC9x+j2XXXBjDrOx/6sB6opHIvsk7EXhCGTerLHz+CgKhx8Dv
         IwjwsClF1epekLp+ygKDeeOOMHZ97A8r6+KLLRgY+FFvPrc98DnSqSRrgZ/S/GxPRO9K
         vlEAM4eKwagDEzaLMsEvhFpBXP2Zr8mX2AqpVVLoZ0oGlNWmnHAhbU+OfMfxM/MQhZBo
         Uxbx7QxYXTF3ItyhlxnFuD1Abcyn5o4ngSSSYcPqilLXjiQ39OiA6IoFpGBB45bOO6/l
         u+Bg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eXQ9mZwN;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e7c7f6302sor9343895ad.2.2025.05.07.16.42.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:42:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eXQ9mZwN;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661372; x=1747266172; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PtoWRnhexqhEbtmi9AyX1L5MqLgfQdzBe/SXZsSvaEY=;
        b=eXQ9mZwNeCyMYIdjHJBgDBGwp0DgkI/QmWMrrh+iTaqWhteSgiEpzksU8rmvi95+vp
         kibAG3DUf1KhfsRiZYxDB81OI0YRKzV15e5Tjo+VXNdrgdWZ4VWK/mrB1Hrp2OWxDMEt
         mWU6fJ7p3wBhYEKrgSPG2zO/H1D3pIW5Ad/04q03ErKPaPl3hyc0TDiHMGtPJK6aG50X
         iqg10zGq1x4V4e8Vw/dSg972CJAIgJOTNSgHEellY5dez/LpgSzmpKRdP2R6PSJohbYj
         EtWgGLW18hYEYrt1mRaeTdRUMv+NLocFC6SnJP1/5f4WPycpAPKnGlEwnbIDbuYYQTl3
         ifUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661372; x=1747266172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PtoWRnhexqhEbtmi9AyX1L5MqLgfQdzBe/SXZsSvaEY=;
        b=Rvdv954LgBQkGAY+1uQySV3I05XIai7eYqXKOGSO+KVFmivLuThx68kKCj/N3E4Tdv
         daZOxZ4H6oae80VwCuMii58cBeMKw61IWqx2ddeVyN22cgXHtsv+IGf66LRHoYKPwAV2
         Dt7Kp/7hx+P5O7r1x9JM75rKp7Ju8jm7Z/1TwY91Mxq1E9nSoNEh66UMph6n20rau/gz
         peu2gbbtFTkL1UrxvfHRCCQQxEbHTzPAP6zr30zYDm+ODEocwQAu6Ry8txIIbaJZBYSQ
         /xkvj2JKXiswUU8qLucgSpZdRFXzPCLPLLLJhFOA+F+o/pL0jL1Ft8EOnSr9As0W/h9h
         PlEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX42Lx5vlcsvOuJBGvT6gp4/CiVag/Aw7YlbOgPDqp0L2Jcrm3SnWjZoGVF4Dv0r2KILEKrw6/QfTS+lw==@linaro.org
X-Gm-Message-State: AOJu0Yz2hPa1LtcfSn0S7Dzwnp5VjPd1rSe7H3JiaXLHzaH5jf+E3hJs
	Pz2q2kuCbFuH4eYIzkAkqwbzzI2iDPg/D62EFhsLVGqz848ky6oNjWW1K2IVaNwLVw==
X-Gm-Gg: ASbGncuZxfsThGISghLcK8dTM+qv6idfKFUdmHFaVwl2rxolT/p+KTYrLBGVOUK7HM6
	xmqWVFNX9LaKw5Pw3eABzrrB3sFDGTYpd51RD8WJ9me0yhryMYW8HXld3SEFoYhaDmTNxjWu+IB
	3PFgD9QjBkvEk76D5jePEa7+Lm+qwrQrSANq1Wz3x+fTQRgOCtuuHoZgkYQTavI7RAJL7znIHh2
	l9wwvDfto7DdCaBUzMK8KHTrXxQRh5GMICLiw1zRBHOW/KMO6Hsd9HHDMn/DtMLX6RekMVRc4CB
	lm6ukllOdmI6VFLCz5pNemZSQp1J3bOsVzVbebKIqFeeEgOl1xU=
X-Google-Smtp-Source: AGHT+IGz/1Yr+OHRltxAQC9cICgktOobj+PQsbldqBW/j2h25G+9WHd6ECUvH2fDziFXcVGW5vntTQ==
X-Received: by 2002:a17:902:ca95:b0:22e:7971:4d48 with SMTP id d9443c01a7336-22e79714f3bmr29689785ad.45.1746661372116;
        Wed, 07 May 2025 16:42:52 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:42:51 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 10/49] target/arm/cpu: remove TARGET_AARCH64 in arm_cpu_finalize_features
Date: Wed,  7 May 2025 16:42:01 -0700
Message-ID: <20250507234241.957746-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: TvxePxOQ81tu

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
