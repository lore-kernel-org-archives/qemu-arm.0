Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp177093lfq;
        Fri, 11 Dec 2020 07:19:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxuLeRUXLvTveCqL6pkVFTFMJM5DuxedcKzObKYhXS6dPjF0n/9oqETYMRZ+C4Me68KQsT1
X-Received: by 2002:a25:4744:: with SMTP id u65mr21316426yba.239.1607699959550;
        Fri, 11 Dec 2020 07:19:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607699959; cv=none;
        d=google.com; s=arc-20160816;
        b=OZ4TwycI20+mqCyNazoRjonJiEKZfRwZX+4xRLD1n8D1eCvQiKEIPPg8kQ8bOYE86W
         COrtKCELH/a0ucz/AXfaPPa1Wb/pbu8iim9zTucT6gj5XW8Qx7+rHjtGHneKOHgqlr7n
         t2yjqK2PrxEc1qUINm+Jgt8R/tiLOJUFTSoEN4+pVkBi2FWenoKEJCE9ALWEbpRh4PVu
         Iuhcfg5VQnT/U4123MCXtnINWM793vKoL5Pt32EA9qW66EMPDiIssl7RTecQkOvwdYTo
         rgg78Vb5cm8q5MeEEtr2eh1BOXwh5C6JZbt+k8564TGD76FlrwIKY0pouUSeU2QhODGb
         A9Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=ZHwiMl8MaqPvnYZkozEj3oSsiAEyenjjcmZDi0Z5e1Q=;
        b=XZxQ06RvcrJQo/TzF1jpJwPuxwMoe9hfiJRsGaag8oziGzbylUROstrAoso4KLL0yE
         32XPOzerM5I6g7992+XtpcSAljS1S7IIlhi+wODrIyW/QAwJmynxFKOky+gAwjv8NqVL
         6BYxzz2k2e7r88JNVdmNXYeoNB5S/fCwPiYOEo86Kiw1QA2TZmcK2qtmRiTvG0zfaoRI
         kI/0Xfda+k4zY+Db2cimHLjilgfNva3Qd9Oy/U0QSCYg8cJUHs5lcHVftiLSKGTnOjqO
         MnhaTnJc5By4aBSlMnIGet+QPa9e4vjPUe/1rqDFQknZQdfu7KMRJaKAlGYe5lOc1lLs
         c4NA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o141si9581832yba.33.2020.12.11.07.19.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Dec 2020 07:19:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1knkCU-0005FC-T1
	for alex.bennee@linaro.org; Fri, 11 Dec 2020 10:19:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1knk6Z-0007Y9-Tf; Fri, 11 Dec 2020 10:13:11 -0500
Received: from mail.csgraf.de ([188.138.100.120]:36586
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1knk6W-0001uu-DA; Fri, 11 Dec 2020 10:13:11 -0500
Received: from localhost.localdomain
 (dynamic-077-007-081-179.77.7.pool.telefonica.de [77.7.81.179])
 by csgraf.de (Postfix) with ESMTPSA id 8C8D9390051A;
 Fri, 11 Dec 2020 16:13:04 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/11] arm: Set PSCI to 0.2 for HVF
Date: Fri, 11 Dec 2020 16:12:54 +0100
Message-Id: <20201211151300.85322-6-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201211151300.85322-1-agraf@csgraf.de>
References: <20201211151300.85322-1-agraf@csgraf.de>
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
X-TUID: AxgG9NiKzbb3

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
index d6188f6566..86cf167d1d 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1062,8 +1062,8 @@ static void arm_cpu_initfn(Object *obj)
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

