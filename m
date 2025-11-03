Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45C6CCFA04
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 10:15:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFraJ-0006aO-D2; Mon, 03 Nov 2025 05:14:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFraG-0006Uk-To
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:14:44 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vFraA-00033c-23
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 05:14:44 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-429c82bf86bso1631232f8f.1
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 02:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762164873; x=1762769673; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c57WLejTczCDPIZIT4ByZo9teKQW5zfA4LdyJABPRTg=;
 b=EL+kTxskJNIOFprVuMUOo4cBwehT2S5s7PRmOnAGr1QqHKhlC5nv7do9AatoeZFcLL
 sk8uhKGA/i7OBuwh8CK6ng4tB0t3X4MIJcX+HydLxGPdng4RpsXjrsZA3g4ReNbBUvVT
 FOKUHw23+VJD9hcgCVeOShlb3SjSB5QxuSPQ8/jG5200qCOv8a0fVpufwpGofItkoLpJ
 OR+aZz0ok8lMOm9qluNltpx9j3rhJWmUPdYMe183Sg0kf5pO05nnf/Lekfj0/LZ39mIo
 iB9xieErpbw6lLfPrZyjkbCF2Z+VbOGJcuw2rP+TbSMGTn/4gsla5dSredbH3QTJmm3w
 6OdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762164873; x=1762769673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c57WLejTczCDPIZIT4ByZo9teKQW5zfA4LdyJABPRTg=;
 b=ZaGmcQPmIBggClz+SEx0o3CSQh8xzLQK+M+ITPvLvz3HbnuskNkcRm+SPotpMDN094
 5YVyh1aWAsPn7EhXSIdo65VXFNjvKbLNS4i+c8uUJza4gdRIw7JtX7S3/D2zF3s4TA9F
 GCu7OE5pU0u5Bupt2JVKuDtWuA6su5JM+bMAdIhEAJLqIXQRXnOojMlWJgpQyE2VTFTH
 KGT7TRpOcLmKyK1YgUwG2wLxYNoPaUtqY70HsvqwmByVI/JknXeTd94t0B+vFnwkDChp
 937mLM2jqskYWdBWXrjV6Iw3aJgk9S2zH4PlaFL9hBQGBjsuZLheZY/dapbkHrjvzFo9
 RrJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfsGmNpJy8K3ZZEtpaXoROK8hWtMaoZHBukaMiGhuXb2PsBosByCJDU97puxTmFRx3tizqkI8VNQ==@nongnu.org
X-Gm-Message-State: AOJu0YxLofywj7zNnI26iH/Em0SL6j0qh6e5+67YxV4C8xWLSD1zvFR8
 zyYbfcagDGXLDs5P+oZuhQiBDAa2ujdlHxru1U4j+PWuEgMamv+oetPdA6QvqDVVoNg=
X-Gm-Gg: ASbGnctDsAZKv467ndMiOXlwS0SgkPLR5p5LDUuOs4t0iYiPdp86jMyXbai+eJNCquL
 iFp4vcAcpgBesO6anYiG33GlrJ4FozrfneCvNsFzzabr5fUkM/dX0aAjySef8NkJv8rxAMKBMFg
 YidHg4aa80EbJ+17mrgoPdFmEdskIG1t/XsX+WPnax+uuZA7WuEzRyyYeODdhuycaa4OQWAJkdn
 0CpO6NT8XFr2zeLU2bxqiCpB48lPDXlSOp3v1ZcvllSNQc0et0b9PoZH0xtvkj3sEnV+rJq90R5
 L68f/7/Gf98afwPwcty9lURN4exdceRN+kOBimvxxrVlKfHNZYUjhT98V08/XPK4IdLpeSG8Y5O
 FXt28gWQxbrkE1X1Yj08F7r49iPwirQ1QMz1KzZU042/cpHiOQQ7jHdRK5mbSOfuUzLOZT9fyiF
 9E2hc/NP8m44VESqEB3N6x32U4oAALtNAXTbxVG/mYWyk4JrKL5mS6KUoOXG0=
X-Google-Smtp-Source: AGHT+IFNM//af+kU4SVUq3YIQ7Pdv0I8MFFAY6t26nglj2Kg/iaETdq9BfD/XJqFue8hAbPWKrGQJA==
X-Received: by 2002:a05:6000:26c2:b0:429:d41b:9fd8 with SMTP id
 ffacd0b85a97d-429d41ba2e9mr1711762f8f.20.1762164873082; 
 Mon, 03 Nov 2025 02:14:33 -0800 (PST)
Received: from localhost.localdomain (ip-185-104-138-122.ptr.icomera.net.
 [185.104.138.122]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c11182e3sm19869172f8f.11.2025.11.03.02.14.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Nov 2025 02:14:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Phil Dennis-Jordan <phil@philjordan.eu>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Peter Collingbourne <pcc@google.com>, Cameron Esfahani <dirty@apple.com>,
 Mads Ynddal <mads@ynddal.dk>, Mohamed Mediouni <mohamed@unpredictable.fr>
Subject: [PATCH v4 09/23] accel/hvf: Drop hvf_slot and hvf_find_overlap_slot
Date: Mon,  3 Nov 2025 11:10:18 +0100
Message-ID: <20251103101034.59039-10-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103101034.59039-1-philmd@linaro.org>
References: <20251103101034.59039-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
index 3e5feecd8a7..bbb0b385fe9 100644
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
2.51.0


