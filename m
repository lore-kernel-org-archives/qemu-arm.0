Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42991njb;
        Mon, 12 May 2025 11:05:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUFNoQkY+RYx6orKvLXnjo89dTeryR0cMfgEBwrTmz4N9apJSskw+MY+4qLziPpYVAXIZR0jeekKQN61w==@linaro.org
X-Received: by 2002:a17:902:fc45:b0:224:122d:d2de with SMTP id d9443c01a7336-22fc8b3fde0mr217599365ad.16.1747073144335;
        Mon, 12 May 2025 11:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073144; cv=none;
        d=google.com; s=arc-20240605;
        b=jUtJwayea5XX+SE31asA22vsk772DLfSgaEm+KfqJJ28/cu0PHKQxTY2u5pefx7DSq
         xGEfGx8a1Fk6dNAILiYThRPEWEIJw1VvD5BQodYig/6TcZ6axk2svr2ZOx1140UO1n9a
         d7+MGobG+GnehyfJmbrywcOmgEl1G8DshgGBdC8M1XEoQY24Cs8QglWABEGhFjVtJvwB
         hvWNPRxVjM8/isMJPwUXBo9Et5X8aCnvNKO88MVZK9+AoqOcT9q1j348b9qmwBy+PiI3
         Xoqk9EyqwiwxV47lACMwwKoWK3zo9RNG1TfP7gG3S/0a0HFx108n9dYvp8Byy5HhXe3F
         ghGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=HNwQBodHKU/YNnzJ0OLvvAjHAnJFIjZ/+9H8rnLNev8=;
        fh=aEcKhu9DRwmHq8GvUjsRslwJ1dvd5CdAdZqWmWs1F9I=;
        b=KY72cLFLL+f1aP5mrgXHQG7dJnmmYVEZhS/HihzkDb3yrhI3NESMezSzRGl0abBV3Z
         ltK94eJeC/H9H4Elf/QoFXV72iM/jANf02RT7P6g5gfygl2ut3u+Gp9bZnlDMUq4leX8
         T3zRkdWf3PHw+HRzvhtl5FZELfN6G9Q/exYm8MA+Shj9CfI0wI+VHb+FLECViUEjcTAg
         k3+Ixotktxv++4kprtE6+d+LIPy2oQHNWMzD9sDr1vgFBVnQXAVBLLy5ESpaCbEkyKZ2
         5XLmgF8ljAKreukWiFzNt/xBLF9eWilYYRiL5GDQl6yf6hC3hob9JE0Gs+Hj1A3Lb9LI
         O24A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kZm6BfjK;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc6f17b66sor50559315ad.12.2025.05.12.11.05.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kZm6BfjK;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073144; x=1747677944; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNwQBodHKU/YNnzJ0OLvvAjHAnJFIjZ/+9H8rnLNev8=;
        b=kZm6BfjKToZL+B2S7uUGe2oGnJjAGiksHGqOpT/+GtsjEJ0O27I32cO4ycZ0zPGZB/
         unpqZhv/tV0KlJDwv882jb1Q07JytLazwBO/ZTPHLrgg/j64EknSJdQtMvkwFOc0dw3q
         EplDZyTM7WT9X3g9MFUAQQMngMJsNWIrxIig96Gt2wwggd+N8q4A+vsgLm9bi+1DZZMO
         huRrtj5JFr7rDH71N5S0D7BATdZuzwXzlUCWK14FZyFGfhKs6bv8X+gZOBTBZqcRcQ59
         lTMMRN+79s4T5ZDVdBUPmNSyr8SZNlIsV+o27kX4T6XNWk21jJbVjWeRFb0/sQgtJoeJ
         6ieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073144; x=1747677944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNwQBodHKU/YNnzJ0OLvvAjHAnJFIjZ/+9H8rnLNev8=;
        b=X0Lij0G/WJor42H5uDYO1ixLYP2z/1dZlOaxy0AIByHOODCXqGAyvMYDeV48yIaxRQ
         93GSw9LrVc3LgkElY57J+ynsNw1RMnHdfdRCKaJ7W4um18S0EOFMmgRBty3RWJn9SChL
         HHFUeMXsF4a3deRk2VlTjyibf9sGo8R6uK7iXA6UZ4OsuJvcAS1CrPewjefMS/HwP1KC
         i7RvUlFSoaAj/IUrPvihtkggKhdax3tSkq2SmKiZehHIrOHWZZJx1/aERAUESSVLxJBI
         kutcr73p3zvukw9lFLT72g95uvYmxVlKyNX+ZwRTW1ZI9QVYZ1l6FXC33v6sD70Db+Uy
         Hsag==
X-Forwarded-Encrypted: i=1; AJvYcCVz1cOFPpGLP2XpNzkXfnJI24Lw9zlQadD556ysyv9sLBrxEQg2AWMAqIT5w45tgzLwkwI57/zIW0GwBA==@linaro.org
X-Gm-Message-State: AOJu0Yyok3KNXjXoh4vzhFCbAoiKwIH+YyFHuHkHRIrqGm75Y3juoSzx
	gQsk4gBe99LzrVDdqUU09Fm15xBmLzsdais946yTIpDdjENniZWgRuZ0R2pPrOj2rA==
X-Gm-Gg: ASbGncuUc4i85fLSU5L5FWqXpOlgS0/5GJttT3kq93fmUgvbGbRs3kbC/duyuUxvPOQ
	341HN6P0SXRpXChTGmSyoN+OWgD6xQho3Af5ffcsLfy4AMr2tcstXG6SJvOl0rD8PMa97KzKI2B
	SgdpAsORzFKLBW009cjkJrryI8rhQdj/2npeHD/ujZjjyMchtHfavGOGas000+eT9YB+kFVi8cL
	uH6UIEyLLvz3NHZuNTGLTOqfZ3zJ+ipRe39f7zp3Bo24xdZLqztjAJM18Z//dWqSm/ZbeUls1UP
	WydenNXLbXKUAN9kdj3OssB0FoGgjLKaSsZxt3AY/BiiOgXPGOT9z1MMgPMA+Q==
X-Google-Smtp-Source: AGHT+IHsdPyvkI06Br8pyqXwcLuHQL+6O0ZNsb9aqM/OXtXPB4NrBUBCNdmarJacg2dltIYJwQG2/A==
X-Received: by 2002:a17:902:e5cf:b0:223:5e54:c521 with SMTP id d9443c01a7336-22fc894f1f8mr197858765ad.0.1747073143901;
        Mon, 12 May 2025 11:05:43 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:43 -0700 (PDT)
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
Subject: [PATCH v8 36/48] target/arm/machine: move cpu_post_load kvm bits to kvm_arm_cpu_post_load function
Date: Mon, 12 May 2025 11:04:50 -0700
Message-ID: <20250512180502.2395029-37-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: xuMX4q27DORJ

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/kvm_arm.h |  4 +++-
 target/arm/kvm.c     | 13 ++++++++++++-
 target/arm/machine.c |  8 +-------
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index b638e09a687..c4178d1327c 100644
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
index b6c39ca61fa..a08a269ad61 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -938,13 +938,24 @@ void kvm_arm_cpu_pre_save(ARMCPU *cpu)
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
