Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16ED9CCD1BE
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 13:08:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBv23-0001fk-AS; Thu, 23 Oct 2025 09:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBv20-0001bP-Qm
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 09:07:05 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBv1x-0006Lf-Rg
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 09:07:04 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-4298b865f84so344681f8f.3
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 06:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761224819; x=1761829619; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4+rsabIigu6ZJnpLHCrRrLyKuMoQRw52Umv/dM+Zp30=;
 b=jUopyDBkRSqhs0VxKr4t7L1mvxivATRgJIeaMjtIecllx1/4Ptf5yLvj1wgoWL1t4Y
 GUm7rDpxBKmaSTvNCmIKYj2fcH8ZunGnffKiErqqsfwEsfg0va2a4Eu7otSIThDrWcCT
 12qrs1JKDyXTHYfVWyLKq5beyRDuMT6LnRnW5XxpIq68srXcDx3A71y6opG0mvE8Rby1
 xY4klzBXyxkwVQFOtjqAAzcBKag+YPq3icWDL3GWhvWW0x0DPa7OLnEp3YmRdV7TreCt
 ALPicvRKMJMU5ORDvumjJl26i5qk7UgH+XRj1805uJZ+kbJoQy58nmf0ufM89WQtVrQE
 abLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761224819; x=1761829619;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4+rsabIigu6ZJnpLHCrRrLyKuMoQRw52Umv/dM+Zp30=;
 b=MyyVzzohPvdfRXDxUccaT/f9hGhd3E+kKXzRd7zIJkkA3aRRqhXIYFfg2Z4uVYnMtV
 T6UZL/kP5anQpBoPPW3HvyOuQ3QzRovuWkQWcXENso33NvWy2J25N5WvAc7EQ1opoSjh
 qpC4a5C2bmMpPEERhJtV26/YFNI+sSsgMvjdJ0Pce8WdJl7mCVKD9oqsFgxmxFsiAj3B
 ZybD5gjKnx9EO4JBlp9Jhxs7H1b11tXVCHoB8l3rlyz2m7u9yCVzTKGbleRIlkv8IZFN
 antUudBFAUOlMAEFtNYT82w/uHjaePvB2U9REzw16to2Dukp0QXmLAeBB47wo2S1sK6v
 wHZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeva5CpOYT1zBYsdoYI5fd4Jio2jl9XuOGOk0ZyKxqOfes8vxnhl1uO1XS6mnZGJ1moI2/Qut0SA==@nongnu.org
X-Gm-Message-State: AOJu0YzIKAh20PIx3fqMnXCPsdJs0CRcgRU7it/Hsb9U61EPblmrlq14
 Xh33wYtojP/5cwz7n68ZNPHeDDxb1Ykaj+EwG/lvy1s26vZJ4QJwJcsaVfmOzp1KnxM=
X-Gm-Gg: ASbGncsRaubBLQZ/amHscHtnYilCooklUMdw0fKifZlSMaHh48jJwcd5s6ZKhcE/bcv
 3z9Kl+0AN0vLGdBXTaG+cgue2pHEVaUMuTyhP4JOCTjUi+v39bRUVKRZ3uf1IyzFoobLXPbWEmM
 74DCJoE4hUAvVBOmbMQQ5RZA4N/YuStMZ6JqxTWu4eYDIR9JYx+fyze8f6A6DVo7jRVibWJv0pn
 oSAjlw9/rW4GUxLGZ5GbiLjnHBcDQ1ayOXhGSmfW1DAJuumiVLGWgN+STaO6HG2hk7a9U3Xmwak
 15vY4AOvn4fnjByci51Uy/4pzxPSLUSkPX+0nDDTV7OsWaxB2wJ3CkXzdesPoXC68duTPgyk9Dq
 k1pcgD+FPcz5O8U1bWovSO1n0EVORrpJjIOb5qppn8T8xDj7hCYIpMesoxjBQFDht39EOqsP8tw
 jTySEgPxM5Itf2xV0CPOkP/RpVN2fCwMmQh8b+w7mDzjueEhaGSQ==
X-Google-Smtp-Source: AGHT+IGujqbM2RjXJVAlLc70jZzuclKeSYJAFCyTf0DJOu/4srF0T9E+27x0dv/yqZGAmaStfXL5uA==
X-Received: by 2002:a5d:5c89:0:b0:426:ee84:259e with SMTP id
 ffacd0b85a97d-42704d558a5mr17702757f8f.24.1761224819006; 
 Thu, 23 Oct 2025 06:06:59 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429897e75a0sm3907266f8f.5.2025.10.23.06.06.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 06:06:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Stefan Hajnoczi <stefanha@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Collingbourne <pcc@google.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Mads Ynddal <mads@ynddal.dk>, Phil Dennis-Jordan <phil@philjordan.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>
Subject: [PATCH v2 48/58] target/i386/hvf: Flush vCPU registers once before
 vcpu_exec() loop
Date: Thu, 23 Oct 2025 15:06:24 +0200
Message-ID: <20251023130625.9157-7-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/hvf/hvf.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index de5e8b45d19..8acdfa952c1 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -724,6 +724,10 @@ void hvf_simulate_wrmsr(CPUState *cs)
 
 void hvf_arch_cpu_synchronize_pre_exec(CPUState *cpu)
 {
+    if (cpu->vcpu_dirty) {
+        hvf_arch_put_registers(cpu);
+        cpu->vcpu_dirty = false;
+    }
 }
 
 void hvf_arch_cpu_synchronize_post_exec(CPUState *cpu)
@@ -983,11 +987,6 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
     }
 
     do {
-        if (cpu->vcpu_dirty) {
-            hvf_arch_put_registers(cpu);
-            cpu->vcpu_dirty = false;
-        }
-
         if (hvf_inject_interrupts(cpu)) {
             return EXCP_INTERRUPT;
         }
-- 
2.51.0


