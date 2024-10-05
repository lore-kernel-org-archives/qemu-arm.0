Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1047738njb;
        Sat, 5 Oct 2024 08:25:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUaCEhcUnVVHsx5rQ4Jv74XsY8+4GODkHDErvMZWhkCXIEHcY6tyEaj8RLeq9/La7cbo/8GwwWuv0rifA==@linaro.org
X-Received: by 2002:a17:902:e74c:b0:206:9a3f:15e5 with SMTP id d9443c01a7336-20bfe043018mr92509945ad.32.1728141955250;
        Sat, 05 Oct 2024 08:25:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728141955; cv=none;
        d=google.com; s=arc-20240605;
        b=d56JzXZxpUe55SWmTAEzKaaINUDnBwwu8tP+B4BpPPBwckfujbXl9Mhxa2qD0D6+ED
         ylDdgVk6XsEGnWf74ts0Y2+Tt0ISQhsDGY0TuW0iGO+Ev4tzAWP1b87co/bDeTFfAQah
         QmsBXmINO9G+JMxNr7x4gvwa9fdfO1oNocA31VlG6tk6aS8XsRcMnQX1fCYwUuBejWst
         4sAhSl5Bgvrct14RVEXF6mUhikssNiJuRZLkK3v4RBiALiS4erA9Nm+Hcwtgc3wuDDlo
         CF1gmDc2ckuuJt/+wQW/5spVLJdXrnbEFw+Yk549waz8LPb0jR3CKbPUSsx2mayzoNHk
         Al6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wBthGFf8BfR2i4dob959bB47CFsEJX0Mf+aRMHd0jM4=;
        fh=AyJsET+4279DeCQAOgZ56EfjL8qLnSrNsOze8/2ol9E=;
        b=SwEmPVkIlvpuaOMEauJrg5a/SsE4hHv/T2dqWv5MUBBgxWxrJpHg9Y/rlit+1mqht6
         6EC+wYYXKfMnMpsk97Et7v/sB321eXSCuIR9rLLcphT+0rEWLZbw9vr3fhPgOICMlcwz
         0+gOGH28Mb8g6yFymQiWu/tCTSnHd1jynZDTpYEI/+fI87q0KaxP1nRVrFGiP6DALsOg
         AqnDpEH1LUAYq6xxOyxS6SbWTdWcGiEqGrrAO2qyD+0w6WRGkwU9yCgSX5TEtJcULzYQ
         szFaWcTP/1JmNF5okFKPSwCRd+a9vAaOMr8mxPXEemhf/fCIFEUOIuV5Jef9jdwTQdTC
         9Yzw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vr7nLxuO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138a9ec9sor10743025ad.2.2024.10.05.08.25.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 08:25:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vr7nLxuO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141955; x=1728746755; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBthGFf8BfR2i4dob959bB47CFsEJX0Mf+aRMHd0jM4=;
        b=vr7nLxuORtJwqMfL9+hv3d0uDY+ijWPGzv3tBBeUQj0+C0VAqImopeuwMco0oJ5QPf
         xRzbacACIqBPT9/ZvTT8VrVaRBU/YgKEptEW5j2NuhBPpXvypxhnx4BoO8ZLWmKFFG+f
         nWN7qUubfUOeCZpGUlz2obc88qUz450k9CuKHZEjk/gjVnfKa5BhHxpryy7yw0A9dkEM
         8KAtZgcOjpzc9AJq44/R5HWFISgkdBjrUxhM8xzQNW0Qjc3W2O1jq8OPaBH9BgzbnegL
         PZFvNckkBFcsbJa4OB87c0KGGVUAjmm6luChKv0/mQ5cuBrgxsXlwJpKFzivjTQjkLH4
         24rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141955; x=1728746755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBthGFf8BfR2i4dob959bB47CFsEJX0Mf+aRMHd0jM4=;
        b=at9VY1w8b0Yk58dZraZ3qVJrogQV8bdLyqCkDGY+LwKylX8HQcbaPU+1aPunsIxF1o
         6M2FePJOLfhTp/ivZIYH0oarmgDJdp9MUL5LLJJhe1oZDt2asJZfkxqHOErAF2NDPz9q
         cJrzI+PoME9P3yTR5TznDLfVQImTGPLw6qMMpmshCSroXJfAzGQcZ69UtK+Ds8cnMHuk
         Z9Iwf4OnQ1BkGHattLsP4V4QyFeWzljzO/l0pNRG8eYm1/vQlofYf7+jCSLebPH0CVcL
         mftfk0QwaSCylUW2evuK48KF40XJZydPQ4Kx/67D3eWlUSSVobWw/EqnPLTF7LlzKsNm
         Ducg==
X-Forwarded-Encrypted: i=1; AJvYcCVRxMjplwGpTrBzr12/mhRIuslgqRzayDOP6dZ4b2izECb/DPwcKEU/k7/T+WUDxNJY1ssgE23Ffm1Phw==@linaro.org
X-Gm-Message-State: AOJu0YwPiU+GmZKOUVQmwiOSS/aMZ9tSK07g1DQeXEJJQJqAxaEoUATm
	4zVWl3JA8ShFLFjip7Uh5RqV50MUQk4BL1z9ip/SsBtfqN6w8ATXG/H/zNfLVeEe+jjw6yCVTdM
	7MCU=
X-Google-Smtp-Source: AGHT+IH7Xmy/UoZFDozrpGZR2JXAjehjcUEjjy3Gt9EAYcog/cZlmR6Wqao6wjaMYAvpmgnjtSqiEQ==
X-Received: by 2002:a17:902:d581:b0:20b:419e:9f15 with SMTP id d9443c01a7336-20bfea570admr86092045ad.46.1728141954795;
        Sat, 05 Oct 2024 08:25:54 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:25:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 02/20] accel/tcg: Expand tlb_fill for 3 callers
Date: Sat,  5 Oct 2024 08:25:33 -0700
Message-ID: <20241005152551.307923-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005152551.307923-1-richard.henderson@linaro.org>
References: <20241005152551.307923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 3jecNHHhL7wK

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 33 ++++++++++-----------------------
 1 file changed, 10 insertions(+), 23 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index fd6459b695..58960969f4 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1220,25 +1220,6 @@ void tlb_set_page(CPUState *cpu, vaddr addr,
                             prot, mmu_idx, size);
 }
 
-/*
- * Note: tlb_fill() can trigger a resize of the TLB. This means that all of the
- * caller's prior references to the TLB table (e.g. CPUTLBEntry pointers) must
- * be discarded and looked up again (e.g. via tlb_entry()).
- */
-static void tlb_fill(CPUState *cpu, vaddr addr, int size,
-                     MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
-{
-    bool ok;
-
-    /*
-     * This is not a probe, so only valid return is success; failure
-     * should result in exception + longjmp to the cpu loop.
-     */
-    ok = cpu->cc->tcg_ops->tlb_fill(cpu, addr, size,
-                                    access_type, mmu_idx, false, retaddr);
-    assert(ok);
-}
-
 static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
                                         MMUAccessType access_type,
                                         int mmu_idx, uintptr_t retaddr)
@@ -1631,7 +1612,10 @@ static bool mmu_lookup1(CPUState *cpu, MMULookupPageData *data,
     if (!tlb_hit(tlb_addr, addr)) {
         if (!victim_tlb_hit(cpu, mmu_idx, index, access_type,
                             addr & TARGET_PAGE_MASK)) {
-            tlb_fill(cpu, addr, data->size, access_type, mmu_idx, ra);
+            bool ok = cpu->cc->tcg_ops->tlb_fill(cpu, addr, data->size,
+                                                 access_type, mmu_idx,
+                                                 false, ra);
+            assert(ok);
             maybe_resized = true;
             index = tlb_index(cpu, mmu_idx, addr);
             entry = tlb_entry(cpu, mmu_idx, addr);
@@ -1833,8 +1817,10 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
     if (!tlb_hit(tlb_addr, addr)) {
         if (!victim_tlb_hit(cpu, mmu_idx, index, MMU_DATA_STORE,
                             addr & TARGET_PAGE_MASK)) {
-            tlb_fill(cpu, addr, size,
-                     MMU_DATA_STORE, mmu_idx, retaddr);
+            bool ok = cpu->cc->tcg_ops->tlb_fill(cpu, addr, size,
+                                                 MMU_DATA_STORE, mmu_idx,
+                                                 false, retaddr);
+            assert(ok);
             index = tlb_index(cpu, mmu_idx, addr);
             tlbe = tlb_entry(cpu, mmu_idx, addr);
         }
@@ -1848,7 +1834,8 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
      * but addr_read will only be -1 if PAGE_READ was unset.
      */
     if (unlikely(tlbe->addr_read == -1)) {
-        tlb_fill(cpu, addr, size, MMU_DATA_LOAD, mmu_idx, retaddr);
+        cpu->cc->tcg_ops->tlb_fill(cpu, addr, size, MMU_DATA_LOAD,
+                                   mmu_idx, false, retaddr);
         /*
          * Since we don't support reads and writes to different
          * addresses, and we do have the proper page loaded for
-- 
2.43.0
