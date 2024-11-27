Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp641479njb;
        Wed, 27 Nov 2024 01:17:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUYwrmHobDnJ+PboL+3jfa4Wx9MF52Q3cGVAUz/6nN2wkDJSTKX944+j+SDWUVDHf+fW9bhF0odbPbMIA==@linaro.org
X-Google-Smtp-Source: AGHT+IFA9UXb4tNbiTXCXQX5gVn43EVqTeqEqtdcFKw9hfRovYghzj1YuH3jTJCyypvJsKar51RZ
X-Received: by 2002:a05:6214:4003:b0:6d4:211c:dfef with SMTP id 6a1803df08f44-6d864de3546mr25647596d6.40.1732699049336;
        Wed, 27 Nov 2024 01:17:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732699049; cv=none;
        d=google.com; s=arc-20240605;
        b=dg7xpOjIuhPlL9SGHRbo8iIc6UMsG3cxhqtp4yXYrRGl4a3RVuZ3M/rC/jA2PDOpAH
         9wQUQ9MmKJz0EFj3EQaGe5Xr1624WTbNZB6yx/c+alvFzq42gTv8INiq/9kixhccdoGd
         pOK3ze/PS3uvyTxowK4m1fpiUm4wylGy38Lf2fhQv8At3STJa2zU9yiTthuliPFk+lGI
         ceqv0Itr7ysDxmdMt7s/9+vfNcddrVpryp+L/HuVI6avOoPCALCTHxqJPkoh+dok0YlP
         V9iT6bKNSGyGvUwm8rbL/IjIzgkr68GdHxauKSEFO0OalfeuKm6tzyo0VZWjhlPeBe39
         0Z2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=C904BlanVcfdTdfzOZ9odrHV4JoBvINz09nHlynOzHc=;
        fh=YxB9KrK/apG3GPSS9N0BU3U6VgGYnn8GG91b26MqXlY=;
        b=OhIAJM8PaDhaqG7XypcoJDRi+F3j9wT6G8AVrydtq+zbwc3jtIXJvOVAjDnjMcF6mL
         XbE8mnPptI9Wunhm4AHaW9NKpDmUevZTWz3XMqNALlvY/c21bbw5Kqj3EMV0Z3E5N+BY
         Gbnw+0xLQ8bHPdxNLXK7KbRdVrn499RqSqJ8yNAen66DlYCIZBcpRGsfu8fYHTimRh3k
         GPiZs7HpUeFnWiErmPLo6wv6O/l6wlGgVNay76JdQ/XlhJzStY2GIDENQBrHPrb+kS37
         q090f/ReRjJX9O7fWfPHcYkjzyoWPvoedfbzmaYY4yDwGBceVnvo+k4Gf+6SW/WFpHRs
         bh7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d451b49d21si136803876d6.325.2024.11.27.01.17.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2024 01:17:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tGE9m-0002KQ-8W; Wed, 27 Nov 2024 04:16:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tGE9h-0002BD-Qa; Wed, 27 Nov 2024 04:16:19 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tGE9g-0004K2-5j; Wed, 27 Nov 2024 04:16:17 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 27 Nov
 2024 17:15:45 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 27 Nov 2024 17:15:45 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v3 05/10] test/qtest/aspeed_smc-test: Support to test AST2500
Date: Wed, 27 Nov 2024 17:15:38 +0800
Message-ID: <20241127091543.1243114-6-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241127091543.1243114-1-jamin_lin@aspeedtech.com>
References: <20241127091543.1243114-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: qQNPb+PbQaBR

Add test_ast2500_evb function and reused testcases for AST2500 testing.
The spi base address, flash base address and ce index of fmc_cs0 are
0x1E620000, 0x20000000 and 0, respectively.
The default flash model of fmc_cs0 is "mx25l25635e" whose size is 32MB,
so set jedec_id 0xc22019.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 tests/qtest/aspeed_smc-test.c | 40 +++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
index 6db18451d2..0171ecf4ed 100644
--- a/tests/qtest/aspeed_smc-test.c
+++ b/tests/qtest/aspeed_smc-test.c
@@ -701,17 +701,57 @@ static void test_palmetto_bmc(TestData *data)
                         data, test_write_block_protect_bottom_bit);
 }
 
+static void test_ast2500_evb(TestData *data)
+{
+    int ret;
+    int fd;
+
+    fd = g_file_open_tmp("qtest.m25p80.mx25l25635e.XXXXXX",
+                         &data->tmp_path, NULL);
+    g_assert(fd >= 0);
+    ret = ftruncate(fd, 32 * 1024 * 1024);
+    g_assert(ret == 0);
+    close(fd);
+
+    data->s = qtest_initf("-machine ast2500-evb "
+                          "-drive file=%s,format=raw,if=mtd",
+                          data->tmp_path);
+
+    /* fmc cs0 with mx25l25635e flash */
+    data->flash_base = 0x20000000;
+    data->spi_base = 0x1E620000;
+    data->jedec_id = 0xc22019;
+    data->cs = 0;
+    data->node = "/machine/soc/fmc/ssi.0/child[0]";
+    /* beyond 16MB */
+    data->page_addr = 0x14000 * FLASH_PAGE_SIZE;
+
+    qtest_add_data_func("/ast2500/smc/read_jedec", data, test_read_jedec);
+    qtest_add_data_func("/ast2500/smc/erase_sector", data, test_erase_sector);
+    qtest_add_data_func("/ast2500/smc/erase_all",  data, test_erase_all);
+    qtest_add_data_func("/ast2500/smc/write_page", data, test_write_page);
+    qtest_add_data_func("/ast2500/smc/read_page_mem",
+                        data, test_read_page_mem);
+    qtest_add_data_func("/ast2500/smc/write_page_mem",
+                        data, test_write_page_mem);
+    qtest_add_data_func("/ast2500/smc/read_status_reg",
+                        data, test_read_status_reg);
+}
 int main(int argc, char **argv)
 {
     TestData palmetto_data;
+    TestData ast2500_evb_data;
     int ret;
 
     g_test_init(&argc, &argv, NULL);
 
     test_palmetto_bmc(&palmetto_data);
+    test_ast2500_evb(&ast2500_evb_data);
     ret = g_test_run();
 
     qtest_quit(palmetto_data.s);
+    qtest_quit(ast2500_evb_data.s);
     unlink(palmetto_data.tmp_path);
+    unlink(ast2500_evb_data.tmp_path);
     return ret;
 }
-- 
2.34.1

