Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp311225wme;
        Mon, 21 May 2018 07:04:11 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZo4GUVmeUIOVdz5kmU1DXvnexwIh5OZdbUw3bYTkGotuffNhwsxP86iLC6TkAyBhCeZaGSE
X-Received: by 2002:adf:b244:: with SMTP id y4-v6mr5365553wra.99.1526911450929;
        Mon, 21 May 2018 07:04:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526911450; cv=none;
        d=google.com; s=arc-20160816;
        b=Kpy12EJcSjdyFJKREIZuFHC0DL3ttFq0oxP1mggpvhpPU8ZSbP/abAAiXJi4olio2r
         hDix4ht0ys/2aYJrB5qGg15wz1A77qEdEl3WzwkGy71SofPDbOhidOt+myo1jFWwF8xI
         pPAju8gU/Q/3RLNQfSr+i1pxESBUgzGeXBYyl/+wqzHXsu/W8LskNmuX90pCRZ6a0QNg
         WMdao5XvVX4Zc7UznLp5iysYWpOjUY6HcwiEFKRN0r5eLHZZPV9aYQpo/lSe3T6Z0IFu
         qE0ku8LVKkj9oQlbwvtc+WIvsI+NITqDjz0eXdgHXGOgxVxI5Gi2CZV5CxFMIhviOfWU
         Tmew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=5wJvBtXvTMPgovwT0Jqp8vaeLb19EkOjcXXBCjAPSsA=;
        b=Nwmq8Gdgnq2sWsDm+X3PgmwGAPeE1LAyD0wxWDgDBp36H5TDhB9EFmc+xeJDyzPe1A
         OqNy+N3xO5oXENYlKS0EIHhvCOBkleP6aHn2HajjfZgvI3/uhQCuEednFG7jtLmN9a+K
         LuTvU1QF9BOTt1f4kbPKlN1+dBMqxROaK/GTF0hisP3CZBHnc6ZWYST0WjS2hLAraDP2
         I72pBepHFFda2hwrjW3XeYLjFhX6OqWD48+gN2QZFsokWWg1RlxR5zmCdYAbZ6ta45Pl
         Xs4pF0AvsPVklsgflBEglW+AYpTTlIzmyNSlxL5W3/a94SWsAzb3uADsN8LP+DI4PCl/
         LT8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id p62-v6si12617589wrb.385.2018.05.21.07.04.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 May 2018 07:04:10 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fKlQ2-0007gm-CM; Mon, 21 May 2018 15:04:10 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 10/27] Make flatview_translate() take a MemTxAttrs argument
Date: Mon, 21 May 2018 15:03:45 +0100
Message-Id: <20180521140402.23318-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180521140402.23318-1-peter.maydell@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
X-TUID: 51edjWr8AmLl

As part of plumbing MemTxAttrs down to the IOMMU translate method,
add MemTxAttrs as an argument to flatview_translate(); all its
callers now have attrs available.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/memory.h |  7 ++++---
 exec.c                | 17 +++++++++--------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 444fceac55..3980ab47ed 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1913,7 +1913,8 @@ IOMMUTLBEntry address_space_get_iotlb_entry(AddressSpace *as, hwaddr addr,
  */
 MemoryRegion *flatview_translate(FlatView *fv,
                                  hwaddr addr, hwaddr *xlat,
-                                 hwaddr *len, bool is_write);
+                                 hwaddr *len, bool is_write,
+                                 MemTxAttrs attrs);
 
 static inline MemoryRegion *address_space_translate(AddressSpace *as,
                                                     hwaddr addr, hwaddr *xlat,
@@ -1921,7 +1922,7 @@ static inline MemoryRegion *address_space_translate(AddressSpace *as,
                                                     MemTxAttrs attrs)
 {
     return flatview_translate(address_space_to_flatview(as),
-                              addr, xlat, len, is_write);
+                              addr, xlat, len, is_write, attrs);
 }
 
 /* address_space_access_valid: check for validity of accessing an address
@@ -2030,7 +2031,7 @@ MemTxResult address_space_read(AddressSpace *as, hwaddr addr,
             rcu_read_lock();
             fv = address_space_to_flatview(as);
             l = len;
-            mr = flatview_translate(fv, addr, &addr1, &l, false);
+            mr = flatview_translate(fv, addr, &addr1, &l, false, attrs);
             if (len == l && memory_access_is_direct(mr, false)) {
                 ptr = qemu_map_ram_ptr(mr->ram_block, addr1);
                 memcpy(buf, ptr, len);
diff --git a/exec.c b/exec.c
index 9229fb4058..b818ba87f4 100644
--- a/exec.c
+++ b/exec.c
@@ -618,7 +618,8 @@ iotlb_fail:
 
 /* Called from RCU critical section */
 MemoryRegion *flatview_translate(FlatView *fv, hwaddr addr, hwaddr *xlat,
-                                 hwaddr *plen, bool is_write)
+                                 hwaddr *plen, bool is_write,
+                                 MemTxAttrs attrs)
 {
     MemoryRegion *mr;
     MemoryRegionSection section;
@@ -3152,7 +3153,7 @@ static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,
         }
 
         l = len;
-        mr = flatview_translate(fv, addr, &addr1, &l, true);
+        mr = flatview_translate(fv, addr, &addr1, &l, true, attrs);
     }
 
     return result;
@@ -3168,7 +3169,7 @@ static MemTxResult flatview_write(FlatView *fv, hwaddr addr, MemTxAttrs attrs,
     MemTxResult result = MEMTX_OK;
 
     l = len;
-    mr = flatview_translate(fv, addr, &addr1, &l, true);
+    mr = flatview_translate(fv, addr, &addr1, &l, true, attrs);
     result = flatview_write_continue(fv, addr, attrs, buf, len,
                                      addr1, l, mr);
 
@@ -3239,7 +3240,7 @@ MemTxResult flatview_read_continue(FlatView *fv, hwaddr addr,
         }
 
         l = len;
-        mr = flatview_translate(fv, addr, &addr1, &l, false);
+        mr = flatview_translate(fv, addr, &addr1, &l, false, attrs);
     }
 
     return result;
@@ -3254,7 +3255,7 @@ static MemTxResult flatview_read(FlatView *fv, hwaddr addr,
     MemoryRegion *mr;
 
     l = len;
-    mr = flatview_translate(fv, addr, &addr1, &l, false);
+    mr = flatview_translate(fv, addr, &addr1, &l, false, attrs);
     return flatview_read_continue(fv, addr, attrs, buf, len,
                                   addr1, l, mr);
 }
@@ -3468,7 +3469,7 @@ static bool flatview_access_valid(FlatView *fv, hwaddr addr, int len,
 
     while (len > 0) {
         l = len;
-        mr = flatview_translate(fv, addr, &xlat, &l, is_write);
+        mr = flatview_translate(fv, addr, &xlat, &l, is_write, attrs);
         if (!memory_access_is_direct(mr, is_write)) {
             l = memory_access_size(mr, l, addr);
             /* When our callers all have attrs we'll pass them through here */
@@ -3517,7 +3518,7 @@ flatview_extend_translation(FlatView *fv, hwaddr addr,
 
         len = target_len;
         this_mr = flatview_translate(fv, addr, &xlat,
-                                                   &len, is_write);
+                                     &len, is_write, attrs);
         if (this_mr != mr || xlat != base + done) {
             return done;
         }
@@ -3550,7 +3551,7 @@ void *address_space_map(AddressSpace *as,
     l = len;
     rcu_read_lock();
     fv = address_space_to_flatview(as);
-    mr = flatview_translate(fv, addr, &xlat, &l, is_write);
+    mr = flatview_translate(fv, addr, &xlat, &l, is_write, attrs);
 
     if (!memory_access_is_direct(mr, is_write)) {
         if (atomic_xchg(&bounce.in_use, true)) {
-- 
2.17.0
