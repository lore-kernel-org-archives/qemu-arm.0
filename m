Received: by 10.223.159.82 with SMTP id f18csp1519247wrg;
        Fri, 1 Dec 2017 10:44:44 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaiw/6q0Jhr1L8/NUFKcrOpZBiNqKug7jrIYqbs5u/rJ8ruWI8dJzvD5gw0npIJtWSg+wu5
X-Received: by 10.223.139.8 with SMTP id n8mr6043510wra.225.1512153884104;
        Fri, 01 Dec 2017 10:44:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512153884; cv=none;
        d=google.com; s=arc-20160816;
        b=wxZHmaqeTFi8qhxtG+oP2dBtSoLOZJWzTI1dQDJA2BZQXi015IgNwhanV6B2e7gRMs
         wADR3LXHTpQsPR7Dk6TC1hiRtBxt2KIjk8QzBr0eeKbX/u6BDivxM4QzLnYsBYfpCpOm
         CCXUU7JwXrlBp45obLK0VcFIYB7oHRAjVBeet+vBWAlO4v65pw1seUHtiVTH3vRFjhPt
         nvyjtTbhIkzFmFLSRc4hbxo/2UYw69K6TToq6tEDaSP4tfbCw5Ope4Z4t8n6z5zjniEe
         gPFLI9wxkvpptqixNOqO5Jh25J5JAleUqcjF+zAgJMP3MlZs92q8Vvcc364ZyK0zwlfT
         WGtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=MEMuxfkwLj3kp3rNS0i7pdVKViMkEt762Z9AwSekx98=;
        b=iwr2t4/liB9QgkfJoHibh8scRLhKPQGUXPhQ+t1kY5dr8XZaj2AedYiyKDFPyFrlU1
         NCJD1snJrQVMAuEbRoKn+PzsPTbyhp0YhzKGs3fGTSq3W6NNG5sEhPBp4qS95scBcwHX
         zga+e0cg0Je1eTnHI6puVJkvuzI7WQY0/sw9C8lpn12rDLtGBFjCTQuykgPNdhx70Nbi
         grfQSOG4NrTsqVDwCg7ddAo+s4gDoz9cLLHKuqT9X4Pokxbq4ekeDqrKLRXXf6GSkLMO
         BfO8gljS3vD0bF6nrHH9DDvfA+VIGG4CzpZho0hNZTWq3bPLJoKFjJawTqnrZt8PfNoV
         QnqA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id p108si5472386wrb.221.2017.12.01.10.44.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Dec 2017 10:44:44 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eKqIl-00078R-LQ; Fri, 01 Dec 2017 18:44:43 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 5/7] target/arm: Create new arm_v7m_mmu_idx_for_secstate_and_priv()
Date: Fri,  1 Dec 2017 18:44:37 +0000
Message-Id: <1512153879-5291-6-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512153879-5291-1-git-send-email-peter.maydell@linaro.org>
References: <1512153879-5291-1-git-send-email-peter.maydell@linaro.org>
X-TUID: 83Fw95hpgaAn

The TT instruction is going to need to look up the MMU index
for a specified security and privilege state. Refactor the
existing arm_v7m_mmu_idx_for_secstate() into a version that
lets you specify the privilege state and one that uses the
current state of the CPU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d228fe6..1f414fd 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2334,14 +2334,16 @@ static inline int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
     }
 }
 
-/* Return the MMU index for a v7M CPU in the specified security state */
-static inline ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env,
-                                                     bool secstate)
+/* Return the MMU index for a v7M CPU in the specified security and
+ * privilege state
+ */
+static inline ARMMMUIdx arm_v7m_mmu_idx_for_secstate_and_priv(CPUARMState *env,
+                                                              bool secstate,
+                                                              bool priv)
 {
-    int el = arm_current_el(env);
     ARMMMUIdx mmu_idx = ARM_MMU_IDX_M;
 
-    if (el != 0) {
+    if (priv) {
         mmu_idx |= 1;
     }
 
@@ -2356,6 +2358,15 @@ static inline ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env,
     return mmu_idx;
 }
 
+/* Return the MMU index for a v7M CPU in the specified security state */
+static inline ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env,
+                                                     bool secstate)
+{
+    bool priv = arm_current_el(env) != 0;
+
+    return arm_v7m_mmu_idx_for_secstate_and_priv(env, secstate, priv);
+}
+
 /* Determine the current mmu_idx to use for normal loads/stores */
 static inline int cpu_mmu_index(CPUARMState *env, bool ifetch)
 {
-- 
2.7.4
