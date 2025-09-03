Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66898CA1009
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 10:09:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utkQV-0002a5-RO; Wed, 03 Sep 2025 06:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkQT-0002P7-E6
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:09:13 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkQQ-0008LY-80
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:09:13 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45b83ae1734so29378685e9.0
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 03:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756894148; x=1757498948; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bNHTn0KvccVKCZ+jZd0T/OTVPh+oNI/bukFDQhXZRac=;
 b=VgY6Z+sW6ztSsNaLpmFGoisj1W032Qg9f69d0jRBCe3kYAWKmM9YJL3A0jj/xmqOfZ
 SyB/8jHvAm6I4vCg2bw43HyTdtP5BQcyZ9K3XuDKflfATjD+vf+JW3XKtW93P+8pyIeg
 8Ml0b+ehvSgcNSf4AcFsA0OnLMTTVc1Wdf0uKnZGnPwaxGvs0e+UZQc4w0coX027mk9P
 uaxwW1TKG+ASwIFgcX+8XQKkiVXYymgsfGe67c0frCLMCHPcexCwEb9Aa9joTw7d/xmf
 IQJv+Hn128B+0+DiuFwylWXJktO6Dik12cg8eGiaWQfZ7VbRyVsbambPHEyyIIaifW8k
 Sz/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756894148; x=1757498948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bNHTn0KvccVKCZ+jZd0T/OTVPh+oNI/bukFDQhXZRac=;
 b=noea34sieh03b/4RnBLzlzWKGnc3Q+jOfd+8s+Ok1PlpwxlE2wiAhpEqFfh6DtsoIN
 TGZwESW4TJum2FWr4PJCS6tybOSsAdEkN3HULQu1sOqzL3OlehDzEKWXN5YXOogmJ+ve
 9pnXF8K6dCRrMzGrXZanuzm+ClLdLNCvp4xIIr5WBarXXjeMf4bFDYE7+0qAm7F166zo
 +tARjjg8EePnf1qQTvXQocgvGjH74Ql2/O08vMOcr4UaaFdVBQIu/6pjhsS+tLHCffCP
 cl0zUxZPW2xJ3KYfrfGE9pp9cQkl9hojBMTO6c/kfk9NAbZS3z8wn/EIZ1yDalX8fTOr
 1Rbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrlkPrWTsIwg7T90oO1887G6TZXXj2t4ZPtPiZ/ufIEzBSK1hOgcnF9gyehVQ5OLFgaiW0FgTzXw==@nongnu.org
X-Gm-Message-State: AOJu0YzDHv70OXp3cj/BEIBPaLx94JtxId6/kANeMNLmXJys0b+cEPVx
 wfzVUZwGjnihGOEGRejYlq8pysS3OPOZLU7iLgB/1PNbCKexZD3pHMt34nPZYQ7uMyA=
X-Gm-Gg: ASbGncvprUYqrjeYlEivh1i837HlzxlASDAzMCN2MCisxPMmE3DHvti3HQAC/bpLKTW
 MqqZtq2UgFezFECNpk6+nGorbyJ3OdSD0ex+SomBbFe3USrAICAcg8LBGyQvKj8qCm2VrvArHOx
 jufxHQBpNTAa1m9c9gjWdkwjvm6lnVeFSlDJZS5KE6pMi4xIIge5l4ce3SJ7KHZLoegusRkU1qC
 Pr+b61+WDQUWf1P6c6iuc+EEpzJ4z80t2ejuyroI01ruojgs6YvOv/2pbyOtjx5pkI4Bubk3jyT
 7pqc8eJjjfyIzJAYAVgl1DpvTYmdliyqSeArqOwURAHKLX16i0ZtWLmTaqWq1uQLQI4mJOUV2AJ
 Da4OZUf6Tr1J2/dA5Km41g5/nYtF6VA9foSvhdHIVtv/PK2PXP7pZM2aAePL1FKYF/mwKIBqjr0
 h0DpdEUQ==
X-Google-Smtp-Source: AGHT+IGZWM6zf2WfUIGHfOPxKSzZO5fWm8ny9h4ToR2KseI3tsEOcfBuS21Mp8kO1tRF0QbA7MPEXw==
X-Received: by 2002:a05:600c:1c15:b0:458:f70d:ebd7 with SMTP id
 5b1f17b1804b1-45b9353e81amr52455195e9.20.1756894148288; 
 Wed, 03 Sep 2025 03:09:08 -0700 (PDT)
Received: from localhost.localdomain (98.red-88-29-180.dynamicip.rima-tde.net.
 [88.29.180.98]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6fe5sm315462575e9.5.2025.09.03.03.09.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 03 Sep 2025 03:09:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 13/24] accel/hvf: Implement hvf_arch_vcpu_destroy()
Date: Wed,  3 Sep 2025 12:06:49 +0200
Message-ID: <20250903100702.16726-14-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903100702.16726-1-philmd@linaro.org>
References: <20250903100702.16726-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

Call hv_vcpu_destroy() to destroy our vCPU context.

As hv_vcpu_destroy() must be called by the owning thread,
document hvf_arch_vcpu_destroy() also does.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/hvf_int.h | 3 ++-
 target/arm/hvf/hvf.c     | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
index 241c668795e..195d64dcf18 100644
--- a/include/system/hvf_int.h
+++ b/include/system/hvf_int.h
@@ -71,13 +71,14 @@ void assert_hvf_ok_impl(hv_return_t ret, const char *file, unsigned int line,
 const char *hvf_return_string(hv_return_t ret);
 int hvf_arch_init(void);
 hv_return_t hvf_arch_vm_create(MachineState *ms, uint32_t pa_range);
-void hvf_arch_vcpu_destroy(CPUState *cpu);
 hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
 void hvf_kick_vcpu_thread(CPUState *cpu);
 
 /* Must be called by the owning thread */
 int hvf_arch_init_vcpu(CPUState *cpu);
 /* Must be called by the owning thread */
+void hvf_arch_vcpu_destroy(CPUState *cpu);
+/* Must be called by the owning thread */
 int hvf_arch_vcpu_exec(CPUState *);
 /* Must be called by the owning thread */
 int hvf_arch_put_registers(CPUState *);
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 4a535d65b7e..5b3c34014a5 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -992,6 +992,10 @@ void hvf_arm_set_cpu_features_from_host(ARMCPU *cpu)
 
 void hvf_arch_vcpu_destroy(CPUState *cpu)
 {
+    hv_return_t ret;
+
+    ret = hv_vcpu_destroy(cpu->accel->fd);
+    assert_hvf_ok(ret);
 }
 
 hv_return_t hvf_arch_vm_create(MachineState *ms, uint32_t pa_range)
-- 
2.51.0


