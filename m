Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1832855lfm;
        Wed, 19 May 2021 13:31:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz04dC96Dina7JtG0KN26meMewjUOsDDzhfcwK6IwOjEdmtg/A/EJtwRB9JcopBnocrvRWG
X-Received: by 2002:a92:c74b:: with SMTP id y11mr1088375ilp.302.1621456286029;
        Wed, 19 May 2021 13:31:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621456286; cv=none;
        d=google.com; s=arc-20160816;
        b=AfA1ksrt8J6SBU2nGY8SLERYQVAZvHuS+J4TZJt4djva+zfBQjlvNIW0JO+pcraaxm
         EnKybOPy2GOMH35dx/F4X/kxCiNTXNwQJtXfxJozWSdwaopPA59vmZha71iEFIcSVUgR
         48HdCJrac2aOiJlNeqMmxXI7lbUmlwnzO7llgf8AxvW6pp4zjCkM5r6c4lnTC+1nyYYt
         /eCOGl6bTbci+tceg1jYQShybAEw149nDyQHtTZmlMcsIlS6eSRbTNrjtUSU4tRIw9We
         xK/bQd5d4ELOJaqRINPBrNS406XoDEiqc31rSlLoGm/Y7wsdczQesFz/Xc7saRriQ533
         9Hmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=m8TQrfXK3h40BeHVTYxHR8nXdO4/VX8zKMyUEo2kr4g=;
        b=JxW/dEPzonZr1zhlaq6fYSPBfxeES3SmGamYuz/rw7oF20FnZGgiuBO6c7O3E0P6k5
         JRpYuD9zhdGHkwFMVHcXSKjkPFXWWdbr4HyNz5DKzXMeIZyusOe7srWKUi2WFjX95eyE
         /FRxMZEH/FTBDj/tqOdt/hTPj0gs8n07B81OU7YD9as3kFxj4fV3IweQJ9R60V+blO8w
         3CLr09CDVR4UZwaXokV45OApj2O2JNznMB/mNVF+tImw2DfFbibQzSBLKZCXYtykBGaA
         8MCZ5EVMCv7/jfSCMuuICo18BHPPyGoEdasJjOUg7qeDmhjNIwbcAmDuETQbuaUYEe26
         7pOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8si816605ilq.2.2021.05.19.13.31.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 May 2021 13:31:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljSqj-0006OF-C2
	for alex.bennee@linaro.org; Wed, 19 May 2021 16:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1ljSj2-0004mu-2h; Wed, 19 May 2021 16:23:28 -0400
Received: from mail.csgraf.de ([85.25.223.15]:48278 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1ljSim-0003JN-MF; Wed, 19 May 2021 16:23:27 -0400
Received: from localhost.localdomain
 (dynamic-095-114-039-201.95.114.pool.telefonica.de [95.114.39.201])
 by csgraf.de (Postfix) with ESMTPSA id BDF2860806A1;
 Wed, 19 May 2021 22:23:00 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v8 09/19] hvf: Make synchronize functions static
Date: Wed, 19 May 2021 22:22:43 +0200
Message-Id: <20210519202253.76782-10-agraf@csgraf.de>
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
X-TUID: /EC+xtPAlRM5

The hvf accel synchronize functions are only used as input for local
callback functions, so we can make them static.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 accel/hvf/hvf-accel-ops.c | 6 +++---
 accel/hvf/hvf-accel-ops.h | 3 ---
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 3b599ac57c..69741ce708 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -214,7 +214,7 @@ static void do_hvf_cpu_synchronize_post_reset(CPUState *cpu,
     cpu->vcpu_dirty = false;
 }
 
-void hvf_cpu_synchronize_post_reset(CPUState *cpu)
+static void hvf_cpu_synchronize_post_reset(CPUState *cpu)
 {
     run_on_cpu(cpu, do_hvf_cpu_synchronize_post_reset, RUN_ON_CPU_NULL);
 }
@@ -226,7 +226,7 @@ static void do_hvf_cpu_synchronize_post_init(CPUState *cpu,
     cpu->vcpu_dirty = false;
 }
 
-void hvf_cpu_synchronize_post_init(CPUState *cpu)
+static void hvf_cpu_synchronize_post_init(CPUState *cpu)
 {
     run_on_cpu(cpu, do_hvf_cpu_synchronize_post_init, RUN_ON_CPU_NULL);
 }
@@ -237,7 +237,7 @@ static void do_hvf_cpu_synchronize_pre_loadvm(CPUState *cpu,
     cpu->vcpu_dirty = true;
 }
 
-void hvf_cpu_synchronize_pre_loadvm(CPUState *cpu)
+static void hvf_cpu_synchronize_pre_loadvm(CPUState *cpu)
 {
     run_on_cpu(cpu, do_hvf_cpu_synchronize_pre_loadvm, RUN_ON_CPU_NULL);
 }
diff --git a/accel/hvf/hvf-accel-ops.h b/accel/hvf/hvf-accel-ops.h
index f6192b56f0..018a4e22f6 100644
--- a/accel/hvf/hvf-accel-ops.h
+++ b/accel/hvf/hvf-accel-ops.h
@@ -13,8 +13,5 @@
 #include "sysemu/cpus.h"
 
 int hvf_vcpu_exec(CPUState *);
-void hvf_cpu_synchronize_post_reset(CPUState *);
-void hvf_cpu_synchronize_post_init(CPUState *);
-void hvf_cpu_synchronize_pre_loadvm(CPUState *);
 
 #endif /* HVF_CPUS_H */
-- 
2.30.1 (Apple Git-130)

