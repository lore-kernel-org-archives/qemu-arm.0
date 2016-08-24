Received: by 10.25.21.156 with SMTP id 28csp114445lfv;
        Tue, 23 Aug 2016 21:20:07 -0700 (PDT)
X-Received: by 10.200.56.35 with SMTP id q32mr1135784qtb.32.1472012407675;
        Tue, 23 Aug 2016 21:20:07 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id o2si5067687qkc.114.2016.08.23.21.20.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Aug 2016 21:20:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49529 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bcPfb-0007bz-3L
	for alex.bennee@linaro.org; Wed, 24 Aug 2016 00:20:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52146)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bcPfO-0007Uy-TH
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 00:19:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1bcPfL-0004ow-Kn
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 00:19:54 -0400
Received: from mail-qk0-f196.google.com ([209.85.220.196]:36017)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1bcPfG-0004kX-33; Wed, 24 Aug 2016 00:19:46 -0400
Received: by mail-qk0-f196.google.com with SMTP id v123so396726qkh.3;
	Tue, 23 Aug 2016 21:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HoF+gnoYL2j83RG/ET+zg4MnVBB1dDF2iOV5flMpfNo=;
	b=GkGd3YflqXSVcy35hvmM2qrTcbuRIAZlRE/VqQnOOb6gqOPgwc/GXV5OWwQbHmN3Cj
	iy5eKgdIwcnE0AglkBIw/nLt1hEnnLx4rAbS2ws6zjBd/grbsQKD0FsAC0+I4S2CNQ2G
	R1THcOLSYQNUt4hswHWihkOJh+9ikWcjWqrne6BX6qG7WGrGMMflCpBCLpD8UPb3O/sF
	QPqnxvJI3ktlIFMLIoHtGv2bEKq5dqKOtjtntsoeRp+J9hGuneJ00YntliW65GpKEFA6
	bsUtREKnfHQxR4gCulJlPY+eWN7bA2vunhOPq5/bn+FAUdKs/Jp6XcKmmzoASo+OjipN
	s22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=HoF+gnoYL2j83RG/ET+zg4MnVBB1dDF2iOV5flMpfNo=;
	b=MlVzWYmD+rvUgvJrmUFYPLlnI2OlVm3ZXTXvqQBYQLL/moR6Dt6k8UMN+GxpYQ6QZX
	HRwCDqTo5iPw3NAxOY22Cm8BL5m0wNQtTrOdju6gUzAl23BL8ObCrBfjNA1WAvBFP+v0
	xbJs8IN0JrKDh4FOsOWt7ASeERINdxNxYg6FSubGCKJTtplXU9yavCJPRXooK4lL+O+v
	cv7FWIMsd3Ka/Y7Qp2OMCoRMjge4FOYTOVxYgOQPf22eihI5YozowZ1i0ULxY2opfcLs
	DdVjCHzho4+nAK3UMKhWwKo5pruFzApEjSeaToydAj4VZTp6jLx8UCJR8sDFEsQMF7jr
	R0+Q==
X-Gm-Message-State: AE9vXwPBIJy+X8sFBShRc4ry7XFmhyctcIM0U8vgyiBZ8LpPPRGT21+z1IQ1Vowq1sUnZg==
X-Received: by 10.55.45.1 with SMTP id t1mr1081887qkh.182.1472012325607;
	Tue, 23 Aug 2016 21:18:45 -0700 (PDT)
Received: from bigtime.com (174-24-157-40.tukw.qwest.net. [174.24.157.40])
	by smtp.gmail.com with ESMTPSA id t36sm3677369qtd.3.2016.08.23.21.18.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Aug 2016 21:18:43 -0700 (PDT)
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Tue, 23 Aug 2016 21:17:59 -0700
Message-Id: <1472012279-20581-8-git-send-email-rth@twiddle.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1472012279-20581-1-git-send-email-rth@twiddle.net>
References: <1472012279-20581-1-git-send-email-rth@twiddle.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.196
Subject: [Qemu-arm] [PATCH 7/7] cutils: Rewrite ppc buffer zero checking
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
Cc: peter.maydell@linaro.org, vijay.kilari@gmail.com, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, pbonzini@redhat.com,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qooZQ1axr7Fr

GCC versions through 6 do a poor job with the indexed addressing,
and (for ppc64le) issues unnecessary xxswapd insns.

Cc: qemu-ppc@nongnu.org
Cc: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Richard Henderson <rth@twiddle.net>
---
 util/cutils.c | 41 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/util/cutils.c b/util/cutils.c
index fe860e8..30fac02 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -254,8 +254,45 @@ static bool select_accel_int(const void *buf, size_t len)
 #undef pixel
 #undef bool
 #define bool _Bool
-#define DO_ZERO(X)  vec_all_eq(X, (__vector unsigned char){ 0 })
-ACCEL_BUFFER_ZERO(buffer_zero_ppc, 128, __vector unsigned char, DO_ZERO)
+
+static bool __attribute__((noinline))
+buffer_zero_ppc(const void *buf, size_t len)
+{
+    typedef unsigned char vec __attribute__((vector_size(16)));
+    const vec *p = buf;
+    const vec *end = buf + len;
+    vec t0, t1, t2, t3, zero = (vec){ 0 };
+
+    do {
+        p += 8;
+        __builtin_prefetch(p);
+        /* ??? GCC6 does poorly with power64le; extra xxswap.  */
+        __asm volatile("lvebx %0,%4,%5\n\t"
+                       "lvebx %1,%4,%6\n\t"
+                       "lvebx %2,%4,%7\n\t"
+                       "lvebx %3,%4,%8\n\t"
+                       "vor %0,%0,%1\n\t"
+                       "vor %1,%2,%3\n\t"
+                       "lvebx %2,%4,%9\n\t"
+                       "lvebx %3,%4,%10\n\t"
+                       "vor %0,%0,%1\n\t"
+                       "vor %1,%2,%3\n\t"
+                       "lvebx %2,%4,%11\n\t"
+                       "lvebx %3,%4,%12\n\t"
+                       "vor %0,%0,%1\n\t"
+                       "vor %1,%2,%3\n\t"
+                       "vor %0,%0,%1"
+                       : "=v"(t0), "=v"(t1), "=v"(t2), "=v"(t3)
+                       : "b"(p), "b"(-8 * 16), "b"(-7 * 16),
+                         "b"(-6 * 16), "b"(-5 * 16),
+                         "b"(-4 * 16), "b"(-3 * 16),
+                         "b"(-2 * 16), "b"(-1 * 16));
+        if (unlikely(vec_any_ne(t0, zero))) {
+            return false;
+        }
+    } while (p < end);
+    return true;
+}
 
 static bool select_accel_fn(const void *buf, size_t len)
 {
-- 
2.7.4

