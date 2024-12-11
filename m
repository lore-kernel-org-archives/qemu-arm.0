Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3847646njb;
        Tue, 10 Dec 2024 22:39:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUzBwaxtc+aEJJCy30Fv50Y6836EgA/Jrg+EdUlDTTgKYXw0qGMVb+jgc9xZ9OOIDzDewVLGlIpZMC8Cg==@linaro.org
X-Google-Smtp-Source: AGHT+IFm4A4QTlSTE3xSzIGciKsjMOmtgxSBkgrdCucg2PVD19hNOGbwcpa+8ENTTtPU9UzTkRph
X-Received: by 2002:a05:622a:1389:b0:467:7208:8ee8 with SMTP id d75a77b69052e-4678931d4b3mr32438401cf.31.1733899162570;
        Tue, 10 Dec 2024 22:39:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733899162; cv=none;
        d=google.com; s=arc-20240605;
        b=RtB0xR9bu5QIfypI+OBkERRAWcED9HApB8UBaDKqjzn8Pc8S5aoMq3P9mJ+b+MtzkG
         w8M/XZonTV5EaDij4hUaByqBCt1RuASggkBnFtx3Wte2X7MCbozUTnwAZoye3UEWRP5Q
         fGt1eablWfMxjIGWHmAShYoT8wnvxLSA0cIYgCe+GyiDCogEpJGrnIEAF5O9dHXkJRu+
         tKawWrYdzHiQG+S8UZi8/hK+LWzRwsdTEUsDqtOlrOkkF5/bQ2Of8cIiw9Dp/yBwtGua
         9JmZq4i+2J3xqRObtCdWF7HYf+gCOO6AwYMWsetungc2N7xhN/MmFL+4NcDlWqyNJF4W
         XRAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jRUBoaF+l+8xWZTksldgb178zY7Ivt7cnKmp5H2lyhA=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=eT2kWM/F89OmaCy/cadV/7Js6SaoWhfXdAK2UxVRwxO/zm6dIaOxqoQkuCIFmjVV4R
         Wafqy+oEv3cCt8H0k5WnVNvxFwk2TZWCi/bfh+37y7ZZI0yVTTtS6sw3q+KFDdB50MmL
         pvlTWeE3arM6yAKTwLFKzDRq5lzA9USYulRtsNEnxMfa/rZKHsv6HIX5cs7deF1Rn0E0
         jupItxcDC9WWVMePcewZTO3PPLT/flCzRGhMG0y+ThBy1LUb0/8RU1REBBPlSm/vOLOn
         RVRtH+aP5Z8x9q6mMl9j0xfhwpT/8Oj3oROQs17CRkG9NlWL2OwlCiOFvmowFBX2ESxo
         JHMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OdodS63O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4678b4c7aa9si7995221cf.444.2024.12.10.22.39.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 22:39:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OdodS63O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLGHH-0006x0-6a; Wed, 11 Dec 2024 01:32:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tLGGT-00058J-7p
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 01:32:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tLGGH-00006g-2o
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 01:32:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733898712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jRUBoaF+l+8xWZTksldgb178zY7Ivt7cnKmp5H2lyhA=;
 b=OdodS63OOqQXJUmLAAAuxAXbY4gElDrYFX/sOkc8mlmcmsmbSW14L1+yJlLEgyLU+wK+9A
 xZUZZVNNUFCvZbZttkXOQZoIgifxVYUjF0olUTXBTh90fv2oG3pbGADA/+LpddSeCpTO6U
 6KFu4WFioH/CtjlXJyauTO/u8wib7ec=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-674-qYzGpAAXMzejodv-dShH7w-1; Wed,
 11 Dec 2024 01:31:49 -0500
X-MC-Unique: qYzGpAAXMzejodv-dShH7w-1
X-Mimecast-MFC-AGG-ID: qYzGpAAXMzejodv-dShH7w
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 132D81955F43; Wed, 11 Dec 2024 06:31:48 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.194.144])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A645B1956054; Wed, 11 Dec 2024 06:31:46 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 20/24] test/qtest/aspeed_smc-test: Support to test AST2600
Date: Wed, 11 Dec 2024 07:30:54 +0100
Message-ID: <20241211063058.1222038-21-clg@redhat.com>
In-Reply-To: <20241211063058.1222038-1-clg@redhat.com>
References: <20241211063058.1222038-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.52,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NU6762QVrJYn

From: Jamin Lin <jamin_lin@aspeedtech.com>

Add test_ast2600_evb function and reused testcases for AST2600 testing.
The spi base address, flash base address and ce index of fmc_cs0 are
0x1E620000, 0x20000000 and 0, respectively.
The default flash model of fmc_cs0 is "mx66u51235f" whose size is 64MB,
so set jedec_id 0xc2253a.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/r/20241127091543.1243114-7-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/qtest/aspeed_smc-test.c | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
index 0171ecf4ed06..30f997679ce2 100644
--- a/tests/qtest/aspeed_smc-test.c
+++ b/tests/qtest/aspeed_smc-test.c
@@ -737,21 +737,62 @@ static void test_ast2500_evb(TestData *data)
     qtest_add_data_func("/ast2500/smc/read_status_reg",
                         data, test_read_status_reg);
 }
+
+static void test_ast2600_evb(TestData *data)
+{
+    int ret;
+    int fd;
+
+    fd = g_file_open_tmp("qtest.m25p80.mx66u51235f.XXXXXX",
+                         &data->tmp_path, NULL);
+    g_assert(fd >= 0);
+    ret = ftruncate(fd, 64 * 1024 * 1024);
+    g_assert(ret == 0);
+    close(fd);
+
+    data->s = qtest_initf("-machine ast2600-evb "
+                          "-drive file=%s,format=raw,if=mtd",
+                          data->tmp_path);
+
+    /* fmc cs0 with mx66u51235f flash */
+    data->flash_base = 0x20000000;
+    data->spi_base = 0x1E620000;
+    data->jedec_id = 0xc2253a;
+    data->cs = 0;
+    data->node = "/machine/soc/fmc/ssi.0/child[0]";
+    /* beyond 16MB */
+    data->page_addr = 0x14000 * FLASH_PAGE_SIZE;
+
+    qtest_add_data_func("/ast2600/smc/read_jedec", data, test_read_jedec);
+    qtest_add_data_func("/ast2600/smc/erase_sector", data, test_erase_sector);
+    qtest_add_data_func("/ast2600/smc/erase_all",  data, test_erase_all);
+    qtest_add_data_func("/ast2600/smc/write_page", data, test_write_page);
+    qtest_add_data_func("/ast2600/smc/read_page_mem",
+                        data, test_read_page_mem);
+    qtest_add_data_func("/ast2600/smc/write_page_mem",
+                        data, test_write_page_mem);
+    qtest_add_data_func("/ast2600/smc/read_status_reg",
+                        data, test_read_status_reg);
+}
 int main(int argc, char **argv)
 {
     TestData palmetto_data;
     TestData ast2500_evb_data;
+    TestData ast2600_evb_data;
     int ret;
 
     g_test_init(&argc, &argv, NULL);
 
     test_palmetto_bmc(&palmetto_data);
     test_ast2500_evb(&ast2500_evb_data);
+    test_ast2600_evb(&ast2600_evb_data);
     ret = g_test_run();
 
     qtest_quit(palmetto_data.s);
     qtest_quit(ast2500_evb_data.s);
+    qtest_quit(ast2600_evb_data.s);
     unlink(palmetto_data.tmp_path);
     unlink(ast2500_evb_data.tmp_path);
+    unlink(ast2600_evb_data.tmp_path);
     return ret;
 }
-- 
2.47.1

