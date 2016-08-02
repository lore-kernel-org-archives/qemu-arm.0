Received: by 10.25.21.156 with SMTP id 28csp104241lfv;
        Tue, 2 Aug 2016 03:22:52 -0700 (PDT)
X-Received: by 10.55.195.138 with SMTP id r10mr38847667qkl.146.1470133372348;
        Tue, 02 Aug 2016 03:22:52 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d75si1194751qka.11.2016.08.02.03.22.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Aug 2016 03:22:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55134 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUWqZ-0005zi-My
	for alex.bennee@linaro.org; Tue, 02 Aug 2016 06:22:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bUWos-00055o-MN
	for qemu-devel@nongnu.org; Tue, 02 Aug 2016 06:21:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bUWom-00040T-7B
	for qemu-devel@nongnu.org; Tue, 02 Aug 2016 06:21:05 -0400
Received: from mail-pa0-x243.google.com ([2607:f8b0:400e:c03::243]:35141)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bUWog-0003zq-9M; Tue, 02 Aug 2016 06:20:54 -0400
Received: by mail-pa0-x243.google.com with SMTP id cf3so11637523pad.2;
	Tue, 02 Aug 2016 03:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TkO110PHh1n1ltGhZLEqlBC2Mf7YupV2hwTDLLbJTwY=;
	b=DNeSXRzM7yBzi0QBWDDpK8m6wlPjjsekXsQExZhI3dM/EfbeCmx9s0n5LgPgeZiXg3
	PPZryVt2O2hBK2bmfOZXRgQXMCruMhHuuHBltoVb5F0/tBFdzoEeRxyHOyKZNSRVycP5
	k337metN1tLDdx6Ca41mBhQrxM8kEHQndstS7gPg7dKgOdO8myWf5/IRcqERcqLrI3IE
	Hm3VHQhNTU2SAMnuN3LV8mMosZJ4mO02gQZSIVB/Yi1b2GfsVLInxkCwfvJCUDdnwr2m
	cV/lAdvZVyaE8UNtK0gmOCbrcnll+wDQtMNpeJO/Ipoqk3fkOUH+1ddojXgVgggfPwDo
	KVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TkO110PHh1n1ltGhZLEqlBC2Mf7YupV2hwTDLLbJTwY=;
	b=PG2R7kku1LL+/wHTB1wfud9BiIOqJ5PUxKiJ4BJN8P7Ygsj42a0OJpeX0kI0boysca
	7AAn/ATiWUTmvtbmpqiiXP6VEWGAkAAa7B65ghlXTrwCMQ9T050uB5wEUXUTGjHsFZEx
	BaO6ONKA9k53MJKY6ZhKA+6imseflFu0VsAh5vgfPlzK01VLkzevlNuoX6p+qsveHgeE
	scLAsx9SR3aQoX5Mgkrik7kCbOBEO70VDo/Pc9+xXVYhN//N/bVsoxwHxW9sfFjoWsod
	apZJruCInQwJ26rijIML3+LICZHa5BJ/eFEDrgEajhkziAGasc5DnaWXjOYMRTw1s6lY
	j6dQ==
X-Gm-Message-State: AEkooutlzf7uArONorqyqEO1CzbmjdDeie0NDL+SW+R8tlljQbjNx0srVHSJ2NkNYs1D4w==
X-Received: by 10.66.181.16 with SMTP id ds16mr105204235pac.102.1470133253424; 
	Tue, 02 Aug 2016 03:20:53 -0700 (PDT)
Received: from cavium-Vostro-2520.caveonetworks.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	m78sm3580612pfj.66.2016.08.02.03.20.50
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Aug 2016 03:20:52 -0700 (PDT)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	pbonzini@redhat.com
Date: Tue,  2 Aug 2016 15:50:16 +0530
Message-Id: <1470133216-6758-3-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1470133216-6758-1-git-send-email-vijay.kilari@gmail.com>
References: <1470133216-6758-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::243
Subject: [Qemu-devel] [RFC PATCH v1 2/2] utils: Add prefetch for Thunderx
 platform
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
Cc: Prasun.Kapoor@cavium.com, qemu-devel@nongnu.org, vijay.kilari@gmail.com,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wmm+VWnWLoyD

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
 include/qemu-common.h |    1 +
 util/cpuinfo.c        |   38 ++++++++++++++++++++++++++++++++++++++
 util/cutils.c         |   22 ++++++++++++++++++++++
 3 files changed, 61 insertions(+)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index 62ad674..3d8a32c 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -135,4 +135,5 @@ void page_size_init(void);
 bool dump_in_progress(void);
 
 long int qemu_read_cpuid_info(void);
+bool is_thunder_pass2_cpu(void);
 #endif
diff --git a/util/cpuinfo.c b/util/cpuinfo.c
index 3ba7194..0e72a34 100644
--- a/util/cpuinfo.c
+++ b/util/cpuinfo.c
@@ -16,6 +16,26 @@
 
 #if defined(__aarch64__)
 
+#define MIDR_IMPLEMENTER_SHIFT  24
+#define MIDR_IMPLEMENTER_MASK   (0xffULL << MIDR_IMPLEMENTER_SHIFT)
+#define MIDR_ARCHITECTURE_SHIFT 16
+#define MIDR_ARCHITECTURE_MASK  (0xf << MIDR_ARCHITECTURE_SHIFT)
+#define MIDR_PARTNUM_SHIFT      4
+#define MIDR_PARTNUM_MASK       (0xfff << MIDR_PARTNUM_SHIFT)
+
+#define MIDR_CPU_PART(imp, partnum) \
+        (((imp)                 << MIDR_IMPLEMENTER_SHIFT)  | \
+        (0xf                    << MIDR_ARCHITECTURE_SHIFT) | \
+        ((partnum)              << MIDR_PARTNUM_SHIFT))
+
+#define ARM_CPU_IMP_CAVIUM        0x43
+#define CAVIUM_CPU_PART_THUNDERX  0x0A1
+
+#define MIDR_THUNDERX  \
+               MIDR_CPU_PART(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX)
+#define CPU_MODEL_MASK  (MIDR_IMPLEMENTER_MASK | MIDR_ARCHITECTURE_MASK | \
+                         MIDR_PARTNUM_MASK)
+
 long int qemu_read_cpuid_info(void)
 {
     FILE *fp;
@@ -49,4 +69,22 @@ out:
 
     return midr;
 }
+
+bool is_thunder_pass2_cpu(void)
+{
+    static bool cpu_info_read;
+    static long int midr_thunder_val;
+
+    if (!cpu_info_read) {
+        midr_thunder_val = qemu_read_cpuid_info();
+        midr_thunder_val &= CPU_MODEL_MASK;
+        cpu_info_read = 1;
+    }
+
+    if (midr_thunder_val == MIDR_THUNDERX) {
+        return 1;
+    } else {
+        return 0;
+    }
+}
 #endif
diff --git a/util/cutils.c b/util/cutils.c
index 7505fda..66c816b 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -191,6 +191,8 @@ int qemu_fdatasync(int fd)
         ((vgetq_lane_u64(v1, 0) == vgetq_lane_u64(v2, 0)) && \
          (vgetq_lane_u64(v1, 1) == vgetq_lane_u64(v2, 1)))
 #define VEC_OR(v1, v2) ((v1) | (v2))
+#define VEC_PREFETCH(base, index) \
+        asm volatile ("prfm pldl1strm, [%x[a]]\n" : : [a]"r"(&base[(index)]))
 #else
 #define VECTYPE        unsigned long
 #define SPLAT(p)       (*(p) * (~0UL / 255))
@@ -233,6 +235,9 @@ static size_t buffer_find_nonzero_offset_inner(const void *buf, size_t len)
     const VECTYPE *p = buf;
     const VECTYPE zero = (VECTYPE){0};
     size_t i;
+#if defined (__aarch64__)
+    bool do_prefetch;
+#endif
 
     assert(can_use_buffer_find_nonzero_offset_inner(buf, len));
 
@@ -246,9 +251,26 @@ static size_t buffer_find_nonzero_offset_inner(const void *buf, size_t len)
         }
     }
 
+#if defined (__aarch64__)
+    do_prefetch = is_thunder_pass2_cpu();
+    if (do_prefetch) {
+        VEC_PREFETCH(p, 8);
+        VEC_PREFETCH(p, 16);
+        VEC_PREFETCH(p, 24);
+    }
+#endif
+
     for (i = BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR;
          i < len / sizeof(VECTYPE);
          i += BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR) {
+
+#if defined (__aarch64__)
+        if (do_prefetch) {
+            VEC_PREFETCH(p, i+32);
+            VEC_PREFETCH(p, i+40);
+        }
+#endif
+
         VECTYPE tmp0 = VEC_OR(p[i + 0], p[i + 1]);
         VECTYPE tmp1 = VEC_OR(p[i + 2], p[i + 3]);
         VECTYPE tmp2 = VEC_OR(p[i + 4], p[i + 5]);
-- 
1.7.9.5

