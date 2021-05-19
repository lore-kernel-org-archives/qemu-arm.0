Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1829268lfm;
        Wed, 19 May 2021 13:26:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0W3vEdYZLmcvLnzX93dV/jgbNiKtFp31RW0Y0qvChn/+EhpplojaSAvZSR6mx7UuVeVYI
X-Received: by 2002:a05:6e02:1d9b:: with SMTP id h27mr1011393ila.243.1621455970829;
        Wed, 19 May 2021 13:26:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621455970; cv=none;
        d=google.com; s=arc-20160816;
        b=lRFG+ZW8p+vcsogIHrZ1mk6v6J+wuFpe+g/yFFctVPD3rCRJWJK+Uufue+OjgjEFCp
         KTeE+JfaazyTD6okJ+LjsC3MTtxIztJqMkPU2tBIue6JDgyVPGYVRC3KcnHhv9f2IoiL
         lNNkVlDfiBKeqN3iEpG/5vpeaDIwOHk4nw25wOZh36sekX8OAeAkRBcgt8Kl5ohJz8dp
         XB01jcALWiIWZgM4GoTldIkJbqLUj+yRBLOxi8nZlIogX+yDZa+PnbmqkSOE0vE5HpgR
         auxlSskr/NZ/4TXEu12fPeMIjkD6wvWeZmuDs9gNbFgVulUxmYCPudgvDYy5A0hJKeiX
         S8Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=CBxAF2xfTjGTLxPPRII5xkAV6b0fE4LW4tF2+jafI+4=;
        b=Ntme0qcH52clINPW4Co04EhMpzE41hWAjZTDEy8soO7NgYm3aiLQZ2bBln6Ksunh1G
         MGoTg2+9ctCxgGTyUPG2VRvPazQyykU5Cc0bg/kkb3nfqUkaeFsb+gSNsxqsxQ9pOodx
         sfHFL0G6QzrWcUP/9c4aKc0IpKyLtDqgHREllWudiuUy/GbfHmBz3Abyn2kMwoXx7aP9
         agFM7kqRwA5cncJVPM9TlnT8v9NBzLmpkNrb7GSuNsbC55cdhiBhNm41uPLGnWcVovJx
         UqzHQJr+OvdO7ubELXsMSzyOupUmXD6F9FMWrurGZr5/8jz/1sATWJUSFkxyisPlKZft
         4BTA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c15si344009jag.124.2021.05.19.13.26.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 May 2021 13:26:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljSle-0002rh-1a
	for alex.bennee@linaro.org; Wed, 19 May 2021 16:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1ljSj1-0004la-1V; Wed, 19 May 2021 16:23:28 -0400
Received: from mail.csgraf.de ([85.25.223.15]:48272 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1ljSim-0003J9-Hz; Wed, 19 May 2021 16:23:26 -0400
Received: from localhost.localdomain
 (dynamic-095-114-039-201.95.114.pool.telefonica.de [95.114.39.201])
 by csgraf.de (Postfix) with ESMTPSA id 848246080686;
 Wed, 19 May 2021 22:22:59 +0200 (CEST)
From: Alexander Graf <agraf@csgraf.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH v8 07/19] hvf: Split out common code on vcpu init and destroy
Date: Wed, 19 May 2021 22:22:41 +0200
Message-Id: <20210519202253.76782-8-agraf@csgraf.de>
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
X-TUID: m9Di5LTChGSI

Until now, Hypervisor.framework has only been available on x86_64 systems.
With Apple Silicon shipping now, it extends its reach to aarch64. To
prepare for support for multiple architectures, let's start moving common
code out into its own accel directory.

This patch splits the vcpu init and destroy functions into a generic and
an architecture specific portion. This also allows us to move the generic
functions into the generic hvf code, removing exported functions.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 accel/hvf/hvf-accel-ops.c | 30 ++++++++++++++++++++++++++++++
 accel/hvf/hvf-accel-ops.h |  2 --
 include/sysemu/hvf_int.h  |  2 ++
 target/i386/hvf/hvf.c     | 23 ++---------------------
 4 files changed, 34 insertions(+), 23 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 7370fcfba0..b262efd8b6 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -363,6 +363,36 @@ static void hvf_type_init(void)
 
 type_init(hvf_type_init);
 
+static void hvf_vcpu_destroy(CPUState *cpu)
+{
+    hv_return_t ret = hv_vcpu_destroy(cpu->hvf_fd);
+    assert_hvf_ok(ret);
+
+    hvf_arch_vcpu_destroy(cpu);
+}
+
+static int hvf_init_vcpu(CPUState *cpu)
+{
+    int r;
+
+    /* init cpu signals */
+    sigset_t set;
+    struct sigaction sigact;
+
+    memset(&sigact, 0, sizeof(sigact));
+    sigact.sa_handler = dummy_signal;
+    sigaction(SIG_IPI, &sigact, NULL);
+
+    pthread_sigmask(SIG_BLOCK, NULL, &set);
+    sigdelset(&set, SIG_IPI);
+
+    r = hv_vcpu_create((hv_vcpuid_t *)&cpu->hvf_fd, HV_VCPU_DEFAULT);
+    cpu->vcpu_dirty = 1;
+    assert_hvf_ok(r);
+
+    return hvf_arch_init_vcpu(cpu);
+}
+
 /*
  * The HVF-specific vCPU thread function. This one should only run when the host
  * CPU supports the VMX "unrestricted guest" feature.
diff --git a/accel/hvf/hvf-accel-ops.h b/accel/hvf/hvf-accel-ops.h
index 8f992da168..09fcf22067 100644
--- a/accel/hvf/hvf-accel-ops.h
+++ b/accel/hvf/hvf-accel-ops.h
@@ -12,12 +12,10 @@
 
 #include "sysemu/cpus.h"
 
-int hvf_init_vcpu(CPUState *);
 int hvf_vcpu_exec(CPUState *);
 void hvf_cpu_synchronize_state(CPUState *);
 void hvf_cpu_synchronize_post_reset(CPUState *);
 void hvf_cpu_synchronize_post_init(CPUState *);
 void hvf_cpu_synchronize_pre_loadvm(CPUState *);
-void hvf_vcpu_destroy(CPUState *);
 
 #endif /* HVF_CPUS_H */
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index d15fa3302a..80c1a8f946 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -44,6 +44,8 @@ struct HVFState {
 extern HVFState *hvf_state;
 
 void assert_hvf_ok(hv_return_t ret);
+int hvf_arch_init_vcpu(CPUState *cpu);
+void hvf_arch_vcpu_destroy(CPUState *cpu);
 hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
 int hvf_put_registers(CPUState *);
 int hvf_get_registers(CPUState *);
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 100ede2a4d..c7132ee370 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -158,14 +158,12 @@ static bool ept_emulation_fault(hvf_slot *slot, uint64_t gpa, uint64_t ept_qual)
     return false;
 }
 
-void hvf_vcpu_destroy(CPUState *cpu)
+void hvf_arch_vcpu_destroy(CPUState *cpu)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
     CPUX86State *env = &x86_cpu->env;
 
-    hv_return_t ret = hv_vcpu_destroy((hv_vcpuid_t)cpu->hvf_fd);
     g_free(env->hvf_mmio_buf);
-    assert_hvf_ok(ret);
 }
 
 static void init_tsc_freq(CPUX86State *env)
@@ -210,23 +208,10 @@ static inline bool apic_bus_freq_is_known(CPUX86State *env)
     return env->apic_bus_freq != 0;
 }
 
-int hvf_init_vcpu(CPUState *cpu)
+int hvf_arch_init_vcpu(CPUState *cpu)
 {
-
     X86CPU *x86cpu = X86_CPU(cpu);
     CPUX86State *env = &x86cpu->env;
-    int r;
-
-    /* init cpu signals */
-    sigset_t set;
-    struct sigaction sigact;
-
-    memset(&sigact, 0, sizeof(sigact));
-    sigact.sa_handler = dummy_signal;
-    sigaction(SIG_IPI, &sigact, NULL);
-
-    pthread_sigmask(SIG_BLOCK, NULL, &set);
-    sigdelset(&set, SIG_IPI);
 
     init_emu();
     init_decoder();
@@ -243,10 +228,6 @@ int hvf_init_vcpu(CPUState *cpu)
         }
     }
 
-    r = hv_vcpu_create((hv_vcpuid_t *)&cpu->hvf_fd, HV_VCPU_DEFAULT);
-    cpu->vcpu_dirty = 1;
-    assert_hvf_ok(r);
-
     if (hv_vmx_read_capability(HV_VMX_CAP_PINBASED,
         &hvf_state->hvf_caps->vmx_cap_pinbased)) {
         abort();
-- 
2.30.1 (Apple Git-130)

