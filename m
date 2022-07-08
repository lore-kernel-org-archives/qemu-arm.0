Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp349262lft;
        Fri, 8 Jul 2022 08:47:41 -0700 (PDT)
X-Received: by 2002:a17:903:22c1:b0:16c:eb4:83ea with SMTP id y1-20020a17090322c100b0016c0eb483eamr4393580plg.123.1657295260795;
        Fri, 08 Jul 2022 08:47:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657295260; cv=none;
        d=google.com; s=arc-20160816;
        b=vJcGVl6dKXJqeSUsgVl6Q6yRmFiK1GML21qDWoNNgDJ++W4Xyl9tpagbVg24IQPNWV
         mekFRzDu6oSv9xFPXue/kaFi0VVTpTR1syotxXIQwdQ1/LQy+ucAavnEz/Op4iJ8YyV0
         7QdGlKOjfBTwEFavpQOzxNROdn5+nrGyZm4jGoET2R8AQN8f0FN3AvKGdEM+oICggSIk
         +J7lzVFnHKneOtWrxN16Cqa0+At6A4G4S1kEyZ68+I41lBWGpHXsV8pzANJUwfyEm1cR
         UxB69+GXQC8ffDtLq8XsbRY8LwRE6iOdScVbmk0p06lwg/J3/fb8Q0TsMVMcG4aLPWGN
         PtEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZlB23Fd4G5DghSJ6Ko6JaiFeI6h2RDPKt6G6Hp0Fq+M=;
        b=SiDvYjWKfu4uIHAyaVHOFO5GN0q1r1NZH57RlX+T0OvzrTuJj7DG8goGpgpH93eTSd
         /CHThHAVEgvoaOG65snzq/A4LwGKCKhrF8JH4Th+u9JEgBBiHxEsqrb2oS4OM+8tLpRE
         MHoRxmoP98+aAmZuEcl0QQ0nkrIV7R+4/nwVw+Wl2ArIyp5EzsjazXf/Ci5Q1Xyu1FpM
         ElsvOjkmuO9hrFEmzsU+iDPZrtLlI5P/UuUzJZkX3W9srKCEXd8JDqc2v4uH3j4+tDc6
         5PNsoFgHAJkibvNTmFVy3wxF562dDjTXnlY5sgqP21oTB1LJ1rsINp+GOBTxj7jEA5Tf
         I9Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IjxlJlRC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p14-20020a17090a4f0e00b001ef8eb9c089sor921930pjh.23.2022.07.08.08.47.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 08 Jul 2022 08:47:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IjxlJlRC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZlB23Fd4G5DghSJ6Ko6JaiFeI6h2RDPKt6G6Hp0Fq+M=;
        b=IjxlJlRCDRhD8hxXxc8hPtfWuV+wWnz6N8Z/z74To6ZzYZyUhUjhSoi4NP+eSn/m6Q
         egPgXub7dZuVz/t8hQV8ANRwS5rm2/cGZA4QAza4S1owrv87PNtEgcRrI5BI1023Y+DC
         /SRRnHhHW2pBIt+G8DhIJz0xQPxhtAjvfXGo4Cmd4s66aM84R/dZDKqbrskPUOkBEsVe
         +LAiy/Pr2iYRIvyPtqTrtQMYRzADORex23Oe9CNzUN3zLPP7syKCdiZ3HUiL3c8NbOGl
         W8aAJYE78aAT4zBsXRDMZEhM9+zYfLTKuB23tYOMu8HREynGWJNROHo9EX3H5KWEcrhS
         2qPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZlB23Fd4G5DghSJ6Ko6JaiFeI6h2RDPKt6G6Hp0Fq+M=;
        b=FJHvLEbzCRxBHpGcjTWrX8A1pYpPNUAvqxPTWC+FQmUX0tqkgxClR269MYnjqw6x5R
         9NFROR/a2knP5wPztZOZoo5jfngiIErABajX25dtx8a5y6S9fRGb4B76O3azud97NbT8
         2sWHY/1Yq9UG0LL5GGOEp4VQa606z99UCXuCetErdv+cOP5/7LrkaxrfDsJj1sgBYhjx
         Ax2pb0tIrlQ3K8FuscOnoJdPJTAkAY6ox553ZCb8vCMmBqYB9IDHKkZRjJBd03gzlH8n
         r6RasfdA6WQedG/vliQXN5pD3wfopTipE2kN8oa+59TfOgNuzKEalMEdNTi9NFHLxAgC
         G0Vg==
X-Gm-Message-State: AJIora/31j5fBEpl1SbwZA76Mzck3j6Sh3RP9kIVzcj11L/4f884htuk
	IiQBRDu1JwQKO8DgXCrp5wDlb3RgYxroTCsdStU=
X-Google-Smtp-Source: AGRyM1vsCllgMHK6EFpmj1lvJC9YqUZTJowU23N0g6uC4t2EcJIKbrB5p2Q2JHHit/iHXSleVKcuFQ==
X-Received: by 2002:a17:90a:b701:b0:1e8:6d19:bcb with SMTP id l1-20020a17090ab70100b001e86d190bcbmr496093pjr.218.1657295260291;
        Fri, 08 Jul 2022 08:47:40 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([122.255.60.245])
        by smtp.gmail.com with ESMTPSA id y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 08:47:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v4 10/29] Pass non-OK result back through siglongjmp
Date: Fri,  8 Jul 2022 21:16:41 +0530
Message-Id: <20220708154700.18682-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: jAdaEwCG9bOc

Rather than doing some work in the signal handler and
some work outside, move all of the non-resume work outside.
This works because we arranged for RES_OK to be 0, which
is the normal return from sigsetjmp.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu.c | 50 ++++++++++++++++++++++++--------------------------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/risu.c b/risu.c
index 1917311..f238117 100644
--- a/risu.c
+++ b/risu.c
@@ -107,15 +107,10 @@ static void master_sigill(int sig, siginfo_t *si, void *uc)
     } else {
         r = recv_and_compare_register_info(uc);
     }
-
-    switch (r) {
-    case RES_OK:
-        /* match OK */
+    if (r == RES_OK) {
         advance_pc(uc);
-        return;
-    default:
-        /* mismatch, or end of test */
-        siglongjmp(jmpbuf, 1);
+    } else {
+        siglongjmp(jmpbuf, r);
     }
 }
 
@@ -129,21 +124,10 @@ static void apprentice_sigill(int sig, siginfo_t *si, void *uc)
     } else {
         r = send_register_info(uc);
     }
-
-    switch (r) {
-    case RES_OK:
-        /* match OK */
+    if (r == RES_OK) {
         advance_pc(uc);
-        return;
-    case RES_END:
-        /* end of test */
-        exit(EXIT_SUCCESS);
-    default:
-        /* mismatch */
-        if (trace) {
-            siglongjmp(jmpbuf, 1);
-        }
-        exit(EXIT_FAILURE);
+    } else {
+        siglongjmp(jmpbuf, r);
     }
 }
 
@@ -200,7 +184,9 @@ static void load_image(const char *imgfile)
 
 static int master(void)
 {
-    if (sigsetjmp(jmpbuf, 1)) {
+    RisuResult res = sigsetjmp(jmpbuf, 1);
+
+    if (res != RES_OK) {
 #ifdef HAVE_ZLIB
         if (trace && comm_fd != STDOUT_FILENO) {
             gzclose(gz_trace_file);
@@ -226,15 +212,27 @@ static int master(void)
 
 static int apprentice(void)
 {
-    if (sigsetjmp(jmpbuf, 1)) {
+    RisuResult res = sigsetjmp(jmpbuf, 1);
+
+    if (res != RES_OK) {
 #ifdef HAVE_ZLIB
         if (trace && comm_fd != STDIN_FILENO) {
             gzclose(gz_trace_file);
         }
 #endif
         close(comm_fd);
-        fprintf(stderr, "finished early after %zd checkpoints\n", signal_count);
-        return report_match_status(true);
+
+        switch (res) {
+        case RES_END:
+            return EXIT_SUCCESS;
+        default:
+            if (!trace) {
+                return EXIT_FAILURE;
+            }
+            fprintf(stderr, "finished early after %zd checkpoints\n",
+                    signal_count);
+            return report_match_status(true);
+        }
     }
     set_sigill_handler(&apprentice_sigill);
     fprintf(stderr, "starting apprentice image at 0x%"PRIxPTR"\n",
-- 
2.34.1
