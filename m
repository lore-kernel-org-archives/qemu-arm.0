Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1147618njb;
        Sat, 5 Oct 2024 13:06:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWnMkZI2thhDcljr/5JUG86lISbKunf3LnPXWnDWme2/cxdH/YDUrpKq001hYOEDt1pN+Dpu+Y5GcdESg==@linaro.org
X-Received: by 2002:a17:902:f689:b0:20b:9379:f1fc with SMTP id d9443c01a7336-20bfe021ae5mr97591575ad.12.1728158766608;
        Sat, 05 Oct 2024 13:06:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728158766; cv=none;
        d=google.com; s=arc-20240605;
        b=kBrClcqK4CLrGsuwWNW4keLO4jUBkFebM+7JxTebibCSiYupO94uFGqiNcsV097BEt
         m7FOibHAJ9i8REgi4UrlVH2vZU2o2VBSq4sCEZ+6p4einTaCwhFyYSXEIsuxziTw0cn9
         2cYPfemGzHdXT2DQCDaDmTKnqZUHno7wtvPVSRtfOoIxpBV4eX4l1KkgCrQInSLl5p8S
         /ZUKZZg6W2kQyxzcWzs+UCMiXO0eQuXJbIuI/5ZVrKTQKm/fjtqcOktmjcZcAG7A0gia
         JkzBj1CsPphJ3tkBq2rWh9tu/Q9iSgyib7kousqa7+5bL8GnwOUYHiaRjJWQDCdcFYY4
         mh8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rMIQXnxelIQ86qxYbOA8sg/WFq9fqYpMUetqZ1DDKfA=;
        fh=5dz/WuvSS5zLGuanc6OT+3NfLn56/YiKRzJTAn1RNR4=;
        b=XmgnHmqAOySYhyXN03QYxVmuU8NZWlBVYV/U0Vs6oyrFkKO5Ne30LqjYgrGD/LSlcd
         Y0elYYGsP9AvfWT/w46tLp7rRBL0IWv1C9OLLYIW4HoSIImt0Jmo97T8v6NA4ELZ29QA
         7T75hGtV8EBJ0XrjaTMuH9CsqmtTseU2gTF1ZapzBY9bATgVtqubvEPt4YmVyQJcuf3f
         pAiCAddRSHhYZnwyYT5ZkoHX/DGK0CxqdTqcJKugwHV7enZLA8kJy7FxYRPwrjxpuojY
         4ZftD4W4u4Y+mCVs/33w7J5pF5uupP2lxZToCh49wnziUls257kJQGVVXXnxu+XeIy25
         qiDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mUFKIodG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138b46e8sor10433955ad.2.2024.10.05.13.06.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 13:06:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mUFKIodG;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158766; x=1728763566; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMIQXnxelIQ86qxYbOA8sg/WFq9fqYpMUetqZ1DDKfA=;
        b=mUFKIodG/tZRLel2eBCLJbgPlRduZkzeqtYxQtczbPlx7PcGHelpI0/7MEpjFoNWID
         fg2XrxtqndlpwwuwzkIqofeZ4ixlpbUWpfcS109aLP78eplyIfY10JGe3UuIdI4dvReB
         JfgxOgmHoKeA9/x6ttJq+lx4Mzr4WPOJesdsKz1cL1JIT0pf5dwrcXdRbvwUj4axl6SO
         0adRW6E0yTFEfVuQvZxSePRrhBzKgXzIl+C3ygjN8aU3eKNh8PsQ8WwEKoOTRTO8fq6N
         qml0K9bpojrw1LLF4cX6Xn2DPvnwfa1k45tr3zHBFrGJsVHFPD1oPSx2xapBVdyoXeCA
         ymFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158766; x=1728763566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rMIQXnxelIQ86qxYbOA8sg/WFq9fqYpMUetqZ1DDKfA=;
        b=NsVzC8vWD7aZi2KgD5x9FpFcKKe6+bElbfcGie4dUPuaSO6WiH9RCY0usnRRB2XhU8
         /7uokmGZnebmAaEUJGSdC4pn/cmrK4CswSYKeHPwXR7kLOJTOBwDm+O72KpvT7c+9rFg
         iAheCaWxhuRRpvLTLsLz8uG+7NxxG8laySkZv73m5vRQpJHh0FWRxxjujClm9RpJ66ED
         adi+joSnyA1Cyj+HpgQklSvBYBpyTjIjAnlMwVnXaXjC14feYAxFrxWTnJUifirW+YdJ
         YF4JwxK01oqB13gLf6iUWfpSYeWx9KFzkLHudqdKJdgMXoOW+EzXhSZMfBj7Dz+8k1ct
         jPKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtO30BB7JNHF88jXN+4UK5j5P3s/ZNZXQLVA0mW+XefTulXZmwu2zIeR6yxYsMvyXopJF/7FTBfFOg7Q==@linaro.org
X-Gm-Message-State: AOJu0YxrcIeHPQlcrYFjsJS5siNG3L1gCDsACYFnDp72ejGZB7cPoJAm
	KFc9GagoM8kjl6QAOq9Sz0xA9hjei+lRxNfk3Dhvt+EWExGUYKkfxHe6SSsOQq1/yQ==
X-Google-Smtp-Source: AGHT+IHH1UPbilIVxeQbQP7YVJkO3rAkayOpruqAQpJ8VTJH0ulhL8QO7zYfsZKakqfCs3+vPIEAIw==
X-Received: by 2002:a17:902:f545:b0:20b:a576:1896 with SMTP id d9443c01a7336-20bff190668mr89400615ad.43.1728158766201;
        Sat, 05 Oct 2024 13:06:06 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 05/21] include/exec/memop: Introduce memop_atomicity_bits
Date: Sat,  5 Oct 2024 13:05:44 -0700
Message-ID: <20241005200600.493604-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005200600.493604-1-richard.henderson@linaro.org>
References: <20241005200600.493604-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: /JiNj+w2Zk5W

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
