Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp2732114lfc;
        Wed, 20 Nov 2019 16:09:28 -0800 (PST)
X-Received: by 2002:aca:cdd6:: with SMTP id d205mr5289747oig.9.1574294967903;
        Wed, 20 Nov 2019 16:09:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574294967; cv=none;
        d=google.com; s=arc-20160816;
        b=rd6Ma1kYwRvOyazHPFPl0qpr9QtZvL5GNoXTV+h5KBrzusp8pncuWSiBoplRFl14Ua
         Hy4oc14OP8/4mCmM//kBDhWLoeSXnz7iRA2DZMiCeTzo5CX0+ddnrFTAgeICWcc+2Adj
         lwPIU75iE4cj+TloM5d6byywXcaLk7ZGsXW4L+UPoixufOlgsRR5NhEu0MhZd+77JTr7
         ve5EyD1rddX4ry1a9e1KwB9jCgWHA12NczEiwpD5qpaVT3Weg1j0kGhfTjEk6Q0jbPly
         92Xr0dE8lK/WCDitOmD0YiT4/uDcL10IekURpaJHNJ+PIrdECVHdhLUBmpAPqc3oN875
         SNBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=UyIEBMa6z9micWDikfTpKjg+QEwcylKwntebI6UKvLE=;
        b=P4WB+RnbZhjRKAUcwGOOugzMxNPn9g9JQZ7iYW84gZ4lvEQZFp4vMcfDtCFpBugkiC
         8Md2t0v8xf0UHzg8PNAyFdwZXVvnY5IeIDucwTi11jf1cyYbs1gvgtqtXEAhz4vnth0M
         EM39e+ER99mfEY73bzKtEom36rXBnnHS3X9o9j5U6I6s7g0eSggAWJEEojs/QVKI8KWh
         HD+pE9Nc0zLmQQUZtqvHrGjVvdiMACY5w8jFXV2vDBo4iodxnVdlbtDKljNak+CxXvGt
         Pb8q6JJKa8EDBuYe8LA5MpxM5pC3ivtYcx7UvsQ+137bAhA/HC0QfUdQsLWAdJTjjmsm
         BvqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=grzm5RiA;
       spf=pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=beata.michalska@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <beata.michalska@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d5sor362585oij.70.2019.11.20.16.09.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 20 Nov 2019 16:09:27 -0800 (PST)
Received-SPF: pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=grzm5RiA;
       spf=pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=beata.michalska@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UyIEBMa6z9micWDikfTpKjg+QEwcylKwntebI6UKvLE=;
        b=grzm5RiApYJFWFKJHH7UXMZZ96U+atMUoaAx5W9pW3lppJAzHKtmdmuJpgZ/1aS3Gg
         /N3/Gpa0Wb+pg0w0rkWvZI8mpaJy0xlsw4gtpw8kZYUN0zPvN0jDXTMMKBNwblt5Il3m
         Mz0xSGL8GdWOZeG8/rd4uKbQ7EJEgZPq2qK7GsLw7W4uLX7AZfc3WoIFC8mYPWHNgE61
         NwPtTX2xQDN2qqaGnLeXUVLVYcH6pTc/ZQiiST04emWE/KbkQ0TazrkrzhfnrfrCfc96
         kaIiP3dg30osWS4N+deXydCCZVQwF/4FyIidtjT9b3e0wMA3SJgc2XwmuC8qNgB7bbSb
         I0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UyIEBMa6z9micWDikfTpKjg+QEwcylKwntebI6UKvLE=;
        b=jnRvER/XMpGVC0i2HfeTPWR7w+J9wLT0Y1gbdkBHnYXtPzDhf5sVMo209IElYwwTmI
         2QKiw91cCbO7bExY2t2aCLM8zFNQNVP/TX1x/IX6BY4IIzNReAiCJU1TUeg15k5Nax39
         +kAQY/HdS9bnF3YPra7F/YHufg2Ptm1MxE3LcCq51/sVVPhn3He18qeGAJL9iV1at4Ff
         eQL53ODippm9Ec9rgwStg8L2JbldUc3bsOvuu2AspRH8J2773gIJhFTeCtgwKY9dDQ9I
         dfOfpOFVKObEA7OGccemjsUwVgvjJhC2Tjd6bl3PDflQ5RAseTdOXuepHy20DOBp4RkP
         JR3g==
X-Gm-Message-State: APjAAAXaHzKJHl4jwYx/gkMZYIN5c9lJaKN3l475YuhLfhr/FrUBq2Qv
	uw2r4NuJiMzNZxv8tSTbg8LhxMGk
X-Google-Smtp-Source: APXvYqxrzvRfdNo/+ct3BsAjNHOag24AiC9UMlSXBuEGLcZKHOe1PEkTY5P+kQTmfNWXoyr2KiodnA==
X-Received: by 2002:aca:f4c6:: with SMTP id s189mr5247504oih.63.1574294967317;
        Wed, 20 Nov 2019 16:09:27 -0800 (PST)
Return-Path: <beata.michalska@linaro.org>
Received: from moi-limbo-9350.arm.com (host86-181-127-240.range86-181.btcentralplus.com. [86.181.127.240])
        by smtp.gmail.com with ESMTPSA id z17sm351439otk.40.2019.11.20.16.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 16:09:26 -0800 (PST)
From: Beata Michalska <beata.michalska@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	pbonzini@redhat.com,
	quintela@redhat.com,
	dgilbert@redhat.com,
	eric.auger@redhat.com,
	shameerali.kolothum.thodi@huawei.com
Subject: [PATCH v3 2/4] Memory: Enable writeback for given memory region
Date: Thu, 21 Nov 2019 00:08:41 +0000
Message-Id: <20191121000843.24844-3-beata.michalska@linaro.org>
In-Reply-To: <20191121000843.24844-1-beata.michalska@linaro.org>
References: <20191121000843.24844-1-beata.michalska@linaro.org>
X-TUID: vZFSzhZ0KaUn

Add an option to trigger memory writeback to sync given memory region
with the corresponding backing store, case one is available.
This extends the support for persistent memory, allowing syncing on-demand.

Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
---
 exec.c                  | 36 ++++++++++++++++++++++++++++++++++++
 include/exec/memory.h   |  6 ++++++
 include/exec/ram_addr.h |  8 ++++++++
 include/qemu/cutils.h   |  1 +
 memory.c                | 12 ++++++++++++
 util/cutils.c           | 38 ++++++++++++++++++++++++++++++++++++++
 6 files changed, 101 insertions(+)

diff --git a/exec.c b/exec.c
index ffdb518..a34c348 100644
--- a/exec.c
+++ b/exec.c
@@ -65,6 +65,8 @@
 #include "exec/ram_addr.h"
 #include "exec/log.h"
 
+#include "qemu/pmem.h"
+
 #include "migration/vmstate.h"
 
 #include "qemu/range.h"
@@ -2156,6 +2158,40 @@ int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp)
     return 0;
 }
 
+/*
+ * Trigger sync on the given ram block for range [start, start + length]
+ * with the backing store if one is available.
+ * Otherwise no-op.
+ * @Note: this is supposed to be a synchronous op.
+ */
+void qemu_ram_writeback(RAMBlock *block, ram_addr_t start, ram_addr_t length)
+{
+    void *addr = ramblock_ptr(block, start);
+
+    /* The requested range should fit in within the block range */
+    g_assert((start + length) <= block->used_length);
+
+#ifdef CONFIG_LIBPMEM
+    /* The lack of support for pmem should not block the sync */
+    if (ramblock_is_pmem(block)) {
+        pmem_persist(addr, length);
+        return;
+    }
+#endif
+    if (block->fd >= 0) {
+        /**
+         * Case there is no support for PMEM or the memory has not been
+         * specified as persistent (or is not one) - use the msync.
+         * Less optimal but still achieves the same goal
+         */
+        if (qemu_msync(addr, length, block->fd)) {
+            warn_report("%s: failed to sync memory range: start: "
+                    RAM_ADDR_FMT " length: " RAM_ADDR_FMT,
+                    __func__, start, length);
+        }
+    }
+}
+
 /* Called with ram_list.mutex held */
 static void dirty_memory_extend(ram_addr_t old_ram_size,
                                 ram_addr_t new_ram_size)
diff --git a/include/exec/memory.h b/include/exec/memory.h
index e499dc2..27a84e0 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1265,6 +1265,12 @@ void *memory_region_get_ram_ptr(MemoryRegion *mr);
  */
 void memory_region_ram_resize(MemoryRegion *mr, ram_addr_t newsize,
                               Error **errp);
+/**
+ * memory_region_do_writeback: Trigger writeback for selected address range
+ * [addr, addr + size]
+ *
+ */
+void memory_region_do_writeback(MemoryRegion *mr, hwaddr addr, hwaddr size);
 
 /**
  * memory_region_set_log: Turn dirty logging on or off for a region.
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index bed0554..5adebb0 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -174,6 +174,14 @@ void qemu_ram_free(RAMBlock *block);
 
 int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp);
 
+void qemu_ram_writeback(RAMBlock *block, ram_addr_t start, ram_addr_t length);
+
+/* Clear whole block of mem */
+static inline void qemu_ram_block_writeback(RAMBlock *block)
+{
+    qemu_ram_writeback(block, 0, block->used_length);
+}
+
 #define DIRTY_CLIENTS_ALL     ((1 << DIRTY_MEMORY_NUM) - 1)
 #define DIRTY_CLIENTS_NOCODE  (DIRTY_CLIENTS_ALL & ~(1 << DIRTY_MEMORY_CODE))
 
diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index b54c847..eb59852 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -130,6 +130,7 @@ const char *qemu_strchrnul(const char *s, int c);
 #endif
 time_t mktimegm(struct tm *tm);
 int qemu_fdatasync(int fd);
+int qemu_msync(void *addr, size_t length, int fd);
 int fcntl_setfl(int fd, int flag);
 int qemu_parse_fd(const char *param);
 int qemu_strtoi(const char *nptr, const char **endptr, int base,
diff --git a/memory.c b/memory.c
index 06484c2..0228cad 100644
--- a/memory.c
+++ b/memory.c
@@ -2207,6 +2207,18 @@ void memory_region_ram_resize(MemoryRegion *mr, ram_addr_t newsize, Error **errp
     qemu_ram_resize(mr->ram_block, newsize, errp);
 }
 
+
+void memory_region_do_writeback(MemoryRegion *mr, hwaddr addr, hwaddr size)
+{
+    /*
+     * Might be extended case needed to cover
+     * different types of memory regions
+     */
+    if (mr->ram_block && mr->dirty_log_mask) {
+        qemu_ram_writeback(mr->ram_block, addr, size);
+    }
+}
+
 /*
  * Call proper memory listeners about the change on the newly
  * added/removed CoalescedMemoryRange.
diff --git a/util/cutils.c b/util/cutils.c
index fd591ca..c76ed88 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -164,6 +164,44 @@ int qemu_fdatasync(int fd)
 #endif
 }
 
+/**
+ * Sync changes made to the memory mapped file back to the backing
+ * storage. For POSIX compliant systems this will fallback
+ * to regular msync call. Otherwise it will trigger whole file sync
+ * (including the metadata case there is no support to skip that otherwise)
+ *
+ * @addr   - start of the memory area to be synced
+ * @length - length of the are to be synced
+ * @fd     - file descriptor for the file to be synced
+ *           (mandatory only for POSIX non-compliant systems)
+ */
+int qemu_msync(void *addr, size_t length, int fd)
+{
+#ifdef CONFIG_POSIX
+    size_t align_mask = ~(qemu_real_host_page_size - 1);
+
+    /**
+     * There are no strict reqs as per the length of mapping
+     * to be synced. Still the length needs to follow the address
+     * alignment changes. Additionally - round the size to the multiple
+     * of PAGE_SIZE
+     */
+    length += ((uintptr_t)addr & (qemu_real_host_page_size - 1));
+    length = (length + ~align_mask) & align_mask;
+
+    addr = (void *)((uintptr_t)addr & align_mask);
+
+    return msync(addr, length, MS_SYNC);
+#else /* CONFIG_POSIX */
+    /**
+     * Perform the sync based on the file descriptor
+     * The sync range will most probably be wider than the one
+     * requested - but it will still get the job done
+     */
+    return qemu_fdatasync(fd);
+#endif /* CONFIG_POSIX */
+}
+
 #ifndef _WIN32
 /* Sets a specific flag */
 int fcntl_setfl(int fd, int flag)
-- 
2.7.4
