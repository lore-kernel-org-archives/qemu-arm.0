Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp641524njb;
        Wed, 27 Nov 2024 01:17:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWkr0qxwzNEWZ8eGZ8Fl8TdVF5bgkDDHVn3zsdaIWMoqqVmwmv7WTsEkTv7veanON71TzfMD9nrmPLs8A==@linaro.org
X-Google-Smtp-Source: AGHT+IHn/I6W7SY60mPVSuqafF6QgHkW6Zi1s3il5dDOPVzhBSW5qttpgSr/xtveBA9F9kBdlgBi
X-Received: by 2002:a05:620a:1aa3:b0:7b6:645c:cd0 with SMTP id af79cd13be357-7b674507014mr981221585a.7.1732699055831;
        Wed, 27 Nov 2024 01:17:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732699055; cv=none;
        d=google.com; s=arc-20240605;
        b=bhJv2wUC7yGDOAWBdCEDhL0ENYJYBzOUBuPJeBBY4oIpFoHaQVBw8sB+7ZAeb2jtMw
         TdG5GxXqe31LUxvTxwMBrhkf3ez28vSDHFhOp0GAVK5sXnsTWm0/AGSuswRs8olK70sC
         3tVEGnvJsK4Z0Qkw2yUVQ0W3VsBfbSoOFT/zwD/l45Jv2Qd3HkRiSukgYbp321iYcGgc
         tfW3RZw7GdIVyARyQycTXpBKh+G0NpVlzRUSJJ6Kjh1KEjZ+/NRCI1MnpuDfzTSUaUz6
         UqrFX+P4O9aod2EcVpYdzBAqMiTFlf4t+rJPKNEuN6QE0lf2hL7eWKwadAKd4ogzPNF3
         Mlgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=m22CdBlp/02EmEZOpAHdWMLYB2x3OIMa+vya4zbVNqE=;
        fh=YxB9KrK/apG3GPSS9N0BU3U6VgGYnn8GG91b26MqXlY=;
        b=JjBB/GLs9+LXQPbRyMuLhedWfn0RBp+i/ZGu8YvieOpfeKsNPyU9yIQiRi3SBHhDYL
         4IH4KQQx7qm/6u2GdhzNHM/OENKI2ZKfbZTh6/HMjP52tVGKJWyl6hTm2pwSPl+3niJq
         qYxG1wExf+EGsJklCrHJZhUq6Sin2sksrlV32lxmHTe+EN+G0zOVG4dnbkIm7NejAUVm
         o1KYURlh97KKMjS91ubJI35kTG0yQvqubsSgyyFw8IjueXW5aoQguUwOdzXpZC7a8t+d
         kduBmaFCW/PeLwx8g6/tSlMQrUjxR8tF4IlCaNkpl/BxNNhmz3nIc0oi6VMKrMr0Vfc6
         3tPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b657585ce6si1172032685a.357.2024.11.27.01.17.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2024 01:17:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tGE9t-0002U2-9A; Wed, 27 Nov 2024 04:16:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tGE9n-0002Lm-Qs; Wed, 27 Nov 2024 04:16:25 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tGE9m-0004K2-3P; Wed, 27 Nov 2024 04:16:23 -0500
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
Subject: [PATCH v3 07/10] test/qtest/aspeed_smc-test: Support to test AST1030
Date: Wed, 27 Nov 2024 17:15:40 +0800
Message-ID: <20241127091543.1243114-8-jamin_lin@aspeedtech.com>
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
X-TUID: qBK8mPPakrgR

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

