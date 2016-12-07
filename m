Received: by 10.25.159.131 with SMTP id i125csp444228lfe;
        Wed, 7 Dec 2016 09:07:53 -0800 (PST)
X-Received: by 10.55.221.29 with SMTP id n29mr70723954qki.114.1481130473182;
        Wed, 07 Dec 2016 09:07:53 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 11si14899511qtx.268.2016.12.07.09.07.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Dec 2016 09:07:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40274 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cEfhA-0002DD-Hl
	for alex.bennee@linaro.org; Wed, 07 Dec 2016 12:07:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35173)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cEfh3-0002BV-3v
	for qemu-arm@nongnu.org; Wed, 07 Dec 2016 12:07:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cEfgy-0000PO-Ow
	for qemu-arm@nongnu.org; Wed, 07 Dec 2016 12:07:45 -0500
Received: from mail-pg0-f66.google.com ([74.125.83.66]:35126)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cEfgy-0000PC-JI; Wed, 07 Dec 2016 12:07:40 -0500
Received: by mail-pg0-f66.google.com with SMTP id p66so24030301pga.2;
	Wed, 07 Dec 2016 09:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=POiGBAAPC6SQr0UD6UwKXtKLmwvlp1eRjYEzxtpQCU4=;
	b=N2Vtej3CiacOvpbSet3Rn0yis1vD8tn1dJ+TNB+ZCuNW8bUlcj+lvVN3d4B1CmiEc3
	lXw1n5V+RCQoCkTzkLuv3iJCy7R2KOFZja68DQjyjCyGyn9v4ehDkspTlsdvGoq+Jjt4
	F+QbMP6arkaA7WvRD2PFVl2Wm9jLfTEn7Vd7Q2TYMz03am/qPXUOCNGmzNmXLcN8s3UV
	LfKuwRmIV5dGTRrqzkkLxX53iHDJPOlq/Lq+Av2Qge8p7iDGuVsUohg1P6q2OTGkqcR+
	DGT3rfli7QJ6aTNkGmFSXvanHd29GL4mOnPlyCxTEDuC7TG5aIDYogkudv2VlIi+UL8T
	n4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=POiGBAAPC6SQr0UD6UwKXtKLmwvlp1eRjYEzxtpQCU4=;
	b=iSJGIAOijK9HlYoX97MGLaD22GAeYV4P1YCt7aQ6syyM1G5JN16OeYKxdCRf8RsTNz
	x69V2whbw4A5ss5YJRsuZeQxsHc5sIXAjwoUzDpOZAuskANqA51lniOCYVLfB0M9sLWe
	hWDkh+DmmHJa1oxBWnwo8tZw7VntvJJrJL4a34Ead8hs0ajfhdu7qKmt9dpPXK3fgDcY
	KngrH63SK8R2uxj9K0AWPHIbAwMm2x+UGW8gh00Lq9AjBvDUgZAvuRg7AbzxYDQd4XC0
	bzEaMTmWgWSrieiMIp9s3EtYlX3rYCGRxmJBgCQYmGk+rKCr6dNANIGsklRya0rk4766
	jVZw==
X-Gm-Message-State: AKaTC00EHYcWREWTpsDq0dPnupL7pvvvjvVJqUbwlw0KdFrpzyAg7MrSr1Ldv9cC3IprRg==
X-Received: by 10.99.126.94 with SMTP id o30mr123417297pgn.66.1481130399712;
	Wed, 07 Dec 2016 09:06:39 -0800 (PST)
Received: from localhost.localdomain
	(50-233-148-156-static.hfc.comcastbusiness.net. [50.233.148.156])
	by smtp.gmail.com with ESMTPSA id
	u23sm43898487pfg.86.2016.12.07.09.06.36
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Dec 2016 09:06:39 -0800 (PST)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
	rth@twiddle.net
Date: Wed,  7 Dec 2016 22:36:11 +0530
Message-Id: <1481130374-5147-2-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1481130374-5147-1-git-send-email-vijay.kilari@gmail.com>
References: <1481130374-5147-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.83.66
Subject: [Qemu-arm] [PATCH v5 1/3] cutils: Set __builtin_prefetch optional
 parameters
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
X-TUID: Q6o42ftWfrGZ

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

Optional parameters of __builtin_prefetch() which specifies
rw and locality to 0's. For checking buffer is zero, set rw as read
and temporal locality to 0.

On arm64, __builtin_prefetch(addr) generates 'prfm    pldl1keep'
where __builtin_prefetch(addr, 0, 0) generates 'prfm pldl1strm'
instruction which is optimal for this use case

Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Reviewed-by: Richard Henderson <rth@twiddle.net>
---
 util/bufferiszero.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/util/bufferiszero.c b/util/bufferiszero.c
index eb974b7..421d945 100644
--- a/util/bufferiszero.c
+++ b/util/bufferiszero.c
@@ -49,7 +49,7 @@ buffer_zero_int(const void *buf, size_t len)
         const uint64_t *e = (uint64_t *)(((uintptr_t)buf + len) & -8);
 
         for (; p + 8 <= e; p += 8) {
-            __builtin_prefetch(p + 8);
+            __builtin_prefetch(p + 8, 0, 0);
             if (t) {
                 return false;
             }
@@ -86,7 +86,7 @@ buffer_zero_sse2(const void *buf, size_t len)
 
     /* Loop over 16-byte aligned blocks of 64.  */
     while (likely(p <= e)) {
-        __builtin_prefetch(p);
+        __builtin_prefetch(p, 0, 0);
         t = _mm_cmpeq_epi8(t, zero);
         if (unlikely(_mm_movemask_epi8(t) != 0xFFFF)) {
             return false;
@@ -127,7 +127,7 @@ buffer_zero_sse4(const void *buf, size_t len)
 
     /* Loop over 16-byte aligned blocks of 64.  */
     while (likely(p <= e)) {
-        __builtin_prefetch(p);
+        __builtin_prefetch(p, 0, 0);
         if (unlikely(!_mm_testz_si128(t, t))) {
             return false;
         }
@@ -162,7 +162,7 @@ buffer_zero_avx2(const void *buf, size_t len)
     if (likely(p <= e)) {
         /* Loop over 32-byte aligned blocks of 128.  */
         do {
-            __builtin_prefetch(p);
+            __builtin_prefetch(p, 0, 0);
             if (unlikely(!_mm256_testz_si256(t, t))) {
                 return false;
             }
@@ -303,7 +303,7 @@ bool buffer_is_zero(const void *buf, size_t len)
     }
 
     /* Fetch the beginning of the buffer while we select the accelerator.  */
-    __builtin_prefetch(buf);
+    __builtin_prefetch(buf, 0, 0);
 
     /* Use an optimized zero check if possible.  Note that this also
        includes a check for an unrolled loop over 64-bit integers.  */
-- 
1.9.1

