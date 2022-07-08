Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp349019lft;
        Fri, 8 Jul 2022 08:47:13 -0700 (PDT)
X-Received: by 2002:a62:8641:0:b0:527:f5f7:dee0 with SMTP id x62-20020a628641000000b00527f5f7dee0mr4392762pfd.76.1657295233361;
        Fri, 08 Jul 2022 08:47:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657295233; cv=none;
        d=google.com; s=arc-20160816;
        b=ejwwpwZc0Yv76fCgD3M8Qw3TVvrnmMfqPhGlmsy8uLxgTULRiCdpcvofLez8j89gVG
         incCYIqAS+AKBv8GPfmlCZ2g8o10RyvAfEQsmXE7CvZCtAKM5Y9pdjSXMCCDDDTeuEgB
         UL6fuf9Q2WxWWlAU/jHJG/23cHvJ7D9w8OimhJeozr5R5AtKUJcGLFbKztcPiSWAq3f8
         nZLWWq0H9/wjvzgq16OkqUxIh3lRryTWKIvuOmnh0pUBEn/t2BTDvus+OnrgdFulwPiV
         jawUJ3ET/Yh3EnLfOYH+ILGthXJVuRX/yPjyXMtELI7evT68AnaEprvX2o7iW+PxvnDv
         jZeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Lcnb+cJ/wyqPfEDRcfJ9HbxKsjqemLvSn/xAJtNX7ic=;
        b=rfC2WT0JI0GqNbZ/AW51fTzSuSsXLDZIooH/V4vwmb83wcTeKVxoKk9nCL3dHibVFY
         Yz4b+9ZieuQXuXI9otIuGUuUlh1l6U0NMsqFOrw/T6gkA3MXusoGhBTxRTHh2P1VLeny
         lZgr2C7ri/mVZdV7Ph6545Y+TB5EQEv7v1rMYuMZ1TAxn4jmdPyTqQKxsnF9nGVSN1F1
         aZHjsIF/AOm6ZMls+43HmhHCtIDSs7CGxPOnQ81XXcLyhoTjRkJSSQm58H2+Ehe04MON
         9rkRZEIB4RuGlUOfSbf+FJRXVF9BeT3BAiYpPYf1CtCy36RBDkp8RkBbzKQE5ULcFmaO
         ghkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j99DO5x8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h12-20020a17090a604c00b001effbf912besor265581pjm.1.2022.07.08.08.47.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 08 Jul 2022 08:47:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j99DO5x8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lcnb+cJ/wyqPfEDRcfJ9HbxKsjqemLvSn/xAJtNX7ic=;
        b=j99DO5x8nS4GWZgN7/isM8hAHv2aQ/GA/Ij2mh7eapSfu61OmoN7atzL7BbqmhY00O
         KrhP2DoYzTl3/b5I011Xo/8pNm5bJZAjvbHQxGOEY/ky39O3gBPFsREaavJmssmQCnw2
         9wZYv0apGloRI0uTNcbZVuvGYWocwiuq1UqV/Dx5yJLf30g6vwZeTyl94PfG7ORonzj4
         qL5KQ1Wsn7eTgf5T53NXxzGtJQTn3VXdc9rao4LQTpfmauNq5XWlzRrkxya39qwfZHNE
         mY6YfpZU2+DDhKr3wPHGVkIx7KDXB1U1GwuBeFsYkufJTtJfoW7uOQsk1YbbsoFW/8Uz
         6Apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lcnb+cJ/wyqPfEDRcfJ9HbxKsjqemLvSn/xAJtNX7ic=;
        b=7DXrW8xmBQ+MKQ9jxuwjPtkS0rlSahAEWBRDVewi3+WOv4vkJ8HrC7xAUW4Iec6lOp
         DBlRi2wQ0p2MpwQQHKU+cKN5+octQq+CPb7NxoZv2NHJvrxTh7efm/22XpHeijvawI6e
         TqPAttJCpJBFQUgrUnm1e6hjzdpZOaV0DAGnXKQAKisX8iEeTqacnu211zeU7JN/1dra
         9W83vr9NsPFe+Wow3WQx9eF6lT+beRiBvklMiVmxtoD7VCV2AtrllvKaIuGgSPUL8S2d
         ADQcgg8qe6ndkuvndNzafwytUI3LRkYRNWB+ylCDeBF6g3ATfDnOJKFdKquZtDlkOGqr
         Esgw==
X-Gm-Message-State: AJIora/qNStQjcVKHC2OlWIsNaw5hpxfjbkaXhIxGZFPIZbadE1ZL2WM
	pcfng5//snaDq8QuhoMlTmZvOMog
X-Google-Smtp-Source: AGRyM1uZqnPgYRLyayMezs5hhKx5T4d55w9INXOuLMIQx//bwkLFGtzDjsnZBTPPoi3FjPzVo62jGg==
X-Received: by 2002:a17:90b:1b49:b0:1ec:a756:edc with SMTP id nv9-20020a17090b1b4900b001eca7560edcmr502319pjb.200.1657295232878;
        Fri, 08 Jul 2022 08:47:12 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([122.255.60.245])
        by smtp.gmail.com with ESMTPSA id y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 08:47:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RISU PATCH v4 02/29] Unify master_fd and apprentice_fd to comm_fd
Date: Fri,  8 Jul 2022 21:16:33 +0530
Message-Id: <20220708154700.18682-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: VS0Wg7rhNhIN

Any one invocation cannot be both master and apprentice.
Let's use only one variable for the file descriptor.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/risu.c b/risu.c
index 79b1092..059348f 100644
--- a/risu.c
+++ b/risu.c
@@ -30,7 +30,7 @@
 
 void *memblock;
 
-int apprentice_fd, master_fd;
+static int comm_fd;
 bool trace;
 size_t signal_count;
 
@@ -50,7 +50,7 @@ sigjmp_buf jmpbuf;
 
 int read_sock(void *ptr, size_t bytes)
 {
-    return recv_data_pkt(master_fd, ptr, bytes);
+    return recv_data_pkt(comm_fd, ptr, bytes);
 }
 
 int write_trace(void *ptr, size_t bytes)
@@ -58,9 +58,9 @@ int write_trace(void *ptr, size_t bytes)
     size_t res;
 
 #ifdef HAVE_ZLIB
-    if (master_fd == STDOUT_FILENO) {
+    if (comm_fd == STDOUT_FILENO) {
 #endif
-        res = write(master_fd, ptr, bytes);
+        res = write(comm_fd, ptr, bytes);
 #ifdef HAVE_ZLIB
     } else {
         res = gzwrite(gz_trace_file, ptr, bytes);
@@ -71,14 +71,14 @@ int write_trace(void *ptr, size_t bytes)
 
 void respond_sock(int r)
 {
-    send_response_byte(master_fd, r);
+    send_response_byte(comm_fd, r);
 }
 
 /* Apprentice function */
 
 int write_sock(void *ptr, size_t bytes)
 {
-    return send_data_pkt(apprentice_fd, ptr, bytes);
+    return send_data_pkt(comm_fd, ptr, bytes);
 }
 
 int read_trace(void *ptr, size_t bytes)
@@ -86,9 +86,9 @@ int read_trace(void *ptr, size_t bytes)
     size_t res;
 
 #ifdef HAVE_ZLIB
-    if (apprentice_fd == STDIN_FILENO) {
+    if (comm_fd == STDIN_FILENO) {
 #endif
-        res = read(apprentice_fd, ptr, bytes);
+        res = read(comm_fd, ptr, bytes);
 #ifdef HAVE_ZLIB
     } else {
         res = gzread(gz_trace_file, ptr, bytes);
@@ -218,11 +218,11 @@ int master(void)
 {
     if (sigsetjmp(jmpbuf, 1)) {
 #ifdef HAVE_ZLIB
-        if (trace && master_fd != STDOUT_FILENO) {
+        if (trace && comm_fd != STDOUT_FILENO) {
             gzclose(gz_trace_file);
         }
 #endif
-        close(master_fd);
+        close(comm_fd);
         if (trace) {
             fprintf(stderr, "trace complete after %zd checkpoints\n",
                     signal_count);
@@ -244,11 +244,11 @@ int apprentice(void)
 {
     if (sigsetjmp(jmpbuf, 1)) {
 #ifdef HAVE_ZLIB
-        if (trace && apprentice_fd != STDIN_FILENO) {
+        if (trace && comm_fd != STDIN_FILENO) {
             gzclose(gz_trace_file);
         }
 #endif
-        close(apprentice_fd);
+        close(comm_fd);
         fprintf(stderr, "finished early after %zd checkpoints\n", signal_count);
         return report_match_status(true);
     }
@@ -375,31 +375,31 @@ int main(int argc, char **argv)
     if (ismaster) {
         if (trace) {
             if (strcmp(trace_fn, "-") == 0) {
-                master_fd = STDOUT_FILENO;
+                comm_fd = STDOUT_FILENO;
             } else {
-                master_fd = open(trace_fn, O_WRONLY | O_CREAT, S_IRWXU);
+                comm_fd = open(trace_fn, O_WRONLY | O_CREAT, S_IRWXU);
 #ifdef HAVE_ZLIB
-                gz_trace_file = gzdopen(master_fd, "wb9");
+                gz_trace_file = gzdopen(comm_fd, "wb9");
 #endif
             }
         } else {
             fprintf(stderr, "master port %d\n", port);
-            master_fd = master_connect(port);
+            comm_fd = master_connect(port);
         }
         return master();
     } else {
         if (trace) {
             if (strcmp(trace_fn, "-") == 0) {
-                apprentice_fd = STDIN_FILENO;
+                comm_fd = STDIN_FILENO;
             } else {
-                apprentice_fd = open(trace_fn, O_RDONLY);
+                comm_fd = open(trace_fn, O_RDONLY);
 #ifdef HAVE_ZLIB
-                gz_trace_file = gzdopen(apprentice_fd, "rb");
+                gz_trace_file = gzdopen(comm_fd, "rb");
 #endif
             }
         } else {
             fprintf(stderr, "apprentice host %s port %d\n", hostname, port);
-            apprentice_fd = apprentice_connect(hostname, port);
+            comm_fd = apprentice_connect(hostname, port);
         }
         return apprentice();
     }
-- 
2.34.1
