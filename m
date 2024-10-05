Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1047763njb;
        Sat, 5 Oct 2024 08:25:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXhe3YfgIlls7ZjLfj4zRiJLsb4IcZp5+yw7kINsO58I0m2v3Asgkh6TY16tokUbE1wmR95VqChYBi8Rw==@linaro.org
X-Received: by 2002:a17:902:f546:b0:20b:5c85:8e3c with SMTP id d9443c01a7336-20bfdf79928mr99275895ad.13.1728141958068;
        Sat, 05 Oct 2024 08:25:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728141958; cv=none;
        d=google.com; s=arc-20240605;
        b=UZXDfNl7SpsylAiYAX/DgsZ7cjOYezatbVl1pjRmetZPm1h4jEtkV9bP0As4KqWQBE
         eOInkbhl4uMubmTVWhRZqFAL922/s6Us6U6kD6LrW8G4x2uOgh6rNmvelgSfT+voS8al
         C0nPW8fAMD87thaS6EUcr50Mr0rQK+7AE5XnHF3mbV/RSBQyXpws0kePbNBVFMiF/Uly
         mCceXAiVtwpcB7+TBuo4nZ262nG78fBnyC4XDXoh6mu19in70Oa8NDdKwxQk8C+gAB96
         MqKYGpc6EgWgGSKRA8j4Ia1H/EatSxxAQn21UiA2/9SAoPayh2z0mrUCsoNKktYROlO3
         iO3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rMIQXnxelIQ86qxYbOA8sg/WFq9fqYpMUetqZ1DDKfA=;
        fh=I34c7bACvHEE9m9mh8njP9jyLkOfejdGCwJCXd7xaxw=;
        b=bAhtq4yD5zhqkrtOBcvGI3ccZOFPHGg7LAI8Wy87mVMiUP7lYHLLbk/qFzrAc3/aD5
         zf3iR1Dt/VE85CZvTFhtoumvSaWGH3RYA1ZX041N+GFkm1xGQgfKxKZ9tJb8/fYd4zy6
         qH0FDIlenyrp4hEfgKvGtsjae/3+l738reMZsAb/Cx1S01Ysx4a9RVb4qxXiJzG96cnO
         8RrsViVWaGlIbcNxmUjTUgB6FoZo1yvUuCQfvtBINfsBAvnjBXuOTrEeZjMHqlPFJowO
         GNHk3oec8ocCvP4Tccwk/P4QlQ+bfZgwr0tfIrTB45MA4ju7pUjrXJg0B5bhHEKh6Reh
         Js/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JNOfyH/G";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138a9ec9sor10743265ad.2.2024.10.05.08.25.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 08:25:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="JNOfyH/G";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141957; x=1728746757; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMIQXnxelIQ86qxYbOA8sg/WFq9fqYpMUetqZ1DDKfA=;
        b=JNOfyH/GHb8s1tP6ZRDTTGGcQtiWTiQVcsp3UaJvCNZu61RXko4v6GSrXx7wq4Tjqw
         FGXAt75Fosp0UtIKm8MDY0Cr0p2I8DnpBV+xXS7nBRzf8Su91LvxAT6OLB6XD6mIkn4H
         gKHV8l9NK7BvV6c9LyjnKFKfa9JSxnvLsdUT377FWQuX5U9PBAXASipp0MXbkEPprwMy
         FXbwdtdvv/Kt9B/aUa7kpvlWKk/F1Eb2s1WB6EysCiHywjET2KD7u32oef1GZ7ZkNub0
         zP7b+p9OlPYww5uw0clDWQ3VcS1qObXr0tDiu/s3Ar1dt0xyCeWdVtGWAxPwpdLm28YG
         BKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141957; x=1728746757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rMIQXnxelIQ86qxYbOA8sg/WFq9fqYpMUetqZ1DDKfA=;
        b=I8iA7HgE+0LBA151eHAiPs31af6tqBp9kv8dQGWoQ90EKDkLi/GY2xTThaeCBxJ8cH
         k9Jm8wRHqlg42h8vKJRhcd/GsDSKixfGlUYEZ9ewKVvyr8iEKcQGfiJavvXDaVAc3K26
         agZcHTszeuijO73rWrChGE6PrsKXkg6qCbn3vUhhku0MezQp3Cf2FRFp5E+ZaCP4NPvx
         WdKQYPPNU3xixe2/rZjWXOhtRkhCoB94oM3ylAEDSjlZNYgRANjgyhSA39eIgeun8S/G
         P/NCXiNebTnD70ajx51URwkbzleZNBqCfsZYUnhZ/q05mBVNWSXIPf/np6JflhZcYzT9
         zW7g==
X-Forwarded-Encrypted: i=1; AJvYcCUf6PxtTWyN2apjFeNcYJdVWbJ4Yq5yx8Qjzt0h5MuBCTZc3AfZBaGitmdYYZyNdVM2SXa/T59nGlD/0w==@linaro.org
X-Gm-Message-State: AOJu0YzaQVsNYbPXA22s3SjwCLo1jaCXYZmXaL7yMC8vJ9UQR2N3h6+R
	Fv3yIcI8dM3LZicfzEkY9lxRkBzK5tGV6XhUUS83U+gB15XvpDmJ95xVXRrZu6LRkQ==
X-Google-Smtp-Source: AGHT+IHCfh10FjkbBSOvqXvOBG9PUScOEcA1SfhVDalzVVmPfKmDc9cmv0jmAUjDnTAXUakJpgurmQ==
X-Received: by 2002:a17:902:ec81:b0:20b:90ab:67de with SMTP id d9443c01a7336-20bfde594f1mr78046015ad.8.1728141957612;
        Sat, 05 Oct 2024 08:25:57 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:25:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 05/20] include/exec/memop: Introduce memop_atomicity_bits
Date: Sat,  5 Oct 2024 08:25:36 -0700
Message-ID: <20241005152551.307923-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005152551.307923-1-richard.henderson@linaro.org>
References: <20241005152551.307923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: KvWs6dck0LCN

Split out of mmu_lookup.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memop.h | 24 ++++++++++++++++++++++++
 accel/tcg/cputlb.c   | 16 ++--------------
 2 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index f53bf618c6..b699bf7688 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -193,4 +193,28 @@ static inline unsigned memop_alignment_bits(MemOp memop)
     return a;
 }
 
+/*
+ * memop_atomicity_bits:
+ * @memop: MemOp value
+ *
+ * Extract the atomicity size from the memop.
+ */
+static inline unsigned memop_atomicity_bits(MemOp memop)
+{
+    unsigned size = memop & MO_SIZE;
+
+    switch (memop & MO_ATOM_MASK) {
+    case MO_ATOM_NONE:
+        size = MO_8;
+        break;
+    case MO_ATOM_IFALIGN_PAIR:
+    case MO_ATOM_WITHIN16_PAIR:
+        size = size ? size - 1 : 0;
+        break;
+    default:
+        break;
+    }
+    return size;
+}
+
 #endif
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index b5bff220a3..f5fca5a118 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1751,20 +1751,8 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
      * Device memory type require alignment.
      */
     if (unlikely(flags & TLB_CHECK_ALIGNED)) {
-        MemOp size = l->memop & MO_SIZE;
-
-        switch (l->memop & MO_ATOM_MASK) {
-        case MO_ATOM_NONE:
-            size = MO_8;
-            break;
-        case MO_ATOM_IFALIGN_PAIR:
-        case MO_ATOM_WITHIN16_PAIR:
-            size = size ? size - 1 : 0;
-            break;
-        default:
-            break;
-        }
-        if (addr & ((1 << size) - 1)) {
+        a_bits = memop_atomicity_bits(l->memop);
+        if (addr & ((1 << a_bits) - 1)) {
             cpu_unaligned_access(cpu, addr, type, l->mmu_idx, ra);
         }
     }
-- 
2.43.0
