Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp115893lfb;
        Thu, 3 Dec 2020 15:49:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlw2GgYb23WEp2b1Gy539FIkxpSWDTRF8Wck8CglOt4AEDRvUKFGEWcdFJ5RbnMw9ObRwc
X-Received: by 2002:a25:4c43:: with SMTP id z64mr2450605yba.17.1607039381436;
        Thu, 03 Dec 2020 15:49:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607039381; cv=none;
        d=google.com; s=arc-20160816;
        b=YJQkwaAfXOKdxxBQJTFZSEhucyVnShJvt5tvAsYYYSJvAbtf251rMc4Kdme0IO0QfW
         kBTq+BxrRsa1/ZZgysgMaAxK++fOg4AF2tZgwZf4C+X91LeS/nQVaNSLUIOsoVysm9zj
         x0vV45EAE6KHy0ysOgYX+Cf4Iom/fuoGal1fVuk/KzgsJyx8B+eNyYsH+g5ZFRPlii59
         dDgqUfCguV8k9jGICHl2mB1f89STa97MuQOuEg7hXxhmV9yclIM/KDCSt949WW6jLrOj
         H4s8yjfSxAMsOnrDWG8mSfV7aLdLq/bsb8JiW3z7pKfHjRFcJQDgiEx6kjTDKLEEM+8H
         1zog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=o0CJQyHs+CNrDXNI8Fvb+MElh1I2XTMoFZiW9czI3LQ=;
        b=roIFs1cBVF9haR5XwXqxSeFS4s9znyKXJqLsYtVB87Z6hNmQDVKEg/poJbgEem7KPD
         iNuEPAv1rwWnVpnfeqIRC3rFF6cYNzC//l1BidBM9gEJb61w09fnGm/mndJnKugWmEbg
         HtaIQYmwOLRZ2yBMwmBRFKKKp95yXp0HyMbbc5yyj8MWdPpReJSs8PuG+ivsA6TlmXLl
         GphkCZWm/cU/j3o9ToB3tJjFa0qF6iCqNqeK7w9wVwa8vcgz1XrlI/3VjEPQgu3SSPRR
         Dx5LPzHflfpk3LNUVyt8blhV8vVXsSn7GaHOAml514HJGvpgTM4CXsf0OFGgthhQXJ8J
         RV/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r141si345713ybc.287.2020.12.03.15.49.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Dec 2020 15:49:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkyM0-00038o-PI
	for alex.bennee@linaro.org; Thu, 03 Dec 2020 18:49:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kkyLX-0002cH-3L; Thu, 03 Dec 2020 18:49:11 -0500
Received: from mail.csgraf.de ([188.138.100.120]:57574
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kkyLT-0003PV-M3; Thu, 03 Dec 2020 18:49:10 -0500
Received: from localhost.localdomain
 (dynamic-077-002-092-143.77.2.pool.telefonica.de [77.2.92.143])
 by csgraf.de (Postfix) with ESMTPSA id EBB5239004FC;
 Fri,  4 Dec 2020 00:49:00 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/11] arm: Set PSCI to 0.2 for HVF
Date: Fri,  4 Dec 2020 00:48:51 +0100
Message-Id: <20201203234857.21051-6-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201203234857.21051-1-agraf@csgraf.de>
References: <20201203234857.21051-1-agraf@csgraf.de>
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
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w8VFSbYfyfZ6

In Hypervisor.framework, we just pass PSCI calls straight on to the QEMU emulation
of it. That means, if TCG is compatible with PSCI 0.2, so are we. Let's transpose
that fact in code too.

Signed-off-by: Alexander Graf <agraf@csgraf.de>

---

v3 -> v4:

  - Combine both if statements
---
 target/arm/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 07492e9f9a..6728426551 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1059,8 +1059,8 @@ static void arm_cpu_initfn(Object *obj)
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

