Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1785786lfb;
        Thu, 26 Nov 2020 13:52:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2LHjaPvEeCiSPHYqOqhAq6VU8KcSfK1VXkQ/f1esa01ocmF5kmpRlqMptcS53vwHAKHN0
X-Received: by 2002:a25:c60a:: with SMTP id k10mr6745889ybf.113.1606427563531;
        Thu, 26 Nov 2020 13:52:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606427563; cv=none;
        d=google.com; s=arc-20160816;
        b=m/hmjvcaEmU/5LpI9lpwQjONN8FNp+QNUwQ3wfmQcDIadfRpv6QiCC9ZdHrdDJeC87
         d9Jfe0YXrsX3EbNr62ilSBjG0PhDr8L9ZSkAIAR7JZ7UzMwP5tKccYCeHGlvnzDUpuwN
         kW5aIC8T5usISayCA1A7mTtgD6Iq4VW/2NDQsY8nqfZ2OaGiujr20HhKiKMCd+qwSjoR
         /8BPOMpiM8xDV75ln8H1ByIPCxjFwfLi5wq6ehS3ZGRCOXTPCsXcCx17nKE6APi4xvZr
         Rgkf5sAMg+iU9pJkScEAcwsx2kuMnMwTmzRa7qGtmYlRh2lWaAMV+MD32NwIMbph0O+e
         Z5FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=dEenUpuUsiVUMBuxPHb+OEqMU9QIV2Wqi32wem+JW1Y=;
        b=EcalWwyKRLjBOW8J7rrK/kel4tV+sBoMxrWeft91E+ZG8VjxJzqKXEOfzrImi6bzjf
         2mF4yszGhI7Z1GbVRtiNhudCvOc6+ML96D+Gbc8FzaFey7YasxNtTU078DqfJOSHKBi9
         OlFFQqrC+tQhkNgj23hV39mDqEZsrNDvXAFxielnnu8V9ItYbXTxkwKNPSC1yJQlgWR3
         mgxInrDYLRpe7gRDH477/7DMeoqZf1M+u9T9cC9J50FpaKy2Pr44m4oSvs9i1wKldqEy
         wG2olEaXGZ8enGpFRhD3GvH1Cc3OX7NlMSPTV6XtAjR/iOCNiXLb2O0QToXvzVNN1uK+
         tr1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15si6584846ybk.141.2020.11.26.13.52.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Nov 2020 13:52:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiPBy-0004BA-UU
	for alex.bennee@linaro.org; Thu, 26 Nov 2020 16:52:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kiP9l-0001jm-9l; Thu, 26 Nov 2020 16:50:25 -0500
Received: from mail.csgraf.de ([188.138.100.120]:60556
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kiP9i-0005kd-Mg; Thu, 26 Nov 2020 16:50:25 -0500
Received: from localhost.localdomain
 (dynamic-077-009-187-158.77.9.pool.telefonica.de [77.9.187.158])
 by csgraf.de (Postfix) with ESMTPSA id 0BFC13900590;
 Thu, 26 Nov 2020 22:50:20 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/8] arm: Synchronize CPU on PSCI on
Date: Thu, 26 Nov 2020 22:50:13 +0100
Message-Id: <20201126215017.41156-5-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201126215017.41156-1-agraf@csgraf.de>
References: <20201126215017.41156-1-agraf@csgraf.de>
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
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sgrYkmxK2WR+

We are going to reuse the TCG PSCI code for HVF. This however means that we
need to ensure that CPU register state is synchronized properly between the
two worlds.

So let's make sure that at least on the PSCI on call, the secondary core gets
to sync its registers after reset, so that changes also propagate.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 target/arm/arm-powerctl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index b75f813b40..256f7cfdcd 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -15,6 +15,7 @@
 #include "arm-powerctl.h"
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
+#include "sysemu/hw_accel.h"
 
 #ifndef DEBUG_ARM_POWERCTL
 #define DEBUG_ARM_POWERCTL 0
@@ -66,6 +67,8 @@ static void arm_set_cpu_on_async_work(CPUState *target_cpu_state,
     cpu_reset(target_cpu_state);
     target_cpu_state->halted = 0;
 
+    cpu_synchronize_state(target_cpu_state);
+
     if (info->target_aa64) {
         if ((info->target_el < 3) && arm_feature(&target_cpu->env,
                                                  ARM_FEATURE_EL3)) {
-- 
2.24.3 (Apple Git-128)

