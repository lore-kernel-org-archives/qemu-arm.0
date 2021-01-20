Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp395855lfq;
        Wed, 20 Jan 2021 14:46:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDMnmodNYH4HCzflVm1KbcDCXyIVeUBZA07x1cJ5bCEyPivMyRw26fy6b00nxwYDytRq7R
X-Received: by 2002:a25:b320:: with SMTP id l32mr17243397ybj.104.1611182790868;
        Wed, 20 Jan 2021 14:46:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611182790; cv=none;
        d=google.com; s=arc-20160816;
        b=LQbkObkpmucNlW8G50VN9dyTa649NgJUqG64ynf8rbQdH8eaCxFBjen8lUeXVkiFmk
         F/VtZzTk4b5q6UlZQFxsyXkfKnf/WZBDeF1jsjAB1DqF+YgXNecKgIpKb+iey43eGerT
         X5ErlnXopzsBjc4cDJrkrODiokzv+N5d70QsKagoVygNWbSDY53WXgLIB6+h9nn8pH5l
         hDIaHzxBGsAcFJ7PyWuX4lyOOL7nu3IYOSSuGHg/U9O1Ld+GgwxB2/PMm667tR0ERbwD
         /T6fWcRnO1WRb1OrYW/YOOFyVb/yYtXPWnFB5JNU2Ji6H1qicIrcMmwL5XeMBmyQXedF
         hxKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=U6OxyV31Y7N/U6vjije2FQQAvDTcIMdHbp1hlaGhoC4=;
        b=YYtuNfpD1T8wjvGIw8rv9hng0nYV9bKKxqUnVwbdK7FY3Eqnw+Tyq2rlzQDFyg0cT9
         dB9Yo1PJzRQ8L/Qm4pRPYzXn1Hz/4jgI2onkhj4n+GWeZQRlw0K7qjeeOM7uvz4LGS9A
         Jfv9ubixkPpRTB0Ct5HTx9o57RkERVqtWJ49sRdnd7Q2Vka5mfANotZAYuVnRbwi6f3n
         vgqTaxs/NtFnZ9PQ4gBtT82V80NL9d4wQW0Drn1Gy7M/2S8HwpI5pgY5W/Ko/qwmIg+J
         5eKC5SZEQXKtnAVxBLD1iyiJAa9YaRCwlv/aniW9FiH/OJ9Oo1lZ203OLcfyLTbe1Zap
         jdmg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10si2964698ybe.181.2021.01.20.14.46.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Jan 2021 14:46:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2MFC-0004R1-5a
	for alex.bennee@linaro.org; Wed, 20 Jan 2021 17:46:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1l2MDh-0003tE-EI; Wed, 20 Jan 2021 17:44:57 -0500
Received: from mail.csgraf.de ([188.138.100.120]:45198
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1l2MDd-0001V4-MZ; Wed, 20 Jan 2021 17:44:57 -0500
Received: from localhost.localdomain
 (dynamic-077-002-091-253.77.2.pool.telefonica.de [77.2.91.253])
 by csgraf.de (Postfix) with ESMTPSA id 2F5863900559;
 Wed, 20 Jan 2021 23:44:49 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 05/11] arm: Set PSCI to 0.2 for HVF
Date: Wed, 20 Jan 2021 23:44:38 +0100
Message-Id: <20210120224444.71840-6-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210120224444.71840-1-agraf@csgraf.de>
References: <20210120224444.71840-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vA6kyfyhiYNJ

In Hypervisor.framework, we just pass PSCI calls straight on to the QEMU emulation
of it. That means, if TCG is compatible with PSCI 0.2, so are we. Let's transpose
that fact in code too.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>

---

v3 -> v4:

  - Combine both if statements
---
 target/arm/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 40142ac141..f1929b5eba 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1063,8 +1063,8 @@ static void arm_cpu_initfn(Object *obj)
     cpu->psci_version = 1; /* By default assume PSCI v0.1 */
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_NONE;
 
-    if (tcg_enabled()) {
-        cpu->psci_version = 2; /* TCG implements PSCI 0.2 */
+    if (tcg_enabled() || hvf_enabled()) {
+        cpu->psci_version = 2; /* TCG and HVF implement PSCI 0.2 */
     }
 }
 
-- 
2.24.3 (Apple Git-128)

