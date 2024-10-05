Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1047744njb;
        Sat, 5 Oct 2024 08:25:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXhYp7L4RNCl5xE2MT2zMhSHLGNIFKu21ZAhUpMksA1D3lmSuGL8gcTc9scH7q9gBQdB1s0KpLtZpdUWQ==@linaro.org
X-Received: by 2002:a17:902:f611:b0:202:13b0:f8d2 with SMTP id d9443c01a7336-20bff04ad1cmr97794595ad.46.1728141956224;
        Sat, 05 Oct 2024 08:25:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728141956; cv=none;
        d=google.com; s=arc-20240605;
        b=W6Z4ICzrtcp2ZDDRlo6cnT7f5U9uuhR7/Vuqvetmm90xLAHCAppJJL6pLi8npFXUFI
         g6dr9kTql1C5Bt/2pf2AlHccRMVO3iqGBXhaUCfES+lezfDre6j7LYnBTzzpsmabte85
         Ob4ZtmJU+9VrjCar40zlyOGlygzdTXKccDQC4hLtjLQW3DBiCf+DTiYM6G940kMFj+6L
         aCQk+5ULL+PifpheeVkTQ0V+/XpJ4eXTaYsyHbS9dhtO3c/O0VHE6GvtnpHg8nDpVP7g
         bwrALgJq6MT8uqTZFjDtYN6WWl3AUVzPJerIGJe7DytWvPoNBA4+teWkOvHjUDFtMBrN
         Uywg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=js9k8IR/cEhAqGc5dKpCioG/n/UgV+piB56d5dg8Aiw=;
        fh=/tz+WPqgIOInGLm4+3Rf6j/+L/4Njiykl3n5pDerVVM=;
        b=aQ0BUYaERvSjgR/Ivje5nZXFWLRSwrlJZyh/p5LzNtfWPbzPXWK8tT+DpqYEmOAEOo
         eavNNOO09E07VsZ7jQYizmDLI92i9XTluf2c86FMQqSYAHeeY5dZbT/yW+9kjCU/5yFH
         jkK/ZR6z8l/CjnEN8TW0msH58WRaEZMwyfqybQ2xjiSWnIMF5evhSLSL+bEeZU0yxmzY
         onaRhAYmOSqjibXIt1UslPdPby+8vjflJZbgoT3T+/hhaYyPwLYEgQ+cZC02vxRBXGfA
         wc1bFyAIEu5SZWg3ZkLSwd3+PnrWUKS6883UoXoGYfC30hD8pbhlHKNmaU6i46GIMiw6
         xwoA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OfdT97o2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c1394bd5asor14109275ad.20.2024.10.05.08.25.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 08:25:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OfdT97o2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141956; x=1728746756; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=js9k8IR/cEhAqGc5dKpCioG/n/UgV+piB56d5dg8Aiw=;
        b=OfdT97o21hnxOvEkxY4lAkRWw9+JUBEI1kw5Jhw9HOfwtfG5LQEg2oEty0+XBSS0Ek
         cbteWzJKUfjiN7aoiZh1kZP6YU498EBwnD3F3tAkrOv3pmzf2zFNjy8wgc34Ll0agsXY
         +NBdOMvrqZDddn8IPpj+tpTyHuQxarQe+NGSqyzSnrWCFIEl23s2e8Z24WrCLXlqQThE
         1uoHv7MMt+e9cg0fc+5f5tO3ABJFf8qrjrBQCj3tN3OBDuHSh2ZmMc9t3+vdYsLWa1Gf
         hkK+YixLnUliaffPU7+4lCnzhNpnLuA2CuJRp4s/YDHGg9V9PnHVeUIcR5XVUV4Ax32k
         wDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141956; x=1728746756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=js9k8IR/cEhAqGc5dKpCioG/n/UgV+piB56d5dg8Aiw=;
        b=I/7DTvyuhqrA7yNe0FQXRItlNesSsvcnvMNxB4lk/UdkPDkW5QVevMHRnHS0Hl48Yq
         bzlYKBJuWwTvBEHGCNVzaxyU9qQn+3chm4J9N+vYKfMgsVbpw1kwxxbC/FKlqIsPT2Ya
         nEqlGhnOGJQ8O6jbKHSdBrcrTP0xdUgKNmEPv19h68pNyE4f7GabOSGxqKb6Ht1N7h1X
         Rr52IoNwvrf8yxgy2wX4FsubvaE7sqbzBUD5iQRA8+W4qUS6fP4xx0gl/MsHc984IoIY
         35Rovz3PsmAbr6tLL8cmKxXET7tTuYmwp+n/12+nTY8St5mcAx4Kv2A5L2gUL/Se7qjz
         W9WA==
X-Forwarded-Encrypted: i=1; AJvYcCVhbC6idEQONT84QPp3f9JZQ0Yi5mpIZqZh5dnN9OfG+CIpCCo+L+X7bk5rftuG78qkh+HT6APnu+4xJw==@linaro.org
X-Gm-Message-State: AOJu0YwE9V/WrC22jC3V5YCKX3NzssKBaCORhkLAqv+GrlsLDQNQRbMq
	HOEAQ9D8ivgHLWrPgwsJRvBLaV1lyPTIiTkIVc0no4b7R3Eg8AZVxiyOZAATDJOtNg==
X-Google-Smtp-Source: AGHT+IGIBBnYzSGfllOqeGB217gC39c6yX53tA6gs3EyjynpH2B/4NzPXZOQfYqQh+wbNxGsQ2aqKA==
X-Received: by 2002:a17:902:e551:b0:20b:4875:2c51 with SMTP id d9443c01a7336-20bfe024d5cmr107983235ad.27.1728141955681;
        Sat, 05 Oct 2024 08:25:55 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:25:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 03/20] include/exec/memop: Move get_alignment_bits from tcg.h
Date: Sat,  5 Oct 2024 08:25:34 -0700
Message-ID: <20241005152551.307923-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005152551.307923-1-richard.henderson@linaro.org>
References: <20241005152551.307923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: l3gJmQuqri8i

This function is specific to MemOp, not TCG in general.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memop.h | 23 +++++++++++++++++++++++
 include/tcg/tcg.h    | 23 -----------------------
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/include/exec/memop.h b/include/exec/memop.h
index f881fe7af4..97720a8ee7 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -170,4 +170,27 @@ static inline bool memop_big_endian(MemOp op)
     return (op & MO_BSWAP) == MO_BE;
 }
 
+/**
+ * get_alignment_bits
+ * @memop: MemOp value
+ *
+ * Extract the alignment size from the memop.
+ */
+static inline unsigned get_alignment_bits(MemOp memop)
+{
+    unsigned a = memop & MO_AMASK;
+
+    if (a == MO_UNALN) {
+        /* No alignment required.  */
+        a = 0;
+    } else if (a == MO_ALIGN) {
+        /* A natural alignment requirement.  */
+        a = memop & MO_SIZE;
+    } else {
+        /* A specific alignment requirement.  */
+        a = a >> MO_ASHIFT;
+    }
+    return a;
+}
+
 #endif
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 21d5884741..824fb3560d 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -281,29 +281,6 @@ static inline int tcg_type_size(TCGType t)
     return 4 << i;
 }
 
-/**
- * get_alignment_bits
- * @memop: MemOp value
- *
- * Extract the alignment size from the memop.
- */
-static inline unsigned get_alignment_bits(MemOp memop)
-{
-    unsigned a = memop & MO_AMASK;
-
-    if (a == MO_UNALN) {
-        /* No alignment required.  */
-        a = 0;
-    } else if (a == MO_ALIGN) {
-        /* A natural alignment requirement.  */
-        a = memop & MO_SIZE;
-    } else {
-        /* A specific alignment requirement.  */
-        a = a >> MO_ASHIFT;
-    }
-    return a;
-}
-
 typedef tcg_target_ulong TCGArg;
 
 /* Define type and accessor macros for TCG variables.
-- 
2.43.0
