Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1004588njm;
        Wed, 30 Apr 2025 07:59:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVda5MC4ZuiQhE/gcyeFNfy39vHrdGQwCx3DkYkQN9ZlxtZwHgRokL+VFvADNICFDXf5zQvVIcgF8dteg==@linaro.org
X-Received: by 2002:a17:902:f651:b0:224:584:6eef with SMTP id d9443c01a7336-22df5827b6bmr49349045ad.41.1746025139902;
        Wed, 30 Apr 2025 07:58:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746025139; cv=none;
        d=google.com; s=arc-20240605;
        b=eH1SeKFrWDr3BXH/Ni5D1xQkk/wjEyr8Hwc9EmppkHdwcoHuiN4nrvFtwPlP+kUgOu
         NJKJBWzHLWA9bNg7ykv7FMs/AqndGsXDrzvidfUJJpzEP8sHX4qQbNHJBKR0kGCqEjlL
         lPwyM81MsNcrmfaKXzsDcAjmiggDRwHr2cqEzzudlwtaCIchbo9NXcVtKYnoZFyX3jIJ
         rFT0eJEFWO7KV1c26mhzQLCYSdSTfEnzisf3IQK96LvGzEHJxBvYtqgFR2adkCugAjGw
         XATww6YS5syxNSbe8SX/YYH7y17pZ4dzICmQ4gHELTv7VfHal/05SSGdfOW6SvuaYjgz
         frMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ijNdOguPfwk3cK3WhRDHWMHgdilsTL/0Rfwd87XXhiw=;
        fh=fzc7BY1H5bIzmXjL2QKtBHFgHllIklEMzSTT5Ll6shI=;
        b=BfC0TKZIZcpJoCYJ9B/9hJjJhQsRgIbwEwAGp5rEqL39Nlqwu/7ey1oB8L1kaYxpWT
         bpzacKP1DoY0a3Ktj9dL8wKwL8LEWhVMmEg7WOT+UxDD3+xWVLgVTEe9o9HoQfD+0xXp
         YWUAtuxgpiVtubeL8qz6+KFOywG6v9SQF/6BsXFc2zfG5ewbm0kf+MTt/FO3H17HP5RI
         a+hFLjhA9iMHTFy/iNBgKfK6YSw4KNDTq6SDvSH8MQFiy7kJChZWQ1/ah4ONgZrdy7Kt
         eNNGPM/8Vx5pX0bxZI1hZEMSAjJm8IvaH5kBHkt/aiJUwrtS0raPUdS9YEOakwV3qDGy
         YmUg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lg5JAIHc;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db4dc5e01sor89883325ad.6.2025.04.30.07.58.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 07:58:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lg5JAIHc;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746025139; x=1746629939; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijNdOguPfwk3cK3WhRDHWMHgdilsTL/0Rfwd87XXhiw=;
        b=Lg5JAIHcD5udPvcJRl6uxB2Lvh6KHAaDh10UtcSy0lhqM/U62me8qriKvzC1wUvOdy
         IDR1jbwK1NOTTBGbbIhPUOUVkvFOJWBdbw7TDmfKRcZw3bw6jBMG8bu689jE/RjgK1Ug
         ZHT8Pd78LypBrc10szv4ejJ7NF16N9uDJosxHk6swDxeCKl/AmFA1OItQFs9OHywMXQ7
         +esChCp9NaMjyuyV0ET8pr9d3e74OW4OKgCR73ZXj/K3/fxoR8FmrLaringZkmXqQ5ak
         g/YYNei1wpE3L20bEpID7tLbtBngK+eK/cnq+Xh0/AG6zir8EuXqwQegjgXU5gZIJHW+
         pVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746025139; x=1746629939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ijNdOguPfwk3cK3WhRDHWMHgdilsTL/0Rfwd87XXhiw=;
        b=gEF9pV39RmAdPq12jVvVrOGLzPIvojwjDblDAR+LAqllzdZNkYk4L4Az6XPOm2tbLg
         imfG3EqLRXhK24GyuU/qWm+8ffHbmyEner5cgRwRDeQkb4XRv9yjOUGP5WXfWeu0eXWV
         I9EOqj+aCvmZK9XQ84etIVM7WNw8kvfXZT+cgPG/EQr6D/+o2dxkhFIyoQKum6OOl6Bn
         TiH0iWrW2ZQ5ez3pmH0w3eq6dgxOJVue1ejG6BE/oRBtIjlp5lGA8RHRAYw0O9RtRNfp
         wFQBB1G8JK30vFrSGowFXQ/baaCiiXCiHXtu32vpe08m1NbLLFoWTTo91ybLJje2jFW7
         7f6A==
X-Forwarded-Encrypted: i=1; AJvYcCVNQNcR8omoGtyqL4omL6tJ0COibrm9EJKI+wHItGiAyxznM/2wToutHWQ7TOv6DktIUCujYZAvuSe7NQ==@linaro.org
X-Gm-Message-State: AOJu0YzdCL4238kC5UHjoeAmw8vI1nHxM3Bskvob5nzIKndLpow6nCbf
	4JG8gZBgzxXmq8JtaWxVRmEWtddVI4cWqSapLzkMbGK0jRCgnV7YprGEDVOHpKQalSLr9AW3dCe
	mph4=
X-Gm-Gg: ASbGncv8roUBGoSoYEPqVE9UI9pJI9BWEdXkKSgSLC92r7cmQwCDKHEL41mK9OmMflU
	C47UujfChJqNGnMykmXQvmbzTFfGNbbKZ7cCg/R0Mn4b2MsakPZTUGTyywfFSCaprghWvahKwlV
	UrNHxTWDqSUuzZpfV3XkEX7Rw6XG83jsuXGlOdt7A5FcHNZed8xww/WqD49wFQs1xlH4QTrh5RD
	bjufE4OJ9y5dnd88DEufTQJfZ85v2VJuMrYy51ZDi0F/ongBasOMaNvAVKvdm9CcsHawtMqZyBV
	fELQiuuFTfh31OL1fcpjYHCDcYwrasSpw1+dAX5+
X-Google-Smtp-Source: AGHT+IEtWQgBR1dIPtKgtkqPJNvg9G3OixpeD/ih698aPZOgwyFwhJdy8XlkdVtT04JfqY+wRAy3tA==
X-Received: by 2002:a17:90b:4f47:b0:30a:255c:9d10 with SMTP id 98e67ed59e1d1-30a343e8b08mr4234791a91.8.1746025139383;
        Wed, 30 Apr 2025 07:58:59 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a5bd78sm1705652a91.42.2025.04.30.07.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 07:58:58 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	anjo@rev.ng,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 10/12] target/arm/cpu: remove TARGET_AARCH64 in arm_cpu_finalize_features
Date: Wed, 30 Apr 2025 07:58:35 -0700
Message-ID: <20250430145838.1790471-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
References: <20250430145838.1790471-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: v+2tUduF4KSE

Need to stub cpu64 finalize functions.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/cpu.c         |  2 --
 target/arm/cpu32-stubs.c | 24 ++++++++++++++++++++++++
 target/arm/meson.build   | 11 +++++++----
 3 files changed, 31 insertions(+), 6 deletions(-)
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
