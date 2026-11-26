Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999A5606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 05:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MCXTPE/A
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWS1n-0004FK-NC; Thu, 26 Nov 2026 00:28:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haseebashraf091@gmail.com>)
 id 1xWS1V-0004Cd-V5
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 00:27:58 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haseebashraf091@gmail.com>)
 id 1xWS1U-0001mH-EW
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 00:27:57 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4bb6ba3b244so66897105e9.3
 for <qemu-arm@nongnu.org>; Wed, 25 Nov 2026 21:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795670874; x=1796275674; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6cw4bVM/elmiYBT/hpISiGamNAca35rw9WaolQpyJgc=;
 b=MCXTPE/A26kObri0Ka3Yi2TyLa6bKRcKtiLjj7udUwhSNE3t0Szgjw8LZrsQXLjboo
 X3f9mNJ4ps7HJrhIQJy256bSpfVroXEPTrLrlyoitVD7+as+61SrnLTMLse3W5m9DwiV
 woqQRlTGdCeV7jexyUbPi9ECh7G7JNRdcdJh4S/IA/dQ7YGelvzryrTI9PbxkEJoTnco
 4FYACrUd4rq+PkduZruOnMeKhvdMPdBS0OHgpm9VRtSrhQGlClbdsOlAGK9ZZb9z7IDy
 0bedAlP09RYandr1gvM1qCYgnp6oC5n68SGEkqtryJ+E2z19Mg3zn61ZbEc4KWsLSXUS
 iQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795670874; x=1796275674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=6cw4bVM/elmiYBT/hpISiGamNAca35rw9WaolQpyJgc=;
 b=PXFjbbgy7V5LO1i5pm6x11IMS9CuEzQDf969jwbGXY2yREVAozPZjWCanhquzwNlTH
 IZL0YPY+3/sB967f1PZP/7sev7Rl6CfyiM+eHkaUnXs2+8a0uyG3fds/893IhMpHOT2n
 LqJ1ob+/jk9FS8TpUIM8ueunTkwlYWoPORcae6cFq8ZmrPY+WyZgihnRzm0JGTOFpWXO
 aq6evkPUwCK28MB6Sz3SAgk2/GyabBxsC3kuEP69oGm18a0mFq561KNH6v/Qno2jQ9gT
 F1gXCyoVcyVb84qE+FGAnZKaFaQlIAuxV/T/DkN7A6u+QJOuGYgftzFFyGHvLBjjZNIz
 B4mQ==
X-Forwarded-Encrypted: i=1;
 AL+hErGw7wo0UOayg4o2DLxZnGRoQkPkww8+SaAvUEfBUhorSZmcdkIAvMDvH/EKWH31qQCs5heafkIXFQ==@nongnu.org
X-Gm-Message-State: APuU4Z8Nzi5j0P1+u9u1tTq3/PEgVcRLIoKGgLXQrfDLlBFj8FBJ01Vd
 2P9A9RDq+AIE+5ybNGETpz82GUXmaWqomMPUeK8QLAK9wgGlcNTCOzEZxk6pahSVEvU=
X-Gm-Gg: AZFdTZfdhL1aPmggpX7kS1pPXixpGsSuMgBTwErUQ4tXLSGqyErH15NQc6FizSmHJ37
 dmBTnlXWwz11SiKhulHxHDD8sUcMmEFQdBZJ/bF9G0iDdoUia1Z/aODX00D90X29/qQXiKEXVJf
 HxNE+qRIJzryDILmlLhhOIGdUyq5NhDfucGGQLvWFbOU81KTNZxPENqHhADrlpy5DIb8yyT4GQW
 AhvXxPmHN1iUD7NE5PzAkJZbkgola9gb0yMIf0l/K9ccfooH75/In7McqBxhV5BZopLBpPH3k9q
 itNyBZHCTQuPIIC5Bk/3XxIQwdKvAvZquiddblLFhdFlFJsnX3yKYtxN1N+gNPp32Lrlg9lSkkb
 eU8KyGkxjegxElHYzCIrF6gkonu6IqNmfGh9H9Mtj3MxjoBkAqQnhuXDVHQtxlOtJR8dV1H4W+d
 jUWihqcmUgiZobR0nHGBsHs2AIBHQT1+hqM+p/+sQW00gdOy/lJSL2cmhWqTDucmBjeHs05XFcX
 aWxudNzsgYWqmM2TLNov7vicnS2Yodsg6waPO9QvTMauzG4QQnaVV9zklaMwIzBdOEb0aWnumm/
 tXELa6SxlqC8KTPBuB82I6gAl0//zyFT4M9hXXoKAnGz65GYweKPI/7aEBAjJlAiYR/wJUU6kOX
 hZQvO8dOMAqv/7nJLgRhCYTDG
X-Received: by 2002:a05:600c:820d:b0:4bb:6cef:d14b with SMTP id
 5b1f17b1804b1-4bb887c34f1mr406326865e9.2.1795670873743; 
 Wed, 25 Nov 2026 21:27:53 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.25.192])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853b2437sm808310475e9.13.2026.11.25.21.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 21:27:53 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Cc: Haseeb Ashraf <haseeb.ashraf@siemens.com>,
 Eric Auger <eric.auger@redhat.com>,
 Khushit Shah <khushit.shah@nutanix.com>, Marc Zyngier <maz@kernel.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Subject: [RFC PATCH v3 1/3] target/arm/kvm: Add kvm_arm_el2_e2h0_supported()
Date: Thu, 26 Nov 2026 10:27:39 +0500
Message-ID: <20261126052741.90607-2-haseebashraf091@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126052741.90607-1-haseebashraf091@gmail.com>
References: <20261121204601.741616-1-haseebashraf091@gmail.com>
 <20261126052741.90607-1-haseebashraf091@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=haseebashraf091@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Haseeb Ashraf <haseeb.ashraf@siemens.com>

Add a helper reporting whether KVM can limit a nested guest to an
nVHE-only EL2 (HCR_EL2.E2H RES0) through the
KVM_ARM_VCPU_HAS_EL2_E2H0 vCPU feature.  KVM advertises this with
KVM_CAP_ARM_EL2_E2H0.

The next patch uses it to let the user select an nVHE-only EL2.

Signed-off-by: Haseeb Ashraf <haseeb.ashraf@siemens.com>
---
 target/arm/kvm-stub.c |  5 +++++
 target/arm/kvm.c      |  5 +++++
 target/arm/kvm_arm.h  | 13 +++++++++++++
 3 files changed, 23 insertions(+)

diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
index c9387f5c8c..88e35909c4 100644
--- a/target/arm/kvm-stub.c
+++ b/target/arm/kvm-stub.c
@@ -42,6 +42,11 @@ bool kvm_arm_el2_supported(void)
     return false;
 }
 
+bool kvm_arm_el2_e2h0_supported(void)
+{
+    return false;
+}
+
 /*
  * These functions should never actually be called without KVM support.
  */
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 36a5faf537..8ef5597c68 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -2178,6 +2178,11 @@ bool kvm_arm_el2_supported(void)
     return kvm_check_extension(kvm_state, KVM_CAP_ARM_EL2);
 }
 
+bool kvm_arm_el2_e2h0_supported(void)
+{
+    return kvm_check_extension(kvm_state, KVM_CAP_ARM_EL2_E2H0);
+}
+
 bool kvm_arm_mte_supported(void)
 {
     return kvm_check_extension(kvm_state, KVM_CAP_ARM_MTE);
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 2e7e02e4a4..0916a5fdb4 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -200,6 +200,14 @@ bool kvm_arm_mte_supported(void);
  * Returns true if KVM can enable EL2 and false otherwise.
  */
 bool kvm_arm_el2_supported(void);
+
+/**
+ * kvm_arm_el2_e2h0_supported:
+ *
+ * Returns true if KVM can limit EL2 to nVHE (HCR_EL2.E2H RES0) through
+ * KVM_ARM_VCPU_HAS_EL2_E2H0, and false otherwise.
+ */
+bool kvm_arm_el2_e2h0_supported(void);
 #else
 
 static inline bool kvm_arm_aarch32_supported(void)
@@ -216,6 +224,11 @@ static inline bool kvm_arm_el2_supported(void)
 {
     return false;
 }
+
+static inline bool kvm_arm_el2_e2h0_supported(void)
+{
+    return false;
+}
 #endif
 
 /**
-- 
2.34.1


