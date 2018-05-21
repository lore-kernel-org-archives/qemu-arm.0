Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp311117wme;
        Mon, 21 May 2018 07:04:07 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqQL9bKayl0Ib6flkKP1Y7TYCx1VpC2upI/rtllZ1jv4S+Rqmt5tSRQL3AGa/DXMlI0J2EJ
X-Received: by 2002:a1c:1047:: with SMTP id 68-v6mr10681915wmq.132.1526911447286;
        Mon, 21 May 2018 07:04:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526911447; cv=none;
        d=google.com; s=arc-20160816;
        b=AdD3vxTmIXbH682f6xhZjS0tHzI7PpjF+6qnxfXyYAtHn0nBLxUDQh6IBezi8a50ab
         7r2GrzWHMIDefdb1BaA9vxF6s6qK9ZzWz3wqUSQbMcoDk8sxsLPOuquor5sv0jh9JClo
         NXPt/tlKp0A3/428KBZddIpUhFTm01oyAwEyrb0TDNCqvPP+6/EJowdtIwPtD9muUWkI
         L5lErx5v3ZkN40p7wLT7Qkmk34CZmjNpSoxAhZenwZnpPg2GMnSOEVo8g29V5Tnf2iSV
         7mINCG6E5jyKzXlJqeSVsH2kPs4/QnSjnQ1aYjhxcQm4gK99JzfvRLi30VabkHq9d/9+
         0jTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=on1S9H5+22N32L1QI/5Yf24zKxkoMS+XYc21xzXvQtc=;
        b=cbHF+dTS63muM6ttpMFOt06+ixrumrkxYusqpI0AymkJNKcT9vcbQxyxrBM1mDD29f
         KsaZhBY1ndUarcZQS7AEs+JoViH2uWQfKTSCHWV9lizsI4jFsqDw8/06dNPyqpKeMp6s
         HNYLBEcfOGzd5LbIFFNSJLr3p6hvNeGrduVfLndrbxBGP60RNfh3U4X2v8PUwrtpJcm9
         gZHs1tZFD57TU4kpftkLWjOEaChIbo3Gk0tNmzfcmZH5GVGP35WnHqVtplb4kLoqtzL4
         QSEjekvBwacmNoMljZooAkVkm6W+yBFopkipgoXe5Vcg0YF7y0Nlkjl4QVoBh9bw3FEO
         8vwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id g188-v6si10395296wmg.58.2018.05.21.07.04.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 May 2018 07:04:07 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fKlPy-0007eb-Pq; Mon, 21 May 2018 15:04:06 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 05/27] Make address_space_access_valid() take a MemTxAttrs argument
Date: Mon, 21 May 2018 15:03:40 +0100
Message-Id: <20180521140402.23318-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180521140402.23318-1-peter.maydell@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
X-TUID: VCUwDrQVLda6

As part of plumbing MemTxAttrs down to the IOMMU translate method,
add MemTxAttrs as an argument to address_space_access_valid().
Its callers either have an attrs value to hand, or don't care
and can use MEMTXATTRS_UNSPECIFIED.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/memory.h      | 4 +++-
 include/sysemu/dma.h       | 3 ++-
 exec.c                     | 3 ++-
 target/s390x/diag.c        | 6 ++++--
 target/s390x/excp_helper.c | 3 ++-
 target/s390x/mmu_helper.c  | 3 ++-
 target/s390x/sigp.c        | 3 ++-
 7 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index b1bdb376d4..54263bd23b 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1937,8 +1937,10 @@ static inline MemoryRegion *address_space_translate(AddressSpace *as,
  * @addr: address within that address space
  * @len: length of the area to be checked
  * @is_write: indicates the transfer direction
+ * @attrs: memory attributes
  */
-bool address_space_access_valid(AddressSpace *as, hwaddr addr, int len, bool is_write);
+bool address_space_access_valid(AddressSpace *as, hwaddr addr, int len,
+                                bool is_write, MemTxAttrs attrs);
 
 /* address_space_map: map a physical memory region into a host virtual address
  *
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 0d73902634..5da3c4e3c5 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -77,7 +77,8 @@ static inline bool dma_memory_valid(AddressSpace *as,
                                     DMADirection dir)
 {
     return address_space_access_valid(as, addr, len,
-                                      dir == DMA_DIRECTION_FROM_DEVICE);
+                                      dir == DMA_DIRECTION_FROM_DEVICE,
+                                      MEMTXATTRS_UNSPECIFIED);
 }
 
 static inline int dma_memory_rw_relaxed(AddressSpace *as, dma_addr_t addr,
diff --git a/exec.c b/exec.c
index 1dc81cfe4a..22af4e8cb9 100644
--- a/exec.c
+++ b/exec.c
@@ -3480,7 +3480,8 @@ static bool flatview_access_valid(FlatView *fv, hwaddr addr, int len,
 }
 
 bool address_space_access_valid(AddressSpace *as, hwaddr addr,
-                                int len, bool is_write)
+                                int len, bool is_write,
+                                MemTxAttrs attrs)
 {
     FlatView *fv;
     bool result;
diff --git a/target/s390x/diag.c b/target/s390x/diag.c
index ac2c40f363..d1d3433aa7 100644
--- a/target/s390x/diag.c
+++ b/target/s390x/diag.c
@@ -87,7 +87,8 @@ void handle_diag_308(CPUS390XState *env, uint64_t r1, uint64_t r3, uintptr_t ra)
             return;
         }
         if (!address_space_access_valid(&address_space_memory, addr,
-                                        sizeof(IplParameterBlock), false)) {
+                                        sizeof(IplParameterBlock), false,
+                                        MEMTXATTRS_UNSPECIFIED)) {
             s390_program_interrupt(env, PGM_ADDRESSING, ILEN_AUTO, ra);
             return;
         }
@@ -116,7 +117,8 @@ out:
             return;
         }
         if (!address_space_access_valid(&address_space_memory, addr,
-                                        sizeof(IplParameterBlock), true)) {
+                                        sizeof(IplParameterBlock), true,
+                                        MEMTXATTRS_UNSPECIFIED)) {
             s390_program_interrupt(env, PGM_ADDRESSING, ILEN_AUTO, ra);
             return;
         }
diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
index dfee221111..f0ce60cff2 100644
--- a/target/s390x/excp_helper.c
+++ b/target/s390x/excp_helper.c
@@ -120,7 +120,8 @@ int s390_cpu_handle_mmu_fault(CPUState *cs, vaddr orig_vaddr, int size,
 
     /* check out of RAM access */
     if (!address_space_access_valid(&address_space_memory, raddr,
-                                    TARGET_PAGE_SIZE, rw)) {
+                                    TARGET_PAGE_SIZE, rw,
+                                    MEMTXATTRS_UNSPECIFIED)) {
         DPRINTF("%s: raddr %" PRIx64 " > ram_size %" PRIx64 "\n", __func__,
                 (uint64_t)raddr, (uint64_t)ram_size);
         trigger_pgm_exception(env, PGM_ADDRESSING, ILEN_AUTO);
diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index a25deef5dd..145b62a7ef 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -461,7 +461,8 @@ static int translate_pages(S390CPU *cpu, vaddr addr, int nr_pages,
             return ret;
         }
         if (!address_space_access_valid(&address_space_memory, pages[i],
-                                        TARGET_PAGE_SIZE, is_write)) {
+                                        TARGET_PAGE_SIZE, is_write,
+                                        MEMTXATTRS_UNSPECIFIED)) {
             trigger_access_exception(env, PGM_ADDRESSING, ILEN_AUTO, 0);
             return -EFAULT;
         }
diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
index aff1530c82..c1f9245797 100644
--- a/target/s390x/sigp.c
+++ b/target/s390x/sigp.c
@@ -280,7 +280,8 @@ static void sigp_set_prefix(CPUState *cs, run_on_cpu_data arg)
     cpu_synchronize_state(cs);
 
     if (!address_space_access_valid(&address_space_memory, addr,
-                                    sizeof(struct LowCore), false)) {
+                                    sizeof(struct LowCore), false,
+                                    MEMTXATTRS_UNSPECIFIED)) {
         set_sigp_status(si, SIGP_STAT_INVALID_PARAMETER);
         return;
     }
-- 
2.17.0
