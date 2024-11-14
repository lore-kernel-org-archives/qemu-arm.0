Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp26490njc;
        Wed, 13 Nov 2024 17:15:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWQpPYXVAGx5bmBifaYJ529W7cAMD4rFc5iqWi0RYPdIR0EMGX2KaxlIqxPoOcZD55ntvDGbPefhkrTZA==@linaro.org
X-Received: by 2002:a5d:5986:0:b0:37d:53dd:4dec with SMTP id ffacd0b85a97d-381f186cbe0mr18870866f8f.15.1731546917427;
        Wed, 13 Nov 2024 17:15:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731546917; cv=none;
        d=google.com; s=arc-20240605;
        b=dErbdAErkrjHmwfTt3uLHmW2E9TIcdDOrWnyQ4atIrjniTdyMorlFShyi7/A34O3MP
         oSH7KXyySBfULRdteBqa3QWFynrOSKpuuEUXJNLOVH8uDirOF6JQ767zrKoy/1kiT/js
         MfqFCk8QKOqdw2IV+TQJGPyxNBEiq+sRM8XgjMTnCoPDUZYUM77KIXQLzEN+mHySE913
         PGgeDQCsyDhM64VMefxovF4nFVQGNS8qjJqjfbF0kpzkDsKmbWjok4ldsEzK9im5U/Cl
         RNufhtelC3J8HIoDXY99nGuNwtozhdDyIYNBZLh3U7l/ecMmUSS3/rbRmT1jTp0TJT0X
         JMbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ijxub0J6LSuaPkun5QktYbNZDFSQDSukz+hms+c1Ih0=;
        fh=uf5RcihjTGNM25mG4gB58+4AyrqpwerXREoNI2itjNs=;
        b=BLkDLgjVxt849LyBFA760/w/rF/LUorT9sRWwxd0BwSqNR02XvdTwNBThvOobs60ZR
         1Cd0HAn0yuWjnpnFHW9hHL4UIAPg5xfhyKCBk6H5Fo+PckQlKfSfGToZ/MXwzxLg/rib
         isSk4j4eumnMNjVhFt79IjLp+QHjeShotua62G9arkCd3qCL9YWfz0BTZxLVLYmZE03N
         HWMdCnZ0Mvo2tbKDyzN0sNipecHvOeK5iXX8kHenladJpZsLzKwUSnykycaNnX+Oj4aU
         B1mvqP/wUxFw7NykQ/N1nsRq3XdBdf/we1EUMYlgjCYw3RROWWUBhSQUmwdTN1lsjwwH
         KIxw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a3OV+qHJ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3821ad4bd90sor4769f8f.0.2024.11.13.17.15.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 17:15:17 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a3OV+qHJ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731546917; x=1732151717; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijxub0J6LSuaPkun5QktYbNZDFSQDSukz+hms+c1Ih0=;
        b=a3OV+qHJmgFovABen6YaiUtxIm7bGbLczKG5A1EWUo84VweaNXlw713ijGjQw9ty5O
         41GlCBlcHnG6VP8Yp1Hgdpo0izn00KE6kAKEqD+DdUS3HticQQ/7/VrzSvbzyisnlu2I
         Hcrn0TPAl8QxG6yh0lxnAmT3VrBftezZYExPG7j5//HUXpQU+b6q3+oE8TKl+606tWR7
         zUkrO06rICn9DWIOUvC9obq/DJOh2ygCCssZ8YJZhgKVwkxom3vpINgAj/Hh5+kxX7i1
         /MCE9Z/H6NNdufl0mmg4k3pnddg4HZ1tb1YdXeLH0qHFF3vRsbNjoNcshNIrPs+qzH2P
         EEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731546917; x=1732151717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ijxub0J6LSuaPkun5QktYbNZDFSQDSukz+hms+c1Ih0=;
        b=Iy6LlsxSSnuY5P851oV6dTtVtNXD9HL6JyeAP25Mwookp1e1sxaQCbBjTeDXUIDytW
         vvCY5/t1WukJYDdVglLF8RJfh93YG/pFM7+n/9MjfIYvNXgaj5NB/Vq0Fj+lGvLOb8p3
         ZGBuH+Y0I2QNH7dyJscVybbO7hI0u5Vy0GfngkszinGHXuvONtyodyUIFKnbHklXFZZ3
         1briBRqo7zAU1MVkqOHw5Nm0C96Jd+7yNkeaPlsRuRR8yviN1FO+NsAykhFb5KwGDUvl
         xZvqo/kE4sjF9nLv/8649DQxgEIqKIx66ZZAtr6QASJJvx0/fxRKa4fQ13ZFNLB+FCx2
         BkKg==
X-Forwarded-Encrypted: i=1; AJvYcCV1VgwttvaLEeyT1glekCUw9Atdz7TZQQrA0cU6ysJNaRrF+AS+KBQPMl3tDxUrsMvlC7BmPaGlu8PNjA==@linaro.org
X-Gm-Message-State: AOJu0YwDCZd+1axKVNlT6XONRuE9WHiMrViZc8bdmW5553N/AA2E5S8q
	gbtUUU4vW8R9HtMZ1r1OEXn7ItmWmloJXD4Du8lD5Bafhs2hbL6WGWpVf1uZNbgt+Q==
X-Google-Smtp-Source: AGHT+IFREe/JrPjo0y0t9M2Yxcx4JMxB17tQX6TF3pVR/3qVRL4KfJoVIRyzbtQL0IXAATDBdsI/jg==
X-Received: by 2002:a5d:6d83:0:b0:37d:49a1:40c7 with SMTP id ffacd0b85a97d-381f1872717mr19221825f8f.28.1731546916093;
        Wed, 13 Nov 2024 17:15:16 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.209.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed97c6b6sm19475690f8f.24.2024.11.13.17.15.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 13 Nov 2024 17:15:14 -0800 (PST)
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
Subject: [PATCH 15/24] exec: Declare tlb_set_page_full() in 'exec/cputlb.h'
Date: Thu, 14 Nov 2024 02:13:00 +0100
Message-ID: <20241114011310.3615-16-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114011310.3615-1-philmd@linaro.org>
References: <20241114011310.3615-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: giECk7OhklAR

Move CPU TLB related methods to "exec/cputlb.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cputlb.h     | 23 +++++++++++++++++++++++
 include/exec/exec-all.h   | 22 ----------------------
 target/sparc/mmu_helper.c |  2 +-
 3 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/include/exec/cputlb.h b/include/exec/cputlb.h
index 5386e53806..f6205d5306 100644
--- a/include/exec/cputlb.h
+++ b/include/exec/cputlb.h
@@ -21,6 +21,7 @@
 #define CPUTLB_H
 
 #include "exec/cpu-common.h"
+#include "exec/vaddr.h"
 
 #if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
 
@@ -57,4 +58,26 @@ void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length);
 
 #endif
 
+/**
+ * tlb_set_page_full:
+ * @cpu: CPU context
+ * @mmu_idx: mmu index of the tlb to modify
+ * @addr: virtual address of the entry to add
+ * @full: the details of the tlb entry
+ *
+ * Add an entry to @cpu tlb index @mmu_idx.  All of the fields of
+ * @full must be filled, except for xlat_section, and constitute
+ * the complete description of the translated page.
+ *
+ * This is generally called by the target tlb_fill function after
+ * having performed a successful page table walk to find the physical
+ * address and attributes for the translation.
+ *
+ * At most one entry for a given virtual address is permitted. Only a
+ * single TARGET_PAGE_SIZE region is mapped; @full->lg_page_size is only
+ * used by tlb_flush_page.
+ */
+void tlb_set_page_full(CPUState *cpu, int mmu_idx, vaddr addr,
+                       CPUTLBEntryFull *full);
+
 #endif
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index d792203773..79649537b0 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -174,28 +174,6 @@ void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *cpu,
                                                uint16_t idxmap,
                                                unsigned bits);
 
-/**
- * tlb_set_page_full:
- * @cpu: CPU context
- * @mmu_idx: mmu index of the tlb to modify
- * @addr: virtual address of the entry to add
- * @full: the details of the tlb entry
- *
- * Add an entry to @cpu tlb index @mmu_idx.  All of the fields of
- * @full must be filled, except for xlat_section, and constitute
- * the complete description of the translated page.
- *
- * This is generally called by the target tlb_fill function after
- * having performed a successful page table walk to find the physical
- * address and attributes for the translation.
- *
- * At most one entry for a given virtual address is permitted. Only a
- * single TARGET_PAGE_SIZE region is mapped; @full->lg_page_size is only
- * used by tlb_flush_page.
- */
-void tlb_set_page_full(CPUState *cpu, int mmu_idx, vaddr addr,
-                       CPUTLBEntryFull *full);
-
 /**
  * tlb_set_page_with_attrs:
  * @cpu: CPU to add this TLB entry for
diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index 9ff06026b8..7548d01777 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -20,7 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "cpu.h"
-#include "exec/exec-all.h"
+#include "exec/cputlb.h"
 #include "exec/page-protection.h"
 #include "qemu/qemu-print.h"
 #include "trace.h"
-- 
2.45.2
