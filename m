Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5583024lfg;
        Wed, 3 Mar 2021 10:31:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy572CbUDKfMk3qdPc7Q5e89KFTTHda2+mX+fDB1vsFw69L94jQoRY10CLZE2+9/VX8nVXP
X-Received: by 2002:a05:6e02:154d:: with SMTP id j13mr552880ilu.153.1614796286317;
        Wed, 03 Mar 2021 10:31:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614796286; cv=none;
        d=google.com; s=arc-20160816;
        b=FvikAPd8wS8DC2YA84mDZXK/0czS1jxoeChDCh3R2Pv9LXQwrGRA+JklT68ZaqAsdp
         D8I1GmFb7AZUwhbRuiCNH3+SIDoJyS7fr0mOvWaM/J0B1Ptohlx5WLupVqqBw98Vg+PK
         jDlOnyAQqJa2QgvHXVBUEINTap0GpYvwgcrY3JKdtVLPRlkV4mLE4E/tgFwgubhEgytq
         2q0rfOoy1h9nu0IgcF+xkQGhzQwP/IfS9e/D4Kcr80TLYHcsaYOyKUmao0hgGuaA5DZe
         XWYGgaHr+edXbhrCsa07xWqTD1TsQzXCILwanadC9i0dqzsUkhH4yR1UaKJF/TncFVNA
         UOLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=aZTO3x/pXi2BQffGU8Ahgki8e6dMOggVVDCSg/uLSOA=;
        b=bUwLY9RKuZz3FeP/vtAdi/CXZkDOZ/x7Y+5A5/6bU0dpWyrJJZrGJ20VvICgNz3y1n
         QaAHhGsWR8982seMurOnwC3Ardrb/e6ak0g3oUmvqJsM6jHb/gxt1cLB9d2gROH4kKcp
         mGag5XLTDTJ26bnwtdfTR7gcNgFfLw0/zFwq+lnnWXhxTRtvnMP5LIblxl1rbR68jp9K
         Mr4VPwoG/sZJ1qqIMHvAsVUS37faPJDj344sFD4Q8iMjGtF7ytAv4R7yIHorZ2WEht/u
         c7gP1oqAnzeNwkIvHUBel28ok9FomB5115bbBoRF780pUUSG9tqyzMZh9gNizTofvbgN
         67SA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YhSqZbH8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b1si21537211ioj.56.2021.03.03.10.31.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 10:31:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YhSqZbH8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHWHN-0001Bd-Iu
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 13:31:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWAR-0007nF-Br
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 13:24:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWAN-0000yT-PY
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 13:24:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614795851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aZTO3x/pXi2BQffGU8Ahgki8e6dMOggVVDCSg/uLSOA=;
 b=YhSqZbH8z2E6HNjmt6nBUEvGfUa2Zts35EaRas2YBmcPCEO2j+Y1DFI67jaw2Ne86m+LA7
 PjT92yGSAUQKIHmfJPYhFVI0wyOru6LPRgk72XqyhIdzuQfJzZ1XHUfYng4QOw8J9KCJas
 AeBKrjCeKDtJD6wxfi8W7A2+n1zPb7U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-yWwsvlK-NCC2fq-gRcIrRw-1; Wed, 03 Mar 2021 13:24:09 -0500
X-MC-Unique: yWwsvlK-NCC2fq-gRcIrRw-1
Received: by mail-wr1-f71.google.com with SMTP id z6so4440831wrh.11
 for <qemu-arm@nongnu.org>; Wed, 03 Mar 2021 10:24:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aZTO3x/pXi2BQffGU8Ahgki8e6dMOggVVDCSg/uLSOA=;
 b=GmlV/oBn2BdS1dZn56e4Ovug4eS6IQ3TJdH64eoC2QJj3YJm0rMijMlcRNSq8jrJnf
 Z4kG7vLRtHmCAOPhEcd/FtHNUXMibEQlIUhqGsyQ2LxQRtR49c9tr6YZZIT2yvRa1zwx
 WUhgqymcFZQ4SFdJ2BUzmst7LU8QR9Yz4HCCDMZ5Iy7Jw2rJSZ5Ll3TLL1Y7fgo6il7K
 bq08rBox7kGGjDjdmb3FVxcisadkWTK6wWlexKkFktSoS/6DDYg/vA7KEnZasLYBpoHn
 ynN50DoNS2oJTqRnkiNlO5/A53h92d4aZO7omr5cuubu1brGx29/pUPLCMfk7svhCxbA
 D0Dw==
X-Gm-Message-State: AOAM531H9EdfstIbt64bq1jmKmmN4uRUjpgxuvec9N9OVYQabp35sTgS
 cuaVdqBr/zg0MRQvO4B+81d/OtnznZgxmVQk6Acm/a7saPWN41Ctp1PjABqoX2xXq3SjI5WgjYF
 o8mrsYu4Dwpfw
X-Received: by 2002:adf:e482:: with SMTP id i2mr28326982wrm.392.1614795847467; 
 Wed, 03 Mar 2021 10:24:07 -0800 (PST)
X-Received: by 2002:adf:e482:: with SMTP id i2mr28326953wrm.392.1614795847187; 
 Wed, 03 Mar 2021 10:24:07 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h19sm6328046wmq.47.2021.03.03.10.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:24:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 16/19] accel/kvm: Move the 'kvm_run' field to
 AccelvCPUState
Date: Wed,  3 Mar 2021 19:22:16 +0100
Message-Id: <20210303182219.1631042-17-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303182219.1631042-1-philmd@redhat.com>
References: <20210303182219.1631042-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IFtU0JMHap5t

Patch created mechanically using:

  $ sed -i 's/->kvm_run/->accel_vcpu->kvm_run/' $(git grep -l kvm_run)

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/core/cpu.h    |  1 -
 include/sysemu/kvm_int.h |  1 +
 accel/kvm/kvm-all.c      | 16 ++++++++--------
 hw/s390x/pv.c            |  3 ++-
 target/i386/kvm/kvm.c    |  2 +-
 target/s390x/kvm.c       | 19 ++++++++++---------
 6 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 4f280509f9b..3268f1393f1 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -415,7 +415,6 @@ struct CPUState {
 
     /* Accelerator-specific fields. */
     struct AccelvCPUState *accel_vcpu;
-    struct kvm_run *kvm_run;
     int hvf_fd;
     /* shared by kvm, hax and hvf */
     bool vcpu_dirty;
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index dc45b3c3afa..b83264847aa 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -19,6 +19,7 @@ struct AccelvCPUState {
      */
     int kvm_fd;
     struct KVMState *kvm_state;
+    struct kvm_run *kvm_run;
 };
 
 typedef struct KVMSlot
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 737db3d3e0e..69df35497d2 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -380,7 +380,7 @@ static int do_kvm_destroy_vcpu(CPUState *cpu)
         goto err;
     }
 
-    ret = munmap(cpu->kvm_run, mmap_size);
+    ret = munmap(cpu->accel_vcpu->kvm_run, mmap_size);
     if (ret < 0) {
         goto err;
     }
@@ -448,9 +448,9 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
         goto err;
     }
 
-    cpu->kvm_run = mmap(NULL, mmap_size, PROT_READ | PROT_WRITE, MAP_SHARED,
-                        cpu->accel_vcpu->kvm_fd, 0);
-    if (cpu->kvm_run == MAP_FAILED) {
+    cpu->accel_vcpu->kvm_run = mmap(NULL, mmap_size, PROT_READ | PROT_WRITE,
+                                    MAP_SHARED, cpu->accel_vcpu->kvm_fd, 0);
+    if (cpu->accel_vcpu->kvm_run == MAP_FAILED) {
         ret = -errno;
         error_setg_errno(errp, ret,
                          "kvm_init_vcpu: mmap'ing vcpu state failed (%lu)",
@@ -460,7 +460,7 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
 
     if (s->coalesced_mmio && !s->coalesced_mmio_ring) {
         s->coalesced_mmio_ring =
-            (void *)cpu->kvm_run + s->coalesced_mmio * PAGE_SIZE;
+            (void *)cpu->accel_vcpu->kvm_run + s->coalesced_mmio * PAGE_SIZE;
     }
 
     ret = kvm_arch_init_vcpu(cpu);
@@ -2382,7 +2382,7 @@ static __thread bool have_sigbus_pending;
 
 static void kvm_cpu_kick(CPUState *cpu)
 {
-    qatomic_set(&cpu->kvm_run->immediate_exit, 1);
+    qatomic_set(&cpu->accel_vcpu->kvm_run->immediate_exit, 1);
 }
 
 static void kvm_cpu_kick_self(void)
@@ -2403,7 +2403,7 @@ static void kvm_eat_signals(CPUState *cpu)
     int r;
 
     if (kvm_immediate_exit) {
-        qatomic_set(&cpu->kvm_run->immediate_exit, 0);
+        qatomic_set(&cpu->accel_vcpu->kvm_run->immediate_exit, 0);
         /* Write kvm_run->immediate_exit before the cpu->exit_request
          * write in kvm_cpu_exec.
          */
@@ -2431,7 +2431,7 @@ static void kvm_eat_signals(CPUState *cpu)
 
 int kvm_cpu_exec(CPUState *cpu)
 {
-    struct kvm_run *run = cpu->kvm_run;
+    struct kvm_run *run = cpu->accel_vcpu->kvm_run;
     int ret, run_ret;
 
     DPRINTF("kvm_cpu_exec()\n");
diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
index 93eccfc05d5..061c92fc4e3 100644
--- a/hw/s390x/pv.c
+++ b/hw/s390x/pv.c
@@ -17,6 +17,7 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
+#include "sysemu/kvm_int.h"
 #include "qom/object_interfaces.h"
 #include "exec/confidential-guest-support.h"
 #include "hw/s390x/ipl.h"
@@ -108,7 +109,7 @@ void s390_pv_unshare(void)
 
 void s390_pv_inject_reset_error(CPUState *cs)
 {
-    int r1 = (cs->kvm_run->s390_sieic.ipa & 0x00f0) >> 4;
+    int r1 = (cs->accel_vcpu->kvm_run->s390_sieic.ipa & 0x00f0) >> 4;
     CPUS390XState *env = &S390_CPU(cs)->env;
 
     /* Report that we are unable to enter protected mode */
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index b2facf4f7c1..c0ccaf6b06a 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -4329,7 +4329,7 @@ static int kvm_handle_halt(X86CPU *cpu)
 static int kvm_handle_tpr_access(X86CPU *cpu)
 {
     CPUState *cs = CPU(cpu);
-    struct kvm_run *run = cs->kvm_run;
+    struct kvm_run *run = cs->accel_vcpu->kvm_run;
 
     apic_handle_tpr_access_report(cpu->apic_state, run->tpr_access.rip,
                                   run->tpr_access.is_write ? TPR_ACCESS_WRITE
diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index cf6790b2678..7968b10fa52 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -460,14 +460,15 @@ void kvm_s390_reset_vcpu_normal(S390CPU *cpu)
 
 static int can_sync_regs(CPUState *cs, int regs)
 {
-    return cap_sync_regs && (cs->kvm_run->kvm_valid_regs & regs) == regs;
+    return cap_sync_regs
+           && (cs->accel_vcpu->kvm_run->kvm_valid_regs & regs) == regs;
 }
 
 int kvm_arch_put_registers(CPUState *cs, int level)
 {
     S390CPU *cpu = S390_CPU(cs);
     CPUS390XState *env = &cpu->env;
-    struct kvm_run *run = cs->kvm_run;
+    struct kvm_run *run = cs->accel_vcpu->kvm_run;
     struct kvm_sregs sregs;
     struct kvm_regs regs;
     struct kvm_fpu fpu = {};
@@ -624,7 +625,7 @@ int kvm_arch_get_registers(CPUState *cs)
 {
     S390CPU *cpu = S390_CPU(cs);
     CPUS390XState *env = &cpu->env;
-    struct kvm_run *run = cs->kvm_run;
+    struct kvm_run *run = cs->accel_vcpu->kvm_run;
     struct kvm_sregs sregs;
     struct kvm_regs regs;
     struct kvm_fpu fpu;
@@ -1621,8 +1622,8 @@ void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info)
     /* Feat bit is set only if KVM supports sync for diag318 */
     if (s390_has_feat(S390_FEAT_DIAG_318)) {
         env->diag318_info = diag318_info;
-        cs->kvm_run->s.regs.diag318 = diag318_info;
-        cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
+        cs->accel_vcpu->kvm_run->s.regs.diag318 = diag318_info;
+        cs->accel_vcpu->kvm_run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
     }
 }
 
@@ -1783,7 +1784,7 @@ static int handle_oper_loop(S390CPU *cpu, struct kvm_run *run)
 static int handle_intercept(S390CPU *cpu)
 {
     CPUState *cs = CPU(cpu);
-    struct kvm_run *run = cs->kvm_run;
+    struct kvm_run *run = cs->accel_vcpu->kvm_run;
     int icpt_code = run->s390_sieic.icptcode;
     int r = 0;
 
@@ -1844,7 +1845,7 @@ static int handle_intercept(S390CPU *cpu)
 static int handle_tsch(S390CPU *cpu)
 {
     CPUState *cs = CPU(cpu);
-    struct kvm_run *run = cs->kvm_run;
+    struct kvm_run *run = cs->accel_vcpu->kvm_run;
     int ret;
 
     ret = ioinst_handle_tsch(cpu, cpu->env.regs[1], run->s390_tsch.ipb,
@@ -1934,7 +1935,7 @@ static void insert_stsi_3_2_2(S390CPU *cpu, __u64 addr, uint8_t ar)
 static int handle_stsi(S390CPU *cpu)
 {
     CPUState *cs = CPU(cpu);
-    struct kvm_run *run = cs->kvm_run;
+    struct kvm_run *run = cs->accel_vcpu->kvm_run;
 
     switch (run->s390_stsi.fc) {
     case 3:
@@ -1952,7 +1953,7 @@ static int handle_stsi(S390CPU *cpu)
 static int kvm_arch_handle_debug_exit(S390CPU *cpu)
 {
     CPUState *cs = CPU(cpu);
-    struct kvm_run *run = cs->kvm_run;
+    struct kvm_run *run = cs->accel_vcpu->kvm_run;
 
     int ret = 0;
     struct kvm_debug_exit_arch *arch_info = &run->debug.arch;
-- 
2.26.2

