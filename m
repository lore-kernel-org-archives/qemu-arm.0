Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp792039ejb;
        Wed, 24 Apr 2024 10:46:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXCFeX9XTPKz4icxVRAXqcB/nYEiSH5OLBTzYhljAlpxWNdB30mrg/pcrbA2TyckDfxhMvZb5+yGUBOXyayMDhY59pKoonb
X-Google-Smtp-Source: AGHT+IEc7oioknEetPC8im3rEZr16oEuA1g5bS4q3Yrk5cI0w36/nj5q90OoMUy35vzYLRJ/Ldq+
X-Received: by 2002:a05:6214:132:b0:6a0:943c:2c58 with SMTP id w18-20020a056214013200b006a0943c2c58mr2527849qvs.30.1713980768974;
        Wed, 24 Apr 2024 10:46:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713980768; cv=none;
        d=google.com; s=arc-20160816;
        b=v+n90oumabTrnsGIsJJ3LHT54ey2zQ2MNaCydf9W3gTPoGYWosf3Qgyayxwpnbe2TT
         bid+0697dtfUG5WwEokvgbPAKpE36+QBvLBiozd8gA8zB4CQY4lq3KOVCFB52gkb6kfy
         YeS2RhCjnArHjhqFlgyzDGXTAEfEFdJWf0V6KBzBFmepSYLo8k6ld1b/y1sWZ8IyxZoh
         Ltc6U4xZInxKVbDgbP2Jht0a0D1GJnhpGSsfJM+CupognQgKOC8FnJfRMg0H+ibWTkjE
         7t3IHuqa4J+hJpU1ZdmM/xBOZbE6u8ntesGAbKgd93voShkZ6WsGoYxi/CC/XwII66eT
         3paA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nHy7p+TsVd61UoOXNyWftQk9Qj6gD334eWPgXT4ErEE=;
        fh=kC8LcrUclrT4t/UK3mWm6tzKRj/05Rnr255m1PSR/oU=;
        b=eO6plqjusL2XYDd5zhSp4zObCQDcW09IyIK8dLR5H+CwvgKMSqB9aqWEHAMxfSKubM
         x6wP6C8jLpDF7Q4JAyXBJBC6iAwov5ANSY4Ienrj30vE9hJ6QRftogl7bRiMKDkpCvlP
         xT59HCiZBkgMFcRCEo1vcDWoWzirNb0PxZ6wIW6dntsLIwKofWvuTrDWSL+8Mt3WQlLk
         SM6YVug3j6QP2b43/srUpQVhg+VnbaBegGvoOHbHO0+yxDZ9Md6wxVtlV/PWxVWL3yU5
         KlPjS6ZBxn6xItFhkLqFTR79CLhdlepjExVHySvDGSU6ofsyz3B43AEw8I7mPawMRnf9
         ZuOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HzZaFJIM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2-20020a05621420a200b006a0884dedc7si5275873qvd.47.2024.04.24.10.46.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Apr 2024 10:46:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HzZaFJIM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rzggf-0005V3-FG; Wed, 24 Apr 2024 13:45:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzggN-0005Ic-Ec
 for qemu-arm@nongnu.org; Wed, 24 Apr 2024 13:45:24 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzggL-0005ay-MQ
 for qemu-arm@nongnu.org; Wed, 24 Apr 2024 13:45:23 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-343c2f5b50fso39470f8f.2
 for <qemu-arm@nongnu.org>; Wed, 24 Apr 2024 10:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713980720; x=1714585520; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nHy7p+TsVd61UoOXNyWftQk9Qj6gD334eWPgXT4ErEE=;
 b=HzZaFJIMOFG6+ofWC9QiH/vzu/10Ps+a4kASdk0uZMLuZ7Pvwf0m5OoMyW3kZ0n5GO
 6AALIpb9dt50F+6mf4JohS7zgjsZJthKxZ3kOai4WuR2dCCFtlcviXE+QxgyMcYMfz6s
 i2T4g/5iOJvE1m7h3+gSFVLTYx/jVUjqhL+Q8qIcY/B0Kwb9UnQCpbHKqgUSjzmVfcfO
 F5KNwAI25eyk0q+e0UEfNciL6s6N8qTipZbD7lGQ9GrFCUsLW0bVqUmWxRPkTji8jiGP
 clA2hQjSVeA8jdNbIHcQkTHFzeK9+HwLNBqhg9IVdq7jwdttVSl+UF+XJ6KXucAwyhme
 Kobw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713980720; x=1714585520;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nHy7p+TsVd61UoOXNyWftQk9Qj6gD334eWPgXT4ErEE=;
 b=E3/3R0cX5lMRjP/jm9RN/bDZMlV9uv5lmotcZ14kwYZkWKzti0o0+lL0io4rEhrVIS
 Q6ELhb0kgPS6TFPYgWN81NEFTxE+tuzIDYnrQwFqyYgG3gKN9D5cwvfytGANZTAb0oNL
 sJNVRJiYyDdtZwiOkVOYATDiFPDEekDHMSxkGsqHcZmBilPP6SEoDvFJrHeIQy+k2/vI
 lVwF0db/oCBYm5qnCtVZrY/CiB95phthRhOeA6erx2T089L4lFyl165FFkvV9Iyc0IB5
 J5uXXNBRx+4wS3tnSrzK8YLYhY0q6o7ikDn+rWsBG4gYcxN/YTNXjRS5m2835zTCtBqm
 nbrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/4Sj5crDYoOtn3BnmjGhg0eccwTPCimoJh0p3WEJRlrNZ0OLurTFzRxbUQt02n6tyL290otVV/FEkBP1omuv20LlR
X-Gm-Message-State: AOJu0YzVY20jo0zJ5elwg5fzQ+km7uGE/zfzEq9YxOIfh21a2QozHEs/
 gUnjKwLHt/jftl4L43Kn51z/7QeB9BMWFEEEyFE6ZJWh/M8iV9nFPuNqVef8Qkw=
X-Received: by 2002:adf:ea8c:0:b0:34a:9adc:c37a with SMTP id
 s12-20020adfea8c000000b0034a9adcc37amr1924659wrm.10.1713980719950; 
 Wed, 24 Apr 2024 10:45:19 -0700 (PDT)
Received: from localhost.localdomain
 (mon75-h03-176-184-51-42.dsl.sta.abo.bbox.fr. [176.184.51.42])
 by smtp.gmail.com with ESMTPSA id
 s15-20020adfe00f000000b0034b03d0b94csm9059925wrh.74.2024.04.24.10.45.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 Apr 2024 10:45:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/3] accel/nvmm: Use accel-specific per-vcpu @dirty field
Date: Wed, 24 Apr 2024 19:45:05 +0200
Message-ID: <20240424174506.326-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240424174506.326-1-philmd@linaro.org>
References: <20240424174506.326-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
X-TUID: kikXzPz7uKJO

NVMM has a specific use of the CPUState::vcpu_dirty field
(CPUState::vcpu_dirty is not used by common code).
To make this field accel-specific, add and use a new
@dirty variable in the AccelCPUState structure.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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

