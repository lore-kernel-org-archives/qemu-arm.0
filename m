Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBC7CCD1BE
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 14:15:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBw5P-0006Jy-He; Thu, 23 Oct 2025 10:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBw5K-0006EE-VX
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:14:35 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBw5G-0007Rw-Rs
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:14:33 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47117e75258so6851055e9.2
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 07:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761228869; x=1761833669; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LgKVVP81quRHZdasM9p0tFwKU7dqmMROiJUy9ix33mI=;
 b=zmK9+yZIO5dGyv75q3mKda+HdEIhyvyyoTO6/zjxX3qsVobXb55siLrzvoc5jfC1zH
 FeHDJS8JYHM1leajc3QbuKsZPIzshx4ZsCUTg+B/bXqPft3bjibC1v0q/M6dKVIBTbTj
 3ACylSrJtzM9cmAOT9ZlCnh/AWibTROWc7qHNnUBsFAyCiQP7DqjKbbR97ED2vFL/Gnb
 1H16CpcXjqIlM/5AjzDjSlo0GhKZ3ivSUMX3U5JgKghGhSS0ib9ip1wtT24QLIhj+MRb
 1s5/vRNjScWc3UAV8MtATsr2mGnAfKB3LJfD+XoWnILVmQKlByFqCayA/kia6y8K9wUX
 PV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761228869; x=1761833669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LgKVVP81quRHZdasM9p0tFwKU7dqmMROiJUy9ix33mI=;
 b=E9qIydS3EHuheVX8MnN+MDdznFG52gu2ADTeExUXj6UUfalNyIldaj1N3UTTdtxGNP
 j4ukX10jKntNOpoyv7uXy0b8w/M22lUJpewHYrwxoIPp5HT4VbJ6f1sZaGQ96BSM5Zfd
 +T3K8+/3tuqt2I03hkLY1ETMbG2uKs98DKfJ9BXDEfx2NMXibHDWX+I4C7o5VSNlHWA6
 hI7zB3eH8QbDoYrwXUD4ntA9BaKLYkkGVR4QdMZpLVzQ4g9m8OutKBLHHMBn5tcZWAWU
 8eqBsyrd/KF8wD63Jk9u6kFBk//Q78NPcVXoqszhHBVrGf2n8D09+fnq1JkJ0f87X2iN
 Sfbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXj4Sf+CmCOCArG8GdZSM7fIZTVDWWgNaHHyluTUXSmoaul2+FR8pPBVqa4VtGMK5cw1f3FjqDFmw==@nongnu.org
X-Gm-Message-State: AOJu0Yzv6EKCqaTZ3xVYiLCz+Jqs4EiA78I3tSjEFpDWW95TjzuqSQms
 91Hmx2Gc2qcyxz5914IdsHsSkBNpdCvSmKh+CF4mqDHsQnb7CHOq7qguw/qqjUGXH6A=
X-Gm-Gg: ASbGncve00bO28OrpvvtDrvpp7Y8F09LTLkJZJFpBz8/x8fsDGXAIffwPmPftaN/4g5
 dWmLCX0mcXhfxRi/W6Y5PAMjp2M3g1+jYpKH3SENrZAt6tAgBJ0Vo/+cCsTLB4lt6wqiC4ms27j
 zY2PPtNDKULL0INNJ4kZ9QyRQKvPrt0zgBYsyKFl9YDpQFAF30T+NHvtQu7wx5AR5eTZ61ChtzL
 fuGYWETRGV90z4Bxe9Ru7zOv6XBwlK/OkQDVHBnBPx8GczMMg7Yu1T09h2yZn1Cpjjt7kWcsLjb
 WmPXFDaeE3RODXjfVpgmmkbR+4bEkpmTbWwHO8J6Oo7fFdtVP4Xi167DMk8Zncw+s7EtLJM/Oki
 +UQXiKZb/h12FJmX0Pc5F4YwsOj/RuvvXzm6JBBPCItw+gYmQSMHtasI164fpo+qq1EPOcyUqh/
 QOY4Jtp77UgU9kfRmk+If+FeodOqG65q1LOUWf12xyWP6TIj4rfACcg2lLR9s+
X-Google-Smtp-Source: AGHT+IFb/XSWqKHanfFo0JpGugOKs3B2G/i5axTSdAeolnzGHJFkkiz6qvyxK3ppW72qVwNLeyHDww==
X-Received: by 2002:a05:600c:8b74:b0:456:1a69:94fa with SMTP id
 5b1f17b1804b1-475cafae81emr16050175e9.13.1761228868811; 
 Thu, 23 Oct 2025 07:14:28 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c43900e1sm117498495e9.17.2025.10.23.07.14.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 07:14:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Collingbourne <pcc@google.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Mads Ynddal <mads@ynddal.dk>,
 Roman Bolshakov <rbolshakov@ddn.com>
Subject: [PATCH v2 19/58] target/arm/hvf: Factor hvf_handle_vmexit() out
Date: Thu, 23 Oct 2025 16:13:38 +0200
Message-ID: <20251023141339.10143-10-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

Factor hvf_handle_vmexit() out of hvf_vcpu_exec().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Mads Ynddal <mads@ynddal.dk>
---
 target/arm/hvf/hvf.c | 50 ++++++++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 8553ce6adc2..27c600148f9 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1984,10 +1984,33 @@ static int hvf_handle_exception(CPUState *cpu, hv_vcpu_exit_exception_t *excp)
     return ret;
 }
 
+static int hvf_handle_vmexit(CPUState *cpu, hv_vcpu_exit_t *exit)
+{
+    ARMCPU *arm_cpu = env_archcpu(cpu_env(cpu));
+    int ret = 0;
+
+    switch (exit->reason) {
+    case HV_EXIT_REASON_EXCEPTION:
+        hvf_sync_vtimer(cpu);
+        ret = hvf_handle_exception(cpu, &exit->exception);
+        break;
+    case HV_EXIT_REASON_VTIMER_ACTIVATED:
+        qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], 1);
+        cpu->accel->vtimer_masked = true;
+        break;
+    case HV_EXIT_REASON_CANCELED:
+        /* we got kicked, no exit to process */
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return ret;
+}
+
 int hvf_arch_vcpu_exec(CPUState *cpu)
 {
-    ARMCPU *arm_cpu = ARM_CPU(cpu);
-    hv_vcpu_exit_t *hvf_exit = cpu->accel->exit;
+    int ret;
     hv_return_t r;
 
     if (!(cpu->singlestep_enabled & SSTEP_NOIRQ) &&
@@ -2006,6 +2029,7 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
     bql_lock();
     switch (r) {
     case HV_SUCCESS:
+        ret = hvf_handle_vmexit(cpu, cpu->accel->exit);
         break;
     case HV_ILLEGAL_GUEST_STATE:
         trace_hvf_illegal_guest_state();
@@ -2014,27 +2038,7 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
         g_assert_not_reached();
     }
 
-    /* handle VMEXIT */
-    uint64_t exit_reason = hvf_exit->reason;
-
-    switch (exit_reason) {
-    case HV_EXIT_REASON_EXCEPTION:
-        /* This is the main one, handle below. */
-        break;
-    case HV_EXIT_REASON_VTIMER_ACTIVATED:
-        qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], 1);
-        cpu->accel->vtimer_masked = true;
-        return 0;
-    case HV_EXIT_REASON_CANCELED:
-        /* we got kicked, no exit to process */
-        return 0;
-    default:
-        g_assert_not_reached();
-    }
-
-    hvf_sync_vtimer(cpu);
-
-    return hvf_handle_exception(cpu, &hvf_exit->exception);
+    return ret;
 }
 
 static const VMStateDescription vmstate_hvf_vtimer = {
-- 
2.51.0


