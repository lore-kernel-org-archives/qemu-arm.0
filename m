Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94B1C9EC63
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 10:33:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfFDL-0001wB-3r; Mon, 12 Jan 2026 05:31:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFD4-0001Rt-FS
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:31:46 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFD2-0001kx-QP
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:31:42 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so33797075e9.1
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 02:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768213898; x=1768818698; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TgCkB/cCjci88novh5LUA6gxo5hF4mBrKIWSSmV2nEQ=;
 b=xi+frKiL5qoFeSlNzhb8px0ARu7nSgzHKr37solLyVAH3+/CKp+KxJ2M8T6gwISjPh
 5FnmRNvv4xRC+EaGfQ7p2ErDP2i/645PhVAKo9K/okA0gnhucM7morHDN/KyxWm0mwQX
 JnOjplLgF89gyEg0jlidgP7qSXwUVUMmtJAFhiE23o9qGqxFvxVMuk9kLThKysJjGCaD
 TaWqnTrlvWeqCavp+vM9Kb97QutArlzaiOOeKd/q1gxgzKTGMkQNCyF8XKw3Wf/9zfjz
 g0LVdqfpzpjNVS07ki13stwGsSx0+/2D0xxV+9hzO+kQ3TeolqandhPA0jXMl7EnsZWd
 ZedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768213898; x=1768818698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TgCkB/cCjci88novh5LUA6gxo5hF4mBrKIWSSmV2nEQ=;
 b=Adw7S8Q8n7sI0PhUNDCqoz9tlZSpdyP1cMoXMym11FfydbCAhkI38h0kcmCkOv7SyZ
 gCTTppyGsWSLa8q0DmVyLLiXoNVjySTmPufXYvmcZbTqy7KRji+I/d0WQ3+u/Vmz/MFV
 1RQtk5yRa8Dbv5CE2uSsMuNPhDG0mOdB0Y/V4DK1XICqfmLeNUkoRxsc6kSbeR5BO6gy
 RoiNP7yaA8RILKe9jEdaVizxX7BCiQX0s4H+R0aFz4prmAIh6YOImA06Xt+Y7hKV7qhb
 Jye2MeViG8hynNyxDCwQS7QQeSP2ZCm35b/u0asjHS2sBuuEgwbanfcEmod0yiMS/3cT
 IneQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUf7xr1XLlO8j+jly8DNFjdRU4VZ+1bX6CEZ7UwYHx2nLqHX8c92loG/3M4LUiOwDVz772bFm7oVw==@nongnu.org
X-Gm-Message-State: AOJu0YwWy8lX7xxnul0k4J+DF55UFCukf/fcCWlSOGrG4HXI8aMv93aa
 N4TSNNMy9UbT9ptAmTp9o9DUQyLfLgdePP/mcy7n+LgCyBG37QRZs9V/UmY8IDpTmEg=
X-Gm-Gg: AY/fxX5Bx4nBB+AlhIsTzy5tPZiTL4Xq1ln+Iu25y+DOZmhNkfiy5Yk2AC/lvevEbjS
 1sYBNWkyolJ8hxiTREZFBEpZQbqMsrA19ETZheHB4MIaNgpsFgZdIMTaeHXUz7n8lqo/J5fdYur
 szrXjqTrO/X6XOVGGuMs3qLWDLPgAo+cDjiTCmYmO7My9cy1uDhlqq42Ktiue2VasG/1D47X07p
 hLT56l1YgPQDN8qoczTxz6beAuy8py+i4dfBeE9yMW6nwe7Wj5dggjHLbHJLGIRlPUo0yrQv0KD
 oSLn+R091ZdAuSfORHlGib+MNDKIkH7SYpNGBqyv4r/1hQtq2OIQrc+uV2KCdwVYLYS/nvUlaA7
 vm/HS2ruiyY8Ln70dhcocUJUVxajAHBsSdjvvoHui7qW0/shDNURfDNESw3MS97NTCakU9AjDVY
 l05kClQdveZ3S2fiHx4kXahpzpkwre6lqtwTL5lCDecnvBVoYn0+m6ZtcDX3zM71ByV/VEYdY=
X-Google-Smtp-Source: AGHT+IF8maqCDS62Rc3D1MaSXWcC9wINio3H+5HILmC7bsCDhFLwRisLg/IrkiWfxxWNlfja6ugfgA==
X-Received: by 2002:a05:600c:198a:b0:477:a289:d854 with SMTP id
 5b1f17b1804b1-47d8484a113mr219245415e9.5.1768213898184; 
 Mon, 12 Jan 2026 02:31:38 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f418538sm347901565e9.5.2026.01.12.02.31.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Jan 2026 02:31:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Joelle van Dyne <j@getutm.app>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Nguyen Dinh Phi <phind.uet@gmail.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Collingbourne <pcc@google.com>, qemu-arm@nongnu.org,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 09/19] accel/hvf: Drop hvf_slot and hvf_find_overlap_slot
Date: Mon, 12 Jan 2026 11:30:23 +0100
Message-ID: <20260112103034.65310-10-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112103034.65310-1-philmd@linaro.org>
References: <20260112103034.65310-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

These are now unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 include/system/hvf_int.h  | 13 -------------
 accel/hvf/hvf-accel-ops.c | 14 --------------
 2 files changed, 27 deletions(-)

diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
index ee7ab689f45..d842d4b2b99 100644
--- a/include/system/hvf_int.h
+++ b/include/system/hvf_int.h
@@ -24,15 +24,6 @@ typedef hv_vcpu_t hvf_vcpuid;
 typedef hv_vcpuid_t hvf_vcpuid;
 #endif
 
-typedef struct hvf_slot {
-    uint64_t start;
-    uint64_t size;
-    uint8_t *mem;
-    int slot_id;
-    uint32_t flags;
-    MemoryRegion *region;
-} hvf_slot;
-
 typedef struct hvf_vcpu_caps {
     uint64_t vmx_cap_pinbased;
     uint64_t vmx_cap_procbased;
@@ -45,9 +36,6 @@ typedef struct hvf_vcpu_caps {
 struct HVFState {
     AccelState parent_obj;
 
-    hvf_slot slots[32];
-    int num_slots;
-
     hvf_vcpu_caps *hvf_caps;
     uint64_t vtimer_offset;
     QTAILQ_HEAD(, hvf_sw_breakpoint) hvf_sw_breakpoints;
@@ -70,7 +58,6 @@ void assert_hvf_ok_impl(hv_return_t ret, const char *file, unsigned int line,
 const char *hvf_return_string(hv_return_t ret);
 int hvf_arch_init(void);
 hv_return_t hvf_arch_vm_create(MachineState *ms, uint32_t pa_range);
-hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
 void hvf_kick_vcpu_thread(CPUState *cpu);
 
 /* Must be called by the owning thread */
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index e4c62522e10..d931412975c 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -64,20 +64,6 @@ HVFState *hvf_state;
 
 /* Memory slots */
 
-hvf_slot *hvf_find_overlap_slot(uint64_t start, uint64_t size)
-{
-    hvf_slot *slot;
-    int x;
-    for (x = 0; x < hvf_state->num_slots; ++x) {
-        slot = &hvf_state->slots[x];
-        if (slot->size && start < (slot->start + slot->size) &&
-            (start + size) > slot->start) {
-            return slot;
-        }
-    }
-    return NULL;
-}
-
 static void do_hvf_cpu_synchronize_state(CPUState *cpu, run_on_cpu_data arg)
 {
     if (!cpu->vcpu_dirty) {
-- 
2.52.0


