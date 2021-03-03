Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5580584lfg;
        Wed, 3 Mar 2021 10:27:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyAlLTgOz/z0+0AtGXCoAovnVIVMcCR3bt898hqXkirlh9f9gnlgmZ0czoAwL1pyMJFAC7B
X-Received: by 2002:a6b:e20a:: with SMTP id z10mr371116ioc.99.1614796061987;
        Wed, 03 Mar 2021 10:27:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614796061; cv=none;
        d=google.com; s=arc-20160816;
        b=IxW//09ut1Kvk8tN+VxEp5RXEs1fpSB9l4Y3Pg9sDm5n7vJ17cHOHfsPEgoLG/jNrs
         FKnHxhph52Kf3nqfVgCD0I/l14NQQAvg+HBsMFH6RbPJcbe+Fo12F5l8fTuUrHYHf7iC
         VWt5m3AeSvf+eg+g0OP6xGQwsV83el3U+EaMXpvANeXgfeflp1KuHuHRoSFs5Ze1EmLT
         q0JsxPzmTpD5P9+00XR05pc2sskUM/CnayLRdvBaD/I/ee+ke+sLvBmDtiESdD4F9XUZ
         Yj2vCJ7f0ho4sFeQBY2MjK/vVRTgCJ4tlYQIXsOB0YiScfVcxdbnEPvE2Gc2ksQIpW0D
         /vWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dPrv/DkAiyl42NA4omCqrPAwJ/Yioej+8U34dhimaag=;
        b=lvqhMDkG+m3YZe8p9NeFY/sclzJjJmSn+bevo/xKUofZuffQNofCf4nm1H7jpsO9gL
         0+ScnFKrzoPvKIDPl21HfTKB6g0FFhW0KYooO3jfhW0VcMg6WWwekezRKB87oKVsTKIC
         CafHeKa2Ed5qYpt6xsK50QDrfCGqrz5fLCmVxKyYlvO/Wm4yl4/8RhGb5dbsGoDPMRGS
         xnMZ9tP5nmZBSKxfcUEeNIuH8iiBuM0nFb9BJCCO/alYH4aINncukY5wOxtM8Wn50ulB
         eMI3281c9/Uq3PTtQk3CuJ/pWX0bUROVVnU+RvEHo853wRcAs5JKzIm0in/c6C0mh/kO
         R93w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WdfU1F+s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b13si22668627ils.23.2021.03.03.10.27.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 10:27:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WdfU1F+s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHWDl-0004g8-8P
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 13:27:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW92-00054i-Ae
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 13:22:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHW8z-0000Ta-OX
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 13:22:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614795765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dPrv/DkAiyl42NA4omCqrPAwJ/Yioej+8U34dhimaag=;
 b=WdfU1F+sc+AJUvkIVOrFE2VtpXuJp9YS2MyKDOnDZFIZH2cIqBspe01N3WNtBr57KpxIrs
 2Es02vu6Ci37qzPaq0EeLXBaVfxyspYUhoBgC/FmcHDYUqdXl3lRU26NeRoD0QkF5hqtlN
 RW9Xnk+FtlNJDyKYvP7VQjEzxEGlRsI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-ZtxeN_QQPpi9reMWeJaCkw-1; Wed, 03 Mar 2021 13:22:41 -0500
X-MC-Unique: ZtxeN_QQPpi9reMWeJaCkw-1
Received: by mail-wr1-f71.google.com with SMTP id 75so815548wrl.3
 for <qemu-arm@nongnu.org>; Wed, 03 Mar 2021 10:22:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dPrv/DkAiyl42NA4omCqrPAwJ/Yioej+8U34dhimaag=;
 b=PmaTrgpTYptVgyXWlNPRwfXjfDd59wpedUwn5o7RYvhe4xUxA35H6OW8sJm/yPHPXk
 l3Sr1jVBgT6rMlLbQLgOvAR+6KfzPvTvVNQW4LWmzKPujpMI9IgAJjh+YX5ClSiZzmrH
 UwAR74O3i0W9XB9ppC44qT+VEWEKGXMsJrupGdWU2XM1wm9QpXSVEvd5rjbHxHv5NDV8
 kOAdVtVXdK9Ca+aLg7ragdgPDrLlTEy8eOEBsBPzLwllA9/wMkm3k6GR82JHlJNxOruk
 7NOpXVKLxucbVPIeMxu+Pw7H8XOY7TQUUWe55m3Ya8h2Eo85Pgl2MiLJFZ9GZxqaccfS
 kC6A==
X-Gm-Message-State: AOAM5314lX6KZMCOKm4QVhAdfkEx5bWNrEQr4RmK1+MPc2q9M2lx2gJK
 6TNWYxAqB2ocJFcal8JAe737lacxJQfVkrvpTII6gMj55Ox9fj/+P+iVW5r4Zb/kozh2ECNsE72
 jtgd+6GVp8LkC
X-Received: by 2002:a05:600c:35c1:: with SMTP id
 r1mr240937wmq.143.1614795759921; 
 Wed, 03 Mar 2021 10:22:39 -0800 (PST)
X-Received: by 2002:a05:600c:35c1:: with SMTP id
 r1mr240887wmq.143.1614795759484; 
 Wed, 03 Mar 2021 10:22:39 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s3sm13959189wrt.93.2021.03.03.10.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:22:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/19] target/s390x/kvm: Reduce deref by declaring 'struct
 kvm_run' on stack
Date: Wed,  3 Mar 2021 19:22:03 +0100
Message-Id: <20210303182219.1631042-4-philmd@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: mtbNi+Gbw8UI

In order to make one of the next commits easier to review,
declare 'struct kvm_run' on the stack when it is used in
various places in a function.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/s390x/kvm.c | 128 +++++++++++++++++++++++----------------------
 1 file changed, 65 insertions(+), 63 deletions(-)

diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index 73f816a7222..d8ac12dfc11 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -467,6 +467,7 @@ int kvm_arch_put_registers(CPUState *cs, int level)
 {
     S390CPU *cpu = S390_CPU(cs);
     CPUS390XState *env = &cpu->env;
+    struct kvm_run *run = cs->kvm_run;
     struct kvm_sregs sregs;
     struct kvm_regs regs;
     struct kvm_fpu fpu = {};
@@ -474,13 +475,13 @@ int kvm_arch_put_registers(CPUState *cs, int level)
     int i;
 
     /* always save the PSW  and the GPRS*/
-    cs->kvm_run->psw_addr = env->psw.addr;
-    cs->kvm_run->psw_mask = env->psw.mask;
+    run->psw_addr = env->psw.addr;
+    run->psw_mask = env->psw.mask;
 
     if (can_sync_regs(cs, KVM_SYNC_GPRS)) {
         for (i = 0; i < 16; i++) {
-            cs->kvm_run->s.regs.gprs[i] = env->regs[i];
-            cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_GPRS;
+            run->s.regs.gprs[i] = env->regs[i];
+            run->kvm_dirty_regs |= KVM_SYNC_GPRS;
         }
     } else {
         for (i = 0; i < 16; i++) {
@@ -494,17 +495,17 @@ int kvm_arch_put_registers(CPUState *cs, int level)
 
     if (can_sync_regs(cs, KVM_SYNC_VRS)) {
         for (i = 0; i < 32; i++) {
-            cs->kvm_run->s.regs.vrs[i][0] = env->vregs[i][0];
-            cs->kvm_run->s.regs.vrs[i][1] = env->vregs[i][1];
+            run->s.regs.vrs[i][0] = env->vregs[i][0];
+            run->s.regs.vrs[i][1] = env->vregs[i][1];
         }
-        cs->kvm_run->s.regs.fpc = env->fpc;
-        cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_VRS;
+        run->s.regs.fpc = env->fpc;
+        run->kvm_dirty_regs |= KVM_SYNC_VRS;
     } else if (can_sync_regs(cs, KVM_SYNC_FPRS)) {
         for (i = 0; i < 16; i++) {
-            cs->kvm_run->s.regs.fprs[i] = *get_freg(env, i);
+            run->s.regs.fprs[i] = *get_freg(env, i);
         }
-        cs->kvm_run->s.regs.fpc = env->fpc;
-        cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_FPRS;
+        run->s.regs.fpc = env->fpc;
+        run->kvm_dirty_regs |= KVM_SYNC_FPRS;
     } else {
         /* Floating point */
         for (i = 0; i < 16; i++) {
@@ -524,12 +525,12 @@ int kvm_arch_put_registers(CPUState *cs, int level)
     }
 
     if (can_sync_regs(cs, KVM_SYNC_ARCH0)) {
-        cs->kvm_run->s.regs.cputm = env->cputm;
-        cs->kvm_run->s.regs.ckc = env->ckc;
-        cs->kvm_run->s.regs.todpr = env->todpr;
-        cs->kvm_run->s.regs.gbea = env->gbea;
-        cs->kvm_run->s.regs.pp = env->pp;
-        cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_ARCH0;
+        run->s.regs.cputm = env->cputm;
+        run->s.regs.ckc = env->ckc;
+        run->s.regs.todpr = env->todpr;
+        run->s.regs.gbea = env->gbea;
+        run->s.regs.pp = env->pp;
+        run->kvm_dirty_regs |= KVM_SYNC_ARCH0;
     } else {
         /*
          * These ONE_REGS are not protected by a capability. As they are only
@@ -544,16 +545,16 @@ int kvm_arch_put_registers(CPUState *cs, int level)
     }
 
     if (can_sync_regs(cs, KVM_SYNC_RICCB)) {
-        memcpy(cs->kvm_run->s.regs.riccb, env->riccb, 64);
-        cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_RICCB;
+        memcpy(run->s.regs.riccb, env->riccb, 64);
+        run->kvm_dirty_regs |= KVM_SYNC_RICCB;
     }
 
     /* pfault parameters */
     if (can_sync_regs(cs, KVM_SYNC_PFAULT)) {
-        cs->kvm_run->s.regs.pft = env->pfault_token;
-        cs->kvm_run->s.regs.pfs = env->pfault_select;
-        cs->kvm_run->s.regs.pfc = env->pfault_compare;
-        cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_PFAULT;
+        run->s.regs.pft = env->pfault_token;
+        run->s.regs.pfs = env->pfault_select;
+        run->s.regs.pfc = env->pfault_compare;
+        run->kvm_dirty_regs |= KVM_SYNC_PFAULT;
     } else if (cap_async_pf) {
         r = kvm_set_one_reg(cs, KVM_REG_S390_PFTOKEN, &env->pfault_token);
         if (r < 0) {
@@ -572,11 +573,11 @@ int kvm_arch_put_registers(CPUState *cs, int level)
     /* access registers and control registers*/
     if (can_sync_regs(cs, KVM_SYNC_ACRS | KVM_SYNC_CRS)) {
         for (i = 0; i < 16; i++) {
-            cs->kvm_run->s.regs.acrs[i] = env->aregs[i];
-            cs->kvm_run->s.regs.crs[i] = env->cregs[i];
+            run->s.regs.acrs[i] = env->aregs[i];
+            run->s.regs.crs[i] = env->cregs[i];
         }
-        cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_ACRS;
-        cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_CRS;
+        run->kvm_dirty_regs |= KVM_SYNC_ACRS;
+        run->kvm_dirty_regs |= KVM_SYNC_CRS;
     } else {
         for (i = 0; i < 16; i++) {
             sregs.acrs[i] = env->aregs[i];
@@ -589,30 +590,30 @@ int kvm_arch_put_registers(CPUState *cs, int level)
     }
 
     if (can_sync_regs(cs, KVM_SYNC_GSCB)) {
-        memcpy(cs->kvm_run->s.regs.gscb, env->gscb, 32);
-        cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_GSCB;
+        memcpy(run->s.regs.gscb, env->gscb, 32);
+        run->kvm_dirty_regs |= KVM_SYNC_GSCB;
     }
 
     if (can_sync_regs(cs, KVM_SYNC_BPBC)) {
-        cs->kvm_run->s.regs.bpbc = env->bpbc;
-        cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_BPBC;
+        run->s.regs.bpbc = env->bpbc;
+        run->kvm_dirty_regs |= KVM_SYNC_BPBC;
     }
 
     if (can_sync_regs(cs, KVM_SYNC_ETOKEN)) {
-        cs->kvm_run->s.regs.etoken = env->etoken;
-        cs->kvm_run->s.regs.etoken_extension  = env->etoken_extension;
-        cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_ETOKEN;
+        run->s.regs.etoken = env->etoken;
+        run->s.regs.etoken_extension  = env->etoken_extension;
+        run->kvm_dirty_regs |= KVM_SYNC_ETOKEN;
     }
 
     if (can_sync_regs(cs, KVM_SYNC_DIAG318)) {
-        cs->kvm_run->s.regs.diag318 = env->diag318_info;
-        cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
+        run->s.regs.diag318 = env->diag318_info;
+        run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
     }
 
     /* Finally the prefix */
     if (can_sync_regs(cs, KVM_SYNC_PREFIX)) {
-        cs->kvm_run->s.regs.prefix = env->psa;
-        cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_PREFIX;
+        run->s.regs.prefix = env->psa;
+        run->kvm_dirty_regs |= KVM_SYNC_PREFIX;
     } else {
         /* prefix is only supported via sync regs */
     }
@@ -623,19 +624,20 @@ int kvm_arch_get_registers(CPUState *cs)
 {
     S390CPU *cpu = S390_CPU(cs);
     CPUS390XState *env = &cpu->env;
+    struct kvm_run *run = cs->kvm_run;
     struct kvm_sregs sregs;
     struct kvm_regs regs;
     struct kvm_fpu fpu;
     int i, r;
 
     /* get the PSW */
-    env->psw.addr = cs->kvm_run->psw_addr;
-    env->psw.mask = cs->kvm_run->psw_mask;
+    env->psw.addr = run->psw_addr;
+    env->psw.mask = run->psw_mask;
 
     /* the GPRS */
     if (can_sync_regs(cs, KVM_SYNC_GPRS)) {
         for (i = 0; i < 16; i++) {
-            env->regs[i] = cs->kvm_run->s.regs.gprs[i];
+            env->regs[i] = run->s.regs.gprs[i];
         }
     } else {
         r = kvm_vcpu_ioctl(cs, KVM_GET_REGS, &regs);
@@ -650,8 +652,8 @@ int kvm_arch_get_registers(CPUState *cs)
     /* The ACRS and CRS */
     if (can_sync_regs(cs, KVM_SYNC_ACRS | KVM_SYNC_CRS)) {
         for (i = 0; i < 16; i++) {
-            env->aregs[i] = cs->kvm_run->s.regs.acrs[i];
-            env->cregs[i] = cs->kvm_run->s.regs.crs[i];
+            env->aregs[i] = run->s.regs.acrs[i];
+            env->cregs[i] = run->s.regs.crs[i];
         }
     } else {
         r = kvm_vcpu_ioctl(cs, KVM_GET_SREGS, &sregs);
@@ -667,15 +669,15 @@ int kvm_arch_get_registers(CPUState *cs)
     /* Floating point and vector registers */
     if (can_sync_regs(cs, KVM_SYNC_VRS)) {
         for (i = 0; i < 32; i++) {
-            env->vregs[i][0] = cs->kvm_run->s.regs.vrs[i][0];
-            env->vregs[i][1] = cs->kvm_run->s.regs.vrs[i][1];
+            env->vregs[i][0] = run->s.regs.vrs[i][0];
+            env->vregs[i][1] = run->s.regs.vrs[i][1];
         }
-        env->fpc = cs->kvm_run->s.regs.fpc;
+        env->fpc = run->s.regs.fpc;
     } else if (can_sync_regs(cs, KVM_SYNC_FPRS)) {
         for (i = 0; i < 16; i++) {
-            *get_freg(env, i) = cs->kvm_run->s.regs.fprs[i];
+            *get_freg(env, i) = run->s.regs.fprs[i];
         }
-        env->fpc = cs->kvm_run->s.regs.fpc;
+        env->fpc = run->s.regs.fpc;
     } else {
         r = kvm_vcpu_ioctl(cs, KVM_GET_FPU, &fpu);
         if (r < 0) {
@@ -689,15 +691,15 @@ int kvm_arch_get_registers(CPUState *cs)
 
     /* The prefix */
     if (can_sync_regs(cs, KVM_SYNC_PREFIX)) {
-        env->psa = cs->kvm_run->s.regs.prefix;
+        env->psa = run->s.regs.prefix;
     }
 
     if (can_sync_regs(cs, KVM_SYNC_ARCH0)) {
-        env->cputm = cs->kvm_run->s.regs.cputm;
-        env->ckc = cs->kvm_run->s.regs.ckc;
-        env->todpr = cs->kvm_run->s.regs.todpr;
-        env->gbea = cs->kvm_run->s.regs.gbea;
-        env->pp = cs->kvm_run->s.regs.pp;
+        env->cputm = run->s.regs.cputm;
+        env->ckc = run->s.regs.ckc;
+        env->todpr = run->s.regs.todpr;
+        env->gbea = run->s.regs.gbea;
+        env->pp = run->s.regs.pp;
     } else {
         /*
          * These ONE_REGS are not protected by a capability. As they are only
@@ -712,27 +714,27 @@ int kvm_arch_get_registers(CPUState *cs)
     }
 
     if (can_sync_regs(cs, KVM_SYNC_RICCB)) {
-        memcpy(env->riccb, cs->kvm_run->s.regs.riccb, 64);
+        memcpy(env->riccb, run->s.regs.riccb, 64);
     }
 
     if (can_sync_regs(cs, KVM_SYNC_GSCB)) {
-        memcpy(env->gscb, cs->kvm_run->s.regs.gscb, 32);
+        memcpy(env->gscb, run->s.regs.gscb, 32);
     }
 
     if (can_sync_regs(cs, KVM_SYNC_BPBC)) {
-        env->bpbc = cs->kvm_run->s.regs.bpbc;
+        env->bpbc = run->s.regs.bpbc;
     }
 
     if (can_sync_regs(cs, KVM_SYNC_ETOKEN)) {
-        env->etoken = cs->kvm_run->s.regs.etoken;
-        env->etoken_extension = cs->kvm_run->s.regs.etoken_extension;
+        env->etoken = run->s.regs.etoken;
+        env->etoken_extension = run->s.regs.etoken_extension;
     }
 
     /* pfault parameters */
     if (can_sync_regs(cs, KVM_SYNC_PFAULT)) {
-        env->pfault_token = cs->kvm_run->s.regs.pft;
-        env->pfault_select = cs->kvm_run->s.regs.pfs;
-        env->pfault_compare = cs->kvm_run->s.regs.pfc;
+        env->pfault_token = run->s.regs.pft;
+        env->pfault_select = run->s.regs.pfs;
+        env->pfault_compare = run->s.regs.pfc;
     } else if (cap_async_pf) {
         r = kvm_get_one_reg(cs, KVM_REG_S390_PFTOKEN, &env->pfault_token);
         if (r < 0) {
@@ -749,7 +751,7 @@ int kvm_arch_get_registers(CPUState *cs)
     }
 
     if (can_sync_regs(cs, KVM_SYNC_DIAG318)) {
-        env->diag318_info = cs->kvm_run->s.regs.diag318;
+        env->diag318_info = run->s.regs.diag318;
     }
 
     return 0;
-- 
2.26.2

