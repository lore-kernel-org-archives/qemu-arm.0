Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f923sm2375104f8f.89.2025.06.27.04.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 04:25:20 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 141715F90D;
	Fri, 27 Jun 2025 12:25:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-s390x@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Rowan Hart <rowanbhart@gmail.com>
Subject: [PATCH 09/15] plugins: Add memory hardware address read/write API
Date: Fri, 27 Jun 2025 12:25:05 +0100
Message-ID: <20250627112512.1880708-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250627112512.1880708-1-alex.bennee@linaro.org>
References: <20250627112512.1880708-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: u+PaYPWUFIp5

From: Rowan Hart <rowanbhart@gmail.com>

This patch adds functions to the plugins API to allow plugins to read
and write memory via hardware addresses. The functions use the current
address space of the current CPU in order to avoid exposing address
space information to users. A later patch may want to add a function to
permit a specified address space, for example to facilitate
architecture-specific plugins that want to operate on them, for example
reading ARM secure memory.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Rowan Hart <rowanbhart@gmail.com>
Message-ID: <20250624175351.440780-6-rowanbhart@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/qemu-plugin.h | 93 ++++++++++++++++++++++++++++++++++++
 plugins/api.c              | 97 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 190 insertions(+)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 4167c46c2a..5eecdccc67 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -979,6 +979,99 @@ QEMU_PLUGIN_API
 bool qemu_plugin_write_memory_vaddr(uint64_t addr,
                                    GByteArray *data);
 
+/**
+ * enum qemu_plugin_hwaddr_operation_result - result of a memory operation
+ *
+ * @QEMU_PLUGIN_HWADDR_OPERATION_OK: hwaddr operation succeeded
+ * @QEMU_PLUGIN_HWADDR_OPERATION_ERROR: unexpected error occurred
+ * @QEMU_PLUGIN_HWADDR_OPERATION_DEVICE_ERROR: error in memory device
+ * @QEMU_PLUGIN_HWADDR_OPERATION_ACCESS_DENIED: permission error
+ * @QEMU_PLUGIN_HWADDR_OPERATION_INVALID_ADDRESS: address was invalid
+ * @QEMU_PLUGIN_HWADDR_OPERATION_INVALID_ADDRESS_SPACE: invalid address space
+ */
+enum qemu_plugin_hwaddr_operation_result {
+    QEMU_PLUGIN_HWADDR_OPERATION_OK,
+    QEMU_PLUGIN_HWADDR_OPERATION_ERROR,
+    QEMU_PLUGIN_HWADDR_OPERATION_DEVICE_ERROR,
+    QEMU_PLUGIN_HWADDR_OPERATION_ACCESS_DENIED,
+    QEMU_PLUGIN_HWADDR_OPERATION_INVALID_ADDRESS,
+    QEMU_PLUGIN_HWADDR_OPERATION_INVALID_ADDRESS_SPACE,
+};
+
+/**
+ * qemu_plugin_read_memory_hwaddr() - read from memory using a hardware address
+ *
+ * @addr: The physical address to read from
+ * @data: A byte array to store data into
+ * @len: The number of bytes to read, starting from @addr
+ *
+ * @len bytes of data is read from the current memory space for the current
+ * vCPU starting at @addr and stored into @data. If @data is not large enough to
+ * hold @len bytes, it will be expanded to the necessary size, reallocating if
+ * necessary. @len must be greater than 0.
+ *
+ * This function does not ensure writes are flushed prior to reading, so
+ * callers should take care when calling this function in plugin callbacks to
+ * avoid attempting to read data which may not yet be written and should use
+ * the memory callback API instead.
+ *
+ * This function is only valid for softmmu targets.
+ *
+ * Returns a qemu_plugin_hwaddr_operation_result indicating the result of the
+ * operation.
+ */
+QEMU_PLUGIN_API
+enum qemu_plugin_hwaddr_operation_result
+qemu_plugin_read_memory_hwaddr(uint64_t addr, GByteArray *data, size_t len);
+
+/**
+ * qemu_plugin_write_memory_hwaddr() - write to memory using a hardware address
+ *
+ * @addr: A physical address to write to
+ * @data: A byte array containing the data to write
+ *
+ * The contents of @data will be written to memory starting at the hardware
+ * address @addr in the current address space for the current vCPU.
+ *
+ * This function does not guarantee consistency of writes, nor does it ensure
+ * that pending writes are flushed either before or after the write takes place,
+ * so callers should take care when calling this function in plugin callbacks to
+ * avoid depending on the existence of data written using this function which
+ * may be overwritten afterward. In addition, this function requires that the
+ * pages containing the address are not locked. Practically, this means that you
+ * should not write instruction memory in a current translation block inside a
+ * callback registered with qemu_plugin_register_vcpu_tb_trans_cb.
+ *
+ * You can, for example, write instruction memory in a current translation block
+ * in a callback registered with qemu_plugin_register_vcpu_tb_exec_cb, although
+ * be aware that the write will not be flushed until after the translation block
+ * has finished executing.  In general, this function should be used to write
+ * data memory or to patch code at a known address, not in a current translation
+ * block.
+ *
+ * This function is only valid for softmmu targets.
+ *
+ * Returns a qemu_plugin_hwaddr_operation_result indicating the result of the
+ * operation.
+ */
+QEMU_PLUGIN_API
+enum qemu_plugin_hwaddr_operation_result
+qemu_plugin_write_memory_hwaddr(uint64_t addr, GByteArray *data);
+
+/**
+ * qemu_plugin_translate_vaddr() - translate virtual address for current vCPU
+ *
+ * @vaddr: virtual address to translate
+ * @hwaddr: pointer to store the physical address
+ *
+ * This function is only valid in vCPU context (i.e. in callbacks) and is only
+ * valid for softmmu targets.
+ *
+ * Returns true on success and false on failure.
+ */
+QEMU_PLUGIN_API
+bool qemu_plugin_translate_vaddr(uint64_t vaddr, uint64_t *hwaddr);
+
 /**
  * qemu_plugin_scoreboard_new() - alloc a new scoreboard
  *
diff --git a/plugins/api.c b/plugins/api.c
index 1f64a9ea64..eac04cc1f6 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -39,6 +39,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/plugin.h"
 #include "qemu/log.h"
+#include "system/memory.h"
 #include "tcg/tcg.h"
 #include "exec/gdbstub.h"
 #include "exec/target_page.h"
@@ -494,6 +495,102 @@ bool qemu_plugin_write_memory_vaddr(uint64_t addr, GByteArray *data)
     return true;
 }
 
+enum qemu_plugin_hwaddr_operation_result
+qemu_plugin_read_memory_hwaddr(hwaddr addr, GByteArray *data, size_t len)
+{
+#ifdef CONFIG_SOFTMMU
+    if (len == 0) {
+        return QEMU_PLUGIN_HWADDR_OPERATION_ERROR;
+    }
+
+    g_assert(current_cpu);
+
+
+    int as_idx = cpu_asidx_from_attrs(current_cpu, MEMTXATTRS_UNSPECIFIED);
+    AddressSpace *as = cpu_get_address_space(current_cpu, as_idx);
+
+    if (as == NULL) {
+        return QEMU_PLUGIN_HWADDR_OPERATION_INVALID_ADDRESS_SPACE;
+    }
+
+    g_byte_array_set_size(data, len);
+    MemTxResult res = address_space_rw(as, addr,
+                                       MEMTXATTRS_UNSPECIFIED, data->data,
+                                       data->len, false);
+
+    switch (res) {
+    case MEMTX_OK:
+        return QEMU_PLUGIN_HWADDR_OPERATION_OK;
+    case MEMTX_ERROR:
+        return QEMU_PLUGIN_HWADDR_OPERATION_DEVICE_ERROR;
+    case MEMTX_DECODE_ERROR:
+        return QEMU_PLUGIN_HWADDR_OPERATION_INVALID_ADDRESS;
+    case MEMTX_ACCESS_ERROR:
+        return QEMU_PLUGIN_HWADDR_OPERATION_ACCESS_DENIED;
+    default:
+        return QEMU_PLUGIN_HWADDR_OPERATION_ERROR;
+    }
+#else
+    return QEMU_PLUGIN_HWADDR_OPERATION_ERROR;
+#endif
+}
+
+enum qemu_plugin_hwaddr_operation_result
+qemu_plugin_write_memory_hwaddr(hwaddr addr, GByteArray *data)
+{
+#ifdef CONFIG_SOFTMMU
+    if (data->len == 0) {
+        return QEMU_PLUGIN_HWADDR_OPERATION_ERROR;
+    }
+
+    g_assert(current_cpu);
+
+    int as_idx = cpu_asidx_from_attrs(current_cpu, MEMTXATTRS_UNSPECIFIED);
+    AddressSpace *as = cpu_get_address_space(current_cpu, as_idx);
+
+    if (as == NULL) {
+        return QEMU_PLUGIN_HWADDR_OPERATION_INVALID_ADDRESS_SPACE;
+    }
+
+    MemTxResult res = address_space_rw(as, addr,
+                                       MEMTXATTRS_UNSPECIFIED, data->data,
+                                       data->len, true);
+    switch (res) {
+    case MEMTX_OK:
+        return QEMU_PLUGIN_HWADDR_OPERATION_OK;
+    case MEMTX_ERROR:
+        return QEMU_PLUGIN_HWADDR_OPERATION_DEVICE_ERROR;
+    case MEMTX_DECODE_ERROR:
+        return QEMU_PLUGIN_HWADDR_OPERATION_INVALID_ADDRESS;
+    case MEMTX_ACCESS_ERROR:
+        return QEMU_PLUGIN_HWADDR_OPERATION_ACCESS_DENIED;
+    default:
+        return QEMU_PLUGIN_HWADDR_OPERATION_ERROR;
+    }
+#else
+    return QEMU_PLUGIN_HWADDR_OPERATION_ERROR;
+#endif
+}
+
+bool qemu_plugin_translate_vaddr(uint64_t vaddr, uint64_t *hwaddr)
+{
+#ifdef CONFIG_SOFTMMU
+    g_assert(current_cpu);
+
+    uint64_t res = cpu_get_phys_page_debug(current_cpu, vaddr);
+
+    if (res == (uint64_t)-1) {
+        return false;
+    }
+
+    *hwaddr = res | (vaddr & ~TARGET_PAGE_MASK);
+
+    return true;
+#else
+    return false;
+#endif
+}
+
 struct qemu_plugin_scoreboard *qemu_plugin_scoreboard_new(size_t element_size)
 {
     return plugin_scoreboard_new(element_size);
-- 
2.47.2
