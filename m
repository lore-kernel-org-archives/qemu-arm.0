Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp349353lft;
        Fri, 8 Jul 2022 08:47:50 -0700 (PDT)
X-Received: by 2002:a17:903:2281:b0:16a:6604:d1d8 with SMTP id b1-20020a170903228100b0016a6604d1d8mr4165950plh.78.1657295269978;
        Fri, 08 Jul 2022 08:47:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657295269; cv=none;
        d=google.com; s=arc-20160816;
        b=qSKPz/0apt5+4vjj6jEUDW8XwAUQ0dztMXPTPzp8OmZSu40NppIZ3CQ8uwllORmUJf
         RmVSNnPOzvOTVK7UmwV/GmD1F25Pg2mvF3Z3sC25MwSIxXAoTKGIdVguyUwa9UvnoMwu
         1ocK9xTnzWfV1bwW2wW3oiu9WhnypKxHjB0iJwik0HYpxRNy7GToZ0IuuKxkYBidGfuF
         6hXnonAQqZrgel8OzVzrCNCPj4JTIGXD0HlzBPIpUC7bY413JXuG9DJ9CIG9IC9Dg3pg
         frJz6X0U4zIj1P51WgJAj2XSqjb7JzwzdfgctJI1VSvxVN6VYmGc28ZYqge5xb61sfHd
         z9fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Pvi9qlovHhKpDCenz2S7UQUGmj2q8e/6gUB6XkPNY2s=;
        b=xZIY9+2ErJoBw68trCxW1opwgJ+EhTw9MgSyykQt3dM19sexnL2LiXsM8ey/LZXWf8
         lKr6Si9ILfQmL/RSIqPkC5s5xYP3HAop/Lg6dzNQZIzhTLKEo2/S3wHT5TFsJ0pLio6A
         y/cKMoy6CbCub2k0w7T0UDrCS2SU2XrSjn2k/F/3g2IIFFo4PT36K9Ix+RHSkphYqPuO
         +hVdEiG/MWiSVs1XvigA0ISZjLR+mS3TzhSg6Ahf5DpEtYlLg+ThZ6kTaGHfKpRkiMSc
         p4DuKuWABwVkiQbNhiXyt/WH3G1z/H3JLG38ukuIuwEPJev1Kzb9mCuurrPveYXacy5A
         s1ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XQ7ca/Ye";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p12-20020a1709026b8c00b0015321612844sor7935756plk.110.2022.07.08.08.47.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 08 Jul 2022 08:47:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XQ7ca/Ye";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Pvi9qlovHhKpDCenz2S7UQUGmj2q8e/6gUB6XkPNY2s=;
        b=XQ7ca/YeFeNHGK2uvPtpJUOFlHRPUvGDHCiH6WRQaz6VsRUZePHP1ruXD6QrLs5JHM
         S48cFs0MWP0iMA3t7F+PbL9elu9Pl2TTgIFwbnOx0jC7s4QxkloARw67cwhek8/CWETg
         9Wy/6jlhnVr86TdIKAdqyZ1AuXjh2tYYc1ETtuKKH6tncAIe3msmrGJpWzpa2wCaKp0z
         BqlkNhoX4IQHirJOIp5AlvGWKOLLvP8ux8MfkylCyYfkthoM7FLimHXt0ztv1CYZ9TVf
         iNEt/OEbrc3bNU91wSWjWPSc1VFMR31N2fGeDh0kmj+dJN/kbtz/86hLyGbnAbitIJ+q
         xvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Pvi9qlovHhKpDCenz2S7UQUGmj2q8e/6gUB6XkPNY2s=;
        b=B9o2HsGJ/lBMPyD75kX01NTKFw7O0Yi4cNGM0bpsAFAbZ4u/c7whijgwAheHEAnUBK
         CFaxEoXipJn6N3dl/5bqvAHKeF2o4YD19t076ZMwstljA64JqJOEB0sWvnUVsLLSK4bh
         78aHh972Ratx8UywQh9u6bbyOJUBnNAXwejFxtwGrt+hFwI8292wuuwYJcgf3CVwuzRr
         RQkdDg+TFD6nEfcjkqdoNr1D3nnGdLSvVQWskUr8v1xbx/J8m62ZvL6CTj2j4wD16184
         iddWZ2DL2IORqlO7cp4nSzE/UayIqNENLRrGkiXzzjAsOeDQb9OjUMoB9e3gJLz1m0hY
         yaOQ==
X-Gm-Message-State: AJIora9DCkdN71i0kPBFhGpt8FBbmnPzHS4q5K9cpqEbXcUlSbf5XvPd
	NjCc+fOL9VTdpIvEBhKlOuWlRt9E
X-Google-Smtp-Source: AGRyM1tcBdpQagT8fLLEO7KbkE3OvkhwHpTvIaNE1kH8Uq7bDlV2scDsbgEUA8LA+6VpgaGsJwVZEg==
X-Received: by 2002:a17:902:a502:b0:15e:c251:b769 with SMTP id s2-20020a170902a50200b0015ec251b769mr4384608plq.115.1657295269405;
        Fri, 08 Jul 2022 08:47:49 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([122.255.60.245])
        by smtp.gmail.com with ESMTPSA id y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 08:47:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v4 13/29] Split RES_MISMATCH for registers and memory
Date: Fri,  8 Jul 2022 21:16:44 +0530
Message-Id: <20220708154700.18682-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: gRF4uLi0jD+1

By remembering the specific comparison that failed, we do not
have to try again when it comes time to report.  This makes
the mem_used flag redundant.  Also, packet_mismatch is now
redundant with RES_BAD_IO.

This means that the only thing that report_match_status does
is to report on register status, so rename to report_mismatch_reg.
Also, we know there is a failure, so don't return a status from
the report.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu.h    | 13 ++++++-------
 reginfo.c | 45 ++++++++-------------------------------------
 risu.c    | 10 +++++++---
 3 files changed, 21 insertions(+), 47 deletions(-)

diff --git a/risu.h b/risu.h
index f383b64..77d6128 100644
--- a/risu.h
+++ b/risu.h
@@ -54,7 +54,8 @@ typedef enum {
 typedef enum {
     RES_OK = 0,
     RES_END,
-    RES_MISMATCH,
+    RES_MISMATCH_REG,
+    RES_MISMATCH_MEM,
     RES_BAD_IO,
 } RisuResult;
 
@@ -100,13 +101,11 @@ RisuResult send_register_info(void *uc);
  */
 RisuResult recv_and_compare_register_info(void *uc);
 
-/* Print a useful report on the status of the last comparison
- * done in recv_and_compare_register_info(). This is called on
- * exit, so need not restrict itself to signal-safe functions.
- * Should return 0 if it was a good match (ie end of test)
- * and 1 for a mismatch.
+/*
+ * Print a useful report on the status of the last reg comparison
+ * done in recv_and_compare_register_info().
  */
-int report_match_status(void);
+void report_mismatch_reg(void);
 
 /* Interface provided by CPU-specific code: */
 
diff --git a/reginfo.c b/reginfo.c
index 31bc699..a007f16 100644
--- a/reginfo.c
+++ b/reginfo.c
@@ -17,9 +17,6 @@
 static struct reginfo master_ri, apprentice_ri;
 static uint8_t master_memblock[MEMBLOCKLEN];
 
-static int mem_used;
-static int packet_mismatch;
-
 RisuResult send_register_info(void *uc)
 {
     struct reginfo ri;
@@ -107,10 +104,10 @@ RisuResult recv_and_compare_register_info(void *uc)
          */
         res = read_buffer(&master_ri, reginfo_size());
         if (res != RES_OK) {
-            packet_mismatch = 1;
+            /* fail */
         } else if (!reginfo_is_eq(&master_ri, &apprentice_ri)) {
             /* register mismatch */
-            res = RES_MISMATCH;
+            res = RES_MISMATCH_REG;
         } else if (op == OP_TESTEND) {
             res = RES_END;
         }
@@ -124,13 +121,12 @@ RisuResult recv_and_compare_register_info(void *uc)
                               (uintptr_t)memblock);
         break;
     case OP_COMPAREMEM:
-        mem_used = 1;
         res = read_buffer(master_memblock, MEMBLOCKLEN);
         if (res != RES_OK) {
-            packet_mismatch = 1;
+            /* fail */
         } else if (memcmp(memblock, master_memblock, MEMBLOCKLEN) != 0) {
             /* memory mismatch */
-            res = RES_MISMATCH;
+            res = RES_MISMATCH_MEM;
         }
         respond(res == RES_OK ? RES_OK : RES_END);
         break;
@@ -141,40 +137,15 @@ RisuResult recv_and_compare_register_info(void *uc)
     return res;
 }
 
-/* Print a useful report on the status of the last comparison
- * done in recv_and_compare_register_info(). This is called on
- * exit, so need not restrict itself to signal-safe functions.
- * Should return 0 if it was a good match (ie end of test)
- * and 1 for a mismatch.
+/*
+ * Print a useful report on the status of the last reg comparison
+ * done in recv_and_compare_register_info().
  */
-int report_match_status(void)
+void report_mismatch_reg(void)
 {
-    int resp = 0;
-    fprintf(stderr, "match status...\n");
-    if (packet_mismatch) {
-        fprintf(stderr, "packet mismatch (probably disagreement "
-                "about UNDEF on load/store)\n");
-        return 1;
-    }
-    if (!reginfo_is_eq(&master_ri, &apprentice_ri)) {
-        fprintf(stderr, "mismatch on regs!\n");
-        resp = 1;
-    }
-    if (mem_used
-        && memcmp(memblock, &master_memblock, MEMBLOCKLEN) != 0) {
-        fprintf(stderr, "mismatch on memory!\n");
-        resp = 1;
-    }
-    if (!resp) {
-        fprintf(stderr, "match!\n");
-        return 0;
-    }
-
     fprintf(stderr, "master reginfo:\n");
     reginfo_dump(&master_ri, stderr);
     fprintf(stderr, "apprentice reginfo:\n");
     reginfo_dump(&apprentice_ri, stderr);
-
     reginfo_dump_mismatch(&master_ri, &apprentice_ri, stderr);
-    return resp;
 }
diff --git a/risu.c b/risu.c
index 199f697..d6c2deb 100644
--- a/risu.c
+++ b/risu.c
@@ -224,9 +224,13 @@ static int apprentice(void)
     case RES_END:
         return EXIT_SUCCESS;
 
-    case RES_MISMATCH:
-        fprintf(stderr, "mismatch after %zd checkpoints\n", signal_count);
-        report_match_status();
+    case RES_MISMATCH_REG:
+        fprintf(stderr, "mismatch reg after %zd checkpoints\n", signal_count);
+        report_mismatch_reg();
+        return EXIT_FAILURE;
+
+    case RES_MISMATCH_MEM:
+        fprintf(stderr, "mismatch mem after %zd checkpoints\n", signal_count);
         return EXIT_FAILURE;
 
     case RES_BAD_IO:
-- 
2.34.1
