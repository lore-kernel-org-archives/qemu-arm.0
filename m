Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1831817lfm;
        Wed, 19 May 2021 13:29:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxwWRaRIrhbFw57UQd15SUeaOBCQZ1qIpuptGXDFZWfDIcSOH2Sh7zUVjQpkiuxlkzrLLS
X-Received: by 2002:a5d:8b85:: with SMTP id p5mr1394888iol.43.1621456198935;
        Wed, 19 May 2021 13:29:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621456198; cv=none;
        d=google.com; s=arc-20160816;
        b=vz1KyEoDQtrmI9x3UG4RLwWozGprByDxaAu7hOKziC2uu8ZF7iIj3Alg/7WHanA114
         XN61S9n87zpmQVUFJBLgtRQ4jS4/qxi4u/F7+hXWvb9wMkD9CwAgOnXnZzgomCGN7IcJ
         SLwyWrXI6qq97A/tjEjF7993Pl9UBOrRGZM5JLNue2B8DiWoLZDFePtQdjucS8MHYRTv
         eJmZGnJGKhg3tsUpC0VFB4YVoUweIowSpbfNUipcqwIRG86LvkNBOg3SO1aQ3RPhuBY4
         HXDCC1n8HYHuWj7ZGYGcdl4EDLxtd85ZFMPOwQqJdimuwSn88ePkfWb8J1M1bfAPcZwx
         yV8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=eJHbMncV9Fx/okjpjzyCodxs+/48RxPjJJ7LsVQbyVg=;
        b=ijbWB0aVqzk8W9U75Wnh3MtphMmspg/spLJrwWqDYnsxZY8dVIpdfAST+mZw1y3b4X
         vEaHht2mTBUx9gNdeXJWPJVhBeqzglNYKLmTv5/7V7wfX/P8CjP4xE5uNt59OyGSoz38
         KymfCapJXAX++2JMcnakdOZKaEjf3AiBjP58BNBWew53PFFa4fXlVRQxq4SPbf/5P3vk
         Vo5GzT6G0Yz02Q+rdn0cwHziOM9N4LYpHrTdMS9U1TMAFi9A0etijcyUkXa+/+kYJPxw
         yrCvWRNynZEiHSBB74veEuTQCXO2i1BjHiD1HvVmntWhcj5DJ0r1pRBFZes+Q750RC1i
         nlew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d1si810579ilg.93.2021.05.19.13.29.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 May 2021 13:29:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljSpK-0003YN-8v
	for alex.bennee@linaro.org; Wed, 19 May 2021 16:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1ljSjR-0005ZX-H2; Wed, 19 May 2021 16:23:54 -0400
Received: from mail.csgraf.de ([85.25.223.15]:48278 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1ljSjO-0003JN-BC; Wed, 19 May 2021 16:23:53 -0400
Received: from localhost.localdomain
 (dynamic-095-114-039-201.95.114.pool.telefonica.de [95.114.39.201])
 by csgraf.de (Postfix) with ESMTPSA id 4554260807AF;
 Wed, 19 May 2021 22:23:07 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v8 19/19] hvf: arm: Handle Windows 10 SMC call
Date: Wed, 19 May 2021 22:22:53 +0200
Message-Id: <20210519202253.76782-20-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210519202253.76782-1-agraf@csgraf.de>
References: <20210519202253.76782-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GWC9oaZOL/nd

Windows 10 calls an SMCCC call via SMC unconditionally on boot. It lives
in the trusted application call number space, but its purpose is unknown.

In our current SMC implementation, we inject a UDEF for unknown SMC calls,
including this one. However, Windows breaks on boot when we do this. Instead,
let's return an error code.

With this patch applied I can successfully boot the current Windows 10
Insider Preview in HVF.

Signed-off-by: Alexander Graf <agraf@csgraf.de>

---

v7 -> v8:

  - fix checkpatch
---
 target/arm/hvf/hvf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 65c33e2a14..be670af578 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -931,6 +931,10 @@ int hvf_vcpu_exec(CPUState *cpu)
         cpu_synchronize_state(cpu);
         if (!hvf_handle_psci_call(cpu)) {
             advance_pc = true;
+        } else if (env->xregs[0] == QEMU_SMCCC_TC_WINDOWS10_BOOT) {
+            /* This special SMC is called by Windows 10 on boot. Return error */
+            env->xregs[0] = -1;
+            advance_pc = true;
         } else {
             trace_hvf_unknown_smc(env->xregs[0]);
             hvf_raise_exception(env, EXCP_UDEF, syn_uncategorized());
-- 
2.30.1 (Apple Git-130)

