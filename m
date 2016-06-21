Received: by 10.25.21.96 with SMTP id l93csp2053406lfi;
        Tue, 21 Jun 2016 10:09:53 -0700 (PDT)
X-Received: by 10.200.46.235 with SMTP id i40mr31285820qta.13.1466528993430;
        Tue, 21 Jun 2016 10:09:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q8si54961297qta.40.2016.06.21.10.09.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Jun 2016 10:09:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53207 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFPBQ-00049h-LV
	for alex.bennee@linaro.org; Tue, 21 Jun 2016 13:09:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54373)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bFPBL-00047S-JX
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 13:09:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bFPBJ-00045j-CL
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 13:09:46 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57938)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bFPBJ-00044f-3p; Tue, 21 Jun 2016 13:09:45 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bFPBA-000253-Mw; Tue, 21 Jun 2016 18:09:36 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 21 Jun 2016 18:09:31 +0100
Message-Id: <1466528974-12183-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
References: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 3/6] translate-all.c: Compute L1 page table
 properties at runtime
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8vXNnMsqZRmX

From: Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>

Remove L1 page mapping table properties computing
statically using macros which is dependent on
TARGET_PAGE_BITS. Drop macros V_L1_SIZE, V_L1_SHIFT,
V_L1_BITS macros and replace with variables which are
computed at early stage of VM boot.

Removing dependency can help to make TARGET_PAGE_BITS
dynamic.

Signed-off-by: Vijaya Kumar K <vijayak@cavium.com>
Message-id: 1465808915-4887-4-git-send-email-vijayak@caviumnetworks.com
[PMM:
 assert(v_l1_shift % V_L2_BITS == 0)
 cache v_l2_levels
 initialize from page_init() rather than vl.c
 minor code style fixes]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 translate-all.c | 67 +++++++++++++++++++++++++++++++++++++--------------------
 1 file changed, 44 insertions(+), 23 deletions(-)

diff --git a/translate-all.c b/translate-all.c
index 3f402df..e59efdb 100644
--- a/translate-all.c
+++ b/translate-all.c
@@ -97,25 +97,24 @@ typedef struct PageDesc {
 #define V_L2_BITS 10
 #define V_L2_SIZE (1 << V_L2_BITS)
 
-/* The bits remaining after N lower levels of page tables.  */
-#define V_L1_BITS_REM \
-    ((L1_MAP_ADDR_SPACE_BITS - TARGET_PAGE_BITS) % V_L2_BITS)
-
-#if V_L1_BITS_REM < 4
-#define V_L1_BITS  (V_L1_BITS_REM + V_L2_BITS)
-#else
-#define V_L1_BITS  V_L1_BITS_REM
-#endif
-
-#define V_L1_SIZE  ((target_ulong)1 << V_L1_BITS)
-
-#define V_L1_SHIFT (L1_MAP_ADDR_SPACE_BITS - TARGET_PAGE_BITS - V_L1_BITS)
-
 uintptr_t qemu_host_page_size;
 intptr_t qemu_host_page_mask;
 
-/* The bottom level has pointers to PageDesc */
-static void *l1_map[V_L1_SIZE];
+/*
+ * L1 Mapping properties
+ */
+static int v_l1_size;
+static int v_l1_shift;
+static int v_l2_levels;
+
+/* The bottom level has pointers to PageDesc, and is indexed by
+ * anything from 4 to (V_L2_BITS + 3) bits, depending on target page size.
+ */
+#define V_L1_MIN_BITS 4
+#define V_L1_MAX_BITS (V_L2_BITS + 3)
+#define V_L1_MAX_SIZE (1 << V_L1_MAX_BITS)
+
+static void *l1_map[V_L1_MAX_SIZE];
 
 /* code generation context */
 TCGContext tcg_ctx;
@@ -125,6 +124,26 @@ TCGContext tcg_ctx;
 __thread int have_tb_lock;
 #endif
 
+static void page_table_config_init(void)
+{
+    uint32_t v_l1_bits;
+
+    assert(TARGET_PAGE_BITS);
+    /* The bits remaining after N lower levels of page tables.  */
+    v_l1_bits = (L1_MAP_ADDR_SPACE_BITS - TARGET_PAGE_BITS) % V_L2_BITS;
+    if (v_l1_bits < V_L1_MIN_BITS) {
+        v_l1_bits += V_L2_BITS;
+    }
+
+    v_l1_size = 1 << v_l1_bits;
+    v_l1_shift = L1_MAP_ADDR_SPACE_BITS - TARGET_PAGE_BITS - v_l1_bits;
+    v_l2_levels = v_l1_shift / V_L2_BITS - 1;
+
+    assert(v_l1_bits <= V_L1_MAX_BITS);
+    assert(v_l1_shift % V_L2_BITS == 0);
+    assert(v_l2_levels >= 0);
+}
+
 void tb_lock(void)
 {
 #ifdef CONFIG_USER_ONLY
@@ -330,6 +349,8 @@ void page_size_init(void)
 static void page_init(void)
 {
     page_size_init();
+    page_table_config_init();
+
 #if defined(CONFIG_BSD) && defined(CONFIG_USER_ONLY)
     {
 #ifdef HAVE_KINFO_GETVMMAP
@@ -406,10 +427,10 @@ static PageDesc *page_find_alloc(tb_page_addr_t index, int alloc)
     int i;
 
     /* Level 1.  Always allocated.  */
-    lp = l1_map + ((index >> V_L1_SHIFT) & (V_L1_SIZE - 1));
+    lp = l1_map + ((index >> v_l1_shift) & (v_l1_size - 1));
 
     /* Level 2..N-1.  */
-    for (i = V_L1_SHIFT / V_L2_BITS - 1; i > 0; i--) {
+    for (i = v_l2_levels; i > 0; i--) {
         void **p = atomic_rcu_read(lp);
 
         if (p == NULL) {
@@ -825,8 +846,8 @@ static void page_flush_tb(void)
 {
     int i;
 
-    for (i = 0; i < V_L1_SIZE; i++) {
-        page_flush_tb_1(V_L1_SHIFT / V_L2_BITS - 1, l1_map + i);
+    for (i = 0; i < v_l1_size; i++) {
+        page_flush_tb_1(v_l2_levels, l1_map + i);
     }
 }
 
@@ -1850,9 +1871,9 @@ int walk_memory_regions(void *priv, walk_memory_regions_fn fn)
     data.start = -1u;
     data.prot = 0;
 
-    for (i = 0; i < V_L1_SIZE; i++) {
-        int rc = walk_memory_regions_1(&data, (target_ulong)i << (V_L1_SHIFT + TARGET_PAGE_BITS),
-                                       V_L1_SHIFT / V_L2_BITS - 1, l1_map + i);
+    for (i = 0; i < v_l1_size; i++) {
+        target_ulong base = i << (v_l1_shift + TARGET_PAGE_BITS);
+        int rc = walk_memory_regions_1(&data, base, v_l2_levels, l1_map + i);
         if (rc != 0) {
             return rc;
         }
-- 
1.9.1

