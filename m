Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C691CCD1BC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 11:48:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBtnR-00086G-SJ; Thu, 23 Oct 2025 07:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBtmr-0006HS-UO
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:47:23 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBtmo-00023F-R3
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:47:21 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4711f156326so6890365e9.1
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 04:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761220035; x=1761824835; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PXz77BrZW3QUmlVNh5gnW4lPNFdnFM/IGe1E/YtD1U0=;
 b=AP4s2tyk888yIHsq5rxJaiHBNivDELc8peSJie6uyHaAHJCvnD1//4lwfg0GdeQ3FZ
 2Xe89JvaYBlSZCAqFuV2evtfcXFY/uObrgHSFfoM421ZumxBuDFVO3LGtQvoUvpOWrT2
 8apisztDBH2CosZLYhirCO2hEfQwzJQuh7JVUgyu+3X+kSAtlH3AEjqBZ4kjHAgQMrGk
 jM9OKQ9B0mgYoL2IB2ANYflRt13fETJ0CUSXyoVEuMABEPVtVmOXt+qyNSrE5PW36EN4
 pdhRjfo7NrWvkg+v9LMIimGTHVMC443QlH/3BxJiZQ4dIdjiSiuJfW+9TSqPlL2l41JS
 4yYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761220035; x=1761824835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PXz77BrZW3QUmlVNh5gnW4lPNFdnFM/IGe1E/YtD1U0=;
 b=fiiXvUSiIUEomOHOgLAZNt4FfHr9zwsmHDgO+7RpMH5plprgU44g0lQpYoYTW7LO3Q
 3JXEZeGGqBLMhjNowDRQMzeCYEs6ETLo7xLOYIMfCLZxQlcTi1Yfc9KzLs4DfZHv7dYo
 DQJ6OW5DNlAXC5FHhL1rOJcPkjaptqXt1qs7l+CcA4aD+vm3H9E/p8qpN3oQGS9EA4Q/
 RNYUKkcagwnCjQRNNOpVbwQ+TQGiJPo+E2CIPVPRoJglAlFA93fSg6WpeXjinp5fP2iB
 qFSxKzjXkxhRtUgR4XyBWkxAGIPpJfGk2GkpRr68wjjJnW2t27rK0/jifGuy7iEucOz6
 DROQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1hqLjZoRd9CcBkNv/3c/tR+cOwQZX7A06mA7u0dlgwnZLUw4uxRLD4+Qn8ZzddjaOeawb3sCCsA==@nongnu.org
X-Gm-Message-State: AOJu0YzRfgoLUEQh2z1oM58oxyLc9OnS9h0raiIRy0faqo8KsNkk9bu8
 Jx0a1RIp9AJf+XWkp6nL9f2bou+l1+n45vkfukRe9kugeg05rvtVz5h2Vy20oJsG40Y=
X-Gm-Gg: ASbGncvn/xHNxfjN1ry8/5Ez8HmeF6+vcpS1A+WVCF/l7L1DEFzOs7sUEkinboyw4E3
 VFdvoiOHnTz23TNpjy2ZxF/FYlDCL/dS33TVrOqd4UXWs40lOF0dQljSNpKVqOcY4egZ1iGRnoy
 I9B/aWrEyyjxzkRb/IYCqPB8edUioTaujwEBKYRk9Mw30TTL/QMmFx/tMc2Zk8xBNGeNGQUsOVH
 TyMG6xB9beWV/WQNDVkI4SED6JWA9Jh+yM42Kr0eBGj6QNCSUHMrVyojBplP3Mo0H+R9nTpV97C
 73jVjl3a+7ZoWvdn1WyXJt8SwYwzx/zDu4MO02UoE3zorzp9kgrXv4xYQisVpxzsDgZqQIpH5rf
 ++CAOJTLHh1ZPnq3XAprDebZc7FuZOhqKiYMeF4bIuAMGeu5vxXkZ/H9bsM4XPnmYm+kWZpgnR/
 xlTHzbnvjtpGtL11fEa63T/eQHtn0lRkhNs6GHMhO5VbwQTxtnxAyyfWF+wSbrxpjd3DgZeqA=
X-Google-Smtp-Source: AGHT+IG40mtVqCovXd+9LEpjM/bYQFuHSQCHhYNWE4+XKKPR2r/SITrZ2eIfuna2/wOrb33dtGCIdQ==
X-Received: by 2002:a05:600c:1396:b0:46c:adf8:c845 with SMTP id
 5b1f17b1804b1-471178aba5bmr160769465e9.16.1761220035456; 
 Thu, 23 Oct 2025 04:47:15 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c428e9b2sm93063075e9.5.2025.10.23.04.47.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 04:47:14 -0700 (PDT)
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
Subject: [PATCH v2 07/58] target/arm/hvf: Mention flush_cpu_state() must run
 on vCPU thread
Date: Thu, 23 Oct 2025 13:45:44 +0200
Message-ID: <20251023114638.5667-8-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
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

Since flush_cpu_state() calls hvf_arch_put_registers(),
which must run on a vCPU, it also must. Mention it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Mads Ynddal <mads@ynddal.dk>
---
 target/arm/hvf/hvf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index f0a0e5d1a75..fdf8df09d4b 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -689,6 +689,7 @@ int hvf_arch_put_registers(CPUState *cpu)
     return 0;
 }
 
+/* Must be called by the owning thread */
 static void flush_cpu_state(CPUState *cpu)
 {
     if (cpu->vcpu_dirty) {
-- 
2.51.0


