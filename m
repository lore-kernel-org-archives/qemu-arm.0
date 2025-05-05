Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178928njj;
        Sun, 4 May 2025 18:53:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWY8XZOjCwjLMh2DS+jxVcRdITUc/dl0eq4Lz7OJRLL9c0a86YE1FbTopGKDCKsfRD3FyKI5HPpyQn/aw==@linaro.org
X-Received: by 2002:a05:6a00:44c8:b0:73e:30de:bacc with SMTP id d2e1a72fcca58-7406f07fb81mr8210259b3a.3.1746409984226;
        Sun, 04 May 2025 18:53:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409984; cv=none;
        d=google.com; s=arc-20240605;
        b=Iqa/VBPr1Xv41LkNAORnFHp7Gdfncd/Rh3Dj2l7fRV8iW+PmKNC1PbaLjnkcBM+Xkc
         HH+KRS7oXYNgkgE0Y1K0MlxPn9el6zaxbh+rZInZDudR6WWGG410soYs4Rk6Lk0O+Wtz
         zKdIpO9lU/9AmDw1dDEFkvj8OIWSks1DvS2z+BZYdWExZysgTMhOKVXiqdLHp/PUEvhH
         Wbq3AfBHKO/QgTW+oeHOytAVVgjwNIpmO7S3gDW1KgWd53uRg0hI+koNS8XxCuKYCWwT
         JjfhG3AJ2FUXCWEyoSl8Ymdc5WwfGFp41KDFtWMUcaWu8PEv2PA43Xzr3ym96YsVcqac
         5nWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RCBMR6tP31v0B0NBZf6LKRmnPLfJofFf8No/ewC08TY=;
        fh=YFLbvPYc+YQWvI3P/RLfaajDC99RDPo8urQIz2lWV3c=;
        b=GVO+F5UvYqUq28pjjXQ8JLr8+8iCJkVP0OES5HMDrILzGj2rtSZe3sbw2VGAqqVn5M
         yCiQiyTcAU3nG76yb0RVminlJt6x9PrlZ5WKb9Yy2LlNo3a4sY1Vxil7Ct+AdMuu2MgA
         bvrSIzXOvXc5K4hDd6qXy97zP84Yl2G73aVSY3GBqJionvbhE9kBo4AFJFC67V5xB3gB
         bk1L9EX4n08ZIZWbbYDat1xAtHAckg4UBh5DjQg5kvIWRgqhYX0NFtiZWNEJf9HZJCJT
         NKHOX9+v9IF5RNRoBkfVF4tPvZivmVktsud9Worl6iRfUXzkwbBNahO3q16mOkK9K0fN
         N6OQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nxgnynRO;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-74058d9425csor5306456b3a.6.2025.05.04.18.53.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:53:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nxgnynRO;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409984; x=1747014784; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCBMR6tP31v0B0NBZf6LKRmnPLfJofFf8No/ewC08TY=;
        b=nxgnynRO0/vfE0cSAljFdnmf0w5pwPkwE2G5SvGBB003/xGAnGNBJ96NrOGjWDoAAl
         7FcsbGguIA4GHJD9NjLgfcBKDjrWICcVr9xZ/6llR9IEnlT9T89Ev1UsP8EEC+jHl3nz
         FR63kW3JligKhY3GmIkrUBvELiNaJhSEbtxu3HxjjgKgnlDa8iW9m7d+bIWiqrs8IopZ
         I+u6cPNIapruFAdv24hwaFSdq3EdlDE+vjC6yOG/Uhyqu9241mq+RMTsEojRM4TUXVcE
         lPcBMLyI7r8EkH/s7xaaNqa+9tGPS2d8AUwNFsXU1vgnhtqGrlXeiZosyO1IifOIKucw
         424g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409984; x=1747014784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RCBMR6tP31v0B0NBZf6LKRmnPLfJofFf8No/ewC08TY=;
        b=cDG/cfD5NOgeANdfLFf2vDJrTcFjOaH3GEHyFuaWMQZtnxeL+riYcpnZaW9h0aS0sD
         xheK7DcZFJAoxGvcSZ0ryClozplOZAkuRuA9RriRlUIsAzr9ifonHHWQOJhNQjbiVfMN
         EJF+OSj6NQ5yAf3mkJuXb3enh8Vwcse+xxMWyhK0+grcPyeEqdbHCo9wLd/+cZH3G2Hm
         05McpQizyiqNQBfVTDCjo94rQ1tILJLUBnQHsL72MIydRyGYjOgLzGmEoIjjHqXVIOSN
         TJfpJ20KB5XYX3BzBiKCrLTmfWLmALga9SPZ4P1IHRgK0aWD6GSUbG2WDt+5FaW+E/fK
         j7Iw==
X-Forwarded-Encrypted: i=1; AJvYcCV0mEe2wMoW0CMa0spH0DNbs9wkBI5d0pVG1vbIOwmoY6scSgIWKekY5BMRNI8twIMP49jzhMTiiy3UGw==@linaro.org
X-Gm-Message-State: AOJu0YzNUDBFhmktfx8bIv+aGZ31RCTQWfnJuXGUfTnfBwXYjEI1eR+u
	WebMfHPkp+G4n20g7S3xguME+yyvB0qz3AXV9HSC0yCN+zCHF/91hL3IpeNhRzC4dg==
X-Gm-Gg: ASbGncujCVDjen4YHni1u84jArjt0xijjSkT7v6j7/i/U9RX5ovufBPd10Z4I5uwASv
	9gkyG+k0vkpliQ/TFPHlgGr6uyeq5D14+OrrFoQvTDp4Fa73VeqLx9zBa4oTDqvSxU/L6ss2m5S
	OmfuNTojFVlKT6P9D3AdnhzE4wMBHH/JfrrBMWtdzODI6uPdZOGXPvR1Rigu6IDtfRPS2SpE/cv
	l1gi+f8EGLhVxSveTm15dFPq3zppJDgq4WkPgOMPlsnJF2PlLUAT0bwDAjwNUmcH77lBA3AWVCz
	Doyu0CHHM5DwBtXh9vswnybx2nxFCraFn6JI4+8Z
X-Google-Smtp-Source: AGHT+IE14LFS/k60IBKIkWbmJ21gqOAFxrj51tLDJH6tuiS+nErdOLx6heXp6VXr6xQ79bIRJuVdBw==
X-Received: by 2002:a05:6a21:3295:b0:1f5:8e54:9f10 with SMTP id adf61e73a8af0-20e979c9932mr8906025637.34.1746409983790;
        Sun, 04 May 2025 18:53:03 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:53:03 -0700 (PDT)
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
Subject: [PATCH v5 38/48] target/arm/machine: move cpu_post_load kvm bits to kvm_arm_cpu_post_load function
Date: Sun,  4 May 2025 18:52:13 -0700
Message-ID: <20250505015223.3895275-39-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: QPoMo/mVmN3w

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/kvm_arm.h |  4 +++-
 target/arm/kvm.c     | 13 ++++++++++++-
 target/arm/machine.c |  8 +-------
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index d156c790b66..00fc82db711 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -83,8 +83,10 @@ void kvm_arm_cpu_pre_save(ARMCPU *cpu);
  * @cpu: ARMCPU
  *
  * Called from cpu_post_load() to update KVM CPU state from the cpreg list.
+ *
+ * Returns: true on success, or false if write_list_to_kvmstate failed.
  */
-void kvm_arm_cpu_post_load(ARMCPU *cpu);
+bool kvm_arm_cpu_post_load(ARMCPU *cpu);
 
 /**
  * kvm_arm_reset_vcpu:
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 8f68aa10298..8132f2345c5 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -977,13 +977,24 @@ void kvm_arm_cpu_pre_save(ARMCPU *cpu)
     }
 }
 
-void kvm_arm_cpu_post_load(ARMCPU *cpu)
+bool kvm_arm_cpu_post_load(ARMCPU *cpu)
 {
+    if (!write_list_to_kvmstate(cpu, KVM_PUT_FULL_STATE)) {
+        return false;
+    }
+    /* Note that it's OK for the TCG side not to know about
+     * every register in the list; KVM is authoritative if
+     * we're using it.
+     */
+    write_list_to_cpustate(cpu);
+
     /* KVM virtual time adjustment */
     if (cpu->kvm_adjvtime) {
         cpu->kvm_vtime = *kvm_arm_get_cpreg_ptr(cpu, KVM_REG_ARM_TIMER_CNT);
         cpu->kvm_vtime_dirty = true;
     }
+
+    return true;
 }
 
 void kvm_arm_reset_vcpu(ARMCPU *cpu)
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 868246a98c0..e442d485241 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -976,15 +976,9 @@ static int cpu_post_load(void *opaque, int version_id)
     }
 
     if (kvm_enabled()) {
-        if (!write_list_to_kvmstate(cpu, KVM_PUT_FULL_STATE)) {
+        if (!kvm_arm_cpu_post_load(cpu)) {
             return -1;
         }
-        /* Note that it's OK for the TCG side not to know about
-         * every register in the list; KVM is authoritative if
-         * we're using it.
-         */
-        write_list_to_cpustate(cpu);
-        kvm_arm_cpu_post_load(cpu);
     } else {
         if (!write_list_to_cpustate(cpu)) {
             return -1;
-- 
2.47.2
