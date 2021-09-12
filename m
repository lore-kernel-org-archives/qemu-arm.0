Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3181497lfb;
        Sun, 12 Sep 2021 16:08:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiMzirn5k1/tXCADeUVhiTiKEEFVAxQaE1tlIUGnta3Wg/xCGTCo0hAL+wKy2Pqgq/vHE0
X-Received: by 2002:a5d:8a0e:: with SMTP id w14mr6560268iod.94.1631488113089;
        Sun, 12 Sep 2021 16:08:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631488113; cv=none;
        d=google.com; s=arc-20160816;
        b=BDc7Zy/Aa5GLTG+KngSrgG51WqLEKXAMaFEmGJMzde3xDHGCGkcCdlDNrTbhsWcWsV
         sFWUBlWcnHGs8umRh4kMMuaqNtvckSypWMhX00pZsaG95ij9qVG9eeJvOGZT8zzMifmz
         iCPbRYmr5+8EXTZwHHqOyKInEB6tvEOg8eJwB3Hwblrd4NpD8aZcGSKl1ES24I1BO9Kg
         ry141o89lmEJ9HARm7DpJNEHvy+IEYrDfYZDpDTwUp6J0O39nKE23v/SwSsVQgYcd6KC
         4mn9T62YKduwvUzdDyTkrquw3Cph+w/OdfC59P9UYdlmSGY4tzpFNJkvlDW0cPQFPL7I
         cGsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=YP7FuNeKFSsC3SEtbUOH35dZ73aJZKJLOyayuxTxJiE=;
        b=J7Jrczo2XUnk9n679EdHrmO/OPnaNlwUzR8ILd3931udZByG5Vd3cf7M235ncq1PfL
         Q4HTYkgVIc2EA6HRHE9aFdinYoe3ozQIy6w20kJZa/CUeq16cjOSwaA9qSYh8IyKD6Cx
         rM0roc/mHy14lXeRnCpDp8kgC9SvaN28cscZ4yrrL18likuKQhBN/rmdiUHc+WjoPLf6
         hEun8lDZUa2oopToKVEBOvaEdYYRozY0wkfT7gEHZzR1dD1jDwgXMdP/kQZxmBs0xSim
         3pacMqrjoKPd5Ct4T9jnmHFFPqV1BARwlm4PI9Dfu/4I9HRuud0VnzkXXuzjhaf03IWa
         GORQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q7si6215497ilu.111.2021.09.12.16.08.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Sep 2021 16:08:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPYaO-000355-Ec
	for alex.bennee@linaro.org; Sun, 12 Sep 2021 19:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mPYZy-0002DI-DF; Sun, 12 Sep 2021 19:08:06 -0400
Received: from mail.csgraf.de ([85.25.223.15]:43512 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mPYZt-0003EZ-Va; Sun, 12 Sep 2021 19:08:06 -0400
Received: from localhost.localdomain
 (dynamic-095-117-028-179.95.117.pool.telefonica.de [95.117.28.179])
 by csgraf.de (Postfix) with ESMTPSA id 365D960805F9;
 Mon, 13 Sep 2021 01:08:00 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v9 03/11] hvf: Introduce hvf_arch_init() callback
Date: Mon, 13 Sep 2021 01:07:49 +0200
Message-Id: <20210912230757.41096-4-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210912230757.41096-1-agraf@csgraf.de>
References: <20210912230757.41096-1-agraf@csgraf.de>
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
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6WNhEJg8+5it

We will need to install a migration helper for the ARM hvf backend.
Let's introduce an arch callback for the overall hvf init chain to
do so.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 accel/hvf/hvf-accel-ops.c | 3 ++-
 include/sysemu/hvf_int.h  | 1 +
 target/i386/hvf/hvf.c     | 5 +++++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 71cc2fa70f..65d431868f 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -324,7 +324,8 @@ static int hvf_accel_init(MachineState *ms)
 
     hvf_state = s;
     memory_listener_register(&hvf_memory_listener, &address_space_memory);
-    return 0;
+
+    return hvf_arch_init();
 }
 
 static void hvf_accel_class_init(ObjectClass *oc, void *data)
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 8b66a4e7d0..0466106d16 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -48,6 +48,7 @@ struct hvf_vcpu_state {
 };
 
 void assert_hvf_ok(hv_return_t ret);
+int hvf_arch_init(void);
 int hvf_arch_init_vcpu(CPUState *cpu);
 void hvf_arch_vcpu_destroy(CPUState *cpu);
 int hvf_vcpu_exec(CPUState *);
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 79ba4ed93a..abef24a9c8 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -206,6 +206,11 @@ static inline bool apic_bus_freq_is_known(CPUX86State *env)
     return env->apic_bus_freq != 0;
 }
 
+int hvf_arch_init(void)
+{
+    return 0;
+}
+
 int hvf_arch_init_vcpu(CPUState *cpu)
 {
     X86CPU *x86cpu = X86_CPU(cpu);
-- 
2.30.1 (Apple Git-130)

