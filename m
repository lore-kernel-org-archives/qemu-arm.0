Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748F3CEACC9
	for <qemu-arm@archiver.kernel.org>; Fri, 14 Nov 2025 20:09:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vK052-0000zm-7m; Fri, 14 Nov 2025 15:07:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vK038-0007XF-Fj
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 15:05:40 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vK034-00052F-M5
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 15:05:37 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-477770019e4so28046865e9.3
 for <qemu-arm@nongnu.org>; Fri, 14 Nov 2025 12:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763150733; x=1763755533; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c57WLejTczCDPIZIT4ByZo9teKQW5zfA4LdyJABPRTg=;
 b=QppJPeo+VWYr4Q75W7p8EbkgDRw8IYmRPUbR/eVthkPB72UKGvNrlYs31gmioACHYQ
 s98ls2nIgKQF+DZtr+rnLAJz3pMY7BLujRtq4wDiaq6f28d54sKf6n8jPIT/BQQ2xOVV
 vsAs107qWNtGb/iHcUM/EEWhyoo49XJ7D9zvzwrFXCuQrB5oNblWlT2XRosmSzTQ4ET5
 fRgamfpZru45vqrOkuRjhrUYm1Y6l9tp6WTYizEV6Ha73dfAUodAUtUq3wks1PxlaJSV
 nLprT1Qck73wtrkcAT5K2sNKr+5akSqiGNyjYDqU8dwIeNZb7i3K7AahJ6xl6GAQcZqX
 028Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763150733; x=1763755533;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=c57WLejTczCDPIZIT4ByZo9teKQW5zfA4LdyJABPRTg=;
 b=RYSkWfa9Rj8/47AVZFPLrpheMhVyGxR37K1nJ4Ux066sPUxQhnFTi20Zet0+BRczxj
 ivCfqtQF8tG78QzwyxnVSoKH2awR5tPGbeeKrJuXUdYDVIk/PuxRSJgGsPOrnm3sERpb
 /8TRb5pF4w3/OhUcb/BlWp+L6cTspm3iDMFWovQ1Av/y+HDJboO5tvW1/nEtzgSpmTea
 bmuh6yZS4GGF5JZdPKeZPi425Fkv54Q7aTHfHlxwsi47AMGMMF4ig7iHhVnd4NQgsDnq
 sN3C+/7NNbvtniCVuUqfLDzNSIqHhtMyIvSgRInnyX9PXubsvGff6gLITp20y9+Ww6Be
 kr5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl5ysYV8bAHrYjSX+MXb36J0Wq6euRL4hsQew75Qe3zc/4hBeoPuPc9e4ealW5td5SGJhMz+bW3g==@nongnu.org
X-Gm-Message-State: AOJu0Yy3d9Fj08lGXoYN3KiFbiCUNtD1mpk/WwHsbXVthozFlpNqo/15
 quEePV3svLcWmyHU1Mx05cunLPt5EsNPe4fhCXfm4D1ClebvcPpqcnxY+QZ6VxHLQEM=
X-Gm-Gg: ASbGnctCo6+GrbsLaXxPA1UIi2EjQTSdyBoUrmi2yMcizCCa/O7eD99vD9jFCJzqI3R
 V37xZDVSDmap3jVrELQlE886+Ln0stY7HAvmoF/2Z/QyG7bdd0dx4dqpWBfZ6oehSNi9n/EctUA
 VGj/l2bOOA6WRSkvwZQlZEJAxF3pENpKANi6DC2NzK96VCzmMZc/uLyrMSez0TUK5JKWXdwDQ0d
 57OmqJrHKrSBVkIVPOG2cV405ZMnVVsnK1/rngve3grV3F1SeraVUJt9+wnKYju/Srwr3tT4SvB
 3NJWIMy6A4c+5NumvsVu/hjxTWtw5zG5v9SatS4FQ+iS4Cww0blFaV15Zn5Rv3L097j12lqXD7N
 8sfk4lgnx4O4cGkbMdvlOcef3WizzIpn/6WzCg7uzrmGaZLw3iupSfh4m80N2U9CiCJuFnoFBrY
 jOg/5187Wc9OgV8YrJKLvn2QL+LBNPoNGjObGr1i0P1RvmYe3Jsw==
X-Google-Smtp-Source: AGHT+IHqeBOSMKLNNldaJRXQP0ek6SqnouURcfZIVOVRbaJb9P1r5Ge/Nma316g307Ny2vao37Wy0g==
X-Received: by 2002:a05:600c:6289:b0:46e:3d41:6001 with SMTP id
 5b1f17b1804b1-4778fe8cae9mr43597315e9.34.1763150733059; 
 Fri, 14 Nov 2025 12:05:33 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4779528bc65sm27641595e9.15.2025.11.14.12.05.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 14 Nov 2025 12:05:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Collingbourne <pcc@google.com>, Cameron Esfahani <dirty@apple.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Mads Ynddal <mads@ynddal.dk>
Subject: [PATCH v5 09/19] accel/hvf: Drop hvf_slot and hvf_find_overlap_slot
Date: Fri, 14 Nov 2025 21:04:11 +0100
Message-ID: <20251114200422.4280-10-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114200422.4280-1-philmd@linaro.org>
References: <20251114200422.4280-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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


