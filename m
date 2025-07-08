Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910BBC8303C
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 20:04:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZEXh-0003gm-Um; Tue, 08 Jul 2025 16:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZCQX-00031p-1a
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 13:48:27 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZCQ4-0005Hk-0z
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 13:48:14 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-60700a745e5so9212356a12.3
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 10:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751996810; x=1752601610; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RFonhSB51r1m9DRDPq3gxW3IKaSRsXZYDkC267ansE0=;
 b=Y6gF+ay9gZISK+zIB28pTi8xypNGhVs0n9KHy8ReQiL0WlhGO6iefqAM20dji7rj7D
 klTfG5KeGV5P47VU38MZr3P1Opp72z3PTYVqVq8mxYN1X8pkFdYapznje4TSigqkvP1B
 f7t7XhLAaNnV21nbpR7PNp+9yrQHC+vJpnzJ2vcJBXlmTxdD6SX24HWd1NU24Vd/XZTI
 Y2UdLTnHx8zj8TdhKuBysTASnUdIFtMBZKZ+86iK04kYnh4kIrSJnLXqMXJskVQSe5cv
 nIB3W/iV9nlDDlC1R6k+VHwmWieTegNcUnxbSbrkjRPLXQt+lGpdRIwrZu2W5/akUcFZ
 ml7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751996810; x=1752601610;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RFonhSB51r1m9DRDPq3gxW3IKaSRsXZYDkC267ansE0=;
 b=Hj3yS6C44OoNK42A3tabNJuvUfo7O4xlq+W/Usp4LcvTyqrCXmfuWG0TdiK/LlK6DZ
 7Q9Qs7QBuB3BTjoUgj4Orrc94ESA8+Xv24yoB4E93qnPT6wMIKCExzDowbxPfzM54KWo
 1j5asRQ9USpsuot/y8vvzJHQoUwWBOr+lV/My0NB6da7bWUgcgf6kEmVzf0IZsnGmcy4
 LxTIpYLw7y7hlrhP7aPAGER00L56fmbOaRBP0N1g8+L1102h7Eb5iSoNpX6HbLLNGA/V
 5Nx4ZRdjAQuHtKz8daympFTspO5qA9UuXAYBxnZ9BLzNe+0p9/T/m9JjjN5Uv6ZtkTpK
 NSpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVW5x/OF0uhFyBqSo+vx/bAGxUn/2HP1eWVRYmDLTBvWDZJrK5EuGmKb90eVjMiNGUmsNRvMFsuw==@nongnu.org
X-Gm-Message-State: AOJu0YwKytQsZizXpS/5EnX1CBMo//y8ZwflDv1SPeDQwVxV4eJbr5gi
 HgeJqfjGAwtZfEu1IUf5X/uRuQxjycTA7Vq4S5b+IMY9M3eFQ6AHd0NkiYXjnGWk86Ef/ZStB/O
 Ql662
X-Gm-Gg: ASbGncsYS8QMU5iYiEPox1QeC4Cudbw1+vFpc/k8i3ejJLvCPZO99Ya+tFkFHY7Saf+
 XLWekVVtREbAv3qIj5r3khYLC3G2F0i5qLAUzO3GXCT3AHKs87H7lPNcEJi32UBnwl9LJ4gQzzz
 uonb3PQCH9DJLZPd6a92awqGCkgt50EfRszcjdtUa+efG4d3GQdwkfx8i7JyfdRcMuh1fkqFega
 EZiCFOy4WKTliXB43yht8hHc/kkJXT3zrft1qStySUsmEiV/3ejB3NVyQj3KDlDmNeKa3XTgVhc
 tsH00DNrVfRND9B2XIR09RPWJo1gxz+sKYppOy0q8zfFmSL0g5HIjiZKwJMwm2zOuwC0tA30M70
 akabrzaCT0qrZIMB6uqeA+d5fpqVPtnWX+MRT
X-Google-Smtp-Source: AGHT+IFEQ+Grn2rKXvnzGJpvoE1KkuW74qXxlvK4ke3uCqnSbhamEV2TgSUSqn/9QolpXsBttWVTuA==
X-Received: by 2002:a05:6000:713:b0:3a4:f66a:9d31 with SMTP id
 ffacd0b85a97d-3b49701abf5mr13082687f8f.16.1751995380379; 
 Tue, 08 Jul 2025 10:23:00 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cd44ffb9sm28311905e9.14.2025.07.08.10.22.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Jul 2025 10:22:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 v7 6/8] gdbstub/helpers: Replace TARGET_BIG_ENDIAN ->
 target_big_endian()
Date: Tue,  8 Jul 2025 19:19:46 +0200
Message-ID: <20250708171949.62500-7-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708171949.62500-1-philmd@linaro.org>
References: <20250708171949.62500-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
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

Check endianness at runtime to remove the target-specific
TARGET_BIG_ENDIAN definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/gdbstub/helpers.h | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/include/gdbstub/helpers.h b/include/gdbstub/helpers.h
index 6f7cc48adcb..1411b136d5c 100644
--- a/include/gdbstub/helpers.h
+++ b/include/gdbstub/helpers.h
@@ -16,6 +16,7 @@
 #error "gdbstub helpers should only be included by target specific code"
 #endif
 
+#include "qemu/target-info.h"
 #include "exec/tswap.h"
 #include "cpu-param.h"
 
@@ -55,18 +56,14 @@ static inline int gdb_get_reg64(GByteArray *buf, uint64_t val)
 static inline int gdb_get_reg128(GByteArray *buf, uint64_t val_hi,
                                  uint64_t val_lo)
 {
+    bool be = target_big_endian();
     uint64_t to_quad;
-#if TARGET_BIG_ENDIAN
-    to_quad = tswap64(val_hi);
+
+    to_quad = tswap64(be ? val_hi : val_lo);
     g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
-    to_quad = tswap64(val_lo);
+    to_quad = tswap64(be ? val_lo : val_hi);
     g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
-#else
-    to_quad = tswap64(val_lo);
-    g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
-    to_quad = tswap64(val_hi);
-    g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
-#endif
+
     return 16;
 }
 
-- 
2.49.0


