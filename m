Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071266wrv;
        Wed, 31 Jul 2019 13:38:28 -0700 (PDT)
X-Received: by 2002:a17:90a:9f08:: with SMTP id n8mr4793960pjp.102.1564605508252;
        Wed, 31 Jul 2019 13:38:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564605508; cv=none;
        d=google.com; s=arc-20160816;
        b=MqakhIpmbRNQOd4KBJ17G59p8VfYbUz+mLjwmG62BFTTU9P2i/j+zfY3VB0oRJGuWi
         tfet+yBEphDzXMwV0tqU7WzILsdpDjHX0o6vwWDufMnDLhBVbePBaquJ0xBXbPgTPqJm
         LfKw28kKWKxJ+UPHpNKL9k3gSzZnwcVUWVQ7Z3w14RjIkFWr1Fo9bgUrgo0hUk6W0UwK
         UhJL/OOTUUXXc1Gq5HyXQ0K/qQg6PF2xcYdBaeJ7mk9gOp5m2FYfxT2ASMDJk4at6HNg
         qmixvejPT20pIFrlSA4KnwtP2FOBJ/UUVjtJPnRq8g5tu4mJuvc9m2SOF+LyIQNhBhw8
         extQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ebweW1bxG4mlr4zUkxD0Pv+fcpZzn603jNjjqkso5Rc=;
        b=U4fH560/5ZbfPutcAyBYDHauvgcTVSBCX5IWgCnRrHyRDGvib4eI6wWIvuFkp0LPtR
         xk1E1sPKKNwSyPEqycvIGlksvtjkfPMGVegxmuC2sUZPlzjhc7iM7AvB/GPd/WKDeqfe
         QWeDv+Cxu7Nng6xqhvONGUFEWOPel52s7P8eO1GHbUsdRNK9BVV+oUCGGYlkjXNLA7R2
         yQWmXUvBpomJYYQyVkxUj++hTMwCv1uSCv/iTdbm5X6AUgfZKyPMRahx20ILMAb8KnIX
         8mL34PviaT+ziu/AcOOe+2qnbPDligZP5D3VV15tmUnfTuSBcsNrG7oHgdslLvSyev0H
         Jl3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pd4FHlXV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 11sor27866835pgf.75.2019.07.31.13.38.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2019 13:38:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pd4FHlXV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ebweW1bxG4mlr4zUkxD0Pv+fcpZzn603jNjjqkso5Rc=;
        b=Pd4FHlXVvd1NDlai2uvi/QThJmS6tM9qc8YQZhRRXPHzO/xGKv4PyTfytTx+FuzJGw
         8vMOLE4mLSYhTlI9N+sVoOdsrBLamtj+EXgP+UI0WYyZ/+5LgzMwUgnziTwp2kGegI8V
         ZenC+sp7oFcVh713Ov6tWgN6zxk8h3UB24DfggXhtQTUP57LWiMsbBVhrnCknyVK1qh5
         7ZeAIvsKW+e4BqdQQheZohhIRLftBqR0a8i4JKYeaU83Px/TdNaK/yOI4g1rGGjiDm6V
         hEeuvwi1VxTfJ5lcBVI+4bu/Wj0bry6xnF2Um0HQxOJdON+QyWgeMiZolQaUWwZax2Hp
         TUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ebweW1bxG4mlr4zUkxD0Pv+fcpZzn603jNjjqkso5Rc=;
        b=EMEh8m6zHRr4MuImFErOqGS/ZLqOoWFnjYvBLwMwE1zQRHTAKugYQI3gIKpqZy6XbR
         H27Jn4Jld0oc62JLxX/Sqz8tveHsZIJD1dS1LL39eUe5Qc2vSA2tWEpljAXp/kQXT3FK
         QinYRp3UkK3Zj+9PAfsLEIoGdV4iWQsa0lBjvvRG56QAPRIlCP+alMB0de1LG2sgGqBn
         m0fbKacVTHnEQkB1Fj2ZmUdb7RNlMmb1ayVNo1BaSfqDVtM7jFKx9IoJcuow42qw8w1h
         kqPqu2pNKzFlWdGq75EtwNBIY0idlcNT8yj8kqq+cKB8s7z/S2vP7rLN2sh73n+bkxB2
         pBDQ==
X-Gm-Message-State: APjAAAW61OC36sG/mUnnNubCAtgPrYv/AF1U613CEByL1dTEXearbxdE
	u4+sWsJ2bOeDDQ7Z4/K5XbFIC4zDqk3PnQ==
X-Google-Smtp-Source: APXvYqzIpj1PYk8SZZchf81xB6FYstaT2805Ekm/aKloX7Cr22N30pDGchCcQmW19UGq4I0YnJ+QXQ==
X-Received: by 2002:a63:f452:: with SMTP id p18mr89844584pgk.373.1564605507738;
        Wed, 31 Jul 2019 13:38:27 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 13:38:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 10/32] target/arm: Update CNTVCT_EL0 for VHE
Date: Wed, 31 Jul 2019 13:37:51 -0700
Message-Id: <20190731203813.30765-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bIabRJkoQUtf

The virtual offset may be 0 depending on EL, E2H and TGE.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 40 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8d8b3cc40e..e2fcb03da5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2484,9 +2484,31 @@ static uint64_t gt_cnt_read(CPUARMState *env, const ARMCPRegInfo *ri)
     return gt_get_countervalue(env);
 }
 
+static uint64_t gt_virt_cnt_offset(CPUARMState *env)
+{
+    uint64_t hcr;
+
+    switch (arm_current_el(env)) {
+    case 2:
+        hcr = arm_hcr_el2_eff(env);
+        if (hcr & HCR_E2H) {
+            return 0;
+        }
+        break;
+    case 0:
+        hcr = arm_hcr_el2_eff(env);
+        if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
+            return 0;
+        }
+        break;
+    }
+
+    return env->cp15.cntvoff_el2;
+}
+
 static uint64_t gt_virt_cnt_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
-    return gt_get_countervalue(env) - env->cp15.cntvoff_el2;
+    return gt_get_countervalue(env) - gt_virt_cnt_offset(env);
 }
 
 static void gt_cval_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -2501,7 +2523,13 @@ static void gt_cval_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static uint64_t gt_tval_read(CPUARMState *env, const ARMCPRegInfo *ri,
                              int timeridx)
 {
-    uint64_t offset = timeridx == GTIMER_VIRT ? env->cp15.cntvoff_el2 : 0;
+    uint64_t offset = 0;
+
+    switch (timeridx) {
+    case GTIMER_VIRT:
+        offset = gt_virt_cnt_offset(env);
+        break;
+    }
 
     return (uint32_t)(env->cp15.c14_timer[timeridx].cval -
                       (gt_get_countervalue(env) - offset));
@@ -2511,7 +2539,13 @@ static void gt_tval_write(CPUARMState *env, const ARMCPRegInfo *ri,
                           int timeridx,
                           uint64_t value)
 {
-    uint64_t offset = timeridx == GTIMER_VIRT ? env->cp15.cntvoff_el2 : 0;
+    uint64_t offset = 0;
+
+    switch (timeridx) {
+    case GTIMER_VIRT:
+        offset = gt_virt_cnt_offset(env);
+        break;
+    }
 
     trace_arm_gt_tval_write(timeridx, value);
     env->cp15.c14_timer[timeridx].cval = gt_get_countervalue(env) - offset +
-- 
2.17.1
