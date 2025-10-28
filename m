Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F64CCCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 06:02:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDcmO-0002B9-9A; Tue, 28 Oct 2025 02:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcmM-00027t-It
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:01:58 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDcmK-0005dd-2Z
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 02:01:58 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47114a40161so62401985e9.3
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 23:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761631314; x=1762236114; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g7MgKZFYNv4e6Tb/k+QoGSCvRTnlJxwa/GyB/qCuFpQ=;
 b=KV1EYiJp1g9f/6YPKnBAy7C4Fkts5Lqt8lrD+nR3SQoYcbWkFYO8QvYxGLbDq2aZJF
 vq+XQmZ4VJTZr88aK6TYv+fwqssFiMy2NHL7PGMTFN8HRkuRC2TCSGa7cuChkY8bQFY/
 E+nX/vlHPqVEDMdtGKK4rMrtm/UFkXTpQeAA3KLqFCzd79IRjUHou2s9JvK5EQ5NY1QM
 JCXPBn8zkqlBHV4TJPtquqTTUBPt+ndWtIxfxI13X1muY/YPkthyDtUtjMcZnwPJC0z7
 wEyXOuLxTs+TPpBP273hWUa5MleVT5B5ydREER+ie6C2fyp2BxAdIM3WKWJhU3ZxTN0I
 Px5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761631314; x=1762236114;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g7MgKZFYNv4e6Tb/k+QoGSCvRTnlJxwa/GyB/qCuFpQ=;
 b=tRKarvA7Lr81hjY2wm4+csZh8xO0dDplXxdaqYRxUuwwzJvY7VTg5QSMqdUspOCxNj
 1mIhuaHeCoVFE02FYeRxo6x3M1P5zn6ZGI+Bjxaq1cG5Aav8kpa0x8/uufnoNCEarHTr
 KptgyI3jpF7MQ1F3cwWGlK/L/sjgKVY8ZYdO6+PgEPg6cpZdMLD5boocVhB9vB0svmCl
 tumBBbH2V88rRpP6Y0/PySrZLubtZGIqpdMp3nmb2u+HOY8UfvnM+K1q3b+wnypJYa/4
 KL8VFqLCJzF19aRxS/vkzeFsxD2fGpynICAM5FSG9eYE5i8Rn2K5BrPYNJDOKtNFnlWc
 vUNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAr2enRoWgwxZs0LWE52bICOV+IqtQrmrzofhYhHTlSeaNIUemMyjmjGfAzHVGApQSQNHe1IZEkw==@nongnu.org
X-Gm-Message-State: AOJu0Yzc364edFsXkHo9vfQ67D/BZHt9YiA5I1p48oExRCmwpWl48lGo
 AlVwRmUXM5sQ7X4Uj8eTMl1bWuXXrg+z6Rm8w7EXdGcGhOwAYAQFGKUsVaD8pBkEgU0=
X-Gm-Gg: ASbGncuCgAecZaYYbTQ2Be8B8BS+MfOzb6XtU79szXDX5x6+GOu+g4QP/MwvLvWR85o
 Rne4osxq5TrXbETYpp2Yi5tMlAXqw7eGHPWntspjlNhXNbuuBoJYot+Oz+qUuV4ubKbQ9XBr2K3
 D605j73zCm3ZH+5w+rAk4OuOnMlbvDzyaIuY741TcrMM7pAATjRp2PGjQZhCD9WDSpqRZ9vWZbu
 H/UeN4S6jQz1gsgQ0QdMt8XmRW3kDSMIHf1ZQZ8vKbGTg6/vWwaGtecnecM7RaRQV/h+HmXre0S
 Gj4jlbRkeFVjjK61VGyjboQ8W25IBjanDdBJdY1hAiZqCD8aIHs7V4pxsCKxh1C2nWqtkj8G4MJ
 4wyUv5kUXs5iqo7w/XySyA7naXzRk+wNqPrGV9Ir/loO12DU0BZw91UBfteIqqUUZLzQ1TEKw+9
 NRaX4F+m46+ByBXnuBsGQojvTUsIJCfcfwddjoyzoR31MSvNJemrHTz30=
X-Google-Smtp-Source: AGHT+IFgn08EvjBhheTuphmBUBpmrDoN47Vrk7ZdoVRxwDSRdNnxJ2r5Qt+0rxuKwcfzFW45IKleQw==
X-Received: by 2002:a05:600c:3d98:b0:471:131f:85b7 with SMTP id
 5b1f17b1804b1-47717dfc5ebmr15621175e9.15.1761631314171; 
 Mon, 27 Oct 2025 23:01:54 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd4cc596sm179237715e9.15.2025.10.27.23.01.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 23:01:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 27/59] target/arm: Re-use arm_is_psci_call() in HVF
Date: Tue, 28 Oct 2025 06:42:03 +0100
Message-ID: <20251028054238.14949-28-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028054238.14949-1-philmd@linaro.org>
References: <20251028054238.14949-1-philmd@linaro.org>
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

Re-use arm_is_psci_call() instead of open-coding it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 26bafee259e..a3bb71e63b9 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1934,7 +1934,7 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
         break;
     case EC_AA64_HVC:
         cpu_synchronize_state(cpu);
-        if (arm_cpu->psci_conduit == QEMU_PSCI_CONDUIT_HVC) {
+        if (arm_is_psci_call(arm_cpu, EXCP_HVC)) {
             if (!hvf_handle_psci_call(cpu)) {
                 trace_hvf_unknown_hvc(env->pc, env->xregs[0]);
                 /* SMCCC 1.3 section 5.2 says every unknown SMCCC call returns -1 */
@@ -1947,7 +1947,7 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
         break;
     case EC_AA64_SMC:
         cpu_synchronize_state(cpu);
-        if (arm_cpu->psci_conduit == QEMU_PSCI_CONDUIT_SMC) {
+        if (arm_is_psci_call(arm_cpu, EXCP_SMC)) {
             advance_pc = true;
 
             if (!hvf_handle_psci_call(cpu)) {
-- 
2.51.0


