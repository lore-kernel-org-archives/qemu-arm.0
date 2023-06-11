Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1372694ejb;
        Sun, 11 Jun 2023 02:05:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6NeoAeREEhnsKpVY2w0mXxVch8yfEgDOpL0WZ5eF9/xexYJXGBD98H4TOqq1sRWUPb4dnn
X-Received: by 2002:a05:620a:490b:b0:75d:4025:99db with SMTP id ed11-20020a05620a490b00b0075d402599dbmr5825048qkb.1.1686474306250;
        Sun, 11 Jun 2023 02:05:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686474306; cv=none;
        d=google.com; s=arc-20160816;
        b=lnPc6h20d8hbpbnXCaV8EXQlPKPDWkuKfdihmPWqqlY+WAECz7DIjZDOuVDkfJV3A1
         uOgjAcyqUnyeZMGL4ExmbvAf05KNK+dSUzsSmBdjfJaoj83HCQp2bfLAevA3OCHNax2f
         2kV69kwc+5M0LKhKTKzu0H0RAKNC/HkL6n1oRlmEnWsHIDvW6sZjgv3VL08m/WkSrZoO
         Fx45G+ghg+s02DQLv5tGtyjz+taYsmM03QBJEY8BttuP5kmmT+HRiPmRKq8XEZJjcZcG
         yJdd0fBtbSgrKWpiLGh/i56oXje/NdpofKfXjOZj5L87ad5xc5efjSgOsbHRY8/Vafhn
         SaPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TyRRQl63EjUwf6nuHb///9HEwrhn3HTdxj4GOGWSaio=;
        b=UliajJL8f/wE+R+4fb4bSbnKL9ebE3DDEGKD9Fuml++wLSFcHphsq85kYth4bmRYMe
         Rj8dKtBL+9keu9NpnqK9DvJRX+X9lCQbeqk12euBFQKlMwtnyMgidafIz/yd3pQTouxC
         o/GzEHshVBzDqVNoy3GV/t9IBSkwzjSdef0fjgZhPsnu+OSt2UmVTN4ulJ2ksPYfDneE
         xwMCt53nUDuSEp4t/6nrB3qo972QrZLAv0+i+vbJqQiVKHXIgpvxT7A7Sp/2CmNmdOTk
         Y1SjDnyWyEj4ybbRjCauGgch/MYwcjAOCtdzcGohQb8fPVN3DDqFzoI2bYxc69FijNQz
         NTJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wFALolBS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2-20020ae9e202000000b0075cadcdf168si4479702qkc.653.2023.06.11.02.05.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Jun 2023 02:05:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wFALolBS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q8Gxm-0005wY-Nz; Sun, 11 Jun 2023 05:02:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8Gvt-0002mQ-1j
 for qemu-devel@nongnu.org; Sun, 11 Jun 2023 05:00:21 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q8Gvp-00042B-CN
 for qemu-devel@nongnu.org; Sun, 11 Jun 2023 05:00:19 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f6d7abe934so23013095e9.2
 for <qemu-devel@nongnu.org>; Sun, 11 Jun 2023 02:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686474015; x=1689066015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TyRRQl63EjUwf6nuHb///9HEwrhn3HTdxj4GOGWSaio=;
 b=wFALolBSDATXLAJZVy/5VIIHEKz6MtJ4Oo6FQJUB+5nDrq+KEN5DiyDI6EJlSwLAaT
 fj8VUBclM/4BP3MoSOiwGOMrHMFvfVVnE+nidosA3fVEsCPggsO40vArzPMWXHmxaihF
 RbZbz27aKCCfK/vrDMIW/FO9QzXpFLK+bLBH4rC6P+2CUz9FQpwPwfT93abSrDWclrBV
 roFycHxq5Ji56xFVMC2OetkezCi0Wfr06M/Od5T4ZbaCJgb0OqSMvb+dmET6EOiuKEeZ
 f6NKLV3bm473qj4aiyp3Q4WKzA1rB7z6URXN811+jCUW6GpJ3tWboJqR00+IQX8M/kgI
 qAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686474015; x=1689066015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TyRRQl63EjUwf6nuHb///9HEwrhn3HTdxj4GOGWSaio=;
 b=Kh1hFcc8oe4ckrQsOfhrpj0fPjOo3+bw5xeARypsc7p4d0cB3AzhwMDaEhZXmoDJEz
 s32JnzPp2109pzHXTWU0RcQ2Szo5LwbXOcWmcDcOrgYAkbCXtfLo0HlTrtIRN5Nn0jIY
 pXi5qKlkNCZh5thxthads0Ama30xvjDSqrG3e9Ui5Y7NBrvjnqcm9CJoevqM7nDLEiD2
 zWf61/+1WefULpi5TtSdcziuUHwXHEwzABezVzB35PU9nE+iV+4/K+e2N5EI/FpEA80z
 QGPQzkJwD2cwAwxxkFLVQPbCZCA8onEObY5RAGLixLV/rtGZSyUgxvk/V6bzJ5KSE4Wo
 2//g==
X-Gm-Message-State: AC+VfDwQZRGzfIbFXp21Va6j5SaJV8WQ28nMKmAeKbsbbgcbY11DE8QA
 XBfXvFeepfTR5DFMuIuczD/jy6NyAq25JGroYys=
X-Received: by 2002:a7b:c7d4:0:b0:3f6:389:73b1 with SMTP id
 z20-20020a7bc7d4000000b003f6038973b1mr3909544wmk.6.1686474014917; 
 Sun, 11 Jun 2023 02:00:14 -0700 (PDT)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 u5-20020a5d5145000000b0030fa57d8064sm5842041wrt.52.2023.06.11.02.00.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 11 Jun 2023 02:00:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 20/26] target/arm/tcg: Move v8m_stackcheck() from
 op_helper.c to m_helper.c
Date: Sun, 11 Jun 2023 10:58:40 +0200
Message-Id: <20230611085846.21415-21-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230611085846.21415-1-philmd@linaro.org>
References: <20230611085846.21415-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: gzFKWpE3v9+d

No need to have the v8m_stackcheck() helper in the generic
op_helper.c, move it with the rest of the M-profile helpers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/m_helper.c  | 16 ++++++++++++++++
 target/arm/tcg/op_helper.c | 16 ----------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
index 0891acc29c..0780bb3dea 100644
--- a/target/arm/tcg/m_helper.c
+++ b/target/arm/tcg/m_helper.c
@@ -2893,3 +2893,19 @@ uint32_t *arm_v7m_get_sp_ptr(CPUARMState *env, bool secure, bool threadmode,
         }
     }
 }
+
+void HELPER(v8m_stackcheck)(CPUARMState *env, uint32_t newvalue)
+{
+    /*
+     * Perform the v8M stack limit check for SP updates from translated code,
+     * raising an exception if the limit is breached.
+     */
+    if (newvalue < v7m_sp_limit(env)) {
+        /*
+         * Stack limit exceptions are a rare case, so rather than syncing
+         * PC/condbits before the call, we use raise_exception_ra() so
+         * that cpu_restore_state() will sort them out.
+         */
+        raise_exception_ra(env, EXCP_STKOF, 0, 1, GETPC());
+    }
+}
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 70a9c37b74..04a90e3e3a 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -82,22 +82,6 @@ void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
     raise_exception(env, excp, syndrome, target_el);
 }
 
-void HELPER(v8m_stackcheck)(CPUARMState *env, uint32_t newvalue)
-{
-    /*
-     * Perform the v8M stack limit check for SP updates from translated code,
-     * raising an exception if the limit is breached.
-     */
-    if (newvalue < v7m_sp_limit(env)) {
-        /*
-         * Stack limit exceptions are a rare case, so rather than syncing
-         * PC/condbits before the call, we use raise_exception_ra() so
-         * that cpu_restore_state() will sort them out.
-         */
-        raise_exception_ra(env, EXCP_STKOF, 0, 1, GETPC());
-    }
-}
-
 uint32_t HELPER(add_setq)(CPUARMState *env, uint32_t a, uint32_t b)
 {
     uint32_t res = a + b;
-- 
2.38.1

