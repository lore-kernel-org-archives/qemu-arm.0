Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1275612lfp;
        Thu, 16 Sep 2021 09:22:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyABAT5p9omXe4DjM8qhcXPh8J3MKm7jR+p7ZOWxJ/0QpRZGBSyQOfD8xq7FvcTBLEw0Trk
X-Received: by 2002:a05:6102:22f1:: with SMTP id b17mr4925993vsh.10.1631809327113;
        Thu, 16 Sep 2021 09:22:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631809327; cv=none;
        d=google.com; s=arc-20160816;
        b=SKE84yy7TlmOv84xxhSknJ9rdo9v/1FM+OvWIn+WNIhxnm4gER4sqPHZHPe4aJEj0A
         xg18oFqNNrrg7/xYaLYSf9xxp1Pw4WrJeO7ltXmWgpson3D5k+gKNPpYA3J7bw15gzk4
         344fKEZjeGSTNiw5M1IO0f+nzqRKpgklAIrVweLgpZkS5ENsys4N/xgJGPF5kxqeCRjT
         Oi8+p9xY16EDo+OB4tlVkqH2mtuW2ulz9qS4lB+hPzWtrJBHxdNOOtqfAouiJeCW/tZg
         Egw92W+I0PGJyy7aeih2TOGuUYB6NEIWZ4j8UBw6reg+i+GakrevbEL9WhfJDXyQHPeD
         YjGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=3TsKQvQgLGXTM7/TQEOuYxKnhaI0MnwlvADGCdW6xE8=;
        b=UVlc8Z/SNqgGV+VFy+mf7NBIj/ZlsRUG6vJwvgINcHfnJQ1lhOiBQWog4PavQ5EQOn
         7/1a8LUxedbWtCsybCvHxPWemHfikLCWnZm1pZ5o6q/obE41ytdj8W+ikdeAAHSDSg6k
         FmzNQyMM8pJmx1s0Ch/6ofs0fziinvN4zP5hQ8BrkEafCb/mSxyUqn66u9/IkQsaM2Sv
         5kDvgj4LDSp+s+T2pS7Scz4svt156QcNNk75gj+582dIxEJlcYVYcSGpQm9h/hSnacSC
         5Puex0yuzT0dkWE5KmnDRDmOfv1Diolm5m5SRMUM1A3h8ILl3uj1WybdwCTH3MG8dfn4
         FM2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d18si1472306vkp.82.2021.09.16.09.22.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 09:22:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQu9F-0002T7-GS
	for alex.bennee@linaro.org; Thu, 16 Sep 2021 12:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mQtiJ-0002y6-HK; Thu, 16 Sep 2021 11:54:15 -0400
Received: from mail.csgraf.de ([85.25.223.15]:51334 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mQtiD-00055n-RB; Thu, 16 Sep 2021 11:54:15 -0400
Received: from localhost.localdomain
 (dynamic-077-009-016-098.77.9.pool.telefonica.de [77.9.16.98])
 by csgraf.de (Postfix) with ESMTPSA id B9F2560806A1;
 Thu, 16 Sep 2021 17:54:06 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v12 03/10] hvf: Introduce hvf_arch_init() callback
Date: Thu, 16 Sep 2021 17:53:57 +0200
Message-Id: <20210916155404.86958-4-agraf@csgraf.de>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210916155404.86958-1-agraf@csgraf.de>
References: <20210916155404.86958-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) SPF_HELO_NONE=0.001,
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
X-TUID: fyQNE8bmluq7

We will need to install a migration helper for the ARM hvf backend.
Let's introduce an arch callback for the overall hvf init chain to
do so.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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

