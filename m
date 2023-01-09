Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2663554ejc;
        Mon, 9 Jan 2023 14:43:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtLGCQ//kyHG0qQkpl+lJK1Cw4IDlMeU6v2SciKsQ8Hv2oZD0aGr8ATsIaSBq9ZEQivIXzt
X-Received: by 2002:a05:600c:4f96:b0:3d9:ed3b:5b3e with SMTP id n22-20020a05600c4f9600b003d9ed3b5b3emr4788712wmq.19.1673304179939;
        Mon, 09 Jan 2023 14:42:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673304179; cv=none;
        d=google.com; s=arc-20160816;
        b=ENj1Ze9T8qg967eiBzjYSICoKc3uB3BW1/rcuAc6GtNjErTW9Uerz3j5DF3nuQ6Je4
         b97nSlHO4bczIbjgBM6OiERyLdVrk/NUJyyUJ4pkTNcCrAHmX4oS4nj9fz5IN6OYJvaF
         QLpoteEgLC/GgES30GAK+ZIrzAq8cXUcYSiav44MqsTnfyO082SZ/8spMlMAG/3RW1DB
         w9w4nAcByGJixlkPX1/OTYyblZnQm6A2BiATSBYES02QVJX4N2rkXBnwSLc+JLkOgEkI
         PkPp355o02SyjVr0lmxe2TFthlLVAGUzoTs3ONsBtp5pXPgYSH/VUHyodUgt7rc3J5Ay
         wJ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=zmK4Ea/HaIadAjuTHVjNYSm3Ct4FOeHVNr26BCQ9nXw=;
        b=M9xu0c4FrcO/Lpmh3YaG3nnqJHlGoirLT81LVThRHmhFp1ukT4WFvNAObcrYEJ01Hn
         uBQ6XuPQaaPSNxetArXrN5h6/ksInAc3hxr4sripR68/SF37Idko7toh8slvBZBGMTGw
         5lE4qe054ToTHPvolpx9Xo49q6QC/CTfWPBROAm6VpE9uHQAeZ1NJSsic3H2lyZd84ci
         P2TaNkEMnZPo210iDha79gS2oj82VOQCDDZkQbJmyb/KXDOcA6KKmIS2YCkHED0bZx8K
         NonGvO+XjJMX2Q6EnLHKDMO5Js1NQZt4oS1TVoxxbJJfzaXQIn+z73n2czI50wTkduy2
         4+dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=yIVIDKnx;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id j30-20020adfa55e000000b00284d6fa24f4si8611154wrb.475.2023.01.09.14.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 14:42:59 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=yIVIDKnx;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8C3704D368;
	Mon,  9 Jan 2023 22:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1673304179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zmK4Ea/HaIadAjuTHVjNYSm3Ct4FOeHVNr26BCQ9nXw=;
	b=yIVIDKnxNTIQkV0AOn9T8AB7ycAHjHE0rb4fOWA0r0YuGZwnF89Izk4JJ1RI1JO0alNLv5
	du3vA6XVteNb4FT+cRrvFY6iX0ANjxe0vFPfqFaqQSvQM7UkCD47sMZVXjN4AaDsesQcbD
	08rK6PVthgncRejhk8fjyYFH40iLnc8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1673304179;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zmK4Ea/HaIadAjuTHVjNYSm3Ct4FOeHVNr26BCQ9nXw=;
	b=MgHR6q0geCCn0qxHOwnhQFsLgP9tWECxDJ4J4BmfWjTsp3Mat7uGplVxQa34dL86qmLsyX
	zxuJDc3yRuzgoZCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EEC0A13583;
	Mon,  9 Jan 2023 22:42:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id oJaRLXCYvGMdIQAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 09 Jan 2023 22:42:56 +0000
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
Subject: [RFC PATCH v2 07/19] target/arm: Move helper_set_pstate_* into cpregs.c
Date: Mon,  9 Jan 2023 19:42:20 -0300
Message-Id: <20230109224232.11661-8-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230109224232.11661-1-farosas@suse.de>
References: <20230109224232.11661-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Nx0PKlgY3+eG

We want to move sme_helper into the tcg directory, but the cpregs
accessor functions cannot go along, otherwise they would be separate
from the respective ARMCPRegInfo definition which needs to be compiled
with CONFIG_TCG=n as well.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/cpregs.c     | 29 +++++++++++++++++++++++++++++
 target/arm/sme_helper.c | 29 -----------------------------
 2 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/target/arm/cpregs.c b/target/arm/cpregs.c
index 88d71dbe70..a6deae9926 100644
--- a/target/arm/cpregs.c
+++ b/target/arm/cpregs.c
@@ -6633,6 +6633,35 @@ static CPAccessResult access_esm(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+void helper_set_pstate_sm(CPUARMState *env, uint32_t i)
+{
+    if (i == FIELD_EX64(env->svcr, SVCR, SM)) {
+        return;
+    }
+    env->svcr ^= R_SVCR_SM_MASK;
+    arm_reset_sve_state(env);
+}
+
+void helper_set_pstate_za(CPUARMState *env, uint32_t i)
+{
+    if (i == FIELD_EX64(env->svcr, SVCR, ZA)) {
+        return;
+    }
+    env->svcr ^= R_SVCR_ZA_MASK;
+
+    /*
+     * ResetSMEState.
+     *
+     * SetPSTATE_ZA zeros on enable and disable.  We can zero this only
+     * on enable: while disabled, the storage is inaccessible and the
+     * value does not matter.  We're not saving the storage in vmstate
+     * when disabled either.
+     */
+    if (i) {
+        memset(env->zarray, 0, sizeof(env->zarray));
+    }
+}
+
 static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index f891306bb9..ed04daf5d4 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -38,35 +38,6 @@ void arm_reset_sve_state(CPUARMState *env)
     vfp_set_fpcr(env, 0x0800009f);
 }
 
-void helper_set_pstate_sm(CPUARMState *env, uint32_t i)
-{
-    if (i == FIELD_EX64(env->svcr, SVCR, SM)) {
-        return;
-    }
-    env->svcr ^= R_SVCR_SM_MASK;
-    arm_reset_sve_state(env);
-}
-
-void helper_set_pstate_za(CPUARMState *env, uint32_t i)
-{
-    if (i == FIELD_EX64(env->svcr, SVCR, ZA)) {
-        return;
-    }
-    env->svcr ^= R_SVCR_ZA_MASK;
-
-    /*
-     * ResetSMEState.
-     *
-     * SetPSTATE_ZA zeros on enable and disable.  We can zero this only
-     * on enable: while disabled, the storage is inaccessible and the
-     * value does not matter.  We're not saving the storage in vmstate
-     * when disabled either.
-     */
-    if (i) {
-        memset(env->zarray, 0, sizeof(env->zarray));
-    }
-}
-
 void helper_sme_zero(CPUARMState *env, uint32_t imm, uint32_t svl)
 {
     uint32_t i;
-- 
2.35.3
