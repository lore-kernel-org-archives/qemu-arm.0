Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2200997wrv;
        Sat, 3 Aug 2019 11:48:20 -0700 (PDT)
X-Received: by 2002:a63:6686:: with SMTP id a128mr121386894pgc.361.1564858100099;
        Sat, 03 Aug 2019 11:48:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858100; cv=none;
        d=google.com; s=arc-20160816;
        b=zez5DnMhhGZFnvV1RU4POPtA4bvL0jjFAQXrWhbkWECJpA6JncK8pt/k91J4kNn/Qn
         bf7ztdn2CAaEjgNS6cePhop/HJVFxmYiSk0CngJHtU2oahxkwTbwWmlJ4XIGVq1XSOpE
         KbK6QGKVkiUHNOHmfNHpkNsobolD8bUAIaLUFVyXhHhbkrdxrNWUXtU3Wi4tetajLLn7
         J5i78inrNH1eDvul3ehy5NRVAdUn50ndTXPm4KXyhVvhlUJp7Myj4bLWTirR9h1xyi6s
         xWg9eGwsc9443mTFNcpEYDgOy2Ld/lngw6mo6uPfxN7RRGH+7W+hL+7hcbvFeZfHM/Ws
         OwGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RHV3vStI8hqe3CeMRucY7WZ1UFpWZPYBbhdsWvPNW30=;
        b=f3z9CLx3ApRE64z7fGQzoXsceyfGktVKnaKh6i9Lm5HObSTXT6oS+R65ilWhcO8kV2
         DX+og0uf7B1k+LIs39IOTWX6x6kNO9s9nKSiJ4XXgV41s5NuLK7tCKJ6jaGqM0MkB0Se
         NmFWMpjz6Lafl+KzvH8vEXnVyqrpJ2uF5M2jw4cjA3WVn4I3emuTlZrrmHqeWoqfp/mC
         HKZHjH6gmiWcn3lIoVpGO4KZV/cVT3KqYpqhjDSXORv1zwWX2h05kWHHg+wOh0NHO0HN
         OzwogQBZea4ykWfmJ/Jg0iBPvFLyP4lCbgoWJZMeL0GQNabQNjicukGgRJX4XO0zIYIl
         jS9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CilkG14h;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b10sor40562555pgq.46.2019.08.03.11.48.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CilkG14h;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RHV3vStI8hqe3CeMRucY7WZ1UFpWZPYBbhdsWvPNW30=;
        b=CilkG14hXuLfs3ajiEUbNrYQSzWSF+gJ0pP3dZAsMY0qkc2tphjlBXylPEoqETFJG4
         quVMsgfQEyspFWXAEvAb4V2h7VtD1CJ/zYaMLelO4BGFvg8576uVPz49Wz3cznrWteXi
         lKtAY/OkT0O2bc24rV8/K0JRpwX9/XC4OlGh4TMTJ+vZiPvQ3S8HYpgaph0RzcGGwe+O
         IkAN7JCBC6QrUdqYnJQou3/tixjKLaCkhwiDRS1xThCclADpI5GCjvOePtvJTs4cg7BW
         V53y8za6pJcueTgjLRrw6454Zrj/WoZsVpWq2DCPuiWzGqC2pU/rjsab++I5xA1BGHpk
         nsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RHV3vStI8hqe3CeMRucY7WZ1UFpWZPYBbhdsWvPNW30=;
        b=bVhuS+EeMRtYI2xB8gkV6h5LwnV69C5/bwhHYZDzcxgLzvdqyrM5775Szwqn+NKN2s
         6yBFvNzRpPmLyE/1eJAfKJcD5RkL8HrpJIq9n95RdsZjDQS+/Wns4z/6czc/y7CksyPT
         aBp0h9Td4Uato4S0CNU/vh1XiK0Hkvt9slFVXijCitUAeJ6tvfj08y31U3QQuTXZ8P4Y
         bylki7IABrlHsD1ltsUvOvRGvIgqK1DAOhey8xUgECbKVjdf6EPWMi2XSXTpQ/F2MBeO
         lw1FCblkkUxNbWWA7MhAbPwQJwVH4bfOXFBzjRXj+7JVWZ2i3f7BU3wzvfUTuI5zQdql
         LcSw==
X-Gm-Message-State: APjAAAXDyrjgnXndEyaDHtNnMYQFGI4hE0TGiy4xeClFkZ40ZYuOL9jv
	fB61URtbgqmbjoyxf7GBlSoGDI9w
X-Google-Smtp-Source: APXvYqwl5vx+KnNm6Sbam81DxSCZSW+EVMLXdFp12OSdPpGCdDvrfyo0H959RO/WqV6xe1OxTFcijg==
X-Received: by 2002:a63:9e54:: with SMTP id r20mr96504867pgo.64.1564858099599;
        Sat, 03 Aug 2019 11:48:19 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 14/34] target/arm: Simplify tlb_force_broadcast alternatives
Date: Sat,  3 Aug 2019 11:47:40 -0700
Message-Id: <20190803184800.8221-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: vECDEG5KgyEW

Rather than call to a separate function and re-compute any
parameters for the flush, simply use the correct flush
function directly.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 52 +++++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 28 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7ecaacb276..185f5e4aea 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -626,56 +626,54 @@ static void tlbiall_write(CPUARMState *env, const ARMCPRegInfo *ri,
                           uint64_t value)
 {
     /* Invalidate all (TLBIALL) */
-    ARMCPU *cpu = env_archcpu(env);
+    CPUState *cs = env_cpu(env);
 
     if (tlb_force_broadcast(env)) {
-        tlbiall_is_write(env, NULL, value);
-        return;
+        tlb_flush_all_cpus_synced(cs);
+    } else {
+        tlb_flush(cs);
     }
-
-    tlb_flush(CPU(cpu));
 }
 
 static void tlbimva_write(CPUARMState *env, const ARMCPRegInfo *ri,
                           uint64_t value)
 {
     /* Invalidate single TLB entry by MVA and ASID (TLBIMVA) */
-    ARMCPU *cpu = env_archcpu(env);
+    CPUState *cs = env_cpu(env);
 
+    value &= TARGET_PAGE_MASK;
     if (tlb_force_broadcast(env)) {
-        tlbimva_is_write(env, NULL, value);
-        return;
+        tlb_flush_page_all_cpus_synced(cs, value);
+    } else {
+        tlb_flush_page(cs, value);
     }
-
-    tlb_flush_page(CPU(cpu), value & TARGET_PAGE_MASK);
 }
 
 static void tlbiasid_write(CPUARMState *env, const ARMCPRegInfo *ri,
                            uint64_t value)
 {
     /* Invalidate by ASID (TLBIASID) */
-    ARMCPU *cpu = env_archcpu(env);
+    CPUState *cs = env_cpu(env);
 
     if (tlb_force_broadcast(env)) {
-        tlbiasid_is_write(env, NULL, value);
-        return;
+        tlb_flush_all_cpus_synced(cs);
+    } else {
+        tlb_flush(cs);
     }
-
-    tlb_flush(CPU(cpu));
 }
 
 static void tlbimvaa_write(CPUARMState *env, const ARMCPRegInfo *ri,
                            uint64_t value)
 {
     /* Invalidate single entry by MVA, all ASIDs (TLBIMVAA) */
-    ARMCPU *cpu = env_archcpu(env);
+    CPUState *cs = env_cpu(env);
 
+    value &= TARGET_PAGE_MASK;
     if (tlb_force_broadcast(env)) {
-        tlbimvaa_is_write(env, NULL, value);
-        return;
+        tlb_flush_page_all_cpus_synced(cs, value);
+    } else {
+        tlb_flush_page(cs, value);
     }
-
-    tlb_flush_page(CPU(cpu), value & TARGET_PAGE_MASK);
 }
 
 static void tlbiall_nsnh_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -3923,11 +3921,10 @@ static void tlbi_aa64_vmalle1_write(CPUARMState *env, const ARMCPRegInfo *ri,
     int mask = vae1_tlbmask(env);
 
     if (tlb_force_broadcast(env)) {
-        tlbi_aa64_vmalle1is_write(env, NULL, value);
-        return;
+        tlb_flush_by_mmuidx_all_cpus_synced(cs, mask);
+    } else {
+        tlb_flush_by_mmuidx(cs, mask);
     }
-
-    tlb_flush_by_mmuidx(cs, mask);
 }
 
 static int vmalle1_tlbmask(CPUARMState *env)
@@ -4049,11 +4046,10 @@ static void tlbi_aa64_vae1_write(CPUARMState *env, const ARMCPRegInfo *ri,
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
 
     if (tlb_force_broadcast(env)) {
-        tlbi_aa64_vae1is_write(env, NULL, value);
-        return;
+        tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr, mask);
+    } else {
+        tlb_flush_page_by_mmuidx(cs, pageaddr, mask);
     }
-
-    tlb_flush_page_by_mmuidx(cs, pageaddr, mask);
 }
 
 static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.17.1
