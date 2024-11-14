Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp26571njc;
        Wed, 13 Nov 2024 17:15:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV+H1H7l/H5SbZ+0oasPwkXMOLVermtauJBNQumxi0Ub7iBGrG5Om2P0JHE/ddqf0+KSoQIcZk0daGFHA==@linaro.org
X-Received: by 2002:a05:6000:792:b0:382:d0b:5dc5 with SMTP id ffacd0b85a97d-3820d0b5e97mr4825118f8f.3.1731546924560;
        Wed, 13 Nov 2024 17:15:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731546924; cv=none;
        d=google.com; s=arc-20240605;
        b=Tq3iEcoLtBZUncHch9MHDG+fwyGI4w+iRMWz1ClauAIHuPRomozMGDd92qQZ9b15jj
         E021yWitjV16OI67eiFxsnb3zaKLTV+PvkYTwA7ELRWTD+jRtcm8LfCEviwahB23PzLN
         IXvJ/8c6qnMPVf67tXlM2a2pwAgKVx5Ddsu6u8djaQzFn2Z/UtL/hMXkQIUHCJd9qSGb
         T8/swBC1aoCKSvE/b29N/An7n/QBpxqmw0nkcjx4ywaIdqSZo6B/eBWCU4OKE8jCJzL8
         h4Hcl/wfBLnZCXArsuVP5ttMQQ9pnnw5SWGGnB1nRGCc2h+Aa+ooxX/mzS3fpzUBIgjV
         C4+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rUDaBZRCGe5XV9UkQASFR3nCzZYDHP53JFnYTigMJ4o=;
        fh=M0C0Vka/BM4HPDHTlFeLscVvvtu/qnL/wgZT+RqyZTw=;
        b=GQHuKptbGU1fnIPKAHeqcErb0lFhkUUlWf5zps00opg+Sndxj5YOfPES/kOvBgxCMP
         k/93eAm2D6qictj9nRzM/jUcNd8q0zTs0zh+jHOM5tmEZPCa8aORQL60GSH9pyQkkhRK
         UOTcmEwdyJS7o0twuz6G7bRrloJED2+6CvxrG/U/KKRbz5T496OwP7/YrDYLldGb9qDE
         f7rbLdKvGjednhwAk2s3pz6222PpOiou8x9vViZccRkToPAkpw/62eMOogyfYiSF7Wz7
         zjaiIRDcaNA6UAb0QbbxLLX4tyea8UTz+nVt4BXrDfqmkLZb2g96jzaPNICRJiCKLmPn
         Qj/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IYhuZBJG;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-381ed9ea902sor4591304f8f.6.2024.11.13.17.15.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 17:15:24 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IYhuZBJG;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731546924; x=1732151724; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUDaBZRCGe5XV9UkQASFR3nCzZYDHP53JFnYTigMJ4o=;
        b=IYhuZBJGNyXWU1kbKys1vPv96Yg27SPAiZ52bReiMlcXG7x54kjSCdZLkmm4TtR6Fz
         rv4n5vAXcEEfHDVaOMLBl1VAjYbRcI/1VRiUtzcOgdn6eyry2Il6WnAcfufuYHBIXNkE
         Sut5dolYnBZEUK7jMbVJt1MMKJgIAS0DoA+eq/ydXzLAD6HMj7jSUqJYjVJy9Z6Ibv1d
         JWUL97j3JSYI8ld/coBhHbGoepN/lKAQ44fmdQU1MRwTJepUzMkt9xazhI4AJmty3k44
         X3BcCEO7eJMdIkzQtnb/g5XD7ByUglgPSXpywhFMkKOMIDlw6IRqtb8ETfikmjSKHZK+
         9NVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731546924; x=1732151724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUDaBZRCGe5XV9UkQASFR3nCzZYDHP53JFnYTigMJ4o=;
        b=M4z9tiw17c7txfEyd7gu38vFH2UqjzvXNS9XF4NWmGz7Rpo155Qrf/VG/xRiudRaPH
         iG+jSfv5Y2PN2dOnXHjB8vJhxXy6NcyUbsnNv5kDt3GHPOUXwBpGc8f7lKVofxN2UX6o
         X8QcRSfV+ACnc1gTiyx5D3m3xG6m0walXDES28Rn6o0z9KtSAqGTSa2fVIZnuuKM4WXC
         wp1mGUK+8qc9dSAtuXq4nkltjssMzjN70KT9lSlb8h4wEpKiM9cDrXhP+g+aH72i1423
         Y42MEqdd/qCwQSyOoEEPoifk66okyayKWiBCt2ziHtyTdqmnAz04goubTCRjNdGA3/qw
         0SEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw7eqgWljZfmW8geWmRP/FOMHK8WAesQz0eHfjHrOoxAPNZ5HLNQSKCPxzl9rdAVeDMsADNOBRh08giQ==@linaro.org
X-Gm-Message-State: AOJu0YzsXN0qTB8kxp26G/UVT4nTDw8qptxsyRi1Le9TIGoxHoDXr3An
	EETewdYyjKwmcVCXZ846Tbeq3JHryi+4GY4xkHKj6UrGGbA21Zf+xbp2ped7t99+Bw==
X-Google-Smtp-Source: AGHT+IHsnUDtCJjwswsvou+rSW6UUntSAN1M9ewjVg4bTB1KhLSGIABGdWRRaamvym5hsGHe6A5/Vw==
X-Received: by 2002:a5d:6c64:0:b0:37d:528d:b8ad with SMTP id ffacd0b85a97d-381f1865423mr20754685f8f.6.1731546924040;
        Wed, 13 Nov 2024 17:15:24 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.209.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed987d95sm19924032f8f.44.2024.11.13.17.15.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 13 Nov 2024 17:15:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 16/24] exec: Declare tlb_set_page_with_attrs() in 'exec/cputlb.h'
Date: Thu, 14 Nov 2024 02:13:01 +0100
Message-ID: <20241114011310.3615-17-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114011310.3615-1-philmd@linaro.org>
References: <20241114011310.3615-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Edyboe7Dx3yl

Move CPU TLB related methods to "exec/cputlb.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cputlb.h                | 28 ++++++++++++++++++++++++++++
 include/exec/exec-all.h              | 25 -------------------------
 target/i386/tcg/sysemu/excp_helper.c |  2 +-
 target/microblaze/helper.c           |  2 +-
 4 files changed, 30 insertions(+), 27 deletions(-)

diff --git a/include/exec/cputlb.h b/include/exec/cputlb.h
index f6205d5306..ae4798a017 100644
--- a/include/exec/cputlb.h
+++ b/include/exec/cputlb.h
@@ -21,6 +21,8 @@
 #define CPUTLB_H
 
 #include "exec/cpu-common.h"
+#include "exec/hwaddr.h"
+#include "exec/memattrs.h"
 #include "exec/vaddr.h"
 
 #if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
@@ -80,4 +82,30 @@ void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length);
 void tlb_set_page_full(CPUState *cpu, int mmu_idx, vaddr addr,
                        CPUTLBEntryFull *full);
 
+/**
+ * tlb_set_page_with_attrs:
+ * @cpu: CPU to add this TLB entry for
+ * @addr: virtual address of page to add entry for
+ * @paddr: physical address of the page
+ * @attrs: memory transaction attributes
+ * @prot: access permissions (PAGE_READ/PAGE_WRITE/PAGE_EXEC bits)
+ * @mmu_idx: MMU index to insert TLB entry for
+ * @size: size of the page in bytes
+ *
+ * Add an entry to this CPU's TLB (a mapping from virtual address
+ * @addr to physical address @paddr) with the specified memory
+ * transaction attributes. This is generally called by the target CPU
+ * specific code after it has been called through the tlb_fill()
+ * entry point and performed a successful page table walk to find
+ * the physical address and attributes for the virtual address
+ * which provoked the TLB miss.
+ *
+ * At most one entry for a given virtual address is permitted. Only a
+ * single TARGET_PAGE_SIZE region is mapped; the supplied @size is only
+ * used by tlb_flush_page.
+ */
+void tlb_set_page_with_attrs(CPUState *cpu, vaddr addr,
+                             hwaddr paddr, MemTxAttrs attrs,
+                             int prot, int mmu_idx, vaddr size);
+
 #endif
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 79649537b0..2b314d658b 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -174,31 +174,6 @@ void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *cpu,
                                                uint16_t idxmap,
                                                unsigned bits);
 
-/**
- * tlb_set_page_with_attrs:
- * @cpu: CPU to add this TLB entry for
- * @addr: virtual address of page to add entry for
- * @paddr: physical address of the page
- * @attrs: memory transaction attributes
- * @prot: access permissions (PAGE_READ/PAGE_WRITE/PAGE_EXEC bits)
- * @mmu_idx: MMU index to insert TLB entry for
- * @size: size of the page in bytes
- *
- * Add an entry to this CPU's TLB (a mapping from virtual address
- * @addr to physical address @paddr) with the specified memory
- * transaction attributes. This is generally called by the target CPU
- * specific code after it has been called through the tlb_fill()
- * entry point and performed a successful page table walk to find
- * the physical address and attributes for the virtual address
- * which provoked the TLB miss.
- *
- * At most one entry for a given virtual address is permitted. Only a
- * single TARGET_PAGE_SIZE region is mapped; the supplied @size is only
- * used by tlb_flush_page.
- */
-void tlb_set_page_with_attrs(CPUState *cpu, vaddr addr,
-                             hwaddr paddr, MemTxAttrs attrs,
-                             int prot, int mmu_idx, vaddr size);
 /* tlb_set_page:
  *
  * This function is equivalent to calling tlb_set_page_with_attrs()
diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index da187c8792..cda0152b80 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -20,7 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/cpu_ldst.h"
-#include "exec/exec-all.h"
+#include "exec/cputlb.h"
 #include "exec/page-protection.h"
 #include "tcg/helper-tcg.h"
 
diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
index 5d3259ce31..27fc929bee 100644
--- a/target/microblaze/helper.c
+++ b/target/microblaze/helper.c
@@ -20,7 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/exec-all.h"
+#include "exec/cputlb.h"
 #include "exec/page-protection.h"
 #include "qemu/host-utils.h"
 #include "exec/log.h"
-- 
2.45.2
