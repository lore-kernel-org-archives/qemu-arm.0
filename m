Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2137061njd;
        Mon, 21 Apr 2025 22:30:06 -0700 (PDT)
X-Received: by 2002:a17:903:166f:b0:223:397f:46be with SMTP id d9443c01a7336-22c536423f9mr200309825ad.47.1745299806505;
        Mon, 21 Apr 2025 22:30:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745299806; cv=none;
        d=google.com; s=arc-20240605;
        b=NWlRr+0WGn1aqLaD6t9cKMEIY6kXt5sgbwlP2hk1q1DReuE5h6yonaiMdROD5vEgJk
         FoT9Wp2tV1JleQFBJYgM2BF8Jz22BUTNNaBhkQn2ihXHFHGu5EXJAysbf8VRf3fvWSsK
         GkRPKOJEIHjT8xRVv9begipV39FCb9VH+5JQ91HTkK0T2ZXQ1qlAhkuCtoaft01sRWQy
         hdpWn3gkH2+okHiSekFSafq+sFxxJsIROTvAz6LtrPePXeiDo4Ie6r7O+sIkqvrvNhqb
         KEtDv3BL3nb6nh683GDY2h/YkGND4+RzeflBGSOMRJBIeRAP4lgi7WU0HihYCLk0bIyg
         TEJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2FkVN9PsSNE2Egb+LipsDkf/RHaq4OxguwsmDIo9jqs=;
        fh=tSFl+53gdNgwNZJhFgAeaKY9rHtN+dU7TH7TktwT8zI=;
        b=OBuiyCkwNHvP0YaEpwDgw1jciv0TiNVh2MHJ2TmORzbhr7gRohWJR2sjgDz9uHfJ6a
         6Qyi3Ph0AOjMVWy+HcU5WxumkZKXV18uP7vtRXBlWz5OZUX0Qax6UE5UlATUvmAra1Eq
         yD1Vccruenu9twdy2QVwAlz0nr/NZIOO2Ft5G9C+mWCq3cjLXFkiS9qQNebxWakdwxR8
         rvc5a15U4E4BAZ1OnafJrrnaGVC8UrXr9RlMhtB1HkOOqwCdQA+9HJBrU+X4Ovi1edEU
         VuvjvRve6aKDJ/x4j+VuP16M88boQ7zQFqFqTzmBAY+3imT2HJfZjNFoicZkTO7D2I9Z
         WpJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=YflOivqA;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22c50d09f5fsor73873055ad.9.2025.04.21.22.30.06
        (Google Transport Security);
        Mon, 21 Apr 2025 22:30:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=YflOivqA;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745299806; x=1745904606; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FkVN9PsSNE2Egb+LipsDkf/RHaq4OxguwsmDIo9jqs=;
        b=YflOivqADAUZebB596A0VUgR6SvYXtH7gGbQnZnqDATyRftNM3plETbrSynHhF6lhl
         qXxxoJSSiqsPfLa0aOok28W9j9jqrseouK/KVe6glUxlvOjl1EAm3WowO9C13kBtDHjJ
         Arqx+vDqkAX3Z4GpaQVbkaUHJmGCpkfgA+09+zkStqZDxp34SYUwJFrVFk71uJfk2gK8
         XvNlY9CrmuK47SCRyxlKd8xmjcvjPZHrdY0WNabazHakIGENraUU/WwJCDqBO3ouVCk5
         Y0OQzTpJrSwXAtw/crhba4WMMMMO+atTwiPGOd3SLdYgP5Y3jqXed/OxZDMtq7i1zBdZ
         iqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745299806; x=1745904606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2FkVN9PsSNE2Egb+LipsDkf/RHaq4OxguwsmDIo9jqs=;
        b=Eybb5G8OVi7tMUD83Q8SfncJYtBTXjPBUzl99D0lt7dfbOiUtuFLzPhkrE/yZQk8zB
         no8sNABTO2yn6A/vWWjJSUIrgjTyH5CmPUoFul9xaz70sUDchFrXmhUmDSba0XLwPXXW
         u4PQALEAooyFfzNs6MoUVRzlJYixbYJlFBuDAMBPa8QuKtpi0sUaJFv6fG8yJe2fRRbo
         zIMWj69weTUi27RlHp8fg9/6M8yS9+zk8CMAvQgYCW8VBR9YQ8y5QF5ddncNYuJPKkhv
         tNl0g55NdXl/neUzdEHP1F8lEgb+2XLdtVVL2iPZ4vWzokhV3WK3JbidQWM26QsDj7Tt
         lXbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg1fhzMby27KFcO4xzhxlCM/THbPLmOrmLg5VeUCA9AW0DtN8mSXCKBv3lISuqrUfmJ2Yxzh1AQOnlCKZA@linaro.org, AJvYcCWENLQ/3nDCFjw9k5AewwLuLUNOgOkWoJw5H97l/BPX2YklaFzkFupkDBXfA4TuS3P5f6h2M9Tc@linaro.org, AJvYcCWdIaUmKZvqvbb+zS8cU6EHHuENo5+g+5RCFHHOxwEuD/TNC4mGGepj5lZfnC6d12Ey5V1f1iz0ia3fU59POOy1EA==@linaro.org, AJvYcCWrahcEHN3fpXarJzdN0VhX8cTjkvZFfjl7riE77iMWdlK1i388Om7QarD/DvJqaMKyzmr79bFlEtU68aK5Sd4v9NI=@linaro.org
X-Gm-Message-State: AOJu0YzJFnYGUgomNXA3XpIpB+kHneyTgvvD0JQQOh/OP3+uP4FNpNgo
	mdPeGszatFVqbocAMtmPNF4khAf7UkxO+To78h5f7GcFTAXP8pISbtzIj6Gy
X-Gm-Gg: ASbGncsajSHZcIpDtp+oOOMp0BMjjc3F53NWoRCugU5K4PejB6QRcDhHYzfZYQkv0ux
	0Og8JlCwaYNVQkBLhC/QPclMLjWdhrokqt3zZo7IGJPDadNft05cPRL6nU0XBmhfjdSi3mwSkkp
	b5PF15aDuLEM2s2g9fWD+eo4ZGZ6Od4ZBechAm1vBaN2o2LA5SiA+1PWmw/WUWPX6ZVmUKjUmXh
	qnpdw/QJjpvMmKKvh4Gdd+OdJ9rly6dFWRXxaN4Gt1pYYOk+KHr9Cc0R4m3TXjS9U/BG61PNf+3
	K3RCYUm1Po9/UZSrAnokiFU5RB3ed4OhruQfIuqOvUjy6lx96vXAD83D9zU=
X-Google-Smtp-Source: AGHT+IF7xwbiS5Pbd8i6m0BJ3l2AbPC1Rmn0ASj1QQA1F9dYuT3aDzSVpRYV+spAOV/dyXoUuJ6ZZw==
X-Received: by 2002:a17:903:41c7:b0:220:faa2:c911 with SMTP id d9443c01a7336-22c535a4b39mr194143805ad.14.1745299805766;
        Mon, 21 Apr 2025 22:30:05 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:e142:4a4f:1ebb:3ca4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4483sm75692085ad.118.2025.04.21.22.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 22:30:05 -0700 (PDT)
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
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
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
Subject: [PATCH v2 16/20] util: exclude mmap-alloc.c from compilation target on Emscripten
Date: Tue, 22 Apr 2025 14:27:20 +0900
Message-Id: <d20971cd7d9736aa3777721765606c244253cdb0.1745295397.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1745295397.git.ktokunaga.mail@gmail.com>
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: HzeRggmeOAZR

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

V2:
- Instead of porting mmap-alloc.c to Emscripten, this version excludes the
  file entirely. The rationale is described in the commit message.

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
index 4c829793a0..f5fcbfa799 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -1636,7 +1636,7 @@ bool memory_region_init_resizeable_ram(MemoryRegion *mr,
     return true;
 }
 
-#ifdef CONFIG_POSIX
+#if defined(CONFIG_POSIX) && !defined(EMSCRIPTEN)
 bool memory_region_init_ram_from_file(MemoryRegion *mr,
                                       Object *owner,
                                       const char *name,
diff --git a/system/physmem.c b/system/physmem.c
index 333a5eb94d..76c65edb62 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -1242,7 +1242,7 @@ long qemu_maxrampagesize(void)
     return pagesize;
 }
 
-#ifdef CONFIG_POSIX
+#if defined(CONFIG_POSIX) && !defined(EMSCRIPTEN)
 static int64_t get_file_size(int fd)
 {
     int64_t size;
@@ -1977,7 +1977,7 @@ out_free:
     }
 }
 
-#ifdef CONFIG_POSIX
+#if defined(CONFIG_POSIX) && !defined(EMSCRIPTEN)
 RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, ram_addr_t max_size,
                                  qemu_ram_resize_cb resized, MemoryRegion *mr,
                                  uint32_t ram_flags, int fd, off_t offset,
@@ -2157,7 +2157,8 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
     assert(!host ^ (ram_flags & RAM_PREALLOC));
     assert(max_size >= size);
 
-#ifdef CONFIG_POSIX         /* ignore RAM_SHARED for Windows */
+    /* ignore RAM_SHARED for Windows and emscripten*/
+#if defined(CONFIG_POSIX) && !defined(EMSCRIPTEN)
     if (!host) {
         if (!share_flags && current_machine->aux_ram_share) {
             ram_flags |= RAM_SHARED;
@@ -2254,7 +2255,7 @@ static void reclaim_ramblock(RAMBlock *block)
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
2.25.1
