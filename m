Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp787670ejc;
        Wed, 18 Jan 2023 11:38:08 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuX0p/FgyUGlXZxViNFJ3O3blFG+1lb045fLgqoqUOh5N4SGCNeMX6cID0zNkyjOFXgnVE0
X-Received: by 2002:a05:600c:4f51:b0:3d2:139e:f64f with SMTP id m17-20020a05600c4f5100b003d2139ef64fmr8085113wmq.40.1674070688699;
        Wed, 18 Jan 2023 11:38:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674070688; cv=none;
        d=google.com; s=arc-20160816;
        b=aNjXiHm+E3BTxzWkhFIeva4Ng8W3gwIEhltOUB1QKBb6kQpwHpJ9Q5cIwbPwWmE81u
         n8Nj8rFRGyg6M4TGS+gpYiM13VgEnhNCnGDOOrcI3Ffc4Dy51akoKvBPOZjSnS8Y946P
         xuZe6TYThgnZQwO57zsnWa2Lz3KgYooMncwtOSHZb1vEYi6Kdt0eg+Wk1K1E3w0PjdlN
         Eq2OwHLg79ghV5PO45KCflum8Vr7oaI379XUXKXZr/A/9qFV2TsiNSfQM8PGFajJhgAs
         FJGGhHeBx+ujJrJQiTJ0p0SyfcBZDP32won3ZKnzULV/YHPLbE2pHcdyupfap26Oe0A8
         Zn7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=PyF8sUoOTCrhIQWtWkBHJhnk7fgtE7ayPgnJhS9bdlI=;
        b=AuCMQk8y4J2sWf5MM5cqYRl6YiHFSdrTmV2NjS9Pv7plxqaujTI2gOVvHjcxXdqLen
         xI8F/INuza3HJStuf8EzmQuGFkq59UH2yOyHtX1bHCKGA92Pj6tZZSWP9XMdF5Li5RU+
         2xh2GLII2eiPGDa0kjQM1/eGY2bLDxvIgRSE/Ymi5L5tCCmHQN3NassRPYwTwTF0Av42
         lA77QykhnEAhFThW15WFePRPhC3slH9eaXJYWQhuFtK/TKvEMx1MaXCimRHB0M+jon4q
         UkcIswRqNdP+oZ9miqhH1+bi6K6C2N9/D8nYvle5nbTGUHyLhsNaIn8OTnWD+aRUjE5g
         xpew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="awGfIa/i";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id fm8-20020a05600c0c0800b003db0104781dsi2768208wmb.171.2023.01.18.11.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 11:38:08 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="awGfIa/i";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4E8D53F683;
	Wed, 18 Jan 2023 19:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674070688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PyF8sUoOTCrhIQWtWkBHJhnk7fgtE7ayPgnJhS9bdlI=;
	b=awGfIa/ito+mwEYid/XGPWWK4m6BZddvzOxM2hCsAG878PjvVNntbH+Gy0eo92toMrSEKB
	mcX0uFLUhhSHnx+sbi4olQE2Ozu4V34DtLTiAvilQHgMCV+wX/6Pssf/AQ1+rSwtRd727i
	WgttKDIW7e1vlBfnrlqIijAqejfNs4U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674070688;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PyF8sUoOTCrhIQWtWkBHJhnk7fgtE7ayPgnJhS9bdlI=;
	b=MPf9qVb0+9jZx/bNqMV3n4pOi1ZqkB/jb+gPh/uGQc/AoUjrMuGccghfmUft/fBUBntFPC
	BGCqDKhvTArf9TDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AA998139D2;
	Wed, 18 Jan 2023 19:38:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +GDGHJ1KyGOWBwAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 18 Jan 2023 19:38:05 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alexander Graf <agraf@csgraf.de>
Subject: [PATCH 14/20] target/arm: Move regime_using_lpae_format into internal.h
Date: Wed, 18 Jan 2023 16:35:12 -0300
Message-Id: <20230118193518.26433-15-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230118193518.26433-1-farosas@suse.de>
References: <20230118193518.26433-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: IjXvUo8ZqrQi

This function is needed by common code (ptw.c), so move it along with
the other regime_* functions in internal.h. When we enable the build
without TCG, the tlb_helper.c file will not be present.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h      | 21 ++++++++++++++++++---
 target/arm/tcg/tlb_helper.c | 18 ------------------
 2 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 865b9e8104..b1fccf13a3 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -614,9 +614,6 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate_and_priv(CPUARMState *env,
 /* Return the MMU index for a v7M CPU in the specified security state */
 ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate);
 
-/* Return true if the translation regime is using LPAE format page tables */
-bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
-
 /*
  * Return true if the stage 1 translation regime is using LPAE
  * format page tables
@@ -781,6 +778,24 @@ static inline uint64_t regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
     return env->cp15.tcr_el[regime_el(env, mmu_idx)];
 }
 
+/* Return true if the translation regime is using LPAE format page tables */
+static inline bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    int el = regime_el(env, mmu_idx);
+    if (el == 2 || arm_el_is_aa64(env, el)) {
+        return true;
+    }
+    if (arm_feature(env, ARM_FEATURE_PMSA) &&
+        arm_feature(env, ARM_FEATURE_V8)) {
+        return true;
+    }
+    if (arm_feature(env, ARM_FEATURE_LPAE)
+        && (regime_tcr(env, mmu_idx) & TTBCR_EAE)) {
+        return true;
+    }
+    return false;
+}
+
 /**
  * arm_num_brps: Return number of implemented breakpoints.
  * Note that the ID register BRPS field is "number of bps - 1",
diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index 60abcbebe6..31eb77f7df 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -12,24 +12,6 @@
 #include "exec/helper-proto.h"
 
 
-/* Return true if the translation regime is using LPAE format page tables */
-bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    int el = regime_el(env, mmu_idx);
-    if (el == 2 || arm_el_is_aa64(env, el)) {
-        return true;
-    }
-    if (arm_feature(env, ARM_FEATURE_PMSA) &&
-        arm_feature(env, ARM_FEATURE_V8)) {
-        return true;
-    }
-    if (arm_feature(env, ARM_FEATURE_LPAE)
-        && (regime_tcr(env, mmu_idx) & TTBCR_EAE)) {
-        return true;
-    }
-    return false;
-}
-
 /*
  * Returns true if the stage 1 translation regime is using LPAE format page
  * tables. Used when raising alignment exceptions, whose FSR changes depending
-- 
2.35.3
