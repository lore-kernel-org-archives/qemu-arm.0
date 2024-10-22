Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2944391njb;
        Tue, 22 Oct 2024 02:46:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX174qgIx3aOXQBFkT/T9FlgoiGryoCneFQJWPzIrHF71AE0x2XidcKkccz8GQCyVLGVkmwG91WdYvBNw==@linaro.org
X-Google-Smtp-Source: AGHT+IFYHuN6BITkM0tGc1OreFnr++EnuVWqpUabFsEfOlP8FI9p+nnhcZBmLGOj4uajTzdQzSIF
X-Received: by 2002:a05:622a:114a:b0:460:a877:4c7e with SMTP id d75a77b69052e-460aed4c42cmr215879641cf.23.1729590362505;
        Tue, 22 Oct 2024 02:46:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729590362; cv=none;
        d=google.com; s=arc-20240605;
        b=bg+DWAbLIeflm1TDbQbOYh2Zdm35KUZcEOlG42iozvPeybP2bLfSolqm2iFZgoWTbY
         tMDntJ82mDx2bhpUetNUFjKopiHqVJ1XTpidW4v9kuZJvFdVCH8DijSFQnKBTijL2Ard
         Umw8lJdU2gx+lkF3cQ5tWRLP8bt6XG2N1fr69F+g0Pwp3DebNJXJuQ7rlFldcnzlrywX
         CiGYcIM6oY+zGd+J51O8K69crwZbuUglWHkqpvwcGAG9dqeoefHs/uOfVdB665mdfwKm
         ioOs1HeeBnVAdBj7JL+4dQwEgnLGVSCgXLosMhtvfta0roKIT8M3HQhpE0T0x1kAlXhZ
         5djA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=m22CdBlp/02EmEZOpAHdWMLYB2x3OIMa+vya4zbVNqE=;
        fh=tJ6TeM8XDKi6I9LERy0ves/+1WFn5YJhFzDAan5mwNk=;
        b=Xa57qmCTHnCnYZ0Vc/UUBnmxVrdFGwegjVLwd8k1MfV1JXgg2wz704SPS5p/DwUzKM
         rGZipHsu5kdYHA1myPHWHLLVWmsa/QMSsPCdcnird4QCHVYgQGH+jZzv5+78goRaQhNY
         zhMghxqrKeQJdEPsEICjaRAKu1sox2XQEQSaMxzKRZFP4up+Xh20KtGr//wXPk+EldAC
         pTxVA4xJZ3A4PPa1U9yTJD1Xo5xx2x1zuv8ByXoWHUQspPSA2S5xx5uE+1+s10+ofoQq
         enhC6QVfcUOZ17RuM8tKncmyCBYjE0XqD2gZu+vxYD8C/9TKuKebM+ZWlCNAkC7jq5rk
         xw1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ce008f4862si60600596d6.189.2024.10.22.02.46.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2024 02:46:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t3BPu-0004w0-FI; Tue, 22 Oct 2024 05:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t3BPd-0004Ws-KB; Tue, 22 Oct 2024 05:42:54 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t3BPc-0001CU-0y; Tue, 22 Oct 2024 05:42:49 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 22 Oct
 2024 17:41:16 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 22 Oct 2024 17:41:16 +0800
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
 <yunlin.tang@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v2 15/18] test/qtest/aspeed_smc-test: Support to test AST1030
Date: Tue, 22 Oct 2024 17:41:07 +0800
Message-ID: <20241022094110.1574011-16-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241022094110.1574011-1-jamin_lin@aspeedtech.com>
References: <20241022094110.1574011-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
X-TUID: +CuCyRtq6BsH

Add test_ast1030_evb function and reused testcases for AST1030 testing.
The base address, flash base address and ce index of fmc_cs0 are
0x7E620000, 0x80000000 and 0, respectively.
The default flash model of fmc_cs0 is "w25q80bl" whose size is 1MB,
so set jedec_id 0xef4014.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 tests/qtest/aspeed_smc-test.c | 42 +++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
index 30f997679c..c5c38e23c5 100644
--- a/tests/qtest/aspeed_smc-test.c
+++ b/tests/qtest/aspeed_smc-test.c
@@ -774,11 +774,50 @@ static void test_ast2600_evb(TestData *data)
     qtest_add_data_func("/ast2600/smc/read_status_reg",
                         data, test_read_status_reg);
 }
+
+static void test_ast1030_evb(TestData *data)
+{
+    int ret;
+    int fd;
+
+    fd = g_file_open_tmp("qtest.m25p80.w25q80bl.XXXXXX",
+                         &data->tmp_path, NULL);
+    g_assert(fd >= 0);
+    ret = ftruncate(fd, 1 * 1024 * 1024);
+    g_assert(ret == 0);
+    close(fd);
+
+    data->s = qtest_initf("-machine ast1030-evb "
+                          "-drive file=%s,format=raw,if=mtd",
+                          data->tmp_path);
+
+    /* fmc cs0 with w25q80bl flash */
+    data->flash_base = 0x80000000;
+    data->spi_base = 0x7E620000;
+    data->jedec_id = 0xef4014;
+    data->cs = 0;
+    data->node = "/machine/soc/fmc/ssi.0/child[0]";
+    /* beyond 512KB */
+    data->page_addr = 0x800 * FLASH_PAGE_SIZE;
+
+    qtest_add_data_func("/ast1030/smc/read_jedec", data, test_read_jedec);
+    qtest_add_data_func("/ast1030/smc/erase_sector", data, test_erase_sector);
+    qtest_add_data_func("/ast1030/smc/erase_all",  data, test_erase_all);
+    qtest_add_data_func("/ast1030/smc/write_page", data, test_write_page);
+    qtest_add_data_func("/ast1030/smc/read_page_mem",
+                        data, test_read_page_mem);
+    qtest_add_data_func("/ast1030/smc/write_page_mem",
+                        data, test_write_page_mem);
+    qtest_add_data_func("/ast1030/smc/read_status_reg",
+                        data, test_read_status_reg);
+}
+
 int main(int argc, char **argv)
 {
     TestData palmetto_data;
     TestData ast2500_evb_data;
     TestData ast2600_evb_data;
+    TestData ast1030_evb_data;
     int ret;
 
     g_test_init(&argc, &argv, NULL);
@@ -786,13 +825,16 @@ int main(int argc, char **argv)
     test_palmetto_bmc(&palmetto_data);
     test_ast2500_evb(&ast2500_evb_data);
     test_ast2600_evb(&ast2600_evb_data);
+    test_ast1030_evb(&ast1030_evb_data);
     ret = g_test_run();
 
     qtest_quit(palmetto_data.s);
     qtest_quit(ast2500_evb_data.s);
     qtest_quit(ast2600_evb_data.s);
+    qtest_quit(ast1030_evb_data.s);
     unlink(palmetto_data.tmp_path);
     unlink(ast2500_evb_data.tmp_path);
     unlink(ast2600_evb_data.tmp_path);
+    unlink(ast1030_evb_data.tmp_path);
     return ret;
 }
-- 
2.34.1

