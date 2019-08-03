Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2281577wrv;
        Sat, 3 Aug 2019 14:08:10 -0700 (PDT)
X-Received: by 2002:a17:902:ff10:: with SMTP id f16mr41959831plj.141.1564866489986;
        Sat, 03 Aug 2019 14:08:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564866489; cv=none;
        d=google.com; s=arc-20160816;
        b=e6nr2dOJSUybznHtB2MuE2NzTY6PDHNKUrLi2EfU1WhGRGuJLRo8JRTKQZUP90gd1E
         GLCes0TTojZGxbxM50ekRfqpgAsNvqeoqJUHlImKsfNvOC3qFPcdAnQMrrRqKSBPBAX4
         NAK3udy1M4KPOOWosVgcdFWwcd5J6wymiINVJAOQYohWDtfbn3/b70m6NlVFqwO4E3CL
         Sw2BYoq2NYErS761p1FlZJpjf1p++KUI87X5sQxSqZPZk4wKyTiGwVznaPVJXRCB+QeT
         9hS3x0CW/PZDe7nc/eBMRem6mp5CRd4k1evlm8MALt0AsetmiMxCVmvJBxTC5kVpGlhV
         dzDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=iY1rJ5gqOJNqiFkLvVP5dE/pUQCE/8Q8pJZi7hZ3KUU=;
        b=wERwUlr666ApF8Seh3bvHB+KhPKbnifP0XYYPpNHjiYk42vg0SiQeOE5DegZ7XOY9I
         YefQSG8mZ2C+H3WyOKqPMefUp4vVzvLLES2FDaGf12lQ9VaOWDvbrW9lV+jt1cT2lnxP
         6+D/c9vX99mTfTT0ylvTmBhZ0BzN8aqhUt9iPVwsxaAvMQSH42MmdbbtVnwHM2TsqwVP
         tkI7keKZ+n7I3GtG1CVcb7u+aI5EvYBTR4SIc0KmMOE3E/TLGSCQpFUtVZkZ76Dcwp+r
         69ZsHTfzkkhUxm9c4jCkaM1x5rlqs+1TjSbxAdx1J8N/of1/IAvJ04bbZVlslsZyQiJk
         N7oA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xME2Bdkw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r9sor4569073pgj.41.2019.08.03.14.08.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 14:08:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xME2Bdkw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iY1rJ5gqOJNqiFkLvVP5dE/pUQCE/8Q8pJZi7hZ3KUU=;
        b=xME2BdkwnU1Jc2XfraqWMVV3Qmp2sp+V1P4tHhNZ400gndzuR1ADIhpaL3MsbeTrSw
         LeQrslH7jcjGxZ1p7pXhxOXZTP2bYlREQLzGF6Y/kEuvRuA6/rCOxwt5H+octEDGu9/+
         EXqaDrSiHtTc4cm0Z83Y1oe0gDhgDPZiA2nkk0Ps2fiiJpXwzvUtVaLffvMBc5lO8p0h
         zLhr4BtTAYwYgZHyavKTRt5YEk3NdFGbTajOd/L3xwccrz5+xJ3oycljuaqXMZ2/+Iok
         lKxSG1x57UKCrUxQZuFfmUvh719FIk9y5k+XxOpYE6XfUQRN9G8vRQ43ZnXIIxh5uWdp
         2PhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=iY1rJ5gqOJNqiFkLvVP5dE/pUQCE/8Q8pJZi7hZ3KUU=;
        b=oTyVYqdNR1blz13FjdzJvVUqo0DHXtDre0JZYUhQ11H8UL1FdMsRqvPV31tBh2lLkR
         DR8vyRbxO2a2T9/XnBSc3xV+dx49z7+uLIQkbrPZzhvBUoiIu6Wp4jUCXHa27tAtCRpg
         sjwY39IBqkjul0NSKNF4z9MH+k+4131Z/PXQoNvTPKC5Wrez8fp8drehqLw/xsvKqqAo
         hd17d9VzY0vOZulQHoxHN6p5Vn+3uHvM5i/HhcDcvdTGIUEmVfwVVtwxuKBXr1leVLet
         a5PfTYP2yZT8MQ1Kj32BKkDDiRAxqK/oGG3QEBoQXj5QAR1yfay9RGF+rzssfl2heaNH
         WcRg==
X-Gm-Message-State: APjAAAVK5BUQxpakzs07oFt+T6rSHksrJbdqpoMJ+VmOHZA3uFvZyqqm
	ah0+Ow/k6wNFZDYWp+JelEvuBIx3
X-Google-Smtp-Source: APXvYqydu5lHiuTNlCePRmhvLt1+RCtYGvIL0gZoTXtQFEOYrXGPSM7+LuWWm4mib7lXRZoOnPJ+Hg==
X-Received: by 2002:a63:4612:: with SMTP id t18mr121646295pga.85.1564866489358;
        Sat, 03 Aug 2019 14:08:09 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id x25sm110129644pfa.90.2019.08.03.14.08.08
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 14:08:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org,
	Dave.Martin@arm.com
Subject: [PATCH v7 2/6] linux-user: Validate mmap/mprotect prot value
Date: Sat,  3 Aug 2019 14:07:59 -0700
Message-Id: <20190803210803.5701-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803210803.5701-1-richard.henderson@linaro.org>
References: <20190803210803.5701-1-richard.henderson@linaro.org>
X-TUID: Gu3afyu0WMf6

The kernel will return -EINVAL for bits set in the prot argument
that are unknown or invalid.  Previously we were simply cropping
out the bits that we care about.

Introduce validate_prot_to_pageflags to perform this check in a
single place between the two syscalls.  Differentiate between
the target and host versions of prot.  Compute the qemu internal
page_flags value at the same time.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/mmap.c | 105 ++++++++++++++++++++++++++++++++--------------
 1 file changed, 74 insertions(+), 31 deletions(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 46a6e3a761..c1a188ec0b 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -60,11 +60,37 @@ void mmap_fork_end(int child)
         pthread_mutex_unlock(&mmap_mutex);
 }
 
+/*
+ * Validate target prot bitmask.
+ * Return the prot bitmask for the host in *HOST_PROT.
+ * Return 0 if the target prot bitmask is invalid, otherwise
+ * the internal qemu page_flags (which will include PAGE_VALID).
+ */
+static int validate_prot_to_pageflags(int *host_prot, int prot)
+{
+    int valid = PROT_READ | PROT_WRITE | PROT_EXEC | TARGET_PROT_SEM;
+    int page_flags = (prot & PAGE_BITS) | PAGE_VALID;
+
+    /*
+     * While PROT_SEM was added with the initial futex api, and continues
+     * to be accepted, it is documented as unused on all architectures.
+     * Moreover, it was never added to glibc so we don't have a definition
+     * for the host.  Follow the kernel and ignore it.
+     *
+     * TODO: We do not actually have to map guest pages as executable,
+     * since they will not be directly executed by the host.  We only
+     * need to remember exec within page_flags.
+     */
+    *host_prot = prot & (PROT_READ | PROT_WRITE | PROT_EXEC);
+
+    return prot & ~valid ? 0 : page_flags;
+}
+
 /* NOTE: all the constants are the HOST ones, but addresses are target. */
-int target_mprotect(abi_ulong start, abi_ulong len, int prot)
+int target_mprotect(abi_ulong start, abi_ulong len, int target_prot)
 {
     abi_ulong end, host_start, host_end, addr;
-    int prot1, ret;
+    int prot1, ret, page_flags, host_prot;
 
 #ifdef DEBUG_MMAP
     printf("mprotect: start=0x" TARGET_ABI_FMT_lx
@@ -74,56 +100,65 @@ int target_mprotect(abi_ulong start, abi_ulong len, int prot)
            prot & PROT_EXEC ? 'x' : '-');
 #endif
 
-    if ((start & ~TARGET_PAGE_MASK) != 0)
+    if ((start & ~TARGET_PAGE_MASK) != 0) {
         return -TARGET_EINVAL;
+    }
+    page_flags = validate_prot_to_pageflags(&host_prot, target_prot);
+    if (!page_flags) {
+        return -TARGET_EINVAL;
+    }
     len = TARGET_PAGE_ALIGN(len);
     end = start + len;
     if (!guest_range_valid(start, len)) {
         return -TARGET_ENOMEM;
     }
-    prot &= PROT_READ | PROT_WRITE | PROT_EXEC;
-    if (len == 0)
+    if (len == 0) {
         return 0;
+    }
 
     mmap_lock();
     host_start = start & qemu_host_page_mask;
     host_end = HOST_PAGE_ALIGN(end);
     if (start > host_start) {
         /* handle host page containing start */
-        prot1 = prot;
-        for(addr = host_start; addr < start; addr += TARGET_PAGE_SIZE) {
+        prot1 = host_prot;
+        for (addr = host_start; addr < start; addr += TARGET_PAGE_SIZE) {
             prot1 |= page_get_flags(addr);
         }
         if (host_end == host_start + qemu_host_page_size) {
-            for(addr = end; addr < host_end; addr += TARGET_PAGE_SIZE) {
+            for (addr = end; addr < host_end; addr += TARGET_PAGE_SIZE) {
                 prot1 |= page_get_flags(addr);
             }
             end = host_end;
         }
-        ret = mprotect(g2h(host_start), qemu_host_page_size, prot1 & PAGE_BITS);
-        if (ret != 0)
+        ret = mprotect(g2h(host_start), qemu_host_page_size,
+                       prot1 & PAGE_BITS);
+        if (ret != 0) {
             goto error;
+        }
         host_start += qemu_host_page_size;
     }
     if (end < host_end) {
-        prot1 = prot;
-        for(addr = end; addr < host_end; addr += TARGET_PAGE_SIZE) {
+        prot1 = host_prot;
+        for (addr = end; addr < host_end; addr += TARGET_PAGE_SIZE) {
             prot1 |= page_get_flags(addr);
         }
-        ret = mprotect(g2h(host_end - qemu_host_page_size), qemu_host_page_size,
-                       prot1 & PAGE_BITS);
-        if (ret != 0)
+        ret = mprotect(g2h(host_end - qemu_host_page_size),
+                       qemu_host_page_size, prot1 & PAGE_BITS);
+        if (ret != 0) {
             goto error;
+        }
         host_end -= qemu_host_page_size;
     }
 
     /* handle the pages in the middle */
     if (host_start < host_end) {
-        ret = mprotect(g2h(host_start), host_end - host_start, prot);
-        if (ret != 0)
+        ret = mprotect(g2h(host_start), host_end - host_start, host_prot);
+        if (ret != 0) {
             goto error;
+        }
     }
-    page_set_flags(start, start + len, prot | PAGE_VALID);
+    page_set_flags(start, start + len, page_flags);
     mmap_unlock();
     return 0;
 error:
@@ -363,10 +398,11 @@ abi_ulong mmap_find_vma(abi_ulong start, abi_ulong size, abi_ulong align)
 }
 
 /* NOTE: all the constants are the HOST ones */
-abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
+abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
                      int flags, int fd, abi_ulong offset)
 {
     abi_ulong ret, end, real_start, real_end, retaddr, host_offset, host_len;
+    int page_flags, host_prot;
 
     mmap_lock();
 #ifdef DEBUG_MMAP
@@ -401,6 +437,12 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
         goto fail;
     }
 
+    page_flags = validate_prot_to_pageflags(&host_prot, target_prot);
+    if (!page_flags) {
+        errno = EINVAL;
+        goto fail;
+    }
+
     /* Also check for overflows... */
     len = TARGET_PAGE_ALIGN(len);
     if (!len) {
@@ -466,14 +508,15 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
         /* Note: we prefer to control the mapping address. It is
            especially important if qemu_host_page_size >
            qemu_real_host_page_size */
-        p = mmap(g2h(start), host_len, prot,
+        p = mmap(g2h(start), host_len, host_prot,
                  flags | MAP_FIXED | MAP_ANONYMOUS, -1, 0);
-        if (p == MAP_FAILED)
+        if (p == MAP_FAILED) {
             goto fail;
+        }
         /* update start so that it points to the file position at 'offset' */
         host_start = (unsigned long)p;
         if (!(flags & MAP_ANONYMOUS)) {
-            p = mmap(g2h(start), len, prot,
+            p = mmap(g2h(start), len, host_prot,
                      flags | MAP_FIXED, fd, host_offset);
             if (p == MAP_FAILED) {
                 munmap(g2h(start), host_len);
@@ -507,19 +550,19 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
             /* msync() won't work here, so we return an error if write is
                possible while it is a shared mapping */
             if ((flags & MAP_TYPE) == MAP_SHARED &&
-                (prot & PROT_WRITE)) {
+                (host_prot & PROT_WRITE)) {
                 errno = EINVAL;
                 goto fail;
             }
-            retaddr = target_mmap(start, len, prot | PROT_WRITE,
+            retaddr = target_mmap(start, len, target_prot | PROT_WRITE,
                                   MAP_FIXED | MAP_PRIVATE | MAP_ANONYMOUS,
                                   -1, 0);
             if (retaddr == -1)
                 goto fail;
             if (pread(fd, g2h(start), len, offset) == -1)
                 goto fail;
-            if (!(prot & PROT_WRITE)) {
-                ret = target_mprotect(start, len, prot);
+            if (!(host_prot & PROT_WRITE)) {
+                ret = target_mprotect(start, len, target_prot);
                 assert(ret == 0);
             }
             goto the_end;
@@ -530,13 +573,13 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
             if (real_end == real_start + qemu_host_page_size) {
                 /* one single host page */
                 ret = mmap_frag(real_start, start, end,
-                                prot, flags, fd, offset);
+                                host_prot, flags, fd, offset);
                 if (ret == -1)
                     goto fail;
                 goto the_end1;
             }
             ret = mmap_frag(real_start, start, real_start + qemu_host_page_size,
-                            prot, flags, fd, offset);
+                            host_prot, flags, fd, offset);
             if (ret == -1)
                 goto fail;
             real_start += qemu_host_page_size;
@@ -545,7 +588,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
         if (end < real_end) {
             ret = mmap_frag(real_end - qemu_host_page_size,
                             real_end - qemu_host_page_size, end,
-                            prot, flags, fd,
+                            host_prot, flags, fd,
                             offset + real_end - qemu_host_page_size - start);
             if (ret == -1)
                 goto fail;
@@ -561,13 +604,13 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
             else
                 offset1 = offset + real_start - start;
             p = mmap(g2h(real_start), real_end - real_start,
-                     prot, flags, fd, offset1);
+                     host_prot, flags, fd, offset1);
             if (p == MAP_FAILED)
                 goto fail;
         }
     }
  the_end1:
-    page_set_flags(start, start + len, prot | PAGE_VALID);
+    page_set_flags(start, start + len, page_flags);
  the_end:
 #ifdef DEBUG_MMAP
     printf("ret=0x" TARGET_ABI_FMT_lx "\n", start);
-- 
2.17.1
