Received: by 2002:a05:7022:1102:b0:84:b8cb:c71e with SMTP id ou2csp697146dlb;
        Tue, 16 Jul 2024 23:02:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWaU11L6gKm27+zrqjNjlmZA4fyD0db3Zi3Y3Num0e+D3UdhSoLFvRcazj4vCab0ynR4mhae5hExxWXxa3Yo/SS0BcAn/eZ
X-Received: by 2002:a17:902:ec85:b0:1fb:715d:df83 with SMTP id d9443c01a7336-1fc4e154b16mr6053395ad.13.1721196129840;
        Tue, 16 Jul 2024 23:02:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721196129; cv=none;
        d=google.com; s=arc-20160816;
        b=dIulUiZcqua2FaJ5A88LLzZAoIFAWTKXT7EajiN8w4P8DwTL6Epn/BIa0eS9jlpSQI
         44RGL/Wxb8wM4vUId1S3cVbTIMCcPQIRtRcwpy+qID8ZLYR1vsirOgJK7QiXoVOek816
         19UeT4T8SzMR18EkWscR9jH5HTfaI76bCR/wIEBO2wjBxkoOURXX5L16uNxSuXTAc3r1
         25LATNrvh1RGrK3qH8XcGT9+ObyjcFhNk8TLjErOZ9J337LIVi4S6iB+BE93HkmSRW1i
         QAECMzpZiDd/NzqJrZtP/7j1FCS8bHY8l07wolRapt49sNod94iZpOgZn7BUGYu36n2O
         /f5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KxWo2TuA/jQgHzkRVWBT3lPb6x2Kqd7zGBpsPQ9Mv9Y=;
        fh=F/ROZW3SjjOFwijCPQfUzSETWt2GOd2Tr/mdQSGhs50=;
        b=b7fPLgtHIRTV7+JV+yehv4CN5ADG0qQ6v7dxZAfef40CRFm+5vVQtkOBzPc21Tqefg
         mLMi00ix5wgPHJGpm3w5IMT3ZbXjP5ASScBlMuMo/A6rPfoclCLBEc6ysIaQ/G0PDBdJ
         0SmSjVbBLNKoXRjNMfhOwQVgPs5n3gmzzuBI9aRmjPy/kJwqykHtieHDYfiDJcnkhBAw
         bJ2iJea+RkKlKQz1YiGhQdF4UocHJDaEgV0snseEruxDjVRURW9eQ7z59hvEA1ShbRFU
         x5GRBimsoQsLK+OAM9gujxpQwtjW/2Sc3Y96muT6DPsmUAzpmQvUHy4roCidDoO8a19X
         yLQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CC3rh5EH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-1fc4b804f61sor3939905ad.1.2024.07.16.23.02.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Jul 2024 23:02:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CC3rh5EH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721196129; x=1721800929; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxWo2TuA/jQgHzkRVWBT3lPb6x2Kqd7zGBpsPQ9Mv9Y=;
        b=CC3rh5EHE2cX3Pi/6byow5AvX7odLb7OYWBRYDsBO/GPzKHJAcAuX3RU/y7nfVENZx
         R2WKsixCLUFsOo4GzkwBCImwTuzrzN2gxQbF8ZPsh7NJfni6ESTDzykkwIsEPqoS71Ur
         HuMG4CCCbXxvRqX2GEYL8rZlDltoUhRln7+t6eA0px+Mn520z8GeOZSOFwH1C7YVMXqF
         EZ4sDWwZ+eDsFKsh8lmbyFzglMSw3bEK8Fu0UT/gDsR0MT2E/2RGiZlMXgqCaeRLl88U
         NOMtI9SdhRkvqAgOT0w5+YObsCsddoO/1q1E6AGtzmH4iTsONathFj927DRFOQO3E3ZH
         1zuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721196129; x=1721800929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxWo2TuA/jQgHzkRVWBT3lPb6x2Kqd7zGBpsPQ9Mv9Y=;
        b=pePDVC2JNANfB64YYR872f2YsungmXI2m+VD4tGryUbh3GJnOxigxvUxHI+FIwZKDd
         S+01ZSrCA3g4B6pnrF/wg7X1gsCuC1XBWmGRgECxdQqjiy6wP+6AghUrN+/zKeY3rieb
         lJizpVY4j6ysKB+Mrp7fLB3/v1tSZkf5jXMlvTIFZb2wrNsIaZSw4yFhYJr5va+2M7aW
         t/l37pculesDMgtLiubsxjMBie4UM5vn8r//bXcJTxoSEYrIVQotwHcKBHOaROYjqtsK
         GYI4/WNeoEcrEHtwcKzcENQW10fdsEb1V2SFahecyV2w/TuNimVjGiqrluS31pfewZNS
         zZkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUSG2HsgrwSalxHlPVURINE6XYd4qW+0Mg8p15zqMhuS0i/wcr4orcH2ofX1WukSBxxYMH/sd5QbNn5xrD121LKmLviFfv
X-Gm-Message-State: AOJu0Yxw1IsPjgUNLVcYVzrUjNtF3/zeJDxIiNWwmmhtXdx+X1ZcGV9B
	J5g8+TZwilhYAxsPofZJgk9xVqyivh9odYP12Nzkv0jAzJT4GjyVVs5LGlfAs695wQ==
X-Google-Smtp-Source: AGHT+IGtj0tp3Xv5BTTlFpnugLzH1yn/SWjGsex1ndcvjNku3CUxDS9U4bSi7Miezx/Cksv5dJwGdA==
X-Received: by 2002:a17:902:e54d:b0:1fb:80a3:5820 with SMTP id d9443c01a7336-1fc4e6b62a0mr4657955ad.40.1721196129115;
        Tue, 16 Jul 2024 23:02:09 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([203.56.128.103])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc27383sm68131575ad.140.2024.07.16.23.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 23:02:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Daniyal Khan <danikhan632@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 3/3] tests/tcg/aarch64: Add test cases for SME FMOPA (widening)
Date: Wed, 17 Jul 2024 16:01:49 +1000
Message-ID: <20240717060149.204788-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717060149.204788-1-richard.henderson@linaro.org>
References: <20240717060149.204788-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: IYOLGrRrMbiw

From: Daniyal Khan <danikhan632@gmail.com>

Signed-off-by: Daniyal Khan <danikhan632@gmail.com>
Message-Id: 172090222034.13953.16888708708822922098-1@git.sr.ht
[rth: Split test from a larger patch, tidy assembly]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/sme-fmopa-1.c   | 63 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/sme-fmopa-2.c   | 56 +++++++++++++++++++++++++++
 tests/tcg/aarch64/sme-fmopa-3.c   | 63 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  5 ++-
 4 files changed, 185 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/aarch64/sme-fmopa-1.c
 create mode 100644 tests/tcg/aarch64/sme-fmopa-2.c
 create mode 100644 tests/tcg/aarch64/sme-fmopa-3.c

diff --git a/tests/tcg/aarch64/sme-fmopa-1.c b/tests/tcg/aarch64/sme-fmopa-1.c
new file mode 100644
index 0000000000..652c4ea090
--- /dev/null
+++ b/tests/tcg/aarch64/sme-fmopa-1.c
@@ -0,0 +1,63 @@
+/*
+ * SME outer product, 1 x 1.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <stdio.h>
+
+static void foo(float *dst)
+{
+    asm(".arch_extension sme\n\t"
+        "smstart\n\t"
+        "ptrue p0.s, vl4\n\t"
+        "fmov z0.s, #1.0\n\t"
+        /*
+         * An outer product of a vector of 1.0 by itself should be a matrix of 1.0.
+         * Note that we are using tile 1 here (za1.s) rather than tile 0.
+         */
+        "zero {za}\n\t"
+        "fmopa za1.s, p0/m, p0/m, z0.s, z0.s\n\t"
+        /*
+         * Read the first 4x4 sub-matrix of elements from tile 1:
+         * Note that za1h should be interchangeable here.
+         */
+        "mov w12, #0\n\t"
+        "mova z0.s, p0/m, za1v.s[w12, #0]\n\t"
+        "mova z1.s, p0/m, za1v.s[w12, #1]\n\t"
+        "mova z2.s, p0/m, za1v.s[w12, #2]\n\t"
+        "mova z3.s, p0/m, za1v.s[w12, #3]\n\t"
+        /*
+         * And store them to the input pointer (dst in the C code):
+         */
+        "st1w {z0.s}, p0, [%0]\n\t"
+        "add x0, x0, #16\n\t"
+        "st1w {z1.s}, p0, [x0]\n\t"
+        "add x0, x0, #16\n\t"
+        "st1w {z2.s}, p0, [x0]\n\t"
+        "add x0, x0, #16\n\t"
+        "st1w {z3.s}, p0, [x0]\n\t"
+        "smstop"
+        : : "r"(dst)
+        : "x12", "d0", "d1", "d2", "d3", "memory");
+}
+
+int main()
+{
+    float dst[16] = { };
+
+    foo(dst);
+
+    for (int i = 0; i < 16; i++) {
+        if (dst[i] != 1.0f) {
+            goto failure;
+        }
+    }
+    /* success */
+    return 0;
+
+ failure:
+    for (int i = 0; i < 16; i++) {
+        printf("%f%c", dst[i], i % 4 == 3 ? '\n' : ' ');
+    }
+    return 1;
+}
diff --git a/tests/tcg/aarch64/sme-fmopa-2.c b/tests/tcg/aarch64/sme-fmopa-2.c
new file mode 100644
index 0000000000..15f0972d83
--- /dev/null
+++ b/tests/tcg/aarch64/sme-fmopa-2.c
@@ -0,0 +1,56 @@
+/*
+ * SME outer product, FZ vs FZ16
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <stdint.h>
+#include <stdio.h>
+
+static void test_fmopa(uint32_t *result)
+{
+    asm(".arch_extension sme\n\t"
+        "smstart\n\t"               /* Z*, P* and ZArray cleared */
+        "ptrue p2.b, vl16\n\t"      /* Limit vector length to 16 */
+        "ptrue p5.b, vl16\n\t"
+        "movi d0, #0x00ff\n\t"      /* fp16 denormal */
+        "movi d16, #0x00ff\n\t"
+        "mov w15, #0x0001000000\n\t" /* FZ=1, FZ16=0 */
+        "msr fpcr, x15\n\t"
+        "fmopa za3.s, p2/m, p5/m, z16.h, z0.h\n\t"
+        "mov w15, #0\n\t"
+        "st1w {za3h.s[w15, 0]}, p2, [%0]\n\t"
+        "add %0, %0, #16\n\t"
+        "st1w {za3h.s[w15, 1]}, p2, [%0]\n\t"
+        "mov w15, #2\n\t"
+        "add %0, %0, #16\n\t"
+        "st1w {za3h.s[w15, 0]}, p2, [%0]\n\t"
+        "add %0, %0, #16\n\t"
+        "st1w {za3h.s[w15, 1]}, p2, [%0]\n\t"
+        "smstop"
+        : "+r"(result) :
+        : "x15", "x16", "p2", "p5", "d0", "d16", "memory");
+}
+
+int main(void)
+{
+    uint32_t result[4 * 4] = { };
+
+    test_fmopa(result);
+
+    if (result[0] != 0x2f7e0100) {
+        printf("Test failed: Incorrect output in first 4 bytes\n"
+               "Expected: %08x\n"
+               "Got:      %08x\n",
+               0x2f7e0100, result[0]);
+        return 1;
+    }
+
+    for (int i = 1; i < 16; ++i) {
+        if (result[i] != 0) {
+            printf("Test failed: Non-zero word at position %d\n", i);
+            return 1;
+        }
+    }
+
+    return 0;
+}
diff --git a/tests/tcg/aarch64/sme-fmopa-3.c b/tests/tcg/aarch64/sme-fmopa-3.c
new file mode 100644
index 0000000000..3bfec34914
--- /dev/null
+++ b/tests/tcg/aarch64/sme-fmopa-3.c
@@ -0,0 +1,63 @@
+/*
+ * SME outer product, [ 1 2 3 4 ] squared
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <stdio.h>
+#include <stdint.h>
+#include <string.h>
+#include <math.h>
+
+static const float i_1234[4] = {
+    1.0f, 2.0f, 3.0f, 4.0f
+};
+
+static const float expected[4] = {
+    4.515625f, 5.750000f, 6.984375f, 8.218750f
+};
+
+static void test_fmopa(float *result)
+{
+    asm(".arch_extension sme\n\t"
+        "smstart\n\t"               /* ZArray cleared */
+        "ptrue p2.b, vl16\n\t"      /* Limit vector length to 16 */
+        "ld1w {z0.s}, p2/z, [%1]\n\t"
+        "mov w15, #0\n\t"
+        "mov za3h.s[w15, 0], p2/m, z0.s\n\t"
+        "mov za3h.s[w15, 1], p2/m, z0.s\n\t"
+        "mov w15, #2\n\t"
+        "mov za3h.s[w15, 0], p2/m, z0.s\n\t"
+        "mov za3h.s[w15, 1], p2/m, z0.s\n\t"
+        "msr fpcr, xzr\n\t"
+        "fmopa za3.s, p2/m, p2/m, z0.h, z0.h\n\t"
+        "mov w15, #0\n\t"
+        "st1w {za3h.s[w15, 0]}, p2, [%0]\n"
+        "add %0, %0, #16\n\t"
+        "st1w {za3h.s[w15, 1]}, p2, [%0]\n\t"
+        "mov w15, #2\n\t"
+        "add %0, %0, #16\n\t"
+        "st1w {za3h.s[w15, 0]}, p2, [%0]\n\t"
+        "add %0, %0, #16\n\t"
+        "st1w {za3h.s[w15, 1]}, p2, [%0]\n\t"
+        "smstop"
+        : "+r"(result) : "r"(i_1234)
+        : "x15", "x16", "p2", "d0", "memory");
+}
+
+int main(void)
+{
+    float result[4 * 4] = { };
+    int ret = 0;
+
+    test_fmopa(result);
+
+    for (int i = 0; i < 4; i++) {
+        float actual = result[i];
+        if (fabsf(actual - expected[i]) > 0.001f) {
+            printf("Test failed at element %d: Expected %f, got %f\n",
+                   i, expected[i], actual);
+            ret = 1;
+        }
+    }
+    return ret;
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index b53218e115..8cc62eb456 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -70,8 +70,9 @@ endif
 
 # SME Tests
 ifneq ($(CROSS_AS_HAS_ARMV9_SME),)
-AARCH64_TESTS += sme-outprod1 sme-smopa-1 sme-smopa-2
-sme-outprod1 sme-smopa-1 sme-smopa-2: CFLAGS += $(CROSS_AS_HAS_ARMV9_SME)
+SME_TESTS = sme-outprod1 sme-smopa-1 sme-smopa-2 sme-fmopa-1 sme-fmopa-2 sme-fmopa-3
+AARCH64_TESTS += $(SME_TESTS)
+$(SME_TESTS): CFLAGS += $(CROSS_AS_HAS_ARMV9_SME)
 endif
 
 # System Registers Tests
-- 
2.43.0
