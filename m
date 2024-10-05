Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1147607njb;
        Sat, 5 Oct 2024 13:06:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVP3Drn2nFA5ZeXenTOSKZ3NlmvOOikNlSCPMdyPa50LFS8m2Z5i9wAIhC/c7/WEXhSRn4gIC6USgzkDw==@linaro.org
X-Received: by 2002:a17:903:244d:b0:20b:8510:bf4d with SMTP id d9443c01a7336-20bfde55570mr126895725ad.6.1728158764778;
        Sat, 05 Oct 2024 13:06:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728158764; cv=none;
        d=google.com; s=arc-20240605;
        b=R6LxFtHg+zig4HgNGk0Jb2YSIEKjQYlKupTyCVoY0oAMtIYC3Z0QR4sbPrX93t2VaP
         SrnnFK6A+9NcHdSkvBRWkSx0PCGMYxYsu5LSjIQl6jVQeWfLOt7MQe9uQcOKKbbnr4dM
         +KiBRLOvxdHGmSRVMQc9qavf/PkRZREzGJrS2zeo5yZACyS725L7CDdY1cRBJNRMmcRd
         9ZFBAeMDmLZGKB2wepBHH3wt88AHH2H3IFLP1jpnA13wUKmP2yy+5ij/LSL8XJpSJ8d6
         P19qQpweQNKrY4tX+qpAE4RqyeuV7O8R3kI5PLPWuS5qpA7Y1Cp2/liHR5N/vQtXX6oi
         2LFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=js9k8IR/cEhAqGc5dKpCioG/n/UgV+piB56d5dg8Aiw=;
        fh=fhKbVf6h0kBis/J4mpTSuTTtAKzfow3K/REZVDCKqkE=;
        b=YPdloHft5NcqPMehOFmQP5s7Y2tqyZehubL6cE7MY9JDWEve2CfGheVu3Vmj2v/4y7
         Z0c/tmf6ne10rhrxQQw5+tIxi/evjI3buH1keNlAhf1yP3I6b99ka3NTfZQpr0RCBuvf
         i5+vNUBPD5klpZot1M5N2iDecdExydAV3XVfNZWlPAaBt3yHH1iFzzifCkQXTAmKjGjV
         PksCVlQWiR4noiGnzr8SirrabQiQHQHiBWEp2FblW43j3qB/X4X+L3bzGUaipQbyg7gb
         lLQyZS0dh47sCJdW/GUUIBRatF/BAQs+cB/rvnyDCmMSKuFkWWtJVhpzhOPjZMnJWDC2
         kY6w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AheupHt2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138a2ed4sor10486105ad.2.2024.10.05.13.06.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 13:06:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AheupHt2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158764; x=1728763564; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=js9k8IR/cEhAqGc5dKpCioG/n/UgV+piB56d5dg8Aiw=;
        b=AheupHt2JsgC0BoDvjXs5i7bHS50NDagvbiPFwF7WzmA5FUVKL6r0czWCE6M8cmZSV
         BX8BL4Yz4kY0mtlbRNB4BM23FzD3z620qnNWdcXrdL0QPLMGoP/OHij6usdeHmwf5jwF
         T/VvN2R4lDU+bPK02ISYq8t84KposHNK5pdyeXbL2MEUIAeqJcLLf9KYfLxNNfYc7Ou6
         BiGU/7cm0xBGNbwIz/Mb7zbearONckd77VsxP9gjlfoad0AsjS0V/+Sak1mBjrcsCXtC
         Dip/7kBRKOVuh6DraBlj9uyTKqzaxi8W2MMsJ2UgQAMs1FgNU6Wwq7ORsbpKgbF/eaB8
         7TMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158764; x=1728763564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=js9k8IR/cEhAqGc5dKpCioG/n/UgV+piB56d5dg8Aiw=;
        b=XRTf5cmmEJsrPd4/om2jR92KBT/zemrCwAUIb0416djLPeiW+7pew6whrxYq5mXa4p
         erN0pa5iHgebKkTTtb5HNegx1ZO6ssj2JV9DhHOFoVDGw3xE4nLfsAArc/mrZXqCyjKj
         Um4ztCOMDPbA50BX7Yk3EtGpGUtwpIeQHu9XEqJGriPNESoaAXmo3g+K01udjz557xdI
         6K0G8oX3rof6MMxCbq1KrFHBruHntuZYfW/JsyluJY7wY1nqrmrise4T96fB3dJEvdQf
         W1y5GRWH2pooqFUh5n+BxoURqNsCq54LIvKRw9pXnjS+XedMtIxCuB6tSfaj+Yj4+xCY
         l2mA==
X-Forwarded-Encrypted: i=1; AJvYcCXwuKfw2A7bDyMLpeey38niVBU/qY1kqWZJV12LdXsj2JpcrAUWbRkC+JYxjdopZShdJHIB0pnYDPRDww==@linaro.org
X-Gm-Message-State: AOJu0YwEmzC7M0TDz3loNJCOg++Wr75LSeCZz5JZ0920zanb6CYKce3H
	pb16c75y4ITIxAxpu36b0UPFaBcSJQo5HEDLlh5EPL4RADA+ZjnkVf1PqjFmWF9aeQ==
X-Google-Smtp-Source: AGHT+IG2QzkqWQJ6aa5SACwUNhrBcwJqwMcmd6FgF+mUSPNCiyiBOS8ZrrP8asqO/lz2F3toxq/lxg==
X-Received: by 2002:a17:902:db0d:b0:20b:8642:9863 with SMTP id d9443c01a7336-20bfdfc268dmr105234565ad.18.1728158764343;
        Sat, 05 Oct 2024 13:06:04 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 03/21] include/exec/memop: Move get_alignment_bits from tcg.h
Date: Sat,  5 Oct 2024 13:05:42 -0700
Message-ID: <20241005200600.493604-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005200600.493604-1-richard.henderson@linaro.org>
References: <20241005200600.493604-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: LykLCggjG688

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
