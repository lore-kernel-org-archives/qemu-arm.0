Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp656520lfm;
        Sun, 16 May 2021 13:09:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1GhL229J13XCZq1T9O/WBKftPzHQVw131fGPamQkwggeamSgMlVUb7Jf9Czww9+GTgWcf
X-Received: by 2002:a5d:9842:: with SMTP id p2mr37536184ios.132.1621195745489;
        Sun, 16 May 2021 13:09:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621195745; cv=none;
        d=google.com; s=arc-20160816;
        b=0un7Aeb75Xp3cTWOgYX+XuiVy/5/ueOrPeB53flk/2i5r9JW3+AwAEyXZqo0Q4x1QK
         F2D8EecZE8Zs/2kgp6vfz5DQHraAqgi9wjrm6sxxXs7Sfu6IX/qF/BW5x5fkbY3lPUMO
         i4XRFGUYNR5vmx3y6gUcIL59WWOuvoq/Fe/1VPVgfK5OJZ/+jSeg22V5B/d/B+09wCGG
         GoRVtmuSi5GJdEJu/v5onDIYKMi1yLFA/j58e7UYPGYK5gdfSJ+tJhZsDuBPoKrdwxaK
         Ge8LRHybYe6ldr5Pd2W+q9plshzpxG9dk7L05UqMhTZJGpKNNCy3etgeisyS/CHIIq0w
         k01A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=wCwHaPOCPxq39+Pnecgtsjf9Jszd3Ea9Om4doUckkMw=;
        b=DE6C31feQ7P1djMXnGUkrRRRtjVhBLiJpAvISooobculTNKAgKRL4VSASrONqwmsVj
         FoffhjT1Rm/bbj1FEWM3b2Nsz38vrwquOqXJbik+YAsScLoW4svxO8Gu+squ+YFCIj65
         xNyFFLv2iH1mxAJ/olHgw+gSG1e9A4PdyAU+9o2i1Wu41Bq7NWggT2uQgCEmWnyl7yOY
         IDn7kfKcUBOaLVliYpfi29fo3JOD86fxlyQ0m4O4V+NUhNBUjAQ0kO3+hpXOqtVYrx3S
         GFjrVKkPekVkP1JDlp5UiOlk9+sLEtCDX3NdQD0EpQLu+nnwW9FptEWNyccVDfW8zMfo
         MLog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13si7487486ilt.118.2021.05.16.13.09.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 13:09:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liN4S-0001DZ-PC
	for alex.bennee@linaro.org; Sun, 16 May 2021 16:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1liMvR-0003r9-Uq; Sun, 16 May 2021 15:59:46 -0400
Received: from mail.csgraf.de ([85.25.223.15]:45488 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1liMvB-0008LM-FZ; Sun, 16 May 2021 15:59:44 -0400
Received: from localhost.localdomain
 (dynamic-095-118-089-019.95.118.pool.telefonica.de [95.118.89.19])
 by csgraf.de (Postfix) with ESMTPSA id D3F9A60806A1;
 Sun, 16 May 2021 21:59:07 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v7 18/19] arm: Enable Windows 10 trusted SMCCC boot call
Date: Sun, 16 May 2021 21:58:54 +0200
Message-Id: <20210516195855.28869-19-agraf@csgraf.de>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: UkB2GTTp7gi1

Windows 10 calls an SMCCC call via SMC unconditionally on boot. It lives
in the trusted application call number space, but its purpose is unknown.

In our current SMC implementation, we inject a UDEF for unknown SMC calls,
including this one. However, Windows breaks on boot when we do this. Instead,
let's return an error code.

With this and -M virt,virtualization=on I can successfully boot the current
Windows 10 Insider Preview in TCG.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 target/arm/kvm-consts.h | 2 ++
 target/arm/psci.c       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/target/arm/kvm-consts.h b/target/arm/kvm-consts.h
index 580f1c1fee..4b64f98117 100644
--- a/target/arm/kvm-consts.h
+++ b/target/arm/kvm-consts.h
@@ -85,6 +85,8 @@ MISMATCH_CHECK(QEMU_PSCI_0_2_FN64_CPU_SUSPEND, PSCI_0_2_FN64_CPU_SUSPEND);
 MISMATCH_CHECK(QEMU_PSCI_0_2_FN64_CPU_ON, PSCI_0_2_FN64_CPU_ON);
 MISMATCH_CHECK(QEMU_PSCI_0_2_FN64_MIGRATE, PSCI_0_2_FN64_MIGRATE);
 
+#define QEMU_SMCCC_TC_WINDOWS10_BOOT 0xc3000001
+
 /* PSCI v0.2 return values used by TCG emulation of PSCI */
 
 /* No Trusted OS migration to worry about when offlining CPUs */
diff --git a/target/arm/psci.c b/target/arm/psci.c
index 6709e28013..4d11dd59c4 100644
--- a/target/arm/psci.c
+++ b/target/arm/psci.c
@@ -69,6 +69,7 @@ bool arm_is_psci_call(ARMCPU *cpu, int excp_type)
     case QEMU_PSCI_0_2_FN64_CPU_SUSPEND:
     case QEMU_PSCI_0_1_FN_MIGRATE:
     case QEMU_PSCI_0_2_FN_MIGRATE:
+    case QEMU_SMCCC_TC_WINDOWS10_BOOT:
         return true;
     default:
         return false;
@@ -194,6 +195,7 @@ void arm_handle_psci_call(ARMCPU *cpu)
         break;
     case QEMU_PSCI_0_1_FN_MIGRATE:
     case QEMU_PSCI_0_2_FN_MIGRATE:
+    case QEMU_SMCCC_TC_WINDOWS10_BOOT:
         ret = QEMU_PSCI_RET_NOT_SUPPORTED;
         break;
     default:
-- 
2.30.1 (Apple Git-130)

