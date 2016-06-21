Received: by 10.25.21.96 with SMTP id l93csp2053438lfi;
        Tue, 21 Jun 2016 10:09:58 -0700 (PDT)
X-Received: by 10.55.130.1 with SMTP id e1mr31079298qkd.139.1466528997329;
        Tue, 21 Jun 2016 10:09:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a66si665343qkf.17.2016.06.21.10.09.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Jun 2016 10:09:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53209 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFPBU-0004Ab-L7
	for alex.bennee@linaro.org; Tue, 21 Jun 2016 13:09:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bFPBL-00047O-E6
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 13:09:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bFPBI-00045Y-Vs
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 13:09:46 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57938)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bFPBI-00044f-N8; Tue, 21 Jun 2016 13:09:44 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bFPBB-00025L-By; Tue, 21 Jun 2016 18:09:37 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 21 Jun 2016 18:09:32 +0100
Message-Id: <1466528974-12183-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
References: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 4/6] cpu: Support a target CPU having a
 variable page size
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
X-TUID: nQ54VQPqMPFj

Support target CPUs having a page size which isn't knownn
at compile time. To use this, the CPU implementation should:
 * define TARGET_PAGE_BITS_VARY
 * not define TARGET_PAGE_BITS
 * define TARGET_PAGE_BITS_MIN to the smallest value it
   might possibly want for TARGET_PAGE_BITS
 * call set_preferred_target_page_bits() in its realize
   function to indicate the actual preferred target page
   size for the CPU (and report any error from it)

In CONFIG_USER_ONLY, the CPU implementation should continue
to define TARGET_PAGE_BITS appropriately for the guest
OS page size.

Machines which want to take advantage of having the page
size something larger than TARGET_PAGE_BITS_MIN must
set the MachineClass minimum_page_bits field to a value
which they guarantee will be no greater than the preferred
page size for any CPU they create.

Note that changing the target page size by setting
minimum_page_bits is a migration compatibility break
for that machine.

For debugging purposes, attempts to use TARGET_PAGE_SIZE
before it has been finally confirmed will assert.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 exec.c                 | 42 ++++++++++++++++++++++++++++++++++++++++++
 include/exec/cpu-all.h |  8 ++++++++
 include/hw/boards.h    |  7 +++++++
 include/qemu-common.h  | 13 +++++++++++++
 vl.c                   | 10 ++++++++++
 5 files changed, 80 insertions(+)

diff --git a/exec.c b/exec.c
index 8eaeb0c..027ce53 100644
--- a/exec.c
+++ b/exec.c
@@ -93,6 +93,11 @@ static MemoryRegion io_mem_unassigned;
 
 #endif
 
+#ifdef TARGET_PAGE_BITS_VARY
+int target_page_bits;
+bool target_page_bits_decided;
+#endif
+
 struct CPUTailQ cpus = QTAILQ_HEAD_INITIALIZER(cpus);
 /* current CPU in the current thread. It is only valid inside
    cpu_exec() */
@@ -102,8 +107,37 @@ __thread CPUState *current_cpu;
    2 = Adaptive rate instruction counting.  */
 int use_icount;
 
+bool set_preferred_target_page_bits(int bits)
+{
+    /* The target page size is the lowest common denominator for all
+     * the CPUs in the system, so we can only make it smaller, never
+     * larger. And we can't make it smaller once we've committed to
+     * a particular size.
+     */
+#ifdef TARGET_PAGE_BITS_VARY
+    assert(bits >= TARGET_PAGE_BITS_MIN);
+    if (target_page_bits == 0 || target_page_bits > bits) {
+        if (target_page_bits_decided) {
+            return false;
+        }
+        target_page_bits = bits;
+    }
+#endif
+    return true;
+}
+
 #if !defined(CONFIG_USER_ONLY)
 
+static void finalize_target_page_bits(void)
+{
+#ifdef TARGET_PAGE_BITS_VARY
+    if (target_page_bits == 0) {
+        target_page_bits = TARGET_PAGE_BITS_MIN;
+    }
+    target_page_bits_decided = true;
+#endif
+}
+
 typedef struct PhysPageEntry PhysPageEntry;
 
 struct PhysPageEntry {
@@ -2862,6 +2896,14 @@ void cpu_register_map_client(QEMUBH *bh)
 void cpu_exec_init_all(void)
 {
     qemu_mutex_init(&ram_list.mutex);
+    /* The data structures we set up here depend on knowing the page size,
+     * so no more changes can be made after this point.
+     * In an ideal world, nothing we did before we had finished the
+     * machine setup would care about the target page size, and we could
+     * do this much later, rather than requiring board models to state
+     * up front what their requirements are.
+     */
+    finalize_target_page_bits();
     io_mem_init();
     memory_map_init();
     qemu_mutex_init(&map_client_list_lock);
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 9f38edf..dde3cd4 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -189,6 +189,14 @@ void address_space_stq(AddressSpace *as, hwaddr addr, uint64_t val,
 
 /* page related stuff */
 
+#ifdef TARGET_PAGE_BITS_VARY
+extern bool target_page_bits_decided;
+extern int target_page_bits;
+#define TARGET_PAGE_BITS ({ assert(target_page_bits_decided); \
+                            target_page_bits; })
+
+#endif
+
 #define TARGET_PAGE_SIZE (1 << TARGET_PAGE_BITS)
 #define TARGET_PAGE_MASK ~(TARGET_PAGE_SIZE - 1)
 #define TARGET_PAGE_ALIGN(addr) (((addr) + TARGET_PAGE_SIZE - 1) & TARGET_PAGE_MASK)
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 3ed6155..11808bc 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -85,6 +85,12 @@ typedef struct {
  *    Returns a @HotpluggableCPUList, which describes CPUs objects which
  *    could be added with -device/device_add.
  *    Caller is responsible for freeing returned list.
+ * @minimum_page_bits:
+ *    If non-zero, the board promises never to create a CPU with a page size
+ *    smaller than this, so QEMU can use a more efficient larger page
+ *    size than the target architecture's minimum. (Attempting to create
+ *    such a CPU will fail.) Note that changing this is a migration
+ *    compatibility break for the machine.
  */
 struct MachineClass {
     /*< private >*/
@@ -123,6 +129,7 @@ struct MachineClass {
     ram_addr_t default_ram_size;
     bool option_rom_has_mr;
     bool rom_file_has_mr;
+    int minimum_page_bits;
 
     HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
                                            DeviceState *dev);
diff --git a/include/qemu-common.h b/include/qemu-common.h
index 1f2cb94..fd9d4eb 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -76,6 +76,19 @@ void tcg_exec_init(unsigned long tb_size);
 bool tcg_enabled(void);
 
 void cpu_exec_init_all(void);
+void cpu_exec_machine_creation_done(void);
+
+/**
+ * set_preferred_target_page_bits:
+ * @bits: number of bits needed to represent an address within the page
+ *
+ * Set the preferred target page size (the actual target page
+ * size may be smaller than any given CPU's preference).
+ * Returns true on success, false on failure (which can only happen
+ * if this is called after the system has already finalized its
+ * choice of page size and the requested page size is smaller than that).
+ */
+bool set_preferred_target_page_bits(int bits);
 
 /**
  * Sends a (part of) iovec down a socket, yielding when the socket is full, or
diff --git a/vl.c b/vl.c
index 2f63eb4..61ae073 100644
--- a/vl.c
+++ b/vl.c
@@ -4038,6 +4038,16 @@ int main(int argc, char **argv, char **envp)
     }
     object_property_add_child(object_get_root(), "machine",
                               OBJECT(current_machine), &error_abort);
+
+    if (machine_class->minimum_page_bits) {
+        if (!set_preferred_target_page_bits(machine_class->minimum_page_bits)) {
+            /* This would be a board error: specifying a minimum smaller than
+             * a target's compile-time fixed setting.
+             */
+            g_assert_not_reached();
+        }
+    }
+
     cpu_exec_init_all();
 
     if (machine_class->hw_version) {
-- 
1.9.1

