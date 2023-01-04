Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8305798ejb;
        Wed, 4 Jan 2023 14:01:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvuRivFlVwcT27ritB41wC0OjmQ0mET8ESLEHw1FSc9yXqg7ptlBf5rLnyLutf7YQS/sZ+d
X-Received: by 2002:adf:df86:0:b0:242:67f6:89c5 with SMTP id z6-20020adfdf86000000b0024267f689c5mr31640658wrl.12.1672869686624;
        Wed, 04 Jan 2023 14:01:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672869686; cv=none;
        d=google.com; s=arc-20160816;
        b=XmhyYzrwlFVl5xk1LNkOe/p6SIjlxNVPNnhRmLRDwp4iOckknw/9VPBjRPhiznPxYG
         qSQJbIt+NuoDYux2ngCiyI7jXMI4Y+dIiN03Euyt9x8anXHlnfr/+m4BEsjanhDTxJGb
         Fvjv2mn2eRgrXsE/etfdrzIFS0OCvAuYX1haDCA0E2YVkFFn9e0DSk/y/2LZoPfOB8fX
         pqIyfeTlPf142HxY8MpdkjQtmYUUYZZ9BudbLuTUDISf+3CzAIlA79Fokdj5tAIRpau+
         TEIN9MH7rJA+aFGNmgyVIIQF8noRFuYpCo5rU7dCZG2PatJMtg9it/UQUkVuCmDMW4jO
         q4zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=1PaijFlUItYdll2HVL0Jw+dMXhIBDHIBnIalmZ6vk7E=;
        b=d67fLEpCGt211K1SECUDqnoyADoBqtZ4b13WmuagKWH28F/uMgHTO5iYuuEuIOkkCG
         YtdDI1Ry9rIi/iy4Ju8mRkKl0hCr+exwbU10TWNAvwx9nckoPX9AUD4xzWTAH20v44CM
         xejbGpaN2u7goKAEJAL1izDdFOLagGGOSXeBZL67NPOguYpQaD1DT80nwPW9Vg+oZIoQ
         5fxRhc3q8ze3zs95dFZPO8TLhJgAOV+BMIp9RcqaiFMPGEetcfkPQF0GlHj3v2qedwGh
         SQCN2zwEIpreh/0QHC4ZNySL+aFDe+zPp0S4ziQXAWXA923rdkX4M5NjQw5dcjwi0AKQ
         WEmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=RqOd5GO2;
       dkim=neutral (no key) header.i=@suse.de header.b=qPxdsfH6;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id o3-20020a5d6483000000b00285a4247d9fsi17723118wri.123.2023.01.04.14.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 14:01:26 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=RqOd5GO2;
       dkim=neutral (no key) header.i=@suse.de header.b=qPxdsfH6;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 416224D800;
	Wed,  4 Jan 2023 22:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1672869686; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1PaijFlUItYdll2HVL0Jw+dMXhIBDHIBnIalmZ6vk7E=;
	b=RqOd5GO2pcQU+GIPcsZnvPZ3lq4M2jb/cKp1rHqF7YVJ7IfcFmdjC7hlcorKtPQzXl5pIJ
	L8wQqZgS6l/T5f0b3XOVehnZhTGBxiBqb/6Rb+P7FGEBnt8EcOzHjtngjUF++tMCE+SkBK
	vlc0CIiimLbxyG+jr6KYk/7dD+7Ntm4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1672869686;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1PaijFlUItYdll2HVL0Jw+dMXhIBDHIBnIalmZ6vk7E=;
	b=qPxdsfH6np1EVg+jhjG0cCqMgvUwv50Z3ySHmRhmPMsdkNpvHnHlrEtBdakvqXqz+TKnlh
	LRmo2HtZ4WsSvBAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 888771342C;
	Wed,  4 Jan 2023 22:01:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sKwbFDP3tWPwJAAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 04 Jan 2023 22:01:23 +0000
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
Subject: [RFC PATCH 14/27] target/arm: Move regime_using_lpae_format into internal.h
Date: Wed,  4 Jan 2023 18:58:22 -0300
Message-Id: <20230104215835.24692-15-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230104215835.24692-1-farosas@suse.de>
References: <20230104215835.24692-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: D7eKElEyuTm9

This function is needed by common code (ptw.c), so move it along with
the other regime_* functions in internal.h. When we enable the build
without TCG, the tlb_helper.c file will not be present.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/internals.h  | 17 ++++++++++++++---
 target/arm/tlb_helper.c | 14 --------------
 2 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 161e42d50f..3493b5cc88 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -610,9 +610,6 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate_and_priv(CPUARMState *env,
 /* Return the MMU index for a v7M CPU in the specified security state */
 ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate);
 
-/* Return true if the translation regime is using LPAE format page tables */
-bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
-
 /*
  * Return true if the stage 1 translation regime is using LPAE
  * format page tables
@@ -777,6 +774,20 @@ static inline uint64_t regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
     return env->cp15.tcr_el[regime_el(env, mmu_idx)];
 }
 
+/* Return true if the translation regime is using LPAE format page tables */
+static inline bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    int el = regime_el(env, mmu_idx);
+    if (el == 2 || arm_el_is_aa64(env, el)) {
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
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 0f4f4fc809..31eb77f7df 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -12,20 +12,6 @@
 #include "exec/helper-proto.h"
 
 
-/* Return true if the translation regime is using LPAE format page tables */
-bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    int el = regime_el(env, mmu_idx);
-    if (el == 2 || arm_el_is_aa64(env, el)) {
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
