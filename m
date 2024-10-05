Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1147599njb;
        Sat, 5 Oct 2024 13:06:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWZZ5dlCBCZH/PyfTBaSscWyCnkJCdby3tn/4q5Z6yq0iN2Dtvi+kWbD2x6acXCboQ2ZYGN9sJ1xTgpxg==@linaro.org
X-Received: by 2002:a17:902:d2c9:b0:20b:4862:425f with SMTP id d9443c01a7336-20bfdfff453mr107056705ad.27.1728158763910;
        Sat, 05 Oct 2024 13:06:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728158763; cv=none;
        d=google.com; s=arc-20240605;
        b=APAOPl1pAURFeh0HOOvPI7cJt5m4KRvGs9OwZxlPtvIa5eY45HoTkmzQJZQl8428Sp
         XWdpAs+h8YwcusmwFNBZqfKFtMtHAg1TihQs6H3ooOmN6ArTdMqpZH3Nj2JU/nOF5dTl
         VIVjwRZOw3XM3YReEhdaw5lT7+HnRr4krryRTtep5tboX6oOc6C6ouZ5OA/Hay5eDcJe
         4ooFBtiQiFyumOc2v7rDhCfjqTPzwt0ya/smSDiMmmHN4nK2luU2kSuLKMt53Nty9X3P
         myTw9Zw9cT9Bars5/m+EMI6fAb/pz4UvyzLVamS82/98jdmg+kPbjDUIKEwt73T9vqO9
         U9Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wBthGFf8BfR2i4dob959bB47CFsEJX0Mf+aRMHd0jM4=;
        fh=ibVCKHXWD9cyTWD+ISfYrLcb8id4IzpmV5hMjlYCKeA=;
        b=Qrf9MP/ulBNE1Zsx9aM0q/JcwyKuA6RXA4TTV5NejA7L6baK6bgyYffNr8/WS7Mz3z
         6AtAe7ynqgj+J5UiVcSr43DYadUNkAWA7T+YFFMPo0ou5DcKNz9cKQqCXsbLVEcZE8nc
         4UOXAC9uzzZnT1V4meTU7xdAYCghK2j85R4aSGjx7PByL6dcOhWOJZYM/fiMKm7Kpa01
         IWaKQp8A/UpnEzSv9VWbLePZcBbr9qyGzy5Ab5QPhR/lZ+Yw/4yICq06+FOvlIslObmE
         /KYwEqBdbyzw10xJ8BkDw1mD/XDuLGFOkEC4m+0k9VOb+2cSsjJlj+dPS61o9Be0UgfU
         72pw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TJOB598/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138c8475sor13053515ad.6.2024.10.05.13.06.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 13:06:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TJOB598/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158763; x=1728763563; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wBthGFf8BfR2i4dob959bB47CFsEJX0Mf+aRMHd0jM4=;
        b=TJOB598/QbF5h/8Y82qx60JpKCjQvtiQhbhZo9OqISSP6x4t1i7UeEoUhBma6aEwPb
         tZEGDO/OzF0RzUooL3mB30uT/H4pI5uypNHaRjNQDwiok3S2vpm2xErbXisYzASEUWbg
         vnCe1/rLIFp5TUwvIY3xE709qBBRswebqNISa9qH9ADR29EDO3DvXpYUZGA2Y5k6EYkR
         ZYKejtT/SyL3szMs9Mw/lPheK7mARsytaPjWyAi4iPyAywWC1LioBXcg2bW2l1JxHQWL
         QBSSEMMevSb1iYjUG9zLXUt+bySdkoJDrqIVkRXBJ38cd2zvLxSSkqOcyzqL09bYh9DD
         Smiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158763; x=1728763563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBthGFf8BfR2i4dob959bB47CFsEJX0Mf+aRMHd0jM4=;
        b=Fd7PRlEfGa5Y0wvjaZdJ9s82M0Q3To0E02pd1Hyx8spi7U1A6X+zYvkU9NxToqCPgl
         Ogv1G4EYauBJBviTGEBjBkA8VMXIrXwFYpDINq9B60gL8NW837LlLZw7RFoxNpkAIOsY
         4AVtkOw+XXkzQYr2tyySiqqwG9N9DJ7WT1pOtqXjxCaNRjhUw2O9FUR9/Q7wW67Qtn0c
         ptTjp1ViAJzFv7hd6FndJbM8wyAmm9aBL8T1DwBlRcT+/Jsfnqj8F1O3tDcT520xWx9C
         dsQ1J5xGFO1qnY88r6m3kWa7Nl6gH/FfcRZxInz3AgEKke2m23teTa5as1U81/q6uqKK
         psAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdZBSTMszEA5mXBbBz37x6FjQrdRuMI/CPee1dx4GDRzBrNJtOYQzW3HYK7d4bzmOUHyjfY5SoEooNBA==@linaro.org
X-Gm-Message-State: AOJu0YzURmAPvVA4h+iqhkZrkTVq/HXBrGW4Pr38SOA5omCJ21yNE9cp
	qPpxVWEP47R1i9dU4VsQowl2uf6deFW4Pqav0cFm7Ih1aQRxhl80Oxe1Jhleoaqs5A==
X-Google-Smtp-Source: AGHT+IH0bNmSgTilkfsUlgJ9vbuANm1j0xSSg22B3KtpzdX6j/LOhzX6NRgjtvxwOpPWp0dQMEWPcA==
X-Received: by 2002:a17:902:e5c6:b0:20b:6ede:5b1c with SMTP id d9443c01a7336-20bfdfeef3cmr94363425ad.25.1728158763513;
        Sat, 05 Oct 2024 13:06:03 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 02/21] accel/tcg: Expand tlb_fill for 3 callers
Date: Sat,  5 Oct 2024 13:05:41 -0700
Message-ID: <20241005200600.493604-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005200600.493604-1-richard.henderson@linaro.org>
References: <20241005200600.493604-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 4cl4RyBLur7k

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
