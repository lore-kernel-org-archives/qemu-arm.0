Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7E5CCF9E0
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Oct 2025 19:38:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vCNcL-0005ez-L2; Fri, 24 Oct 2025 15:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNcK-0005eX-I3
 for qemu-arm@nongnu.org; Fri, 24 Oct 2025 15:38:28 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNcH-0002Yv-Uo
 for qemu-arm@nongnu.org; Fri, 24 Oct 2025 15:38:28 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-471191ac79dso25021705e9.3
 for <qemu-arm@nongnu.org>; Fri, 24 Oct 2025 12:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761334703; x=1761939503; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=06EZMC4tBC7cPd7PMFGh3c+i0do87VDtuboi/W62pEQ=;
 b=S382Zg6Z5oZGkpF4VHWNMPsVeraUoaY3aNoUJp4cGGmiwi+VwHAW6EajlkRggB6vg2
 hBddnX5V/1e6rc2/G2iT9/9hKfmr4smO84vsOl4WJDOtYSNeNiwIqm8IXdwnxQObHi8W
 0g9Fv47P3IYH0Hm9xE00XbwpLQZ8lQ7LXTdFgBVCN0mwWYKZMDNRrc9K67V1QYhyuOQS
 eTlOB0yf+orT7CcNaY1gGUPPtt4FEOuVbIOGX/1VEhvTB4rSw//0pPJ7OsA5TS5//O5P
 C1bTodCny0JSOVnf76tdNUXZ7QPQufD1+hgREmy/k+EUAX042K3a7KWYiDJRNricTwJb
 bzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761334703; x=1761939503;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=06EZMC4tBC7cPd7PMFGh3c+i0do87VDtuboi/W62pEQ=;
 b=ruGKXRuFXSi2vQt5JYQ6oKq+C31k7ZxvdC16npfKXBxNdh1lzcbVqWnUhIGy7TR/Gz
 /uK1n7GqzHwIIArMViV//oiFaJvqSeQnxxeXxLX9ymfqXlg3V4284Mr9LB8q+7IHyG16
 /TWvWN7eISprAS2ks0h8qVq07FEYbGX66gJs7l+WtAMtCXg711jGoLvYMN7cec4eY/lZ
 e1TleTqnKyF8fjFfDWoT9gLb/FaRoWH7DFSdOYoWZ/dJUgk48CTal+S0y4hbAMsrHsuG
 yH4OVde3+zWHFHc8o0YBvPPAsME8hBnAk5dCdV45tl2+e8qex+sWoUOojR/wErIsv/iw
 c6Tg==
X-Gm-Message-State: AOJu0YzvXiFkSDW65zoquOFJb47IY/Oo4YRJ+Y2QO2c2OCJy1YCUeGcq
 GasvLxsbOPKMagQhDmz+dWNfe0zGPmvmuBiibmeJzxfknqcZTk3TlyXoOP0Xww5hTRQ=
X-Gm-Gg: ASbGncvoEm+FIUsiGFajxVt7oZaOkC4PD4nqAQqUE1xSqivZh550Mto+qc8Kuvlp5OH
 Y3YbDRuBQgPorZnIZaTIlLA2xvUw/6Y4SPmXveIB7f6yYKB9hsBsEQXOyEl+iDn3xMJo6OeEnC8
 ebbNw6hv+mPW+XIfmJnwo7qZHibXKZ5shmLRwB3f2sYKQaAnpoi7La120kPwKXpoJ6A+u+1U2h3
 LSkEpSKqtmIn6Zjr4oopaA1R0V5rfMc5KAxHM8J3My9k5TGFzDUskWLl+AT43dWjJsS+JvrKiz4
 e4W/FuFUeGF7cg3597qFyGmkdCQPOLNNU8Y4QEEqGea8033EJtcAK7hXC9rYGN6+wrCIWajee5Z
 xJycVU4Z4LfVqnqJs/nlfxf6uqBIXQbZBJjhgamgWLUBxOd+dlQdlSCXtK7E5cvXjPEjAeM900E
 sd7yBsB2rp6MKkyb5Vf3B1z7L6aLj88Apzm2rR1rV3bpeMbILjpn850LLOa8tz
X-Google-Smtp-Source: AGHT+IHnrPLiRhL2oVl9b+Hfwoc72motDn5PtrgzGLhtUUifl/weU/eTWhEL2TRc1lzgyH1I/3ugzg==
X-Received: by 2002:a05:600c:1ca0:b0:471:168f:717a with SMTP id
 5b1f17b1804b1-475d2e84559mr32749575e9.16.1761334702984; 
 Fri, 24 Oct 2025 12:38:22 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475caf15416sm106478365e9.10.2025.10.24.12.38.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:38:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH 22/27] hw/rtc/sun: Include 'exec/cpu-common.h' and
 'system/memory.h' headers
Date: Fri, 24 Oct 2025 21:04:09 +0200
Message-ID: <20251024190416.8803-23-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024190416.8803-1-philmd@linaro.org>
References: <20251024190416.8803-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

"exec/cpu-common.h" and "system/memory.h" headers are indirectly
pulled by "hw/sysbus.h". Include them explicitly to avoid when
refactoring the latter:

  hw/rtc/sun4v-rtc.c:28:18: error: field has incomplete type 'MemoryRegion' (aka 'struct MemoryRegion')
     28 |     MemoryRegion iomem;
        |                  ^
  hw/rtc/sun4v-rtc.c:52:19: error: use of undeclared identifier 'DEVICE_NATIVE_ENDIAN'
     52 |     .endianness = DEVICE_NATIVE_ENDIAN,
        |                   ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/rtc/sun4v-rtc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/rtc/sun4v-rtc.c b/hw/rtc/sun4v-rtc.c
index 29e24ef6bed..c0859b270d3 100644
--- a/hw/rtc/sun4v-rtc.c
+++ b/hw/rtc/sun4v-rtc.c
@@ -17,6 +17,8 @@
 #include "hw/rtc/sun4v-rtc.h"
 #include "trace.h"
 #include "qom/object.h"
+#include "exec/cpu-common.h"
+#include "system/memory.h"
 
 
 #define TYPE_SUN4V_RTC "sun4v_rtc"
-- 
2.51.0


