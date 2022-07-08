Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp349139lft;
        Fri, 8 Jul 2022 08:47:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:2449:b0:528:3a29:e79d with SMTP id d9-20020a056a00244900b005283a29e79dmr4392347pfj.39.1657295246049;
        Fri, 08 Jul 2022 08:47:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657295246; cv=none;
        d=google.com; s=arc-20160816;
        b=iD82wGyaaj1XEqWKYGPVzHTTQcssd1tDtb0sudK82S1TmdbIWWhNFfbkfM1SaerT3v
         UdJxjWj2k4eIkbhEmaWk9lWgos2QXms1EMaUo7xVnO4QTLUbZ1N4dEzGOMqpu+ofGgoS
         L6rY6MaF06VLk2WPU79uKyk3z9RjS3i3wptkTnwXSfT3thqwBQy7oD2EZDi3CtvvRDkr
         rik8cEIYQFzieQsxQxi+NJ/PwThQX4DBlqK2xg233PdcNjXT0Z/B8TSt5/qaN0XTJbBt
         Gq4sbcafMzKdN0xeAdVLezLO+PLIqViwxD3AXdeRsxexER+z0Fi+XweSpPUS8M5wx28a
         6zZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=K0p7VBr3aZVoDI9pUwFSD+XBTDwjM0eTDqSKAizakb0=;
        b=IQJUUVCelpDWrEHzsreo2yuY8EpAFJ/VA3PDfkW5j9k1NtTDiEGofuNpVgYXpaAnvi
         efv+3A9UaezS//5hs++gy6UMG5ZHua5ywRUiBbYwEj9KpGtk3y1Fw7pR5XSiPEosc4eB
         DSSxOEWfv6su2usHN3LZEYm7pYeTqJP1J2ZU+U3R/4kk3PipJQJFAKa19P3tzrtTsOuI
         1k8ZylTDnB3JBdmO7T7LGjFr5/eIVHQUH5+J8G9xnf0lA3Vqqq85tYwPI88w0qqeF6F/
         jHNd1NqjmzJt/sf0QSw5vFza5D3WxOxL9b3dxRRFa4GBOq6fjqGRhgjb6Mzf2gG9i8Oq
         sm3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tBZ9gPj0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d1-20020a17090a114100b001ef8b289308sor921673pje.12.2022.07.08.08.47.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 08 Jul 2022 08:47:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tBZ9gPj0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K0p7VBr3aZVoDI9pUwFSD+XBTDwjM0eTDqSKAizakb0=;
        b=tBZ9gPj0DZBefJt/34Pl0I6eyKEqPtgKbpHB8j1hu/pI/eH8IeNpmxNIve/MA/i0v0
         bZ6W36dIcwyZMj6iJb4Hss65t7DF9E8kPim71tWkEtBQdEkHkS/ZyTMHxXpuiofYGmRx
         GHyBTB4a1JSDNNUwJQYDVIunNQcPJxE1RrFWhNEXKYpJH2uh4CbLf9uYBfhXIu2EuDRo
         B/kZGFyv4gVxq318jo5jN9NKAL4WDYFMo6G6vjKc0B7K4TTMuNoGlBq8L0a5zeK6bxKw
         m0aOVb8TEq1ixaNeKhzgy3QfVenNYYyENp7AJMbhRQq9XxoOFv0a+2dUWIcnJxAZl5si
         xdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K0p7VBr3aZVoDI9pUwFSD+XBTDwjM0eTDqSKAizakb0=;
        b=eScZdhgXqTH/CuA1F/OKtf4vgs8i09QZf5bNTg95PpBcuRZqIoCI895RHqqDvaZxy5
         tTrWN107PCoifKRLD7zAIliSTqeNrK6vH71BbZ6l/7eCfXhIBgRsXtvnknEke5Vq6aa8
         pItO2/gLrcxx+P1Pm8+XHgPxr46KZz1UBwaT8tFgnY/DWndDhRRr2X5TFyPtxsykefGd
         jajXypm4cxaBp0qcwpmV2DNhN0QlO8fH+GLKMh7nQlMGvXuv7fd0qDb0u7IXz6G3aYvZ
         DyLlUkjuGaH0cPn42uPJqCN41R2lsHmlbt0COf1jCbhyA1wacwF2wBNgURmHPh473ISf
         NWmw==
X-Gm-Message-State: AJIora8a+NERWDTgTnTBDyCXQhRH/o8yQ0Q3jeXUY6IgUZXkIl9XZtiS
	mhM1vwgwqM5kMxiMrbZ+HkxnEhRh
X-Google-Smtp-Source: AGRyM1t5+nAuB4iZtxFm/R2ZRCLB2DfCr4ZUkG/ZVJsO0YGDC0CZmHkfygmqaggK3A4SxHPI3G1FKQ==
X-Received: by 2002:a17:90b:4b49:b0:1ef:a03e:b671 with SMTP id mi9-20020a17090b4b4900b001efa03eb671mr525032pjb.108.1657295245521;
        Fri, 08 Jul 2022 08:47:25 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([122.255.60.245])
        by smtp.gmail.com with ESMTPSA id y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 08:47:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v4 06/29] Make some risu.c symbols static
Date: Fri,  8 Jul 2022 21:16:37 +0530
Message-Id: <20220708154700.18682-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: f3lSQfXGBCj/

These are unused in other translation units.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 risu.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/risu.c b/risu.c
index 26dc116..ab17c71 100644
--- a/risu.c
+++ b/risu.c
@@ -31,18 +31,18 @@
 void *memblock;
 
 static int comm_fd;
-bool trace;
-size_t signal_count;
+static bool trace;
+static size_t signal_count;
 
 #ifdef HAVE_ZLIB
 #include <zlib.h>
-gzFile gz_trace_file;
+static gzFile gz_trace_file;
 #define TRACE_TYPE "compressed"
 #else
 #define TRACE_TYPE "uncompressed"
 #endif
 
-sigjmp_buf jmpbuf;
+static sigjmp_buf jmpbuf;
 
 #define ARRAY_SIZE(x)	(sizeof(x) / sizeof((x)[0]))
 
@@ -113,7 +113,7 @@ void respond_trace(int r)
     }
 }
 
-void master_sigill(int sig, siginfo_t *si, void *uc)
+static void master_sigill(int sig, siginfo_t *si, void *uc)
 {
     int r;
     signal_count++;
@@ -135,7 +135,7 @@ void master_sigill(int sig, siginfo_t *si, void *uc)
     }
 }
 
-void apprentice_sigill(int sig, siginfo_t *si, void *uc)
+static void apprentice_sigill(int sig, siginfo_t *si, void *uc)
 {
     int r;
     signal_count++;
@@ -180,9 +180,9 @@ static void set_sigill_handler(void (*fn) (int, siginfo_t *, void *))
 typedef void entrypoint_fn(void);
 
 uintptr_t image_start_address;
-entrypoint_fn *image_start;
+static entrypoint_fn *image_start;
 
-void load_image(const char *imgfile)
+static void load_image(const char *imgfile)
 {
     /* Load image file into memory as executable */
     struct stat st;
@@ -214,7 +214,7 @@ void load_image(const char *imgfile)
     image_start_address = (uintptr_t) addr;
 }
 
-int master(void)
+static int master(void)
 {
     if (sigsetjmp(jmpbuf, 1)) {
 #ifdef HAVE_ZLIB
@@ -240,7 +240,7 @@ int master(void)
     return EXIT_FAILURE;
 }
 
-int apprentice(void)
+static int apprentice(void)
 {
     if (sigsetjmp(jmpbuf, 1)) {
 #ifdef HAVE_ZLIB
@@ -261,9 +261,9 @@ int apprentice(void)
     return EXIT_FAILURE;
 }
 
-int ismaster;
+static int ismaster;
 
-void usage(void)
+static void usage(void)
 {
     fprintf(stderr,
             "Usage: risu [--master] [--host <ip>] [--port <port>] <image file>"
-- 
2.34.1
