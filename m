Received: by 10.25.159.19 with SMTP id i19csp102903lfe;
        Mon, 11 Jan 2016 11:58:27 -0800 (PST)
X-Received: by 10.140.247.67 with SMTP id s64mr177185481qhc.20.1452542307152;
        Mon, 11 Jan 2016 11:58:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p59si108569538qge.124.2016.01.11.11.58.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jan 2016 11:58:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56631 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aIibi-0006fe-OH
	for alex.bennee@linaro.org; Mon, 11 Jan 2016 14:58:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aIia4-0003CR-OO
	for qemu-arm@nongnu.org; Mon, 11 Jan 2016 14:56:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aIia2-0002sP-Dz
	for qemu-arm@nongnu.org; Mon, 11 Jan 2016 14:56:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53619)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1aIia2-0002sD-4A; Mon, 11 Jan 2016 14:56:42 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id A42948EA37;
	Mon, 11 Jan 2016 19:56:41 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-158.brq.redhat.com [10.34.1.158])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u0BJuU1k012743; Mon, 11 Jan 2016 14:56:39 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 11 Jan 2016 20:56:20 +0100
Message-Id: <1452542185-10914-4-git-send-email-drjones@redhat.com>
In-Reply-To: <1452542185-10914-1-git-send-email-drjones@redhat.com>
References: <1452542185-10914-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, agraf@suse.de, armbru@redhat.com,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, eblake@redhat.com,
	afaerber@suse.de, rth@twiddle.net
Subject: [Qemu-arm] [PATCH v4 3/8] dump: allow target to set the page size
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JHYZMgy9rVKh

This is necessary for targets that don't have TARGET_PAGE_SIZE ==
real-target-page-size. The target should set the page size to the
correct one, if known, or, if not known, to the maximum page size
it supports.

(No functional change.)

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 dump.c                     | 127 ++++++++++++++++++++++++++++-----------------
 include/sysemu/dump-arch.h |   8 +--
 include/sysemu/dump.h      |  10 +---
 3 files changed, 85 insertions(+), 60 deletions(-)

diff --git a/dump.c b/dump.c
index 78b7d843ceb29..e1d9bae9e89d1 100644
--- a/dump.c
+++ b/dump.c
@@ -347,18 +347,18 @@ static void write_memory(DumpState *s, GuestPhysBlock *block, ram_addr_t start,
     int64_t i;
     Error *local_err = NULL;
 
-    for (i = 0; i < size / TARGET_PAGE_SIZE; i++) {
-        write_data(s, block->host_addr + start + i * TARGET_PAGE_SIZE,
-                   TARGET_PAGE_SIZE, &local_err);
+    for (i = 0; i < size / s->dump_info.page_size; i++) {
+        write_data(s, block->host_addr + start + i * s->dump_info.page_size,
+                   s->dump_info.page_size, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             return;
         }
     }
 
-    if ((size % TARGET_PAGE_SIZE) != 0) {
-        write_data(s, block->host_addr + start + i * TARGET_PAGE_SIZE,
-                   size % TARGET_PAGE_SIZE, &local_err);
+    if ((size % s->dump_info.page_size) != 0) {
+        write_data(s, block->host_addr + start + i * s->dump_info.page_size,
+                   size % s->dump_info.page_size, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             return;
@@ -737,7 +737,7 @@ static void create_header32(DumpState *s, Error **errp)
 
     strncpy(dh->signature, KDUMP_SIGNATURE, strlen(KDUMP_SIGNATURE));
     dh->header_version = cpu_to_dump32(s, 6);
-    block_size = TARGET_PAGE_SIZE;
+    block_size = s->dump_info.page_size;
     dh->block_size = cpu_to_dump32(s, block_size);
     sub_hdr_size = sizeof(struct KdumpSubHeader32) + s->note_size;
     sub_hdr_size = DIV_ROUND_UP(sub_hdr_size, block_size);
@@ -837,7 +837,7 @@ static void create_header64(DumpState *s, Error **errp)
 
     strncpy(dh->signature, KDUMP_SIGNATURE, strlen(KDUMP_SIGNATURE));
     dh->header_version = cpu_to_dump32(s, 6);
-    block_size = TARGET_PAGE_SIZE;
+    block_size = s->dump_info.page_size;
     dh->block_size = cpu_to_dump32(s, block_size);
     sub_hdr_size = sizeof(struct KdumpSubHeader64) + s->note_size;
     sub_hdr_size = DIV_ROUND_UP(sub_hdr_size, block_size);
@@ -933,6 +933,11 @@ static void write_dump_header(DumpState *s, Error **errp)
     }
 }
 
+static size_t dump_bitmap_get_bufsize(DumpState *s)
+{
+    return s->dump_info.page_size;
+}
+
 /*
  * set dump_bitmap sequencely. the bit before last_pfn is not allowed to be
  * rewritten, so if need to set the first bit, set last_pfn and pfn to 0.
@@ -946,6 +951,8 @@ static int set_dump_bitmap(uint64_t last_pfn, uint64_t pfn, bool value,
     off_t old_offset, new_offset;
     off_t offset_bitmap1, offset_bitmap2;
     uint32_t byte, bit;
+    size_t bitmap_bufsize = dump_bitmap_get_bufsize(s);
+    size_t bits_per_buf = bitmap_bufsize * CHAR_BIT;
 
     /* should not set the previous place */
     assert(last_pfn <= pfn);
@@ -956,14 +963,14 @@ static int set_dump_bitmap(uint64_t last_pfn, uint64_t pfn, bool value,
      * making new_offset be bigger than old_offset can also sync remained data
      * into vmcore.
      */
-    old_offset = BUFSIZE_BITMAP * (last_pfn / PFN_BUFBITMAP);
-    new_offset = BUFSIZE_BITMAP * (pfn / PFN_BUFBITMAP);
+    old_offset = bitmap_bufsize * (last_pfn / bits_per_buf);
+    new_offset = bitmap_bufsize * (pfn / bits_per_buf);
 
     while (old_offset < new_offset) {
         /* calculate the offset and write dump_bitmap */
         offset_bitmap1 = s->offset_dump_bitmap + old_offset;
         if (write_buffer(s->fd, offset_bitmap1, buf,
-                         BUFSIZE_BITMAP) < 0) {
+                         bitmap_bufsize) < 0) {
             return -1;
         }
 
@@ -971,17 +978,17 @@ static int set_dump_bitmap(uint64_t last_pfn, uint64_t pfn, bool value,
         offset_bitmap2 = s->offset_dump_bitmap + s->len_dump_bitmap +
                          old_offset;
         if (write_buffer(s->fd, offset_bitmap2, buf,
-                         BUFSIZE_BITMAP) < 0) {
+                         bitmap_bufsize) < 0) {
             return -1;
         }
 
-        memset(buf, 0, BUFSIZE_BITMAP);
-        old_offset += BUFSIZE_BITMAP;
+        memset(buf, 0, bitmap_bufsize);
+        old_offset += bitmap_bufsize;
     }
 
     /* get the exact place of the bit in the buf, and set it */
-    byte = (pfn % PFN_BUFBITMAP) / CHAR_BIT;
-    bit = (pfn % PFN_BUFBITMAP) % CHAR_BIT;
+    byte = (pfn % bits_per_buf) / CHAR_BIT;
+    bit = (pfn % bits_per_buf) % CHAR_BIT;
     if (value) {
         buf[byte] |= 1u << bit;
     } else {
@@ -991,6 +998,20 @@ static int set_dump_bitmap(uint64_t last_pfn, uint64_t pfn, bool value,
     return 0;
 }
 
+static uint64_t dump_paddr_to_pfn(DumpState *s, uint64_t addr)
+{
+    int target_page_shift = ctz32(s->dump_info.page_size);
+
+    return (addr >> target_page_shift) - ARCH_PFN_OFFSET;
+}
+
+static uint64_t dump_pfn_to_paddr(DumpState *s, uint64_t pfn)
+{
+    int target_page_shift = ctz32(s->dump_info.page_size);
+
+    return (pfn + ARCH_PFN_OFFSET) << target_page_shift;
+}
+
 /*
  * exam every page and return the page frame number and the address of the page.
  * bufptr can be NULL. note: the blocks here is supposed to reflect guest-phys
@@ -1001,16 +1022,16 @@ static bool get_next_page(GuestPhysBlock **blockptr, uint64_t *pfnptr,
                           uint8_t **bufptr, DumpState *s)
 {
     GuestPhysBlock *block = *blockptr;
-    hwaddr addr;
+    hwaddr addr, target_page_mask = ~((hwaddr)s->dump_info.page_size - 1);
     uint8_t *buf;
 
     /* block == NULL means the start of the iteration */
     if (!block) {
         block = QTAILQ_FIRST(&s->guest_phys_blocks.head);
         *blockptr = block;
-        assert((block->target_start & ~TARGET_PAGE_MASK) == 0);
-        assert((block->target_end & ~TARGET_PAGE_MASK) == 0);
-        *pfnptr = paddr_to_pfn(block->target_start);
+        assert((block->target_start & ~target_page_mask) == 0);
+        assert((block->target_end & ~target_page_mask) == 0);
+        *pfnptr = dump_paddr_to_pfn(s, block->target_start);
         if (bufptr) {
             *bufptr = block->host_addr;
         }
@@ -1018,10 +1039,10 @@ static bool get_next_page(GuestPhysBlock **blockptr, uint64_t *pfnptr,
     }
 
     *pfnptr = *pfnptr + 1;
-    addr = pfn_to_paddr(*pfnptr);
+    addr = dump_pfn_to_paddr(s, *pfnptr);
 
     if ((addr >= block->target_start) &&
-        (addr + TARGET_PAGE_SIZE <= block->target_end)) {
+        (addr + s->dump_info.page_size <= block->target_end)) {
         buf = block->host_addr + (addr - block->target_start);
     } else {
         /* the next page is in the next block */
@@ -1030,9 +1051,9 @@ static bool get_next_page(GuestPhysBlock **blockptr, uint64_t *pfnptr,
         if (!block) {
             return false;
         }
-        assert((block->target_start & ~TARGET_PAGE_MASK) == 0);
-        assert((block->target_end & ~TARGET_PAGE_MASK) == 0);
-        *pfnptr = paddr_to_pfn(block->target_start);
+        assert((block->target_start & ~target_page_mask) == 0);
+        assert((block->target_end & ~target_page_mask) == 0);
+        *pfnptr = dump_paddr_to_pfn(s, block->target_start);
         buf = block->host_addr;
     }
 
@@ -1050,9 +1071,11 @@ static void write_dump_bitmap(DumpState *s, Error **errp)
     void *dump_bitmap_buf;
     size_t num_dumpable;
     GuestPhysBlock *block_iter = NULL;
+    size_t bitmap_bufsize = dump_bitmap_get_bufsize(s);
+    size_t bits_per_buf = bitmap_bufsize * CHAR_BIT;
 
     /* dump_bitmap_buf is used to store dump_bitmap temporarily */
-    dump_bitmap_buf = g_malloc0(BUFSIZE_BITMAP);
+    dump_bitmap_buf = g_malloc0(bitmap_bufsize);
 
     num_dumpable = 0;
     last_pfn = 0;
@@ -1074,11 +1097,11 @@ static void write_dump_bitmap(DumpState *s, Error **errp)
 
     /*
      * set_dump_bitmap will always leave the recently set bit un-sync. Here we
-     * set last_pfn + PFN_BUFBITMAP to 0 and those set but un-sync bit will be
-     * synchronized into vmcore.
+     * set the remaining bits from last_pfn to the end of the bitmap buffer to
+     * 0. With those set, the un-sync bit will be synchronized into the vmcore.
      */
     if (num_dumpable > 0) {
-        ret = set_dump_bitmap(last_pfn, last_pfn + PFN_BUFBITMAP, false,
+        ret = set_dump_bitmap(last_pfn, last_pfn + bits_per_buf, false,
                               dump_bitmap_buf, s);
         if (ret < 0) {
             dump_error(s, "dump: failed to sync dump_bitmap", errp);
@@ -1098,8 +1121,8 @@ static void prepare_data_cache(DataCache *data_cache, DumpState *s,
 {
     data_cache->fd = s->fd;
     data_cache->data_size = 0;
-    data_cache->buf_size = BUFSIZE_DATA_CACHE;
-    data_cache->buf = g_malloc0(BUFSIZE_DATA_CACHE);
+    data_cache->buf_size = 4 * dump_bitmap_get_bufsize(s);
+    data_cache->buf = g_malloc0(data_cache->buf_size);
     data_cache->offset = offset;
 }
 
@@ -1193,7 +1216,7 @@ static void write_dump_pages(DumpState *s, Error **errp)
     prepare_data_cache(&page_data, s, offset_data);
 
     /* prepare buffer to store compressed data */
-    len_buf_out = get_len_buf_out(TARGET_PAGE_SIZE, s->flag_compress);
+    len_buf_out = get_len_buf_out(s->dump_info.page_size, s->flag_compress);
     assert(len_buf_out != 0);
 
 #ifdef CONFIG_LZO
@@ -1206,19 +1229,19 @@ static void write_dump_pages(DumpState *s, Error **errp)
      * init zero page's page_desc and page_data, because every zero page
      * uses the same page_data
      */
-    pd_zero.size = cpu_to_dump32(s, TARGET_PAGE_SIZE);
+    pd_zero.size = cpu_to_dump32(s, s->dump_info.page_size);
     pd_zero.flags = cpu_to_dump32(s, 0);
     pd_zero.offset = cpu_to_dump64(s, offset_data);
     pd_zero.page_flags = cpu_to_dump64(s, 0);
-    buf = g_malloc0(TARGET_PAGE_SIZE);
-    ret = write_cache(&page_data, buf, TARGET_PAGE_SIZE, false);
+    buf = g_malloc0(s->dump_info.page_size);
+    ret = write_cache(&page_data, buf, s->dump_info.page_size, false);
     g_free(buf);
     if (ret < 0) {
         dump_error(s, "dump: failed to write page data (zero page)", errp);
         goto out;
     }
 
-    offset_data += TARGET_PAGE_SIZE;
+    offset_data += s->dump_info.page_size;
 
     /*
      * dump memory to vmcore page by page. zero page will all be resided in the
@@ -1226,7 +1249,7 @@ static void write_dump_pages(DumpState *s, Error **errp)
      */
     while (get_next_page(&block_iter, &pfn_iter, &buf, s)) {
         /* check zero page */
-        if (is_zero_page(buf, TARGET_PAGE_SIZE)) {
+        if (is_zero_page(buf, s->dump_info.page_size)) {
             ret = write_cache(&page_desc, &pd_zero, sizeof(PageDescriptor),
                               false);
             if (ret < 0) {
@@ -1248,8 +1271,8 @@ static void write_dump_pages(DumpState *s, Error **errp)
              size_out = len_buf_out;
              if ((s->flag_compress & DUMP_DH_COMPRESSED_ZLIB) &&
                     (compress2(buf_out, (uLongf *)&size_out, buf,
-                               TARGET_PAGE_SIZE, Z_BEST_SPEED) == Z_OK) &&
-                    (size_out < TARGET_PAGE_SIZE)) {
+                               s->dump_info.page_size, Z_BEST_SPEED) == Z_OK) &&
+                    (size_out < s->dump_info.page_size)) {
                 pd.flags = cpu_to_dump32(s, DUMP_DH_COMPRESSED_ZLIB);
                 pd.size  = cpu_to_dump32(s, size_out);
 
@@ -1260,9 +1283,9 @@ static void write_dump_pages(DumpState *s, Error **errp)
                 }
 #ifdef CONFIG_LZO
             } else if ((s->flag_compress & DUMP_DH_COMPRESSED_LZO) &&
-                    (lzo1x_1_compress(buf, TARGET_PAGE_SIZE, buf_out,
+                    (lzo1x_1_compress(buf, s->dump_info.page_size, buf_out,
                     (lzo_uint *)&size_out, wrkmem) == LZO_E_OK) &&
-                    (size_out < TARGET_PAGE_SIZE)) {
+                    (size_out < s->dump_info.page_size)) {
                 pd.flags = cpu_to_dump32(s, DUMP_DH_COMPRESSED_LZO);
                 pd.size  = cpu_to_dump32(s, size_out);
 
@@ -1274,9 +1297,9 @@ static void write_dump_pages(DumpState *s, Error **errp)
 #endif
 #ifdef CONFIG_SNAPPY
             } else if ((s->flag_compress & DUMP_DH_COMPRESSED_SNAPPY) &&
-                    (snappy_compress((char *)buf, TARGET_PAGE_SIZE,
+                    (snappy_compress((char *)buf, s->dump_info.page_size,
                     (char *)buf_out, &size_out) == SNAPPY_OK) &&
-                    (size_out < TARGET_PAGE_SIZE)) {
+                    (size_out < s->dump_info.page_size)) {
                 pd.flags = cpu_to_dump32(s, DUMP_DH_COMPRESSED_SNAPPY);
                 pd.size  = cpu_to_dump32(s, size_out);
 
@@ -1289,13 +1312,14 @@ static void write_dump_pages(DumpState *s, Error **errp)
             } else {
                 /*
                  * fall back to save in plaintext, size_out should be
-                 * assigned TARGET_PAGE_SIZE
+                 * assigned the target's page size
                  */
                 pd.flags = cpu_to_dump32(s, 0);
-                size_out = TARGET_PAGE_SIZE;
+                size_out = s->dump_info.page_size;
                 pd.size = cpu_to_dump32(s, size_out);
 
-                ret = write_cache(&page_data, buf, TARGET_PAGE_SIZE, false);
+                ret = write_cache(&page_data, buf,
+                                  s->dump_info.page_size, false);
                 if (ret < 0) {
                     dump_error(s, "dump: failed to write page data", errp);
                     goto out;
@@ -1430,7 +1454,7 @@ static void get_max_mapnr(DumpState *s)
     GuestPhysBlock *last_block;
 
     last_block = QTAILQ_LAST(&s->guest_phys_blocks.head, GuestPhysBlockHead);
-    s->max_mapnr = paddr_to_pfn(last_block->target_end);
+    s->max_mapnr = dump_paddr_to_pfn(s, last_block->target_end);
 }
 
 static void dump_init(DumpState *s, int fd, bool has_format,
@@ -1489,6 +1513,10 @@ static void dump_init(DumpState *s, int fd, bool has_format,
         goto cleanup;
     }
 
+    if (!s->dump_info.page_size) {
+        s->dump_info.page_size = TARGET_PAGE_SIZE;
+    }
+
     s->note_size = cpu_get_note_size(s->dump_info.d_class,
                                      s->dump_info.d_machine, nr_cpus);
     if (s->note_size < 0) {
@@ -1512,8 +1540,9 @@ static void dump_init(DumpState *s, int fd, bool has_format,
     get_max_mapnr(s);
 
     uint64_t tmp;
-    tmp = DIV_ROUND_UP(DIV_ROUND_UP(s->max_mapnr, CHAR_BIT), TARGET_PAGE_SIZE);
-    s->len_dump_bitmap = tmp * TARGET_PAGE_SIZE;
+    tmp = DIV_ROUND_UP(DIV_ROUND_UP(s->max_mapnr, CHAR_BIT),
+                       s->dump_info.page_size);
+    s->len_dump_bitmap = tmp * s->dump_info.page_size;
 
     /* init for kdump-compressed format */
     if (has_format && format != DUMP_GUEST_MEMORY_FORMAT_ELF) {
diff --git a/include/sysemu/dump-arch.h b/include/sysemu/dump-arch.h
index 9c95cede3d3b7..43358396ea81a 100644
--- a/include/sysemu/dump-arch.h
+++ b/include/sysemu/dump-arch.h
@@ -15,9 +15,11 @@
 #define DUMP_ARCH_H
 
 typedef struct ArchDumpInfo {
-    int d_machine;  /* Architecture */
-    int d_endian;   /* ELFDATA2LSB or ELFDATA2MSB */
-    int d_class;    /* ELFCLASS32 or ELFCLASS64 */
+    int d_machine;           /* Architecture */
+    int d_endian;            /* ELFDATA2LSB or ELFDATA2MSB */
+    int d_class;             /* ELFCLASS32 or ELFCLASS64 */
+    uint32_t page_size;      /* The target's page size. If it's variable and
+                              * unknown, then this should be the maximum. */
 } ArchDumpInfo;
 
 struct GuestPhysBlockList; /* memory_mapping.h */
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index 7e4ec5c7d96fb..16cbd8d881fd6 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -20,12 +20,9 @@
 #define VERSION_FLAT_HEADER         (1)    /* version of flattened format */
 #define END_FLAG_FLAT_HEADER        (-1)
 
+#ifndef ARCH_PFN_OFFSET
 #define ARCH_PFN_OFFSET             (0)
-
-#define paddr_to_pfn(X) \
-    (((unsigned long long)(X) >> TARGET_PAGE_BITS) - ARCH_PFN_OFFSET)
-#define pfn_to_paddr(X) \
-    (((unsigned long long)(X) + ARCH_PFN_OFFSET) << TARGET_PAGE_BITS)
+#endif
 
 /*
  * flag for compressed format
@@ -39,9 +36,6 @@
 #define PHYS_BASE                   (0)
 #define DUMP_LEVEL                  (1)
 #define DISKDUMP_HEADER_BLOCKS      (1)
-#define BUFSIZE_BITMAP              (TARGET_PAGE_SIZE)
-#define PFN_BUFBITMAP               (CHAR_BIT * BUFSIZE_BITMAP)
-#define BUFSIZE_DATA_CACHE          (TARGET_PAGE_SIZE * 4)
 
 #include "sysemu/dump-arch.h"
 #include "sysemu/memory_mapping.h"
-- 
2.4.3

