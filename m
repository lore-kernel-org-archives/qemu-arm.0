Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2583FCCD1BE
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 12:37:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBuVD-0006zu-64; Thu, 23 Oct 2025 08:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBuUA-0005SE-NK
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 08:32:30 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBuU8-0008PS-7a
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 08:32:06 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4712c6d9495so4417965e9.2
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 05:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761222721; x=1761827521; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9l+w1nsfj7eb94kduqVoiuDLPZOsjod/2Pr03h3L08Q=;
 b=nx9AS5teKEqtcmenqZmF2xAq0T28aFKE6tSTB4Os++/syJhpCov9vwuJa9HTunSSiY
 6BPytLYGidq5v1IQfdpRdgVVfrSnpXfDiW7r/HNB7vZHcO32K4PxNkNWnvystOTR2iYe
 hDxroJeE/GG2adcDUM0lVSP3lBnyHsd5kGcXfmS+5cLWe5Gbtqe4XB3WUwbiC90aWZbc
 Sm7GYM7ZcFD5kEpyYcSSax8aqbFhUVmR1mPET8i7ONbxTcMC5IBp6lRUx5PcrXB7Ldd5
 p97pPD4H/VNzM3WeaFdSet2aKmyxBpm1eqJx/sciCJam6Dosg7jZBDiGKUdgdCDr4rf8
 DGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761222721; x=1761827521;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9l+w1nsfj7eb94kduqVoiuDLPZOsjod/2Pr03h3L08Q=;
 b=kyy1JVIwFaYVK9q5ysQgs/PO0KIt/QkKp+XYJrpzWfV8+E5bqeYWYfe8DSSOOL3lp2
 qCEIX7Qvxgbmbd8eJ6E+WB+cgUl0msKYdT9bO7BiGADC/19WPrJW7JchHGCBbMsIDGm+
 0DUtwCSQUKMF5NScedhaosDhlF6vLrfuxJWHf0mPrKqWNkwk1nnaH8X1xFIBEY0nJkGW
 JA71eCiu3yevj5CC2QM7tPHzXbITR29hJdmfnN+WzY5lgxFSfhylu1Zv4lyR2k+3YRT1
 9xT0thjnwc2P6PgGkCcz+bbjgKGY8cTBqrLLMIGRwLi5dmm+1wM4V1oFOvf/atAo8KVF
 hIMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAkU9BM+AUli4xwXMiqH75AHz03yi76ExOr8cHiN9x2s9zeKUH3CwS7c2gd+6GM0xGDY9yd3g80g==@nongnu.org
X-Gm-Message-State: AOJu0YxplJ5gCnMV4B8fe1D9Psd6iKXISX3Hsdne2gSmWlFfTbSUBUQ7
 6CniK7Xvw5hVIM04dVbJF/JhA8haa/zj6AzMfzcKcaEDobM+Xr+SXyZoildCk1lP9tw=
X-Gm-Gg: ASbGncvPQXPPvdHBKusDnkAt5jncK+oldvn4fD5khwZzhpiH2/HVncLBrsl1LvR5xx5
 A6WtzoIAaNUwGISUUNvKXk5Pfb7yQLDMF6SqMUaksFPAbwmf0Q+z4vPpPv5oVXZ/fxnwHbLULOe
 6IkRge9gqeKsJtTRN+LSDWtTX2l4LZOvlD3KhijkrwQnR4zgV6WoJO3RE55aCVNwqN4g7n2bVWx
 bD5JphlwfdT82j3axQRLHbg6ef5lidDZs2q1/BeaPNJcDQYKFDd8BgDDuAVbFjs7Yg5TMpnVPF9
 EiY8XDsZF0rWv1ZLSKl6N1GyCJZd8aQPeq4CxcdAGBY+LeMkU/Z8NAI39ldJL3WCQL0haf22aPv
 SMct0pa3Yc8exQ60kF6Sr9b9ERaSnplNALEedQ9QXxsFT4sr/m9mhxIsBz4Wl7PNZT5c5ucEii5
 af4dgGZS0zAI3S/gaHPK/8Yt/6u2s5cUGt3pScnQYzftj37fAGoZqNd/azW/IT
X-Google-Smtp-Source: AGHT+IETxxUJfbx3hoR0IcW9MNoW4fy7+zlHuvFHzgttNLdDRW6lfdagCJbsdlxIesvp+Mpzsbii0A==
X-Received: by 2002:a05:600c:190b:b0:46e:3b1a:20d7 with SMTP id
 5b1f17b1804b1-47117903f8bmr186588785e9.19.1761222720620; 
 Thu, 23 Oct 2025 05:32:00 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475caf2f3bbsm33631015e9.16.2025.10.23.05.31.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 05:32:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Mads Ynddal <mads@ynddal.dk>, Phil Dennis-Jordan <phil@philjordan.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Cameron Esfahani <dirty@apple.com>
Subject: [PATCH v2 53/58] accel/hvf: Add hvf_arch_cpu_realize() stubs
Date: Thu, 23 Oct 2025 14:31:37 +0200
Message-ID: <20251023123142.8062-4-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Implement HVF AccelOpsClass::cpu_target_realize() hook as
empty stubs. Target implementations will come separately.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/system/hvf_int.h  | 2 ++
 accel/hvf/hvf-accel-ops.c | 2 ++
 target/arm/hvf/hvf.c      | 5 +++++
 target/i386/hvf/hvf.c     | 5 +++++
 4 files changed, 14 insertions(+)

diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
index eab443aa91f..3120a4593a4 100644
--- a/include/system/hvf_int.h
+++ b/include/system/hvf_int.h
@@ -110,4 +110,6 @@ int hvf_update_guest_debug(CPUState *cpu);
  */
 bool hvf_arch_supports_guest_debug(void);
 
+bool hvf_arch_cpu_realize(CPUState *cpu, Error **errp);
+
 #endif
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 744a5288298..6fb1fda424c 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -363,6 +363,8 @@ static void hvf_accel_ops_class_init(ObjectClass *oc, const void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
+    ops->cpu_target_realize = hvf_arch_cpu_realize;
+
     ops->create_vcpu_thread = hvf_start_vcpu_thread;
     ops->kick_vcpu_thread = hvf_kick_vcpu_thread;
     ops->handle_interrupt = generic_handle_interrupt;
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index cc3f22ac542..759fa2e4d7d 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -979,6 +979,11 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     return 0;
 }
 
+bool hvf_arch_cpu_realize(CPUState *cs, Error **errp)
+{
+    return true;
+}
+
 void hvf_kick_vcpu_thread(CPUState *cpu)
 {
     hv_return_t ret;
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 8acdfa952c1..168227af631 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -368,6 +368,11 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     return 0;
 }
 
+bool hvf_arch_cpu_realize(CPUState *cs, Error **errp)
+{
+    return true;
+}
+
 static void hvf_store_events(CPUState *cpu, uint32_t ins_len, uint64_t idtvec_info)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
-- 
2.51.0


