Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5347CCA0FF2
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 10:12:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utkS8-0006hO-2U; Wed, 03 Sep 2025 06:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkRT-0006F7-D7
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:10:19 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkRR-00009a-ME
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:10:15 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-45b9c35bc0aso11007425e9.2
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 03:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756894210; x=1757499010; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BpXbEQrpDK50SMvtUWoxzqhUJ4k4wz+AbgMYLSbErPw=;
 b=my2rq/M1EI4TW5A6prlqirdmwy+G1K8sQEOi+svI0PDo73XvHc6msaq0uk30HQkbY0
 MGBVV6PDhs3/87RbGnEYM7spOYGkReTRNtRqSvaO0pyObs1E1NiguMphv8bppggI6Mi7
 ldWFLYoHv7T8d4MDxeOdV9H/ygXM5CaQk/eLW8mSc5mjWW5alqmhFTCGHteULmupcLW6
 H/L0cOFR8GbOltC6w02WMnEufYQTgW+QIg8VeShpTwWDtfYlcD26vhsS1UwKcL6qd7nB
 xkkkhachywE1LoiGr3YSkONbe078OqStXZ9Y/SpiWe9+E5MXZi5SsDk5LcVoVlKkHXIK
 opwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756894210; x=1757499010;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BpXbEQrpDK50SMvtUWoxzqhUJ4k4wz+AbgMYLSbErPw=;
 b=YpJuzs6hEXqsXqM2QAEagWUHNpCIsHg3xYa29ykhJNLOcGaCMCNJVCChEpOQGorXW2
 /6JfNrapSBHhJQ1MravlZyQHPxLJUiv1BD3dY+XhTJdgHzzh8GmX8429FSdLr80iIFQw
 hATYxMVQuqnS7eZzIW6+YlOXkypLZqwoXUZYoVFlvCFEthGXDbBwNajuAQN0vCvd0RtU
 mduU3BkhX9lneIaQGQx5KM8M+3SLHrESDeozyfGAcYKHEQLEJuMmNXsPLc4N0Aqi2F16
 XsMERfLOACf5Gq9KW5WaSbgTPGGqLionLvggXAzV83rmv8zRm7PhrlZkQmV7i7iCzxcJ
 xhQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVU3LJi/0lnvWCcQ+phGHO1y1gfbDPkOKdxgnMTfKiSgQokAa4SK49vo71uJUlVFj553eQ2ANtQTQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx7G4APaeAyhtyGoQ/DV6Kl4dTWZ9pef0aURtNj3R7sn0vkT3h3
 /x0kCoji46l/rQrlcRZ21f1OvkyuKMboReN62+wkHx/9FJMQRsHj/KaV/k0SFx/PnFU=
X-Gm-Gg: ASbGncuw9fx2LrVt16zcNUK62MWpO8cAB1jXCwHVjglLlHuy+izdf5R3zKJX4Vxyb0p
 XecO01Awtm1TQ5RwOOkiJ0MNpqKy7A60nNpFkh1/6WXko2Xg7v6YRXpqkSlfE5T16z9cuP7yYsY
 AAGMhB4ZjEIiA+xe7lVGo8mRntK2vJ6DdBZcd58IUPcFoqqhCc98N6i6+yMzt9SREanOnnuj8x6
 S6+otgCvrTUcjcCyHJ5CFXaM60qGars6KjA12A1I88gRBEh3Zu7Wml9bSe6q5TeCT50uHoArwIt
 Ym+lrY8K7/l9i8LymT05Y9T8TN/ti39Gx7XerCHc3XFYziRcZwvt3FJ+wqoaaeScf4XbS3Hpyqz
 3PkydYR48Gd7zbifobBV0kVC9rAr7j8o1ENu2svNUYtteMCvk1E1CVP0elS9FMRZZBvQ7nnQ/zK
 pkWZxJUw==
X-Google-Smtp-Source: AGHT+IH9fcHFERGeULzOi6U7b9bTjsQMBq100wAXosiiqaMXG+O1tRl2V9v2vrhTxaNa/exK/C6c3Q==
X-Received: by 2002:a05:600c:1d07:b0:45b:6b57:5308 with SMTP id
 5b1f17b1804b1-45b855508e0mr126523875e9.7.1756894209562; 
 Wed, 03 Sep 2025 03:10:09 -0700 (PDT)
Received: from localhost.localdomain (98.red-88-29-180.dynamicip.rima-tde.net.
 [88.29.180.98]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d0a1f807f9sm22217368f8f.38.2025.09.03.03.10.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 03 Sep 2025 03:10:09 -0700 (PDT)
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
Subject: [PATCH 22/24] accel/hvf: Restrict ARM specific fields of AccelCPUState
Date: Wed,  3 Sep 2025 12:06:58 +0200
Message-ID: <20250903100702.16726-23-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903100702.16726-1-philmd@linaro.org>
References: <20250903100702.16726-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Do not expose ARM specific fields to X86 implementation,
allowing to use the proper 'hv_vcpu_exit_t' type.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/hvf_int.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
index 195d64dcf18..3d2be4092ef 100644
--- a/include/system/hvf_int.h
+++ b/include/system/hvf_int.h
@@ -59,10 +59,12 @@ extern HVFState *hvf_state;
 
 struct AccelCPUState {
     hvf_vcpuid fd;
-    void *exit;
+#ifdef __aarch64__
+    hv_vcpu_exit_t *exit;
     bool vtimer_masked;
     sigset_t unblock_ipi_mask;
     bool guest_debug_enabled;
+#endif
 };
 
 void assert_hvf_ok_impl(hv_return_t ret, const char *file, unsigned int line,
-- 
2.51.0


