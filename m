Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp536425ejb;
        Tue, 13 Jun 2023 06:36:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6BduPAY4iyJi7fKreSvYDr0k8RASCEwoay/rY7+BvyCb2+5YwUGJeKGBF9dgB9UbaRRrix
X-Received: by 2002:a05:6214:29c7:b0:62b:68bf:7c7b with SMTP id gh7-20020a05621429c700b0062b68bf7c7bmr13010751qvb.8.1686663394582;
        Tue, 13 Jun 2023 06:36:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686663394; cv=none;
        d=google.com; s=arc-20160816;
        b=sdlIzPbjEJSNRMg9MPjaC21c5bdwAdX8bKgeyzYpZ2pTBpWWZhv2iu2zpAzY49zZB9
         6bzh4MAhU8Ouq1AMmMX9HnMcRMa9BA92++IEcT3lY0nOTX6pmmhs7O+mmHj/O7HYVZsV
         gzo61cn7TgC41wUYhaPDekq/Wq4/HxNm3oQRTay4I8bb019Y7RjlqhhiaQrYDmQrBmVN
         jiTU/dXRC0/DzjuJqTqAArEXiZc6D5LjIbn6f9gAr1uqulR07wPJPYxLcCK3vRI42Yoh
         W09/hO4B3RLksGZTuLH+O1qNCvU99xLpiqhgDZk49ylaHXXZmsnq1AjkvvLXmS8FaPod
         3Eiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QWPTnkImhuHCo3jirUvcxZ5f588h3TWca2fzH3d9+/s=;
        b=Em2WF3xFGyMeDz7Bir3rSAZ3xZdOVZVSQKMYeYlFxufFRpysWqtDWh61pmAnV3Q+mf
         GVirA3YrG1bPZMghTucoZ54rZLsOz5P2MGKkgJPvgchjhmsC2oOy3dyDdZ5sFjxS23mL
         LYxTNf7KpahQtUDdHF/vMdGUzMLCb39i2maSXUTXZFZKhaOzf0lXvykozPBGc4GBvpI3
         C+GgphxGBHJRjso8SQN6Do2BQAsxP2j1on/vZPLoepAGDHgaMHuI09hv7ogGArpDqrAC
         KLB3R3l3WruuBIZ8yhc4Es8wVZwoCiOTQUMKZ4/ZDSWxP0HcGc3OmH7emJYI/umSa2Nd
         QmjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=etfl5uxg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q12-20020a05620a038c00b0075b08125656si3773245qkm.641.2023.06.13.06.36.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jun 2023 06:36:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=etfl5uxg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q94Bq-0001JF-KW; Tue, 13 Jun 2023 09:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q94Bn-0001GG-SH
 for qemu-arm@nongnu.org; Tue, 13 Jun 2023 09:36:04 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q94Bj-0002d1-WD
 for qemu-arm@nongnu.org; Tue, 13 Jun 2023 09:36:03 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f62b512fe2so7059569e87.1
 for <qemu-arm@nongnu.org>; Tue, 13 Jun 2023 06:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686663358; x=1689255358;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QWPTnkImhuHCo3jirUvcxZ5f588h3TWca2fzH3d9+/s=;
 b=etfl5uxgikvtUSh5hOV/QhteyFz9S9M0LqnpCIT0ZtrgCOwvyNDLTxVeo9njqJKxw5
 Q5C2qZf6cQj7OAylQ5b2oQmqqMlR7IA/FEDc988GbOyaKohV4mBnjRjSefP82yZLYrJX
 m6exBC2d2aKxXRxncBy35zpt/QdbmPuY6bVaCIvY+bUz+IngmpOFRR3Tu89JoUO7yGVK
 cruw8ReX1w0XakBdW5UzvH2mUkJk0VfspJ2XQTjmPvqtzdlZBzId2ep5VWjskeLYemAO
 HaIkFmu3uj8r1rGe4anGHYNxwm4FzzN/F24aqAALAYXJU88i3n0gEQA+58LVqPx7Ne2n
 ZycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686663358; x=1689255358;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QWPTnkImhuHCo3jirUvcxZ5f588h3TWca2fzH3d9+/s=;
 b=R+BoQ8z3KtgyVTTf1PD1QKbB0jwTkmpK78waC3FgQxLDQ3442zqE33W/ZF7Ibdx7Ty
 OTIK4YPPd4kqi5urLKmAeWuVTKy8CFN0qiSmit+3/a/cUcEagKofLw+/Wb+/rfd9EjFz
 OQI2cg14elPBq+OXLDXMG6ZbQH48MD4wR2DYTQr61CnbssPioQ/BVSIbIof54FHtTCGd
 a+T8ais5S/cc5u8j+xF93KHeYadvRyCuZamrdtbKdXBlqkpoL08RCYKZ2RK3A8Db3NUM
 CvQXQ4I9r+vjPcNMjyDZxUthACKiVdtKrBBPjYjQ3Vox46Me1sv/kO1gxu03Crv3A8qR
 tAQA==
X-Gm-Message-State: AC+VfDyFv/TzlpDe+f1K0S8rGghy0qHBzh2wm4ExaYNH0FXkNXiCkqNA
 OhjC99CIhKzsyqMOKMviYn+uAw==
X-Received: by 2002:a19:5e12:0:b0:4f6:d9e:7c3b with SMTP id
 s18-20020a195e12000000b004f60d9e7c3bmr5524079lfb.44.1686663358151; 
 Tue, 13 Jun 2023 06:35:58 -0700 (PDT)
Received: from localhost.localdomain ([213.235.133.109])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a170906a28800b009655eb8be26sm6697881ejz.73.2023.06.13.06.35.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Jun 2023 06:35:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 5/9] hw/core/cpu: Check for USER_ONLY definition instead of
 SOFTMMU one
Date: Tue, 13 Jun 2023 15:33:43 +0200
Message-Id: <20230613133347.82210-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230613133347.82210-1-philmd@linaro.org>
References: <20230613133347.82210-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: LlNq1Kx8dZ4y

Since we *might* have user emulation with softmmu,
replace the system emulation check by !user emulation one.

Invert the #ifdef'ry in TCGCPUOps structure for clarity.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h         |   4 +-
 include/hw/core/tcg-cpu-ops.h | 102 +++++++++++++++++-----------------
 2 files changed, 53 insertions(+), 53 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 383456d1b3..f41b0c56f7 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1014,7 +1014,7 @@ void page_size_init(void);
 
 #ifdef NEED_CPU_H
 
-#ifdef CONFIG_SOFTMMU
+#ifndef CONFIG_USER_ONLY
 
 extern const VMStateDescription vmstate_cpu_common;
 
@@ -1025,7 +1025,7 @@ extern const VMStateDescription vmstate_cpu_common;
     .flags = VMS_STRUCT,                                                    \
     .offset = 0,                                                            \
 }
-#endif /* CONFIG_SOFTMMU */
+#endif /* !CONFIG_USER_ONLY */
 
 #endif /* NEED_CPU_H */
 
diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 0ae08df47e..3e8b1b737a 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -64,7 +64,56 @@ struct TCGCPUOps {
      */
     void (*do_interrupt)(CPUState *cpu);
 #endif /* !CONFIG_USER_ONLY || !TARGET_I386 */
-#ifdef CONFIG_SOFTMMU
+#ifdef CONFIG_USER_ONLY
+    /**
+     * record_sigsegv:
+     * @cpu: cpu context
+     * @addr: faulting guest address
+     * @access_type: access was read/write/execute
+     * @maperr: true for invalid page, false for permission fault
+     * @ra: host pc for unwinding
+     *
+     * We are about to raise SIGSEGV with si_code set for @maperr,
+     * and si_addr set for @addr.  Record anything further needed
+     * for the signal ucontext_t.
+     *
+     * If the emulated kernel does not provide anything to the signal
+     * handler with anything besides the user context registers, and
+     * the siginfo_t, then this hook need do nothing and may be omitted.
+     * Otherwise, record the data and return; the caller will raise
+     * the signal, unwind the cpu state, and return to the main loop.
+     *
+     * If it is simpler to re-use the sysemu tlb_fill code, @ra is provided
+     * so that a "normal" cpu exception can be raised.  In this case,
+     * the signal must be raised by the architecture cpu_loop.
+     */
+    void (*record_sigsegv)(CPUState *cpu, vaddr addr,
+                           MMUAccessType access_type,
+                           bool maperr, uintptr_t ra);
+    /**
+     * record_sigbus:
+     * @cpu: cpu context
+     * @addr: misaligned guest address
+     * @access_type: access was read/write/execute
+     * @ra: host pc for unwinding
+     *
+     * We are about to raise SIGBUS with si_code BUS_ADRALN,
+     * and si_addr set for @addr.  Record anything further needed
+     * for the signal ucontext_t.
+     *
+     * If the emulated kernel does not provide the signal handler with
+     * anything besides the user context registers, and the siginfo_t,
+     * then this hook need do nothing and may be omitted.
+     * Otherwise, record the data and return; the caller will raise
+     * the signal, unwind the cpu state, and return to the main loop.
+     *
+     * If it is simpler to re-use the sysemu do_unaligned_access code,
+     * @ra is provided so that a "normal" cpu exception can be raised.
+     * In this case, the signal must be raised by the architecture cpu_loop.
+     */
+    void (*record_sigbus)(CPUState *cpu, vaddr addr,
+                          MMUAccessType access_type, uintptr_t ra);
+#else
     /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
     bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
     /**
@@ -121,56 +170,7 @@ struct TCGCPUOps {
      */
     bool (*io_recompile_replay_branch)(CPUState *cpu,
                                        const TranslationBlock *tb);
-#else
-    /**
-     * record_sigsegv:
-     * @cpu: cpu context
-     * @addr: faulting guest address
-     * @access_type: access was read/write/execute
-     * @maperr: true for invalid page, false for permission fault
-     * @ra: host pc for unwinding
-     *
-     * We are about to raise SIGSEGV with si_code set for @maperr,
-     * and si_addr set for @addr.  Record anything further needed
-     * for the signal ucontext_t.
-     *
-     * If the emulated kernel does not provide anything to the signal
-     * handler with anything besides the user context registers, and
-     * the siginfo_t, then this hook need do nothing and may be omitted.
-     * Otherwise, record the data and return; the caller will raise
-     * the signal, unwind the cpu state, and return to the main loop.
-     *
-     * If it is simpler to re-use the sysemu tlb_fill code, @ra is provided
-     * so that a "normal" cpu exception can be raised.  In this case,
-     * the signal must be raised by the architecture cpu_loop.
-     */
-    void (*record_sigsegv)(CPUState *cpu, vaddr addr,
-                           MMUAccessType access_type,
-                           bool maperr, uintptr_t ra);
-    /**
-     * record_sigbus:
-     * @cpu: cpu context
-     * @addr: misaligned guest address
-     * @access_type: access was read/write/execute
-     * @ra: host pc for unwinding
-     *
-     * We are about to raise SIGBUS with si_code BUS_ADRALN,
-     * and si_addr set for @addr.  Record anything further needed
-     * for the signal ucontext_t.
-     *
-     * If the emulated kernel does not provide the signal handler with
-     * anything besides the user context registers, and the siginfo_t,
-     * then this hook need do nothing and may be omitted.
-     * Otherwise, record the data and return; the caller will raise
-     * the signal, unwind the cpu state, and return to the main loop.
-     *
-     * If it is simpler to re-use the sysemu do_unaligned_access code,
-     * @ra is provided so that a "normal" cpu exception can be raised.
-     * In this case, the signal must be raised by the architecture cpu_loop.
-     */
-    void (*record_sigbus)(CPUState *cpu, vaddr addr,
-                          MMUAccessType access_type, uintptr_t ra);
-#endif /* CONFIG_SOFTMMU */
+#endif /* !CONFIG_USER_ONLY */
 #endif /* NEED_CPU_H */
 
 };
-- 
2.38.1

