Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1121900ejc;
        Thu, 9 Mar 2023 12:14:50 -0800 (PST)
X-Google-Smtp-Source: AK7set94fB4/gnLr+6IqgJQbAiEsblRWOGj1lSC6NYCx2clY+mxbegIDNxZsPZpiJsAK6ieehn/Q
X-Received: by 2002:a5d:5489:0:b0:2c7:17db:bf5a with SMTP id h9-20020a5d5489000000b002c717dbbf5amr16046554wrv.5.1678392890275;
        Thu, 09 Mar 2023 12:14:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678392890; cv=none;
        d=google.com; s=arc-20160816;
        b=OJ7gnQs3vHBw0eC25jtZx9NhS4tRBIpj9ZA9lVONXsnbTbgUDKRs1dmB4CB99OUabn
         HJshLg2gJqNVjSpjLWJLhHtfH81yTqL9WXbxC2SKd5g3JG7Y4oPDVKjQ/cd6vzCfBHrv
         Stqzz34Jo1L5b0aBVWCy31ziEsJ1ME27LX4Dg851EgdAuViPpZUgEP5+aK0ON2feB7Ja
         Mfws4BMgKKvkxKE5+MDojDBiu+EatBNx+5Ypvv7pKFecn75tXWO3BkuzMAkKlPH/N84b
         dUB1BKKkCC52aOpXf8mfADpWUcHh7Kr2NddjFqqpeN6Y8U2S8jxtCsFXwhunytQzTwqw
         dp9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=xlfXR7yI6epTVEgJoIFGrnyMo6sRdWeNp6PeIYEg/3U=;
        b=D9yiVWnpY5I6zKahxR3lRfG0IIK3X+xNdef+TMuYzECKP8YjuZRPpYIO98zyepKJkB
         qpYVrR5qGg49pRw5w/BAQEIpPr0SQqWfLsx95Fs8Yv18WwiEHs1RlTzgy4yGU5dPvsJs
         pUWH74g5Uhy8Q6uJ1alcDXSug/k2vecgHd1VWsCzmOedlucHnwnW4COeDWo61RI6IMpx
         caCV+4b7lI6gJqJNTlXQHBeulUh3PjhFte06IWgcGyfNViAiaxwrSmVVp/TPzwszJpK2
         xu2Y0jWqBdqBQrrXPlX7QblaXFRJmGISOHkvwFog4iBDAQm4Kq4yKKHtdw/GsyJ+bJ2Q
         hCfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Iiatu5YN;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=snF7s8vY;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [2001:67c:2178:6::1c])
        by mx.google.com with ESMTPS id w15-20020adfd4cf000000b002c55b2265b7si258868wrk.829.2023.03.09.12.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 12:14:50 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) client-ip=2001:67c:2178:6::1c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=Iiatu5YN;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=snF7s8vY;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1c as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D6A0D223D1;
	Thu,  9 Mar 2023 20:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678392889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xlfXR7yI6epTVEgJoIFGrnyMo6sRdWeNp6PeIYEg/3U=;
	b=Iiatu5YNZ8gopb2aS6O+swd6h1cZkpAzH718AuvogrtwOPHv6eaWYZLQN4Age6xGuHgZil
	KBEFAmhbrhoNUWncvoNw0FxQkcPA1usFODg3z9m2rptatdCTK5d8U1+6D3hqEpVl0I+OJJ
	Y1zglo1y7CE9NIzVS/8N0AfRC762TrY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678392889;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xlfXR7yI6epTVEgJoIFGrnyMo6sRdWeNp6PeIYEg/3U=;
	b=snF7s8vY2vNVgNZXBxDbWHNIi7phrD/HDNELOmrPBdvtkZLs8synCSWpZFcTW7BZFuXX1j
	cWni5LcS32eEdKCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ED8541391B;
	Thu,  9 Mar 2023 20:14:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id WJjsLDY+CmTUZwAAMHmgww
	(envelope-from <farosas@suse.de>); Thu, 09 Mar 2023 20:14:46 +0000
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
Subject: [PATCH v8 03/11] target/arm: Move aa32_max_features out of cpu_tcg.c
Date: Thu,  9 Mar 2023 17:14:26 -0300
Message-Id: <20230309201434.10831-4-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230309201434.10831-1-farosas@suse.de>
References: <20230309201434.10831-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 8s4yAqaFY9+e

In preparation to moving the cpu_tcg.c code into a 32-bit, tcg-only
file, move the aa32_max_features function which is shared between
32/64/tcg/non-tcg into cpu.c.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/cpu.c     | 69 ++++++++++++++++++++++++++++++++++++++++++++
 target/arm/cpu_tcg.c | 69 --------------------------------------------
 2 files changed, 69 insertions(+), 69 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5182ed0c91..eccbb8f123 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2158,6 +2158,75 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     acc->parent_realize(dev, errp);
 }
 
+/* Share AArch32 -cpu max features with AArch64. */
+void aa32_max_features(ARMCPU *cpu)
+{
+    uint32_t t;
+
+    /* Add additional features supported by QEMU */
+    t = cpu->isar.id_isar5;
+    t = FIELD_DP32(t, ID_ISAR5, AES, 2);          /* FEAT_PMULL */
+    t = FIELD_DP32(t, ID_ISAR5, SHA1, 1);         /* FEAT_SHA1 */
+    t = FIELD_DP32(t, ID_ISAR5, SHA2, 1);         /* FEAT_SHA256 */
+    t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);
+    t = FIELD_DP32(t, ID_ISAR5, RDM, 1);          /* FEAT_RDM */
+    t = FIELD_DP32(t, ID_ISAR5, VCMA, 1);         /* FEAT_FCMA */
+    cpu->isar.id_isar5 = t;
+
+    t = cpu->isar.id_isar6;
+    t = FIELD_DP32(t, ID_ISAR6, JSCVT, 1);        /* FEAT_JSCVT */
+    t = FIELD_DP32(t, ID_ISAR6, DP, 1);           /* Feat_DotProd */
+    t = FIELD_DP32(t, ID_ISAR6, FHM, 1);          /* FEAT_FHM */
+    t = FIELD_DP32(t, ID_ISAR6, SB, 1);           /* FEAT_SB */
+    t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);      /* FEAT_SPECRES */
+    t = FIELD_DP32(t, ID_ISAR6, BF16, 1);         /* FEAT_AA32BF16 */
+    t = FIELD_DP32(t, ID_ISAR6, I8MM, 1);         /* FEAT_AA32I8MM */
+    cpu->isar.id_isar6 = t;
+
+    t = cpu->isar.mvfr1;
+    t = FIELD_DP32(t, MVFR1, FPHP, 3);            /* FEAT_FP16 */
+    t = FIELD_DP32(t, MVFR1, SIMDHP, 2);          /* FEAT_FP16 */
+    cpu->isar.mvfr1 = t;
+
+    t = cpu->isar.mvfr2;
+    t = FIELD_DP32(t, MVFR2, SIMDMISC, 3);        /* SIMD MaxNum */
+    t = FIELD_DP32(t, MVFR2, FPMISC, 4);          /* FP MaxNum */
+    cpu->isar.mvfr2 = t;
+
+    t = cpu->isar.id_mmfr3;
+    t = FIELD_DP32(t, ID_MMFR3, PAN, 2);          /* FEAT_PAN2 */
+    cpu->isar.id_mmfr3 = t;
+
+    t = cpu->isar.id_mmfr4;
+    t = FIELD_DP32(t, ID_MMFR4, HPDS, 1);         /* FEAT_AA32HPD */
+    t = FIELD_DP32(t, ID_MMFR4, AC2, 1);          /* ACTLR2, HACTLR2 */
+    t = FIELD_DP32(t, ID_MMFR4, CNP, 1);          /* FEAT_TTCNP */
+    t = FIELD_DP32(t, ID_MMFR4, XNX, 1);          /* FEAT_XNX */
+    t = FIELD_DP32(t, ID_MMFR4, EVT, 2);          /* FEAT_EVT */
+    cpu->isar.id_mmfr4 = t;
+
+    t = cpu->isar.id_mmfr5;
+    t = FIELD_DP32(t, ID_MMFR5, ETS, 1);          /* FEAT_ETS */
+    cpu->isar.id_mmfr5 = t;
+
+    t = cpu->isar.id_pfr0;
+    t = FIELD_DP32(t, ID_PFR0, CSV2, 2);          /* FEAT_CVS2 */
+    t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
+    t = FIELD_DP32(t, ID_PFR0, RAS, 1);           /* FEAT_RAS */
+    cpu->isar.id_pfr0 = t;
+
+    t = cpu->isar.id_pfr2;
+    t = FIELD_DP32(t, ID_PFR2, CSV3, 1);          /* FEAT_CSV3 */
+    t = FIELD_DP32(t, ID_PFR2, SSBS, 1);          /* FEAT_SSBS */
+    cpu->isar.id_pfr2 = t;
+
+    t = cpu->isar.id_dfr0;
+    t = FIELD_DP32(t, ID_DFR0, COPDBG, 9);        /* FEAT_Debugv8p4 */
+    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 9);       /* FEAT_Debugv8p4 */
+    t = FIELD_DP32(t, ID_DFR0, PERFMON, 6);       /* FEAT_PMUv3p5 */
+    cpu->isar.id_dfr0 = t;
+}
+
 static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 6ce728134f..5a2690f56e 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -24,75 +24,6 @@
 #endif
 
 
-/* Share AArch32 -cpu max features with AArch64. */
-void aa32_max_features(ARMCPU *cpu)
-{
-    uint32_t t;
-
-    /* Add additional features supported by QEMU */
-    t = cpu->isar.id_isar5;
-    t = FIELD_DP32(t, ID_ISAR5, AES, 2);          /* FEAT_PMULL */
-    t = FIELD_DP32(t, ID_ISAR5, SHA1, 1);         /* FEAT_SHA1 */
-    t = FIELD_DP32(t, ID_ISAR5, SHA2, 1);         /* FEAT_SHA256 */
-    t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);
-    t = FIELD_DP32(t, ID_ISAR5, RDM, 1);          /* FEAT_RDM */
-    t = FIELD_DP32(t, ID_ISAR5, VCMA, 1);         /* FEAT_FCMA */
-    cpu->isar.id_isar5 = t;
-
-    t = cpu->isar.id_isar6;
-    t = FIELD_DP32(t, ID_ISAR6, JSCVT, 1);        /* FEAT_JSCVT */
-    t = FIELD_DP32(t, ID_ISAR6, DP, 1);           /* Feat_DotProd */
-    t = FIELD_DP32(t, ID_ISAR6, FHM, 1);          /* FEAT_FHM */
-    t = FIELD_DP32(t, ID_ISAR6, SB, 1);           /* FEAT_SB */
-    t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);      /* FEAT_SPECRES */
-    t = FIELD_DP32(t, ID_ISAR6, BF16, 1);         /* FEAT_AA32BF16 */
-    t = FIELD_DP32(t, ID_ISAR6, I8MM, 1);         /* FEAT_AA32I8MM */
-    cpu->isar.id_isar6 = t;
-
-    t = cpu->isar.mvfr1;
-    t = FIELD_DP32(t, MVFR1, FPHP, 3);            /* FEAT_FP16 */
-    t = FIELD_DP32(t, MVFR1, SIMDHP, 2);          /* FEAT_FP16 */
-    cpu->isar.mvfr1 = t;
-
-    t = cpu->isar.mvfr2;
-    t = FIELD_DP32(t, MVFR2, SIMDMISC, 3);        /* SIMD MaxNum */
-    t = FIELD_DP32(t, MVFR2, FPMISC, 4);          /* FP MaxNum */
-    cpu->isar.mvfr2 = t;
-
-    t = cpu->isar.id_mmfr3;
-    t = FIELD_DP32(t, ID_MMFR3, PAN, 2);          /* FEAT_PAN2 */
-    cpu->isar.id_mmfr3 = t;
-
-    t = cpu->isar.id_mmfr4;
-    t = FIELD_DP32(t, ID_MMFR4, HPDS, 1);         /* FEAT_AA32HPD */
-    t = FIELD_DP32(t, ID_MMFR4, AC2, 1);          /* ACTLR2, HACTLR2 */
-    t = FIELD_DP32(t, ID_MMFR4, CNP, 1);          /* FEAT_TTCNP */
-    t = FIELD_DP32(t, ID_MMFR4, XNX, 1);          /* FEAT_XNX */
-    t = FIELD_DP32(t, ID_MMFR4, EVT, 2);          /* FEAT_EVT */
-    cpu->isar.id_mmfr4 = t;
-
-    t = cpu->isar.id_mmfr5;
-    t = FIELD_DP32(t, ID_MMFR5, ETS, 1);          /* FEAT_ETS */
-    cpu->isar.id_mmfr5 = t;
-
-    t = cpu->isar.id_pfr0;
-    t = FIELD_DP32(t, ID_PFR0, CSV2, 2);          /* FEAT_CVS2 */
-    t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
-    t = FIELD_DP32(t, ID_PFR0, RAS, 1);           /* FEAT_RAS */
-    cpu->isar.id_pfr0 = t;
-
-    t = cpu->isar.id_pfr2;
-    t = FIELD_DP32(t, ID_PFR2, CSV3, 1);          /* FEAT_CSV3 */
-    t = FIELD_DP32(t, ID_PFR2, SSBS, 1);          /* FEAT_SSBS */
-    cpu->isar.id_pfr2 = t;
-
-    t = cpu->isar.id_dfr0;
-    t = FIELD_DP32(t, ID_DFR0, COPDBG, 9);        /* FEAT_Debugv8p4 */
-    t = FIELD_DP32(t, ID_DFR0, COPSDBG, 9);       /* FEAT_Debugv8p4 */
-    t = FIELD_DP32(t, ID_DFR0, PERFMON, 6);       /* FEAT_PMUv3p5 */
-    cpu->isar.id_dfr0 = t;
-}
-
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
 
-- 
2.35.3
