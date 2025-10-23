Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFC9CCD1BC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 14:32:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBwLu-0003XH-NF; Thu, 23 Oct 2025 10:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBwLi-0003Nm-Jk
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:31:32 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBwLa-0001vA-QR
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:31:29 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-475ca9237c2so5212075e9.3
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 07:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761229878; x=1761834678; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DslsWZRISh7psS9m/3Vcm25WGBA0WCzWSpcN8EjiiSM=;
 b=DM86/v/Ssz+U2lZjZX5gPDDtMVmJ2dI+OdMbSDBP+vOYPxIULXBr7ANt2IeZl28nZp
 MPEy2wZqcRBw8mRGynY6Nh0Z9AnWdSOcQlPb/mN3HLu1mFYVgRwEiYeJNMWLSmadDXst
 wtoaUgkSay+KGRvRu4b+iiiNRMvggETMAda4BPBfHsJ8i068/3hZrkCb72Z7gecH3Q8V
 d2SZfP6yV6qAj7UpUYYXdplff1HcODHfe/voppBfwzx1JEuzEcQVyAi+L95w/9rgJ8GC
 hkZ6ViNuhGh+4l0nSJxCFdMMfR5B8VIJxbCHEA9aT0Gmo3y1R8UyCB5v/AeYIwSpgNnl
 q8oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761229878; x=1761834678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DslsWZRISh7psS9m/3Vcm25WGBA0WCzWSpcN8EjiiSM=;
 b=fTQmmvjl+27QKQIz0FyguF5vgUmT8WFTR4jPXfmyLlBiuIgtWQcuDOjSgjs12pQjoh
 rZgnZI4gMkGWk+CJqB5oEWFIDLJchh77oFucsBBwL2GXWPcDT4C7Ks4fg8n8rH5/QmOd
 w40ckAAbJGscB9yZz3sBr/SUMurQQ6IJ0zRpiNU2yVuv7fHDpjgnbXr/WL28fsTJCwya
 kbq0x4UNCPdm9e066jM3bt1MxhNejkTxTXH6SZlUwdQ9HvcunhY21pwz/uzxxwsk4EzB
 Tl/yGFHvhyXv3xUyRiI7DwSMMb+HXcxqYe+cmyHHPcQSQSri7elvLdOWi8ixZsGbz5Nn
 1tsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvbX2CuOCVT2qYMgqvZBM6zWzucoJhUWh4OwMWCRuEJW4xLud5XDUMHY/cQjbfmT3op9FU4vL9fA==@nongnu.org
X-Gm-Message-State: AOJu0YwJ7S7tY8nWervlrETGOkOjVw4+9iDjHv3dPHn/Esp7F4pHX1mB
 ePinDiG8DS0inHeOAfHOdD+gkQdiqrbeA4T8L5pY4EfuxxL0ucOCL0QEWg9UKeOeNDA=
X-Gm-Gg: ASbGncvpIJ8F1xICMLE/li/Wc2fra94Q1xh99nFqCrPjIak3hsuDZ5qvPYOj8L4Vr8X
 5uqLi/RwYTfEMlx0CLp98IuhPgLEs1G1QPbGLXNE/FwttG5EvHTcscoASf1EO6O+yXztW5enJFc
 +xMPBo+qSNsa1cCfFkZFLEpHJt/rx3H0ax54957xHzD/agLDRWLZuhbjwQyuSqupVdtyGSyco7Z
 UrS9g38/Ox9UxEoJ/OZzBNaxaEs/V0GG4owcqnOTWGkqd95Gmp3K+Kveo1lLLa0NXx8b+AFy6EO
 WVqNjqvUyCxJjQc3ITFRDaR1LjCdqrZFafyWlKhtO9W+oKshB2c80X7StzkoRqoeQGdghFduixX
 awgehx8wOyLZThvinD3movSy0JqPOmBVi9kOEn9dSFd8jG6OLN3gL1kKJyapMbBGWHgPXdApt/Z
 NTx7Txf2k0BBa636ZqgjPerEsfuCS25I6878kUXVCL7QdGBdAYPe4IZo0FkZji
X-Google-Smtp-Source: AGHT+IHnqCO3OclczupLRt+ToLRSlrB4ZN0DpT4EbwOFTjy88cSPESepugjR271vr7x5UyTpD3KtGQ==
X-Received: by 2002:a05:600c:548a:b0:471:669:e95d with SMTP id
 5b1f17b1804b1-4711787dcc8mr164752235e9.12.1761229877945; 
 Thu, 23 Oct 2025 07:31:17 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475caf2ef9fsm40582415e9.13.2025.10.23.07.31.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 07:31:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Alexander Graf <agraf@csgraf.de>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Peter Collingbourne <pcc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cameron Esfahani <dirty@apple.com>
Subject: [PATCH v2 25/58] target/arm: Rename init_cpreg_list() ->
 arm_init_cpreg_list()
Date: Thu, 23 Oct 2025 16:30:46 +0200
Message-ID: <20251023143051.11195-6-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

Prefix init_cpreg_list() with 'arm_'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 2 +-
 target/arm/cpu.c       | 2 +-
 target/arm/helper.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index f539bbe58e1..972b8bc50da 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -376,7 +376,7 @@ static inline int r14_bank_number(int mode)
 void arm_cpu_register(const ARMCPUInfo *info);
 
 void register_cp_regs_for_features(ARMCPU *cpu);
-void init_cpreg_list(ARMCPU *cpu);
+void arm_init_cpreg_list(ARMCPU *cpu);
 
 void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
 void arm_translate_init(void);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 3b556f1404e..bfc031c70c1 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2138,7 +2138,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     arm_cpu_register_gdb_regs_for_features(cpu);
     arm_cpu_register_gdb_commands(cpu);
 
-    init_cpreg_list(cpu);
+    arm_init_cpreg_list(cpu);
 
 #ifndef CONFIG_USER_ONLY
     MachineState *ms = MACHINE(qdev_get_machine());
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 167f2909b3f..9e26edf4dd0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -252,7 +252,7 @@ static void count_cpreg(gpointer key, gpointer value, gpointer opaque)
     }
 }
 
-void init_cpreg_list(ARMCPU *cpu)
+void arm_init_cpreg_list(ARMCPU *cpu)
 {
     /*
      * Initialise the cpreg_tuples[] array based on the cp_regs hash.
-- 
2.51.0


