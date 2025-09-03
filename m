Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7833CA1014
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 10:08:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utkPq-0000MC-7j; Wed, 03 Sep 2025 06:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkPo-000078-1b
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:08:32 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkPl-0008Ed-BF
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:08:30 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45b8b1a104cso30190675e9.2
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 03:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756894108; x=1757498908; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mfBUeAUwt+eqp/pj/TWibPsbie+q9qDh7Zc332DV0wI=;
 b=vkx1hRVVGa0hhjDY36JQG6H0nLZcViTlkd4yR37B1dOE3AWYPzc7CEmx7uL2cStfck
 15zEoqRPuGmD9GqE+WayQojeMR5I/yFO99wLLITXIKzHfylJkJudwh6E0QCY6Lnd67XI
 j/BlDGBM5IoL/TINw7sguIDmmYI2EwgpjFmSaOgOK4EiPJFgcaTcjb0LD8XKwJeXUDON
 pPaNpKoZrBidEKQJXkjy7ufxhcUIKrbN/3WbAZN6B5wM1R6wyeSkjvvIhNkrmOJ3Imo7
 LqVUqnjkDG2OwRb94xRz5I7IyzumBSjGH1/ewonfnrj2OQv8T/SV+/U5Yj5GrbWz5Avy
 DaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756894108; x=1757498908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mfBUeAUwt+eqp/pj/TWibPsbie+q9qDh7Zc332DV0wI=;
 b=X52ej+H6WRSkw3XWebh2joUYRGWS5aGHSqG78Q579nmqxNjF+Rs+OrBkHOt2uiNz92
 BDA4KBEj5zTlK7/0dH9wX1Y/uJd2qQyDpz3SCdR0vwHzR4ZBuweaq5OIuKONlt9rJd8I
 rgkpb7DTheanOT+9PJg/hw4mgdtPX/r325rXzDKsPggYF2QVZuvf/oDRXq6b5Jex1q6M
 xEnLLwuzzXvw7wQPAI1SJf1sa1DSxWQJUdeR0UvONFFuf40mCD2aC6hPItvumtmnJ5OW
 5Sl4r2t27xBtA6HpJJaJNH14ufs/SlSN0v6uz8eik2PxSXNRxoMGZtQqDiJBvWE96mc3
 oX+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYQ1yG+eWWlY2htIjR8cKuP3W8Uy/XVODmN0311sTgyzlkLeU53FZhV/cf0sZf8KLgoKq4O/MK0Q==@nongnu.org
X-Gm-Message-State: AOJu0YyZGlYpbp4v0OU5ePeQM4YliypU1mHfsaqF8k7HCMJQk/gQuInZ
 v7FIQPjUg7Sh0gF45fk9JINIP4e9kYZarJWmhzpo0LHpPrvrxSuXh2+FIlQ9A3KIaHU=
X-Gm-Gg: ASbGncv1kHCVzBstyuX/zzX1ua7aSsIRcTmZAfKlMNKQK/L4IMrmcRDQxhBgZRoGxwa
 cRg+6giNjMnJAjnteN+5NUkHotUY55oLUhjRWty9tjMeg2Kt8yv0ZGBC//K7BIr8UzeXbnT+ka8
 mBNLmeTjgdvxpoAlv8nnMSsPwTx73H5viBMN0MgjLyssOF4V3jE4cf1BS1vjZ6wtvLp34hNKiE3
 P8te79zgyhF6MzYQITXNAeLGrFZaY/KoH84assFw0EsGSFb3AXyZIgvz1fm4jm69oxrqkueOlZR
 MXWOHUAzLWUF37d1NePEwbaFzTQZIq8Ma9b3/+7rK74z3awFanAdhi5X+XMhBUy0epIxMCHNs6h
 23yH9mingGsqCens8SNwZQ24v8UCDYqdkB1FRM2pqN5jtFHfdMgUH6jiZqPHMPTunaxj79ehf0a
 MVgx622w==
X-Google-Smtp-Source: AGHT+IHrZQWslXtIwFReCRNiCOlC1Ec2aBaEU1WWclLbkENvnuPBMNYygSJuQ75rsyGcP9LSqcQnNA==
X-Received: by 2002:a05:600c:5486:b0:45b:8d2a:cd09 with SMTP id
 5b1f17b1804b1-45b9bd607a7mr34954755e9.13.1756894107799; 
 Wed, 03 Sep 2025 03:08:27 -0700 (PDT)
Received: from localhost.localdomain (98.red-88-29-180.dynamicip.rima-tde.net.
 [88.29.180.98]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b813816desm127741245e9.4.2025.09.03.03.08.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 03 Sep 2025 03:08:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 07/24] accel/hvf: Mention hvf_arch_init_vcpu() must run on
 vCPU thread
Date: Wed,  3 Sep 2025 12:06:43 +0200
Message-ID: <20250903100702.16726-8-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903100702.16726-1-philmd@linaro.org>
References: <20250903100702.16726-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

hvf_arch_init_vcpu(), along with hvf_put_guest_debug_registers()
and hvf_put_gdbstub_debug_registers(), calls hv_vcpu_set_sys_reg(),
which must run on a vCPU. Mention they also must.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/hvf_int.h | 3 ++-
 target/arm/hvf/hvf.c     | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
index 8fce627b08c..0c335facc3b 100644
--- a/include/system/hvf_int.h
+++ b/include/system/hvf_int.h
@@ -71,11 +71,12 @@ void assert_hvf_ok_impl(hv_return_t ret, const char *file, unsigned int line,
 const char *hvf_return_string(hv_return_t ret);
 int hvf_arch_init(void);
 hv_return_t hvf_arch_vm_create(MachineState *ms, uint32_t pa_range);
-int hvf_arch_init_vcpu(CPUState *cpu);
 void hvf_arch_vcpu_destroy(CPUState *cpu);
 hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
 void hvf_kick_vcpu_thread(CPUState *cpu);
 
+/* Must be called by the owning thread */
+int hvf_arch_init_vcpu(CPUState *cpu);
 /* Must be called by the owning thread */
 int hvf_arch_vcpu_exec(CPUState *);
 /* Must be called by the owning thread */
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 58934953c4a..d87a41bcc53 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2244,6 +2244,7 @@ void hvf_arch_remove_all_hw_breakpoints(void)
  * consists of all hardware breakpoints and watchpoints inserted so far while
  * debugging the guest.
  */
+/* Must be called by the owning thread */
 static void hvf_put_gdbstub_debug_registers(CPUState *cpu)
 {
     hv_return_t r = HV_SUCCESS;
@@ -2282,6 +2283,7 @@ static void hvf_put_gdbstub_debug_registers(CPUState *cpu)
  * Update the vCPU with the guest's view of debug registers. This view is kept
  * in the environment at all times.
  */
+/* Must be called by the owning thread */
 static void hvf_put_guest_debug_registers(CPUState *cpu)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
-- 
2.51.0


