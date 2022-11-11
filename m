Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id y15-20020a5d614f000000b0022ae401e9e0sm2535857wrt.78.2022.11.11.10.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 10:25:36 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id CA61E1FFBA;
	Fri, 11 Nov 2022 18:25:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v5 02/20] target/arm: ensure TCG IO accesses set appropriate MemTxAttrs
Date: Fri, 11 Nov 2022 18:25:17 +0000
Message-Id: <20221111182535.64844-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111182535.64844-1-alex.bennee@linaro.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8pFZP+UaXYZr

Both arm_cpu_tlb_fill (for normal IO) and
arm_cpu_get_phys_page_attrs_debug (for debug access) come through
get_phys_addr which is setting the other memory attributes for the
transaction. As these are all by definition CPU accesses we can also
set the requested_type/index as appropriate.

We also have to handle where the attributes are totally reset if we
call into get_phys_addr_twostage.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - reword commit summary
v5
  - fix for new *result ABI
  - use MEMTXATTRS_CPU to fill in the initial values
  - also reset attrs in get_phys_addr_twostage
---
 target/arm/ptw.c        | 3 ++-
 target/arm/tlb_helper.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 3745ac9723..4b6683f90d 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2634,6 +2634,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     s1_lgpgsz = result->f.lg_page_size;
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
+    result->f.attrs = MEMTXATTRS_CPU(env_cpu(env));
 
     ret = get_phys_addr_lpae(env, ptw, ipa, access_type, is_el0, result, fi);
     fi->s2addr = ipa;
@@ -2872,7 +2873,7 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
         .in_secure = arm_is_secure(env),
         .in_debug = true,
     };
-    GetPhysAddrResult res = {};
+    GetPhysAddrResult res = { .f.attrs = MEMTXATTRS_CPU(cs) };
     ARMMMUFaultInfo fi = {};
     bool ret;
 
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 0f4f4fc809..5960269421 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -208,7 +208,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                       bool probe, uintptr_t retaddr)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-    GetPhysAddrResult res = {};
+    GetPhysAddrResult res = { .f.attrs = MEMTXATTRS_CPU(cs) };
     ARMMMUFaultInfo local_fi, *fi;
     int ret;
 
-- 
2.34.1
