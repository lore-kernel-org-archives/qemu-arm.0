Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CC1E77361
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Dec 2025 15:26:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vYQkS-00084r-Gv; Wed, 24 Dec 2025 10:26:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYQkQ-0007s0-SS
 for qemu-arm@nongnu.org; Wed, 24 Dec 2025 10:25:58 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYQkO-0005DX-RG
 for qemu-arm@nongnu.org; Wed, 24 Dec 2025 10:25:58 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-64b8e5d1611so7292556a12.3
 for <qemu-arm@nongnu.org>; Wed, 24 Dec 2025 07:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766589955; x=1767194755; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xSaQ9Qe9gNNW74tyZulPjxgdKifD8+Rh/MPoJOBFnM8=;
 b=hkndrOPVRp3k1mIL/I0pVWhRuxDCTBm/EL5QunOvcpj21FEb7yAosXNGJBqXgGprBY
 JVFk2CjygN6613BXyUEUiRyklkUMRoojmitSHiDzCyrP1N+lOnDcZlo6VrXIP0pYEjN9
 CyMSzXC7GShZuJc3QwMIV4JZFSbWbDK8/9G1ZOW0rzXHOnTsXQ53F4qlMH2Sv8aQabz6
 liYX+O2uVpCJ1VaXBBISSles4e73b8Uflm3I78bWxYnP6h75adB92bHBLXs0TDMr+hk3
 BM0pS3V1CGDc8/0LcHacu2ZGZ/LGIB/KozmyxG+XPKtbm5HYeelHYQKQ9tPOqljLKml7
 DcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766589955; x=1767194755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xSaQ9Qe9gNNW74tyZulPjxgdKifD8+Rh/MPoJOBFnM8=;
 b=OnXl8p173cSVaaCvt8zJ9jFs+u07bhqaoMCr/ISgwa3RWew6mdlkQek8udBG5YKCKU
 BAuro8AmZw3o1bSxWHjIgMBJnol7LnaYNpAGWuCX8kD3aJaeDo5Jam4fliQD2r+CZKDk
 jZmWLItRp71W3yglFuDZfwJGL/HYXnv3+EYEE094o4oxO1bc9JnKR08ORPTKQNxBw/pX
 1idSSkv+5PBcbi+xOJfjgNxWjouFbGFAX192fRGrepFbk2dof2flHXnjbs5+Vlz3Ghzm
 3J2CUb/egTj9MnW2XUdk82XoyOe3fDtGRc8O2sw+ilOTBHUjBQ+/CP4647IcU3zrAs5Q
 W8XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2XcdgomORn2eIr3n4BRxCLPt9jg+GvHZLVOhlgConAsqIpRtnIoNE8bR+R4N9o0pVIG/250RDDA==@nongnu.org
X-Gm-Message-State: AOJu0YzIQDNnw905uAkcI5bA+ScimKkCywLq9t1mca//RUWy0+T1yyE6
 Sd7zKE4Ao4zDta65afXNrksZewfsbbo/Z6rxgveDanNdco6x0gGHnh8czERc+GOhXFk=
X-Gm-Gg: AY/fxX4JvsieS9vNxsPqC24BvYYzt/PJy9tiBrb4FWxCKYOOsp82zorMXybBaIQj8LU
 aVFQ4hCD+gLO3qNEsu3abX6QYDPOxz6JPnmnSYfAnnsypLR2QXWKW4nQk3AMGX21Au5eM3OiAVs
 7if//trEE0lIcwalEm9u2MO3w4brbExrzZrVkc5yEVcC+TsyVu4SIbtiPN/R+SNqpUuFGom5bDg
 YAl7BSPOzAf54y2+re0iYXJwM31FCHltXoa2j7SugdgwvLHlkZPDQqN94L2vK9McKhquq2Mcdfg
 a95FD9arq2G61EMgZ+oe6jfFLhl8QYj1i9mL4gh9Cj3lXupOcw95Yq/tArW9wdiKqaVI5lXyEQT
 IUdsNrUMrYR0dvMYIyHZ5IanWlw21n0JSdWe+D8g8JxYuPvI5IX/Dh0zEwzS5/GWsFwi6SEwd7o
 gz+E25XJ/Gd3uhfjbnEUEFT+2BHWvf+2fMWJMHeW8nNw2ktD1/vDpR5aw=
X-Google-Smtp-Source: AGHT+IFkbLr7aY1nUOqUyXb6DfAsCWmmWLGM/P+M6MBBkPouRZ+JQvcKtbXY6DooiBbooHfGQmxCAQ==
X-Received: by 2002:a17:907:3fa7:b0:b73:6f8c:6127 with SMTP id
 a640c23a62f3a-b8036f113femr2073226166b.12.1766589955159; 
 Wed, 24 Dec 2025 07:25:55 -0800 (PST)
Received: from localhost.localdomain (188.171.88.92.rev.sfr.net.
 [92.88.171.188]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f519c0sm1771545366b.71.2025.12.24.07.25.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 Dec 2025 07:25:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, Aditya Gupta <adityag@linux.ibm.com>,
 Glenn Miles <milesg@linux.ibm.com>, Gautam Menghani <gautam@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Subject: [PATCH v3 23/25] tests/qtest: Remove unnecessary 'qemu/bswap.h'
 include
Date: Wed, 24 Dec 2025 16:22:06 +0100
Message-ID: <20251224152210.87880-24-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224152210.87880-1-philmd@linaro.org>
References: <20251224152210.87880-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x531.google.com
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

None of these files use API declared in "qemu/bswap.h",
remove the unnecessary inclusion.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/pnv-xive2-common.h     | 1 -
 tests/qtest/aspeed_smc-test.c      | 1 -
 tests/qtest/ast2700-smc-test.c     | 1 -
 tests/qtest/libqos/fw_cfg.c        | 1 -
 tests/qtest/libqos/i2c-omap.c      | 1 -
 tests/qtest/pnv-spi-seeprom-test.c | 1 -
 tests/qtest/vmcoreinfo-test.c      | 1 -
 7 files changed, 7 deletions(-)

diff --git a/tests/qtest/pnv-xive2-common.h b/tests/qtest/pnv-xive2-common.h
index 2077c05ebc7..3b842274243 100644
--- a/tests/qtest/pnv-xive2-common.h
+++ b/tests/qtest/pnv-xive2-common.h
@@ -15,7 +15,6 @@
 #define PPC_BITMASK(bs, be)     ((PPC_BIT(bs) - PPC_BIT(be)) | PPC_BIT(bs))
 #define PPC_BITMASK32(bs, be)   ((PPC_BIT32(bs) - PPC_BIT32(be)) | \
                                  PPC_BIT32(bs))
-#include "qemu/bswap.h"
 #include "hw/intc/pnv_xive2_regs.h"
 #include "hw/ppc/xive_regs.h"
 #include "hw/ppc/xive2_regs.h"
diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
index 50a87e62500..39af1df0ed7 100644
--- a/tests/qtest/aspeed_smc-test.c
+++ b/tests/qtest/aspeed_smc-test.c
@@ -24,7 +24,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/bswap.h"
 #include "libqtest-single.h"
 #include "qemu/bitops.h"
 #include "aspeed-smc-utils.h"
diff --git a/tests/qtest/ast2700-smc-test.c b/tests/qtest/ast2700-smc-test.c
index 62d538d8a3a..33fc47230ee 100644
--- a/tests/qtest/ast2700-smc-test.c
+++ b/tests/qtest/ast2700-smc-test.c
@@ -7,7 +7,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/bswap.h"
 #include "libqtest-single.h"
 #include "qemu/bitops.h"
 #include "aspeed-smc-utils.h"
diff --git a/tests/qtest/libqos/fw_cfg.c b/tests/qtest/libqos/fw_cfg.c
index 0ab3959171b..8611f648c14 100644
--- a/tests/qtest/libqos/fw_cfg.c
+++ b/tests/qtest/libqos/fw_cfg.c
@@ -17,7 +17,6 @@
 #include "malloc-pc.h"
 #include "libqos-malloc.h"
 #include "../libqtest.h"
-#include "qemu/bswap.h"
 #include "hw/nvram/fw_cfg.h"
 
 void qfw_cfg_select(QFWCFG *fw_cfg, uint16_t key)
diff --git a/tests/qtest/libqos/i2c-omap.c b/tests/qtest/libqos/i2c-omap.c
index 6f98f54820b..71f70c64f85 100644
--- a/tests/qtest/libqos/i2c-omap.c
+++ b/tests/qtest/libqos/i2c-omap.c
@@ -10,7 +10,6 @@
 #include "i2c.h"
 
 
-#include "qemu/bswap.h"
 #include "../libqtest.h"
 
 enum OMAPI2CRegisters {
diff --git a/tests/qtest/pnv-spi-seeprom-test.c b/tests/qtest/pnv-spi-seeprom-test.c
index 8033261758b..44e0b92730b 100644
--- a/tests/qtest/pnv-spi-seeprom-test.c
+++ b/tests/qtest/pnv-spi-seeprom-test.c
@@ -7,7 +7,6 @@
  */
 #include "qemu/osdep.h"
 #include "libqtest.h"
-#include "qemu/bswap.h"
 #include "hw/ssi/pnv_spi_regs.h"
 #include "pnv-xscom.h"
 
diff --git a/tests/qtest/vmcoreinfo-test.c b/tests/qtest/vmcoreinfo-test.c
index dcf3b5ae058..0110dcceffa 100644
--- a/tests/qtest/vmcoreinfo-test.c
+++ b/tests/qtest/vmcoreinfo-test.c
@@ -16,7 +16,6 @@
 #include "libqtest.h"
 #include "standard-headers/linux/qemu_fw_cfg.h"
 #include "libqos/fw_cfg.h"
-#include "qemu/bswap.h"
 #include "hw/misc/vmcoreinfo.h"
 
 static void test_vmcoreinfo_write_basic(void)
-- 
2.52.0


