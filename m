Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2663861ejc;
        Mon, 9 Jan 2023 14:43:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtdCl6YNj0ANHoQ5DbQaX/5PYVSy+yP31ijLr3OU9T4IGMxjf8OlBmyl1HCljbvBtWJ5CXJ
X-Received: by 2002:a05:600c:3d8a:b0:3d3:4406:8a37 with SMTP id bi10-20020a05600c3d8a00b003d344068a37mr47634888wmb.41.1673304211865;
        Mon, 09 Jan 2023 14:43:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673304211; cv=none;
        d=google.com; s=arc-20160816;
        b=0tIB0ePGXrJ2WICWdllYr3KOD536Wz3LP2k+01/nOba2AlRnuI+SuGbSggYUeakRlK
         lk02eZRd7h9k6O2bS6OjkTq+Ku4cNC75rgygNFFSXBStBZr+3Ron/0LoXR1VK3+tZ7GH
         DOwkncxg8qkCZaqreM9/ZQu42nyLNXLO3A2BBaNZP53UmbEHjC0v121x5+p18W2ti9FF
         9YTT0BWUqCqeg3fJtYS24nFVITHXj2CAsMGbrWbk4vfQXW8zI5sEQ1JSrzUWfnQwrVmw
         xFN3kaLmjE5RMnE0TvFN2aySsNZ4wMgn4dFGlawl8xT+dk24qQCaLVUVgdMNUkUhWE9y
         q+Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=/8HcNTklXSC35TOyNK0U8zsTJeBdHzQ/ZioX1yIWwcE=;
        b=o6z7ewtcg0XxHu9qq4ip25rj8eIQvfPIT1vzzSGieIoCrWPY6a7dKImH/PVxLdJTPI
         Kn+97DCRhEuNDwqI+oEiu0zo5YCsDCuycQv854s6iTYNpuHsqy0tkBoDntVRU4n5jM3y
         ejgemYuimsjJ9vwRTDXwc0Sw2lgYCV5MOAO/4272qfYyPVMv4RzIO/14uMs0mtuHmzCo
         UZHNqDbZITrbOPC/hmhs6i8r+vFe9hNwTIu7XGue7MVnfwg1hftSYWBstmHQ5LXcq80C
         0i1O6LSIIP3faxBeF3ME46XcAsPGuEI4dqkEcjpAjvPe814Z8jyGmOlpru6RcontvopQ
         Kr6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=OknEBO+J;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id e6-20020a05600c4e4600b003d004b1b2cbsi7931726wmq.98.2023.01.09.14.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 14:43:31 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=OknEBO+J;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7197F3FF55;
	Mon,  9 Jan 2023 22:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673304211; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/8HcNTklXSC35TOyNK0U8zsTJeBdHzQ/ZioX1yIWwcE=;
	b=OknEBO+JdjYSu5/aHnatsN3rfHuKJvvmOuTPmZVBOOUTNj26UJ3uoIr8Cb59r6xH1dxCFy
	QwX+GnPL62uAYo/79UMFg7+LnrKCTdE7+68uRuzDxXBSWaAy24OGd019z7UmuxhMDWqS6E
	8n0j6+AnCLRaG9zmWe8eoYeAwOtmjB0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673304211;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/8HcNTklXSC35TOyNK0U8zsTJeBdHzQ/ZioX1yIWwcE=;
	b=o2S5ur1A4aYsI4OqTvVcwMKTxn01p/jWdzqga0w+DcZhiRnwm74WS3mtqnN62YdBYZGWsr
	Er/GIoyLvxsMtACA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D1B9013583;
	Mon,  9 Jan 2023 22:43:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GFowJpCYvGMdIQAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 09 Jan 2023 22:43:28 +0000
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
Subject: [RFC PATCH v2 17/19] target/arm: Move regime_using_lpae_format into internal.h
Date: Mon,  9 Jan 2023 19:42:30 -0300
Message-Id: <20230109224232.11661-18-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230109224232.11661-1-farosas@suse.de>
References: <20230109224232.11661-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ki+iYCbE/ddh

This function is needed by common code (ptw.c), so move it along with
the other regime_* functions in internal.h. When we enable the build
without TCG, the tlb_helper.c file will not be present.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
Richard: this cannot into ptw.c because that file is softmmu only
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
