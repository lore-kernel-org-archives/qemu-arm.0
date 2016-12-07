Received: by 10.25.159.131 with SMTP id i125csp446017lfe;
        Wed, 7 Dec 2016 09:11:23 -0800 (PST)
X-Received: by 10.55.72.86 with SMTP id v83mr59720271qka.262.1481130683635;
        Wed, 07 Dec 2016 09:11:23 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 19si14928686qkh.207.2016.12.07.09.11.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Dec 2016 09:11:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40304 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cEfkZ-0004dJ-2W
	for alex.bennee@linaro.org; Wed, 07 Dec 2016 12:11:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cEfhC-0002Jc-LN
	for qemu-arm@nongnu.org; Wed, 07 Dec 2016 12:08:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cEfh6-0000SK-F9
	for qemu-arm@nongnu.org; Wed, 07 Dec 2016 12:07:54 -0500
Received: from mail-pf0-f195.google.com ([209.85.192.195]:35661)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cEfh6-0000SE-8j; Wed, 07 Dec 2016 12:07:48 -0500
Received: by mail-pf0-f195.google.com with SMTP id i88so11480065pfk.2;
	Wed, 07 Dec 2016 09:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cNLQYH4CrDqKu6vf7cUx7b+DVUPdSfr1YBkO1isz8g4=;
	b=z4nOU/qj4Fo2SaFwsWBCoYPZOjPjp1+fDqQ7WQ3FUDzi7vzXa53L2TUf9xE2gNzpV9
	SX7de28Bns5S73H3trbbImKtyI6vdLdeXSxSvxLWJx3Vi/YVSt6R5+Nrhe2RQmnQojgR
	hiHWc1CUA419NdfaKjpXPKzqa0Q48R4j+laDsa8h7QnQ9wyUi9r0C84V1bRURCwLabwz
	zYmuKD5YZaY6dUVcFCr3hTLYe48EBuliGsUiIzdfQ+BdG2GQoh7UKwxfuspyPYQya8VL
	wMn37V6/6WZOihZlf13X89NxlfUt8NkODjpOdfxj/q9SFExePJrM2Lv+lOtrCCtVDY/a
	coqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cNLQYH4CrDqKu6vf7cUx7b+DVUPdSfr1YBkO1isz8g4=;
	b=kJE1Nx0I5lX8jgdf0cX8cfbDzIzKtnptZ5+Nzdz3aQNTXHje2sqO/0vYJjO7h6zgbl
	QMwNIm8URBe41fDKP07KScPWKzb/B8OOJ+FqBQjC8KLg0vH8IMLzVGBafE6mAjuihA2/
	6fqQ1efpmOiwECOJ2NLlV+v1QzMG1y/vnzdc0+KMJGWN+0fW3jJxUrskWpzW5xN4GY1r
	VELE7Q9NjcT1SKEgh4xRxpeJpmROWDY/vLovfrLx0ncO2nFM3eG2h4fuD9dt+El+J0Ja
	gOHC7tTCsxIqeERXLg1jsNO4oowO6oie0w2HrFIqYmJtmVSh3HcpzNeddxbPNQxTl2W6
	GvUA==
X-Gm-Message-State: AKaTC03QMD0PS0cfq93JqBT1s1b7WLaH1oaxlBMfNMMcNO6SkKFccEPZLsncGOGOq/TSRA==
X-Received: by 10.98.71.218 with SMTP id p87mr69624796pfi.125.1481130407372;
	Wed, 07 Dec 2016 09:06:47 -0800 (PST)
Received: from localhost.localdomain
	(50-233-148-156-static.hfc.comcastbusiness.net. [50.233.148.156])
	by smtp.gmail.com with ESMTPSA id
	u23sm43898487pfg.86.2016.12.07.09.06.43
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Dec 2016 09:06:46 -0800 (PST)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
	rth@twiddle.net
Date: Wed,  7 Dec 2016 22:36:13 +0530
Message-Id: <1481130374-5147-4-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1481130374-5147-1-git-send-email-vijay.kilari@gmail.com>
References: <1481130374-5147-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.195
Subject: [Qemu-arm] [PATCH v5 3/3] utils: Add prefetch for Thunderx platform
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
X-TUID: HuYUuYB6o9hk

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

Thunderx pass2 chip requires explicit prefetch
instruction to give prefetch hint.

To speed up live migration on Thunderx platform,
prefetch instruction is added in zero buffer check
function.The below results show live migration time improvement
with prefetch instruction. VM with 4 VCPUs, 8GB RAM is migrated.

Code for decoding cache size is taken from Richard's patch.

With 1K page size and without prefetch
======================================
Migration status: completed
total time: 13556 milliseconds
downtime: 380 milliseconds
setup: 15 milliseconds
transferred ram: 265557 kbytes
throughput: 160.51 mbps
remaining ram: 0 kbytes
total ram: 8519872 kbytes
duplicate: 8344672 pages
skipped: 0 pages
normal: 190724 pages
normal bytes: 190724 kbytes
dirty sync count: 3

With 1K page size and with prefetch
===================================
Migration status: completed
total time: 8218 milliseconds
downtime: 395 milliseconds
setup: 15 milliseconds
transferred ram: 274484 kbytes
throughput: 273.67 mbps
remaining ram: 0 kbytes
total ram: 8519872 kbytes
duplicate: 8341921 pages
skipped: 0 pages
normal: 199606 pages
normal bytes: 199606 kbytes
dirty sync count: 3
(qemu)

With 4K page size and without prefetch
======================================
Migration status: completed
total time: 11121 milliseconds
downtime: 372 milliseconds
setup: 5 milliseconds
transferred ram: 231777 kbytes
throughput: 170.77 mbps
remaining ram: 0 kbytes
total ram: 8519872 kbytes
duplicate: 2082158 pages
skipped: 0 pages
normal: 53265 pages
normal bytes: 213060 kbytes
dirty sync count: 3

With 4K page size and with prefetch
===================================
Migration status: completed
total time: 5893 milliseconds
downtime: 359 milliseconds
setup: 5 milliseconds
transferred ram: 225795 kbytes
throughput: 313.96 mbps
remaining ram: 0 kbytes
total ram: 8519872 kbytes
duplicate: 2081903 pages
skipped: 0 pages
normal: 51773 pages
normal bytes: 207092 kbytes
dirty sync count: 3

Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
---
 util/bufferiszero.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/util/bufferiszero.c b/util/bufferiszero.c
index 421d945..ed3b31d 100644
--- a/util/bufferiszero.c
+++ b/util/bufferiszero.c
@@ -25,6 +25,11 @@
 #include "qemu-common.h"
 #include "qemu/cutils.h"
 #include "qemu/bswap.h"
+#include "qemu/aarch64-cpuid.h"
+
+static uint32_t cache_line_size = 64;
+static uint32_t prefetch_line_dist = 1;
+static uint32_t prefetch_distance = 8;
 
 static bool
 buffer_zero_int(const void *buf, size_t len)
@@ -49,7 +54,7 @@ buffer_zero_int(const void *buf, size_t len)
         const uint64_t *e = (uint64_t *)(((uintptr_t)buf + len) & -8);
 
         for (; p + 8 <= e; p += 8) {
-            __builtin_prefetch(p + 8, 0, 0);
+            __builtin_prefetch(p + prefetch_distance, 0, 0);
             if (t) {
                 return false;
             }
@@ -293,17 +298,45 @@ bool test_buffer_is_zero_next_accel(void)
 }
 #endif
 
+static void __attribute__((constructor)) init_cache_size(void)
+{
+#if defined(__aarch64__)
+    uint64_t t;
+
+    /* Use the DZP block size as a proxy for the cacheline size,
+       since the later is not available to userspace.  This seems
+       to work in practice for existing implementations.  */
+    asm("mrs %0, dczid_el0" : "=r"(t));
+    if ((1 << ((t & 0xf) + 2)) >= 128) {
+        cache_line_size = 128;
+    }
+#endif
+
+    get_aarch64_cpu_id();
+    if (is_thunderx_pass2_cpu()) {
+        prefetch_line_dist = 3;
+        prefetch_distance = (prefetch_line_dist * cache_line_size) /
+                             sizeof(uint64_t);
+    }
+}
+
 /*
  * Checks if a buffer is all zeroes
  */
 bool buffer_is_zero(const void *buf, size_t len)
 {
+    int i;
+    uint32_t prefetch_distance_bytes;
+
     if (unlikely(len == 0)) {
         return true;
     }
 
     /* Fetch the beginning of the buffer while we select the accelerator.  */
-    __builtin_prefetch(buf, 0, 0);
+    prefetch_distance_bytes = prefetch_line_dist * cache_line_size;
+    for (i = 0; i < prefetch_distance_bytes && i < len; i += cache_line_size) {
+        __builtin_prefetch(buf + i, 0, 0);
+    }
 
     /* Use an optimized zero check if possible.  Note that this also
        includes a check for an unrolled loop over 64-bit integers.  */
-- 
1.9.1

