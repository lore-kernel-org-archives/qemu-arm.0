Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp396327ejs;
        Wed, 16 Aug 2023 07:26:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMpdZwWPC9oROEVAlCR5xyQHpYT8MV8y7zvnRS8N4AoEj4usekGdW/o/TPr9Ttr3MquIAU
X-Received: by 2002:a05:620a:f8e:b0:76c:a6ff:92cd with SMTP id b14-20020a05620a0f8e00b0076ca6ff92cdmr1812507qkn.73.1692195983799;
        Wed, 16 Aug 2023 07:26:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692195983; cv=none;
        d=google.com; s=arc-20160816;
        b=0TtUDW/1Q7Sc3IEIx9Mjm2qllqWj1DHYngXOaIniJoj6uCg16niJeycebzWNSefXFz
         QuQm6BXZ1uvNRP84ePJIJ0Wb76KTJXsCj7SMlycM4kxslbNdVGTeOogxuQScO7jFIS0D
         xQ26u6hXuurC1ae78oUesGgvy7OcUDPCKHgVZ8JxQbMhmeeVJGoQTrVADkmg/LTH33fy
         WVQop7EQHIoBkYIa/vGLzT7aorqcFFclp/HVrh+PufLdnxxjqcMbG8rBikZbGrWB9mV3
         Jq0FTG0t+NGMJvXB6llLyI81mI3SS1Mfs987lQvDYlvXkTnm52lLHzJdegNC3pQXCCFC
         Sduw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=czkgg7jUOKlP3GcfTMH8TgF34amSntL+ZEW9hzFx4Wg=;
        fh=oweadga+1U1BKjDqlK8hSmEWEC1EUfcsKuPkDinEDsU=;
        b=eVwIXPsUcirRSpOMei3cQ0W23vdAeVebwNHoZ+/WsXXwqBueGrLO3SU9gGWKVtuo3Z
         hO+eICL4IZrfrFd7ROmfNsS2eJ9orVTMn02SIRs9raK57qHnKG/RX6/WxOy7VxOFKdJS
         LZoxbN1epnjthmpNmwZHVGNrCRqDQh7yyk9OTO4z6CgUxRVZGIL9P6qCvK7xLaMmM8yb
         4FBawllNcbwJBgMCksKVRPpCGLY+tdALuohHL481T/rgfrBUJhGx7WDREc69aWV1NoFY
         gLS6MUH+ODpDZ1kY69R8zN6g8g2Hya+LhNiLtN/jrSaTM7uK6Ze3zqsUwKhPuOP0C5u7
         Rwfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wx2Kn8X/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ou20-20020a05620a621400b00767d2097bd7si8275788qkn.322.2023.08.16.07.26.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Aug 2023 07:26:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wx2Kn8X/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qWHSh-00041v-Gz; Wed, 16 Aug 2023 10:25:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qWHSf-0003xL-Rl
 for qemu-arm@nongnu.org; Wed, 16 Aug 2023 10:25:25 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qWHSd-0003kg-0a
 for qemu-arm@nongnu.org; Wed, 16 Aug 2023 10:25:25 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-68706b39c4cso4794181b3a.2
 for <qemu-arm@nongnu.org>; Wed, 16 Aug 2023 07:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692195921; x=1692800721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=czkgg7jUOKlP3GcfTMH8TgF34amSntL+ZEW9hzFx4Wg=;
 b=wx2Kn8X/CNoONFLsVHsBCvWiYH6pu3btMmFj4IgvAWspAno/AjBsrtfUXGBx/qKzeN
 yklevRitt+lOUZ2DwcYWMciAtC4ja561z5Ma2nD3YUu/cx3tItR9xiP83P+BAkHUvi8s
 JjQJDouc9keZQkwWqcpqlbncueY50ENsx1ZSbrFOhk8eZnx9VWbKlQKX3T/wVrkWlopG
 AYt/3+megQ3hXmDXGwOPqE5Q08ZG3pUiIT2u+6x/UvtMk47wcTYLa9xkZEftFcsnaUy9
 PGNMIsx6KGtCh9fuH88zgGhvltvCGf09WXRypb2WoqUBcdcPGNzgM/A3WWUaeWC3+ED4
 FdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692195921; x=1692800721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=czkgg7jUOKlP3GcfTMH8TgF34amSntL+ZEW9hzFx4Wg=;
 b=WqI38CbZpgjJbU6X4e8o86/2OxgC9OCh44wVfwfR+Yda5Wuq0PnHuH5emPgrcPzKJR
 DwaMb/JXQERAWcbnuxQxJYwODvuB1hQPjDr5j8zMqIPxJuIxDoBeqB3iCuVzCFDAS/QV
 3aWSwbs2jiqmF1qEetgxVHK/BGN0beYvQ2WT4+Iykw3GetF30tlQQVGPHDCj6YtWrG+I
 n4G99axTlyX9L4/wWtf0gRAwIKXft1+8j8hu3pa8vlIpgYhh5tYmmcl7oydqUfEjF9S6
 wbrvY/GrlBXMNmyN4Wy4gnXAw0lBGkngIuWLa4J2YPUUF3MQo0SvS//iYoufKNVQ8/Hb
 P1qw==
X-Gm-Message-State: AOJu0YytKphuksqBQNG9FKxK3AzQfy+WMTOxoD7BAC7XV+FsGYxaubtb
 sNotA5nWPpFymAUuUIn3DtM/bw==
X-Received: by 2002:a05:6a00:a93:b0:687:570:5021 with SMTP id
 b19-20020a056a000a9300b0068705705021mr2423164pfl.15.1692195921594; 
 Wed, 16 Aug 2023 07:25:21 -0700 (PDT)
Received: from stoup.. ([2602:47:d483:7301:a064:e3f9:a812:973b])
 by smtp.gmail.com with ESMTPSA id
 i12-20020aa78b4c000000b00678cb337353sm11156019pfd.208.2023.08.16.07.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 07:25:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 4/4] tcg: Map code_gen_buffer with PROT_BTI
Date: Wed, 16 Aug 2023 07:25:16 -0700
Message-Id: <20230816142516.469743-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230816142516.469743-1-richard.henderson@linaro.org>
References: <20230816142516.469743-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JGmXdVIe2G2n

For linux aarch64 host supporting BTI, map the buffer
to require BTI instructions at branch landing pads.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 39 ++++++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index 2b28ed3556..58cb68c6c8 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -33,8 +33,19 @@
 #include "tcg/tcg.h"
 #include "exec/translation-block.h"
 #include "tcg-internal.h"
+#include "host/cpuinfo.h"
 
 
+/*
+ * Local source-level compatibility with Unix.
+ * Used by tcg_region_init below.
+ */
+#if defined(_WIN32)
+#define PROT_READ   1
+#define PROT_WRITE  2
+#define PROT_EXEC   4
+#endif
+
 struct tcg_region_tree {
     QemuMutex lock;
     QTree *tree;
@@ -83,6 +94,16 @@ bool in_code_gen_buffer(const void *p)
     return (size_t)(p - region.start_aligned) <= region.total_size;
 }
 
+static int host_prot_read_exec(void)
+{
+#if defined(CONFIG_LINUX) && defined(HOST_AARCH64) && defined(PROT_BTI)
+    if (cpuinfo & CPUINFO_BTI) {
+        return PROT_READ | PROT_EXEC | PROT_BTI;
+    }
+#endif
+    return PROT_READ | PROT_EXEC;
+}
+
 #ifdef CONFIG_DEBUG_TCG
 const void *tcg_splitwx_to_rx(void *rw)
 {
@@ -505,14 +526,6 @@ static int alloc_code_gen_buffer(size_t tb_size, int splitwx, Error **errp)
     return PROT_READ | PROT_WRITE;
 }
 #elif defined(_WIN32)
-/*
- * Local source-level compatibility with Unix.
- * Used by tcg_region_init below.
- */
-#define PROT_READ   1
-#define PROT_WRITE  2
-#define PROT_EXEC   4
-
 static int alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
 {
     void *buf;
@@ -567,7 +580,7 @@ static int alloc_code_gen_buffer_splitwx_memfd(size_t size, Error **errp)
         goto fail;
     }
 
-    buf_rx = mmap(NULL, size, PROT_READ | PROT_EXEC, MAP_SHARED, fd, 0);
+    buf_rx = mmap(NULL, size, host_prot_read_exec(), MAP_SHARED, fd, 0);
     if (buf_rx == MAP_FAILED) {
         goto fail_rx;
     }
@@ -642,7 +655,7 @@ static int alloc_code_gen_buffer_splitwx_vmremap(size_t size, Error **errp)
         return -1;
     }
 
-    if (mprotect((void *)buf_rx, size, PROT_READ | PROT_EXEC) != 0) {
+    if (mprotect((void *)buf_rx, size, host_prot_read_exec()) != 0) {
         error_setg_errno(errp, errno, "mprotect for jit splitwx");
         munmap((void *)buf_rx, size);
         munmap((void *)buf_rw, size);
@@ -805,7 +818,7 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
     need_prot = PROT_READ | PROT_WRITE;
 #ifndef CONFIG_TCG_INTERPRETER
     if (tcg_splitwx_diff == 0) {
-        need_prot |= PROT_EXEC;
+        need_prot |= host_prot_read_exec();
     }
 #endif
     for (size_t i = 0, n = region.n; i < n; i++) {
@@ -820,7 +833,11 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
             } else if (need_prot == (PROT_READ | PROT_WRITE)) {
                 rc = qemu_mprotect_rw(start, end - start);
             } else {
+#ifdef CONFIG_POSIX
+                rc = mprotect(start, end - start, need_prot);
+#else
                 g_assert_not_reached();
+#endif
             }
             if (rc) {
                 error_setg_errno(&error_fatal, errno,
-- 
2.34.1

