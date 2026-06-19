Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0961CCD98F2
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 13:07:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waYuq-0003y0-9r; Fri, 19 Jun 2026 09:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1waYuo-0003wB-Ol
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:05:46 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1waYuk-0003PN-Bq
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:05:46 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-45ef779c1c2so1621305f8f.1
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 06:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781874341; x=1782479141; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Il5WY7QfACzZ93YAvZWGe3XWn3xPIGhu97enE1XxJnA=;
 b=ZLIbRfbg3aaP2+iuGlC8wsCnw7rQRyaXotxuWfrlcXrVLZIv/rxiACn7kQIIlbQzFD
 RjT4JdVJPXJQqV9CbNmYSpRHEBal7DwmAozLQh3udn/RQPfPSnXwY1sZYmaaaAXBB41Y
 tGoSRGTVDHSzg3zvfC6RhgERuAHa46Ogvn7wSIwGXRNgDhzYRa9Zz+Y5zHvfbNtJ6phB
 UomThOgnJzpRhJPatLBBZx0Rj4LY45m6OLCaJNnaZDMwXcswBI8EGbMDxxpPJqS7eCMO
 r/llr+eKdgoSpTJBNquqTdCVR3xmHqA+H1O10zQcNaMS/wOaDvOwvyNNoYIdSRg9ILsL
 adRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781874341; x=1782479141;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Il5WY7QfACzZ93YAvZWGe3XWn3xPIGhu97enE1XxJnA=;
 b=mwY8bHb/Sg/UuraheLtfgLie7W/ULt+5Yj6bQQl7UVCoUviowXn20PRh2Mme9HTVPo
 NyfiPr+ryk4iyM9MT61zw85w8IWnJ+YHSao7XR4kxdK97+vt8kOPZqF49gycKAjw0kmh
 Mqix2HSAEqhtyTHFKbQHftBPyCv1TmlexX53KItIcz/72fdebL4rdTERhaO6UFvBEPrB
 da+RJ50khOAe2FSg7RitTAnRvTAgZkqoXCsXA908LgpiZFRHExP9hSQAwI793itHGhfW
 Ws9ASQ3s4efa6pb8c2j7Q8UCzpxLGfpYe564G4vC6p80E5IK6/ZZGgy2PHGNsDPScNcz
 /DXA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/m/fEyX2wBrcIfjmaO2WtjBAPmpCpOunsUurSqERQ1ZNGhYGjVSBsSACLUmeloyIWiIbaXDDyXSQ==@nongnu.org
X-Gm-Message-State: AOJu0YzYdNCjklbmvrMNEiEIvGqpvmfL4xn9+M2DgSlRvW7l9iyffcx2
 dCeSqO19irfVFkaShKp9o4BaleHJqpCh3kGz/9X6tVoyPBHbzYL073+3SlXB8gcB8pc=
X-Gm-Gg: AfdE7ck+87Ri7J1S7W6KU9JPAnqKRFcswIUzC7Duso6by7vY7EjARqUCEkQaZFbouib
 kI4MuG/2CjWtTYWEqBvrXlDZfwrXHR0nKACgabsZxDBhrHqaSiZJsUg8L1YRqp40NCrrBrDkPlD
 hu3XLHvrPq2uDUcAk6dr0eD07Ch6ALqqWW0rzdSl55dKSb6EFuZ0c0KgJEnd3jshHJWSDHYP5gv
 VrHharfdifK7ObFG3AtbXo2sl5hcRJlvl+b1/s87rAYRgXKtuhhsNJqUHWQN/vlgAOtlJBVU652
 Pu9UKEkQ9HukqWfkrRk5ExKwxfbdfRpc9duTZvX9PSFKY1aXHgt3Ed30fa7k6ZrFOzadMwFA60V
 E+KLddVGsdtK+c0GOY7j5qjG9wAcAp7Mf3ZmDDUDxAyluJWmD9NZFoP1+o6ujTYkWgkM5ftVwEk
 GSqA8C6yAI38XR
X-Received: by 2002:a05:600d:4448:20b0:490:da12:f1fa with SMTP id
 5b1f17b1804b1-49240ea7f99mr46236105e9.31.1781874340737; 
 Fri, 19 Jun 2026 06:05:40 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49240efc160sm54997235e9.2.2026.06.19.06.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 06:05:38 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8B58F5F946;
 Fri, 19 Jun 2026 14:05:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
 Troy Lee <leetroy@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Kane Chen <kane_chen@aspeedtech.com>, Tyrone Ting <kfting@nuvoton.com>,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Hao Wu <wuhaotsh@google.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v8 3/7] target/arm: do not clear halting reason in has_work
 helper
Date: Fri, 19 Jun 2026 14:05:32 +0100
Message-ID: <20260619130537.820184-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619130537.820184-1-alex.bennee@linaro.org>
References: <20260619130537.820184-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

The helper will be called multiple times as we exit a loop and until
we actually restart (via arm_cpu_exec_halt) we should leave the
condition the same.

Fixes: 6fd2fcdc61b (target/arm: teach arm_cpu_has_work about halting reasons)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/core/sysemu-cpu-ops.h | 3 +++
 target/arm/cpu.c                 | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index 8be6a84bd54..9a45596169a 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -18,6 +18,9 @@
 typedef struct SysemuCPUOps {
     /**
      * @has_work: Callback for checking if there is work to do.
+     *
+     * This function should be idempotent (i.e. not change state) as
+     * it will likely be queried multiple times before a CPU resumes.
      */
     bool (*has_work)(CPUState *cpu); /* MANDATORY NON-NULL */
     /**
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 86aae36ae55..597e0626e7f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -158,7 +158,6 @@ static bool arm_cpu_has_work(CPUState *cs)
      * A wake-up event should only wake us if we are halted on a WFE
      */
     if (cpu->env.halt_reason == HALT_WFE && cpu->env.event_register) {
-        cpu->env.halt_reason = NOT_HALTED;
         return true;
     }
 
@@ -170,7 +169,6 @@ static bool arm_cpu_has_work(CPUState *cs)
                            | CPU_INTERRUPT_NMI | CPU_INTERRUPT_VINMI | CPU_INTERRUPT_VFNMI
                            | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ | CPU_INTERRUPT_VSERR
                            | CPU_INTERRUPT_EXITTB)) {
-        cpu->env.halt_reason = NOT_HALTED;
         return true;
     }
 
@@ -878,6 +876,8 @@ bool arm_cpu_exec_halt(CPUState *cs)
         if (cpu->wfxt_timer) {
             timer_del(cpu->wfxt_timer);
         }
+        /* clear the halt reason */
+        cpu->env.halt_reason = NOT_HALTED;
     }
     return leave_halt;
 }
-- 
2.47.3


