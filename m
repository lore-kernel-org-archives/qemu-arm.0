Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp755729lfb;
        Thu, 19 Nov 2020 14:05:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmivXudkmo1+q9LLzrfr6JPNcPFgwsWQqvCxlyzxdGq8Y4rubk61WJe8dp3YrEULud0cZ2
X-Received: by 2002:a25:6e8b:: with SMTP id j133mr19599797ybc.273.1605823527655;
        Thu, 19 Nov 2020 14:05:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605823527; cv=none;
        d=google.com; s=arc-20160816;
        b=rficY/ar5ocBLu0zte/wV5gb9uiYD5px7vD5HcXRazXOVA/wqNzV1uYb2JWvJnrIKY
         +yFOXb5adpwiOUGGqiDUCJeQhklyh+z45VIVE9xK2eJOY2v29Qm21Bg8UBQoRmF4rYUj
         lOrgbAcIuCXUeAc902y8l91YaUOxQSHmGhswKiyQRb3Lt08pRCAGQL9MqUzeWcJ7/CjT
         yF1lXu7IDXf+5nq9rsVp5SEtpdqgl0NA1q6k0QjByU5CNegm/NFuJAf8mjJUoSSRiCfD
         f8GMOfZTuGPWNN4dVTScevwuOT/cuLQZUL1/pdKv+oRVfOL4hXfOo9YC3jo4VywqpcTV
         xj6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dmuz2iP7WEA/tvUoqpMotG3FBE2Nn1szm0QJrAqWTGk=;
        b=VWP9bChWvv5xo2IqOLEubRiMS+QitslMYbd8ADEDaJIS/u2UB2ihWS8sFWStXDN1cQ
         tOQEdpHPymAOgUgrKgqJA56BrvKMH4Hm2tka5WuBsauiBGtIP0doc0+DUnTLyzlR0NVa
         HPA5eYWnhsfZXm6t/hk7oLG97uLyKWElFj36iWZoBwFhmvx/QUNrzuiuwv+l9j8s2p57
         uFwu/Wxh7O155t2V8ji6DgcuHTeIBMLJk/Hd+Cy0iRE7wqKX6YfaPDWelRv08R1Czjdz
         uvQSbe0S9+O7xEtNDivLY+dfYKcBSN8ilzI6kDP/RfaZkJ0chKSzv3R4OAsfD/q7p7eZ
         LxpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kYBF8L3K;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l3si878055ybc.76.2020.11.19.14.05.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Nov 2020 14:05:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kYBF8L3K;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kfs3T-0001UQ-31
	for alex.bennee@linaro.org; Thu, 19 Nov 2020 17:05:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrvC-0000ow-D4
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:54 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:34719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfruz-0004DI-8v
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 16:56:54 -0500
Received: by mail-wm1-x343.google.com with SMTP id x13so1671473wmj.1
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 13:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dmuz2iP7WEA/tvUoqpMotG3FBE2Nn1szm0QJrAqWTGk=;
 b=kYBF8L3K6y9rm7F16oLlrGgWMYpUAgbXdg7iFtFl7HLmlSM2+H7zHdwYhWAvr36KCw
 FrDaDaKFw4T/TTmIqLqDQDXrapvx2pjz5v86NIExxlRyjKsbnwA6NKQHNRssKicrQMUc
 Ow9vmFLQpeGM+ZlPj2Zx6+YuCo3zO7WPI8uNTFjannSSYMz24CnxpterjVsnozbxzOyn
 wGLafW5XoZpe6ReDGZkOj2XeZo5OsQ89J6Q0wu4E65QS1JxxKfRM0M32W6IK2aShq3NR
 /jOJdx9cUwMOsejQY6M8mQqXqz8Ug24mWi2blgPFSsQaEFzefeu0IaIJPRUXxkm9euOJ
 DA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dmuz2iP7WEA/tvUoqpMotG3FBE2Nn1szm0QJrAqWTGk=;
 b=Y/Bn6GZ6EBJg7Yrgp8N+r0JdwV20EWlQ9/RVtCMEbaudL2afkcUmBJKTYKUvnIvTIG
 QlBTABUdSPbySQluY5tQfs+Vegw00NYtDRe8LTrWFJbcZSlUQBOzkTyf97/OQgbZiVA3
 0JDjsupwRF66+UPgQvKfDKz80lou4ESUK/HzCiYpZguCEDxAKY1Dwn1mVAzLba0orGfV
 3KsTHWgYj4Kp6LEfS5nfe+kzJEq9gyVBSG/ebJEmdlBToL67syV3hPowTwhI7TEGrFz8
 0fV8DcWPvlvDXuYA305mr091hpK6l++Yn0Ad8DrjCJvPr7agtGrKCuJdIAp3CYSHmSUS
 u6JA==
X-Gm-Message-State: AOAM5327EAz6YxqRUnQexc4xKUSRdsm9J3+zDDizZAFcpX0gcs4cHlyW
 AeHTHz94G6VyKPRs4L1IN6p+MQCnsj8u4w==
X-Received: by 2002:a1c:7e8e:: with SMTP id z136mr6852627wmc.46.1605822998689; 
 Thu, 19 Nov 2020 13:56:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 16/28] target/arm: For v8.1M, always clear R0-R3, R12, APSR,
 EPSR on exception entry
Date: Thu, 19 Nov 2020 21:56:05 +0000
Message-Id: <20201119215617.29887-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SJK69KyDOjnB

In v8.0M, on exception entry the registers R0-R3, R12, APSR and EPSR
are zeroed for an exception taken to Non-secure state; for an
exception taken to Secure state they become UNKNOWN, and we chose to
leave them at their previous values.

In v8.1M the behaviour is specified more tightly and these registers
are always zeroed regardless of the security state that the exception
targets (see rule R_KPZV).  Implement this.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/m_helper.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index aad01ea0127..721b4b4896e 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -897,10 +897,12 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain,
          * Clear registers if necessary to prevent non-secure exception
          * code being able to see register values from secure code.
          * Where register values become architecturally UNKNOWN we leave
-         * them with their previous values.
+         * them with their previous values. v8.1M is tighter than v8.0M
+         * here and always zeroes the caller-saved registers regardless
+         * of the security state the exception is targeting.
          */
         if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
-            if (!targets_secure) {
+            if (!targets_secure || arm_feature(env, ARM_FEATURE_V8_1M)) {
                 /*
                  * Always clear the caller-saved registers (they have been
                  * pushed to the stack earlier in v7m_push_stack()).
@@ -909,10 +911,16 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain,
                  * v7m_push_callee_stack()).
                  */
                 int i;
+                /*
+                 * r4..r11 are callee-saves, zero only if background
+                 * state was Secure (EXCRET.S == 1) and exception
+                 * targets Non-secure state
+                 */
+                bool zero_callee_saves = !targets_secure &&
+                    (lr & R_V7M_EXCRET_S_MASK);
 
                 for (i = 0; i < 13; i++) {
-                    /* r4..r11 are callee-saves, zero only if EXCRET.S == 1 */
-                    if (i < 4 || i > 11 || (lr & R_V7M_EXCRET_S_MASK)) {
+                    if (i < 4 || i > 11 || zero_callee_saves) {
                         env->regs[i] = 0;
                     }
                 }
-- 
2.20.1

