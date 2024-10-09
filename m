Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp532082njl;
        Tue, 8 Oct 2024 17:05:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWEQSPcxa3LvkUKXJqkz2DKNrll6CIx2RHtzDobeJEjl3vLWYomtJOqeUkzMA4MEdreSU8bh91YeEe/Eg==@linaro.org
X-Received: by 2002:a17:902:e74b:b0:20b:9098:4696 with SMTP id d9443c01a7336-20c636de14fmr14363445ad.11.1728432310285;
        Tue, 08 Oct 2024 17:05:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728432310; cv=none;
        d=google.com; s=arc-20240605;
        b=Pp8hcllL4hpM96V19KRV/DCIQAnWFAvmXJ09YMFdoY5PNhywjs5RCHMjPnjIaNjeG+
         G1xfFlRT3HgIPEgwnk2E9d49Ke2DlVa0zcBCa02k0/5rxAV135MgKio3p7icMvU6ef+V
         eHCwUGTX9krKNoiU5eCnboZHMjCvdJFX7m0e8KZj9NSfz+KxWw2ZF2duUpOMSba5w4yr
         G4aE/GTvpQsuJA2mZFzBSogcUmrWJj5+weQE2t51bntouuPAhuQ3RmtLTQWu9kjj6Omd
         fSHF4Bpn5sX+6L4cVPmG9HQuZBvGELTO7aYegaKQTxCBasQIVjWONRFneIusixQa+q1c
         S4mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=HpCts7Lc7po90jMJZMaWUdEUzHFwVBTsaL90Hh3zO7Y=;
        fh=kCmLwJeS+7DuNctxNUXB9onlAa0RNca5zwwd36kriQM=;
        b=ixZYe78EbFfoZGJhQCAfHy5UkJyvWBCjVUnNFeRhgAdWQQdLzmTUxC+66D0IxzhRZG
         BnaEdOmHzQww+vFeHEo375ZJbVoa9s6+t30Bhpnh9bFrxvUyIg4xPeCTaDAXO1lgs5yy
         0ANR78VRPxrJT+b7VCMWulVLlCLPU9AqNVk7LuICLTZYRDxa1aFc3J2Aboy4XW8MkLU0
         wxkFJJgfy1ZRtWtseP5pD4nLFxxQ6r5tgVZxSb7S/gpwfY7HfpY+muhcYUtNt3qvlDHD
         baES5rXWeo47kkW4jDz3XlffFXHOp/lyEeqBRGYR0zFYf/0g1YG/T7HWLXWjDfQLJ0UA
         EGmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g5K3FVbv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138a743esor64050505ad.2.2024.10.08.17.05.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 17:05:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g5K3FVbv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432310; x=1729037110; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpCts7Lc7po90jMJZMaWUdEUzHFwVBTsaL90Hh3zO7Y=;
        b=g5K3FVbvoCazCOEIx5YkXd7izNXDlDQm5v6PN20mXv+5iNerxTszOgQcL1tQitv+i/
         H4627pQTcd7k+APi15zAor10vGSaQceOXu46/cb1yZSGNL/23Ov50+hoKH1VBuSjlvQN
         SW8j4crF1NFDX3Kq4F5ZpSehEB6vbredIai48Q0ZM5Vh757e3FadANgRA4xUaUI2aQS2
         OyY56DH13gIEkeVlEnN7Xo5IayMMEbWZiVuGO+BNbJJhGNB3TZgD7GcjXN+eWCP9+KLm
         45kjwy5/TJKPgoiqLtL2/r0B6aV1se/Bg4hQopzrljwO6un4BT+RiW4jJ4bYz0zww0At
         ehgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432310; x=1729037110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpCts7Lc7po90jMJZMaWUdEUzHFwVBTsaL90Hh3zO7Y=;
        b=MeYD9HyedJSDFCdA0jvs6LKMoQs0qR6sxndCnJonwA/6vzz6ThtLDK78F5E2yi/HzF
         8xMM/7FqFUjyH6bRW+J9Rl4kJtxZdwQS9Xt8zDhOWlsBmdfxsKvqFtHr2XkD1c71MxOd
         bB2IFUYOaSelCQeyEtvmrKQMjAiKEvc8r4dYMfKwyCqGZ5Wz/P1Suz4ScNnM0E8s8XnU
         nERABhIdJgXdXlSxvtowXpxlDeqD8itoK8m7qEwvYO6HIBiR/tKXdb6eCVmz22Y7I2wl
         Mfq/MW5Osu4Vy84ulOatGYimbF0ti5YylKbQn9aA2WD22z2C6Fkw4Siqxr9QJL1/uRXa
         3neQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0P5K6NtOXn6NNrwbKdpmhoZU9NI0ysFABAK1ZF3SmF4d8PENltL9Aw60/pWk2vQYvax02rPM5zYHFUA==@linaro.org
X-Gm-Message-State: AOJu0Yy7VRkK0qV4afbv2iEMT1S7HMt8i2+0Hh99jWlvPFyaYkmBjW64
	/NH0/fPyYIsO+EWH4UzEYxQtd2Ld/m6XCRrFubvO5qlv+RlkLadxQAZPB/84A8YQ10duX1K4Z5v
	/9hY=
X-Google-Smtp-Source: AGHT+IECyy3ECPwpIxrRErzht1GulXjMyxKnwSvtoRqfwlCQOZkW3JggsvRngQz//es+//aYqmgOdg==
X-Received: by 2002:a17:903:22c9:b0:20c:5960:bd35 with SMTP id d9443c01a7336-20c63710345mr8780115ad.20.1728432309687;
        Tue, 08 Oct 2024 17:05:09 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org,
	Helge Deller <deller@gmx.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 15/20] target/arm: Pass MemOp to get_phys_addr_nogpc
Date: Tue,  8 Oct 2024 17:04:48 -0700
Message-ID: <20241009000453.315652-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009000453.315652-1-richard.henderson@linaro.org>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: OQy/U7ad2ozU

Zero is the safe do-nothing value for callers to use.
Pass the value through from get_phys_addr_gpc and
get_phys_addr_with_space_nogpc.

Reviewed-by: Helge Deller <deller@gmx.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index e92537d8f2..0445c3ccf3 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -75,7 +75,7 @@ typedef struct S1Translate {
 
 static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
                                 vaddr address,
-                                MMUAccessType access_type,
+                                MMUAccessType access_type, MemOp memop,
                                 GetPhysAddrResult *result,
                                 ARMMMUFaultInfo *fi);
 
@@ -3313,7 +3313,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     ARMSecuritySpace ipa_space;
     uint64_t hcr;
 
-    ret = get_phys_addr_nogpc(env, ptw, address, access_type, result, fi);
+    ret = get_phys_addr_nogpc(env, ptw, address, access_type, 0, result, fi);
 
     /* If S1 fails, return early.  */
     if (ret) {
@@ -3339,7 +3339,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
-    ret = get_phys_addr_nogpc(env, ptw, ipa, access_type, result, fi);
+    ret = get_phys_addr_nogpc(env, ptw, ipa, access_type, 0, result, fi);
     fi->s2addr = ipa;
 
     /* Combine the S1 and S2 perms.  */
@@ -3406,7 +3406,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
 
 static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
                                       vaddr address,
-                                      MMUAccessType access_type,
+                                      MMUAccessType access_type, MemOp memop,
                                       GetPhysAddrResult *result,
                                       ARMMMUFaultInfo *fi)
 {
@@ -3547,7 +3547,8 @@ static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
                               GetPhysAddrResult *result,
                               ARMMMUFaultInfo *fi)
 {
-    if (get_phys_addr_nogpc(env, ptw, address, access_type, result, fi)) {
+    if (get_phys_addr_nogpc(env, ptw, address, access_type,
+                            memop, result, fi)) {
         return true;
     }
     if (!granule_protection_check(env, result->f.phys_addr,
@@ -3568,7 +3569,8 @@ bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
         .in_mmu_idx = mmu_idx,
         .in_space = space,
     };
-    return get_phys_addr_nogpc(env, &ptw, address, access_type, result, fi);
+    return get_phys_addr_nogpc(env, &ptw, address, access_type,
+                               memop, result, fi);
 }
 
 bool get_phys_addr(CPUARMState *env, vaddr address,
-- 
2.43.0
