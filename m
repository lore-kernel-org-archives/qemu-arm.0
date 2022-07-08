Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp349058lft;
        Fri, 8 Jul 2022 08:47:16 -0700 (PDT)
X-Received: by 2002:a17:90b:1c06:b0:1ef:941a:860 with SMTP id oc6-20020a17090b1c0600b001ef941a0860mr484727pjb.17.1657295236748;
        Fri, 08 Jul 2022 08:47:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657295236; cv=none;
        d=google.com; s=arc-20160816;
        b=WuFxVMiBxK2pCJ7P0BWYn1TX/UahEOcxK8elnmFPkwYwT5UY/5IkrHtbZFMsGdIJCt
         5b/e52Z6OFFQOoadFOSMEYr7esNrszlKu2yE5JrjUJo8lS0hPNty0RreZw1MRZnIE21c
         9ZWl7rsvZ7uidRPUYQcx2FcbmwYTe1hNA2nCuzCDbr08f7fPGpq/H5ZLzrh+Ytrn5cm+
         AKdEhh7jrrN0EMljrb1HodGO6FUSo5qjKIDGh721b4Is7sP9llGQoy2WMBC6xo/ySsVB
         qdyB08EtnWSEFZKgQ4gSO4qOPKlTrK0PadlBRnVZwE/tCEEuUDTSIcF6UF2xPY5SmVkI
         BG+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=X3HkBOy76gPUx/AerMnT/Pi7Lr8ImXW6FCDVZLVLx8A=;
        b=H8nXxEQJ1ynPCJa62YKKoenWN7Byj6Svh2bvEgrZWH0zyvaG+PoIOenaJJpsAh3b55
         z0riLCfgSO+pRrPDMqRtTb+hpYbZOvhkbYmcpRQoO0o6Yr7xVOhjoi0WXMlBGGa5mtu7
         DYTaj6qcX/bz9euNRWQf2VWQxth30qgePfPc9RSPVByROT0joP8nL6FvUmnG7lc97Vwf
         mpP4Sl8Fwcw/Qh8u2zmw5z1nybLh/D3BqPnMXD+B25SlseniSOl9vHtvnIl0h4z/ydpU
         LYBHMan2aE8LAebd5zySluZ1IsFuBrprpLjB50TKeAZD3Gn8ThVl5ymYUnSn52M6Nq3b
         Gzzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SxdaRVYR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q3-20020a17090a68c300b001ecac28033fsor929937pjj.14.2022.07.08.08.47.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 08 Jul 2022 08:47:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SxdaRVYR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X3HkBOy76gPUx/AerMnT/Pi7Lr8ImXW6FCDVZLVLx8A=;
        b=SxdaRVYRJDPH3zg3QYyQIu17dr/IVBcHr5XUHILGbaLIQeYPWWgY+954kvq/VXxQiN
         Jw/KmgOemd78xk8dMQSinK5JUeBmDvrtLd3N3LOo1Vwhm0gqkdKRvaaFspYV1/5LilqS
         9MTTRuLtyCmJdgPIwtNvjy8ca8Hwf0tydMm1zVPJq/EAJVPbf4FM5OTdb3HDhp1fA5Pp
         IQjZNzJVOm2u92lYvJe3YF+/hgYEqP9+NID9iI8ItveucyWvXTbBzHeBDP6Jr+kMNcqI
         Y/gJovEEwgzDZbsKoeRKzz73ZtfMcQ38u6QbVkw0g/Y0x3nxNFvsIRoRbD9LTpZ+qxRB
         iNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X3HkBOy76gPUx/AerMnT/Pi7Lr8ImXW6FCDVZLVLx8A=;
        b=xquVDz8C9igkxjxtHgstZxFaB9KNNM3JWQgjjsgty0pvDPrztwlWwoYxewXUUwSxw2
         CuNwG7rc9isxaJ8gqxoA+lfVK/z51PG2HHkhNQEShv81D8I746albcPyco+D/qLkieuH
         +4UQ2FQe5aygEH4Fuu7ax30reSMSi4vl9eF5/5hofq9BMvN3a5bzO4k2kh1wjKJK+4di
         hOP+rEvJyVZTAgtNB9iAqaJXpO677EgFLukmG1skwxGGyQSJnpV0HjMaqZl5LWYuawvr
         tBu5p4P2/wzLNzKH2izxPpbwb9nBhY3eSsckgkt031MUFQoeSSa51rjawfRjvVMssmuS
         M/5w==
X-Gm-Message-State: AJIora+a6KRBfy+vKp6zlTHKstmIPjPSEMUj8qMblrq4JyfJc5ReVl9W
	QTjOX6nERAeH832prHJB1pW4BVTY
X-Google-Smtp-Source: AGRyM1stgki4yW3XROy9RMdCOwp9zcPIontz0Fu43DMTFhuvoAkmHnBu/kffjye3WYG+WezWa5i8Gg==
X-Received: by 2002:a17:90a:3e09:b0:1ef:8399:398b with SMTP id j9-20020a17090a3e0900b001ef8399398bmr482263pjc.39.1657295236189;
        Fri, 08 Jul 2022 08:47:16 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([122.255.60.245])
        by smtp.gmail.com with ESMTPSA id y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 08:47:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RISU PATCH v4 03/29] Hoist trace file and socket opening
Date: Fri,  8 Jul 2022 21:16:34 +0530
Message-Id: <20220708154700.18682-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +Y5uOHVI4Iel

We will want to share this code with --dump.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Hoist socket connecting as well as trace file opening.
---
 risu.c | 49 +++++++++++++++++++++++--------------------------
 1 file changed, 23 insertions(+), 26 deletions(-)

diff --git a/risu.c b/risu.c
index 059348f..2f6a677 100644
--- a/risu.c
+++ b/risu.c
@@ -363,6 +363,29 @@ int main(int argc, char **argv)
         }
     }
 
+    if (trace) {
+        if (strcmp(trace_fn, "-") == 0) {
+            comm_fd = ismaster ? STDOUT_FILENO : STDIN_FILENO;
+        } else {
+            if (ismaster) {
+                comm_fd = open(trace_fn, O_WRONLY | O_CREAT, S_IRWXU);
+            } else {
+                comm_fd = open(trace_fn, O_RDONLY);
+            }
+#ifdef HAVE_ZLIB
+            gz_trace_file = gzdopen(comm_fd, ismaster ? "wb9" : "rb");
+#endif
+        }
+    } else {
+        if (ismaster) {
+            fprintf(stderr, "master port %d\n", port);
+            comm_fd = master_connect(port);
+        } else {
+            fprintf(stderr, "apprentice host %s port %d\n", hostname, port);
+            comm_fd = apprentice_connect(hostname, port);
+        }
+    }
+
     imgfile = argv[optind];
     if (!imgfile) {
         fprintf(stderr, "Error: must specify image file name\n\n");
@@ -373,34 +396,8 @@ int main(int argc, char **argv)
     load_image(imgfile);
 
     if (ismaster) {
-        if (trace) {
-            if (strcmp(trace_fn, "-") == 0) {
-                comm_fd = STDOUT_FILENO;
-            } else {
-                comm_fd = open(trace_fn, O_WRONLY | O_CREAT, S_IRWXU);
-#ifdef HAVE_ZLIB
-                gz_trace_file = gzdopen(comm_fd, "wb9");
-#endif
-            }
-        } else {
-            fprintf(stderr, "master port %d\n", port);
-            comm_fd = master_connect(port);
-        }
         return master();
     } else {
-        if (trace) {
-            if (strcmp(trace_fn, "-") == 0) {
-                comm_fd = STDIN_FILENO;
-            } else {
-                comm_fd = open(trace_fn, O_RDONLY);
-#ifdef HAVE_ZLIB
-                gz_trace_file = gzdopen(comm_fd, "rb");
-#endif
-            }
-        } else {
-            fprintf(stderr, "apprentice host %s port %d\n", hostname, port);
-            comm_fd = apprentice_connect(hostname, port);
-        }
         return apprentice();
     }
 }
-- 
2.34.1
