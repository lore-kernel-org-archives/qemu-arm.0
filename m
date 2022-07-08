Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp349297lft;
        Fri, 8 Jul 2022 08:47:44 -0700 (PDT)
X-Received: by 2002:a17:902:f691:b0:16c:d53:21b2 with SMTP id l17-20020a170902f69100b0016c0d5321b2mr4543725plg.18.1657295264080;
        Fri, 08 Jul 2022 08:47:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657295264; cv=none;
        d=google.com; s=arc-20160816;
        b=puPlTnSJ/6s2MUSvxHANOJjTyu0fWH+XKUIgcrm8vlK79Oo7mbTBW3/3K3sbSetBb5
         49lKcwyRWi6Vn6FvJf7TzskCopwnqgoCors5tMp46fFRAH9RGmW9aZAtAWqR36ql3DQT
         RFYSsxLiP9U32qu5zv4ARBru5SpAZYBgVMyKYOK1e7/2ibmT69ql8ij3AyQzqXXGnRmh
         feJSpXH8s0xvR09ptDXClE1SpnnHbSv0u130+BbPpXxki2FCxDdDR3GRLs7Ga3PzYmh8
         xxML4qox5lPav/fAFXVB7Q7bdeUYrsdN02bLhDbfN373JbxW8BdbD3vEbLXjX7oZtZEH
         v8vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JF+lOPliqQPvdxG0ISzOEougk8wObZ8ufYNLrAEw48c=;
        b=THgLmmhIv3oc+wEbsXlQMXsoF09EXKU9E9FO85H22qqIe1wFPELTHUGUho1FTbjCKe
         cqvEXVBZ6oFHjMrasRyaL7pDsALIBGLMRFeGPAMEK05ESBHX7aENjC5324DKvT0qCWSA
         vjazR8lgzbVBSu6fjsE4hEsiWt2sKquHkbuvt2FGn7sWD0ePy7zK5mxEft2/xJDS75aQ
         EzXd93K7LXp1qoQT+fbRlZP1nf2NBPudKOPZW7pXQ14/TTBBgwYbN9oa+vy60qech896
         hjrHUtoLH40Qlu9ZwdG7+eh8mvrG8Kyu+GsltY6Ug0FLGX2G/60JXmb871Vvk31qZSMc
         NNCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J1T1cDM1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v10-20020a1709029a0a00b0016a33d12360sor10690751plp.104.2022.07.08.08.47.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 08 Jul 2022 08:47:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J1T1cDM1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JF+lOPliqQPvdxG0ISzOEougk8wObZ8ufYNLrAEw48c=;
        b=J1T1cDM1E86OfZ4vUIrR0CWJwSqtz1cezRr9rDc+GpVcAwjuKqQdTxZPk16tn8HIfH
         y+/5IW2TJXMUdn2eDTraPAhy1Se1iW23x9VdAdlO7t/VfVZ3IDGpyzAs/HZkY68ldMzb
         9Vvn69gi3O04jjL+PpRf7EzYbRBxyRf99DuG8DwnUBKiHMpCGCcYLQD8xldCUeGkhlUo
         r6amPaS1TeFb8NmBfVnLn3yGfSATLMBYp5NzDwc/q6eslel6u2VnDAABu16KVmBIboS1
         NZ9PV1Ai427DfeSIrajBLH8p4aWaX+6L2Zpv1m1D/gzKst6Xf8jNvElZ3f/6XptnUheX
         odEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JF+lOPliqQPvdxG0ISzOEougk8wObZ8ufYNLrAEw48c=;
        b=ZvgkOofg6GvGfp3eAMO6zcbJubv9eXMC4W7Ul9QXoq56GYgP/siuBNELsv69g4L7Z0
         Te2CvgUQlCK3fkbv/bfy3qZobQJUmW7o7a437IldpdsST92CGk6wUE1C3hsKZOgUTHnu
         6E2E3ALpqUaPWHm4nHN5x7EeeW7vYbsWjpaUB2hS5pRCa+hJ2Kfa3MBfXnoRzK2b5hib
         zuWlBaIbCwoxiueQOhsgmvKU5GSNyP/RjbXR7IRn6/VgLsRpELFiAERiO0pVL0QYXe6u
         SSl7GJFCaQK1u8077IWSunHOZibHnLFGi+BlPbK74K5x623eCbHn1dEpgh0XTQnzmQxM
         if5A==
X-Gm-Message-State: AJIora+PqxCApbjjcYHR7TxmET5zJRy/18txt1E3w5CBzX5RLYO9fVZr
	HdbK/cN8Uv9Ol1nglepma3h+4v4/
X-Google-Smtp-Source: AGRyM1tirCEK1kpxUhzi3RrJTBucLE8IApvxB1yUittas9VgbKipajqkhufALzJJmgcb9ongpHWULg==
X-Received: by 2002:a17:902:e751:b0:16c:19fd:5428 with SMTP id p17-20020a170902e75100b0016c19fd5428mr4388026plf.48.1657295263520;
        Fri, 08 Jul 2022 08:47:43 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([122.255.60.245])
        by smtp.gmail.com with ESMTPSA id y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 08:47:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v4 11/29] Always write for --master
Date: Fri,  8 Jul 2022 21:16:42 +0530
Message-Id: <20220708154700.18682-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qpgrzFGAS+YV

For trace, master of course must write to the file we create.

For sockets, we can report mismatches from either end.  At present,
we are reporting mismatches from master.  Reverse that so that we
report mismatches from the apprentice, just as we do for trace.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu.h    |  2 +-
 reginfo.c | 38 ++++++++--------------
 risu.c    | 96 ++++++++++++++++++++++++++-----------------------------
 3 files changed, 61 insertions(+), 75 deletions(-)

diff --git a/risu.h b/risu.h
index c83b803..f383b64 100644
--- a/risu.h
+++ b/risu.h
@@ -106,7 +106,7 @@ RisuResult recv_and_compare_register_info(void *uc);
  * Should return 0 if it was a good match (ie end of test)
  * and 1 for a mismatch.
  */
-int report_match_status(bool trace);
+int report_match_status(void);
 
 /* Interface provided by CPU-specific code: */
 
diff --git a/reginfo.c b/reginfo.c
index fee025e..c37c5df 100644
--- a/reginfo.c
+++ b/reginfo.c
@@ -14,9 +14,8 @@
 #include <stdlib.h>
 #include "risu.h"
 
-struct reginfo master_ri, apprentice_ri;
-
-uint8_t apprentice_memblock[MEMBLOCKLEN];
+static struct reginfo master_ri, apprentice_ri;
+static uint8_t master_memblock[MEMBLOCKLEN];
 
 static int mem_used;
 static int packet_mismatch;
@@ -82,8 +81,8 @@ RisuResult recv_and_compare_register_info(void *uc)
     trace_header_t header;
     RisuOp op;
 
-    reginfo_init(&master_ri, uc);
-    op = get_risuop(&master_ri);
+    reginfo_init(&apprentice_ri, uc);
+    op = get_risuop(&apprentice_ri);
 
     res = read_buffer(&header, sizeof(header));
     if (res != RES_OK) {
@@ -107,7 +106,7 @@ RisuResult recv_and_compare_register_info(void *uc)
         /* Do a simple register compare on (a) explicit request
          * (b) end of test (c) a non-risuop UNDEF
          */
-        res = read_buffer(&apprentice_ri, reginfo_size());
+        res = read_buffer(&master_ri, reginfo_size());
         if (res != RES_OK) {
             packet_mismatch = 1;
         } else if (!reginfo_is_eq(&master_ri, &apprentice_ri)) {
@@ -119,18 +118,18 @@ RisuResult recv_and_compare_register_info(void *uc)
         respond(res);
         break;
     case OP_SETMEMBLOCK:
-        memblock = (void *)(uintptr_t)get_reginfo_paramreg(&master_ri);
+        memblock = (void *)(uintptr_t)get_reginfo_paramreg(&apprentice_ri);
         break;
     case OP_GETMEMBLOCK:
-        set_ucontext_paramreg(uc, get_reginfo_paramreg(&master_ri) +
+        set_ucontext_paramreg(uc, get_reginfo_paramreg(&apprentice_ri) +
                               (uintptr_t)memblock);
         break;
     case OP_COMPAREMEM:
         mem_used = 1;
-        res = read_buffer(apprentice_memblock, MEMBLOCKLEN);
+        res = read_buffer(master_memblock, MEMBLOCKLEN);
         if (res != RES_OK) {
             packet_mismatch = 1;
-        } else if (memcmp(memblock, apprentice_memblock, MEMBLOCKLEN) != 0) {
+        } else if (memcmp(memblock, master_memblock, MEMBLOCKLEN) != 0) {
             /* memory mismatch */
             res = RES_MISMATCH;
         }
@@ -149,18 +148,13 @@ RisuResult recv_and_compare_register_info(void *uc)
  * Should return 0 if it was a good match (ie end of test)
  * and 1 for a mismatch.
  */
-int report_match_status(bool trace)
+int report_match_status(void)
 {
     int resp = 0;
     fprintf(stderr, "match status...\n");
     if (packet_mismatch) {
         fprintf(stderr, "packet mismatch (probably disagreement "
                 "about UNDEF on load/store)\n");
-        /* We don't have valid reginfo from the apprentice side
-         * so stop now rather than printing anything about it.
-         */
-        fprintf(stderr, "%s reginfo:\n", trace ? "this" : "master");
-        reginfo_dump(&master_ri, stderr);
         return 1;
     }
     if (!reginfo_is_eq(&master_ri, &apprentice_ri)) {
@@ -168,7 +162,7 @@ int report_match_status(bool trace)
         resp = 1;
     }
     if (mem_used
-        && memcmp(memblock, &apprentice_memblock, MEMBLOCKLEN) != 0) {
+        && memcmp(memblock, &master_memblock, MEMBLOCKLEN) != 0) {
         fprintf(stderr, "mismatch on memory!\n");
         resp = 1;
     }
@@ -177,15 +171,11 @@ int report_match_status(bool trace)
         return 0;
     }
 
-    fprintf(stderr, "%s reginfo:\n", trace ? "this" : "master");
+    fprintf(stderr, "master reginfo:\n");
     reginfo_dump(&master_ri, stderr);
-    fprintf(stderr, "%s reginfo:\n", trace ? "trace" : "apprentice");
+    fprintf(stderr, "apprentice reginfo:\n");
     reginfo_dump(&apprentice_ri, stderr);
 
-    if (trace) {
-        reginfo_dump_mismatch(&apprentice_ri, &master_ri, stderr);
-    } else {
-        reginfo_dump_mismatch(&master_ri, &apprentice_ri, stderr);
-    }
+    reginfo_dump_mismatch(&master_ri, &apprentice_ri, stderr);
     return resp;
 }
diff --git a/risu.c b/risu.c
index f238117..199f697 100644
--- a/risu.c
+++ b/risu.c
@@ -102,11 +102,7 @@ static void master_sigill(int sig, siginfo_t *si, void *uc)
     RisuResult r;
     signal_count++;
 
-    if (trace) {
-        r = send_register_info(uc);
-    } else {
-        r = recv_and_compare_register_info(uc);
-    }
+    r = send_register_info(uc);
     if (r == RES_OK) {
         advance_pc(uc);
     } else {
@@ -119,11 +115,7 @@ static void apprentice_sigill(int sig, siginfo_t *si, void *uc)
     RisuResult r;
     signal_count++;
 
-    if (trace) {
-        r = recv_and_compare_register_info(uc);
-    } else {
-        r = send_register_info(uc);
-    }
+    r = recv_and_compare_register_info(uc);
     if (r == RES_OK) {
         advance_pc(uc);
     } else {
@@ -186,61 +178,65 @@ static int master(void)
 {
     RisuResult res = sigsetjmp(jmpbuf, 1);
 
-    if (res != RES_OK) {
+    switch (res) {
+    case RES_OK:
+        set_sigill_handler(&master_sigill);
+        fprintf(stderr, "starting master image at 0x%"PRIxPTR"\n",
+                image_start_address);
+        fprintf(stderr, "starting image\n");
+        image_start();
+        fprintf(stderr, "image returned unexpectedly\n");
+        return EXIT_FAILURE;
+
+    case RES_END:
 #ifdef HAVE_ZLIB
         if (trace && comm_fd != STDOUT_FILENO) {
             gzclose(gz_trace_file);
         }
 #endif
         close(comm_fd);
-        if (trace) {
-            fprintf(stderr, "trace complete after %zd checkpoints\n",
-                    signal_count);
-            return EXIT_SUCCESS;
-        } else {
-            return report_match_status(false);
-        }
+        return EXIT_SUCCESS;
+
+    case RES_BAD_IO:
+        fprintf(stderr, "i/o error after %zd checkpoints\n", signal_count);
+        return EXIT_FAILURE;
+
+    default:
+        fprintf(stderr, "unexpected result %d\n", res);
+        return EXIT_FAILURE;
     }
-    set_sigill_handler(&master_sigill);
-    fprintf(stderr, "starting master image at 0x%"PRIxPTR"\n",
-            image_start_address);
-    fprintf(stderr, "starting image\n");
-    image_start();
-    fprintf(stderr, "image returned unexpectedly\n");
-    return EXIT_FAILURE;
 }
 
 static int apprentice(void)
 {
     RisuResult res = sigsetjmp(jmpbuf, 1);
 
-    if (res != RES_OK) {
-#ifdef HAVE_ZLIB
-        if (trace && comm_fd != STDIN_FILENO) {
-            gzclose(gz_trace_file);
-        }
-#endif
-        close(comm_fd);
+    switch (res) {
+    case RES_OK:
+        set_sigill_handler(&apprentice_sigill);
+        fprintf(stderr, "starting apprentice image at 0x%"PRIxPTR"\n",
+                image_start_address);
+        fprintf(stderr, "starting image\n");
+        image_start();
+        fprintf(stderr, "image returned unexpectedly\n");
+        return EXIT_FAILURE;
 
-        switch (res) {
-        case RES_END:
-            return EXIT_SUCCESS;
-        default:
-            if (!trace) {
-                return EXIT_FAILURE;
-            }
-            fprintf(stderr, "finished early after %zd checkpoints\n",
-                    signal_count);
-            return report_match_status(true);
-        }
+    case RES_END:
+        return EXIT_SUCCESS;
+
+    case RES_MISMATCH:
+        fprintf(stderr, "mismatch after %zd checkpoints\n", signal_count);
+        report_match_status();
+        return EXIT_FAILURE;
+
+    case RES_BAD_IO:
+        fprintf(stderr, "i/o error after %zd checkpoints\n", signal_count);
+        return EXIT_FAILURE;
+
+    default:
+        fprintf(stderr, "unexpected result %d\n", res);
+        return EXIT_FAILURE;
     }
-    set_sigill_handler(&apprentice_sigill);
-    fprintf(stderr, "starting apprentice image at 0x%"PRIxPTR"\n",
-            image_start_address);
-    fprintf(stderr, "starting image\n");
-    image_start();
-    fprintf(stderr, "image returned unexpectedly\n");
-    return EXIT_FAILURE;
 }
 
 static int ismaster;
-- 
2.34.1
