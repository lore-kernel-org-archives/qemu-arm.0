Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp117124lfb;
        Thu, 3 Dec 2020 15:51:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJMcWPWkXHbG7dnOkvUjEN8LULvVitir7HL4niMaYVg+9EaJnMzdjYepRQ0xD6tAG1CuYf
X-Received: by 2002:a25:c647:: with SMTP id k68mr2250927ybf.337.1607039517055;
        Thu, 03 Dec 2020 15:51:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607039517; cv=none;
        d=google.com; s=arc-20160816;
        b=TgHZ2bEtFYhwCUCMiM/siDwwtBoh6ns1Rhqp0n4XIz4GaImTAr5XbPen3PBOEr5PIS
         mMFQIJ+iZofYC7+5b7PkTSNzKWVDYDd+YEDjUtXcJgZrAOlv2JFCD6fCaclIFV0TUjWc
         kdkb8JBNIXCOQSCdOBt6MUQyomgEPfjg3qdPRG1Ebjkbc+iC8Qk8FacV1kSjtsDa6FWk
         +fGJHt/V36rvS/lMNB05yZNiojsw8zzyzqq6lXkTCROPd9g1VOmpPg9RpeW54KluPDKu
         xujK5qJMPSXF+kTlvDhtDh6ozNWyHJ7hVyk9dyGFAb0Gp+cNjNAzIQrFVGRdCgmHe+F+
         l4eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=LgwiXl29DZJFUpjStAzy1YxlfSAydu6HA4sRTZOHdNU=;
        b=ValPBxOc2hgiK6CM3a2aXEW1J7PuGbh0vOLWYay4uo3r9MwKaJuNpzy6oxREdoWpKq
         yfcn2FVCIqykGnTurDA9FpmAaKVIVQLYemGjos0rEg1xykmCVpWuMZCB8ZOAr6d9JsU5
         YGtrtr4Y3U/3HDLSTrlWQSWo3xzLibOpic66rq06odWf1B1hX4AdwpPA/WyMovmIwglN
         A5rXMRTj14kfP2lj7SdPZOU+K0j68+ksEtxtkB1NFWEIEMcYrfNYm9jMTpftGCVhH38t
         Avo9g5eOMdE5biLJaSoR0qaYTE71gRdy6mNceLzswcXEKpTm5Z3u2fLfmj/81+Kus6nO
         8twQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d6si336163ybj.64.2020.12.03.15.51.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Dec 2020 15:51:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkyOC-0006g1-E3
	for alex.bennee@linaro.org; Thu, 03 Dec 2020 18:51:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kkyLV-0002Xg-Fm; Thu, 03 Dec 2020 18:49:09 -0500
Received: from mail.csgraf.de ([188.138.100.120]:57576
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kkyLT-0003PU-Kt; Thu, 03 Dec 2020 18:49:09 -0500
Received: from localhost.localdomain
 (dynamic-077-002-092-143.77.2.pool.telefonica.de [77.2.92.143])
 by csgraf.de (Postfix) with ESMTPSA id 896DF3900500;
 Fri,  4 Dec 2020 00:49:01 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/11] hvf: Simplify post reset/init/loadvm hooks
Date: Fri,  4 Dec 2020 00:48:52 +0100
Message-Id: <20201203234857.21051-7-agraf@csgraf.de>
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
X-TUID: sh0moostyf8R

The hooks we have that call us after reset, init and loadvm really all
just want to say "The reference of all register state is in the QEMU
vcpu struct, please push it".

We already have a working pushing mechanism though called cpu->vcpu_dirty,
so we can just reuse that for all of the above, syncing state properly the
next time we actually execute a vCPU.

This fixes PSCI resets on ARM, as they modify CPU state even after the
post init call has completed, but before we execute the vCPU again.

To also make the scheme work for x86, we have to make sure we don't
move stale eflags into our env when the vcpu state is dirty.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 accel/hvf/hvf-cpus.c     | 27 +++++++--------------------
 target/i386/hvf/x86hvf.c |  5 ++++-
 2 files changed, 11 insertions(+), 21 deletions(-)

diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
index 1b0c868944..71721e17de 100644
--- a/accel/hvf/hvf-cpus.c
+++ b/accel/hvf/hvf-cpus.c
@@ -275,39 +275,26 @@ static void hvf_cpu_synchronize_state(CPUState *cpu)
     }
 }
 
-static void do_hvf_cpu_synchronize_post_reset(CPUState *cpu,
-                                              run_on_cpu_data arg)
+static void do_hvf_cpu_synchronize_set_dirty(CPUState *cpu,
+                                             run_on_cpu_data arg)
 {
-    hvf_put_registers(cpu);
-    cpu->vcpu_dirty = false;
+    /* QEMU state is the reference, push it to HVF now and on next entry */
+    cpu->vcpu_dirty = true;
 }
 
 static void hvf_cpu_synchronize_post_reset(CPUState *cpu)
 {
-    run_on_cpu(cpu, do_hvf_cpu_synchronize_post_reset, RUN_ON_CPU_NULL);
-}
-
-static void do_hvf_cpu_synchronize_post_init(CPUState *cpu,
-                                             run_on_cpu_data arg)
-{
-    hvf_put_registers(cpu);
-    cpu->vcpu_dirty = false;
+    run_on_cpu(cpu, do_hvf_cpu_synchronize_set_dirty, RUN_ON_CPU_NULL);
 }
 
 static void hvf_cpu_synchronize_post_init(CPUState *cpu)
 {
-    run_on_cpu(cpu, do_hvf_cpu_synchronize_post_init, RUN_ON_CPU_NULL);
-}
-
-static void do_hvf_cpu_synchronize_pre_loadvm(CPUState *cpu,
-                                              run_on_cpu_data arg)
-{
-    cpu->vcpu_dirty = true;
+    run_on_cpu(cpu, do_hvf_cpu_synchronize_set_dirty, RUN_ON_CPU_NULL);
 }
 
 static void hvf_cpu_synchronize_pre_loadvm(CPUState *cpu)
 {
-    run_on_cpu(cpu, do_hvf_cpu_synchronize_pre_loadvm, RUN_ON_CPU_NULL);
+    run_on_cpu(cpu, do_hvf_cpu_synchronize_set_dirty, RUN_ON_CPU_NULL);
 }
 
 static void hvf_vcpu_destroy(CPUState *cpu)
diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
index 0f2aeb1cf8..3111c0be4c 100644
--- a/target/i386/hvf/x86hvf.c
+++ b/target/i386/hvf/x86hvf.c
@@ -435,7 +435,10 @@ int hvf_process_events(CPUState *cpu_state)
     X86CPU *cpu = X86_CPU(cpu_state);
     CPUX86State *env = &cpu->env;
 
-    env->eflags = rreg(cpu_state->hvf->fd, HV_X86_RFLAGS);
+    if (!cpu_state->vcpu_dirty) {
+        /* light weight sync for CPU_INTERRUPT_HARD and IF_MASK */
+        env->eflags = rreg(cpu_state->hvf->fd, HV_X86_RFLAGS);
+    }
 
     if (cpu_state->interrupt_request & CPU_INTERRUPT_INIT) {
         cpu_synchronize_state(cpu_state);
-- 
2.24.3 (Apple Git-128)

