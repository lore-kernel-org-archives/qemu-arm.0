Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp180319ejy;
        Fri, 23 Sep 2022 01:48:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6IydQYD4N+0ZwRbdMYVqB9LETaFPHctgJQnRgL+riS/76VF9YAFMq6nCs3Duq1IQApiee8
X-Received: by 2002:a17:902:da83:b0:177:f919:9260 with SMTP id j3-20020a170902da8300b00177f9199260mr7525499plx.105.1663922905944;
        Fri, 23 Sep 2022 01:48:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663922905; cv=none;
        d=google.com; s=arc-20160816;
        b=BuDa5YFwdwAL+/37cn7f23HrghMtRafx/8wbTMe5CaVSFcYGEOGB12FHnmb9h6zp30
         MPEMkc+2lBe/BEGAc/tEekxF6n9xjxWJr0QnLbmBsBD6i749yDBPPNfq58ZvvIsxawhG
         xinhBjSi8tpltQpJyN0z+Bs5w734vaoCxoHAholMvlIf7KT2BFM+wYC8odE8SUOraL7v
         LwTVv4lbBGqp92jHkoIbIaIzAwuLSGQTzjYDV3VGCTKBu2w8oxrqDChYQZg+/uPEZHay
         hcy91SbkFJi0kOWXNHHR1QwkcjN47ppMkUF9/KVUsBD7+4ubcetw2xY26h9wxqQ0wh3S
         IvSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=wbXSuRf4qmE+Uq+zXXjsfsn3zGXpuZ80Hj3mjIa2b1Y=;
        b=eE2lUJwOhPzA2cD4t6n8MeD0lE5Gqy6wjOwOfqJc+S1m9Rq3ECqLDF4N4gqmjVX8ko
         WJoXwPqXt0UGrTwWJe1CSjkDay+L8ClhMMj6IbvLlrf34gwpwgZpvrG+dMVjWVAgbV3Y
         ElZlG+KaPxZsoAhu2el+LpoqPdMyrvfe/19A3vhVmEcIS2rmncwrhA2eD1NFc9GlA+cS
         V4l784OPAyJR5Hpj4GZM64iABfkhrafZGVR5xf5+4YOUVA5zgWf8eC69FwLt5fpR2mIF
         wybQ/Zka5DufUSHMWYacQTo3xMlv7helTwh0skZtwFdiza2dnv1aCm3uXsZDYHaPYG4g
         F5IQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=gbdq=z2=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (mail.ozlabs.org. [2404:9400:2221:ea00::3])
        by mx.google.com with ESMTPS id u10-20020a654c0a000000b004355fc90c39si9440164pgq.261.2022.09.23.01.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 01:48:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of srs0=gbdq=z2=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) client-ip=2404:9400:2221:ea00::3;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=gbdq=z2=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4MYm5N04WGz4xGg;
	Fri, 23 Sep 2022 18:48:24 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MYm5K3NT2z4xGN;
	Fri, 23 Sep 2022 18:48:21 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 4/6] cputlb: used cached CPUClass in our hot-paths
Date: Fri, 23 Sep 2022 10:48:01 +0200
Message-Id: <20220923084803.498337-5-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923084803.498337-1-clg@kaod.org>
References: <20220923084803.498337-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: OdLlogvz9vRp

From: Alex Bennée <alex.bennee@linaro.org>

Before: 35.912 s ±  0.168 s
  After: 35.565 s ±  0.087 s

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220811151413.3350684-5-alex.bennee@linaro.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 accel/tcg/cputlb.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 8fad2d9b83cd..193bfc1cfc14 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1291,15 +1291,14 @@ void tlb_set_page(CPUState *cpu, target_ulong vaddr,
 static void tlb_fill(CPUState *cpu, target_ulong addr, int size,
                      MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
     bool ok;
 
     /*
      * This is not a probe, so only valid return is success; failure
      * should result in exception + longjmp to the cpu loop.
      */
-    ok = cc->tcg_ops->tlb_fill(cpu, addr, size,
-                               access_type, mmu_idx, false, retaddr);
+    ok = cpu->cc->tcg_ops->tlb_fill(cpu, addr, size,
+                                    access_type, mmu_idx, false, retaddr);
     assert(ok);
 }
 
@@ -1307,9 +1306,8 @@ static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
                                         MMUAccessType access_type,
                                         int mmu_idx, uintptr_t retaddr)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    cc->tcg_ops->do_unaligned_access(cpu, addr, access_type, mmu_idx, retaddr);
+    cpu->cc->tcg_ops->do_unaligned_access(cpu, addr, access_type,
+                                          mmu_idx, retaddr);
 }
 
 static inline void cpu_transaction_failed(CPUState *cpu, hwaddr physaddr,
@@ -1539,10 +1537,9 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
     if (!tlb_hit_page(tlb_addr, page_addr)) {
         if (!victim_tlb_hit(env, mmu_idx, index, elt_ofs, page_addr)) {
             CPUState *cs = env_cpu(env);
-            CPUClass *cc = CPU_GET_CLASS(cs);
 
-            if (!cc->tcg_ops->tlb_fill(cs, addr, fault_size, access_type,
-                                       mmu_idx, nonfault, retaddr)) {
+            if (!cs->cc->tcg_ops->tlb_fill(cs, addr, fault_size, access_type,
+                                           mmu_idx, nonfault, retaddr)) {
                 /* Non-faulting page table read failed.  */
                 *phost = NULL;
                 return TLB_INVALID_MASK;
-- 
2.37.3
