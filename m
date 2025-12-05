Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5F9D32D9C
	for <qemu-arm@archiver.kernel.org>; Fri,  5 Dec 2025 15:11:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vRXSt-0003h5-13; Fri, 05 Dec 2025 10:11:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vRXSr-0003dG-7H
 for qemu-arm@nongnu.org; Fri, 05 Dec 2025 10:11:21 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vRXSo-0001Ro-UA
 for qemu-arm@nongnu.org; Fri, 05 Dec 2025 10:11:20 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so19008115e9.3
 for <qemu-arm@nongnu.org>; Fri, 05 Dec 2025 07:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764947477; x=1765552277; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cfX9YOm1De6R6T1aFALHx1afL1WHdp07Fe4YIeRNplQ=;
 b=A4vutgGFNBoI4H1iPbsz5WO2tylDiEFGK2Wu/WHHxphfoH8PnTbHnS6NZcAB/n+2tJ
 fDcg7lzZguIDoPIHTSPu3+MuJXELz63RaakhEqeCEFTDRWwRThC/cjBu0aPmCLPqT4Ps
 yFanhFcMs8r0t8lK1cQeGbcVrNMwwFQ5//eQOhp/ak7mT0EaxMRAqeldPjfDfQWAhV8d
 s+s9U4CWqh312bvUHcpW8ugYP3+5SLLVGCpyU6X02PzFcvOPNc4OKIbqZE7DpXQ7aKmA
 Zb6hLEJUZ8SNQigviXaBn1CNFb73iberUfs48phAXmEyOqi5q+RVwSwXft2cZ2DKtvpL
 ychQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764947477; x=1765552277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cfX9YOm1De6R6T1aFALHx1afL1WHdp07Fe4YIeRNplQ=;
 b=M+Afq+HvW9aOuBliuJQMF+XIIvBPhg0OU24Z3XcmoVMxQYXgf9MlHFGTbHyMy8FilK
 1sCvd9BRIPF05OKyCUqOcLL1hpjhHEzezMV1Bi4Tnu1F9xKdiDcGSWl3kEe3YVhzh47G
 oYt0yV8hqh6NAOGAacazlqkwYG+pdNhZzeMWlRO7SJpjKt5mavygVQhNSj1DLJaXSY0i
 N1fMhCvTQ3fI2PEO47T5KEf2PwgssQcsUIMgT80JYr7GNjygWJzGJ7eJyH4lbfWLtjHM
 BWJ+hO/wBJiL4ksIrugzptq3BxeNt/fyuYecNKWGiwvcw4ZZAP2TN4CYeIBgJ8Fcake3
 XavQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTI+ZA4rMfU08YosIoFRtiTZ+ghp22tmsdvNnwt0if024w3hxBksVVnCItFQKhibDDYUlZB7AlPQ==@nongnu.org
X-Gm-Message-State: AOJu0YxirWFtoFYMV/IA/1aAwRdruR0WQTPVLfRkF2K/KqsAyXEK79qq
 lY5LOu6XbgTTWVgKEeeIxD7yu8S2ugdd8sPEToX7sN6yunhE/WQ0jjgpM46g2ykoXnI=
X-Gm-Gg: ASbGncsRe5/Z5xzRw1LajQsfZGgxcJP36LqJVAMeaqQU2lbRw6RHUlLOypnr6+vtp5L
 NJQ2vkcxCkp3+ZtBo9gadfy4fVBVqEMRBLArmLs6Yh6zZdq3Shi1OgwP9Rx1XbrHd1A4IuxdH0w
 EOPjQ62TtxJC5WIFTVSvz8FtzFAxumOC33qShpNN3dCJxu9Cc+x/jeAPmJN31uAJqSdBf1o75ww
 HTtJOCZSymuLGpSAZBZfgh+VGZTA+ja7fFjYQv7jEOBFwAlk3mCxYIH5FGUgy6grfPnysnRTMLl
 Z0FHBGtCw8iFjLAt/vgC66T1CF2FlAPapx0xyZEMCFw7JPVw53O5TBl4q9soInQFCG1Ngss7wsA
 wKaIAslpAvJ0uJXGxubTcLp1aC9EJxWYk3dxSF0ssJdD8g6BLvUzeTCk6jgNW7tAXBT/j40mGIG
 FbbnRT25FWJNk=
X-Google-Smtp-Source: AGHT+IHfd1Higw70dl2d7141IVGsKJB45YCokbQ8pRdJgFqGLyT05yhnROoJMBoyrwV87/072IaQTw==
X-Received: by 2002:a05:600c:1390:b0:477:a3f9:fda5 with SMTP id
 5b1f17b1804b1-4792aef1a50mr92069565e9.9.1764947477413; 
 Fri, 05 Dec 2025 07:11:17 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479311e712fsm91377305e9.9.2025.12.05.07.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 07:11:16 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8A9D55F839;
 Fri, 05 Dec 2025 15:11:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 2/2] target/arm: ensure PSCI register updates are flushed
Date: Fri,  5 Dec 2025 15:11:15 +0000
Message-ID: <20251205151115.2035930-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251205151115.2035930-1-alex.bennee@linaro.org>
References: <20251205151115.2035930-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

When we handle a host call we report state back to the caller via
registers. Set vcpu_dirty to indicate QEMU is currently the reference
and hoist the flush_cpu_state() and make the call unconditional.

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/3228
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/hvf/hvf.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 70d34063df8..8e2940217a6 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1942,6 +1942,7 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
                 /* SMCCC 1.3 section 5.2 says every unknown SMCCC call returns -1 */
                 env->xregs[0] = -1;
             }
+            cpu->vcpu_dirty = true;
         } else {
             trace_hvf_unknown_hvc(env->pc, env->xregs[0]);
             hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized(), 1);
@@ -1958,6 +1959,7 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
                 /* SMCCC 1.3 section 5.2 says every unknown SMCCC call returns -1 */
                 env->xregs[0] = -1;
             }
+            cpu->vcpu_dirty = true;
         } else {
             trace_hvf_unknown_smc(env->xregs[0]);
             hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized(), 1);
@@ -1980,10 +1982,12 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
         error_report("0x%llx: unhandled exception ec=0x%x", env->pc, ec);
     }
 
+    /* flush any changed cpu state back to HVF */
+    flush_cpu_state(cpu);
+
     if (advance_pc) {
         uint64_t pc;
 
-        flush_cpu_state(cpu);
 
         r = hv_vcpu_get_reg(cpu->accel->fd, HV_REG_PC, &pc);
         assert_hvf_ok(r);
-- 
2.47.3


