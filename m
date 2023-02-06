Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4644560ejb;
        Mon, 6 Feb 2023 14:39:04 -0800 (PST)
X-Google-Smtp-Source: AK7set8yigpEW+466ypa92v2LCdL9BMvB6gbxS0Rzb2m3v6zBmL+3svHDORs4MwwvMIJGQszYDKj
X-Received: by 2002:a5d:6049:0:b0:248:ab8a:5144 with SMTP id j9-20020a5d6049000000b00248ab8a5144mr376215wrt.63.1675723144255;
        Mon, 06 Feb 2023 14:39:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675723144; cv=none;
        d=google.com; s=arc-20160816;
        b=Of/qwIie7QDj5wSPaHjosajLXMK8yzgkpz3Bnpma8N/TCwvMpE2wdFiOlrRgv5FG/p
         dCUOxn7O3YBZhG6YXYuqqZoIag1TtoRuxGjI7DGLtbMS6O5x6BU62/3D2to/7gxK9e1F
         HouYYw43J5tyxQyt4mJHl0XrkIoRVgpUCz+S+2X97MYb1DxuZPeDXo71mhoqFpLx7qPd
         /qGQtEWnAfHp/y10GqCV6m8gbPN/2YCyjc6qhAlOOvOYnSMiKhvNyfot4DGUBIs65HoL
         +rx9W1CmZq8MVNh4FeGsjAiGWecpo7bWtBm0fUiSo1VEnl1k6f9QZkkD/J1yW7xw5AvV
         LAGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Th29SQNs7/l87a43ReKMZy6K5gSwY95yoc+dQl25fFo=;
        b=E9Px39QA5SWm6YzY0jm2yp8dDeHZiZ4p8bh0IcOSpaHnF3QnNantnhbfZare+jkSPk
         OvC3VzjWPu8uHZROqWebnZNxcENKP0lbDyWv7w9JHzLhIrfIOphX69+9q1rP4RnBEsKC
         w1F5TbHPXJdt4KLSmAVkR5xdr+XWDVseun/YB3gmqBoS9NNHNzMFZQYYHzU7K458XoZ4
         me7pLp0aVJ0LA/PHtfgaUX+lNYlCUlKvKtOjHlSi+96JyUaWTWdbHpM1kqrTgMTy6UBl
         4QeEp0vjl47gYwB4mtddbKPbqwC1OTbEOhXIT4N4DN6owasPUu3uUoUUCPq3Z0u6aPbD
         39lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UZLAGAHV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5-20020a5d5185000000b002c3ef1c3b54si2519385wrv.299.2023.02.06.14.39.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 14:39:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UZLAGAHV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPA6Q-0002rt-S0; Mon, 06 Feb 2023 17:36:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA5q-00023X-RA
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 17:36:11 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPA5n-0004YX-V5
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 17:36:09 -0500
Received: by mail-wm1-x32c.google.com with SMTP id n13so9788451wmr.4
 for <qemu-arm@nongnu.org>; Mon, 06 Feb 2023 14:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Th29SQNs7/l87a43ReKMZy6K5gSwY95yoc+dQl25fFo=;
 b=UZLAGAHV9ptv26hSJWLRvMGmiMhBXL6bkMNNDsg5323vbcbLf0nTrFG6XCPkhlrB/J
 Wdarnnonw6ZDtTxnr/MspxQjknz9FFPRLMlPpHr12Yaz4YqLpfua9+wAVgQwrPvNIF0Z
 4iCbHG1Q4+0x0cl6enPYDrE8ZIVDsamW4q1qvfHUJfOsQmFev1X5cgB1+Ot2Onj2Hs+P
 CgbeWmCsP+SrCrtYCgG2Gj7HDsFrbPLaK0s99Lw3Wt5aA1/FRVuSQikzkc6NqsR1iNBp
 teuFWk2g41vIsI/FRkK28g3GLvwSsUh52H4BBUUa8qyBeHOffTfsaTZPpcae7HBgcqNG
 6r3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Th29SQNs7/l87a43ReKMZy6K5gSwY95yoc+dQl25fFo=;
 b=DiDrPXcGdbiS2/e6oHbhezFdK7jDcqgVnMxpkZM1JrnlVp4hSShOuRxXULvn/ayxj+
 ShJ+yEQ2LutzG3zpqLJJop/Hx3VR4x5FOb9HzgIBRz8iLiev6CU6DR2gFs0UpkK5w/nV
 v/ySMy+IcKw6SV3+Q1Cbt+RQHxjKQ/vIsXeJCuGQ+1sFXtQzU/qt3XMXL9pvigeuna5A
 GEdxOJrYfsXR57D7bhOCSJrzMNyr1IZocGBbdXN9jWfnvEPB9HkE7pPJPj4bHsf6PlZu
 4JhaUtYWgXsoCcwy5CMpSuUxyUBGU5pABOysC9+Ge8vX2IJuLqpDMvk52lC82AMxtmi0
 UMAQ==
X-Gm-Message-State: AO0yUKXzi/LIWyaGmVVvicVKaXw4g93Pb48FhtLQ8bC/JJ+qolvvZelG
 V7lkF28WS6DCxh1jiUo/DeKQ0Q==
X-Received: by 2002:a05:600c:160a:b0:3df:ffab:a391 with SMTP id
 m10-20020a05600c160a00b003dfffaba391mr1076324wmn.24.1675722966382; 
 Mon, 06 Feb 2023 14:36:06 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a05600c1d1500b003dc59d6f2f8sm13238785wms.17.2023.02.06.14.36.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 14:36:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 11/11] target/arm: Declare CPU <-> NVIC helpers in
 'hw/intc/armv7m_nvic.h'
Date: Mon,  6 Feb 2023 23:35:02 +0100
Message-Id: <20230206223502.25122-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206223502.25122-1-philmd@linaro.org>
References: <20230206223502.25122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IZAJ09UGFAiy

While dozens of files include "cpu.h", only 3 files require
these NVIC helper declarations.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/intc/armv7m_nvic.h | 123 ++++++++++++++++++++++++++++++++++
 target/arm/cpu.c              |   4 +-
 target/arm/cpu.h              | 123 ----------------------------------
 target/arm/cpu_tcg.c          |   3 +
 target/arm/m_helper.c         |   3 +
 5 files changed, 132 insertions(+), 124 deletions(-)

diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
index 07f9c21a5f..1ca262fbf8 100644
--- a/include/hw/intc/armv7m_nvic.h
+++ b/include/hw/intc/armv7m_nvic.h
@@ -83,4 +83,127 @@ struct NVICState {
     qemu_irq sysresetreq;
 };
 
+/* Interface between CPU and Interrupt controller.  */
+/**
+ * armv7m_nvic_set_pending: mark the specified exception as pending
+ * @s: the NVIC
+ * @irq: the exception number to mark pending
+ * @secure: false for non-banked exceptions or for the nonsecure
+ * version of a banked exception, true for the secure version of a banked
+ * exception.
+ *
+ * Marks the specified exception as pending. Note that we will assert()
+ * if @secure is true and @irq does not specify one of the fixed set
+ * of architecturally banked exceptions.
+ */
+void armv7m_nvic_set_pending(NVICState *s, int irq, bool secure);
+/**
+ * armv7m_nvic_set_pending_derived: mark this derived exception as pending
+ * @s: the NVIC
+ * @irq: the exception number to mark pending
+ * @secure: false for non-banked exceptions or for the nonsecure
+ * version of a banked exception, true for the secure version of a banked
+ * exception.
+ *
+ * Similar to armv7m_nvic_set_pending(), but specifically for derived
+ * exceptions (exceptions generated in the course of trying to take
+ * a different exception).
+ */
+void armv7m_nvic_set_pending_derived(NVICState *s, int irq, bool secure);
+/**
+ * armv7m_nvic_set_pending_lazyfp: mark this lazy FP exception as pending
+ * @s: the NVIC
+ * @irq: the exception number to mark pending
+ * @secure: false for non-banked exceptions or for the nonsecure
+ * version of a banked exception, true for the secure version of a banked
+ * exception.
+ *
+ * Similar to armv7m_nvic_set_pending(), but specifically for exceptions
+ * generated in the course of lazy stacking of FP registers.
+ */
+void armv7m_nvic_set_pending_lazyfp(NVICState *s, int irq, bool secure);
+/**
+ * armv7m_nvic_get_pending_irq_info: return highest priority pending
+ *    exception, and whether it targets Secure state
+ * @s: the NVIC
+ * @pirq: set to pending exception number
+ * @ptargets_secure: set to whether pending exception targets Secure
+ *
+ * This function writes the number of the highest priority pending
+ * exception (the one which would be made active by
+ * armv7m_nvic_acknowledge_irq()) to @pirq, and sets @ptargets_secure
+ * to true if the current highest priority pending exception should
+ * be taken to Secure state, false for NS.
+ */
+void armv7m_nvic_get_pending_irq_info(NVICState *s, int *pirq,
+                                      bool *ptargets_secure);
+/**
+ * armv7m_nvic_acknowledge_irq: make highest priority pending exception active
+ * @s: the NVIC
+ *
+ * Move the current highest priority pending exception from the pending
+ * state to the active state, and update v7m.exception to indicate that
+ * it is the exception currently being handled.
+ */
+void armv7m_nvic_acknowledge_irq(NVICState *s);
+/**
+ * armv7m_nvic_complete_irq: complete specified interrupt or exception
+ * @s: the NVIC
+ * @irq: the exception number to complete
+ * @secure: true if this exception was secure
+ *
+ * Returns: -1 if the irq was not active
+ *           1 if completing this irq brought us back to base (no active irqs)
+ *           0 if there is still an irq active after this one was completed
+ * (Ignoring -1, this is the same as the RETTOBASE value before completion.)
+ */
+int armv7m_nvic_complete_irq(NVICState *s, int irq, bool secure);
+/**
+ * armv7m_nvic_get_ready_status(void *opaque, int irq, bool secure)
+ * @s: the NVIC
+ * @irq: the exception number to mark pending
+ * @secure: false for non-banked exceptions or for the nonsecure
+ * version of a banked exception, true for the secure version of a banked
+ * exception.
+ *
+ * Return whether an exception is "ready", i.e. whether the exception is
+ * enabled and is configured at a priority which would allow it to
+ * interrupt the current execution priority. This controls whether the
+ * RDY bit for it in the FPCCR is set.
+ */
+bool armv7m_nvic_get_ready_status(NVICState *s, int irq, bool secure);
+/**
+ * armv7m_nvic_raw_execution_priority: return the raw execution priority
+ * @s: the NVIC
+ *
+ * Returns: the raw execution priority as defined by the v8M architecture.
+ * This is the execution priority minus the effects of AIRCR.PRIS,
+ * and minus any PRIMASK/FAULTMASK/BASEPRI priority boosting.
+ * (v8M ARM ARM I_PKLD.)
+ */
+int armv7m_nvic_raw_execution_priority(NVICState *s);
+/**
+ * armv7m_nvic_neg_prio_requested: return true if the requested execution
+ * priority is negative for the specified security state.
+ * @s: the NVIC
+ * @secure: the security state to test
+ * This corresponds to the pseudocode IsReqExecPriNeg().
+ */
+#ifndef CONFIG_USER_ONLY
+bool armv7m_nvic_neg_prio_requested(NVICState *s, bool secure);
+#else
+static inline bool armv7m_nvic_neg_prio_requested(NVICState *s, bool secure)
+{
+    return false;
+}
+#endif
+#ifndef CONFIG_USER_ONLY
+bool armv7m_nvic_can_take_pending_exception(NVICState *s);
+#else
+static inline bool armv7m_nvic_can_take_pending_exception(NVICState *s)
+{
+    return true;
+}
+#endif
+
 #endif
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b3a2275b08..876ab8f3bf 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -36,8 +36,10 @@
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/loader.h"
 #include "hw/boards.h"
+#ifdef CONFIG_TCG
 #include "hw/intc/armv7m_nvic.h"
-#endif
+#endif /* CONFIG_TCG */
+#endif /* !CONFIG_USER_ONLY */
 #include "sysemu/tcg.h"
 #include "sysemu/qtest.h"
 #include "sysemu/hw_accel.h"
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9a80819d8d..d623afe84a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2559,129 +2559,6 @@ void arm_cpu_list(void);
 uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
                                  uint32_t cur_el, bool secure);
 
-/* Interface between CPU and Interrupt controller.  */
-#ifndef CONFIG_USER_ONLY
-bool armv7m_nvic_can_take_pending_exception(NVICState *s);
-#else
-static inline bool armv7m_nvic_can_take_pending_exception(NVICState *s)
-{
-    return true;
-}
-#endif
-/**
- * armv7m_nvic_set_pending: mark the specified exception as pending
- * @s: the NVIC
- * @irq: the exception number to mark pending
- * @secure: false for non-banked exceptions or for the nonsecure
- * version of a banked exception, true for the secure version of a banked
- * exception.
- *
- * Marks the specified exception as pending. Note that we will assert()
- * if @secure is true and @irq does not specify one of the fixed set
- * of architecturally banked exceptions.
- */
-void armv7m_nvic_set_pending(NVICState *s, int irq, bool secure);
-/**
- * armv7m_nvic_set_pending_derived: mark this derived exception as pending
- * @s: the NVIC
- * @irq: the exception number to mark pending
- * @secure: false for non-banked exceptions or for the nonsecure
- * version of a banked exception, true for the secure version of a banked
- * exception.
- *
- * Similar to armv7m_nvic_set_pending(), but specifically for derived
- * exceptions (exceptions generated in the course of trying to take
- * a different exception).
- */
-void armv7m_nvic_set_pending_derived(NVICState *s, int irq, bool secure);
-/**
- * armv7m_nvic_set_pending_lazyfp: mark this lazy FP exception as pending
- * @s: the NVIC
- * @irq: the exception number to mark pending
- * @secure: false for non-banked exceptions or for the nonsecure
- * version of a banked exception, true for the secure version of a banked
- * exception.
- *
- * Similar to armv7m_nvic_set_pending(), but specifically for exceptions
- * generated in the course of lazy stacking of FP registers.
- */
-void armv7m_nvic_set_pending_lazyfp(NVICState *s, int irq, bool secure);
-/**
- * armv7m_nvic_get_pending_irq_info: return highest priority pending
- *    exception, and whether it targets Secure state
- * @s: the NVIC
- * @pirq: set to pending exception number
- * @ptargets_secure: set to whether pending exception targets Secure
- *
- * This function writes the number of the highest priority pending
- * exception (the one which would be made active by
- * armv7m_nvic_acknowledge_irq()) to @pirq, and sets @ptargets_secure
- * to true if the current highest priority pending exception should
- * be taken to Secure state, false for NS.
- */
-void armv7m_nvic_get_pending_irq_info(NVICState *s, int *pirq,
-                                      bool *ptargets_secure);
-/**
- * armv7m_nvic_acknowledge_irq: make highest priority pending exception active
- * @s: the NVIC
- *
- * Move the current highest priority pending exception from the pending
- * state to the active state, and update v7m.exception to indicate that
- * it is the exception currently being handled.
- */
-void armv7m_nvic_acknowledge_irq(NVICState *s);
-/**
- * armv7m_nvic_complete_irq: complete specified interrupt or exception
- * @s: the NVIC
- * @irq: the exception number to complete
- * @secure: true if this exception was secure
- *
- * Returns: -1 if the irq was not active
- *           1 if completing this irq brought us back to base (no active irqs)
- *           0 if there is still an irq active after this one was completed
- * (Ignoring -1, this is the same as the RETTOBASE value before completion.)
- */
-int armv7m_nvic_complete_irq(NVICState *s, int irq, bool secure);
-/**
- * armv7m_nvic_get_ready_status(void *opaque, int irq, bool secure)
- * @s: the NVIC
- * @irq: the exception number to mark pending
- * @secure: false for non-banked exceptions or for the nonsecure
- * version of a banked exception, true for the secure version of a banked
- * exception.
- *
- * Return whether an exception is "ready", i.e. whether the exception is
- * enabled and is configured at a priority which would allow it to
- * interrupt the current execution priority. This controls whether the
- * RDY bit for it in the FPCCR is set.
- */
-bool armv7m_nvic_get_ready_status(NVICState *s, int irq, bool secure);
-/**
- * armv7m_nvic_raw_execution_priority: return the raw execution priority
- * @s: the NVIC
- *
- * Returns: the raw execution priority as defined by the v8M architecture.
- * This is the execution priority minus the effects of AIRCR.PRIS,
- * and minus any PRIMASK/FAULTMASK/BASEPRI priority boosting.
- * (v8M ARM ARM I_PKLD.)
- */
-int armv7m_nvic_raw_execution_priority(NVICState *s);
-/**
- * armv7m_nvic_neg_prio_requested: return true if the requested execution
- * priority is negative for the specified security state.
- * @s: the NVIC
- * @secure: the security state to test
- * This corresponds to the pseudocode IsReqExecPriNeg().
- */
-#ifndef CONFIG_USER_ONLY
-bool armv7m_nvic_neg_prio_requested(NVICState *s, bool secure);
-#else
-static inline bool armv7m_nvic_neg_prio_requested(NVICState *s, bool secure)
-{
-    return false;
-}
-#endif
-
 /* Interface for defining coprocessor registers.
  * Registers are defined in tables of arm_cp_reginfo structs
  * which are passed to define_arm_cp_regs().
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index ccde5080eb..df0c45e523 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -19,6 +19,9 @@
 #include "hw/boards.h"
 #endif
 #include "cpregs.h"
+#if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
+#include "hw/intc/armv7m_nvic.h"
+#endif
 
 
 /* Share AArch32 -cpu max features with AArch64. */
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 25de64c43c..f94e87e728 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -18,6 +18,9 @@
 #include "exec/cpu_ldst.h"
 #include "semihosting/common-semi.h"
 #endif
+#if !defined(CONFIG_USER_ONLY)
+#include "hw/intc/armv7m_nvic.h"
+#endif
 
 static void v7m_msr_xpsr(CPUARMState *env, uint32_t mask,
                          uint32_t reg, uint32_t val)
-- 
2.38.1

