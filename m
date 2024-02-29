Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp231771eja;
        Thu, 29 Feb 2024 00:01:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUwR4r6xMP6diksAcPr1qVNyeIRksVHY7e141yTfOq568HuJ/WKXa0apGq08IEbr/xUmvLq+zsMuHym44nO669hEDCOjG/+
X-Google-Smtp-Source: AGHT+IGNCkQm7UVTu2WRsjjs6hDxC2zqYht+YO7Kd0NePGrMuyOm83aWN/g9XfvBe6892Lvu4i1Q
X-Received: by 2002:a05:6870:c34a:b0:21f:c7fa:78f5 with SMTP id e10-20020a056870c34a00b0021fc7fa78f5mr1234083oak.7.1709193717489;
        Thu, 29 Feb 2024 00:01:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709193717; cv=none;
        d=google.com; s=arc-20160816;
        b=t347nPzjXjWjuEjLZEa8zKlI6jrutCvORyz+ZCVy/MbzH5Pur+NrpbBOnQq95CQ/6i
         UcwW3xgA81wf+4pyxjakOlPBr03T/OgWxNwt79++pKwnqRf28RVE2TtTnqFX78Gb1FSG
         TNbLHr+kbNibvs1wj5/G2pSLW+7+Qt1rdGVnYm3qglTEqJdFINIsxRcx8V6ZP/s2om1P
         96j4bLFQfrWwF+cZ/AzEsmMQYmwv2iGuZfsE8PambsYwVWpNgVhRoipgrnYd9bBtI0fB
         kPfiJJtcBnMctwqs3Pn+R4Zvv2f9Do4iB3DVfVcX9R0G/jrXXihpglVMXqx6J9m2kkj/
         Gf/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=mPeIH6e41JpTkUnGcA9VmKmuWqfwcdz249ElFRNsmtg=;
        fh=PdtwIDHs/tPxejUvGNuNc+OfbOLCj28QtuyfcdtzgXw=;
        b=CeAsyUkPUcChcbQET5HCBJwfUaYO0vm12ztsTx/5Yl/1toD0dfP0mkzxQmwyu6133R
         B8qkGISgNUmDwp4jBl6HcweWc/jubUhyFJIRr3nTGAmDTF22F50YPS6eHbGbsNNCfJ41
         Qfyo+pAmzUbx0/gigh0h/VSK8cPYqgA+RKZJUFp3y8LivbmiFpOokOc6GSWRdXKAqAlL
         IZKNExxHEy1mplmqb4i4+v75sCj/+cLcg5ETFqc/T1AzUWccpYDHCVCP2WffXDdmGQk+
         nhrisENDAcpQR5X5yKhgCDLqtKpjbf7zUT1i/4znGLtXFHSYMVknCWVv7dNnIWAQAxh2
         j3OQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o14-20020ac85a4e000000b0042e55c72d1csi922316qta.661.2024.02.29.00.01.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 00:01:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rfbM2-00024b-U0; Thu, 29 Feb 2024 03:01:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rfbLX-0001kj-Dy; Thu, 29 Feb 2024 03:00:51 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX02.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rfbLU-00033a-Q7; Thu, 29 Feb 2024 03:00:51 -0500
Received: from TWMBX02.aspeed.com (192.168.0.25) by TWMBX02.aspeed.com
 (192.168.0.25) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 29 Feb
 2024 16:00:19 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Feb 2024 16:00:19 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 8/8] aspeed: Add an AST2700 eval board
Date: Thu, 29 Feb 2024 16:00:14 +0800
Message-ID: <20240229080014.1235018-9-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240229080014.1235018-1-jamin_lin@aspeedtech.com>
References: <20240229080014.1235018-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: Fail (TWMBX02.aspeed.com: domain of jamin_lin@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=localhost.localdomain;
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX02.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: m+PzFXShlWZR

AST2700 CPU is ARM Cortex-A35 which is 64 bits.
Add TARGET_AARCH64 to build this machine.

According to the design of ast2700, it has a bootmcu(riscv-32) which
is used for executing SPL.
Then, CPUs(cortex-a35) execute u-boot, kernel and rofs.

Currently, qemu not support emulate two CPU architectures
at the same machine. Therefore, qemu will only support
to emulate CPU(cortex-a35) side for ast2700

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 8854581ca8..4544026d14 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -178,6 +178,12 @@ struct AspeedMachineState {
 #define AST2600_EVB_HW_STRAP1 0x000000C0
 #define AST2600_EVB_HW_STRAP2 0x00000003
 
+#ifdef TARGET_AARCH64
+/* AST2700 evb hardware value */
+#define AST2700_EVB_HW_STRAP1 0x000000C0
+#define AST2700_EVB_HW_STRAP2 0x00000003
+#endif
+
 /* Tacoma hardware value */
 #define TACOMA_BMC_HW_STRAP1  0x00000000
 #define TACOMA_BMC_HW_STRAP2  0x00000040
@@ -1588,6 +1594,26 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
     aspeed_machine_class_init_cpus_defaults(mc);
 }
 
+#ifdef TARGET_AARCH64
+static void aspeed_machine_ast2700_evb_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc = "Aspeed AST2700 EVB (Cortex-A35)";
+    amc->soc_name  = "ast2700-a0";
+    amc->hw_strap1 = AST2700_EVB_HW_STRAP1;
+    amc->hw_strap2 = AST2700_EVB_HW_STRAP2;
+    amc->fmc_model = "w25q01jvq";
+    amc->spi_model = "w25q512jv";
+    amc->num_cs    = 2;
+    amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON | ASPEED_MAC2_ON;
+    amc->uart_default = ASPEED_DEV_UART12;
+    mc->default_ram_size = 1 * GiB;
+    aspeed_machine_class_init_cpus_defaults(mc);
+}
+#endif
+
 static void aspeed_machine_qcom_dc_scm_v1_class_init(ObjectClass *oc,
                                                      void *data)
 {
@@ -1711,6 +1737,12 @@ static const TypeInfo aspeed_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("ast1030-evb"),
         .parent         = TYPE_ASPEED_MACHINE,
         .class_init     = aspeed_minibmc_machine_ast1030_evb_class_init,
+#ifdef TARGET_AARCH64
+    }, {
+        .name          = MACHINE_TYPE_NAME("ast2700-evb"),
+        .parent        = TYPE_ASPEED_MACHINE,
+        .class_init    = aspeed_machine_ast2700_evb_class_init,
+#endif
     }, {
         .name          = TYPE_ASPEED_MACHINE,
         .parent        = TYPE_MACHINE,
-- 
2.25.1

