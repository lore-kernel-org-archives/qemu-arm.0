Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3660943wrg;
        Wed, 5 Jun 2019 13:58:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqySNdcVD7yZs8EuDcK8k57mPcUfbPA762bWFN6WwpvOsfqGGOYDGGj8AwFZfRwnwhmz0KSO
X-Received: by 2002:a0c:8b49:: with SMTP id d9mr34063250qvc.63.1559768331172;
        Wed, 05 Jun 2019 13:58:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559768331; cv=none;
        d=google.com; s=arc-20160816;
        b=r9J/2sh9+fY5KVOiXi1Pqvpzh8VhaRZ/dsdgbQAOxwWcd7hScNz9txLKz95B7sdr+1
         n1sitE49kbREQqwNyjxCrpTvycKoVU1S0dHu4oEwjHV4RiqTU7ppSO/RAfQtCXKO1/e4
         u3mbZxmtBnDPUqYuvoKM3D1RC/+0b3lqST9ZRJZ9YHeqQLPfRqyP/c/TuDml4ppWiMFn
         zmAVdzuDgLXm1iKDRFNccaZe1xcKFbwAo+R3HEkJ3bv+lMaUCxxM/Pc4qNhI6yT1OF46
         0Q+blL8PiKh9c9BSpLwky7h91SU1QXQXnchUDXgVoo2Cy1AacLYZKrLynxY1Lu82iNoi
         GeYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=yjdMaLJKLWTE+OzLW+tTbL3wKIJtV8g2rfeZlQHS85U=;
        b=D6sU8zKjLS/gRQprj28kNy239S6pV8fY/po/9/oKyqQVBBSsM9FkP7DjOTYMSJEo9t
         sx/1huCm8ZhAt5tOrv6sQOciFVb8WkjmIChiYlb7+avNRZx/hLblqoM6t3nR4B+WtVt6
         3mzhhb4CjVjWcafmLuAhJAQYY5jJDREfcSj9VWjqNsMbFKAZ6LX2bvHJ83Ux4F8jlK6v
         DcHqLk6iUfQ9dkO+upRvGBdOIWxBaSZbb0gLgLa4eXYGJPA31911hJwoi9oEHfMuHF3s
         9KqQ5Bc40bcC8fAhUma7eWo6uXcVYZBUJBnd/OF/Nlfo0Da142IudAa2+tAQXqd0Hw57
         44BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xRhC6ePo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n43si3891050qvc.71.2019.06.05.13.58.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Jun 2019 13:58:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xRhC6ePo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:49903 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYczi-0007SP-IU
	for alex.bennee@linaro.org; Wed, 05 Jun 2019 16:58:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48104)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hYcyD-0006Cd-QU
	for qemu-arm@nongnu.org; Wed, 05 Jun 2019 16:57:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hYcyC-0008E9-63
	for qemu-arm@nongnu.org; Wed, 05 Jun 2019 16:57:17 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:44601)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hYcyB-0008Av-Ka
	for qemu-arm@nongnu.org; Wed, 05 Jun 2019 16:57:15 -0400
Received: by mail-oi1-x242.google.com with SMTP id e189so23083oib.11
	for <qemu-arm@nongnu.org>; Wed, 05 Jun 2019 13:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yjdMaLJKLWTE+OzLW+tTbL3wKIJtV8g2rfeZlQHS85U=;
	b=xRhC6ePodcuGp4y5m8t0tuRQsw6cKEbUAcgBS1Vg+9SxsGMFJGSVB7dUYGEe5LAMbY
	GxgstnIjD4Cg7xKHF3xwkg+UtaFg2r9GYAug+7NGkvuUUIkH3S39nscETEtz0OffBhN+
	I56KGWxA2OYQdFjT5JQ4vb8ze7qym8AqMa/DJYeKtuafMSaVR0abndxzfEI52lcdVB73
	sAAqwQF3MAoYCtTTakk6nJI0GaZ/3kRlea1MDINwQtetzAhvMQYY1ccgkpu3KrV6fLwl
	8ca9zQQ3Bl2qTXiwkgo6pKzr8Xp1kh1l/8amg7aO6RB9z/XH7DOvHVXGh4OV7nGGtc1X
	Mquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yjdMaLJKLWTE+OzLW+tTbL3wKIJtV8g2rfeZlQHS85U=;
	b=oyxRjUMTRxnu6HGOY8xldCDSNSDko7fRlEgU21zSe5GN4n4EIIlCpeUAIPxm/o7p+e
	IpYx6ZT/7bTKmRbvoMCu36UVF/VJ36a21mpAErT+mp1N+O8HMcQTvS/SzzmDL8gw1LB2
	s1mjl/Hc/C74EHxuocWgqhddETk6m9Lf3r9UwhGAWYt99az0USYvLKwPrhvmLO8/VIXK
	kCGiO5zSRhMZ9pkGx4ChPjMFqVXNAyN6fm8MFRehim8nQ1llZRHI0V7XFrJSLqO8+7eN
	aeSZ/9o1QZRczKaJiktzntlKBAXcQFTsCuNe2bw0Rc+H4sHO1q8u26b+xWk0O4SK872s
	IIOQ==
X-Gm-Message-State: APjAAAVeAZ2CRNOWh6gAIJErrcYytfqfcVJw8nl9Gr0Vdwsgzba+yOZG
	BU++PvcJysrU6ztQJebMCa3wyQ==
X-Received: by 2002:aca:318c:: with SMTP id x134mr8589922oix.125.1559768234794;
	Wed, 05 Jun 2019 13:57:14 -0700 (PDT)
Received: from localhost.localdomain (200-56-192-86-cable.cybercable.net.mx.
	[200.56.192.86])
	by smtp.gmail.com with ESMTPSA id f5sm7414155otl.51.2019.06.05.13.57.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jun 2019 13:57:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  5 Jun 2019 15:57:02 -0500
Message-Id: <20190605205706.569-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190605205706.569-1-richard.henderson@linaro.org>
References: <20190605205706.569-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: [Qemu-arm] [PATCH v6 2/6] linux-user: Validate mmap/mprotect prot
 value
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, Dave.Martin@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ioc/1xHp9H8D

The kernel will return -EINVAL for bits set in the prot argument
that are unknown or invalid.  Previously we were simply cropping
out the bits that we care about.

Introduce validate_prot_to_pageflags to perform this check in a
single place between the two syscalls.  Differentiate between
the target and host versions of prot.  Compute the qemu internal
page_flags value at the same time.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/mmap.c | 106 ++++++++++++++++++++++++++++++++--------------
 1 file changed, 75 insertions(+), 31 deletions(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index af41339d57..3117f57fd8 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -61,11 +61,38 @@ void mmap_fork_end(int child)
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
+     * For the host, we need not pass anything except read/write/exec.
+     * While PROT_SEM is allowed by all hosts, it is also ignored, so
+     * don't bother transforming guest bit to host bit.  Any other
+     * target-specific prot bits will not be understood by the host
+     * and will need to be encoded into page_flags for qemu emulation.
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
@@ -75,56 +102,65 @@ int target_mprotect(abi_ulong start, abi_ulong len, int prot)
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
@@ -364,10 +400,11 @@ abi_ulong mmap_find_vma(abi_ulong start, abi_ulong size, abi_ulong align)
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
@@ -402,6 +439,12 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
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
@@ -467,14 +510,15 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
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
@@ -508,19 +552,19 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
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
@@ -531,13 +575,13 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
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
@@ -546,7 +590,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
         if (end < real_end) {
             ret = mmap_frag(real_end - qemu_host_page_size,
                             real_end - qemu_host_page_size, end,
-                            prot, flags, fd,
+                            host_prot, flags, fd,
                             offset + real_end - qemu_host_page_size - start);
             if (ret == -1)
                 goto fail;
@@ -562,13 +606,13 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
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

