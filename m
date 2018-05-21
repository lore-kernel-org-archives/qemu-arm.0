Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp311247wme;
        Mon, 21 May 2018 07:04:11 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZql2BfNYLP+ne+u0Q2GJkTiUJWlMWo+0HoPComqqXG8e01yxMagTs3dHQFgzmj8c3UJtHAm
X-Received: by 2002:a62:f24a:: with SMTP id y10-v6mr20278381pfl.75.1526911451428;
        Mon, 21 May 2018 07:04:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526911451; cv=none;
        d=google.com; s=arc-20160816;
        b=XnR2mn6O9la/tWXRSnYemvgFynUyLQ1dDu+ypnTQNxdEb16Cun49Dnf1PMnBv8HhQW
         Xyl508Q3bWArL5rEMnrCEguyqA3KPbKuRr4iGK7uZjfWj0L19lnaT6eh5J7RrRtsPTil
         NWF6bIiESWHroONqfw1lAkgjU4la14KK76h36oG7DqUtaUzKY7k4qrwxNkhYnDZJWh+G
         NJOkQJMJS6Q2JwGBFP7KIGNHZzBMnX/PeU4zQXarxJSJST+Dhr7ga70FmBcRv5N/TgbY
         7b6nxYInwGiEhvxx2TVSSeElRbGkMekmsn5r5mXQ1EEvnzCRinQwzh14ALpi0LxsYyan
         wV3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=2ZBg1B4a9qYaErtWzqUH9Xle5g5bW6dDwJ3DYxb/h/g=;
        b=COdmuTg08afv6ru0aZhpDQc6VIPyRe5pn1G+b6iZNxMl3+4TgTpwmL0oxuMi3eOBg7
         tz7nWate4OML25gXO8yDLplSQaA66p3hXMlkPptyp3BQSPJ6M4LUcWu/eFDq7nsuqd7v
         pp4rbc9HQGodA6eJwkibGWJEz/7SBu1jCXVyNtS/2UxgK3EHGmC8zCqio/sk51FcxgUG
         Aqo614xIEeFg3CWAv4nv0eMUZJmT4T6e4eyTXQQKFkvNCuO0FYkl8qWt8HuESyR9QXWM
         xTaMZvYmS98zoawBZLSlFG9jramhd8zdGNStuhOVX8D7bYXj7ayi8FLfL/aJ5UiRcKXJ
         cERA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id x12-v6si13951531pln.97.2018.05.21.07.04.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 May 2018 07:04:11 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fKlPy-0007e2-3l; Mon, 21 May 2018 15:04:06 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 04/27] Make address_space_map() take a MemTxAttrs argument
Date: Mon, 21 May 2018 15:03:39 +0100
Message-Id: <20180521140402.23318-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180521140402.23318-1-peter.maydell@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
X-TUID: u1+BlSy4J0A4

As part of plumbing MemTxAttrs down to the IOMMU translate method,
add MemTxAttrs as an argument to address_space_map().
Its callers either have an attrs value to hand, or don't care
and can use MEMTXATTRS_UNSPECIFIED.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/memory.h   | 3 ++-
 include/sysemu/dma.h    | 3 ++-
 exec.c                  | 6 ++++--
 target/ppc/mmu-hash64.c | 3 ++-
 4 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 9a30a1bb9e..b1bdb376d4 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1952,9 +1952,10 @@ bool address_space_access_valid(AddressSpace *as, hwaddr addr, int len, bool is_
  * @addr: address within that address space
  * @plen: pointer to length of buffer; updated on return
  * @is_write: indicates the transfer direction
+ * @attrs: memory attributes
  */
 void *address_space_map(AddressSpace *as, hwaddr addr,
-                        hwaddr *plen, bool is_write);
+                        hwaddr *plen, bool is_write, MemTxAttrs attrs);
 
 /* address_space_unmap: Unmaps a memory region previously mapped by address_space_map()
  *
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index c228c66513..0d73902634 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -132,7 +132,8 @@ static inline void *dma_memory_map(AddressSpace *as,
     hwaddr xlen = *len;
     void *p;
 
-    p = address_space_map(as, addr, &xlen, dir == DMA_DIRECTION_FROM_DEVICE);
+    p = address_space_map(as, addr, &xlen, dir == DMA_DIRECTION_FROM_DEVICE,
+                          MEMTXATTRS_UNSPECIFIED);
     *len = xlen;
     return p;
 }
diff --git a/exec.c b/exec.c
index d314c7cc39..1dc81cfe4a 100644
--- a/exec.c
+++ b/exec.c
@@ -3529,7 +3529,8 @@ flatview_extend_translation(FlatView *fv, hwaddr addr,
 void *address_space_map(AddressSpace *as,
                         hwaddr addr,
                         hwaddr *plen,
-                        bool is_write)
+                        bool is_write,
+                        MemTxAttrs attrs)
 {
     hwaddr len = *plen;
     hwaddr l, xlat;
@@ -3616,7 +3617,8 @@ void *cpu_physical_memory_map(hwaddr addr,
                               hwaddr *plen,
                               int is_write)
 {
-    return address_space_map(&address_space_memory, addr, plen, is_write);
+    return address_space_map(&address_space_memory, addr, plen, is_write,
+                             MEMTXATTRS_UNSPECIFIED);
 }
 
 void cpu_physical_memory_unmap(void *buffer, hwaddr len,
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index a1db20e3a8..aa200cba4c 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -431,7 +431,8 @@ const ppc_hash_pte64_t *ppc_hash64_map_hptes(PowerPCCPU *cpu,
         return NULL;
     }
 
-    hptes = address_space_map(CPU(cpu)->as, base + pte_offset, &plen, false);
+    hptes = address_space_map(CPU(cpu)->as, base + pte_offset, &plen, false,
+                              MEMTXATTRS_UNSPECIFIED);
     if (plen < (n * HASH_PTE_SIZE_64)) {
         hw_error("%s: Unable to map all requested HPTEs\n", __func__);
     }
-- 
2.17.0
