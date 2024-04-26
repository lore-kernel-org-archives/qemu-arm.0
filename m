Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp638853ejb;
        Fri, 26 Apr 2024 12:47:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXd7oH5488LrIIBtYMT316Z7r1cHTKpeNWITXQgazjFDKSFyPRt1UuntIlYAKBYVIDl82o1hyuCiMlLy/wYgupW9J6EqK4W
X-Google-Smtp-Source: AGHT+IHt0hTw1In6ISd4C4Mst5pIQGV1acRy8+oaZpOijOi2sSp+LMw91yFO3n05C6LEgprysV+5
X-Received: by 2002:ac8:58c4:0:b0:436:8356:bf5 with SMTP id u4-20020ac858c4000000b0043683560bf5mr4654830qta.60.1714160851480;
        Fri, 26 Apr 2024 12:47:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714160851; cv=none;
        d=google.com; s=arc-20160816;
        b=dZGj3OJ2tprZzI/EZPF2Cx4q4JrAfThwYAZ1UbpRNI4pW+6ONxNT4sBX3TbJ7Jm9IQ
         I0Wa9sdGM+dmFyNNejOzyYMUOn/9S7r5N2mJESH4NBzmOGJrGVT7oyfcv5Vriv41p+6a
         BFXAOpU8qhiQ3/9SYW7DSllU4AspygmTSr5D+PdTMbb/MWNNb7AbE2QUgYkSyP0qpMXH
         vbZcpNgx4/NJKOO5nF8OiUTp6gSE93Fq68u7bk7Srs4ShgKypd2DEW06u4IEOGNHgrf5
         1Fu5/lQCON9VVMpt7JPn0LlBG/snQPFERC0d0krh4Vnh5e1LV5GsePpZJtMLv2xveoc2
         lseQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1K8YiKF1aId8lywgtec1SE+/hOSGvJR5IQSEQZIayng=;
        fh=gUEsd95llBLtqUKhUnPIoHQ/SNwiv/bmtZ7rMzFWY9Q=;
        b=T7bfLx1/y6c+PyeBQ7BxpbfM6eI6pbPpJxZRPv6peuen2Rh2+Fxc9tNE9oL1zYy2SF
         taXePUbECeVLa9KBYdNdyUPsydvH0DVB9Xq5cAjx/83JZ+KWvy73etdf6avjESP1CcrQ
         nbr7nh/495GP+HF9bmhkkIcL1D2RZ51bSryEthxeM1hEcCQnKCtZvjZO8XgNVJPy6QkO
         cI59xH96BfnoCqCbE985LIJE0GV027yl2LRhJVR7sf+0ZgGuGTJtaKXWmPc0c3fSR2XO
         iwlFnK9zef0CoQggyXB2R91t68OYxQkmc1V69ifxgVwasTO/1AdwSKZYddXM70WDdW85
         9jqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ivfiCW9h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q10-20020a05622a030a00b0043980cb7578si15527676qtw.629.2024.04.26.12.47.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 12:47:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ivfiCW9h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0RVu-0002fC-6r; Fri, 26 Apr 2024 15:45:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RVq-0002Nn-TX
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:45:39 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RVo-0004nC-Hj
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:45:38 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-572511ae0c2so1677873a12.3
 for <qemu-arm@nongnu.org>; Fri, 26 Apr 2024 12:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160735; x=1714765535; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1K8YiKF1aId8lywgtec1SE+/hOSGvJR5IQSEQZIayng=;
 b=ivfiCW9hgdA8Nl9aV1jfsO+g+9BR4000Df/iY/egOXKgRXsvAA33hc7VLVWSK9BJz1
 kvglLqeHVinuFNW40D4nFZ7elGjLmJLgo5wV4vRT/P32PF1JAoezpj36/+6R8XsTk6Ur
 phxXYuVu/2zWiZFeFnhxGRXwejfBrkL0wLECaud659mdE3UG7ofSSis0BgXT+GNWCtvi
 55VK+v2G2q6/9jtgJSWbL3x3e7UrKiuGJ8zUZSxHzsE/gHl2HIwRwA5O/HVAtf2ore8M
 KRHYRGygP8jXYNYiXIwy9JB3TeiGfq9e0aFg7qzO+4IPuj9AiHzgai2nqETMG9zwzVXe
 Rzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160735; x=1714765535;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1K8YiKF1aId8lywgtec1SE+/hOSGvJR5IQSEQZIayng=;
 b=CR0cnzrbI0ZDiRtZcCLVfeyLBcK6ADrqCkElNEYnVUmhQh8w9FonvfUZV+6j6br4Ls
 +uQfWZ6ceenrfdrRMUkbyX0+uvS8w9lwUDF0G33y3vAd4yaL3bBTgqPwqxS1Wwzcqhd1
 YXHgAu9GbMrwoZJipulmznGEvsa4Omp2zRZggtMmnZyihqK4RdgC6rIKxTCz9iCV2+LV
 bhI/tYXe2ONXQd3z67eifaAbGtVmdA10ylpy1Op4RYUTs+Jl/GtKbLR/KAKlYDanrr4b
 JmGP77f4O4698vrW5FvUJU9PrMfG5N++th07BgnW1WqECAUp1YEZI8QgjGaAsAe4nLQ1
 +sAA==
X-Gm-Message-State: AOJu0YyXT3JAc8RoPSx1WDrfSFg6W4fO5YtUarQ2Ev74aC//7HNvMD31
 VIJOBZvG+U6Qh9Ii8xeJN3VMl7pf1mwgw/jsy2gLjzlhSrsmhEhC3FvZYbz2i+A=
X-Received: by 2002:a50:cd15:0:b0:56e:2e0:79d1 with SMTP id
 z21-20020a50cd15000000b0056e02e079d1mr2851870edi.4.1714160735082; 
 Fri, 26 Apr 2024 12:45:35 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 fk6-20020a056402398600b00571ba529bbasm10313860edb.44.2024.04.26.12.45.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:45:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 36/38] exec: Move CPUTLBEntry helpers to cputlb.c
Date: Fri, 26 Apr 2024 21:41:56 +0200
Message-ID: <20240426194200.43723-37-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gwKgimVv7Ppc

The following CPUTLBEntry helpers are only used in accel/tcg/cputlb.c:
  - tlb_index()
  - tlb_entry()
  - tlb_read_idx()
  - tlb_addr_write()

Move them to this file, allowing to remove the huge "cpu.h" header
inclusion from "exec/cpu_ldst.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240418192525.97451-13-philmd@linaro.org>
---
 include/exec/cpu_ldst.h | 55 -----------------------------------------
 accel/tcg/cputlb.c      | 51 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+), 55 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 7d0a0412ad..11ba3778ba 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -70,7 +70,6 @@
 #include "exec/abi_ptr.h"
 #include "exec/mmu-access-type.h"
 #include "qemu/int128.h"
-#include "cpu.h"
 
 #if defined(CONFIG_USER_ONLY)
 
@@ -296,60 +295,6 @@ Int128 cpu_atomic_cmpxchgo_be_mmu(CPUArchState *env, abi_ptr addr,
                                   Int128 cmpv, Int128 newv,
                                   MemOpIdx oi, uintptr_t retaddr);
 
-#if !defined(CONFIG_USER_ONLY)
-
-#include "tcg/oversized-guest.h"
-
-static inline uint64_t tlb_read_idx(const CPUTLBEntry *entry,
-                                    MMUAccessType access_type)
-{
-    /* Do not rearrange the CPUTLBEntry structure members. */
-    QEMU_BUILD_BUG_ON(offsetof(CPUTLBEntry, addr_read) !=
-                      MMU_DATA_LOAD * sizeof(uint64_t));
-    QEMU_BUILD_BUG_ON(offsetof(CPUTLBEntry, addr_write) !=
-                      MMU_DATA_STORE * sizeof(uint64_t));
-    QEMU_BUILD_BUG_ON(offsetof(CPUTLBEntry, addr_code) !=
-                      MMU_INST_FETCH * sizeof(uint64_t));
-
-#if TARGET_LONG_BITS == 32
-    /* Use qatomic_read, in case of addr_write; only care about low bits. */
-    const uint32_t *ptr = (uint32_t *)&entry->addr_idx[access_type];
-    ptr += HOST_BIG_ENDIAN;
-    return qatomic_read(ptr);
-#else
-    const uint64_t *ptr = &entry->addr_idx[access_type];
-# if TCG_OVERSIZED_GUEST
-    return *ptr;
-# else
-    /* ofs might correspond to .addr_write, so use qatomic_read */
-    return qatomic_read(ptr);
-# endif
-#endif
-}
-
-static inline uint64_t tlb_addr_write(const CPUTLBEntry *entry)
-{
-    return tlb_read_idx(entry, MMU_DATA_STORE);
-}
-
-/* Find the TLB index corresponding to the mmu_idx + address pair.  */
-static inline uintptr_t tlb_index(CPUState *cpu, uintptr_t mmu_idx,
-                                  vaddr addr)
-{
-    uintptr_t size_mask = cpu->neg.tlb.f[mmu_idx].mask >> CPU_TLB_ENTRY_BITS;
-
-    return (addr >> TARGET_PAGE_BITS) & size_mask;
-}
-
-/* Find the TLB entry corresponding to the mmu_idx + address pair.  */
-static inline CPUTLBEntry *tlb_entry(CPUState *cpu, uintptr_t mmu_idx,
-                                     vaddr addr)
-{
-    return &cpu->neg.tlb.f[mmu_idx].table[tlb_index(cpu, mmu_idx, addr)];
-}
-
-#endif /* !defined(CONFIG_USER_ONLY) */
-
 #if TARGET_BIG_ENDIAN
 # define cpu_lduw_data        cpu_lduw_be_data
 # define cpu_ldsw_data        cpu_ldsw_be_data
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index e16d02a62c..953c437ba9 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -27,6 +27,9 @@
 #include "exec/tb-flush.h"
 #include "exec/memory-internal.h"
 #include "exec/ram_addr.h"
+#include "exec/mmu-access-type.h"
+#include "exec/tlb-common.h"
+#include "exec/vaddr.h"
 #include "tcg/tcg.h"
 #include "qemu/error-report.h"
 #include "exec/log.h"
@@ -95,6 +98,54 @@ static inline size_t sizeof_tlb(CPUTLBDescFast *fast)
     return fast->mask + (1 << CPU_TLB_ENTRY_BITS);
 }
 
+static inline uint64_t tlb_read_idx(const CPUTLBEntry *entry,
+                                    MMUAccessType access_type)
+{
+    /* Do not rearrange the CPUTLBEntry structure members. */
+    QEMU_BUILD_BUG_ON(offsetof(CPUTLBEntry, addr_read) !=
+                      MMU_DATA_LOAD * sizeof(uint64_t));
+    QEMU_BUILD_BUG_ON(offsetof(CPUTLBEntry, addr_write) !=
+                      MMU_DATA_STORE * sizeof(uint64_t));
+    QEMU_BUILD_BUG_ON(offsetof(CPUTLBEntry, addr_code) !=
+                      MMU_INST_FETCH * sizeof(uint64_t));
+
+#if TARGET_LONG_BITS == 32
+    /* Use qatomic_read, in case of addr_write; only care about low bits. */
+    const uint32_t *ptr = (uint32_t *)&entry->addr_idx[access_type];
+    ptr += HOST_BIG_ENDIAN;
+    return qatomic_read(ptr);
+#else
+    const uint64_t *ptr = &entry->addr_idx[access_type];
+# if TCG_OVERSIZED_GUEST
+    return *ptr;
+# else
+    /* ofs might correspond to .addr_write, so use qatomic_read */
+    return qatomic_read(ptr);
+# endif
+#endif
+}
+
+static inline uint64_t tlb_addr_write(const CPUTLBEntry *entry)
+{
+    return tlb_read_idx(entry, MMU_DATA_STORE);
+}
+
+/* Find the TLB index corresponding to the mmu_idx + address pair.  */
+static inline uintptr_t tlb_index(CPUState *cpu, uintptr_t mmu_idx,
+                                  vaddr addr)
+{
+    uintptr_t size_mask = cpu->neg.tlb.f[mmu_idx].mask >> CPU_TLB_ENTRY_BITS;
+
+    return (addr >> TARGET_PAGE_BITS) & size_mask;
+}
+
+/* Find the TLB entry corresponding to the mmu_idx + address pair.  */
+static inline CPUTLBEntry *tlb_entry(CPUState *cpu, uintptr_t mmu_idx,
+                                     vaddr addr)
+{
+    return &cpu->neg.tlb.f[mmu_idx].table[tlb_index(cpu, mmu_idx, addr)];
+}
+
 static void tlb_window_reset(CPUTLBDesc *desc, int64_t ns,
                              size_t max_entries)
 {
-- 
2.41.0

