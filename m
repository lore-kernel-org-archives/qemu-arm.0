Received: by 2002:a17:906:d8da:b0:98d:c41:35ab with SMTP id re26csp551776ejb;
        Thu, 22 Jun 2023 09:11:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ47k3s89v0rYQpC5VTmeouBQe9I0mRjrBsiT5asr8r40BZ00+jrai9m+PyqId/TK3I6UjfR
X-Received: by 2002:a17:90a:f2c3:b0:25e:9e59:af1a with SMTP id gt3-20020a17090af2c300b0025e9e59af1amr12084808pjb.21.1687450278013;
        Thu, 22 Jun 2023 09:11:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687450277; cv=none;
        d=google.com; s=arc-20160816;
        b=Kwl3vaxxwJsG2c8I/qSdoo7ySoMX8MqosPIE9CrY2MiiKlPEBNsE15HLNtCu6NqcUI
         P42SynBXHp3rPsqIL6WIL4GyG/HhGW3N10VuIn6gbc24ju9ODsmraGRQi8JctqPycxly
         9NXdWkYf7JCRun61xENGXL521Z7IofSo/7UCel1dVntpWC0HEEa/r97nDFaD9VxQGTK/
         TKWwfs1ywLa/5yH1BbxCaSTt8SqmuJEbgLiEHqLiCoPhRwkqJ3s7os0B3X1tPRLcFfwC
         F7a9GtqP9Nw49KZe6iK/Kp5tGbWJkjPokftOZ7ipwQJNkVNUonHBEhkKFYQGgW3Me0ez
         TIcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=n1vRGyzu8+XqKaMgtN/nMAkP8vtjVhpBIfkdPMVYyfg=;
        b=RjBanM8Mzgm7LBGCHI3vGaye8BV7yGcYYTCcQOmvyV/RkmafKuyMbfUyTdvo16q0si
         +F74rXdRwlP3l+O4p/zJkb1o5cND9AcE7fVQHcmtc3Wpf0476rfax/wRrlMF7HtF8ywN
         9MsdAOjccZplv9qDhZ4xUztLFfiyO0nZl2ZILr1wLBr/45MftbpPUBX/FTPxVDB4Dkcg
         k3lxgilLeIAhCjn3CBW0GOLZzx8DGRlWHlBv9nCrZIY2yJlaDK9A8i1jZiBhm65iPBZO
         hIWw5UfLIwW1qHFj9ozmS2Zn9Byev6ut1rWag12KyEK+OhlQ8lX9WlinoJ+3oa2V/z1P
         V4zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="SzgUJ/3O";
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id s8-20020a17090a13c800b0024e1ae3fb36si2726861pjf.128.2023.06.22.09.11.17;
        Thu, 22 Jun 2023 09:11:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="SzgUJ/3O";
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230423AbjFVQLQ (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Thu, 22 Jun 2023 12:11:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbjFVQLO (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 22 Jun 2023 12:11:14 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FBAE2134
        for <kvm@vger.kernel.org>; Thu, 22 Jun 2023 09:10:52 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-31129591288so5616718f8f.1
        for <kvm@vger.kernel.org>; Thu, 22 Jun 2023 09:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687450251; x=1690042251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1vRGyzu8+XqKaMgtN/nMAkP8vtjVhpBIfkdPMVYyfg=;
        b=SzgUJ/3O2JDLimh3+Agd51LJmZaiaEI8ZFwaKFU+xUs5N8igbv+HWLrxj9PAtNvt2P
         tWlCEtAkV4Akr6+YlAN8K0+yYGd8sx7dWoQtnO9KdQzwhhCQld65/SzWP89kgi87B8eh
         lKMQC9nQ2o/IYRKSQG/yO9HtB3B5uhxSrJ9JhYdyhuNC01KDTA0mRGksU/fOnTci3VcF
         eTy0N5FdKs+2ao4NC9iyl73k4WTq5YyQZ/JcjaHtorbZwzW7L3xdvwCsUkTmug4AIfdv
         WLk3g3kHwPWZQJTJwWN7mJvQlvPyRQSzb5+sWK5ic1pU1dfvlbmGNaZyANDyv6I1Adx6
         w5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687450251; x=1690042251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n1vRGyzu8+XqKaMgtN/nMAkP8vtjVhpBIfkdPMVYyfg=;
        b=D5oaTtEbEOcGznf7iwYCtaaYCILxdGJ3EHi17DswPfQnUB3oCxt5GPPnjC4NuW9OGS
         22B3jxcrdCiqupxOwsv3JKynSaLpT/qvZ9yCu33PjoQ/loB0V1GQLPVqe0BHaZR+CSyw
         ZfxiY75oOM3g4ZbVAIWLqhG3CTHCSMzeIOVO8bKrKjRXdm5a6wYdpxpOfCDzG/tmKDco
         yJTSuDAbvVTSX5AEAcw+Fx1HESGLAx/j+w17JZi7OR3LkbgB4VllIvBC/eIN362LC9xs
         1Sk3S9g4MinUUTrepD2nGCYQRg3YnplAAZINdFh7Xxte6p1g4ViF4Pdy2FoevnLlxjtz
         idWw==
X-Gm-Message-State: AC+VfDyk9byUxI5BR9Ky4OoZcFANZsQ0uon1KH/lDLePqbPny9FTBxhh
        rqZMZiJwAnrk7DWNSYSpx6xoLg==
X-Received: by 2002:a5d:4cc2:0:b0:309:5068:9ebe with SMTP id c2-20020a5d4cc2000000b0030950689ebemr12061202wrt.50.1687450250976;
        Thu, 22 Jun 2023 09:10:50 -0700 (PDT)
Received: from localhost.localdomain (230.red-88-28-3.dynamicip.rima-tde.net. [88.28.3.230])
        by smtp.gmail.com with ESMTPSA id z17-20020a5d6551000000b00307bc4e39e5sm7314320wrv.117.2023.06.22.09.10.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 22 Jun 2023 09:10:50 -0700 (PDT)
From:   =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To:     qemu-devel@nongnu.org
Cc:     Reinoud Zandijk <reinoud@netbsd.org>, qemu-arm@nongnu.org,
        kvm@vger.kernel.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Yanan Wang <wangyanan55@huawei.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        Roman Bolshakov <rbolshakov@ddn.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Paul Durrant <paul@xen.org>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Alexander Graf <agraf@csgraf.de>,
        Richard Henderson <richard.henderson@linaro.org>,
        xen-devel@lists.xenproject.org,
        Eduardo Habkost <eduardo@habkost.net>,
        Cameron Esfahani <dirty@apple.com>
Subject: [PATCH v2 14/16] accel: Inline WHPX get_whpx_vcpu()
Date:   Thu, 22 Jun 2023 18:08:21 +0200
Message-Id: <20230622160823.71851-15-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230622160823.71851-1-philmd@linaro.org>
References: <20230622160823.71851-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Dv5hXFr6dVqG

No need for this helper to access the CPUState::accel field.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/whpx/whpx-all.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 107b731d3f..fdac13c7c1 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -256,15 +256,6 @@ static bool whpx_has_xsave(void)
     return whpx_xsave_cap.XsaveSupport;
 }
 
-/*
- * VP support
- */
-
-static AccelCPUState *get_whpx_vcpu(CPUState *cpu)
-{
-    return (AccelCPUState *)cpu->accel;
-}
-
 static WHV_X64_SEGMENT_REGISTER whpx_seg_q2h(const SegmentCache *qs, int v86,
                                              int r86)
 {
@@ -390,7 +381,7 @@ static uint64_t whpx_cr8_to_apic_tpr(uint64_t cr8)
 static void whpx_set_registers(CPUState *cpu, int level)
 {
     struct whpx_state *whpx = &whpx_global;
-    AccelCPUState *vcpu = get_whpx_vcpu(cpu);
+    AccelCPUState *vcpu = cpu->accel;
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct whpx_register_set vcxt;
@@ -609,7 +600,7 @@ static void whpx_get_xcrs(CPUState *cpu)
 static void whpx_get_registers(CPUState *cpu)
 {
     struct whpx_state *whpx = &whpx_global;
-    AccelCPUState *vcpu = get_whpx_vcpu(cpu);
+    AccelCPUState *vcpu = cpu->accel;
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct whpx_register_set vcxt;
@@ -892,7 +883,7 @@ static const WHV_EMULATOR_CALLBACKS whpx_emu_callbacks = {
 static int whpx_handle_mmio(CPUState *cpu, WHV_MEMORY_ACCESS_CONTEXT *ctx)
 {
     HRESULT hr;
-    AccelCPUState *vcpu = get_whpx_vcpu(cpu);
+    AccelCPUState *vcpu = cpu->accel;
     WHV_EMULATOR_STATUS emu_status;
 
     hr = whp_dispatch.WHvEmulatorTryMmioEmulation(
@@ -917,7 +908,7 @@ static int whpx_handle_portio(CPUState *cpu,
                               WHV_X64_IO_PORT_ACCESS_CONTEXT *ctx)
 {
     HRESULT hr;
-    AccelCPUState *vcpu = get_whpx_vcpu(cpu);
+    AccelCPUState *vcpu = cpu->accel;
     WHV_EMULATOR_STATUS emu_status;
 
     hr = whp_dispatch.WHvEmulatorTryIoEmulation(
@@ -1417,7 +1408,7 @@ static vaddr whpx_vcpu_get_pc(CPUState *cpu, bool exit_context_valid)
          * of QEMU, nor this port by calling WHvSetVirtualProcessorRegisters().
          * This is the most common case.
          */
-        AccelCPUState *vcpu = get_whpx_vcpu(cpu);
+        AccelCPUState *vcpu = cpu->accel;
         return vcpu->exit_ctx.VpContext.Rip;
     } else {
         /*
@@ -1468,7 +1459,7 @@ static void whpx_vcpu_pre_run(CPUState *cpu)
 {
     HRESULT hr;
     struct whpx_state *whpx = &whpx_global;
-    AccelCPUState *vcpu = get_whpx_vcpu(cpu);
+    AccelCPUState *vcpu = cpu->accel;
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     int irq;
@@ -1590,7 +1581,7 @@ static void whpx_vcpu_pre_run(CPUState *cpu)
 
 static void whpx_vcpu_post_run(CPUState *cpu)
 {
-    AccelCPUState *vcpu = get_whpx_vcpu(cpu);
+    AccelCPUState *vcpu = cpu->accel;
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
 
@@ -1617,7 +1608,7 @@ static void whpx_vcpu_process_async_events(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
-    AccelCPUState *vcpu = get_whpx_vcpu(cpu);
+    AccelCPUState *vcpu = cpu->accel;
 
     if ((cpu->interrupt_request & CPU_INTERRUPT_INIT) &&
         !(env->hflags & HF_SMM_MASK)) {
@@ -1656,7 +1647,7 @@ static int whpx_vcpu_run(CPUState *cpu)
 {
     HRESULT hr;
     struct whpx_state *whpx = &whpx_global;
-    AccelCPUState *vcpu = get_whpx_vcpu(cpu);
+    AccelCPUState *vcpu = cpu->accel;
     struct whpx_breakpoint *stepped_over_bp = NULL;
     WhpxStepMode exclusive_step_mode = WHPX_STEP_NONE;
     int ret;
@@ -2290,7 +2281,7 @@ int whpx_vcpu_exec(CPUState *cpu)
 void whpx_destroy_vcpu(CPUState *cpu)
 {
     struct whpx_state *whpx = &whpx_global;
-    AccelCPUState *vcpu = get_whpx_vcpu(cpu);
+    AccelCPUState *vcpu = cpu->accel;
 
     whp_dispatch.WHvDeleteVirtualProcessor(whpx->partition, cpu->cpu_index);
     whp_dispatch.WHvEmulatorDestroyEmulator(vcpu->emulator);
-- 
2.38.1
