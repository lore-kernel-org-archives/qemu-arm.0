Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp414534ejc;
        Fri, 13 Jan 2023 06:07:09 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtDg7B+qxMUnT8Oo+Cxb+AfW4VDzXwpmE2ASJ6TBv4/TGYpv9o1dWB7lQ7eFvdQy0mpC3nY
X-Received: by 2002:a5d:5b1d:0:b0:29a:c631:e761 with SMTP id bx29-20020a5d5b1d000000b0029ac631e761mr25749763wrb.43.1673618829646;
        Fri, 13 Jan 2023 06:07:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673618829; cv=none;
        d=google.com; s=arc-20160816;
        b=gZCenJmCQh9dxwZEx6CGjsN51N5283b4TPKAJ0iOQVB/MAJyu8+DkbMYiR1iDey3m2
         +R8neuGq8jbHuFFMZ17m1j6HbR7XYC2T6bQxXqSb4t5Mqw/5FTKdappEGALEpIV6ZQiO
         +AdVNk3JsKjO9Yoeelbv/6mfXgmVdUZ3nZSTEV/XvwRhmK7efSl5r+8agufddPxF4pwv
         T/vEUNVhAK+eAeF+67yVX3AYGaZDzF6YvPkb8AOYpiojrjHph7D6rj3w1HTGb4ZTCT74
         LdSMN8lDalNzdp5BpK7XxGq8mXU9D8I7X3I/YvyUpYLwZJBGcq+03nbs3RyQT2GKraTG
         y/+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=PyF8sUoOTCrhIQWtWkBHJhnk7fgtE7ayPgnJhS9bdlI=;
        b=QyXWAr0J3/vHPxN9iTZ8CqlvvgILkc+alh59dMXM7X1ct6qliKeG7/ufXdFlS2fhgw
         AxBBaYOZAzcvXjRjoHffw+TcESeUSChu7pZEK9Sq3oyOcFzuCpDRylDarRAji4cTeleT
         vGqpZhHHwGuX3G+h4IyDn4zO1WqsG5OfbeFGQUFKqkSgnWuaeS1ZeouQmWWKEyaDWhZP
         i8z9iQvFtiG4kxHPSe/Q7ws4TVrRcgErUBCW4eeiAHOLoeZmCl2QRQ1TxPfbrPjoSawW
         sKbgNdX+n2tbLIUfyJXwhwPF1rNnTgSFMoZpelJbP0pj3/Q8UgPoeBf+ctlIAFIlI2Fj
         MDDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=TmcQP655;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=oKIhacN1;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id a5-20020a056000050500b00228c68047fesi15399961wrf.999.2023.01.13.06.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:07:09 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=TmcQP655;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=oKIhacN1;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 29AF160970;
	Fri, 13 Jan 2023 14:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673618829; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PyF8sUoOTCrhIQWtWkBHJhnk7fgtE7ayPgnJhS9bdlI=;
	b=TmcQP655JqKRvskga2VmWpFmTmwGlrv63hDsLcBqOAxQ3kJ6JH+1QDexKnTZh+uI/uRLj8
	+fvNX0Whoer8E6m2ea5mkbgo/mj+eGuAYfpT898M6jpZ1bNX7HRpTyfexwP0DM5vLcqGdh
	RFdCiLq6z1G29jRrQ6l4jsKrRCyQSNc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673618829;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PyF8sUoOTCrhIQWtWkBHJhnk7fgtE7ayPgnJhS9bdlI=;
	b=oKIhacN1HqJId8CF28KN+pghnXhQtkoIypyne5el49HXLTmj5x+XKPBRWMxUDffRCzVrtF
	1QhaqySVuO06gpCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 85A101358A;
	Fri, 13 Jan 2023 14:07:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id kM3KE4plwWP8DQAAMHmgww
	(envelope-from <farosas@suse.de>); Fri, 13 Jan 2023 14:07:06 +0000
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
Subject: [RFC PATCH v3 14/28] target/arm: Move regime_using_lpae_format into internal.h
Date: Fri, 13 Jan 2023 11:04:05 -0300
Message-Id: <20230113140419.4013-15-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230113140419.4013-1-farosas@suse.de>
References: <20230113140419.4013-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: uB5uXHfspdeR

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
