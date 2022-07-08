Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp360607lft;
        Fri, 8 Jul 2022 09:05:38 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vWScH9MmL5y//im0HjLl0x5jEG+PWkEYjqF0vIwiuldLDxQNnVWk+fW8UuM+vOgx3/stx0
X-Received: by 2002:a05:6214:21a4:b0:472:f826:a54c with SMTP id t4-20020a05621421a400b00472f826a54cmr3384949qvc.86.1657296338266;
        Fri, 08 Jul 2022 09:05:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657296338; cv=none;
        d=google.com; s=arc-20160816;
        b=gSHVk1+FBLiLP87Zfl3h7F99CjHzjU/1jDM2C6MRSU+fWnWIsbOoaeplsJlsCVRcol
         iQcnrwEYBgZcK/cp35hPv7a+v1tamcz3ezD3jwXcL7jOkS+4gd/e/rUUYTdAvLeJCQBw
         Hd4VnUN1RqnbBOtaYI2vRV7oVjiFxSfd4ca/fdaS2XckbRf1fX7QG3TntH7rUhNaRK8f
         IkOJKUIxIDprb6sR4pQA1WUY6T0cUjqUhk3FwkDm461rA+kh6ra7agpPIFB/ay9s3YEu
         klJEsHR7a7BPrgOcbhTi/ax68wPrG4ermd8A6ArqKmI0hb9dLAXH0YDQzTIolDklYxrM
         8jhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=C50plgqGSIgO0dFS/L15QZFrfiVcGLB4PZLBa9Ht7hU=;
        b=m6+uYsnS7Iprn2EL4b3tskWozZq0XbB8V+lQ2iWxo0IsW2HU7NuhpJzWmXjot3Bqvg
         ShMx9ndbHr8oqrScF+/36fJKmDCoLtXRXWPV+cvYBZ5uJMRV9uqZ2GfJ5BN1HgTklV4y
         vt4JH+2vflacrDKl/P/lAGY9eE8iOwc4vKSvYg7J/8uhjfTR1T5ccAgAR8bzGPREWS0+
         qUACQtCZ/xT6PsOZWfVI3L7yLhmNnt/pBl24wwoXhhr7Plbxox/WaE3d6+BzTSiFG8hx
         Lc2CXmLtelR2m9CEd8jtXZ/xODOx+Ih1UwaoR9fRtaqHJbbfH88DbLe1tXGiy91pWWLZ
         tSpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DuagrhYq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jq11-20020ad45fcb000000b0046e7efcb13dsi4383742qvb.65.2022.07.08.09.05.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 09:05:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DuagrhYq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9qU5-0001Np-Oq
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 12:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qD0-0005lf-1j
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:58 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:45670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qCx-0002VZ-PX
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:47:57 -0400
Received: by mail-pg1-x534.google.com with SMTP id 145so22655318pga.12
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C50plgqGSIgO0dFS/L15QZFrfiVcGLB4PZLBa9Ht7hU=;
 b=DuagrhYqV+ZRFMS7oGkdtwG2d+FTcHaYcxd38DHWg8s9b+f4kXIuZMHpoNhHQmntWY
 Z9l6I0THVH8+tfVSDX4QFZrLX4VD/DFnjIaj3/pwv8KlSO3gBISaXliUFm6B85hZ/cTc
 SpFbmwKU84mUDCeftWbADk8xhM7Sm1w59gpv5+pf+X3+sbDQaxGVXcQ2iijv2hxqM5FU
 JCTTjPMElmgc9A3xq8UiQANfcvfQUhUSZsUhUT8BTiInzDahu9UmImTH8K747X6AYyiY
 XLPPvoJrreIfZuTrm8X1R4Ugo4DSfkyQhoA21kxsqGqIbQxnGKXpAGrbyT1KcSEWnlJx
 xzjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C50plgqGSIgO0dFS/L15QZFrfiVcGLB4PZLBa9Ht7hU=;
 b=s/MhwsYjzv3Ek9ADy1BXmOd9cdT1QhiroofU5WmoJdZAPgSL9YkB9aYUkEpZsoIg7+
 R/HKlMjq5pUC7r9bMXfgiIWjXDRwK+1YOobX8ezLhFkFUHu7SDEoWIjTHeAmMEsXm6qp
 CefGDp2IsghrW0T4NU5JrsmH5V3m32H3+zUJg27WBeIKqzhUzBA57lEJXaZHnzRzY7d+
 goPgQrXVr0DYVTVIIzWAipA1qGo138FwNZMGHIlFdHk1nDryb/erXtr9ykchVynof21r
 wssX9RlhuVel0z5rWyLuf2sAzCgj5ztL+6W0CYvaVqVD6KRLp3jIYez/4qQuRSSMbW8x
 zJgg==
X-Gm-Message-State: AJIora+e5J74WCQAwC4o6f3Y84eN6oLc/9EkRJ0Mg+kkKBHn+QQvXpS6
 S6Tqpmhu+tCBPO0+8n+n7z+cuDduhXSkrsNp
X-Received: by 2002:a65:694a:0:b0:412:b98:4604 with SMTP id
 w10-20020a65694a000000b004120b984604mr4026000pgq.50.1657295274570; 
 Fri, 08 Jul 2022 08:47:54 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:47:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [RISU PATCH v4 15/29] Rearrange reginfo and memblock buffers
Date: Fri,  8 Jul 2022 21:16:46 +0530
Message-Id: <20220708154700.18682-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lPXFUeeDgoL4

For send_register_info from master_sigill, do not keep a
reginfo buffer on the stack.  At the moment, this struct
is quite large for aarch64.

Put the two reginfo buffers into an array, for the benefit
of future dumping.  For recv_and_compare_register_info,
index this array with constants, so it's a simple rename.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu.c | 58 ++++++++++++++++++++++++++++++++--------------------------
 1 file changed, 32 insertions(+), 26 deletions(-)

diff --git a/risu.c b/risu.c
index a0e20d5..b91ad38 100644
--- a/risu.c
+++ b/risu.c
@@ -28,10 +28,16 @@
 #include "config.h"
 #include "risu.h"
 
-static void *memblock;
-static struct reginfo master_ri, apprentice_ri;
-static uint8_t master_memblock[MEMBLOCKLEN];
+enum {
+    MASTER = 0, APPRENTICE = 1
+};
 
+static struct reginfo ri[2];
+static uint8_t other_memblock[MEMBLOCKLEN];
+static trace_header_t header;
+
+/* Memblock pointer into the execution image. */
+static void *memblock;
 
 static int comm_fd;
 static bool trace;
@@ -102,16 +108,15 @@ static void respond(RisuResult r)
 
 static RisuResult send_register_info(void *uc)
 {
-    struct reginfo ri;
-    trace_header_t header;
+    uint64_t paramreg;
     RisuResult res;
     RisuOp op;
 
-    reginfo_init(&ri, uc);
-    op = get_risuop(&ri);
+    reginfo_init(&ri[MASTER], uc);
+    op = get_risuop(&ri[MASTER]);
 
     /* Write a header with PC/op to keep in sync */
-    header.pc = get_pc(&ri);
+    header.pc = get_pc(&ri[MASTER]);
     header.risu_op = op;
     res = write_buffer(&header, sizeof(header));
     if (res != RES_OK) {
@@ -126,18 +131,19 @@ static RisuResult send_register_info(void *uc)
          * Do a simple register compare on (a) explicit request
          * (b) end of test (c) a non-risuop UNDEF
          */
-        res = write_buffer(&ri, reginfo_size());
+        res = write_buffer(&ri[MASTER], reginfo_size());
         /* For OP_TEST_END, force exit. */
         if (res == RES_OK && op == OP_TESTEND) {
             res = RES_END;
         }
         break;
     case OP_SETMEMBLOCK:
-        memblock = (void *)(uintptr_t)get_reginfo_paramreg(&ri);
+        paramreg = get_reginfo_paramreg(&ri[MASTER]);
+        memblock = (void *)(uintptr_t)paramreg;
         break;
     case OP_GETMEMBLOCK:
-        set_ucontext_paramreg(uc,
-                              get_reginfo_paramreg(&ri) + (uintptr_t)memblock);
+        paramreg = get_reginfo_paramreg(&ri[MASTER]);
+        set_ucontext_paramreg(uc, paramreg + (uintptr_t)memblock);
         break;
     case OP_COMPAREMEM:
         return write_buffer(memblock, MEMBLOCKLEN);
@@ -162,12 +168,12 @@ static void master_sigill(int sig, siginfo_t *si, void *uc)
 
 static RisuResult recv_and_compare_register_info(void *uc)
 {
+    uint64_t paramreg;
     RisuResult res;
-    trace_header_t header;
     RisuOp op;
 
-    reginfo_init(&apprentice_ri, uc);
-    op = get_risuop(&apprentice_ri);
+    reginfo_init(&ri[APPRENTICE], uc);
+    op = get_risuop(&ri[APPRENTICE]);
 
     res = read_buffer(&header, sizeof(header));
     if (res != RES_OK) {
@@ -190,10 +196,10 @@ static RisuResult recv_and_compare_register_info(void *uc)
         /* Do a simple register compare on (a) explicit request
          * (b) end of test (c) a non-risuop UNDEF
          */
-        res = read_buffer(&master_ri, reginfo_size());
+        res = read_buffer(&ri[MASTER], reginfo_size());
         if (res != RES_OK) {
             /* fail */
-        } else if (!reginfo_is_eq(&master_ri, &apprentice_ri)) {
+        } else if (!reginfo_is_eq(&ri[MASTER], &ri[APPRENTICE])) {
             /* register mismatch */
             res = RES_MISMATCH_REG;
         } else if (op == OP_TESTEND) {
@@ -202,17 +208,18 @@ static RisuResult recv_and_compare_register_info(void *uc)
         respond(res == RES_OK ? RES_OK : RES_END);
         break;
     case OP_SETMEMBLOCK:
-        memblock = (void *)(uintptr_t)get_reginfo_paramreg(&apprentice_ri);
+        paramreg = get_reginfo_paramreg(&ri[APPRENTICE]);
+        memblock = (void *)(uintptr_t)paramreg;
         break;
     case OP_GETMEMBLOCK:
-        set_ucontext_paramreg(uc, get_reginfo_paramreg(&apprentice_ri) +
-                              (uintptr_t)memblock);
+        paramreg = get_reginfo_paramreg(&ri[APPRENTICE]);
+        set_ucontext_paramreg(uc, paramreg + (uintptr_t)memblock);
         break;
     case OP_COMPAREMEM:
-        res = read_buffer(master_memblock, MEMBLOCKLEN);
+        res = read_buffer(other_memblock, MEMBLOCKLEN);
         if (res != RES_OK) {
             /* fail */
-        } else if (memcmp(memblock, master_memblock, MEMBLOCKLEN) != 0) {
+        } else if (memcmp(memblock, other_memblock, MEMBLOCKLEN) != 0) {
             /* memory mismatch */
             res = RES_MISMATCH_MEM;
         }
@@ -221,7 +228,6 @@ static RisuResult recv_and_compare_register_info(void *uc)
     default:
         abort();
     }
-
     return res;
 }
 
@@ -342,10 +348,10 @@ static int apprentice(void)
     case RES_MISMATCH_REG:
         fprintf(stderr, "mismatch reg after %zd checkpoints\n", signal_count);
         fprintf(stderr, "master reginfo:\n");
-        reginfo_dump(&master_ri, stderr);
+        reginfo_dump(&ri[MASTER], stderr);
         fprintf(stderr, "apprentice reginfo:\n");
-        reginfo_dump(&apprentice_ri, stderr);
-        reginfo_dump_mismatch(&master_ri, &apprentice_ri, stderr);
+        reginfo_dump(&ri[APPRENTICE], stderr);
+        reginfo_dump_mismatch(&ri[MASTER], &ri[APPRENTICE], stderr);
         return EXIT_FAILURE;
 
     case RES_MISMATCH_MEM:
-- 
2.34.1

