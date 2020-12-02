Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1426466lfb;
        Wed, 2 Dec 2020 11:10:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGMrvDjvM+WglPdmjC2RNGt4pmIilqDZsmvxA6adZCNL7FZt+oxAuxKVvAOXKaSkgmKbI2
X-Received: by 2002:a25:e092:: with SMTP id x140mr6251395ybg.476.1606936221449;
        Wed, 02 Dec 2020 11:10:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606936221; cv=none;
        d=google.com; s=arc-20160816;
        b=vBAFiPlNiiK8+G1MgYKmB8BcyIpcQD5enk4eLeXlc4cX9+bp1NXdUm4L7pFE86HJDQ
         2AcblXrn9T4IEJhmNvD0ZIux+vk4wfwqkfrCXm/RScidEmt5277JN/Lg2BjBLEePm9hx
         eJvSLKSKVOaOKFO8QD7/IYPdNXmZVJGAPb2oDmHUlgZNr+5hA5fAkl93mYtvOOHINynD
         vI8u5wog/0fa68rKYNvaKqI1GoTnBNGH+4yjjTcCAa9+WrR5gwAPTuM1BAUm3UeWKcG4
         Tm56SwFfyvcnHqpiUlXFGuXDnrdLIx6WVcRzBZztlABz1W1QY0Su8OQ1pTia97RM/j/A
         9ybg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=dmxHnJbhGBQZpiidUCYRdIyLNVPFN0gCA8qJqG0CTs8=;
        b=CG/sczWvqgRKQjLpnY+FXlhaQ1SIEgjWrUsb0AML7YrnBmqmEQlXjvWbjN6ys2R06t
         lNWeR2a7wrOTD0oePFZpDmcPt67UHHlDpeof/ye9xXC9OtaCAGmIpkakWgzGuWJceQ32
         75uvPVzOcCtpnRnN+88sycwQblMV3g5zFajE/+V/3ZiYg7CA/Si6+4fMn2O15AZU6IDG
         2zAqhvULtLZPUGgaIc2BQ2eBRNPG1cyVhvi0ILBbhTvW05bUTmdlrdZXkt8S73bYR/Aw
         Bl31eIhKoKWke7y/ZZRhlpRGIgY13U925rAbZ78KXa7TmsMto/YVhzf28gEqXElDqg8+
         nrrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e188si2420934yba.40.2020.12.02.11.10.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Dec 2020 11:10:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkXW8-0008KE-IL
	for alex.bennee@linaro.org; Wed, 02 Dec 2020 14:10:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kkXQO-00036A-Co; Wed, 02 Dec 2020 14:04:24 -0500
Received: from mail.csgraf.de ([188.138.100.120]:56444
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kkXQH-0005Fs-5p; Wed, 02 Dec 2020 14:04:24 -0500
Received: from localhost.localdomain
 (dynamic-077-007-031-140.77.7.pool.telefonica.de [77.7.31.140])
 by csgraf.de (Postfix) with ESMTPSA id 0A30F39004E2;
 Wed,  2 Dec 2020 20:04:15 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/10] arm: Set PSCI to 0.2 for HVF
Date: Wed,  2 Dec 2020 20:04:02 +0100
Message-Id: <20201202190408.2041-5-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201202190408.2041-1-agraf@csgraf.de>
References: <20201202190408.2041-1-agraf@csgraf.de>
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
X-TUID: G2fG8qxU78yA

In Hypervisor.framework, we just pass PSCI calls straight on to the QEMU emulation
of it. That means, if TCG is compatible with PSCI 0.2, so are we. Let's transpose
that fact in code too.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 target/arm/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 07492e9f9a..db6f7c34ed 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1062,6 +1062,10 @@ static void arm_cpu_initfn(Object *obj)
     if (tcg_enabled()) {
         cpu->psci_version = 2; /* TCG implements PSCI 0.2 */
     }
+
+    if (hvf_enabled()) {
+        cpu->psci_version = 2; /* HVF uses TCG's PSCI */
+    }
 }
 
 static Property arm_cpu_gt_cntfrq_property =
-- 
2.24.3 (Apple Git-128)

