Received: by 10.80.166.35 with SMTP id d32csp2468231edc;
        Sun, 23 Oct 2016 22:56:08 -0700 (PDT)
X-Received: by 10.55.156.22 with SMTP id f22mr15606425qke.36.1477288568684;
        Sun, 23 Oct 2016 22:56:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 6si9993809qkl.267.2016.10.23.22.56.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 23 Oct 2016 22:56:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44701 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1byYEx-00033E-Gj
	for alex.bennee@linaro.org; Mon, 24 Oct 2016 01:56:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51056)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1byYEq-00031w-85
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 01:56:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1byYEm-0004hp-A1
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 01:56:00 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:35860)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1byYEm-0004hg-0g; Mon, 24 Oct 2016 01:55:56 -0400
Received: by mail-pf0-x242.google.com with SMTP id r16so15507805pfg.3;
	Sun, 23 Oct 2016 22:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LppaeaWqOFJUvTboZ1k0dPXQwjB69K/94vrsLmsq3Fk=;
	b=JTjRdGXRV/YH1yBkfGNNp7avL5/lRg6q85LcH5Uvp4YNESCXszOKTXqtSzYt3kxwTi
	ljc117xqOUMIwJNQi2TtVFv2abZO8pcnd3Ofzb4MY4N8uE68ZOFF7RN1Lr03H7DNSa4a
	n1CTL2LnaAgm/5eyklpCSXbPNlHfxtNFfReb6j4ZnjJ2n5AIV763jiPKhumaWnp0uqZG
	4YTttnx+TeW+bmOeXNhv0B0+wjYbsp8ozIBgkDsPQZ++l9iIRpcWgcAKelHijJYDkijy
	2QhhuOI3xXAo+kvgvGHn1erxapw4nM0wtAD2fSbAZlIe2KMUp/RvV7EELj5na0lX9s3D
	0FsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LppaeaWqOFJUvTboZ1k0dPXQwjB69K/94vrsLmsq3Fk=;
	b=aJVFTsnvcgb4zRW5R76veyXx0DY0L+i0U1iDK33ZooAeTC+Xqllsr8JTqvl+pANFkd
	69rfUOusz1aTp/fA2mSOEeUZK3QQWbowKx+a2asPAcp0awb3i1DCeBtEMgaNkm8O7+9k
	t4FUDRksKOjKtbVswPVjMQPuHXAADBl9m8KFH83XNrPJhAVV0Dw2iHFQsyKhntawwfxG
	w9572J6ZSyVJ0stHugy19dmTvL15sEY4tFgs5DSD1zQ8egaQMQ4Or7OSPRfzDxxMsLQE
	FkqjcyagMJViRNir0Yv9rufpCnKhufX8FBpyCv+KEPzM0LWwI8b1R2kY+UZH7VWivJsx
	peyg==
X-Gm-Message-State: ABUngvd1E33g5EapiLUbGDzgpCFsZpcuHkNdleR7tdHyBV43GmEroLWiEb9NFWJxcHujFw==
X-Received: by 10.98.194.150 with SMTP id w22mr24868903pfk.24.1477288554246;
	Sun, 23 Oct 2016 22:55:54 -0700 (PDT)
Received: from localhost.localdomain ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	c5sm21627558pfj.71.2016.10.23.22.55.47
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Oct 2016 22:55:53 -0700 (PDT)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
	rth@twiddle.net
Date: Mon, 24 Oct 2016 11:25:21 +0530
Message-Id: <1477288523-10819-2-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1477288523-10819-1-git-send-email-vijay.kilari@gmail.com>
References: <1477288523-10819-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [PATCH v3 1/3] cutils: Set __builtin_prefetch optional
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
X-TUID: f8ZpImiLZuIS

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

Optional parameters of __builtin_prefetch() which specifies
rw and locality to 0's. For checking buffer is zero, set rw as read
and temporal locality to 0.

On arm64, __builtin_prefetch(addr) generates 'prfm    pldl1keep'
where __builtin_prefetch(addr, 0, 0) generates 'prfm pldl1strm'
instruction which is optimal for this use case

Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
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

