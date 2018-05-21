Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp311211wme;
        Mon, 21 May 2018 07:04:10 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZo9356g5QsRnFNk608jpzKMbSF293JBhRCI99Cpfglo/URkQMkRevq8UGx/0WR0+X6tx6oJ
X-Received: by 2002:a2e:52d2:: with SMTP id n79-v6mr11934269lje.146.1526911450641;
        Mon, 21 May 2018 07:04:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526911450; cv=none;
        d=google.com; s=arc-20160816;
        b=iINynowQyp4dtaC0kxjFs+t/EKRlc2JZ65E064hxMI6ba4zW555D5/860pX2B5S+DX
         OniURyy6uPZW1WydeBShZb/f56WJ8FggA0gWayrK2pkxfndajPjv+1cB7e9gXKCNyXaT
         D+vh81+nPO4cpULrZZKwc/+Es2hf7cQA3ZfWulA2NqSY9GhkbHmmxr6Rh9X7dt/Df714
         AOO1coVAtlnrgxztOU9eR126qYOa4WbkKUaiJkF8F5yLpoQS6O9SKH+s97gjPx888in+
         4v3n9WCgqVyugmfH7IikV5Zceegng0Z2QuTukDeMZCUJkh7s2cEL/KLqg9m6G5ouhyCa
         /ylQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=zOR/MZgS7Mn7yhWKNR+pQK/OXzdmn/f+qJPGbP0bsyY=;
        b=AAUZPs44bBprebjEOJ5/FhonPjhQ9wUQzLX9NLN7RZE9SrJPQgwYqRzZcPlRJUblA4
         l04/gUH25RSi3veIQ1AePtIPWAo+ToYOlTFJ0qE51aBJezIyGGOLtWytxYirn70gMXET
         1VXotSzc2TQS8vL+1yQ3cS9ZZq1B4LMtLxI4M8pzlJp+aR4anqEECtxhPO/yU5H4UDkf
         XQW2fFCPZIrg+a2MBl68CJWbrcVLwT4q+OTjHrZ8WUKTqjsHiOai0ZnattzkNE6otRQn
         5U6VNkYXUEGdqCpzXS3q2lTR8fh3PUyEoNxgMobx9G66av0W8HkJPjfmdNoDTIOXlXjI
         sdtg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id e11-v6si5608000ljb.88.2018.05.21.07.04.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 May 2018 07:04:10 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fKlQ1-0007gD-0B; Mon, 21 May 2018 15:04:09 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 08/27] Make MemoryRegion valid.accepts callback take a MemTxAttrs argument
Date: Mon, 21 May 2018 15:03:43 +0100
Message-Id: <20180521140402.23318-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180521140402.23318-1-peter.maydell@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
X-TUID: 8/oFnf95hMB2

As part of plumbing MemTxAttrs down to the IOMMU translate method,
add MemTxAttrs as an argument to the MemoryRegion valid.accepts
callback. We'll need this for subpage_accepts().

We could take the approach we used with the read and write
callbacks and add new a new _with_attrs version, but since there
are so few implementations of the accepts hook we just change
them all.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/memory.h |  3 ++-
 exec.c                |  9 ++++++---
 hw/hppa/dino.c        |  3 ++-
 hw/nvram/fw_cfg.c     | 12 ++++++++----
 hw/scsi/esp.c         |  3 ++-
 hw/xen/xen_pt_msi.c   |  3 ++-
 memory.c              |  5 +++--
 7 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 54263bd23b..444fceac55 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -166,7 +166,8 @@ struct MemoryRegionOps {
          * as a machine check exception).
          */
         bool (*accepts)(void *opaque, hwaddr addr,
-                        unsigned size, bool is_write);
+                        unsigned size, bool is_write,
+                        MemTxAttrs attrs);
     } valid;
     /* Internal implementation constraints: */
     struct {
diff --git a/exec.c b/exec.c
index 6cf97b5d28..b58eb0fedd 100644
--- a/exec.c
+++ b/exec.c
@@ -2539,7 +2539,8 @@ static void notdirty_mem_write(void *opaque, hwaddr ram_addr,
 }
 
 static bool notdirty_mem_accepts(void *opaque, hwaddr addr,
-                                 unsigned size, bool is_write)
+                                 unsigned size, bool is_write,
+                                 MemTxAttrs attrs)
 {
     return is_write;
 }
@@ -2762,7 +2763,8 @@ static MemTxResult subpage_write(void *opaque, hwaddr addr,
 }
 
 static bool subpage_accepts(void *opaque, hwaddr addr,
-                            unsigned len, bool is_write)
+                            unsigned len, bool is_write,
+                            MemTxAttrs attrs)
 {
     subpage_t *subpage = opaque;
 #if defined(DEBUG_SUBPAGE)
@@ -2845,7 +2847,8 @@ static void readonly_mem_write(void *opaque, hwaddr addr,
 }
 
 static bool readonly_mem_accepts(void *opaque, hwaddr addr,
-                                 unsigned size, bool is_write)
+                                 unsigned size, bool is_write,
+                                 MemTxAttrs attrs)
 {
     return is_write;
 }
diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index 15aefde09c..77463672a3 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -137,7 +137,8 @@ static void gsc_to_pci_forwarding(DinoState *s)
 }
 
 static bool dino_chip_mem_valid(void *opaque, hwaddr addr,
-                                unsigned size, bool is_write)
+                                unsigned size, bool is_write,
+                                MemTxAttrs attrs)
 {
     switch (addr) {
     case DINO_IAR0:
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 2a0739d0e9..b23e7f64a8 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -420,14 +420,16 @@ static void fw_cfg_dma_mem_write(void *opaque, hwaddr addr,
 }
 
 static bool fw_cfg_dma_mem_valid(void *opaque, hwaddr addr,
-                                  unsigned size, bool is_write)
+                                 unsigned size, bool is_write,
+                                 MemTxAttrs attrs)
 {
     return !is_write || ((size == 4 && (addr == 0 || addr == 4)) ||
                          (size == 8 && addr == 0));
 }
 
 static bool fw_cfg_data_mem_valid(void *opaque, hwaddr addr,
-                                  unsigned size, bool is_write)
+                                  unsigned size, bool is_write,
+                                  MemTxAttrs attrs)
 {
     return addr == 0;
 }
@@ -439,7 +441,8 @@ static void fw_cfg_ctl_mem_write(void *opaque, hwaddr addr,
 }
 
 static bool fw_cfg_ctl_mem_valid(void *opaque, hwaddr addr,
-                                 unsigned size, bool is_write)
+                                 unsigned size, bool is_write,
+                                 MemTxAttrs attrs)
 {
     return is_write && size == 2;
 }
@@ -458,7 +461,8 @@ static void fw_cfg_comb_write(void *opaque, hwaddr addr,
 }
 
 static bool fw_cfg_comb_valid(void *opaque, hwaddr addr,
-                                  unsigned size, bool is_write)
+                              unsigned size, bool is_write,
+                              MemTxAttrs attrs)
 {
     return (size == 1) || (is_write && size == 2);
 }
diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 64ec285826..9ed9727744 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -564,7 +564,8 @@ void esp_reg_write(ESPState *s, uint32_t saddr, uint64_t val)
 }
 
 static bool esp_mem_accepts(void *opaque, hwaddr addr,
-                            unsigned size, bool is_write)
+                            unsigned size, bool is_write,
+                            MemTxAttrs attrs)
 {
     return (size == 1) || (is_write && size == 4);
 }
diff --git a/hw/xen/xen_pt_msi.c b/hw/xen/xen_pt_msi.c
index 6d1e3bdeb4..cc514f9157 100644
--- a/hw/xen/xen_pt_msi.c
+++ b/hw/xen/xen_pt_msi.c
@@ -498,7 +498,8 @@ static uint64_t pci_msix_read(void *opaque, hwaddr addr,
 }
 
 static bool pci_msix_accepts(void *opaque, hwaddr addr,
-                             unsigned size, bool is_write)
+                             unsigned size, bool is_write,
+                             MemTxAttrs attrs)
 {
     return !(addr & (size - 1));
 }
diff --git a/memory.c b/memory.c
index 279f7c9b4a..10fa2ddd31 100644
--- a/memory.c
+++ b/memory.c
@@ -1269,7 +1269,8 @@ static void unassigned_mem_write(void *opaque, hwaddr addr,
 }
 
 static bool unassigned_mem_accepts(void *opaque, hwaddr addr,
-                                   unsigned size, bool is_write)
+                                   unsigned size, bool is_write,
+                                   MemTxAttrs attrs)
 {
     return false;
 }
@@ -1374,7 +1375,7 @@ bool memory_region_access_valid(MemoryRegion *mr,
     access_size = MAX(MIN(size, access_size_max), access_size_min);
     for (i = 0; i < size; i += access_size) {
         if (!mr->ops->valid.accepts(mr->opaque, addr + i, access_size,
-                                    is_write)) {
+                                    is_write, attrs)) {
             return false;
         }
     }
-- 
2.17.0
