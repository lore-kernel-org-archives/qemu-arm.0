Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338FD606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 16:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SGpiuFzp
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMSkt-0005hp-ET; Thu, 29 Oct 2026 12:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xMSko-0005de-5f
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:13:26 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xMSkh-0000XB-I4
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:13:25 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4a2069b9710so22376705e9.2
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 09:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793290394; x=1793895194; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=MJ7Wz+EKAXUGUT3km1oRTqHbztlVcuFrq58v6QALOTs=;
 b=SGpiuFzpBp4pljHytTRH3UXKFutbi8rMeTLLDxxjHyiIN71WwY1Axo6Yms8cPZ2NIL
 k8/jPqcqig7CVaOu+XaZOt98L/ZeCmqUfmu4GiAFGLIhA2Y96noxsY+LvBHJFHfrZqPD
 aOWThTyIlTcu4uRzNbBljZ6pba02itD2QJ/5079YWEGA07mja7d7BVZY44DM9ShGxE9m
 zymwjjFIaSoYhWP45RPKAoSXOUFLnkkI5GnIFe+0ZGAltrBHaIVZPxirh+QdGuwDT+Xo
 5bUkl+4Enx3R2tP1LKaB1XXnzcIHes6Z0X3BY9U9dJpR0P7nmJuWfhQju7AuL2kP/xte
 4psg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793290394; x=1793895194;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MJ7Wz+EKAXUGUT3km1oRTqHbztlVcuFrq58v6QALOTs=;
 b=M1r3Bsz/JrKJ/u69DHTZv846VeYNuqbUCMj4EGUU2UbhEAzBAewX6IGJNJ7QB19PNL
 1wu6gqI1l2iUuLxRPuawC77J21ZFY/8Ezq1C1FlP87TPqihye0lFcOuyuiL7osXiNyxb
 e187mwwAgmbNhItW2hx/wmLwIo/D/BCBfOss88iLXAeMkyvqYDzSKrmWFdGgYXa6k0NX
 32TIoJyP/dUSlJahDZsS4hhepPAtrXam6tTgLsmYQwKbWE0sXgUj9ZKeIaMIws1sTAcO
 f9A5pANdTMeatItZJsn5SNyfcQOGMjmMM9H1e7aC50sDMAL1Q6AZeXmIHI6cqqLVT6hF
 +IXw==
X-Forwarded-Encrypted: i=1;
 AKwUvBynaY9z1WE3+OMgHabd4aFCmomnIEY6aR8U27cvs8IjdTr8EdNkWrnq5YSTuABcKclnTWWYRDfYPA==@nongnu.org
X-Gm-Message-State: AFq9FYIWP9M74Q3JHY+CsRmKQaoZmvB3E1sUAkGPyIIzNG5AICYYPv0L
 cCdty1Wx7j1FyRc5sagGH3wB7M0xoKPpv8Pxry5AK5DYFrIgkeqNA8E4+rmtBHx9EGw=
X-Gm-Gg: AYBFou0ne9xG0fyAKTG91fOHMLDjqeymzB3+cKTbe8MEBpH6l8neUiK+VFKAW0nn5QA
 McboM2bgAiCvbBVy2fmbs0nJckS3oEi046T1BF4g/7MF4nxnc9qxdsJGX4ma/pqgY9V1FqJg9UP
 VlPO/GZvgcNX1HU00aeqm4zPZwA59yBaWQeHw6CcAT9X59JX673JTHOORM42DxwMxYVZvyijD52
 6Kah7S0dOCWE/TPpjLXF1/52XhQy62iGa6gXs9kvOcEdftBR4z7DUS+NP06+dgOROboVtwsZmxx
 HZzVAWMn/TBLil12a7llhWMYEMzqiamDON3XgfI/5+xeV7liqGSBtRuiyO0rnpPiMcB/0iF3iTO
 zZokGBl+aiQG+hYklCw0YfZLTAI04kFvu1Tg1AD3PV1GltbZPNdwkzN5j2nMS3Bh5HsmmIDNcS5
 Q0XFggcQqQCvWeOkRufME3LTkt5xMM27njNWjbN5aAJD9wsAu8AQ2UPSIFu/UCn0LIKBJX9Qbvj
 HEAuJsAwDxkQrj4mSVuQEiAlfOoER392Of2xQQW6PxEF57fnfOg1+1bQExKsWOlq4DEsjK7rhSb
 XQpPAhQqpahacCClfIpK7sor6wYh
X-Received: by 2002:a05:600c:4e01:b0:4a2:190f:cf6a with SMTP id
 5b1f17b1804b1-4a967ca03demr142402165e9.35.1793290393785; 
 Thu, 29 Oct 2026 09:13:13 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa7c1302f6sm82624515e9.0.2026.10.29.09.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 09:13:12 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 66C3C5F91F;
 Thu, 29 Oct 2026 16:13:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Chao Liu <chao.liu@processmission.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Hao Wu <wuhaotsh@google.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-stable@nongnu.org
Subject: [PATCH 3/8] target/arm: hold bql when SEV sets the event_register
Date: Thu, 29 Oct 2026 16:13:05 +0000
Message-ID: <20261029161310.2065290-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029161310.2065290-1-alex.bennee@linaro.org>
References: <20261029161310.2065290-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

There is a race in qemu_process_cpu_events and sleeping on halt_cond
where we can miss the setting of the event_register which would cause
arm_cpu_has_work to report we shouldn't sleep. As by definition the
bql has to be held when we go to sleep against halt_cond guard the
kicking of the cpus by the SEV helper with the BQL to ensure things
are properly serialised.

The other places that set event_register are fine as they are either
in the same vCPU context or are already serialised by the BQL.

Also use qemu_cond_wait_bql like the other halt_cond users.

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4660
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4670
Cc: qemu-stable@nongnu.org
Fixes: d238858bff60 ("target/arm: Implement WFE, SEV and SEVONPEND for Cortex-M")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - drop pointless cs assignment.
---
 system/cpus.c              | 2 +-
 target/arm/tcg/op_helper.c | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/system/cpus.c b/system/cpus.c
index e11a5aab6a6..985732217fb 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -412,7 +412,7 @@ void qemu_process_cpu_events(CPUState *cpu)
             slept = true;
             qemu_plugin_vcpu_idle_cb(cpu);
         }
-        qemu_cond_wait(cpu->halt_cond, &bql);
+        qemu_cond_wait_bql(cpu->halt_cond);
     }
     if (slept) {
         qemu_plugin_vcpu_resume_cb(cpu);
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index 6a673e5ae6e..5788a094123 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -470,7 +470,10 @@ void HELPER(wfit)(CPUARMState *env, uint32_t rd)
 
 void HELPER(sev)(CPUARMState *env)
 {
-    CPUState *cs = env_cpu(env);
+    CPUState *cs;
+
+    BQL_LOCK_GUARD();
+
     CPU_FOREACH(cs) {
         ARMCPU *target_cpu = ARM_CPU(cs);
         target_cpu->env.event_register = true;
-- 
2.47.3


