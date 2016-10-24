Received: by 10.80.166.35 with SMTP id d32csp2469217edc;
        Sun, 23 Oct 2016 22:59:53 -0700 (PDT)
X-Received: by 10.55.74.6 with SMTP id x6mr14483643qka.316.1477288793189;
        Sun, 23 Oct 2016 22:59:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h20si9997825qtb.151.2016.10.23.22.59.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 23 Oct 2016 22:59:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44716 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1byYIa-0005yH-4H
	for alex.bennee@linaro.org; Mon, 24 Oct 2016 01:59:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1byYEt-00033s-3f
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 01:56:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1byYEr-0004jQ-Tn
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 01:56:03 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:33144)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1byYEr-0004if-L0; Mon, 24 Oct 2016 01:56:01 -0400
Received: by mail-pf0-x243.google.com with SMTP id i85so15537367pfa.0;
	Sun, 23 Oct 2016 22:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HzeLJU/sYthXQXqZ/bY8P05PCcKkJ5Hi149DqcH8T/U=;
	b=YFnkx/+8kqiFsdxOCd8OPgMtloVqgeVe+nAUUuYFcSTFUnoA5tGll8ALNfTMuS8opG
	aiRqdDoQgl/oVUK8Ckkajz0FI328ZxFrLSv4jU/MF+DOdIa3rl/qESLIROKLsJAdvC7s
	oMAZCgrmJiIuDNV1ET3akKlyongIXsyfwsBhTLhmNepxNb4ROgGa2Dc6vsVhV6jwJrel
	JMzblkSuZtFGsb+MHmSCe65msPxlRroimSb01aYoi1dVm+SBDcHnzVgg/gy9eR2DZR0f
	xUIaV7djr/74ZxTwaU5jBz7MzgLOSGm3+Hwz1YxjaEx9uKQzZiaZyH4yyuafpeegOM0S
	xZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HzeLJU/sYthXQXqZ/bY8P05PCcKkJ5Hi149DqcH8T/U=;
	b=WIcrzs8umPrPQegO//bo6JYkpCQJAxT8IEOWx7jzkZj4PGCDShwUKGSrvMu3RrxQV5
	IDc2h+10/r0f7L+keVSZWHkHEHDRL/sTPsQpqZ0lOanenrNiGnZX5rGe5yHCBje+Fksp
	P2n35SZtLic1RxbI3dZJPx557wBKe8i+romUlw2+s3k+Jz16jVbkGuEjv7pr/YEfsrqV
	JnVEMR9W4MkBM/HS9PH8LvISQkfGM9fCNhv49vYfLOBEnmzE84R+83VMV1YquMyrvC9X
	/TmYoDFnVqLO4kgZ8TLygonATwiW8vVW5KfDRNxJPo96o6SuCnKelWciopiBKH76Q9tO
	SfhA==
X-Gm-Message-State: ABUngvdjzM33mQLJVcY4e9EySUgeaPqxFRGUdclsOKF9wulYYZ0HkLBCD8PVKufIxLIpEQ==
X-Received: by 10.98.82.75 with SMTP id g72mr25479124pfb.119.1477288559911;
	Sun, 23 Oct 2016 22:55:59 -0700 (PDT)
Received: from localhost.localdomain ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	c5sm21627558pfj.71.2016.10.23.22.55.57
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Oct 2016 22:55:59 -0700 (PDT)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
	rth@twiddle.net
Date: Mon, 24 Oct 2016 11:25:23 +0530
Message-Id: <1477288523-10819-4-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1477288523-10819-1-git-send-email-vijay.kilari@gmail.com>
References: <1477288523-10819-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PATCH v3 3/3] utils: Add prefetch for Thunderx platform
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, vijay.kilari@gmail.com,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ekY6EOIMP5y9

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

Thunderx pass2 chip requires explicit prefetch
instruction to give prefetch hint.

To speed up live migration on Thunderx platform,
prefetch instruction is added in zero buffer check
function.The below results show live migration time improvement
with prefetch instruction. VM with 4 VCPUs, 8GB RAM is migrated.

Without prefetch total migration time is ~13 seconds
adding prefetch total migration time is 9.5 seconds

Code for decoding cache size is taken from Richard's
patch

Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
---
 util/bufferiszero.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/util/bufferiszero.c b/util/bufferiszero.c
index 421d945..f50b8df 100644
--- a/util/bufferiszero.c
+++ b/util/bufferiszero.c
@@ -25,6 +25,10 @@
 #include "qemu-common.h"
 #include "qemu/cutils.h"
 #include "qemu/bswap.h"
+#include <math.h>
+
+static uint32_t cache_line_factor = 1;
+static uint32_t prefetch_line_dist = 1;
 
 static bool
 buffer_zero_int(const void *buf, size_t len)
@@ -49,7 +53,8 @@ buffer_zero_int(const void *buf, size_t len)
         const uint64_t *e = (uint64_t *)(((uintptr_t)buf + len) & -8);
 
         for (; p + 8 <= e; p += 8) {
-            __builtin_prefetch(p + 8, 0, 0);
+            __builtin_prefetch(p +
+               (8 * cache_line_factor * prefetch_line_dist), 0, 0);
             if (t) {
                 return false;
             }
@@ -293,6 +298,30 @@ bool test_buffer_is_zero_next_accel(void)
 }
 #endif
 
+#if defined(__aarch64__)
+#include "qemu/aarch64-cpuid.h"
+
+static void __attribute__((constructor)) aarch64_init_cache_size(void)
+{
+    uint64_t t;
+
+    /* Use the DZP block size as a proxy for the cacheline size,
+       since the later is not available to userspace.  This seems
+       to work in practice for existing implementations.  */
+    asm("mrs %0, dczid_el0" : "=r"(t));
+    if (pow(2, (t & 0xf)) * 4 >= 128) {
+        cache_line_factor = 2;
+    } else {
+        cache_line_factor = 1;
+    }
+
+    get_aarch64_cpu_id();
+    if (is_thunderx_pass2_cpu()) {
+        prefetch_line_dist = 3;
+    }
+}
+#endif
+
 /*
  * Checks if a buffer is all zeroes
  */
@@ -305,6 +334,12 @@ bool buffer_is_zero(const void *buf, size_t len)
     /* Fetch the beginning of the buffer while we select the accelerator.  */
     __builtin_prefetch(buf, 0, 0);
 
+#if defined(__aarch64__)
+    if (is_thunderx_pass2_cpu()) {
+        __builtin_prefetch(buf + 16, 0, 0);
+        __builtin_prefetch(buf + 32, 0, 0);
+    }
+#endif
     /* Use an optimized zero check if possible.  Note that this also
        includes a check for an unrolled loop over 64-bit integers.  */
     return select_accel_fn(buf, len);
-- 
1.9.1

