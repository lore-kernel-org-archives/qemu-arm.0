Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp128131ejb;
        Fri, 17 Feb 2023 12:14:39 -0800 (PST)
X-Google-Smtp-Source: AK7set/ixqZfuhVXVRURKjKj1FxnRpXE97tLqbm35+jZKzkQIWmaj4yj4iwR40oNKAURzeJerrqU
X-Received: by 2002:a5d:4443:0:b0:2c5:8475:5bbd with SMTP id x3-20020a5d4443000000b002c584755bbdmr5582440wrr.57.1676664879685;
        Fri, 17 Feb 2023 12:14:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676664879; cv=none;
        d=google.com; s=arc-20160816;
        b=hNW8MHsyV+JMqYG2OZ/7fTDGFSmCPEHkgC+pmkwYaLSehJfj+X+8eYILkcH4uY9QiT
         iyK8Q5RuVzkyv7OBoXuXCHPhfGq51Z8BX8V+7oYzQ2FNfRvEOvX+tn9+vhDsO7XYi+qY
         98bgD4Aypy/YTWfV9jnGtl1EXJV8p6CG4D8JrlUiYkcB8Fsn4nx2OUZ3SCjldABCxezo
         9A8TTwUUyLVXqUr8e7e44SHZDKPq5wyBZNgVhf6awqAbIUMCAr03p4GLCaeTH6dpV57o
         gXvU5xxYH+T5/2NATevps3hDkPRQ0n02ieab8EoxJpRf7Cw+euBpuQd1s0V4qWav2z1c
         aTCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=N9FIzaIkSv6rgEhjC8Dr7KFOzlMy8GFKhZMGITqTzP8=;
        b=gmLbtC0ShHzqkmz3P8OiDpp7ToBBaefLunuKdvdCg/lhPi+aYcNUyMGI/pCUWUhKYa
         hKZ+hs6m0v3Aru2C7MIku0kFtdwA/fqmADz5y0VJqu6JbusIZ48ytTaFy50+k7rVLclY
         yKNFeIEKTQqkQ4TX0tqwuEB2PNnmveckwkJROpCWJzqjYMNxqO+yvMne2O+ynsZwAJXC
         Ua4C0MTn1gFx1Z1K/fThgTF+i4Jb5+HNdunHO07IHNtIFQEoyQQt2fYwVOvYLTX+K9uK
         tazoAqJ6L94sXxFrTnm98Hi9BL75ANdZYDwb8+8t2MSMnHBAkXr+bbkHyGElRsro/mRB
         ISrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=sCZDW1wG;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id z3-20020a5d4c83000000b002c56c4c540esi4955848wrs.941.2023.02.17.12.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 12:14:39 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=sCZDW1wG;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 476FF20FB9;
	Fri, 17 Feb 2023 20:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676664879; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N9FIzaIkSv6rgEhjC8Dr7KFOzlMy8GFKhZMGITqTzP8=;
	b=sCZDW1wGG8+79ph8dHx8qR7ckPjXXNoD1kGP2BizDlLqyeJdQ/6FlZLg3rvdUopxeINy0z
	+jwOosprSiYw/UYR0oXbLzrkpsIhQ4knRAViy9j2WWeUnx/JdbgHOdoIgokHuMhqB//duA
	PE8/izioNhnlenpsflR1pT+RUzjvQ2M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676664879;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N9FIzaIkSv6rgEhjC8Dr7KFOzlMy8GFKhZMGITqTzP8=;
	b=FGyHxAJ2QcNMHCucsTzLcMRUJq4k1i4gunrscMWuF8out17hkcH1iTZIa/jXXn/JPlPxnU
	26nYZQIPNlFIuyBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 67753138E3;
	Fri, 17 Feb 2023 20:14:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id YDE/DCzg72MwIAAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 17 Feb 2023 20:14:36 +0000
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
Subject: [PATCH v6 13/29] target/arm: Move regime_using_lpae_format into internal.h
Date: Fri, 17 Feb 2023 17:11:34 -0300
Message-Id: <20230217201150.22032-14-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230217201150.22032-1-farosas@suse.de>
References: <20230217201150.22032-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5Ze4m1Bm2A5V

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
index 22a0451157..6ebe59959e 100644
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
