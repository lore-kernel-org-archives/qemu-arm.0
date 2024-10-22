Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2943186njb;
        Tue, 22 Oct 2024 02:43:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWp/EMHPdDznB3RVfoN1moJSC310/4pdf7ijm4vv33gz16dFcuh+iEXS15IzMmE5ujdaznGPl0jy0A89A==@linaro.org
X-Google-Smtp-Source: AGHT+IGJXX6E0zHRHoNcy4y7xfEEmcpzTHhXbaTWNnXeriebSZsvXl0Z8BO+45p5kXluH/qqSU4D
X-Received: by 2002:a05:620a:46a5:b0:7a1:df6f:3625 with SMTP id af79cd13be357-7b176769909mr271374585a.37.1729590201650;
        Tue, 22 Oct 2024 02:43:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729590201; cv=none;
        d=google.com; s=arc-20240605;
        b=Guho2JS3OBKjbzkeW1hCh4EoG+C6btj6FG/u7zOxiIVAj3vE3GKjBLz6aHLoZc+USJ
         o7Y5H/++9bZ8aClC1YiuwxUl1N2w1e13sp7L9YL6tzt8kusMIrsxU3bFfRwpuHBvrU+a
         3zRvviP7fKhzYh0OuNO7ibkklKQ1rbUDVCbWrSXOqokc5SubZJsLSIinfDUfM0KZQA6m
         uuyTIbUUjlQePjLXivPHwS9oP05UZpC5FZsUrUXEbS4hhuZHaMO3S4OT9ieK3/Ys3vcU
         s7qlMk5OGWgF530guehOSystG7PigXN7MrDNItflsTxb6sSfDLzt/K/6GjdxHeN+b+Db
         UoVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=RGet0aL3NVwUUZ4biIY0qDNhN32Nh8SqsWct2nR/Me8=;
        fh=RVX+uUL/oYxgKlLpNyiQfzI75/ka+93kXvmeIy2Oap4=;
        b=A0+qO2kgYC3VqcdxxCUOMvJc3JvLTI1IrT5RAxKOrla0cmIu3+wqVAGBekU4MXMIJt
         yl5YxvzH+jtqSK2+BjUquYyaXyDnpLUiWRDiudAmGBqXwz8RS8ae/kHu+r98zaHrxqZT
         BxckEA4i+i/Kv7F99pUlxZgMeCN8Hzrp0+7GLZmhxz5yq2n63cYJwu9iq8ZFBx8yukyg
         mkdAnfyAuxzBaWXAocaRgLd3/C94mnh2KPcsCCX2zNhRonjVdpc3kzPkvkdVNu2Bp4oL
         QTZzG1OmsTGNJzSh8NmeRNM5C6V+Mjyx+wK7m7mRhf/Be/98MswH8hDk48VQZimz0UYL
         3PiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b1659cfe64si605764485a.134.2024.10.22.02.43.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2024 02:43:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t3BQ1-0005bu-7B; Tue, 22 Oct 2024 05:43:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t3BPt-0004qD-Ly; Tue, 22 Oct 2024 05:43:05 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t3BPr-0001CU-VW; Tue, 22 Oct 2024 05:43:05 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 22 Oct
 2024 17:41:18 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 22 Oct 2024 17:41:18 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, "Kevin
 Wolf" <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>, "open list:Block layer
 core" <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v2 18/18] test/qtest/ast2700-smc-test: Support to test AST2700
Date: Tue, 22 Oct 2024 17:41:10 +0800
Message-ID: <20241022094110.1574011-19-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241022094110.1574011-1-jamin_lin@aspeedtech.com>
References: <20241022094110.1574011-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dV0uoi/FCd+W

Add test_ast2700_evb function and reused testcases which are from
aspeed_smc-test.c for AST2700 testing. The base address, flash base address
and ce index of fmc_cs0 are 0x14000000, 0x100000000 and 0, respectively.
The default flash model of fmc_cs0 is "w25q01jvq" whose size is 128MB,
so set jedec_id 0xef4021.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 tests/qtest/ast2700-smc-test.c | 67 ++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build        |  4 +-
 2 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 tests/qtest/ast2700-smc-test.c

diff --git a/tests/qtest/ast2700-smc-test.c b/tests/qtest/ast2700-smc-test.c
new file mode 100644
index 0000000000..e06e10f3e8
--- /dev/null
+++ b/tests/qtest/ast2700-smc-test.c
@@ -0,0 +1,67 @@
+/*
+ * QTest testcase for the M25P80 Flash using the ASPEED SPI Controller since
+ * AST2700.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2024 ASPEED Technology Inc.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/bswap.h"
+#include "libqtest-single.h"
+#include "qemu/bitops.h"
+#include "aspeed-smc-utils.h"
+
+static void test_ast2700_evb(TestData *data)
+{
+    int ret;
+    int fd;
+
+    fd = g_file_open_tmp("qtest.m25p80.w25q01jvq.XXXXXX",
+                         &data->tmp_path, NULL);
+    g_assert(fd >= 0);
+    ret = ftruncate(fd, 128 * 1024 * 1024);
+    g_assert(ret == 0);
+    close(fd);
+
+    data->s = qtest_initf("-machine ast2700-evb "
+                          "-drive file=%s,format=raw,if=mtd",
+                          data->tmp_path);
+
+    /* fmc cs0 with w25q01jvq flash */
+    data->flash_base = 0x100000000;
+    data->spi_base = 0x14000000;
+    data->jedec_id = 0xef4021;
+    data->cs = 0;
+    data->node = "/machine/soc/fmc/ssi.0/child[0]";
+    /* beyond 64MB */
+    data->page_addr = 0x40000 * FLASH_PAGE_SIZE;
+
+    qtest_add_data_func("/ast2700/smc/read_jedec", data, test_read_jedec);
+    qtest_add_data_func("/ast2700/smc/erase_sector", data, test_erase_sector);
+    qtest_add_data_func("/ast2700/smc/erase_all",  data, test_erase_all);
+    qtest_add_data_func("/ast2700/smc/write_page", data, test_write_page);
+    qtest_add_data_func("/ast2700/smc/read_page_mem",
+                        data, test_read_page_mem);
+    qtest_add_data_func("/ast2700/smc/write_page_mem",
+                        data, test_write_page_mem);
+    qtest_add_data_func("/ast2700/smc/read_status_reg",
+                        data, test_read_status_reg);
+    qtest_add_data_func("/ast2700/smc/write_page_qpi",
+                        data, test_write_page_qpi);
+}
+
+int main(int argc, char **argv)
+{
+    TestData ast2700_evb_data;
+    int ret;
+
+    g_test_init(&argc, &argv, NULL);
+
+    test_ast2700_evb(&ast2700_evb_data);
+    ret = g_test_run();
+
+    qtest_quit(ast2700_evb_data.s);
+    unlink(ast2700_evb_data.tmp_path);
+    return ret;
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index fde4de902b..a0707d5bd2 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -210,7 +210,8 @@ qtests_aspeed = \
    'aspeed_smc-test',
    'aspeed_gpio-test']
 qtests_aspeed64 = \
-  ['ast2700-gpio-test']
+  ['ast2700-gpio-test',
+   'ast2700-smc-test']
 
 qtests_stm32l4x5 = \
   ['stm32l4x5_exti-test',
@@ -354,6 +355,7 @@ qtests = {
   'vmgenid-test': files('boot-sector.c', 'acpi-utils.c'),
   'netdev-socket': files('netdev-socket.c', '../unit/socket-helpers.c'),
   'aspeed_smc-test': files('aspeed-smc-utils.c', 'aspeed_smc-test.c'),
+  'ast2700-smc-test': files('aspeed-smc-utils.c', 'ast2700-smc-test.c'),
 }
 
 if vnc.found()
-- 
2.34.1

