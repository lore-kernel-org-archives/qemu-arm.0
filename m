Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp531975njl;
        Tue, 8 Oct 2024 17:04:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXFqHYMRGms1h1VzmQdLjrLGWxG4txjId14H1SrAmLN7WVGmfexKiRNBT0NwXSgGwNPcPTnbU+9ry3siQ==@linaro.org
X-Received: by 2002:a17:903:2301:b0:20c:5cdd:aa7 with SMTP id d9443c01a7336-20c63780c20mr13116605ad.43.1728432299523;
        Tue, 08 Oct 2024 17:04:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728432299; cv=none;
        d=google.com; s=arc-20240605;
        b=L2Ys1mO/m++dOe1AO6NLMSpZGvvU2ptPm2imKAG+4bmGMwmwm0T1UXmn6YOZtfVPBs
         8+EcpwkxjdlHOvkdNfKagFfiqp9VYnXFIprFPUSrRvEFKBa9OOYqcFBXFPKL7ksnaVsZ
         COMkGaOXop8SLMoTWpgQ9JGywFJT1OkIycDqIIgZBDoMm/nPw/HPdwhcRaZUG+XuA+l0
         /O9NmblcGjfqPJBSpGWDbehXNoYb6bO1geFhvH9GmpDZqcZHD8tEAuNKkFeBTqVnH4Qa
         9eRSLzkqbsnRELB/nkkQEBuMv6bDr3YTj8yJNxtJejn3HOTOkCPtyEnQTCMkb5oD/4d1
         5/9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=hoQpjuwa20HwjACHrMlYHXe57YCg2K0w30eV5HVGvRc=;
        fh=PMx55LfFJaA8HzLHvnwfL/dpW/YivYHXe+oGeX/ro+E=;
        b=RrhRI17Ll62Ir9yxyppviTm+S4E9niTJWZDV2yTGMfQcm3URzESPB3dmvpRJzR3rLf
         3rRm+DwCv6jS1lacLb7uZTRryGsrQSZqN1layPeFqZriMb8UDPFBgsxvwoqnlyrkO1BS
         e6jroYThIRQEmPK2GIwXWnmcfzxecNSbFnwK1ovZ4bWPQ1cNYnaZXOcp5tjW48Who6Et
         lWjExsGlnwPY2tRV8nEvK19MoYm58Uob7kZCzc5VxitVvmw4kNqaDT2jhut6kR0k4nct
         ydhP4hZRFezPCHXE3hlBGbkNu0fECr/QG1skWnNQbLz8KIPUVfY48KzTp+XHMu4+W5So
         Zl7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KVurUYSy;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138b02c3sor67069835ad.2.2024.10.08.17.04.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 17:04:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KVurUYSy;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432299; x=1729037099; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hoQpjuwa20HwjACHrMlYHXe57YCg2K0w30eV5HVGvRc=;
        b=KVurUYSyv5qtnygBjzg73bVDA/fEXzu0d5OGkoP+whcXMlthGeyAhPr7y4wgtrQPbQ
         br3T2iCB52xsLF5BI4HKmKsdMmBF7Jrz5NbpzZE8Apn6Hu+2I1VBZgEI7RP62Q19Wlyd
         pNGmL4vKoHtK7VpITrqpgqOYqxGOcKc5CXedb6KIIt5RmGsgfaD4tv41aZdf6IxS440b
         axHVpsJIaW2hmoS8HzhsaU2wN7rlanML0IQBK1bonfGKpFhGhS/Zs3Y7B/rBtqQlK1qN
         7ym3hWbCnCpW297klWPB9G9Qyg5aTdvGoUjFbhxvlZbaRnFu2dvpXp2XOis2RN4vVKlc
         IsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432299; x=1729037099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hoQpjuwa20HwjACHrMlYHXe57YCg2K0w30eV5HVGvRc=;
        b=tF4Ux51O9RH1JGmNxy2nY/yQFFrz7/MYNplPHOiUkeNYmG4kOf4K0QWUgP9wZUTjnz
         6SrmbIiQf2pFt3/0Me+YYzuOeDhuJf1K9Ky+BYQnIFVU4FTNi33WETXLujCact5BbqZt
         ybQHpG2letppnHu+YinC6tWV9q9qhvpxscC8FIS2k4ZPrf5iCH6H69nUuPs+efNhgoAb
         GpANvFXF2Mr5rOVRuH2K6O7Hz6gnE6EXPu6zn7tUyH4EMeYsum/JbvXtV1ZjxSPXybyT
         OuWwZ/EevEuUqGO9ET6k/lXI0u8q4pBf27EfB3ItOFr95UCf1RHfd1k8ZaIptaVV8fIW
         5xzg==
X-Forwarded-Encrypted: i=1; AJvYcCUtPMMrZrJyigObLjfbMSrO47hIiUWMCMpBMiMtuk6Lz0tStDd3fK9rQz/CwpyAwbHN3FnZoUbiho6KMw==@linaro.org
X-Gm-Message-State: AOJu0YysYI3LKGsGHbHr+RwxqUzmYDaT8g2p+uEnyZ72ByIuEnqgHwKO
	3gRlWuivU1Kl75+mczRqyU3BIAUuF+yQiRxs7NL03VkRcEv8iEXO5tnbi2y2GLr2/w==
X-Google-Smtp-Source: AGHT+IEeu9+lnXWIBhz7pgvstBsOBX6KI79/ZD6KPp8fSOXLhjN4UEVyBQB1oHIG/Wwjwoi0un6x8Q==
X-Received: by 2002:a17:903:2b05:b0:20b:6d8c:463 with SMTP id d9443c01a7336-20c637557d0mr12308135ad.35.1728432299121;
        Tue, 08 Oct 2024 17:04:59 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:04:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org,
	Helge Deller <deller@gmx.de>
Subject: [PATCH v3 04/20] include/exec/memop: Introduce memop_atomicity_bits
Date: Tue,  8 Oct 2024 17:04:37 -0700
Message-ID: <20241009000453.315652-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009000453.315652-1-richard.henderson@linaro.org>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: MYUndWj1jJOe

Split out of mmu_lookup.

Reviewed-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index a975fe5f89..35cda1e2b0 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1767,20 +1767,8 @@ static bool mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
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
