Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp655980lfm;
        Sun, 16 May 2021 13:08:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTVJ9L2apVxBTM1XZL7i48Ea+LWOj3Tu3MY/O4m+RZ+FWMnOscojjYJv5aa8KCN4DthraK
X-Received: by 2002:a92:3307:: with SMTP id a7mr49306280ilf.113.1621195694817;
        Sun, 16 May 2021 13:08:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621195694; cv=none;
        d=google.com; s=arc-20160816;
        b=tC3Y8NGuNPrjJ3qJ1wSjAEeLIdl+kz1K+DRecvXgVsSuI7DOak6VKcQ+Z16sjasYbK
         tHh/H6XTYlYebFmaBcqQU0Q7zMYQouMKqyAgnT/j3DXrqwC41WG+Bp6o4M+2buZC2AaC
         RxqFXHA1mcGbAgVK25OjpYwrY5RMf++x1aaIclq1hg9vsAXYPn+9E3zNihH5CXyWAxLU
         /m58U0yOOqg5DUtK6K5U2FP/i8A2/JtwEIzSPjKsQp21RsePBtBSGVdovyJJizieytEy
         OHPZCldft7hHJlEXRNGQOEZ46qWosmtEr4pUvceaxc0gee1k7USvdR61JutgUgjiPkaZ
         aa4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Vk72YMjJSMfQ5pH+xRboFYD4nQT0zFZyuYFtz1RRH7Q=;
        b=i/hQ4y/ygr7+fqkvavw3wT0CAHgfQgMRWhJHprYwSXHmkYFJzq3zpzsvSnKlOwO+0Y
         CzrusYl9VeIy5Pp9iIOPlcTsODJlymiNodzBvnhZolPBm2SIvoB4TIyqvXPNT1eKRe4z
         09tqoPrF17ZbFrNhQRu5lKyqMyrm78BkGKGtIfWX6DKvxjqotaBYNy37a1txcDWnU+NI
         z2o/UtXtO1olbJEnaHlKCJw0CMHfEvLv0+QthYzC2hBUy1eUomV89pj7d1nJ8HTWcQsD
         8rpZ30ZruLGL0Ix3ooJntNluIyZTnQJqfAmW4v573zDXJLJ/RjJAgVZwAETwVtG2+3VX
         1KKg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18si5926168jam.69.2021.05.16.13.08.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 13:08:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liN3e-00061z-0y
	for alex.bennee@linaro.org; Sun, 16 May 2021 16:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1liMvM-0003le-VO; Sun, 16 May 2021 15:59:40 -0400
Received: from mail.csgraf.de ([85.25.223.15]:45496 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1liMvC-0008M5-4g; Sun, 16 May 2021 15:59:40 -0400
Received: from localhost.localdomain
 (dynamic-095-118-089-019.95.118.pool.telefonica.de [95.118.89.19])
 by csgraf.de (Postfix) with ESMTPSA id 7A5D460806A2;
 Sun, 16 May 2021 21:59:08 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v7 19/19] hvf: arm: Handle Windows 10 SMC call
Date: Sun, 16 May 2021 21:58:55 +0200
Message-Id: <20210516195855.28869-20-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210516195855.28869-1-agraf@csgraf.de>
References: <20210516195855.28869-1-agraf@csgraf.de>
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
X-TUID: KaUFkRhlX1gq

Windows 10 calls an SMCCC call via SMC unconditionally on boot. It lives
in the trusted application call number space, but its purpose is unknown.

In our current SMC implementation, we inject a UDEF for unknown SMC calls,
including this one. However, Windows breaks on boot when we do this. Instead,
let's return an error code.

With this patch applied I can successfully boot the current Windows 10
Insider Preview in HVF.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 target/arm/hvf/hvf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index acf8fd4060..12dd5bbb0c 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -928,6 +928,10 @@ int hvf_vcpu_exec(CPUState *cpu)
         cpu_synchronize_state(cpu);
         if (!hvf_handle_psci_call(cpu)) {
             advance_pc = true;
+        } else if (env->xregs[0] == QEMU_SMCCC_TC_WINDOWS10_BOOT) {
+            /* This special SMC is called by Windows 10 on boot. Return error. */
+            env->xregs[0] = -1;
+            advance_pc = true;
         } else {
             trace_hvf_unknown_smc(env->xregs[0]);
             hvf_raise_exception(env, EXCP_UDEF, syn_uncategorized());
-- 
2.30.1 (Apple Git-130)

