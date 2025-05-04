Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756230njj;
        Sat, 3 May 2025 22:29:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXYbfaJKCOQik/VAFvdf7eWonVTHY0EVK3fXU+wJKoIPuLnksLQwJX64F5e5nwj49g61sXpFbM76YS7aQ==@linaro.org
X-Received: by 2002:a05:6a00:369b:b0:740:3830:4119 with SMTP id d2e1a72fcca58-7406f177d74mr4138133b3a.18.1746336593711;
        Sat, 03 May 2025 22:29:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336593; cv=none;
        d=google.com; s=arc-20240605;
        b=ieO2cXjC5p6tTYvhiXmgvXppxbAhCIdlz0NxqVhoQfG6praMJs0zjAPauWlH532hvH
         rwxzxXCDgFALVsXUGBZqXFLkUCXpCbA3u/VECYO7FXT45L6cFHj4/OL+XUd7tN6+tsUV
         qUFpEVlso271SEqmQ98opbO8nNfq3SEK2CK++hnao+MtjfcxZ9u6KgLsoHoV4yEttb+2
         42WjUTmAdiPpy7sMC9K9jPXsUAEGWLTc5pJuEC4+19zr7yjAa2sadZliPZopX64T0ruo
         MaGwHohSDkJoNk4yVnzILuL62Vf9g4Nds441gQKIAdeODGGjZrqxLz2qwOWQK75lBZll
         zJ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=z/CSUL0IAfSicZGUxwfQSMF+CcpH0uxTg/tJpwo9blQ=;
        fh=NiEGtC1A2n2A4UtDgr4EjnUWc6FawLY3WrrHely7IwQ=;
        b=lDNTe4hBw7afhYzGtjyAyj+LjqDMkICo2yQtMzSBXhj/UA2wzfHufJq+36RfDvzIXO
         IrG7jE+DXLiNatQ+zagSRyqXSld/CpY8lP/zA1NcKNFNjrL4wN1+A0hrJ3QhbKYxg2Qx
         YQdD4caCXoX1vrhfnBahHVbd3TJr49O7PuyYFkdl1nHr5Okdb1cipXONNNCk8wQ22SCk
         SCR32zhn06+Qb+1yCcBi922HnMBlO5lTa55Aup4nQ073hENSCFUWZrsFGSojRd7V3d68
         gAebBF16HEjSPNj1Z0Gtsd1lKSb1mPxu8sp47KSZuXSWAmHYOPgD9qoxYX9ctSlHbj96
         y2cw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xMY1ge6n;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404e5a32e7sor2656001b3a.0.2025.05.03.22.29.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xMY1ge6n;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336593; x=1746941393; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/CSUL0IAfSicZGUxwfQSMF+CcpH0uxTg/tJpwo9blQ=;
        b=xMY1ge6n7+U0uYCUfPXA6oLE//Q+5d6vBdk2c7166DD3h+ucKrNc5ziRpZzRYIqLJR
         JrrjQUDjGus2cCMNlWy0QNdXkM7hLwxWIhaGioi7N8WNP+BOFUUai4J23R5G2Jn2At34
         XOlodoUA9Z2zeWfuiwRNFr7do6LXoUrR8qgWl4gl5kNjaV040OZtzldtq8Vluo+Z2n3i
         6G2AzYRDD/MgHZJi2+C8sWpnwvNB+rqZrVvVYZ/UbbIGnFDpUDaKEUe2vTLF9XJQoVpa
         vnorZr5PMdMfzUSn0oUcvvTnnSNNXd6bCvddV00xxf8Ld6qruOyNzyUyYpppOWWaZHgh
         +rUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336593; x=1746941393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/CSUL0IAfSicZGUxwfQSMF+CcpH0uxTg/tJpwo9blQ=;
        b=LvohXsij4ql8WLZwgjb2XPEuV9XdpJTsAduGU366o0d3U2/GbzPrIkxy9iuNsqHEcm
         1gqwaYnaUtUyZ9OKnJqm9E4/8tiULSufZXi6fNWzjQ4dVzuXZ5Uwy0sis6r60gOFHkbv
         Mw4h6MA0SbObUf9BD/JcmsI9mvsPnE8i8OWeyh0zXxH8aWt9y6a+FYb3ina6+fEVxszx
         SfxRzPhYL2gPfI3ayRD+FR0oEeCj3v/YrEoi/0xXOGMr5AKreqLl0tnfKFYAPupx5vIc
         T7fvIyMBnVFkW9qhRFiigUzLFzGXxOxhDbgWsXGAG0hnAWk86E7Q+ArRw5R97VHsKruW
         96UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzazxBhY5zBV0EaQ9b1n2jPs7s4U1vvJmpvxc/DeOHLtp6Of/1aNkI4S40MbagDR65wibp0j5ITGTn0Q==@linaro.org
X-Gm-Message-State: AOJu0YzXrwDMfjx1WvO60wJxX2drhO0OLjSzIRCnitPU2Zyi9aeKokKR
	sYmquEDWr9Swkf02RTNjATTnWKJf4ssAcCSckBaCvHA8rxQKvf9aXLQv6ekIT1GNaw==
X-Gm-Gg: ASbGncu4u0txsvpD7C5mE5yYJkYoBKg7uin9vNhJyCAucuJ6hlSZj2dCtArrco7Xuwc
	qwqtYd56PvjF2wN6VjTwm+AVgVOcbJUWPaeU2o5yKV0jLcgLgUcqLhs8zyUpbIEODUv5wm/1fWH
	DEENQoCQRoPxmTBN9+T+ebbzN5Fch52OcoTUbKo/E9RS+EDSsVfOBi/aeUflkW54EkI3gs3UH2a
	qvfnPbYQQEZY2TWMKFzRR7uLS/pJu2E3NmM7enK16GN8qRAlv9+58XZJxElmzKWg0F1U8PINBDU
	wUwXoC1hiYe9TA4fcndhqAIamBi0cV3rD3/Lw+G7
X-Google-Smtp-Source: AGHT+IHywaMkGvwrUiu+pF63431wfSDN2JgGeySP4RmqHLBWsgAcUe/WGEW4xlqLjZ4SRwwgqz4yuQ==
X-Received: by 2002:a05:6a00:414a:b0:736:3ea8:4805 with SMTP id d2e1a72fcca58-7406f0aca49mr4036802b3a.7.1746336593306;
        Sat, 03 May 2025 22:29:53 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:52 -0700 (PDT)
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
Subject: [PATCH v4 38/40] target/arm/machine: move cpu_post_load kvm bits to kvm_arm_cpu_post_load function
Date: Sat,  3 May 2025 22:29:12 -0700
Message-ID: <20250504052914.3525365-39-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 5/DST6nqsBzD

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
