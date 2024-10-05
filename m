Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1147664njb;
        Sat, 5 Oct 2024 13:06:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUekqOyjZ01zVTAGjSC7+KZWNl/dy0YofMUxmocaWdkz7NMVbn4seWCECJpeqg3iaWu1U8Lh7Opbl33bw==@linaro.org
X-Received: by 2002:a17:903:244c:b0:20b:7ec0:ee24 with SMTP id d9443c01a7336-20bfde658cdmr87014675ad.9.1728158773161;
        Sat, 05 Oct 2024 13:06:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728158773; cv=none;
        d=google.com; s=arc-20240605;
        b=BXNlXt9k88kCtaVBlWXSkxoN1iLDDN6iRx9NU2LthkrguEduPhvlBCMt4gCxeSA4+/
         O8HM7QbvEe1P2uZB079qLFkE7de+Q/hnozQ9WrX2nQgFIPWv/QNHcAgNnAnZeDeKh2GQ
         GY0qrvtgim4G2yoaAeHSZ275DuN+B6ZBDmoVpElyrxflzYcpar6vC2QsQhmtJDr+hO7U
         3JKb2uPXCxO7rgjl9DjcadtVYgfcNGgCWymkrw45mbPV4/fKizp4/8QQWHhbnmKx3mxI
         hk1+TLxPvZsGGOKcXmAq86eX7iS2dtL2xpSSWt3EO+CqIOwXmXpAyQu4Du0QerD27Jwf
         jaSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Rc7m2CC+o/vfg9459Vx/ro/giFzSXc14VGjLvy+03yM=;
        fh=IY362+nnfxUTNBq++l6sfUID1+6vsF/0eC0i4uzNiLE=;
        b=Rb9PRyFWBfT58V6NuQnXpdNBN0Y7g/TpqvAFong60v4d+f8oU0i3Ubuer/vdgk8FeK
         gNHSoFbluMQyR1J4cTA4fijkYrGqsfgapDihtmXMOdk7+eUlfPu1Ba5TONrVFg92Lcrd
         CngRCZG4EmBoJGwXcryf7Vjqzr+yUwCxHNyTD8oOq5L8kMpujr6eKUDW7lABipVMHIYc
         ++SbIZwbKOmGorv9H7En2stQoJqSPhS+7+tu74S99D16+g6YgDZ9/xFRqhvZfaQzxgLQ
         OAgxVqE1pgMSMS0JQaOqyjkht3MX7yEf0Sais8l76hhaiFo3Qrz37CSp2u/ei1EmRPct
         3Sdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kZ2a2Wy3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c13992beasor16197435ad.19.2024.10.05.13.06.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 13:06:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kZ2a2Wy3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158773; x=1728763573; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rc7m2CC+o/vfg9459Vx/ro/giFzSXc14VGjLvy+03yM=;
        b=kZ2a2Wy3ctmbeZMNQSME1VLAzdQU2kYEpCOXaBWTTisnCQUX7u+5ErV50PJKBYMHSO
         HYB3pteLAnNBSUiE+0chQY3S4owcfzxJR0yJ7jmqmzjayWK9ISohNa8x3RsSSKoJfIAI
         yYwfLvj8MS2R+kwPEkBeYNlb4EMnQTDfb5eqAY2Alvv5He4xNbyLfOsAWwHY4UtvQyUx
         pQ/h/8hCkx2uYVLtIFujP8Cq/ie7fIugLjzsfAXOs/ASavu5ZzUdigcvpJcarYUkZ6WS
         l+KXyxtjt834K+Hme+QlFE5t54hkIUDceJgRq+zXRZX4QqP0Y7RIiAQAgxYXdK4YlAwc
         GWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158773; x=1728763573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rc7m2CC+o/vfg9459Vx/ro/giFzSXc14VGjLvy+03yM=;
        b=FAxTldZvlP/6WNV/hkE3JNEdaxsqtk0t9hJvz5UTLaBxUZZ+JFpYxF5dkqDWfS2SGr
         Zv7O3jP2D1n1m5rVnl3xU4sBbau1SHm+5CyF676EkkN1qfgMwO6l4jmCFIJH0LYAsF+O
         z9rXBqsZq31xJpu8VcSj9APcZEwwA/okDcDNompxd1ZbalEWa+6afALOinPNMzU8iF9c
         MHrg3T5MMNZMJXRl0VHQIgm48fMHtQ/I7PXN35utiN7y+jN6R0tw7oJkim566rR2f9J5
         50MgJ3TmhpaMXaIuJlowtd9JPk5bCF7zw7fflcQhTaII2m3fC+EvUV8n4HBPUrOmmu6B
         xkfA==
X-Forwarded-Encrypted: i=1; AJvYcCXXJ0+fcGDupMxp5ITOMMxZ4FN/UJcHZvOJ5YUhqY06cWzay4omfgBReAN86xapSe4xCz2tb5zQY5JWqQ==@linaro.org
X-Gm-Message-State: AOJu0Yy93KJc+bXV0ZG7gmbxoCBMJ3tjqclUVLekoUJxsiNX9hCNjZ+J
	eKNK29JP87wsMsgamTy3BlwzcMstTgbB7DOOi06VA+5ZNSMPSVpXYUkFIdPSETQSQg==
X-Google-Smtp-Source: AGHT+IGHEK6fjBSmL22oUUwIkylcWSfEnGAMH/PbqEEDgjtyaqNVMTdBmg2DLFABo2GcKikjZC9wnw==
X-Received: by 2002:a17:902:e54f:b0:20b:9698:a234 with SMTP id d9443c01a7336-20bfde65b4dmr91370085ad.8.1728158772729;
        Sat, 05 Oct 2024 13:06:12 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 12/21] target/hppa: Add hppa_cpu_tlb_fill_align
Date: Sat,  5 Oct 2024 13:05:51 -0700
Message-ID: <20241005200600.493604-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005200600.493604-1-richard.henderson@linaro.org>
References: <20241005200600.493604-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: mkc5m2tnBTpV

Fill in the tlb_fill_align hook, so that we can recognize
alignment exceptions in the correct priority order.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/cpu.h        |  3 +++
 target/hppa/cpu.c        |  2 +-
 target/hppa/mem_helper.c | 16 ++++++++++++----
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
index 526855f982..c0567ce0ab 100644
--- a/target/hppa/cpu.h
+++ b/target/hppa/cpu.h
@@ -366,6 +366,9 @@ void hppa_set_ior_and_isr(CPUHPPAState *env, vaddr addr, bool mmu_disabled);
 bool hppa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
+bool hppa_cpu_tlb_fill_align(CPUState *cs, vaddr address, MemOp mop, int size,
+                             MMUAccessType access_type, int mmu_idx,
+                             bool probe, uintptr_t retaddr);
 void hppa_cpu_do_interrupt(CPUState *cpu);
 bool hppa_cpu_exec_interrupt(CPUState *cpu, int int_req);
 int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 3b6c325e09..768abc6e5d 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -226,7 +226,7 @@ static const TCGCPUOps hppa_tcg_ops = {
     .restore_state_to_opc = hppa_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
-    .tlb_fill_align = tlb_fill_align_first,
+    .tlb_fill_align = hppa_cpu_tlb_fill_align,
     .tlb_fill = hppa_cpu_tlb_fill,
     .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
     .cpu_exec_halt = hppa_cpu_has_work,
diff --git a/target/hppa/mem_helper.c b/target/hppa/mem_helper.c
index d38054da8a..35e9170bf3 100644
--- a/target/hppa/mem_helper.c
+++ b/target/hppa/mem_helper.c
@@ -424,9 +424,9 @@ void hppa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
     }
 }
 
-bool hppa_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
-                       MMUAccessType type, int mmu_idx,
-                       bool probe, uintptr_t retaddr)
+bool hppa_cpu_tlb_fill_align(CPUState *cs, vaddr addr, MemOp mop, int size,
+                             MMUAccessType type, int mmu_idx,
+                             bool probe, uintptr_t retaddr)
 {
     HPPACPU *cpu = HPPA_CPU(cs);
     CPUHPPAState *env = &cpu->env;
@@ -445,7 +445,7 @@ bool hppa_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
         break;
     }
 
-    excp = hppa_get_physical_address(env, addr, mmu_idx, a_prot, 0,
+    excp = hppa_get_physical_address(env, addr, mmu_idx, a_prot, mop,
                                      &phys, &prot);
     if (unlikely(excp >= 0)) {
         if (probe) {
@@ -473,6 +473,14 @@ bool hppa_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
     return true;
 }
 
+bool hppa_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
+                       MMUAccessType type, int mmu_idx,
+                       bool probe, uintptr_t retaddr)
+{
+    return hppa_cpu_tlb_fill_align(cs, addr, 0, size, type,
+                                   mmu_idx, probe, retaddr);
+}
+
 /* Insert (Insn/Data) TLB Address.  Note this is PA 1.1 only.  */
 void HELPER(itlba_pa11)(CPUHPPAState *env, target_ulong addr, target_ulong reg)
 {
-- 
2.43.0
