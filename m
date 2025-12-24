Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF06E75458
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Dec 2025 13:51:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vYPFr-0008Fr-J2; Wed, 24 Dec 2025 08:50:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYPDf-0006hR-PB
 for qemu-arm@nongnu.org; Wed, 24 Dec 2025 08:48:07 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYPDb-0003ms-DK
 for qemu-arm@nongnu.org; Wed, 24 Dec 2025 08:48:02 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so47220785e9.3
 for <qemu-arm@nongnu.org>; Wed, 24 Dec 2025 05:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766584074; x=1767188874; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T6TtjB4UQwqwRYPVMTfmB5PB+7achhP09+w7nxCkDKI=;
 b=wync6TykVjBatv8lpk39iwfBgbanM+e3A8BlCo/cxNCcZg6AkKq7+avI6XYftk9bgV
 TtkD3X0P5LIJ8rKcB994sJykLWcLKRuebc/6Rk8Yaqp+Zbr/1ICB7Uz3V8wSbbB+VYQV
 /14phIT6mGneeq3e+bVVmZiKrccc/JCnc1P+4leW8TzB7gTZbR28IGz50D9uVB0Mu98w
 TMC4rnG/rO2PYXYwJjymqpPkULvT/j+abcrZ+T+sj75EJ/xWGQBxbQuYq7hFpVpJNHa3
 trecqj7G8L7/UFj7VBcdpGxYS5wbWfyr+vcIAsdU8vPlvA5AhrmL1EdjO3YcpfK+jv0f
 /5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766584074; x=1767188874;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=T6TtjB4UQwqwRYPVMTfmB5PB+7achhP09+w7nxCkDKI=;
 b=kMHBLU6MZbzg30MhT8ifkGb9wnmv9fyTxxwt2AS/N532B9DbC7YnA/gj0NiEOY3Hs1
 f2OgMt6KppxTtgjq5utRi9LRNm1dHNjE4ptTNitP+FOXFx4yYuGaA4tKuiE3A7ssmHTY
 nAnWOq83JlEHjPa6Yw8fgLlN70nuo7uOvlblA8qroT/cGiLDKFiG+p/8Cb00rAmkLRBT
 biRCyajlsGY15l8bSidxAFATgfgaSGMLlbrbMghc6+odQsYSTdDNEbYNhXMbHs3QWtqA
 qdmRYntcWeYeGOIhJJjrrhVILBiTnZ+d2IAJ8VznLiZBNf6t8YN2CfByICX5C9n88HNT
 Dkyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyoetB5RslP50lz7d+uP0Lndm/d6dVOkC51pa7mYKETyGsS2I99PD/C0p0+aJfmPCBA3K9Jp/94A==@nongnu.org
X-Gm-Message-State: AOJu0YyEQ91Er/L3kJ8AzPtgJuJWtPyhm/rv7LtGtbs0qlyl+xEg3LNd
 Fu6QlBz/23WMFRyvZde/gYDnoTzqOeyyehj0ZGPlH3chL9dVtPKhl8fCKttN0AzhC5A=
X-Gm-Gg: AY/fxX589vz+SUUAv1od5T/XvnvlGFZwRm9Nez543A1wbqS1CRdpZrkjFj9s+UYr1FA
 hDvI/w4YAK4ecz4xHjHqo0UzfnbVAGCDFQsj0Zii+0FSYfAo8QNeFybfeILGqVMWXI0hI4YV1SY
 /66A07vyazPXbvwsqBVND0hVKq1nkW4XjCgF0sIneTxAdJ5WBYh34z2bCMKisF8k8dIWCAffF3t
 VhjPPWiqJzydUPU1gy75fdtqSeJs2e2DSHuGsZo3OiMo9fr7NtP9UpD8pUuqZXj7PDzm+9LQaLT
 ljR0f7GzOLR9VHPXRTfSrDwHolwnN0+fvAA2QGvfjIyZIJ93Vzhy9g8Ua75F3uY0NVqfz1ZhSre
 G9YB4N1jwpu3eplORBtkJS/CJ4XQjTe/Dpi79jEofqUX1pl4+mMg1AwTF64N9tvrXUfoT4xoYIy
 OijYtUf9MUqllfG2z8aNozQraurAPy20ORuVO/cSTXUlVTCAs41DQyNQfo92vY
X-Google-Smtp-Source: AGHT+IEds8kkPJ6QqXB2zu5iwJshyd1rZwMcqEAQN6/5Dria6axRmI64nWzGYXLbhdl7T2C8ApkzLw==
X-Received: by 2002:a05:600c:8b6d:b0:475:dd8d:2f52 with SMTP id
 5b1f17b1804b1-47d1959d1d8mr188452035e9.32.1766584074039; 
 Wed, 24 Dec 2025 05:47:54 -0800 (PST)
Received: from localhost.localdomain (218.170.88.92.rev.sfr.net.
 [92.88.170.218]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be27b0d5asm352244165e9.13.2025.12.24.05.47.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 Dec 2025 05:47:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, qemu-rust@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Anton Johansson <anjo@rev.ng>,
 Max Filippov <jcmvbkbc@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>
Subject: [PATCH v2 8/8] target/hexagon: Include missing 'cpu.h' header in
 'internal.h'
Date: Wed, 24 Dec 2025 14:46:44 +0100
Message-ID: <20251224134644.85582-9-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224134644.85582-1-philmd@linaro.org>
References: <20251224134644.85582-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

Both CPUHexagonState and TOTAL_PER_THREAD_REGS are defined
in "cpu.h" which is luckily indirectly included. However when
refactoring unrelated files we get:

  In file included from target/hexagon/helper.h:18,
                   from include/exec/helper-proto.h.inc:56,
                   from include/exec/helper-proto.h:13,
                   from target/hexagon/op_helper.c:22:
  target/hexagon/internal.h: At top level:
  target/hexagon/internal.h:29:25: error: unknown type name ‘CPUHexagonState’; did you mean ‘CPUPluginState’?
     29 | void hexagon_debug_vreg(CPUHexagonState *env, int regnum);
        |                         ^~~~~~~~~~~~~~~
        |                         CPUPluginState
  target/hexagon/internal.h:30:25: error: unknown type name ‘CPUHexagonState’; did you mean ‘CPUPluginState’?
     30 | void hexagon_debug_qreg(CPUHexagonState *env, int regnum);
        |                         ^~~~~~~~~~~~~~~
        |                         CPUPluginState
  target/hexagon/internal.h:31:20: error: unknown type name ‘CPUHexagonState’; did you mean ‘CPUPluginState’?
     31 | void hexagon_debug(CPUHexagonState *env);
        |                    ^~~~~~~~~~~~~~~
        |                    CPUPluginState
  target/hexagon/internal.h:33:44: error: ‘TOTAL_PER_THREAD_REGS’ undeclared here (not in a function)
     33 | extern const char * const hexagon_regnames[TOTAL_PER_THREAD_REGS];
        |                                            ^~~~~~~~~~~~~~~~~~~~~

Fix that by including the missing header.

We don't need the "qemu/log.h" since commit 0cb73cb5a02 ("target/hexagon:
Remove HEX_DEBUG/HEX_DEBUG_LOG"): remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>
Reviewed-by: Brian Cain <brian.cain@oss.qualcomm.com>
---
 target/hexagon/internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/hexagon/internal.h b/target/hexagon/internal.h
index 32e96f00d97..5fc837ae229 100644
--- a/target/hexagon/internal.h
+++ b/target/hexagon/internal.h
@@ -18,7 +18,7 @@
 #ifndef HEXAGON_INTERNAL_H
 #define HEXAGON_INTERNAL_H
 
-#include "qemu/log.h"
+#include "target/hexagon/cpu.h"
 
 int hexagon_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int hexagon_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-- 
2.52.0


