Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp2978445ejb;
        Tue, 30 Apr 2024 07:01:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXVCxZ3I4dP/xtHFjNmDtNkPrDfTXXz2IFs2l3jlMiR1ptj8cjs0/CyX6zy8kQotTN+/Qyz7GzkNFe6zIGULYtzN8zNNKLo
X-Google-Smtp-Source: AGHT+IEDaPX7Lf6xqRaHsy/6bC2uyl61+DgQ7WPSGNx6HRLvvQ2nradGqasIn/4lbG98YSeyECbq
X-Received: by 2002:a05:690c:9e:b0:617:d8a7:df60 with SMTP id be30-20020a05690c009e00b00617d8a7df60mr14474697ywb.40.1714485719590;
        Tue, 30 Apr 2024 07:01:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714485719; cv=none;
        d=google.com; s=arc-20160816;
        b=k5iY8UZxAkBoe5NWLNELwWh++jXa0fg+CDsEWRU+yG5iSZIOIDuBdLaASTdjHE1oN9
         JXyV3Hwg4kpCNUwt+GZ1g18Y3JcQ9jUez8Fzu+N9f/hmT+WHcTQ65E+11Y06qxoF8bl0
         PHGLm0uuFF4eOqgZmMLJyqgcEjC+pUy645AxYSzPvSgIDmjWnth1DJcDG0ePLps3A7kA
         dv868U5t5SWbyyyBE68mDvsUcAPH9afWY2MiO/VQj7J5UlX6XHByZAr6GHNNrNTJSpZq
         +9BIsCx17eoyL+NHfTNUQHIy3dShBpGJzGmCtxS70iaF8DEFVpqtPkp5tJwK5qLkjgDz
         qigA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pdw4e1T+XOnjRYbe6abw8/6ufHXzK4jmHY6mtjifRb8=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=qp+30mAmtJDRX70814E3+zy4NNbG8PHbyOHgLU6tcCelkGoHTLGRdW7S4Xep7hl4FH
         C9kPnEwhj42qIGXWfVj9cioWMFmZaPbXYPuGFRh0aEXik2g8XOR4EjPvK8lS3k0/vrCb
         kAGXMSi4AmY5pxZ/m/iVRfvMUpaQOXL9LCb1j1FmYHad9BF6WkONFKWijJHJBoNLq9aF
         VKRGwC6Eeg6fd9v3FoS1hM5uAO8R8DWsr2ygNuAbIv1pRvGpRvcsZZB3zwlwbOZgh988
         gCEUUfhM8pkQJ2bIjtVBEwKpgTp4rHHYIB4AKtOVX9zrGlg9J5UNeLYQ2N9okY0AFENi
         SopA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=COx0NkUK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bh26-20020a05690c039a00b0061451a5be73si15198236ywb.5.2024.04.30.07.01.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Apr 2024 07:01:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=COx0NkUK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s1o2f-0002e6-Bc; Tue, 30 Apr 2024 10:01:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s1o2P-0002YM-6Y
 for qemu-arm@nongnu.org; Tue, 30 Apr 2024 10:01:04 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s1o2M-0002uE-N4
 for qemu-arm@nongnu.org; Tue, 30 Apr 2024 10:00:52 -0400
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d8b2389e73so68931051fa.3
 for <qemu-arm@nongnu.org>; Tue, 30 Apr 2024 07:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714485649; x=1715090449; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pdw4e1T+XOnjRYbe6abw8/6ufHXzK4jmHY6mtjifRb8=;
 b=COx0NkUKj6lNJihspMIjN8j+xzj7zsugmcVCAO++jt7IcUNHfCUBJDIkQHBJ512o/B
 oIZRL33quWqdEwO6FQf+gp6yV9am0IwyucIedOefLzxzTZGKcc5iXQMDwGQoULYfN6OX
 OTWkvuBBQBzUYs/7w/ye/ytXk2fl2vN9hq5ts10qRcqUPqmHIVKSsH61vxNxWb3PM9hx
 cSS83+/t/H6RfheAaoHw+dfYinfJlxJtfAjnNI6AMVhyxm2NDErdYkYuILCfzOhuR5gq
 HREh2J8+BlOLTM48TS6r8m3BVXVJ/0VGgn2VwgzJnmjKMuRSzuzO+8Qeo/EwdicxGxdS
 YCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714485649; x=1715090449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pdw4e1T+XOnjRYbe6abw8/6ufHXzK4jmHY6mtjifRb8=;
 b=wdaYJfTACgD40eeTj19k5gVqMro9GdS0GXM6qkE61J48V5OtZRlkETjfRwT8MuTfbv
 1fE/izGC78k4C6wrpQ8qCl0DxI7cSBYY55QwLTbyJHCbjq1zOtrE3PEOvSdBBVDZ+7Nn
 R9TuBQSLJ1/nupCZN2gvBaM57fSrCufpf+QYxqeq/VD8+p8InB+bzDnTBnjpKzc01Ikc
 m5uBDiomvFtSpLLvYUdjnVrlUI9y5XleTXqhNHehucLm1WFHBW81ScrJBOy1Cwn081M1
 avYCTgKjEq1yVimbrN+9fPAgSZ0uvWSnEexeFgB6fGEFHk0ugDY/EmT0neCXtTW9fBGq
 6npA==
X-Gm-Message-State: AOJu0YyDjrjzKe2Ryb+svkpt+vBJi/+nVsgbJM97K14GIq0wIhuCneJ1
 E9j6tk57t4MLmuohGotW2zPp2YXeHO6Qz24SaQernAGiCbiX26aB+GfAwDCQetnWCL7DQfwVLCl
 p
X-Received: by 2002:a2e:8750:0:b0:2de:25e2:6187 with SMTP id
 q16-20020a2e8750000000b002de25e26187mr1967189ljj.23.1714485639231; 
 Tue, 30 Apr 2024 07:00:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a05600c470a00b0041bfa349cadsm11062705wmo.16.2024.04.30.07.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 07:00:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] accel/tcg: Make TCGCPUOps::cpu_exec_halt return bool for
 whether to halt
Date: Tue, 30 Apr 2024 15:00:34 +0100
Message-Id: <20240430140035.3889879-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240430140035.3889879-1-peter.maydell@linaro.org>
References: <20240430140035.3889879-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +SjLjWAGfD5W

The TCGCPUOps::cpu_exec_halt method is called from cpu_handle_halt()
when the CPU is halted, so that a target CPU emulation can do
anything target-specific it needs to do.  (At the moment we only use
this on i386.)

The current specification of the method doesn't allow the target
specific code to do something different if the CPU is about to come
out of the halt state, because cpu_handle_halt() only determines this
after the method has returned.  (If the method called cpu_has_work()
itself this would introduce a potential race if an interrupt arrived
between the target's method implementation checking and
cpu_handle_halt() repeating the check.)

Change the definition of the method so that it returns a bool to
tell cpu_handle_halt() whether to stay in halt or not.

We will want this for the Arm target, where FEAT_WFxT wants to do
some work only for the case where the CPU is in halt but about to
leave it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h       | 11 +++++++++--
 target/i386/tcg/helper-tcg.h        |  2 +-
 accel/tcg/cpu-exec.c                |  7 +++++--
 target/i386/tcg/sysemu/seg_helper.c |  3 ++-
 4 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index dc1f16a9777..f3ac76e6f6d 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -111,8 +111,15 @@ struct TCGCPUOps {
     void (*do_interrupt)(CPUState *cpu);
     /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
     bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
-    /** @cpu_exec_halt: Callback for handling halt in cpu_exec */
-    void (*cpu_exec_halt)(CPUState *cpu);
+    /**
+     * @cpu_exec_halt: Callback for handling halt in cpu_exec.
+     *
+     * Return true to indicate that the CPU should now leave halt, false
+     * if it should remain in the halted state.
+     * If this method is not provided, the default is to leave halt
+     * if cpu_has_work() returns true.
+     */
+    bool (*cpu_exec_halt)(CPUState *cpu);
     /**
      * @tlb_fill: Handle a softmmu tlb miss
      *
diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index effc2c1c984..85957943bf3 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -39,7 +39,7 @@ QEMU_BUILD_BUG_ON(TCG_PHYS_ADDR_BITS > TARGET_PHYS_ADDR_SPACE_BITS);
  */
 void x86_cpu_do_interrupt(CPUState *cpu);
 #ifndef CONFIG_USER_ONLY
-void x86_cpu_exec_halt(CPUState *cpu);
+bool x86_cpu_exec_halt(CPUState *cpu);
 bool x86_need_replay_interrupt(int interrupt_request);
 bool x86_cpu_exec_interrupt(CPUState *cpu, int int_req);
 #endif
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5c70748060a..550f93b19ce 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -669,11 +669,14 @@ static inline bool cpu_handle_halt(CPUState *cpu)
 #ifndef CONFIG_USER_ONLY
     if (cpu->halted) {
         const TCGCPUOps *tcg_ops = cpu->cc->tcg_ops;
+        bool leave_halt;
 
         if (tcg_ops->cpu_exec_halt) {
-            tcg_ops->cpu_exec_halt(cpu);
+            leave_halt = tcg_ops->cpu_exec_halt(cpu);
+        } else {
+            leave_halt = cpu_has_work(cpu);
         }
-        if (!cpu_has_work(cpu)) {
+        if (!leave_halt) {
             return true;
         }
 
diff --git a/target/i386/tcg/sysemu/seg_helper.c b/target/i386/tcg/sysemu/seg_helper.c
index 2db8083748e..9ba94deb3aa 100644
--- a/target/i386/tcg/sysemu/seg_helper.c
+++ b/target/i386/tcg/sysemu/seg_helper.c
@@ -128,7 +128,7 @@ void x86_cpu_do_interrupt(CPUState *cs)
     }
 }
 
-void x86_cpu_exec_halt(CPUState *cpu)
+bool x86_cpu_exec_halt(CPUState *cpu)
 {
     if (cpu->interrupt_request & CPU_INTERRUPT_POLL) {
         X86CPU *x86_cpu = X86_CPU(cpu);
@@ -138,6 +138,7 @@ void x86_cpu_exec_halt(CPUState *cpu)
         cpu_reset_interrupt(cpu, CPU_INTERRUPT_POLL);
         bql_unlock();
     }
+    return cpu_has_work(cpu);
 }
 
 bool x86_need_replay_interrupt(int interrupt_request)
-- 
2.34.1

