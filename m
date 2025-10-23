Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E372FCCD1BC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 11:52:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBtmc-0005jH-Fx; Thu, 23 Oct 2025 07:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBtmS-0005Bb-Po
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:47:00 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBtmP-00020g-Vh
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:46:55 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-421851bcb25so436968f8f.2
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 04:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761220010; x=1761824810; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JdN40+kSVkstc2XWFNd1L/Cor0bz7CuTliJrlZNlwww=;
 b=pOkw2yJmhBIxWs45jwvgm0eV7ZQPS7fCbWtBfLI1ymAzGf9wyaQE+3KDiyjYyPTSv9
 chfoojAwLtQr3vNcDod9GaG2Vu4LkkLnDp0OGuc0CHaujBCefK7wCOgh9WKkApsjXayZ
 w850qNeZM8rOoEXdy/dnnz6RSPl5KsX1Uj5qDxXZDM3V11NgxWXSFsECmpnTsxlkEdsd
 7pO/Qh97pICilGB3ELq0fYhOfKaZf7tIVeHiBg6jK67KnSDsLc1pGUWndVLPIby0BCk9
 wEBQq1oBf1jfWFiT7xO2JVhnkOvafDIn9ARbP3EyKEU75eKR6EHe6K7kbqfyCsJqyoFX
 Z8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761220010; x=1761824810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JdN40+kSVkstc2XWFNd1L/Cor0bz7CuTliJrlZNlwww=;
 b=XlilXYq7lHJZkL/Q2wrjq8jZq4ex+TePEuB6XS1+BR7g8mTq/8qye5b9ZS7u40su5o
 /urNBY5yKd6iAh3LqIoLKxYQDLjNl9MJ6gIoUT99sI20Hd7VRsmkKeF+66NVT8S2fLWf
 y/5Yl7IRQA+1YnvCpBiTwG2GCoqNUJJZTCkuuvq5kCy74YzDj92gCOVVu2DjsZzDCDu3
 ibYXbAgY+lanCn4t4kP1dOUVEcNTjnieAnjwMFNbCXB1ujAwvPjNdIeXlp6SRTJawWnK
 uXhS9TGox//Kc6z0YCoaKw9+qYsXcEhekTy0C8tTPCn+BECJLjgBaE1jq+k63zB3yW/d
 bmTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKWQ9hq7toMD6aIPk19puEptMLKRLGpuoQqlmTH6ysmojbVY8VxDDLlbegtXnE75jZ9sS8zffQ6Q==@nongnu.org
X-Gm-Message-State: AOJu0YzFz0kvCCjrZ6eA6XzwjgGVGxNI1JZV4WSR9jcxaTArgH9OK7Pi
 98WAdmfdjpFy3gPfQu1HZYwzWYaZvJzMcxRyQjr7sDBBB4vrVBYUpMeQJN5s1ssIuOc=
X-Gm-Gg: ASbGncu5FTb5QIYPfQ0iZkkNb0zOg+4wEDRiHdSWreOWsixyjRxsBkoPBW8WKrhfhq/
 9GN2HI7Sd6P2iM64fHcL8gNXltJA5a+YPQZPdgbZzMmVeC5n4QB9oNreXOP+SNhBDr7NDJWYW59
 m1nIoYLLJ92wr3EA+9P75LY7CcjOKavFM3jtSnAS6G5c29HZpSkUqxP0aXvOJ0LJFmaqPuLlMzI
 i0eC6goHKr7/t8HI4xjxVd6uMYQZ9chBwg4USP3yPsM7DXVbYi4GL4uww6WA4E+bibpILAAqwfW
 AXDr5AYTwjWHg6o0U12mU5YoicRMDYsoQb/vNW0iTR0Wg4y9TK6B52KiRuoogolHEJMbkeVpj2i
 hHO6Mtb4q5xMbE4zebZCi0SRAWovF34d2o0CCfKbDwCrqbegn8MkgXgoEUN4AjXUBzSZv6GkdkF
 hs3N7NhAHykHggo+0m62tjuEaLSA5v5WPFb6XAm9ib22nBieA/kFFsUwFfkp6i
X-Google-Smtp-Source: AGHT+IE5R/mZXUmIx8K/yYV3Zr0Thay0aTt+AVwPdgKSSZC6qzNAlISGjo4Zp8UFzA9Dk2KERu/fEA==
X-Received: by 2002:a5d:5f94:0:b0:425:856f:70ff with SMTP id
 ffacd0b85a97d-42704d99cf6mr19031297f8f.45.1761220010399; 
 Thu, 23 Oct 2025 04:46:50 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429898adc81sm3469526f8f.26.2025.10.23.04.46.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 04:46:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Mads Ynddal <mads@ynddal.dk>, qemu-arm@nongnu.org,
 Peter Collingbourne <pcc@google.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>
Subject: [PATCH v2 02/58] target/arm/hvf: Trace vCPU KICK events
Date: Thu, 23 Oct 2025 13:45:39 +0200
Message-ID: <20251023114638.5667-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c        | 1 +
 target/arm/hvf/trace-events | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 83db1088384..91bbd3a6aae 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -963,6 +963,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
 
 void hvf_kick_vcpu_thread(CPUState *cpu)
 {
+    trace_hvf_kick_vcpu_thread(cpu->cpu_index, cpu->stop);
     cpus_kick_thread(cpu);
     hv_vcpus_exit(&cpu->accel->fd, 1);
 }
diff --git a/target/arm/hvf/trace-events b/target/arm/hvf/trace-events
index b29a995f3d3..538af6e0707 100644
--- a/target/arm/hvf/trace-events
+++ b/target/arm/hvf/trace-events
@@ -12,3 +12,4 @@ hvf_psci_call(uint64_t x0, uint64_t x1, uint64_t x2, uint64_t x3, uint32_t cpuid
 hvf_vgic_write(const char *name, uint64_t val) "vgic write to %s [val=0x%016"PRIx64"]"
 hvf_vgic_read(const char *name, uint64_t val) "vgic read from %s [val=0x%016"PRIx64"]"
 hvf_illegal_guest_state(void) "HV_ILLEGAL_GUEST_STATE"
+hvf_kick_vcpu_thread(unsigned cpuidx, bool stop) "cpu:%u stop:%u"
-- 
2.51.0


