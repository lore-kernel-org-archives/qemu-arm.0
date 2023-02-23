Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp709502ejc;
        Thu, 23 Feb 2023 05:11:14 -0800 (PST)
X-Google-Smtp-Source: AK7set/5bgS0MSpMzl7vf0PnKdLj7aQuCNbhrS/gJFZ5zR2MyzqUlAbQnXQiWlIeYZ2WXCneDD0h
X-Received: by 2002:a5d:6089:0:b0:2c5:5327:1b09 with SMTP id w9-20020a5d6089000000b002c553271b09mr11004237wrt.37.1677157874039;
        Thu, 23 Feb 2023 05:11:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677157874; cv=none;
        d=google.com; s=arc-20160816;
        b=x+OZ1SG/YQH3kCIyx47UIX3P1SEtoePz+X+6CebXN7k+bYmKfO+6mvmUOz3/Brjeuh
         D1+LnzrE2ZO0ncg2FKFaNuLgqxCLyng8WcPzlTC7VUJp05gy3sdOK4tHFxZxfn8dyBAI
         i4bpeLbK8r0DE1zMGdF3piIhH6fxu4xthkkWSP9H2pBCv55Opdr/L4KXXEX1IL9U0kw1
         VphdZBMeZUN73DVH4sAw5oBhKiYUN5uODkAwyqWN7+alASKCsPRMc+WlUjT+KVyBk3ZO
         MmEAABH8whwik5Lun0nG3EWMLgXtQKY5LHL26rKfMlW1miniJwBQvz1ohp8ne1CIR+0O
         hUtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=qJ1xH81y4yOzibKyKSA3iXj5b5XXNpv3kPBc3vlTZEs=;
        b=bmQpGVe8ZqIj5tSmGRPocwzM6pNBbrtlyms3xFmckiE5pkTOhakUhBYhOKXSbwMOkc
         gQJYOi85GwKgKg+vLe6cqiuI7OAFGQpsM6Rl8C2MwdbZT9WcW7hriGhJK4CC02w7dpz0
         kZQe8LJTxVjdujzD/uk4ml/nfexFTwQlw/5QLalIhQBNOlT850wmOsKiIKItNjrEHGZN
         Fu6Ke0/ujSjYAedjOtuUFCxynezr9K9ThVp2KI4j/ICODlx2eELPICOytBN8QekFBky1
         8WA8tzde9opnFG5K8FJiSlkZ72OSED/XqxgEEAFpno5KSmNzUKlQCo8w4ECLERh/TiC/
         wulA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="XQW0e/Bs";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id l6-20020a5d4806000000b002c7046dcfaesi8664064wrq.173.2023.02.23.05.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 05:11:14 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="XQW0e/Bs";
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A7B8133817;
	Thu, 23 Feb 2023 13:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677157873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qJ1xH81y4yOzibKyKSA3iXj5b5XXNpv3kPBc3vlTZEs=;
	b=XQW0e/BsZKmRO5BZeZmtDrGZNLfXtwEDDPSGh2KEv6J8nt9GCsxeXfZhea7aeUX+xMvJM0
	oe9WnSIMBg7VK7lTyNOaYW0s848yMd9Unaw4kTBCAbjSmI76McIpyx+TTlmArK0rhLfKU2
	P9fWXU9nZrvQqd6nN4+By0gAmwCrbLk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677157873;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qJ1xH81y4yOzibKyKSA3iXj5b5XXNpv3kPBc3vlTZEs=;
	b=+14E560uEyuBwL73mWUUMpNf1agYhuqO9WxA+3CRHHXhYi1UYTBMNFkTz0WO8mgU45XVwJ
	6vM/Zvq6yNtNElDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CB49E139B5;
	Thu, 23 Feb 2023 13:11:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id uLGtJO5l92MLawAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 23 Feb 2023 13:11:10 +0000
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
	Alexander Graf <agraf@csgraf.de>,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v7 08/20] target/arm: Move regime_using_lpae_format into internal.h
Date: Thu, 23 Feb 2023 10:08:29 -0300
Message-Id: <20230223130841.25916-9-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230223130841.25916-1-farosas@suse.de>
References: <20230223130841.25916-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zn3q1mJ6gTvO

This function is needed by common code (ptw.c), so move it along with
the other regime_* functions in internal.h. When we enable the build
without TCG, the tlb_helper.c file will not be present.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/internals.h      | 21 ++++++++++++++++++---
 target/arm/tcg/tlb_helper.c | 18 ------------------
 2 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index ed48f8c9a6..680c574717 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -600,9 +600,6 @@ int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx);
 /* Return the MMU index for a v7M CPU in the specified security state */
 ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate);
 
-/* Return true if the translation regime is using LPAE format page tables */
-bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
-
 /*
  * Return true if the stage 1 translation regime is using LPAE
  * format page tables
@@ -767,6 +764,24 @@ static inline uint64_t regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
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
