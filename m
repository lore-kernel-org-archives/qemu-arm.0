Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp1833469ejb;
        Fri, 8 Mar 2024 06:12:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWiaoa5bX5U6QcB/isncjLdbLaDbfY65KP/YGljPx/bsRuiCRDfdLDlD+jpmtEDbOLg2aUFvTB+KGbX2Xnxk7S1iTVHcj4U
X-Google-Smtp-Source: AGHT+IELf2I4mjVl9PM86doWydHzNCaBEuYnVFL9DWu9zDJIUNgjiSDQr0tTFXBIgp8H8aTzP6Qz
X-Received: by 2002:a05:620a:127b:b0:788:260f:79e with SMTP id b27-20020a05620a127b00b00788260f079emr10400977qkl.46.1709907146573;
        Fri, 08 Mar 2024 06:12:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709907146; cv=none;
        d=google.com; s=arc-20160816;
        b=i5tWLUWPvnW+J4V+k6VOYt3StOR3OXYyqT1sxoI5adSqDWvOL1Iuh6ClpNnlH30ho8
         Yf2VLsTY8i0ZRPxcxduDiAyH7wIH0Ix5ND9Se8SEa9Q/r8rz492KXZ/WSZslSukEJuuA
         vmelZvWqaWXguDHAeI0oHc6bWa+L9Ma+QWBcu9ADqwUoqgHncHu5LVfN82s7Q9Es7yPb
         3/a6n3FE5WJNpLrxnjOEirACrNs2u+XKjt6YsWU6W0mpRt8UjX4Y5QRvL8i0p4wKv2yP
         gBLg89/7wIbCrR9v+TZ6/4vsXvecoZSs3o33RVjHQag9NYTHrOj6u8mzfAjv/g3Xy4x8
         riHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3bKtB/YaN3PWPWXFJPdyJ5oWfRF1A7iAjFaT5FFBe6k=;
        fh=1OmMLtlHRnnOukQVo+dDoLD8Fyg7stHzFszvvcBOnfw=;
        b=mIs1/X9nIdT2s9OxhYgL34gfzjtUr/4Bmvo3vW4JD3b9UbPX9PRdeQZoTJeR5VaXsx
         Q6wXl6cB2ZdQQ+wtnpNE1YpvOZLZyLUltfxmDezrDLNjEIEsUuQLveL2aJNhi6KHrKx3
         0C2Z7dqInNaHFLSD+oNI7Fq1aBSeNwrusYe29TTZ7vwnJWceZ+FmupxBlYH9zbToM4X8
         y3jQoCB6bLtnhoQKMk+fPeNKv23BJR2K1l6fRPXRHeVTXey7nNw1tvLqLvulyGwu4Z2D
         5vsH+E/ywPni4Ym4/v2C03kGvr8//ZhlGXrNHmtipiuplgkRHNB8EFSoAa7cZ/disuax
         3l5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fTEMrxSn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id vu22-20020a05620a561600b007883fc75fd7si5416132qkn.250.2024.03.08.06.12.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Mar 2024 06:12:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fTEMrxSn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1riawH-0007WQ-MP; Fri, 08 Mar 2024 09:11:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1riawF-0007Uj-9i
 for qemu-devel@nongnu.org; Fri, 08 Mar 2024 09:11:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1riaw9-0000YC-6H
 for qemu-devel@nongnu.org; Fri, 08 Mar 2024 09:11:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709907060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3bKtB/YaN3PWPWXFJPdyJ5oWfRF1A7iAjFaT5FFBe6k=;
 b=fTEMrxSnhizFFcI+vPgczQJuuLnjNIUc9eVnlcIyKec8ULzqJWenXNGLVwF0aCr4nS1QVH
 AyuqzQlaRF0SqOHTq4ykPDuC+5vOdbxisG+YbIhC/M2GNEyLKYa31Xba/tofHlhqOv10jr
 NUr9/NsGG1TnBTwzVDCMqm7pw912CBc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-92-ChqcXAGfOniqWgjkSF2N6g-1; Fri,
 08 Mar 2024 09:10:57 -0500
X-MC-Unique: ChqcXAGfOniqWgjkSF2N6g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C0E33801F4D;
 Fri,  8 Mar 2024 14:10:57 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6D8C492BD5;
 Fri,  8 Mar 2024 14:10:55 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 2/3] target/arm/tcg/m_helper.c: Include the full helpers
 only with CONFIG_ARM_V7M
Date: Fri,  8 Mar 2024 15:10:50 +0100
Message-ID: <20240308141051.536599-3-thuth@redhat.com>
In-Reply-To: <20240308141051.536599-1-thuth@redhat.com>
References: <20240308141051.536599-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.572,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: km7Il4m6RnHO

If CONFIG_ARM_V7M is not set, we don't want to include the full-fledged
helper functions that require additional functions for linking. Use some
stubs functions that call g_assert_not_reached() instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/arm/tcg/m_helper.c | 93 +++++++++++++++++++++++++--------------
 1 file changed, 61 insertions(+), 32 deletions(-)

diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
index d1f1e02acc..d38becd975 100644
--- a/target/arm/tcg/m_helper.c
+++ b/target/arm/tcg/m_helper.c
@@ -22,8 +22,11 @@
 #endif
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/intc/armv7m_nvic.h"
+#include CONFIG_DEVICES
 #endif
 
+#if defined(CONFIG_USER_ONLY) || defined(CONFIG_ARM_V7M)
+
 static void v7m_msr_xpsr(CPUARMState *env, uint32_t mask,
                          uint32_t reg, uint32_t val)
 {
@@ -58,6 +61,8 @@ static uint32_t v7m_mrs_xpsr(CPUARMState *env, uint32_t reg, unsigned el)
     return xpsr_read(env) & mask;
 }
 
+#endif
+
 uint32_t arm_v7m_mrs_control(CPUARMState *env, uint32_t secure)
 {
     uint32_t value = env->v7m.control[secure];
@@ -69,6 +74,40 @@ uint32_t arm_v7m_mrs_control(CPUARMState *env, uint32_t secure)
     return value;
 }
 
+#if defined(CONFIG_USER_ONLY) || !defined(CONFIG_ARM_V7M)
+
+void HELPER(v7m_bxns)(CPUARMState *env, uint32_t dest)
+{
+    /* translate.c should never generate calls here in user-only mode */
+    g_assert_not_reached();
+}
+
+void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
+{
+    /* translate.c should never generate calls here in user-only mode */
+    g_assert_not_reached();
+}
+
+void HELPER(v7m_preserve_fp_state)(CPUARMState *env)
+{
+    /* translate.c should never generate calls here in user-only mode */
+    g_assert_not_reached();
+}
+
+void HELPER(v7m_vlstm)(CPUARMState *env, uint32_t fptr)
+{
+    /* translate.c should never generate calls here in user-only mode */
+    g_assert_not_reached();
+}
+
+void HELPER(v7m_vlldm)(CPUARMState *env, uint32_t fptr)
+{
+    /* translate.c should never generate calls here in user-only mode */
+    g_assert_not_reached();
+}
+
+#endif
+
 #ifdef CONFIG_USER_ONLY
 
 void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
@@ -101,37 +140,6 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
         return 0;
     }
 }
-
-void HELPER(v7m_bxns)(CPUARMState *env, uint32_t dest)
-{
-    /* translate.c should never generate calls here in user-only mode */
-    g_assert_not_reached();
-}
-
-void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
-{
-    /* translate.c should never generate calls here in user-only mode */
-    g_assert_not_reached();
-}
-
-void HELPER(v7m_preserve_fp_state)(CPUARMState *env)
-{
-    /* translate.c should never generate calls here in user-only mode */
-    g_assert_not_reached();
-}
-
-void HELPER(v7m_vlstm)(CPUARMState *env, uint32_t fptr)
-{
-    /* translate.c should never generate calls here in user-only mode */
-    g_assert_not_reached();
-}
-
-void HELPER(v7m_vlldm)(CPUARMState *env, uint32_t fptr)
-{
-    /* translate.c should never generate calls here in user-only mode */
-    g_assert_not_reached();
-}
-
 uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
 {
     /*
@@ -160,7 +168,28 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
     return ARMMMUIdx_MUser;
 }
 
-#else /* !CONFIG_USER_ONLY */
+#elif !defined(CONFIG_ARM_V7M)
+
+void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
+{
+    g_assert_not_reached();
+}
+
+uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
+{
+    g_assert_not_reached();
+}
+uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
+{
+    g_assert_not_reached();
+}
+
+ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
+{
+     g_assert_not_reached();
+}
+
+#else
 
 static ARMMMUIdx arm_v7m_mmu_idx_all(CPUARMState *env,
                                      bool secstate, bool priv, bool negpri)
-- 
2.44.0

