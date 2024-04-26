Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp640711ejb;
        Fri, 26 Apr 2024 12:51:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQ5jXMJ5mPNFMQTc0s1Jd5ph4cLLCDYHShWiWH9QGfDpk9HAFYjhWjcexT29TUMjN5cZPN8vmHTMA94R5AIypG7VoRbr66
X-Google-Smtp-Source: AGHT+IE5p+u+UGQ68k2ntgbSrszUNgghEKtBUbIiHYqM4e37RHwbN4Ncke0DLxw7LL174SeALTkU
X-Received: by 2002:a25:d888:0:b0:dcf:464d:8ec3 with SMTP id p130-20020a25d888000000b00dcf464d8ec3mr4436109ybg.3.1714161090198;
        Fri, 26 Apr 2024 12:51:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714161090; cv=none;
        d=google.com; s=arc-20160816;
        b=YcgMe55FucblSZ9BQotwlgcKga/whc31Vi+q0uwZwaNn8VTCCByc3u4uNi421ptQNl
         +fpmd/TZxzcAJ5DG6IKZKn9zfTRoBnyJnlx0drezVGv/euNOpwQhFEvuN66ERfZ+iEH3
         e/ezqqKAlTguQirvX7WMIA2yiNiouSXCoVgdi+pBWdKP4XTIoiiv4XUSF7w9Rhn2mKKq
         8WqQyTWe/BiUDRlbOUHmQ5QUiV0wV+rx1XcqHomBNtnPWX9EfAijOibl+ZjsRw2t/Lsl
         K91tTr842ZKOWhDyiriA5gCFE99NVydY5Cg5CZZZhCF6qcoXy2yW/GfOPFVtEJoLTOgH
         /rKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Yi4qzwVEIokTDVOXJGX3UXAbAGnKr2+Pju6ZmUzQWug=;
        fh=AbeTq7OKo/slgVqwO48iS0yQftxGrIIvu+7dQHo4VqY=;
        b=nH2cOPVvIsJl1RkITwye+Mnb95vkdAJUBFyHibPk8TDewXAoQd4fE6ORNriDIoK3OT
         VuoKk7B8goEcQVWB3FrkIbW+7VS9GYxd3mRmLUCbD/Rm7569rJBvaAtxkmf0PDQVY0vq
         kHxKreG+fkadEyG+bSwmcVIIJFR+n5vDD7OQTOTZOfM99jG4Sa3/xKpvuSXfRJfSeClO
         uvFgPjBL4yCBuWtLevTZ1YZy3fa6jQ3ln9bYwzwSvwc1VpEBk/CWMGoxa4WRHBgm/hro
         ZRTZPkiyO2acTvKP/PPQnvH/it1DgbS+JusmZQPTwvFqBEWb7OPGrentoYYUkdVAQ2ca
         Cp2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JlxMWkm6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15-20020a05622a164f00b0043680b4826esi21615891qtj.667.2024.04.26.12.51.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 12:51:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JlxMWkm6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0RUq-0006As-K5; Fri, 26 Apr 2024 15:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RUS-0003Hj-9Y
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:44:12 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RUO-0003SS-O1
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:44:11 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5724e69780bso2138116a12.0
 for <qemu-arm@nongnu.org>; Fri, 26 Apr 2024 12:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160646; x=1714765446; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yi4qzwVEIokTDVOXJGX3UXAbAGnKr2+Pju6ZmUzQWug=;
 b=JlxMWkm6oUDxpEPsHc/9FkGba94rEFG08N4HJV7mUv1m0yeOHoU2DJoDRS0OEo4Wca
 vzahnq5869oMVyWsFAMN88xBj0rMt8hnyO6UanWMpWZLtDHue7x5ubhg3EHfrYjW4DxP
 Uwa94TyVsLWQkCLPJpxYPsilBxmBNF7Q0FHir+wudK56esIlPMwjhCenbwE4PRUYoeWm
 jIiYXrSdLzFMbx/OYF4oQQ+3+s3QBfesDzSjCHT3B3JRf2TS5JUVgVS2642G89mloArV
 99D9M5jxbDbBSSnFKMp0kjjJ0t78/xhjIMiO2D2SJJIrI3QMQDeIwcr5wwbp2IVNEU0l
 cP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160646; x=1714765446;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yi4qzwVEIokTDVOXJGX3UXAbAGnKr2+Pju6ZmUzQWug=;
 b=ViEXVg03nN3L0Zrf0Dp5F5K4/xlrrAGprKyGlAlgrPZs7lzZ30M51D/SVnOHHynwuH
 Rvi9E+PGiurjmBUYN33LytesBh8kdN3h1XP4rG3IS9vFV9k/M5eGjJZxWI8ak49/7V+6
 Hx2LOw487htyPvUzYhtmkqWqAA0y59JHNFtq3drKinnnZHY9GIdlTtNxMFYjZwcvcJ7Q
 JeXeG9WnUVVwGjB6/h43vrJHbkI4zGu0MNhe9M6J4B0dazSYhr73v+CNbnqr2Ta5iZY+
 ryyizj6byEi8rkEGrl7XYIBx1mKwwA6JPpClP61qVcEfJQTl7JapPxAdy/5293G6FxB7
 Ucdw==
X-Gm-Message-State: AOJu0YzUTQY+A5h1dAyR3PMr24MBtpA69c/6jnYR/IqPqAbJV8W7UTBg
 32HnpwnUgwKEPwBemfT3jyxmfqWy/a11gwMLvT2Kv+zRkqTNmhWTkuBDJU/Aon4=
X-Received: by 2002:a50:8d42:0:b0:56e:2e10:7dad with SMTP id
 t2-20020a508d42000000b0056e2e107dadmr2804865edt.35.1714160645819; 
 Fri, 26 Apr 2024 12:44:05 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 bf17-20020a0564021a5100b0056bf6287f32sm10263342edb.26.2024.04.26.12.44.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:44:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>
Subject: [PULL 21/38] accel/nvmm: Use accel-specific per-vcpu @dirty field
Date: Fri, 26 Apr 2024 21:41:41 +0200
Message-ID: <20240426194200.43723-22-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: GTvUKmG4Zh/Y

NVMM has a specific use of the CPUState::vcpu_dirty field
(CPUState::vcpu_dirty is not used by common code).
To make this field accel-specific, add and use a new
@dirty variable in the AccelCPUState structure.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240424174506.326-3-philmd@linaro.org>
---
 target/i386/nvmm/nvmm-all.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index 49a3a3b916..f9cced53b3 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -30,6 +30,7 @@ struct AccelCPUState {
     struct nvmm_vcpu vcpu;
     uint8_t tpr;
     bool stop;
+    bool dirty;
 
     /* Window-exiting for INTs/NMIs. */
     bool int_window_exit;
@@ -507,7 +508,7 @@ nvmm_io_callback(struct nvmm_io *io)
     }
 
     /* Needed, otherwise infinite loop. */
-    current_cpu->vcpu_dirty = false;
+    current_cpu->accel->dirty = false;
 }
 
 static void
@@ -516,7 +517,7 @@ nvmm_mem_callback(struct nvmm_mem *mem)
     cpu_physical_memory_rw(mem->gpa, mem->data, mem->size, mem->write);
 
     /* Needed, otherwise infinite loop. */
-    current_cpu->vcpu_dirty = false;
+    current_cpu->accel->dirty = false;
 }
 
 static struct nvmm_assist_callbacks nvmm_callbacks = {
@@ -726,9 +727,9 @@ nvmm_vcpu_loop(CPUState *cpu)
      * Inner VCPU loop.
      */
     do {
-        if (cpu->vcpu_dirty) {
+        if (cpu->accel->dirty) {
             nvmm_set_registers(cpu);
-            cpu->vcpu_dirty = false;
+            cpu->accel->dirty = false;
         }
 
         if (qcpu->stop) {
@@ -826,32 +827,32 @@ static void
 do_nvmm_cpu_synchronize_state(CPUState *cpu, run_on_cpu_data arg)
 {
     nvmm_get_registers(cpu);
-    cpu->vcpu_dirty = true;
+    cpu->accel->dirty = true;
 }
 
 static void
 do_nvmm_cpu_synchronize_post_reset(CPUState *cpu, run_on_cpu_data arg)
 {
     nvmm_set_registers(cpu);
-    cpu->vcpu_dirty = false;
+    cpu->accel->dirty = false;
 }
 
 static void
 do_nvmm_cpu_synchronize_post_init(CPUState *cpu, run_on_cpu_data arg)
 {
     nvmm_set_registers(cpu);
-    cpu->vcpu_dirty = false;
+    cpu->accel->dirty = false;
 }
 
 static void
 do_nvmm_cpu_synchronize_pre_loadvm(CPUState *cpu, run_on_cpu_data arg)
 {
-    cpu->vcpu_dirty = true;
+    cpu->accel->dirty = true;
 }
 
 void nvmm_cpu_synchronize_state(CPUState *cpu)
 {
-    if (!cpu->vcpu_dirty) {
+    if (!cpu->accel->dirty) {
         run_on_cpu(cpu, do_nvmm_cpu_synchronize_state, RUN_ON_CPU_NULL);
     }
 }
@@ -981,7 +982,7 @@ nvmm_init_vcpu(CPUState *cpu)
         }
     }
 
-    cpu->vcpu_dirty = true;
+    cpu->accel->dirty = true;
     cpu->accel = qcpu;
 
     return 0;
-- 
2.41.0

