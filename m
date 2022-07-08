Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp349112lft;
        Fri, 8 Jul 2022 08:47:23 -0700 (PDT)
X-Received: by 2002:a63:86c7:0:b0:40d:af98:d7e9 with SMTP id x190-20020a6386c7000000b0040daf98d7e9mr3953882pgd.591.1657295243199;
        Fri, 08 Jul 2022 08:47:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657295243; cv=none;
        d=google.com; s=arc-20160816;
        b=U3BhsVrLVVTClQE43eaS3PM5RbMgIa2DliZ/xWF92Oi0EnvGaHyjP1GfvY3bKWfQ2Q
         7knWj+hGxmsxsqD5phnQDVxljfP7qropPcXNNTMpkJ7cQsHVBoR/49yX9LnsJ1a4SbiT
         JWiWT/6oau/P1LJR8Utd/1+xfiS4yqODskwYcpoobEjUTULU6dxMaSR/0Csbt8ZzhlY0
         gc3yiWUFafJ5EEGbqZzhtiQK5cRmaTbDu55OWIb6RXDQduSkn2S8QMp7FbzHAH21kE6j
         BJ5KTGw8m611VBGsvZP9LqDKAQd8SpnHczL4Q8WKFa+V82zzSLJVuhhy78f5C7vPmrj1
         seUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FL72vkFvgwgvsAn8p5rzjDKtjVBK69qL0lGF/pFqJgo=;
        b=rL/74+10dyTuF8eg1tmSnhnBVHKbc3CYgWG0gzKoAxz4vp9JBYkuoERAqzL7Fi12v8
         OJ2Is6rnvGlMLYjaE4rhVJWCcPLaX81qRFXdT+3wtroNKQHB9pFI21sYX/tafvtindGB
         d4oJp/mgwY/6jD85NY18cZK5jo7oKhJTiY6z8qRmo+WB06dGwhgvugYppoNqgJNBuVez
         09OHzbqILSN6S8FIK0UMkFSv8GIzCUVvB0DNa1TEh2nSB8CnZGQ8z8MwOE2XGlQ+4z1t
         +7NEq8tBF8AJF5ezjYz5AZjCQb2oATFg8fWz22bGRW/zi/YIs72BP9EiAJhBwqMIREZm
         jSZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=veVyr+8x;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k13-20020a170902ce0d00b0016b7b1396d7sor15024446plg.125.2022.07.08.08.47.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 08 Jul 2022 08:47:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=veVyr+8x;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FL72vkFvgwgvsAn8p5rzjDKtjVBK69qL0lGF/pFqJgo=;
        b=veVyr+8xjmrlWnpVTUg4LxeNFhQkz8OUr1tIvFsfkMaqoMXCynvRtcMDnEebrSPZrT
         tjyDpOWBUo+XUaOeqKnNAZ+cwn3GUkH0bwKc/ub/LQ0ap744NlvIQpyH5x4uVUoP9V3k
         egT9eNteTrxk9iDoK5rH3egujD+mP9zUtR6bCZNG3E23mh0VEbnKnOJd7B1vwoBDJGEN
         GuU3K0dlOblZRvatfZzrKaxGTGiFJ1iXuSfn5XaH07xAvM7VQNcvSLu7Hrl70RohxppZ
         6NBkANZm4z62+jnV+0+lR/Loz5F0F8Ry0gyREu0L9VbjekCUIfhKKTe6lgZOMylS96YU
         bQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FL72vkFvgwgvsAn8p5rzjDKtjVBK69qL0lGF/pFqJgo=;
        b=PQyC4C/yczYWZfTpyzX+bxKgS31hGPMLDuA/VKlR3PSvYGMi64I8YtCGJ2xFvBW2Cz
         O6jCKU//MZNkKt3Hc+aNndaRKsypgnhSNXm/2nuWY4jyqMchCEII2VtJsI/KseJubHyD
         VM8Q4r95fZ/v78fjmfZ7i0FyeU3CAG3FyRutrU8bttZhMWSZxnxsgZwQtw8gZlzB3MCa
         puHrK1+ckv7MT/sGTs+qZMfuUkoyhgz0k0VlwPN8T4OEq9CZs7BR7Ml+tKaakjiB9vn8
         fHsFDV3+dO7YDN+eKjLvPeZwebQuTg8/kdXZY1n5hHuCKpykvUc7HTmLVYm07zwna+0u
         l/XQ==
X-Gm-Message-State: AJIora+N3i18D0jtDN+UhD8WoMUjT/la/80M+pbpbKT3E5p9Co7RK8OB
	yFjbt0saXT8LCs8DqZUzMlQDUse7
X-Google-Smtp-Source: AGRyM1vTrghCJBms1OFe+AzeQXPeMKRwz2Cpm22VHZ3XRlWpXcCt+CVBjDIc5LyONt1WrPzDvRz52g==
X-Received: by 2002:a17:903:26d3:b0:16b:d80c:c068 with SMTP id jg19-20020a17090326d300b0016bd80cc068mr4311152plb.76.1657295242646;
        Fri, 08 Jul 2022 08:47:22 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([122.255.60.245])
        by smtp.gmail.com with ESMTPSA id y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 08:47:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RISU PATCH v4 05/29] Use EXIT_FAILURE, EXIT_SUCCESS
Date: Fri,  8 Jul 2022 21:16:36 +0530
Message-Id: <20220708154700.18682-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Q4USPhSQwwNZ

Some of the time we exit via the return value from main.
This can make it easier to tell what it is we're returning.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 comms.c                | 26 +++++++++++++-------------
 risu.c                 | 22 +++++++++++-----------
 risu_reginfo_aarch64.c |  4 ++--
 risu_reginfo_i386.c    |  2 +-
 4 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/comms.c b/comms.c
index 6946fd9..861e845 100644
--- a/comms.c
+++ b/comms.c
@@ -31,7 +31,7 @@ int apprentice_connect(const char *hostname, int port)
     sock = socket(PF_INET, SOCK_STREAM, 0);
     if (sock < 0) {
         perror("socket");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     struct hostent *hostinfo;
     sa.sin_family = AF_INET;
@@ -39,12 +39,12 @@ int apprentice_connect(const char *hostname, int port)
     hostinfo = gethostbyname(hostname);
     if (!hostinfo) {
         fprintf(stderr, "Unknown host %s\n", hostname);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     sa.sin_addr = *(struct in_addr *) hostinfo->h_addr;
     if (connect(sock, (struct sockaddr *) &sa, sizeof(sa)) < 0) {
         perror("connect");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     return sock;
 }
@@ -56,13 +56,13 @@ int master_connect(int port)
     sock = socket(PF_INET, SOCK_STREAM, 0);
     if (sock < 0) {
         perror("socket");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     int sora = 1;
     if (setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, &sora, sizeof(sora)) !=
         0) {
         perror("setsockopt(SO_REUSEADDR)");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     sa.sin_family = AF_INET;
@@ -70,11 +70,11 @@ int master_connect(int port)
     sa.sin_addr.s_addr = htonl(INADDR_ANY);
     if (bind(sock, (struct sockaddr *) &sa, sizeof(sa)) < 0) {
         perror("bind");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     if (listen(sock, 1) < 0) {
         perror("listen");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     /* Just block until we get a connection */
     fprintf(stderr, "master: waiting for connection on port %d...\n",
@@ -84,7 +84,7 @@ int master_connect(int port)
     int nsock = accept(sock, (struct sockaddr *) &csa, &csasz);
     if (nsock < 0) {
         perror("accept");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     /* We're done with the server socket now */
     close(sock);
@@ -104,7 +104,7 @@ static void recv_bytes(int sock, void *pkt, int pktlen)
                 continue;
             }
             perror("read failed");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         pktlen -= i;
         p += i;
@@ -127,7 +127,7 @@ static void recv_and_discard_bytes(int sock, int pktlen)
                 continue;
             }
             perror("read failed");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         pktlen -= i;
     }
@@ -186,12 +186,12 @@ int send_data_pkt(int sock, void *pkt, int pktlen)
 
     if (safe_writev(sock, iov, 2) == -1) {
         perror("writev failed");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     if (read(sock, &resp, 1) != 1) {
         perror("read failed");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     return resp;
 }
@@ -217,6 +217,6 @@ void send_response_byte(int sock, int resp)
     unsigned char r = resp;
     if (write(sock, &r, 1) != 1) {
         perror("write failed");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 }
diff --git a/risu.c b/risu.c
index 819b786..26dc116 100644
--- a/risu.c
+++ b/risu.c
@@ -153,13 +153,13 @@ void apprentice_sigill(int sig, siginfo_t *si, void *uc)
         return;
     case 1:
         /* end of test */
-        exit(0);
+        exit(EXIT_SUCCESS);
     default:
         /* mismatch */
         if (trace) {
             siglongjmp(jmpbuf, 1);
         }
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 }
 
@@ -173,7 +173,7 @@ static void set_sigill_handler(void (*fn) (int, siginfo_t *, void *))
     sigemptyset(&sa.sa_mask);
     if (sigaction(SIGILL, &sa, 0) != 0) {
         perror("sigaction");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 }
 
@@ -190,11 +190,11 @@ void load_image(const char *imgfile)
     int fd = open(imgfile, O_RDONLY);
     if (fd < 0) {
         fprintf(stderr, "failed to open image file %s\n", imgfile);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     if (fstat(fd, &st) != 0) {
         perror("fstat");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     size_t len = st.st_size;
     void *addr;
@@ -207,7 +207,7 @@ void load_image(const char *imgfile)
              0);
     if (!addr) {
         perror("mmap");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     close(fd);
     image_start = addr;
@@ -226,7 +226,7 @@ int master(void)
         if (trace) {
             fprintf(stderr, "trace complete after %zd checkpoints\n",
                     signal_count);
-            return 0;
+            return EXIT_SUCCESS;
         } else {
             return report_match_status(false);
         }
@@ -237,7 +237,7 @@ int master(void)
     fprintf(stderr, "starting image\n");
     image_start();
     fprintf(stderr, "image returned unexpectedly\n");
-    exit(1);
+    return EXIT_FAILURE;
 }
 
 int apprentice(void)
@@ -258,7 +258,7 @@ int apprentice(void)
     fprintf(stderr, "starting image\n");
     image_start();
     fprintf(stderr, "image returned unexpectedly\n");
-    exit(1);
+    return EXIT_FAILURE;
 }
 
 int ismaster;
@@ -355,7 +355,7 @@ int main(int argc, char **argv)
             break;
         case '?':
             usage();
-            exit(1);
+            return EXIT_FAILURE;
         default:
             assert(c >= FIRST_ARCH_OPT);
             process_arch_opt(c, optarg);
@@ -390,7 +390,7 @@ int main(int argc, char **argv)
     if (!imgfile) {
         fprintf(stderr, "Error: must specify image file name\n\n");
         usage();
-        exit(1);
+        return EXIT_FAILURE;
     }
 
     load_image(imgfile);
diff --git a/risu_reginfo_aarch64.c b/risu_reginfo_aarch64.c
index 00d1c8b..028c690 100644
--- a/risu_reginfo_aarch64.c
+++ b/risu_reginfo_aarch64.c
@@ -51,7 +51,7 @@ void process_arch_opt(int opt, const char *arg)
 
     if (test_sve <= 0 || test_sve > SVE_VQ_MAX) {
         fprintf(stderr, "Invalid value for VQ (1-%d)\n", SVE_VQ_MAX);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     want = sve_vl_from_vq(test_sve);
     got = prctl(PR_SVE_SET_VL, want);
@@ -62,7 +62,7 @@ void process_arch_opt(int opt, const char *arg)
             fprintf(stderr, "Unsupported value for VQ (%d != %d)\n",
                     test_sve, (int)sve_vq_from_vl(got));
         }
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 #else
     abort();
diff --git a/risu_reginfo_i386.c b/risu_reginfo_i386.c
index 194e0ad..60fc239 100644
--- a/risu_reginfo_i386.c
+++ b/risu_reginfo_i386.c
@@ -69,7 +69,7 @@ void process_arch_opt(int opt, const char *arg)
             fprintf(stderr,
                     "Unable to parse '%s' in '%s' into an xfeatures integer mask\n",
                     endptr, arg);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 }
-- 
2.34.1
