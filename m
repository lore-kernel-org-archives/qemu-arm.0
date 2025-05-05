Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778410njj;
        Mon, 5 May 2025 16:20:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVUKAFcTMpMXzp1Fcuo6xyssEombtufURj2goa0WftcxlTAg7ySZH7jHugNTFUpy2zW4iaKrphdnc1ZSg==@linaro.org
X-Received: by 2002:a17:903:2ecb:b0:223:4341:a994 with SMTP id d9443c01a7336-22e328ba7e9mr14326885ad.9.1746487254628;
        Mon, 05 May 2025 16:20:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487254; cv=none;
        d=google.com; s=arc-20240605;
        b=lNHEcrmIOQMy+qPPGevrEKRBQatHFS9qy6sLA66sPUl0JkWhhys3XQ3BstbUlQIzda
         4bGpFaIjVGk/3FO1zHBEbBvAHMKtI3RzHsHmcADO9vWM1bmZBQdOrAaLWo+vPMieV5Ag
         ROTkrG+fbn5q4WkIYXW4EN/7SX7AA8sV7bovbZCGPkxnnUie5vSNngcK3TYzMTL8viPZ
         plvIWFCX63LNluI0dNNat+NjAeowjvaV3F/8OJv1dj3FhSbhLMf5tWwspEJGS+xxg4Ft
         XNwXPIU+qK1TPIpIHn8+NLgb3OR6t+nPR2LZe+Ni8gySDZ8KImfSYaWPS09jsKabmFks
         vYsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RCBMR6tP31v0B0NBZf6LKRmnPLfJofFf8No/ewC08TY=;
        fh=D4h4MhVbpv6vFDSrhC+kPZ3kCRxoe1beszONJY9/V5U=;
        b=PsLs7oFtcMtDIBNfVWhnEN2oCw5wG1m9ZmUlarBudASKIr+zbo0+htaWUk3C+En6bR
         0c+TtfL2KFFJxmJhyBiH5Vnvi1BkZlzDt2nezbmnUXDQ1mBrEejI3kPSNPYrbpv5fxm1
         k6XJGSh2EaOgZuNSMfgz/xND8gYdoG025H1Mx5XTQ+mnUtV8GiBJgzZt37NhqpyZ4NnB
         cZaljnNzAoBthUhNR/FJre/04HJhMT9ptiRWNZW8o+CHKb/2FYhVGpUqVAmIGAlpZf7c
         6R5t1tTQS5i+1EwaR2Emgh6TD0b1voMLc4EOxUGWxkbMe683K3wnctZNQEH6bAuGfbI1
         FkcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uWqNVTx0;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bc7e0ddsor57445225ad.17.2025.05.05.16.20.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uWqNVTx0;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487254; x=1747092054; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCBMR6tP31v0B0NBZf6LKRmnPLfJofFf8No/ewC08TY=;
        b=uWqNVTx0ygUx4VXbIaCSMvG0kA5zubLtKO92y85fodto2PxMZiLcaDOCatpB+F7flC
         Shogxs5S05dDauVw+hOmNp3liMlZ9CSP30vLH0S+cAHkjLKG8Uhy6T89p4KwWqmuxaZ5
         Yu1UtQdjafg1WV1JZovA6Az0Yfn6i+NF5ZjomUGaze4F8V1fajEFEtAQUYFZqm7dG0pq
         AaR0rHm8mkDEYjkiuKoQ/gTdQsyKb9xapghD5DfeJMcM7DXGD+m0rpU4/GmEZ9g4VeBo
         UH2S4LPicK7L82bHPVd3rgwEZSNjJz2dpiPoFqSy06pjHbbZWcT2RQC4hyTw2y/4Kmbl
         MFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487254; x=1747092054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RCBMR6tP31v0B0NBZf6LKRmnPLfJofFf8No/ewC08TY=;
        b=Ef552IHmROuQWAwMnV/gYS8FZcSbY4BOt1ic6uVbt2WF02JL1VNdnJh/Kao3EUMS0A
         UnpGat6ED8rUi58w0iGRH+GlhFxayQXZJjGtNT+vMabwIW4bhohteqrv7cySNA8H1Edg
         l5p+tcEm31SUgw0y6u3cDraCMpG/FSBJqfDOmNoYKMBvfmeBQJOKC32gN7kWOILu/flr
         8kAUSF4c99b4bRLrQqctfMPjsaQM9vKJhg+oM/oa4n2rndG7BRSnzqL6eeY7uJfrO84t
         tA2d6ed9i3uYqRgHq4jQdVY2EOk6S9ydBS/qdMJGWkYXHuK6nzpTVEfuNUVCVFsML0Qy
         EOtw==
X-Forwarded-Encrypted: i=1; AJvYcCXuLbj5WgJEO29n4xnnPT//qRNEzeIbFEEKAfS54SlGoY4s+lMpRtWCgPn/fq+VlHzaxpXUvB1j6MotIQ==@linaro.org
X-Gm-Message-State: AOJu0Yw6C8GIXJ5DaAAONEJRYgDCUxiRyPH2waVO2VN7y6JykbN2Z0I6
	nxfoyStF6qNRSvRhdVMEXD0eHYxrpJAlHtF7dtpYNIai4AH+pp4+05L/p952Wb9EgA==
X-Gm-Gg: ASbGncv1zs/W2zXXbKlMjdQseDmGWFpXuncwJDM5edeSMR2OIEOFFHiKrafyQ3/xPY/
	GhsjkyifkpxkP0H5eHs4GXciY+ZU6DG55sKZ4Qanniur2AIRnNwZji308i7b5n5p4Ak7y5hjOAP
	eGAod+UAQCqccPb7fiL7lh29CsPLbqDMXHef5S05PrLfe9TrN6WiPE2EsTA42in82YkdqnkjQqD
	7FZkk95hMYxMiaWcpGxhWT10o01smNDeWSo69ed+sb47trTP8Vwbq9xZKC/yZbQr4Pqh0g7g9CH
	fORiDvTM0w/Q0blFBN6AI9IxZyxeGMndOnfxhO5H
X-Google-Smtp-Source: AGHT+IEEWCUQlzVgGthYff6k9Jr792b5t/XjUuobOuK1wX1EdUQjPmf7ipfIT8E8WlUj0rABldNgmg==
X-Received: by 2002:a17:903:291:b0:225:ac99:ae08 with SMTP id d9443c01a7336-22e328b6d64mr17397715ad.5.1746487254221;
        Mon, 05 May 2025 16:20:54 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:53 -0700 (PDT)
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
Subject: [PATCH v6 38/50] target/arm/machine: move cpu_post_load kvm bits to kvm_arm_cpu_post_load function
Date: Mon,  5 May 2025 16:20:03 -0700
Message-ID: <20250505232015.130990-39-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: RX103Owk4iyi

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
