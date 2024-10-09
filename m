Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp531951njl;
        Tue, 8 Oct 2024 17:04:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXzfR6rnPrbv1KWnKYg16pONqv8f3og2A5aq7hY+cxWrbT4Eo9RPvGlpAFPjbR7xMQczxV1UoaJhcRjLg==@linaro.org
X-Received: by 2002:a17:902:c40b:b0:20b:bf17:e497 with SMTP id d9443c01a7336-20c63780107mr10372325ad.46.1728432297676;
        Tue, 08 Oct 2024 17:04:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728432297; cv=none;
        d=google.com; s=arc-20240605;
        b=HeoGXyl1kC2ImrOvEbRStTgU+e2H51ZJCOJyjTxkEFMA5i4Jz9QqMjD0RebZ2BNn9q
         bxoV8ELbztAdXKEYXv4B2hZgITWputwuI4C/gP4vHvCr6gJc9sgqHZ+ENGubfnU4aYSO
         C6HLtto0LgjZHbic0DBGplAMfgbUxjOsG9d5FdhKUveCfShLMndP8/qVncA/s9ZMUnF2
         +q7a7yZsYWY2Vw86Dvqj/6RJLF10EjqcYjcE8E8VjeGRrlI+H6408Mqt6h+xsPqYMEn7
         BmQiFp6pu8CR2dHJrHDZY9nTiYN7yd/LrYtsP8VMqztIlqPEc2dJhA88UqVQpJMpRFOe
         7G7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=O9DVukvxY0Nz2lbOkkF1UGxIJ0HiyrlwFe+DiEN47Z4=;
        fh=PMQfBOWRZDaGGVaQKgoW9vajkR0+nf4mdRVwy44clmE=;
        b=d5GcIylSRV4xxkvZVZTiOVxpLTwG6HRJSPi2nXl2DBbi/Di3Npik6eWQbMrscrHjWe
         jDaTOJEzXtRlwiJOZWheoK3Uud8nScr1zYyeL5rkIx6Wrvv9BLu/UCwr5F/7FsF2OsfX
         R2dZQ62+NMGxXlutqyPQtw86knhmI/NNbIFaL3v8JqT/ZeBWhQ4914A68l7GPk/VjWbb
         Niaaut8UHTcapgcBUUs3RQGBF174zJ0TtF4edC8IfVyUV7b7CDdJUgSD6kJF3kQ3JN0A
         fTPQ+dRAKSIZc+MEmREXpmsSMkuPC8r/R+Wkh/Jq8pNLs/T9idoPk0Jv16t5s3HQ8Gqt
         7U2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sbmUqsi7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c139730a7sor50994535ad.14.2024.10.08.17.04.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 17:04:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sbmUqsi7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432297; x=1729037097; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9DVukvxY0Nz2lbOkkF1UGxIJ0HiyrlwFe+DiEN47Z4=;
        b=sbmUqsi7sasFl25pxrrbpc8cA2ws0ChCXCqO9PCq+U8p22EtvzuaTtFlrgPAWYo3aB
         h8eNNXXkbCt4GrlOa4mAN+UERC0xSr9nzXLl1XCcfvDaNI39fK4KmsJ6RRiOb3WRNVks
         yCwe7jVUFzzOn4WEVjJTGP6loJVI30aCoVs4hTziZck2XcrgEfVu5DcXYqipbUyhFsiz
         tFKqsl6Ds6i24bs4N02FmTjes6rkpTEhhq7gfMFc3jg0e9Ap6+RKMyptwLYa21DW60Ry
         iASMJ1n46MkVUrOYNqMSRME75A5DbB2q2DMZ9e0FKemL4VakGK197uTROYhGSOeoZyKC
         QpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432297; x=1729037097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9DVukvxY0Nz2lbOkkF1UGxIJ0HiyrlwFe+DiEN47Z4=;
        b=ITxmFNyc85vOs9lq8Xcndki1zMqxUi/Kjw/1io0DGs0DkddYU2KR5AIFfcszWpVz4E
         pLSp3dMzMvAzHsN63b0ZnqEXSfPesRCeeV0R+HRp4A1jLtAz+L2MVU9yy7P6LPQzcAwU
         AJduAUzO5fAZBCzXZKp1faI3M5kdai5GVfT4U3lnmeljrhTsvNaDyAAWib9wurQ6kyVI
         JzDAL3LhgLlYEMUgf+d8B7iM6nUoD7AYnC7SyovX+yh0Gx0DRepcQyTz4P+m/pfJEBza
         CLATAnBPfp/T+lbPmzORko+CXqtuWi6rwmF+w5gAK0ynFaqzbKCS1PNCdZpGJlHA+UXr
         QYQg==
X-Forwarded-Encrypted: i=1; AJvYcCW7MFWSev+9zXB208037n0oV9GMtKnc8ADjlUq1Qa3m7fwvGoWTV40OWTpZU5jrL857TYEQl96IMKQmpA==@linaro.org
X-Gm-Message-State: AOJu0YyB8Icf9KFanJtDWFeAIsyNvJyfuJkzKU25ZZwjflqoS+O7EB7+
	qe3lHvEwI93RURejmb2fP9G9+ZA0hOG97EM98UA20Ouyxn/t+B1e0spqJJtdMpEZIzlqqoPTH90
	JJto=
X-Google-Smtp-Source: AGHT+IELfN0bakgT3mk/GTecwW46dkwTT2ygCiT/BAX/1818Ov/crY2+v9Y6lIuiJxQlQfEPFhy1uA==
X-Received: by 2002:a17:902:c40b:b0:20b:bf17:e497 with SMTP id d9443c01a7336-20c63780107mr10371935ad.46.1728432297083;
        Tue, 08 Oct 2024 17:04:57 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:04:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org,
	Helge Deller <deller@gmx.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 02/20] include/exec/memop: Move get_alignment_bits from tcg.h
Date: Tue,  8 Oct 2024 17:04:35 -0700
Message-ID: <20241009000453.315652-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009000453.315652-1-richard.henderson@linaro.org>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BdKAmEkTL0Q3

This function is specific to MemOp, not TCG in general.

Reviewed-by: Helge Deller <deller@gmx.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
