Received: by 10.25.21.156 with SMTP id 28csp116682lfv;
        Tue, 23 Aug 2016 21:26:59 -0700 (PDT)
X-Received: by 10.55.161.215 with SMTP id k206mr1061902qke.105.1472012819867;
        Tue, 23 Aug 2016 21:26:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id y5si5074899qkd.107.2016.08.23.21.26.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Aug 2016 21:26:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49567 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bcPmF-0005Kp-D6
	for alex.bennee@linaro.org; Wed, 24 Aug 2016 00:26:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52114)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bcPfL-0007QL-Tc
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 00:19:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bcPfJ-0004oE-Pg
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 00:19:50 -0400
Received: from mail-qk0-f193.google.com ([209.85.220.193]:34897)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bcPfB-0004iE-IK; Wed, 24 Aug 2016 00:19:41 -0400
Received: by mail-qk0-f193.google.com with SMTP id o1so398454qkd.2;
	Tue, 23 Aug 2016 21:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YtEgJsbZkwnZa7bN2D4V0viY8tgUP51Ea+fGRkRkOLU=;
	b=wklo5euS2pIIrT+OvJT9CWpJ0opL2VhOz4JRxWw5NeDP92+5QgA0ygA+FNnG1W2nOg
	32CcvcV/3o42aruDuyAvRtEP3y96ASFXQw6VygXfxgzfb3E9hsDoS89tAMAsT4fPbgXy
	zpchLXf2Bwe/RJ2enmLiAG+xdVS0kHjElrjmoMZmdr5tnQfnfaLht0OjuxiKVgRtz7hT
	Vb4MMl60BfxxMjRDMA3rturLLV7cTVSto7Uieq8IHCywEaQb+/C7XJHPizva/fKAM6MT
	P7wYiOR77KLx6oFMMPTTmCazXjZ187nQQjlmJYKGQxBzfZJ4eOPsbVj0H23zROSAOim7
	uQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=YtEgJsbZkwnZa7bN2D4V0viY8tgUP51Ea+fGRkRkOLU=;
	b=I8pU63q6/zAcSewxy8DtH49usby2RmYaCM5dgzUsoRYzn7eUyYdJdG7chTo9t9Ttfm
	MFeZNspEf48qD89zEceSWgzCKF3CVGUH8skH0vKG0re7ANm6H3OyBt2fYpvMpG2pXrl/
	i33wbDG5D7PEPJqG+xxzl9tmU7QQJD4vMu1O2gwJmSLYBrfkbSMrqWXeuCe1mH+D1Kas
	CnVN6quiQKyRdV8PBzPHnE+LcWSEqT5MbQZSyjBqSDMiQyRUqNV8SW2mixmwjJuSYF4i
	hPPqnoYXexlmLakDrOfyylB+zwYRqS/13dLJEyH3fiAaFwonodC8cc0fqP9uYcm/lmYb
	23lA==
X-Gm-Message-State: AE9vXwOTpYUqpe+/UO1LMGhxBpiA4mxe/NwMNA2u5oJhUlgSWH6ssGXGUGiISqiuJKlWNA==
X-Received: by 10.55.180.2 with SMTP id d2mr1055694qkf.175.1472012321193;
	Tue, 23 Aug 2016 21:18:41 -0700 (PDT)
Received: from bigtime.com (174-24-157-40.tukw.qwest.net. [174.24.157.40])
	by smtp.gmail.com with ESMTPSA id t36sm3677369qtd.3.2016.08.23.21.18.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Aug 2016 21:18:40 -0700 (PDT)
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Tue, 23 Aug 2016 21:17:58 -0700
Message-Id: <1472012279-20581-7-git-send-email-rth@twiddle.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1472012279-20581-1-git-send-email-rth@twiddle.net>
References: <1472012279-20581-1-git-send-email-rth@twiddle.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.193
Subject: [Qemu-arm] [PATCH 6/7] cutils: Rewrite aarch64 buffer zero checking
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
Cc: pbonzini@redhat.com, qemu-arm@nongnu.org, vijay.kilari@gmail.com,
	peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P4VQHFGqa8MB

Provide 64-byte and 128-byte versions.
Use dczid_el0 as a proxy for the cacheline size.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 util/cutils.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/util/cutils.c b/util/cutils.c
index ec4bd78..fe860e8 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -475,13 +475,35 @@ static bool select_accel_fn(const void *buf, size_t len)
 #include "arm_neon.h"
 
 #define DO_ZERO(X)  (vgetq_lane_u64((X), 0) | vgetq_lane_u64((X), 1))
-ACCEL_BUFFER_ZERO(buffer_zero_neon, 128, uint64x2_t, DO_ZERO)
+ACCEL_BUFFER_ZERO(buffer_zero_neon_64, 64, uint64x2_t, DO_ZERO)
+ACCEL_BUFFER_ZERO(buffer_zero_neon_128, 128, uint64x2_t, DO_ZERO)
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

