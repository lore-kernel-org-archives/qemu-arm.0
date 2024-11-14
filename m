Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp26789njc;
        Wed, 13 Nov 2024 17:15:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVp23ILcTI9kcA6kSaFExw0LytuPwPtuNlmxXmcgHHamkp3mDgOYTPIx9k2DgzL9dJqwP+llAy+Gp0+Qg==@linaro.org
X-Received: by 2002:a05:600c:138a:b0:431:59ab:15cf with SMTP id 5b1f17b1804b1-432b75061c3mr195995555e9.19.1731546948277;
        Wed, 13 Nov 2024 17:15:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731546948; cv=none;
        d=google.com; s=arc-20240605;
        b=L6bXeo4JRdKm8+sugKLBDDjzIqSphdO3TI4nn3MvdfnxyXh1CdqhJOJZiNssCi3ALm
         DjZE6uU4YwpEiXQTzB4CZLkkD1AzusfA1mgnYq2mz23k3dFamhAxklYztj8gWHLOF+I1
         n/29604+FrOkUNXvrRkCNlT2/9HItjc/aTdQLm69T1DtprIESG4O42vPr/tg4FIgB4LY
         VrR1aP0nABtQdaQ85DMgDq83y4f0WW1sq2pzp9pEcwVCFFAnlXCZIlCBuICaA2WTkxNn
         88ZiKFYWViiHrQ2FSljX923HOyfrlTU9W8M01GPhX+iE7QdUPmKTpe4bsweR21D09GyC
         wOUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=47l8bIL01QRkGakpDpfE8XrYcUIw9iQZ4Ki9frTlDYk=;
        fh=6IHg5/bGRqpMFUziYtUfjIP2htmr5hFebkISSd25m/k=;
        b=DxL5OYYfgnKLuNCMEq9V/YocVo5alpY99Jl3WKM/rjesO7GV3pFNXeFuVsM/l//kvp
         5QWSj1MTt3lvblh3geTmVoTI20mn+nQirhGCETexYzETosPbvixqvyOkarwfsLVqeMmB
         jyPuHBFFsx55zB/XZkzk2J08KRRjPEV68RVQli4CxWkZtuugWkuAPG5b2QmQY/CowEAc
         nsx06Hn7tzLjWFMJ9Q/z7eHeeadvC/ble+qR3upWWD0azPP7avs7wOrjGLQLN0O4RP1P
         MGmDRRyb4C6hXsltz2fx7fcpYvMNfmp1gFRqH2OGFkWQMORwmBJmEE4fJp4/cO2NqBC0
         Iqjw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F4gfmD0J;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-432b0baa5d8sor61668725e9.12.2024.11.13.17.15.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 17:15:48 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F4gfmD0J;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731546948; x=1732151748; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47l8bIL01QRkGakpDpfE8XrYcUIw9iQZ4Ki9frTlDYk=;
        b=F4gfmD0JpSe9IKA++qdUjWi/JxCRap4omvMrvi+btCXGfiPKhMDP3OybQ46vjaiHK5
         PWbWqkBU286H4+NYOK+UXyN3HRWaliVREQ9jyaPwpbCI6NPdawicsn3VyS6oR8SBHBwS
         +qqQE8Rm9zEy9hr931sN/lEVAAdq+kCNyfBpLe7gTEZZpcvGCYr/gfIvYEsdJ/rswrcr
         rtN62Vas6Dh4GJ6zuMBhCo3bnFcjjJ5VcqO9Q20XokeDGuq7V3vwv1I3riH1vlkbhsh8
         f4JtgY8mgqG4JxMY0aYB+kR80YXVvfVmqRMtOKtBqIgmC1VkkWUDNGtbMu7Hd4e6nLnC
         mnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731546948; x=1732151748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47l8bIL01QRkGakpDpfE8XrYcUIw9iQZ4Ki9frTlDYk=;
        b=At1AU/xONPgwWfokBfllT01kZC5amb82b1z9619oBRMklj5TusPbbw0vlNeOapfLxd
         uiKcfScuUydMnQbDj4fx3Glgpk99P2fxP7RDq2wnGE+QB3t6R7ClnVsDAEN1ws5S7PXb
         yYYrtof0lGXYgKS0yChkCVTODB8CHSa4bN9fXQqD0BrJMb3SbRWoX5+FCH7QNaODG7Rz
         rtgGU4mUyRsoeAEv8gZyuXht7UqP2mDAE7hi1b88Pdj5dozxeAoXDgA2yhCHYEg2qF8j
         SSzOWsF4w5mgx4uqPP/Ae12RB8KeqVA1CdTa/uQQdOFPGC7AIWNVAFB1PCS4023VCPqb
         8GbA==
X-Forwarded-Encrypted: i=1; AJvYcCUqQz3Wqjqd+1O95/Ghi09MPuSdtOsMQsc1PdGwBXpe/g8wDfnnZc/dxZv34eEKlWgK6endp3w7UUNC3g==@linaro.org
X-Gm-Message-State: AOJu0YzsAjFxXUpr/CJ7OR7e8Y/5TSbtUjzI4bEcNYBu/F88ecg5n7fF
	Kd5/LRbqBPGIr7kibxAFL31DJBrnLdohNOsau25pMKvPAB0x6Etwl2uBd72Zt+ATeg==
X-Google-Smtp-Source: AGHT+IGm4IkujNwbvXU0PfthP+KilYpmsFGPbZN2Ec16W6AxewEFOjqxxAMvc9mYtsMmC6kajJV0Dg==
X-Received: by 2002:a05:6000:1868:b0:374:c3e4:d6de with SMTP id ffacd0b85a97d-381f1885dd9mr19331385f8f.41.1731546947775;
        Wed, 13 Nov 2024 17:15:47 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.209.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9719easm20201050f8f.9.2024.11.13.17.15.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 13 Nov 2024 17:15:46 -0800 (PST)
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
Subject: [PATCH 19/24] exec: Declare tlb_hit*() in 'exec/cputlb.h'
Date: Thu, 14 Nov 2024 02:13:04 +0100
Message-ID: <20241114011310.3615-20-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114011310.3615-1-philmd@linaro.org>
References: <20241114011310.3615-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: AargECU7t/+D

Move CPU TLB related methods to "exec/cputlb.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu-all.h | 23 -----------------------
 accel/tcg/cputlb.c     | 23 +++++++++++++++++++++++
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 1c8e0446d0..ccaa650b19 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -323,29 +323,6 @@ static inline int cpu_mmu_index(CPUState *cs, bool ifetch)
 /* The two sets of flags must not overlap. */
 QEMU_BUILD_BUG_ON(TLB_FLAGS_MASK & TLB_SLOW_FLAGS_MASK);
 
-/**
- * tlb_hit_page: return true if page aligned @addr is a hit against the
- * TLB entry @tlb_addr
- *
- * @addr: virtual address to test (must be page aligned)
- * @tlb_addr: TLB entry address (a CPUTLBEntry addr_read/write/code value)
- */
-static inline bool tlb_hit_page(uint64_t tlb_addr, vaddr addr)
-{
-    return addr == (tlb_addr & (TARGET_PAGE_MASK | TLB_INVALID_MASK));
-}
-
-/**
- * tlb_hit: return true if @addr is a hit against the TLB entry @tlb_addr
- *
- * @addr: virtual address to test (need not be page aligned)
- * @tlb_addr: TLB entry address (a CPUTLBEntry addr_read/write/code value)
- */
-static inline bool tlb_hit(uint64_t tlb_addr, vaddr addr)
-{
-    return tlb_hit_page(tlb_addr, addr & TARGET_PAGE_MASK);
-}
-
 #endif /* !CONFIG_USER_ONLY */
 
 /* Validate correct placement of CPUArchState. */
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 080cbcb34d..dba4831cd1 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1220,6 +1220,29 @@ void tlb_set_page(CPUState *cpu, vaddr addr,
                             prot, mmu_idx, size);
 }
 
+/**
+ * tlb_hit_page: return true if page aligned @addr is a hit against the
+ * TLB entry @tlb_addr
+ *
+ * @addr: virtual address to test (must be page aligned)
+ * @tlb_addr: TLB entry address (a CPUTLBEntry addr_read/write/code value)
+ */
+static inline bool tlb_hit_page(uint64_t tlb_addr, vaddr addr)
+{
+    return addr == (tlb_addr & (TARGET_PAGE_MASK | TLB_INVALID_MASK));
+}
+
+/**
+ * tlb_hit: return true if @addr is a hit against the TLB entry @tlb_addr
+ *
+ * @addr: virtual address to test (need not be page aligned)
+ * @tlb_addr: TLB entry address (a CPUTLBEntry addr_read/write/code value)
+ */
+static inline bool tlb_hit(uint64_t tlb_addr, vaddr addr)
+{
+    return tlb_hit_page(tlb_addr, addr & TARGET_PAGE_MASK);
+}
+
 /*
  * Note: tlb_fill_align() can trigger a resize of the TLB.
  * This means that all of the caller's prior references to the TLB table
-- 
2.45.2
