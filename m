Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5783954njd;
        Sun, 27 Apr 2025 23:41:47 -0700 (PDT)
X-Received: by 2002:a17:902:ce8b:b0:223:501c:7576 with SMTP id d9443c01a7336-22dbf5ef67dmr171273945ad.12.1745822507642;
        Sun, 27 Apr 2025 23:41:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745822507; cv=none;
        d=google.com; s=arc-20240605;
        b=UFpPTv8NjXQbo68vO7a+iesmY7xLWX/d0KYQw9g6BPF9uE1H5PCIF4Blk58tBRyvIa
         T+wwyMWy2PbzfMVSYDsYhyXxEpbdsFi1lJuNNxq71SqSgjpM5GdrEjqsUAWrQsdfS2Yy
         E7TKus/SNJVXt1Cft+TsD7IR0yUjeh/6ycSNGLfm33N0UgtroHpp+R698xw/tGrY31bo
         mju6Uej5LYHqfLv51Bg31FZx/za5/v+JRUWX3kV9FpTm8APnluIhnyE/phpnY/MVAGLT
         dE3aEGPDnMVpaqVGxPg5LUVdc8Oe62wjgIPV+W3BdAWYRAGD6w+ZG0H6fv/oydJFXgm7
         hcnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=DIVudYKUPWnwo/udQIX/549TgIPCua5eirLH5QCF/V4=;
        fh=C6Onf8e8WJz/yECgMUoW3DSEymysDHR0GOZJQAMwHFs=;
        b=lDRjVbJkt8Al9tSMn9b37PRKY4xaugujfaeGR6TaaXyPW9laWQV/H+pZV6/ReAhKZM
         5m92QFONoZqpb0gfQcXO3kHkvSVKagAQ931CNtf1eT26BLQacoU0+iTV0/w+vsotj314
         aiM/JrL00x/1LZlXEj6OqRsZ20GI//kiquy4wQ2K3ywhU4M9Gs6M/4AQIVBH6m1wHybZ
         GZUQA34t2KtEV8YpRgC4rKz+IikY1vLOBmHz0uqbijg6W2DytRYHVjzFpC0ZgdSfTS+3
         O+q3GbNB08t6RzMkdEckEj0xhfNIp2DciE+RawEHit24ZGiJV3hTdfYCYMQYVtPzPZe+
         W/YA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=caDSHEHD;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db4f365c3sor49032075ad.10.2025.04.27.23.41.47
        (Google Transport Security);
        Sun, 27 Apr 2025 23:41:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=caDSHEHD;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745822507; x=1746427307; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIVudYKUPWnwo/udQIX/549TgIPCua5eirLH5QCF/V4=;
        b=caDSHEHDexWOeVdDE2I6pJ6TTWYzji3/8UQ4O7Vzx1tyJOqDsNwBS1kE1irt5pZBxH
         Nx+jdfzW/A6o2qJcZF3VBzUa+4cDXA63g0ecq93u9qBV+4/Au9PLJE2LU9ow/YbV4ayd
         x6jyItXishn6ouBZH1EHFYHWIrCOJ7W40w4MpmlF3mRVlulrB8FXA9Y2iwLggwcaXiOm
         kNALjrAxEXb4+2hK9a6mK8Us37xLfD8vplfGA81s2kUoMRb1f7KsfN8OJshQ8UgqGqyK
         53RK/+9+HH0AooNQvgDOJGZX40LuRoQHTDwGO5ClkH06g5zwFwo6i022bKgDDwSM0lJD
         ZcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745822507; x=1746427307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DIVudYKUPWnwo/udQIX/549TgIPCua5eirLH5QCF/V4=;
        b=jG9XyumOoHLf5DU1OdME8zxaJ5XkloZXcYzP0yrGJxdgsluzOeBYi9iEn9qeVW091o
         6uIWkxHEI0xUQHTWBmMO8Nx8V5iC8R59eg5mdN7wIu7cB70wtuSgW4owfYrp1ATt11/h
         rANFbRzL1L5qM1Q6yUtvrclMUD1cRs67Di1qE1rZhEd3xhuKbanzcnRijmRQc5IC7zAz
         HL8Uip51rW8qXZXXgfDkiPTIMUHa6ISaWUBgAHzFXIpUCxhNfrDL5ERRRIaJFLek0J9x
         TAB3dpAl5XfqbLJH0Yyda25q3AevJMhRTJmEP2D1DhfL+pqsVPf8yOFA8/jRFWlt0D/1
         hdrg==
X-Forwarded-Encrypted: i=1; AJvYcCUhz0F03mmGZu4pq/zz1iE6hm8jDEDTkDizq78Gtf2eDLRdPQkPQ4hEGI4ZdE8gHYxRECckO3a8Ud8D6J3r4W9cBLU=@linaro.org, AJvYcCUlaQHUqgeHlAcHOr6lW8QPDSoO9T2nPGhu4zwxjotQdDBH7MS2+Ub9ckcfUT3IIyp9aivLzNTr/bVYa5GROF/zjA==@linaro.org, AJvYcCVschIgF95/4dDpTmkfi42TuB/S3+80mwrmKOec7cOQ7hChIgNMVta2884Yn8ryt3gFbQFyH/QTN6QIV6nM@linaro.org, AJvYcCXvtPSSdthlJ5iDLq8Vw0/ktoDX72+yTQtxWO7Jc3cFnFxVicIxj1gJaVLY0cuxnIlGweVdNbJ0@linaro.org
X-Gm-Message-State: AOJu0YzjJKM+Wt1XbqsE2l/j8FBfpEk5I+T4HpahoLXhF7qUpJ2uZp/Q
	rhBqRFfAn4ShNeXnWV5B/lfvkNVJ/6UApRy2Oin+vo4b41Z+B8ck
X-Gm-Gg: ASbGncuDWch6HTPwlm3gHkifEPhyDX7ac6PRVZHpJVjnhZaTftRovmrWjSEe6/7ISpw
	rA2WbnFqiU5NNlu90jdrQJAm6EE+9kHP/XPeTYcWLK5dm7ZsDloxF4I4968uDWWidMSD9oIHXeU
	Qj6eLwWSEl6yBuoEI8TiRH/9Ge/rpwNFbcvKK+GfW25/KCPxhEgrk1KMor3vHePwWqA0gOm7diw
	fS8gpOX8H/LgyZPyupMz2BgS3JD9GkhDqTV7cOrEJKGN6qEo9XRyb9Cfl6brFDQOVWcGYKCqv8a
	ve9K3sVYmTdhgn7lkIBNP/7bGAAzYq4ihxdRGA6qApgH9kH4
X-Google-Smtp-Source: AGHT+IFFpA0cHAOM2LORiF9JZwDGmmEbA50T1A4Al2CL1NiPxrn+CBXQHN6+80OSgOkBZRoXa7q63A==
X-Received: by 2002:a17:903:187:b0:224:c47:cbd with SMTP id d9443c01a7336-22dbf157b05mr158566435ad.0.1745822506956;
        Sun, 27 Apr 2025 23:41:46 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:bcb:2cf3:f1b5:b7f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbe328sm74721215ad.88.2025.04.27.23.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 23:41:46 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v3 16/20] util: exclude mmap-alloc.c from compilation target on Emscripten
Date: Mon, 28 Apr 2025 15:39:05 +0900
Message-ID: <76834f933ee4f14eeb5289d21c59d306886e58e9.1745820062.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745820062.git.ktokunaga.mail@gmail.com>
References: <cover.1745820062.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 6oessAtA6VYE

Emscripten does not support partial unmapping of mmapped memory
regions[1]. This limitation prevents correct implementation of qemu_ram_mmap
and qemu_ram_munmap, which rely on partial unmap behavior.

As a workaround, this commit excludes mmap-alloc.c from the Emscripten
build. Instead, for Emscripten build, this modifies qemu_anon_ram_alloc to
use qemu_memalign in place of qemu_ram_mmap, and disable memory backends
that rely on mmap, such as memory-backend-file and memory-backend-shm.

[1] https://github.com/emscripten-core/emscripten/blob/d4a74336f23214bf3304d9eb0d03966786b30a36/system/lib/libc/emscripten_mmap.c#L61

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 backends/meson.build |  6 ++++--
 system/memory.c      |  2 +-
 system/physmem.c     |  9 +++++----
 util/meson.build     |  4 +++-
 util/oslib-posix.c   | 28 ++++++++++++++++++++++++++++
 5 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/backends/meson.build b/backends/meson.build
index da714b93d1..9b88d22685 100644
--- a/backends/meson.build
+++ b/backends/meson.build
@@ -12,8 +12,10 @@ system_ss.add([files(
 
 if host_os != 'windows'
   system_ss.add(files('rng-random.c'))
-  system_ss.add(files('hostmem-file.c'))
-  system_ss.add([files('hostmem-shm.c'), rt])
+  if host_os != 'emscripten'
+    system_ss.add(files('hostmem-file.c'))
+    system_ss.add([files('hostmem-shm.c'), rt])
+  endif
 endif
 if host_os == 'linux'
   system_ss.add(files('hostmem-memfd.c'))
diff --git a/system/memory.c b/system/memory.c
index 7e2f16f4e9..f76b895950 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -1627,7 +1627,7 @@ bool memory_region_init_resizeable_ram(MemoryRegion *mr,
     return true;
 }
 
-#ifdef CONFIG_POSIX
+#if defined(CONFIG_POSIX) && !defined(EMSCRIPTEN)
 bool memory_region_init_ram_from_file(MemoryRegion *mr,
                                       Object *owner,
                                       const char *name,
diff --git a/system/physmem.c b/system/physmem.c
index 16cf557d1a..4a7a2e5e12 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -1243,7 +1243,7 @@ long qemu_maxrampagesize(void)
     return pagesize;
 }
 
-#ifdef CONFIG_POSIX
+#if defined(CONFIG_POSIX) && !defined(EMSCRIPTEN)
 static int64_t get_file_size(int fd)
 {
     int64_t size;
@@ -1978,7 +1978,7 @@ out_free:
     }
 }
 
-#ifdef CONFIG_POSIX
+#if defined(CONFIG_POSIX) && !defined(EMSCRIPTEN)
 RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, ram_addr_t max_size,
                                  qemu_ram_resize_cb resized, MemoryRegion *mr,
                                  uint32_t ram_flags, int fd, off_t offset,
@@ -2158,7 +2158,8 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
     assert(!host ^ (ram_flags & RAM_PREALLOC));
     assert(max_size >= size);
 
-#ifdef CONFIG_POSIX         /* ignore RAM_SHARED for Windows */
+    /* ignore RAM_SHARED for Windows and emscripten*/
+#if defined(CONFIG_POSIX) && !defined(EMSCRIPTEN)
     if (!host) {
         if (!share_flags && current_machine->aux_ram_share) {
             ram_flags |= RAM_SHARED;
@@ -2255,7 +2256,7 @@ static void reclaim_ramblock(RAMBlock *block)
         ;
     } else if (xen_enabled()) {
         xen_invalidate_map_cache_entry(block->host);
-#ifndef _WIN32
+#if !defined(_WIN32) && !defined(EMSCRIPTEN)
     } else if (block->fd >= 0) {
         qemu_ram_munmap(block->fd, block->host, block->max_length);
         close(block->fd);
diff --git a/util/meson.build b/util/meson.build
index 780b5977a8..e5cd327e27 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -11,7 +11,9 @@ if host_os != 'windows'
   endif
   util_ss.add(files('compatfd.c'))
   util_ss.add(files('event_notifier-posix.c'))
-  util_ss.add(files('mmap-alloc.c'))
+  if host_os != 'emscripten'
+    util_ss.add(files('mmap-alloc.c'))
+  endif
   freebsd_dep = []
   if host_os == 'freebsd'
     freebsd_dep = util
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index a697c602c6..4ff577e5de 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -58,6 +58,7 @@
 #include <lwp.h>
 #endif
 
+#include "qemu/memalign.h"
 #include "qemu/mmap-alloc.h"
 
 #define MAX_MEM_PREALLOC_THREAD_COUNT 16
@@ -210,11 +211,21 @@ void *qemu_anon_ram_alloc(size_t size, uint64_t *alignment, bool shared,
     const uint32_t qemu_map_flags = (shared ? QEMU_MAP_SHARED : 0) |
                                     (noreserve ? QEMU_MAP_NORESERVE : 0);
     size_t align = QEMU_VMALLOC_ALIGN;
+#ifndef EMSCRIPTEN
     void *ptr = qemu_ram_mmap(-1, size, align, qemu_map_flags, 0);
 
     if (ptr == MAP_FAILED) {
         return NULL;
     }
+#else
+    /*
+     * qemu_ram_mmap is not implemented for Emscripten. Use qemu_memalign
+     * for the anonymous allocation. noreserve is ignored as there is no swap
+     * space on Emscripten, and shared is ignored as there is no other
+     * processes on Emscripten.
+     */
+    void *ptr = qemu_memalign(align, size);
+#endif
 
     if (alignment) {
         *alignment = align;
@@ -227,7 +238,16 @@ void *qemu_anon_ram_alloc(size_t size, uint64_t *alignment, bool shared,
 void qemu_anon_ram_free(void *ptr, size_t size)
 {
     trace_qemu_anon_ram_free(ptr, size);
+#ifndef EMSCRIPTEN
     qemu_ram_munmap(-1, ptr, size);
+#else
+    /*
+     * qemu_ram_munmap is not implemented for Emscripten and qemu_memalign
+     * was used for the allocation. Use the corresponding freeing function
+     * here.
+     */
+    qemu_vfree(ptr);
+#endif
 }
 
 void qemu_socket_set_block(int fd)
@@ -588,7 +608,15 @@ bool qemu_prealloc_mem(int fd, char *area, size_t sz, int max_threads,
 {
     static gsize initialized;
     int ret;
+#ifndef EMSCRIPTEN
     size_t hpagesize = qemu_fd_getpagesize(fd);
+#else
+    /*
+     * mmap-alloc.c is excluded from Emscripten build, so qemu_fd_getpagesize
+     * is unavailable. Fallback to the lower level implementation.
+     */
+    size_t hpagesize = qemu_real_host_page_size();
+#endif
     size_t numpages = DIV_ROUND_UP(sz, hpagesize);
     bool use_madv_populate_write;
     struct sigaction act;
-- 
2.43.0
