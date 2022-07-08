Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp349193lft;
        Fri, 8 Jul 2022 08:47:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:1491:b0:528:1aa1:743c with SMTP id v17-20020a056a00149100b005281aa1743cmr4631598pfu.84.1657295253359;
        Fri, 08 Jul 2022 08:47:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657295253; cv=none;
        d=google.com; s=arc-20160816;
        b=xtI6KJDR2NNro6MjsrhyriuYFDIjXVowjxnRJaFXIt8fey1/rTl/+lUgB0pLrZ3+nI
         tBRrxxAmfXsOk3xHALBDLfd2ApKT9lcRcXq+O2TYesxlhmxeWSWZ0btOs260Flz8S6fb
         4je4WeBInUTuJkNahmO/kKw/25zVfcLOc32rHsQC++/pBTnWNwe4EBGwLsm8wwdIFtCN
         6pVaeyV8LBOexDrmnjxaj/wPzxQF/C+9qVuutXPHbQZ1bSL+fVgMLNftKZ8f3k42PlOA
         cONBjQAi8eIx0mMFZ7CnKHYIryFTgDJl2Ytut0CL88ertLjxmPKrHp/uzwu6rcCOrIHD
         4WHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qhmfc0Bs2SrTe50tDkhCkofVbawYB7l8nD2/4Z7gVmI=;
        b=Uh5XnturlQvBzke+slKR6ILY+pLaf8a7ZjyjQ7MvUBPTkafaE9/pFTcp9HV3qFSDix
         bZAjNNzlHdidTAYbnXT/BKIWu8hkYHiFCBPBdgDrgx7sBqeVWl1/So+YsDeJ310RP5K9
         YBH9tS4nIgf0RdUMJuIbDz14WMijWA0+SyOMbN7UkvyEORzLafF8HNF4dmQWiEZh8IGC
         VyLh2Lc88hySSdmq2cvdg9ohisjnxpR7WrW0O9tbhBl85YY+HKle3GUoz/Qer1psgi+2
         nDu6RC52PB+WTBLENtCfimc8K4GrGajM3Hhnjq5bTutHWhgWjvKS/VP+VqrBi1ViVzb+
         YJTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YwwW7u5u;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c18-20020a170903235200b001676b0ec6ddsor16882807plh.42.2022.07.08.08.47.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 08 Jul 2022 08:47:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YwwW7u5u;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qhmfc0Bs2SrTe50tDkhCkofVbawYB7l8nD2/4Z7gVmI=;
        b=YwwW7u5uJpkoRDfoxBb61fLnmcvQXo3pRZ/zsLICXNOG1rE6bYHit1n42QaaDpvasQ
         HU8g0JKMC0VjMwZ7UD3dE3tY/zFVnCPoCRbZztdiWsTkcSDSs0qp6a8dGpWyXxIjastl
         nDVdpwKfp1UNn4nBxvf+KeHUIV897DpEh3q4K1pXDJ/G+nwS5HuBCs3fsLjjx7cyBWtb
         O0F9tqo2lMrntmIJ+crr5dtlkf4oNMPY4r6tMUp8qLzPxHYQzvZ6cPTdXfAFR7qeKZOs
         3Q5DVUyg23Tut7KQTxySjaiOR7M+7wZBfI/EtUUXb56QFOXtPomNrWuWPJy9eU5Hz2tP
         kheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qhmfc0Bs2SrTe50tDkhCkofVbawYB7l8nD2/4Z7gVmI=;
        b=ExZmhhsd3cTOW/RNsx1rHQ7QzBhxL9f+dsvwR398ynDG+CDGPA3pa0Ntn14YkDh1Uw
         LSUzn/o5Dll5WMCOFdZ7fedCNn7s7I+scGPJNd8LM/HjIpYA17aMgU0mP7F4dGzMIPI8
         tAy6FALd7y22s8WJzwpRpEeVhxZpnZ5TKRX2PGl6aurYbjSSJ4AC0QPqb8EOjaW+ZWgO
         QKrpya5nafreHPgeoCfAU/R6Gy+4wEpGejT2piAXrhtjB4wKl9ZLjfS79QW2uW538+Qj
         0wZhSvLDidMYOLhfPTXo8bzlzMsTDnu/gyZPsk+0VI4AqFowOgJ/RKdeY9VxVCGruov4
         SePA==
X-Gm-Message-State: AJIora8vrj3a138QLuu+mYvLGW//4T2sccHiavI13VjLGHCEJr9cOvCV
	unKKgLumLcdss0tww9q9BfUrFtBV
X-Google-Smtp-Source: AGRyM1sMF2DxGYe9F+0SLjsP9is3MlcA4vhRElFPJ2daDsccVWvB552DcXli7RHD0e5Pc3+ShKE4lQ==
X-Received: by 2002:a17:902:f650:b0:15f:3a10:a020 with SMTP id m16-20020a170902f65000b0015f3a10a020mr4182527plg.61.1657295252711;
        Fri, 08 Jul 2022 08:47:32 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([122.255.60.245])
        by smtp.gmail.com with ESMTPSA id y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 08:47:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v4 08/29] Add enum RisuResult
Date: Fri,  8 Jul 2022 21:16:39 +0530
Message-Id: <20220708154700.18682-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /N8oYTjkpYBI

Formalize the random set of numbers into an enum.  Doing this
makes it easy to see that one of the responses in
recv_and_compare_register_info was inconsistent.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu.h    | 25 +++++++++++++++++--------
 reginfo.c | 32 ++++++++++++++++----------------
 risu.c    | 18 +++++++++---------
 3 files changed, 42 insertions(+), 33 deletions(-)

diff --git a/risu.h b/risu.h
index a7aa929..e6d07eb 100644
--- a/risu.h
+++ b/risu.h
@@ -57,6 +57,14 @@ typedef enum {
     OP_COMPAREMEM = 4,
 } RisuOp;
 
+/* Result of operation */
+typedef enum {
+    RES_OK = 0,
+    RES_END,
+    RES_MISMATCH,
+    RES_BAD_IO,
+} RisuResult;
+
 /* The memory block should be this long */
 #define MEMBLOCKLEN 8192
 
@@ -82,20 +90,21 @@ typedef struct {
  */
 typedef int (*write_fn) (void *ptr, size_t bytes);
 typedef int (*read_fn) (void *ptr, size_t bytes);
-typedef void (*respond_fn) (int response);
+typedef void (*respond_fn) (RisuResult response);
 
-/* Send the register information from the struct ucontext down the socket.
- * Return the response code from the master.
+/*
+ * Send the register information from the struct ucontext down the socket.
  * NB: called from a signal handler.
  */
-int send_register_info(write_fn write_fn, void *uc);
+RisuResult send_register_info(write_fn write_fn, void *uc);
 
-/* Read register info from the socket and compare it with that from the
- * ucontext. Return 0 for match, 1 for end-of-test, 2 for mismatch.
+/*
+ * Read register info from the socket and compare it with that from the
+ * ucontext.
  * NB: called from a signal handler.
  */
-int recv_and_compare_register_info(read_fn read_fn,
-                                   respond_fn respond, void *uc);
+RisuResult recv_and_compare_register_info(read_fn read_fn,
+                                          respond_fn respond, void *uc);
 
 /* Print a useful report on the status of the last comparison
  * done in recv_and_compare_register_info(). This is called on
diff --git a/reginfo.c b/reginfo.c
index 2d67c93..b909a1f 100644
--- a/reginfo.c
+++ b/reginfo.c
@@ -21,7 +21,7 @@ uint8_t apprentice_memblock[MEMBLOCKLEN];
 static int mem_used;
 static int packet_mismatch;
 
-int send_register_info(write_fn write_fn, void *uc)
+RisuResult send_register_info(write_fn write_fn, void *uc)
 {
     struct reginfo ri;
     trace_header_t header;
@@ -34,7 +34,7 @@ int send_register_info(write_fn write_fn, void *uc)
     header.pc = get_pc(&ri);
     header.risu_op = op;
     if (write_fn(&header, sizeof(header)) != 0) {
-        return -1;
+        return RES_BAD_IO;
     }
 
     switch (op) {
@@ -46,10 +46,10 @@ int send_register_info(write_fn write_fn, void *uc)
          * (b) end of test (c) a non-risuop UNDEF
          */
         if (write_fn(&ri, reginfo_size()) != 0) {
-            return -1;
+            return RES_BAD_IO;
         }
         /* For OP_TEST_END, force return 1 to exit. */
-        return op == OP_TESTEND;
+        return op == OP_TESTEND ? RES_END : RES_OK;
     case OP_SETMEMBLOCK:
         memblock = (void *)(uintptr_t)get_reginfo_paramreg(&ri);
         break;
@@ -63,7 +63,7 @@ int send_register_info(write_fn write_fn, void *uc)
     default:
         abort();
     }
-    return 0;
+    return RES_OK;
 }
 
 /* Read register info from the socket and compare it with that from the
@@ -74,10 +74,10 @@ int send_register_info(write_fn write_fn, void *uc)
  * that says whether it is register or memory data, so if the two
  * sides get out of sync then we will fail obscurely.
  */
-int recv_and_compare_register_info(read_fn read_fn,
-                                   respond_fn resp_fn, void *uc)
+RisuResult recv_and_compare_register_info(read_fn read_fn,
+                                          respond_fn resp_fn, void *uc)
 {
-    int resp = 0;
+    RisuResult resp = RES_OK;
     trace_header_t header;
     RisuOp op;
 
@@ -85,18 +85,18 @@ int recv_and_compare_register_info(read_fn read_fn,
     op = get_risuop(&master_ri);
 
     if (read_fn(&header, sizeof(header)) != 0) {
-        return -1;
+        return RES_BAD_IO;
     }
 
     if (header.risu_op != op) {
         /* We are out of sync */
-        resp = 2;
+        resp = RES_BAD_IO;
         resp_fn(resp);
         return resp;
     }
 
     /* send OK for the header */
-    resp_fn(0);
+    resp_fn(RES_OK);
 
     switch (op) {
     case OP_COMPARE:
@@ -107,12 +107,12 @@ int recv_and_compare_register_info(read_fn read_fn,
          */
         if (read_fn(&apprentice_ri, reginfo_size())) {
             packet_mismatch = 1;
-            resp = 2;
+            resp = RES_BAD_IO;
         } else if (!reginfo_is_eq(&master_ri, &apprentice_ri)) {
             /* register mismatch */
-            resp = 2;
+            resp = RES_MISMATCH;
         } else if (op == OP_TESTEND) {
-            resp = 1;
+            resp = RES_END;
         }
         resp_fn(resp);
         break;
@@ -127,10 +127,10 @@ int recv_and_compare_register_info(read_fn read_fn,
         mem_used = 1;
         if (read_fn(apprentice_memblock, MEMBLOCKLEN)) {
             packet_mismatch = 1;
-            resp = 2;
+            resp = RES_BAD_IO;
         } else if (memcmp(memblock, apprentice_memblock, MEMBLOCKLEN) != 0) {
             /* memory mismatch */
-            resp = 2;
+            resp = RES_MISMATCH;
         }
         resp_fn(resp);
         break;
diff --git a/risu.c b/risu.c
index ab17c71..7b14f72 100644
--- a/risu.c
+++ b/risu.c
@@ -69,7 +69,7 @@ int write_trace(void *ptr, size_t bytes)
     return (res == bytes) ? 0 : 1;
 }
 
-void respond_sock(int r)
+void respond_sock(RisuResult r)
 {
     send_response_byte(comm_fd, r);
 }
@@ -98,11 +98,11 @@ int read_trace(void *ptr, size_t bytes)
     return (res == bytes) ? 0 : 1;
 }
 
-void respond_trace(int r)
+void respond_trace(RisuResult r)
 {
     switch (r) {
-    case 0: /* test ok */
-    case 1: /* end of test */
+    case RES_OK:
+    case RES_END:
         break;
     default:
         /* mismatch - if tracing we need to report, otherwise barf */
@@ -115,7 +115,7 @@ void respond_trace(int r)
 
 static void master_sigill(int sig, siginfo_t *si, void *uc)
 {
-    int r;
+    RisuResult r;
     signal_count++;
 
     if (trace) {
@@ -125,7 +125,7 @@ static void master_sigill(int sig, siginfo_t *si, void *uc)
     }
 
     switch (r) {
-    case 0:
+    case RES_OK:
         /* match OK */
         advance_pc(uc);
         return;
@@ -137,7 +137,7 @@ static void master_sigill(int sig, siginfo_t *si, void *uc)
 
 static void apprentice_sigill(int sig, siginfo_t *si, void *uc)
 {
-    int r;
+    RisuResult r;
     signal_count++;
 
     if (trace) {
@@ -147,11 +147,11 @@ static void apprentice_sigill(int sig, siginfo_t *si, void *uc)
     }
 
     switch (r) {
-    case 0:
+    case RES_OK:
         /* match OK */
         advance_pc(uc);
         return;
-    case 1:
+    case RES_END:
         /* end of test */
         exit(EXIT_SUCCESS);
     default:
-- 
2.34.1
