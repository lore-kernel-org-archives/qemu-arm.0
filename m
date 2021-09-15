Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp395217lfp;
        Wed, 15 Sep 2021 11:18:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwTdPIwvA2Dl1Qe0n3Pu63MKbF2l5tIi/0mh6KuAP+MAJ+7MoP0URUMrKIgtGWr6GWntPj
X-Received: by 2002:ab0:48c3:: with SMTP id y3mr1453521uac.10.1631729906381;
        Wed, 15 Sep 2021 11:18:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631729906; cv=none;
        d=google.com; s=arc-20160816;
        b=a8PK7+oVpAuDrHZ7dfIfNk0cYl0oWp2rHMt/PUjjLUedcu2+9UsGhGEH2dc6yA2luS
         F4x02m86SIEe81Q1FGiCz5D+vLYyCd4NOwBNKRqP0ESjXjOEWiDEpcpUITxe/UwzDalv
         nijUte0npWNB4M7d7RHLO6AeeVGeB/7+KI+S7y3ijkN69gsQq8rBuoD/waVyANlylueM
         NLYwTkRd3gBqUfSKDXSisPygWNHWndSaLGB/iLsFQMGQiNGlkmItO6u8bMzOQKbsjYuM
         65i85mdLinl2AoEs4dRQJjxX/1UcQotUXE9WpCn4K7hbjhsJN4Bks9lv7YYQIvUmhNmK
         0FDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=YP7FuNeKFSsC3SEtbUOH35dZ73aJZKJLOyayuxTxJiE=;
        b=LehG4plcRzmHb1HiVlQCCYyAUWosnZO2vw2Pc6U2feHKUDj08j2TQc/MEnHWA5DBqE
         qpMloXL8G3ga3klZeQzT+eS+n/GdyGSgCS9A9TgDvGDI7yAzBQrui/hpDsuBW7n1bxY4
         dAO0vhV9WIHZh0Bm32PdDxfvELpqoxYmLaJthMqM2iLmnQmT4aqTLMjhroHNOsSJ8GX8
         bd4Gmsr7xFaQSHfMQ0gzxfB8/uVh9K9DHB5NoKoeCT1WT1wCvU55ayvr1nWykIrai5qm
         2kjhbDbMccd3HOYHxdxpKJYGGtbTAHALgIadO4whWjbV0kvW2nRivpenyO/R5pxMFHZI
         8V8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8si822364vkd.5.2021.09.15.11.18.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Sep 2021 11:18:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQZUH-0007Ub-Q8
	for alex.bennee@linaro.org; Wed, 15 Sep 2021 14:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mQZN4-0006UB-4H; Wed, 15 Sep 2021 14:10:58 -0400
Received: from mail.csgraf.de ([85.25.223.15]:50684 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mQZN1-0003Op-Lc; Wed, 15 Sep 2021 14:10:57 -0400
Received: from localhost.localdomain
 (dynamic-095-117-089-091.95.117.pool.telefonica.de [95.117.89.91])
 by csgraf.de (Postfix) with ESMTPSA id F19516080612;
 Wed, 15 Sep 2021 20:10:52 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v11 03/10] hvf: Introduce hvf_arch_init() callback
Date: Wed, 15 Sep 2021 20:10:42 +0200
Message-Id: <20210915181049.27597-4-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210915181049.27597-1-agraf@csgraf.de>
References: <20210915181049.27597-1-agraf@csgraf.de>
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
X-TUID: ehGn1wZ2UmUC

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

