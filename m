Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1829366lfm;
        Wed, 19 May 2021 13:26:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6RJ+fRrG53jPx+3aslG4w9yCw/RhFno2aLxEGe2NLtxq49WnsUzJ2PF0Z9UbgsVEmC4En
X-Received: by 2002:a5d:94d5:: with SMTP id y21mr1547275ior.110.1621455981755;
        Wed, 19 May 2021 13:26:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621455981; cv=none;
        d=google.com; s=arc-20160816;
        b=Mf/gPn7tqS5l5v6XeGXPnSXmVqBsT6B7xj+hMpK83c+7jqkbgwtbkeunuXuOTlVBNH
         KqQR9Ux/gDX9yZ/IgiULA/ghjnJ3nlaip5eiaZUf84mcoyJqY87Aut0/JJCtU6TJNLFc
         N0IZjErtUWuOmD6HoXJoHssp97K3tH0Bpro7zjnrcgtiu7sJt4jnHkYOoJGKFdnrpb4W
         5WE6MEI8hk7OW/nLwR6B0A5/+HjdAeNHLORqCzWMHLV6GkpiEHhX/7q1SDOkNu9oMddN
         vHqQMs/cYaTBfJzwCeavGqxE2k0dD+srSmUVNmedVlCgaDXzsR21zzoioLhCkHA81bGc
         cuWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=yiRAePn8gvF7GelWgy9CMzmfQ3Eb4/txG/7KfA7nJwM=;
        b=TsS8mjLO/qOZMxV/0QYodIbwHn62R4hrisNr7cZl+5Sho5bbLU+n4RUFIzmdOccT8F
         +GusBntVtlAyHPuCcpJ7djgT0PxBBJ0f+nfecaQU5u+qXt6mqA5lFy0hCxG4pW+ZleDA
         naVJB2JF/xJrDxm0zrqgrx1vI0h1E8BQmV9/BYL8/wqT2hN8iZaF8J0OmxhqxZ8xur04
         I3wGMoFh3Eqew3Dd/uImYjq83BnUkNnVK4sEDlta6qrfMH9TQMFUhHBGXKXztYuSfa5O
         hz08fQnD1bRjnUoeL86OscEHyAgS5dlMOtpUv/0pmOdO8jUjZFgn8w0+9e2hfQ/0yIK8
         Cfqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p31si398884jac.95.2021.05.19.13.26.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 May 2021 13:26:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljSlp-0003be-0i
	for alex.bennee@linaro.org; Wed, 19 May 2021 16:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1ljSj2-0004o2-Ka; Wed, 19 May 2021 16:23:30 -0400
Received: from mail.csgraf.de ([85.25.223.15]:48282 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1ljSiu-0003Oe-A4; Wed, 19 May 2021 16:23:28 -0400
Received: from localhost.localdomain
 (dynamic-095-114-039-201.95.114.pool.telefonica.de [95.114.39.201])
 by csgraf.de (Postfix) with ESMTPSA id D07C760806B0;
 Wed, 19 May 2021 22:23:02 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v8 12/19] hvf: Simplify post reset/init/loadvm hooks
Date: Wed, 19 May 2021 22:22:46 +0200
Message-Id: <20210519202253.76782-13-agraf@csgraf.de>
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
X-TUID: fj2ZX9n30reC

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
Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
---
 accel/hvf/hvf-accel-ops.c | 27 +++++++--------------------
 target/i386/hvf/x86hvf.c  |  5 ++++-
 2 files changed, 11 insertions(+), 21 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index ded918c443..d1691be989 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -205,39 +205,26 @@ static void hvf_cpu_synchronize_state(CPUState *cpu)
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
 
 static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
index 28cfee4f60..2ced2c2478 100644
--- a/target/i386/hvf/x86hvf.c
+++ b/target/i386/hvf/x86hvf.c
@@ -433,7 +433,10 @@ int hvf_process_events(CPUState *cpu_state)
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
2.30.1 (Apple Git-130)

