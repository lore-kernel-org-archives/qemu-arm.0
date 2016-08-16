Received: by 10.25.21.156 with SMTP id 28csp1936267lfv;
        Tue, 16 Aug 2016 05:03:41 -0700 (PDT)
X-Received: by 10.200.34.53 with SMTP id o50mr38131896qto.130.1471349021156;
        Tue, 16 Aug 2016 05:03:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h19si17300719qth.130.2016.08.16.05.03.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Aug 2016 05:03:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41859 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bZd5o-0000hK-JZ
	for alex.bennee@linaro.org; Tue, 16 Aug 2016 08:03:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35635)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bZd5g-0000dD-RN
	for qemu-arm@nongnu.org; Tue, 16 Aug 2016 08:03:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bZd5c-0002fH-Np
	for qemu-arm@nongnu.org; Tue, 16 Aug 2016 08:03:32 -0400
Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242]:33868)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bZd5c-0002f7-Cy; Tue, 16 Aug 2016 08:03:28 -0400
Received: by mail-pa0-x242.google.com with SMTP id hh10so5226299pac.1;
	Tue, 16 Aug 2016 05:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Fv5+PkKIhtb8XZA/UfbBL1JEyr0K8iCFgMy4EJknFTs=;
	b=JDnkbKxI8zIZ7DzfUp1FB+mhrq3OGIsb8Y0tOXPrKXsl2GhCt7O2wLvFuLhaSIcU7r
	NDBLzm2hgNK07pNpRW5vH7G9ySdNL9wqADdXXML8dEItdyYgWwuBR397d/enj7Y0xGko
	FdDymtI+0Kf2wVn5bJZBHmWcnbf6rBTKmG1zC9e//MNd+hGwWoc3A8giYXRI3D3Pp6Nb
	OHO5RzQneaeN4cGaWk6vcl8xnHzj+NIBNEdd39OgPcZ6QRbjlSuBrHyaWN2rnzyOjLBH
	c/S9kvHbxv0V2MluTK+FLQ8e2W1l72aRRY6EMxof4zqgUt1yxl8uJfZeH7f+NNDVFYtm
	AG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Fv5+PkKIhtb8XZA/UfbBL1JEyr0K8iCFgMy4EJknFTs=;
	b=FHBcjOkUFObKxIroV1kq0Z5euQTxES9H+TjWB8bZvjy31XNbsLfUKI1Or9bXGqETgD
	8aPl80sqcSVRTlQ0DUQL/U96k5Ndqgsu1oxhSdAHnqdS0uQ/8jGBRN+gNZVAAd8IatBQ
	LA4et+fu903eefCxyAH5ShBvS3O7yWnI/YpnZvWzFhFEMYn3GfggMw546qAcBBwShozs
	0O1cDqsYX4tWJ6hoohnGk3Ty7BadoqEPQViIAw5PsDm+WdSL0Ikhd0R0vrv2dJlQTW6v
	09jKtTG7W+7mw6ZlL5Aqfhrz4n6uyMOu/OkUljXysbSDWGSVwq6NsArgEdD6lfjDNHJw
	aI8A==
X-Gm-Message-State: AEkoouv0gA04c+cgr/kXzDlIyxjIY9m8Km90xbSQiZ9USnWXHKdlVndFxkRo0lygpcVV2g==
X-Received: by 10.66.172.237 with SMTP id bf13mr9218912pac.42.1471349007356;
	Tue, 16 Aug 2016 05:03:27 -0700 (PDT)
Received: from cavium-Vostro-2520.caveonetworks.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	u72sm38850990pfa.31.2016.08.16.05.03.24
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Aug 2016 05:03:26 -0700 (PDT)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
	rth@twiddle.net
Date: Tue, 16 Aug 2016 17:32:48 +0530
Message-Id: <1471348968-4614-3-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1471348968-4614-1-git-send-email-vijay.kilari@gmail.com>
References: <1471348968-4614-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::242
Subject: [Qemu-arm] [RFC PATCH v2 2/2] utils: Add prefetch for Thunderx
 platform
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
Cc: Prasun.Kapoor@cavium.com, p.fedin@samsung.com, qemu-devel@nongnu.org,
	vijay.kilari@gmail.com, Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5+eldmjZ8eKZ

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

Thunderx pass2 chip requires explicit prefetch
instruction to give prefetch hint.

To speed up live migration on Thunderx platform,
prefetch instruction is added in zero buffer check
function.

The below results show live migration time improvement
with prefetch instruction with 1K and 4K page size.
VM with 4 VCPUs, 8GB RAM is migrated.

1K page size, no prefetch
=========================
Migration status: completed
total time: 13012 milliseconds
downtime: 10 milliseconds
setup: 15 milliseconds
transferred ram: 268131 kbytes
throughput: 168.84 mbps
remaining ram: 0 kbytes
total ram: 8519872 kbytes
duplicate: 8338072 pages
skipped: 0 pages
normal: 193335 pages
normal bytes: 193335 kbytes
dirty sync count: 4

1K page size with prefetch
=========================
Migration status: completed
total time: 7493 milliseconds
downtime: 71 milliseconds
setup: 16 milliseconds
transferred ram: 269666 kbytes
throughput: 294.88 mbps
remaining ram: 0 kbytes
total ram: 8519872 kbytes
duplicate: 8340596 pages
skipped: 0 pages
normal: 194837 pages
normal bytes: 194837 kbytes
dirty sync count: 3

4K page size with no prefetch
=============================
Migration status: completed
total time: 10456 milliseconds
downtime: 49 milliseconds
setup: 5 milliseconds
transferred ram: 231726 kbytes
throughput: 181.59 mbps
remaining ram: 0 kbytes
total ram: 8519872 kbytes
duplicate: 2079914 pages
skipped: 0 pages
normal: 53257 pages
normal bytes: 213028 kbytes
dirty sync count: 3

4K page size with prefetch
==========================
Migration status: completed
total time: 3937 milliseconds
downtime: 23 milliseconds
setup: 5 milliseconds
transferred ram: 229283 kbytes
throughput: 477.19 mbps
remaining ram: 0 kbytes
total ram: 8519872 kbytes
duplicate: 2079775 pages
skipped: 0 pages
normal: 52648 pages
normal bytes: 210592 kbytes
dirty sync count: 3

Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
---
 util/cutils.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/util/cutils.c b/util/cutils.c
index 7505fda..342d1e3 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -186,11 +186,14 @@ int qemu_fdatasync(int fd)
 #define VEC_OR(v1, v2) (_mm_or_si128(v1, v2))
 #elif defined(__aarch64__)
 #include "arm_neon.h"
+#include "qemu/aarch64-cpuid.h"
 #define VECTYPE        uint64x2_t
 #define ALL_EQ(v1, v2) \
         ((vgetq_lane_u64(v1, 0) == vgetq_lane_u64(v2, 0)) && \
          (vgetq_lane_u64(v1, 1) == vgetq_lane_u64(v2, 1)))
 #define VEC_OR(v1, v2) ((v1) | (v2))
+#define VEC_PREFETCH(base, index) \
+        __builtin_prefetch(&base[index], 0, 0);
 #else
 #define VECTYPE        unsigned long
 #define SPLAT(p)       (*(p) * (~0UL / 255))
@@ -200,6 +203,29 @@ int qemu_fdatasync(int fd)
 
 #define BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR 8
 
+static inline void prefetch_vector(const VECTYPE *p, int index)
+{
+#if defined(__aarch64__)
+    get_aarch64_cpu_id();
+    if (is_thunderx_pass2_cpu()) {
+        /* Prefetch first 3 cache lines */
+        VEC_PREFETCH(p, index + BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR);
+        VEC_PREFETCH(p, index + (BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR * 2));
+        VEC_PREFETCH(p, index + (BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR * 3));
+    }
+#endif
+}
+
+static inline void prefetch_vector_loop(const VECTYPE *p, int index)
+{
+#if defined(__aarch64__)
+    if (is_thunderx_pass2_cpu()) {
+        /* Prefetch 4 cache lines ahead from index */
+        VEC_PREFETCH(p, index + (BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR * 4));
+    }
+#endif
+}
+
 static bool
 can_use_buffer_find_nonzero_offset_inner(const void *buf, size_t len)
 {
@@ -246,9 +272,14 @@ static size_t buffer_find_nonzero_offset_inner(const void *buf, size_t len)
         }
     }
 
+    prefetch_vector(p, 0);
+
     for (i = BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR;
          i < len / sizeof(VECTYPE);
          i += BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR) {
+
+        prefetch_vector_loop(p, i);
+
         VECTYPE tmp0 = VEC_OR(p[i + 0], p[i + 1]);
         VECTYPE tmp1 = VEC_OR(p[i + 2], p[i + 3]);
         VECTYPE tmp2 = VEC_OR(p[i + 4], p[i + 5]);
-- 
1.9.1

