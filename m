Received: by 10.25.21.156 with SMTP id 28csp461251lfv;
        Wed, 24 Aug 2016 10:51:42 -0700 (PDT)
X-Received: by 10.55.58.70 with SMTP id h67mr5187476qka.215.1472061096029;
        Wed, 24 Aug 2016 10:51:36 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 2si6307211qkz.220.2016.08.24.10.51.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Aug 2016 10:51:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52531 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bccKt-00014S-Fn
	for alex.bennee@linaro.org; Wed, 24 Aug 2016 13:51:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bccIg-0008D3-C7
	for qemu-devel@nongnu.org; Wed, 24 Aug 2016 13:49:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bccIe-0008Mq-3v
	for qemu-devel@nongnu.org; Wed, 24 Aug 2016 13:49:17 -0400
Received: from mail-yw0-x241.google.com ([2607:f8b0:4002:c05::241]:33509)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bccId-0008Mm-Vw; Wed, 24 Aug 2016 13:49:16 -0400
Received: by mail-yw0-x241.google.com with SMTP id z8so1153031ywa.0;
	Wed, 24 Aug 2016 10:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7V5m+xgket869uzbs/HNBeoY/XBzVjtWvoyf/9UjHiI=;
	b=oviKVLvhBpE8oRV5CFJlvNL4yOFVtV6KnjLxU48FQZsnYdhoBvky1GLuLDYyvsLy3k
	XMOtc49aknLw59W6fRF8eGb81K4Z0yP4CPizgZy626oBzvkzMe0bMRzvnGi1XBU9VxW/
	pih3DD6W5q3RLml+saCtb8TKZ9b0QO//YjejQ7+I6Na5tAMHzXp8atK6uqKTQOgfsiDt
	gtT38DifMUHqNUwcwXr91p0JXkcxSYIerOKhyq3FyjxCiGnLTuQ4Ovdp0NIY2G770Wba
	eUznF6DnWlrzyawkFsa2/WAQd/+5qdAMkR+jUuIvCMO0eOKXWS6ae36UWTfPZzvgfcbG
	trTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=7V5m+xgket869uzbs/HNBeoY/XBzVjtWvoyf/9UjHiI=;
	b=c2hA1Z9yV538kddVmB2m4MV0P6/BhNWNXcQ5kKA6PfhRHGX62Kr6O1H8E+kNsM11ZW
	kVT7WzWOEde2FESS7ynSf/9y8pVCPbWBiUHj1flRSqRUz1z9hHh2/AH+dko0AyYg7mUO
	YlrQVZSfUctsLZVCCqd8+3EYvt3RKjYXubGemGsv4FiG1IK/At8Q2OYnNew0tOEUZxcK
	KnmgFfhQ/5kvmF9iFaRnU0g69Mcpo9M5YW8nmEqWxoGQDnR+4L3dMjdnYXhzHDEjHyLp
	8YKIBA1mptIu1ymU+uGU8hTCOWOlsdwYHGnA6cArkpeVDV5XI0Y+VsaACdtkzfVVVoHW
	t1rQ==
X-Gm-Message-State: AE9vXwNL3qjxGsiNvahOUYNIEu4fiOZ8dIcZ8xWyYHcAC1GHCUYEAB0R1xA2ql7PTvmTbA==
X-Received: by 10.129.92.215 with SMTP id q206mr3645549ywb.8.1472060955523;
	Wed, 24 Aug 2016 10:49:15 -0700 (PDT)
Received: from bigtime.com (174-24-157-40.tukw.qwest.net. [174.24.157.40])
	by smtp.gmail.com with ESMTPSA id
	u201sm5950916ywf.48.2016.08.24.10.49.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Aug 2016 10:49:15 -0700 (PDT)
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Wed, 24 Aug 2016 10:48:34 -0700
Message-Id: <1472060915-6011-8-git-send-email-rth@twiddle.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1472060915-6011-1-git-send-email-rth@twiddle.net>
References: <1472060915-6011-1-git-send-email-rth@twiddle.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::241
Subject: [Qemu-devel] [PATCH v2 7/8] cutils: Rewrite aarch64 buffer zero
 checking
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, qemu-arm@nongnu.org, vijay.kilari@gmail.com,
	peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9usLZwdVow8a

Provide 64-byte and 128-byte versions.
Use dczid_el0 as a proxy for the cacheline size.

Cc: qemu-arm@nongnu.org
Cc: vijay.kilari@gmail.com
Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 util/bufferiszero.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/util/bufferiszero.c b/util/bufferiszero.c
index e5e4459..28a1419 100644
--- a/util/bufferiszero.c
+++ b/util/bufferiszero.c
@@ -340,13 +340,35 @@ static bool select_accel_fn(const void *buf, size_t len)
 #include "arm_neon.h"
 
 #define DO_NONZERO(X)  (vgetq_lane_u64((X), 0) | vgetq_lane_u64((X), 1))
-ACCEL_BUFFER_ZERO(buffer_zero_neon, 128, uint64x2_t, DO_NONZERO)
+ACCEL_BUFFER_ZERO(buffer_zero_neon_64, 64, uint64x2_t, DO_NONZERO)
+ACCEL_BUFFER_ZERO(buffer_zero_neon_128, 128, uint64x2_t, DO_NONZERO)
+
+static uint32_t buffer_zero_line_mask;
+static accel_zero_fn buffer_zero_accel;
+
+static void __attribute__((constructor)) init_buffer_zero_accel(void)
+{
+    uint64_t t;
+
+    /* Use the DZP block size as a proxy for the cacheline size,
+       since the later is not available to userspace.  This seems
+       to work in practice for existing implementations.  */
+    asm("mrs %0, dczid_el0" : "=r"(t));
+    if ((t & 15) * 16 >= 128) {
+        buffer_zero_line_mask = 128 - 1;
+        buffer_zero_accel = buffer_zero_neon_128;
+    } else {
+        buffer_zero_line_mask = 64 - 1;
+        buffer_zero_accel = buffer_zero_neon_64;
+    }
+}
 
 static bool select_accel_fn(const void *buf, size_t len)
 {
     uintptr_t ibuf = (uintptr_t)buf;
-    if (len % 128 == 0 && ibuf % sizeof(uint64x2_t) == 0) {
-        return buffer_zero_neon(buf, len);
+    if (likely(ibuf % sizeof(uint64_t) == 0)
+        && (len & buffer_zero_line_mask) == 0) {
+        return buffer_zero_accel(buf, len);
     }
     return select_accel_int(buf, len);
 }
-- 
2.7.4

