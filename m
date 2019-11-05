Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp29774wri;
        Tue, 5 Nov 2019 15:41:43 -0800 (PST)
X-Received: by 2002:adf:fd0b:: with SMTP id e11mr622740wrr.141.1572997303058;
        Tue, 05 Nov 2019 15:41:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572997303; cv=none;
        d=google.com; s=arc-20160816;
        b=AQT0xv/tHBLe6xPVEykMaeHNtqSje8kKtxT02rPAjyffSjjlxptkANiNRN7iA19BVK
         jGWySoaUNpAUEiuK2E6+lWXEEFHejVIXNh8H66EEBgtU21cRTG+OfIWdPiVlC/ulPN6p
         gg+cNWEhs8LHshk++hU8xwsDWT0UKU1U4mvEISG0TwNyiJ+saerTl7elqRAaX0hyWc5j
         2Unrpe8JQpUEJTILkBhE6eVKkpjj/I/hwRCVRPAAuNFHUjDiS4Rx2VFde2rxmnvhS0DC
         fLPg+YZNp5Ck6y04apfnzgstIbcDU/No5922nIEMSU2pphUmPSEBY5+Bd06M2oN/5ags
         CYig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=Sy5cjMuouBWQH2G8fTg0cVy6rCUVCOD5IYH6fYB1xWE=;
        b=1FoLJ67aG9qTJHoPiH0TqfN6JCno6k5HNcLKAI2rtmqwLQiNiinHfAwVIt5q+XDcls
         MxAbqKj7jIV2SuNELKi+/v40vVD9b2wW90hj0jrdCLYQTuhkBl/84R9FkhlTP0TqdFJU
         Pk3lyAbMQp2yNd3Xfav+ObBX4dY+SZbNcPXPDgO3pkD7tXtk/jVCWgGBCiZmH9j0foRf
         xRW3AMVLGnLFLBVStHr+pzxCxbNAIUypdIXswSzwcZcCZ830UXWedB3FFlFO8g5vh6WG
         XQTyYHmMDS4V9ficsNf86uoPxcYgcEE8jTVhrs9hU+KkXmYx9+5euoewyvNH+QGV1jEw
         h0JQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uUPeAAFW;
       spf=pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=beata.michalska@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <beata.michalska@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v22sor597058wmj.24.2019.11.05.15.41.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 05 Nov 2019 15:41:43 -0800 (PST)
Received-SPF: pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uUPeAAFW;
       spf=pass (google.com: domain of beata.michalska@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=beata.michalska@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Sy5cjMuouBWQH2G8fTg0cVy6rCUVCOD5IYH6fYB1xWE=;
        b=uUPeAAFWpsQVgDgX9zK629s/MRIZYqBMA0FkLiJ+dStO1CsqkRMZDjT5RjUrxtr7UM
         wEu1502lhzwyB0p0X39wmN1PL4v58XvjhzGF/n1yD4edCwvXmuQuxVzN/uabeWa8hVMA
         H02fxKdt5547GpIbXOdfQF1u+SPzdTIENnkrFdIpXVBKtKXCCbdwtCkaocUiLsNqeWdW
         XZ6enM+vKC11nJta6W4iZsL1KS0IfjH/M6rfP8JVImloT+0oPCxmQ+Duz59oeuaAvbZ9
         7pBzvWbx0rnPRFJm9er3B/ArQxP1yujQxvYDOl8FLaUL4+qbSfzH+wkD+Dba0cJlSr/K
         GbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Sy5cjMuouBWQH2G8fTg0cVy6rCUVCOD5IYH6fYB1xWE=;
        b=p4YRK36ffkZgRpid4FF5UeXnEu3LrWsrHFlO10xoGypnXNnqyzP71VIyGYbdHWPHcR
         tXuTJAT2NLKvNw9PvNxDWPRzGRD5q78EjvTg8DcCWcL7T4ZLHH5oIU2iNhL5/2bn4TgF
         /hPEtfsX9KEOaXgOj67aazPcIO4/JVDB5Jl0Xzw/Y3UPmwlmi90OECiDkeaW/59Ha+07
         3VKsrc1A+tyh33mtbDoEoyOKEj+CcUV3P4jg021hrBe4QT11F6vLG4OzdxAVPe/Nqmgy
         gw+hDAyRgcTXtTdi4bcPmMVhB1nHkuzh74EVQ9qSy3GdG+GCn5mc0iO3lm9KgNfcOZms
         tWgw==
X-Gm-Message-State: APjAAAUG0OtfqFe5iTKtjMFFPjlXZ/M4ko6KC2um306YGEGdMrWVFUSu
	CJfPQNJLyYND1IpB9LBDWsM90n8f
X-Google-Smtp-Source: APXvYqy4a1ZnKMeH/iJh6Aqh/1SQt4byy5bsJhpPafnwYqoagdkX6GmiD+8k/u0Psncw1+fwkQWDcw==
X-Received: by 2002:a1c:558a:: with SMTP id j132mr1251077wmb.21.1572997302646;
        Tue, 05 Nov 2019 15:41:42 -0800 (PST)
Return-Path: <beata.michalska@linaro.org>
Received: from moi-limbo-9350.home (host86-144-13-94.range86-144.btcentralplus.com. [86.144.13.94])
        by smtp.gmail.com with ESMTPSA id q25sm27295010wra.3.2019.11.05.15.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 15:41:42 -0800 (PST)
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
Subject: [PATCH v2 2/4] Memory: Enable writeback for given memory region
Date: Tue,  5 Nov 2019 23:40:58 +0000
Message-Id: <20191105234100.22052-3-beata.michalska@linaro.org>
In-Reply-To: <20191105234100.22052-1-beata.michalska@linaro.org>
References: <20191105234100.22052-1-beata.michalska@linaro.org>
X-TUID: qjW0Pqd1upfS

Add an option to trigger memory writeback to sync given memory region
with the corresponding backing store, case one is available.
This extends the support for persistent memory, allowing syncing on-demand.

Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
---
 exec.c                  | 43 +++++++++++++++++++++++++++++++++++++++++++
 include/exec/memory.h   |  6 ++++++
 include/exec/ram_addr.h |  8 ++++++++
 include/qemu/cutils.h   |  1 +
 memory.c                | 12 ++++++++++++
 util/cutils.c           | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 117 insertions(+)

diff --git a/exec.c b/exec.c
index ffdb518..e1f06de 100644
--- a/exec.c
+++ b/exec.c
@@ -65,6 +65,8 @@
 #include "exec/ram_addr.h"
 #include "exec/log.h"
 
+#include "qemu/pmem.h"
+
 #include "migration/vmstate.h"
 
 #include "qemu/range.h"
@@ -2156,6 +2158,47 @@ int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp)
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
+    /*
+     * The requested range might spread up to the very end of the block
+     */
+    if ((start + length) > block->used_length) {
+        qemu_log("%s: sync range outside the block boundaries: "
+                     "start: " RAM_ADDR_FMT " length: " RAM_ADDR_FMT
+                     " block length: " RAM_ADDR_FMT " Narrowing down ..." ,
+                     __func__, start, length, block->used_length);
+        length = block->used_length - start;
+    }
+
+#ifdef CONFIG_LIBPMEM
+    /* The lack of support for pmem should not block the sync */
+    if (ramblock_is_pmem(block)) {
+        pmem_persist(addr, length);
+    } else
+#endif
+    if (block->fd >= 0) {
+        /**
+         * Case there is no support for PMEM or the memory has not been
+         * specified as persistent (or is not one) - use the msync.
+         * Less optimal but still achieves the same goal
+         */
+        if (qemu_msync(addr, length, qemu_host_page_size, block->fd)) {
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
index b54c847..41c5fa9 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -130,6 +130,7 @@ const char *qemu_strchrnul(const char *s, int c);
 #endif
 time_t mktimegm(struct tm *tm);
 int qemu_fdatasync(int fd);
+int qemu_msync(void *addr, size_t length, size_t alignment, int fd);
 int fcntl_setfl(int fd, int flag);
 int qemu_parse_fd(const char *param);
 int qemu_strtoi(const char *nptr, const char **endptr, int base,
diff --git a/memory.c b/memory.c
index c952eab..15734a0 100644
--- a/memory.c
+++ b/memory.c
@@ -2214,6 +2214,18 @@ void memory_region_ram_resize(MemoryRegion *mr, ram_addr_t newsize, Error **errp
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
index fd591ca..7a50dbc 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -164,6 +164,53 @@ int qemu_fdatasync(int fd)
 #endif
 }
 
+/**
+ * Sync changes made to the memory mapped file back to the backing
+ * storage. For POSIX compliant systems this will simply fallback
+ * to regular msync call (thus the required alignment). Otherwise
+ * it will trigger whole file sync (including the metadata case
+ * there is no support to skip that otherwise)
+ *
+ * @addr   - start of the memory area to be synced
+ * @length - length of the are to be synced
+ * @align  - alignment (expected to be PAGE_SIZE)
+ * @fd     - file descriptor for the file to be synced
+ *           (mandatory only for POSIX non-compliant systems)
+ */
+int qemu_msync(void *addr, size_t length, size_t align, int fd)
+{
+#ifdef CONFIG_POSIX
+    size_t align_mask;
+
+    /* Bare minimum of sanity checks on the alignment */
+    /* The start address needs to be a multiple of PAGE_SIZE */
+    align = MAX(align, qemu_real_host_page_size);
+    align_mask = ~(qemu_real_host_page_size - 1);
+    align = (align + ~align_mask) & align_mask;
+
+    align_mask = ~(align - 1);
+    /**
+     * There are no strict reqs as per the length of mapping
+     * to be synced. Still the length needs to follow the address
+     * alignment changes. Additionally - round the size to the multiple
+     * of requested alignment (expected as PAGE_SIZE)
+     */
+    length += ((uintptr_t)addr & (align - 1));
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
