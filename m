Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8347CD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 19:28:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNyCS-00019z-5T; Fri, 15 May 2026 15:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <williamdapinho@gmail.com>)
 id 1wNvpd-0003re-7P
 for qemu-arm@nongnu.org; Fri, 15 May 2026 12:56:13 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <williamdapinho@gmail.com>)
 id 1wNvpa-0004yU-HL
 for qemu-arm@nongnu.org; Fri, 15 May 2026 12:56:12 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so355305e9.2
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 09:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778864169; x=1779468969; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qOBJngWhKmU5gxuVgiDQnTdPlHV2ECLJRd+JxzO0qfs=;
 b=OGJMI3796nCXkYHsv4jeedXW2K3SVODRnoDZ7sAp2C/u2godl8DdSELuY33C2MghCL
 NY75HDhnMwbLEx+4+KViTG+YDy/1B48Jy3Teu09TX+DyLR8I+kHi4q8FTMV6Up7GOSUr
 Gi0JN9rm9srlNSHA9ZW17r6PqtlN67lXlMczIIere7muKJF44JVzHXeEZqbtDmIdVezB
 sHnRAtdjEHUGVAu1Vtwe+ifGrHDEheFK1Vnn5irwhANWXLBaSO0WD9JVPrIu/NKF5tdw
 0E2AES1wPpi6QYtx2mdeOEkTsArLk6PZg8XRRDALYG90JgoN4CSqkwLFVR14WIfcNItV
 OCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778864169; x=1779468969;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qOBJngWhKmU5gxuVgiDQnTdPlHV2ECLJRd+JxzO0qfs=;
 b=B+vTMtRPSdvqnxpVaXOk636jc12QLgZNm5LUkbfY9TN5jVpJxPzNqmD1Q0pwPhuTdS
 G+Ma1I81AYQvCSGmNTWOvV7f50OdEIZFfmo2rHjNuHySgnFSpWM+k/0rhGHZI1bDqT0C
 sSAFyLFCufVo3LBmAG9YHM5TW2tCIYR/LKqcCQ6XOtTZxiLO/KAlyu7igCKkD0f+WYmA
 HpZrhKm8YTA7njiUjebE+4M71bC7cRovJH7IbUTdiONW7YURiLLnwZItbDuvBN1sp+7A
 Zh1o+cag6RFYuUgObmyejjRISh2ClM2v7jRglMoZQXSG9lNNSB6jhpgA4k175IRUrAXQ
 CiIw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8J+Q/jDjE7oE4agXxYpcmnDjK/SAphiWdMVjyacIrn2C0OSjlw6YpRj3ORU4i0YjAJi5SuAyG+mg==@nongnu.org
X-Gm-Message-State: AOJu0Yye36Dm+Zono87yuzNoGeQV2gxITFsE6iqRfpSx6t6VQBMRAeiL
 e6nMZ/4g5umihuVcSSbfPr1MEmP86SFe55vTnsakCDdj3JVHYQBvjIW5
X-Gm-Gg: Acq92OEk4VNpuNvFggVd6h5KfEP39/B0RvbALLZM419BUmQ5Q5Nv4LVVoRRgCPAxaZW
 0+CtiouRyr5z3LHeXNqARz/rnD52UbwW6lrHcUgRu+5I+Ndl59z7AIdk5mm5Vz82i21bnWkU8BE
 KAwXBucmiJwuUBBaLauuFLkmW01T5ckvkP475JZ31VqJTf0oARBI0Y0bNCNTgJaxnrKPfNO/jTC
 0LDQ9sFi+4lfEsZqpIYt9pkjWZ37GxqAkiLVUcXd4iE4huFVjcTYcjz04qzKu2/A+Lg6910H2P4
 novQUxxAEe02JmYaYInGcpFcLc8HZ/h04gNxY5hdwDCTyg93ojDnwCBKjg943Uhwznnt4IjA9/2
 zJ8OW5sSBunbaPQ1w+vXbJSasNfRqlmTeLeqIWHsjkHvIzqqcrpcOUDzR1Xa85SzMMOoVt+LLEw
 xrojY9QMkoyOwdaZ5kWa/wozw=
X-Received: by 2002:a05:600d:8451:b0:487:2439:b7be with SMTP id
 5b1f17b1804b1-48fe60de750mr63130305e9.6.1778864169024; 
 Fri, 15 May 2026 09:56:09 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:48::])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5cab7c5sm75713525e9.12.2026.05.15.09.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 09:56:08 -0700 (PDT)
From: William de Abreu Pinho <williamdapinho@gmail.com>
Date: Fri, 15 May 2026 09:55:51 -0700
Subject: [PATCH 2/2] hw/arm/aspeed: anacapa: add FRU EEPROM data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260515-add-anacapa-machine-v1-2-9765ce0b9426@gmail.com>
References: <20260515-add-anacapa-machine-v1-0-9765ce0b9426@gmail.com>
In-Reply-To: <20260515-add-anacapa-machine-v1-0-9765ce0b9426@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, William de Abreu Pinho <williamdapinho@gmail.com>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=williamdapinho@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 15 May 2026 15:27:50 -0400
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

Use frugen to generate FRU data for the following components: HPM MB,
R-PDB, L-PDB, SCM, BSM, R Bridge Board, L Bridge Board, and HPM board
ID.

Signed-off-by: William de Abreu Pinho <williamdapinho@gmail.com>
---
 hw/arm/aspeed_ast2600_anacapa.c | 225 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 217 insertions(+), 8 deletions(-)

diff --git a/hw/arm/aspeed_ast2600_anacapa.c b/hw/arm/aspeed_ast2600_anacapa.c
index c24f00d44c..a1c8111a93 100644
--- a/hw/arm/aspeed_ast2600_anacapa.c
+++ b/hw/arm/aspeed_ast2600_anacapa.c
@@ -20,6 +20,207 @@
 #define ANACAPA_BMC_HW_STRAP2 0x00000000
 #define ANACAPA_BMC_RAM_SIZE ASPEED_RAM_SIZE(2 * GiB)
 
+/*
+ * "Anacapa HPM (MB)" FRU data. Generated with frugen.
+ *
+ *    {
+ *      "board": { "mfg": "Inventec", "pname": "Anacapa QEMU MB EVT2",
+ *                 "pn": "00000000000", "serial": "00000000000000" },
+ *      "product": { "mfg": "Inventec", "pname": "CI-Anacapa",
+ *                   "pn": "10000000001", "ver": "MP",
+ *                   "serial": "10000000000000", "atag": "QEMU" }
+ *    }
+ */
+static const uint8_t hpm_eeprom[] = {
+    0x01, 0x00, 0x00, 0x01, 0x08, 0x00, 0x00, 0xf6, 0x01, 0x07, 0x19, 0xb4,
+    0xa4, 0xf2, 0xc8, 0x49, 0x6e, 0x76, 0x65, 0x6e, 0x74, 0x65, 0x63, 0xd4,
+    0x41, 0x6e, 0x61, 0x63, 0x61, 0x70, 0x61, 0x20, 0x51, 0x45, 0x4d, 0x55,
+    0x20, 0x4d, 0x42, 0x20, 0x45, 0x56, 0x54, 0x32, 0x47, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0a, 0xc0,
+    0xc1, 0x00, 0x00, 0xb8, 0x01, 0x06, 0x19, 0xc8, 0x49, 0x6e, 0x76, 0x65,
+    0x6e, 0x74, 0x65, 0x63, 0xca, 0x43, 0x49, 0x2d, 0x41, 0x6e, 0x61, 0x63,
+    0x61, 0x70, 0x61, 0x46, 0x10, 0x00, 0x00, 0x00, 0x00, 0x1a, 0x82, 0x2d,
+    0x0c, 0x47, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x83, 0x71, 0xd9,
+    0xd6, 0xc0, 0xc1, 0x0e
+};
+static const size_t hpm_eeprom_len = sizeof(hpm_eeprom);
+
+/*
+ * "Anacapa R-PDB" FRU data. Generated with frugen.
+ *
+ *    {
+ *      "board": { "mfg": "Inventec", "pname": "Anacapa QEMU RPDB",
+ *                 "pn": "00000000000", "serial": "00000000000000" },
+ *      "product": { "mfg": "Inventec", "pname": "CI-Anacapa",
+ *                   "pn": "10000000001", "ver": "MP",
+ *                   "serial": "10000000000000", "atag": "QEMU" }
+ *    }
+ */
+static const uint8_t rpdb_eeprom[] = {
+    0x01, 0x00, 0x00, 0x01, 0x08, 0x00, 0x00, 0xf6, 0x01, 0x07, 0x19, 0x41,
+    0x2d, 0xf2, 0xc8, 0x49, 0x6e, 0x76, 0x65, 0x6e, 0x74, 0x65, 0x63, 0xd1,
+    0x41, 0x6e, 0x61, 0x63, 0x61, 0x70, 0x61, 0x20, 0x51, 0x45, 0x4d, 0x55,
+    0x20, 0x52, 0x50, 0x44, 0x42, 0x47, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0a, 0xc0, 0xc1, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x4d, 0x01, 0x06, 0x19, 0xc8, 0x49, 0x6e, 0x76, 0x65,
+    0x6e, 0x74, 0x65, 0x63, 0xca, 0x43, 0x49, 0x2d, 0x41, 0x6e, 0x61, 0x63,
+    0x61, 0x70, 0x61, 0x46, 0x10, 0x00, 0x00, 0x00, 0x00, 0x1a, 0x82, 0x2d,
+    0x0c, 0x47, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x83, 0x71, 0xd9,
+    0xd6, 0xc0, 0xc1, 0x0e
+};
+static const size_t rpdb_eeprom_len = sizeof(rpdb_eeprom);
+
+/*
+ * "Anacapa L-PDB" FRU data. Generated with frugen.
+ *
+ *    {
+ *      "board": { "mfg": "Inventec", "pname": "Anacapa QEMU LPDB",
+ *                 "pn": "00000000000", "serial": "00000000000000" },
+ *      "product": { "mfg": "Inventec", "pname": "CI-Anacapa",
+ *                   "pn": "10000000001", "ver": "MP",
+ *                   "serial": "10000000000000", "atag": "QEMU" }
+ *    }
+ */
+static const uint8_t lpdb_eeprom[] = {
+    0x01, 0x00, 0x00, 0x01, 0x08, 0x00, 0x00, 0xf6, 0x01, 0x07, 0x19, 0x41,
+    0x2d, 0xf2, 0xc8, 0x49, 0x6e, 0x76, 0x65, 0x6e, 0x74, 0x65, 0x63, 0xd1,
+    0x41, 0x6e, 0x61, 0x63, 0x61, 0x70, 0x61, 0x20, 0x51, 0x45, 0x4d, 0x55,
+    0x20, 0x4c, 0x50, 0x44, 0x42, 0x47, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0a, 0xc0, 0xc1, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x53, 0x01, 0x06, 0x19, 0xc8, 0x49, 0x6e, 0x76, 0x65,
+    0x6e, 0x74, 0x65, 0x63, 0xca, 0x43, 0x49, 0x2d, 0x41, 0x6e, 0x61, 0x63,
+    0x61, 0x70, 0x61, 0x46, 0x10, 0x00, 0x00, 0x00, 0x00, 0x1a, 0x82, 0x2d,
+    0x0c, 0x47, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x83, 0x71, 0xd9,
+    0xd6, 0xc0, 0xc1, 0x0e
+};
+static const size_t lpdb_eeprom_len = sizeof(lpdb_eeprom);
+
+/*
+ * "Anacapa SCM" FRU data. Generated with frugen.
+ *
+ *    {
+ *      "board": { "mfg": "Quanta", "pname": "Anacapa SCM",
+ *                 "pn": "00000000000", "serial": "00000000000000" },
+ *      "product": { "mfg": "Quanta", "pname": "CI-Anacapa",
+ *                   "pn": "10000000001", "ver": "MP",
+ *                   "serial": "10000000000000", "atag": "QEMU" }
+ *    }
+ */
+static const uint8_t scm_eeprom[] = {
+    0x01, 0x00, 0x00, 0x01, 0x07, 0x00, 0x00, 0xf7, 0x01, 0x06, 0x19, 0x41,
+    0x2d, 0xf2, 0xc6, 0x51, 0x75, 0x61, 0x6e, 0x74, 0x61, 0xcb, 0x41, 0x6e,
+    0x61, 0x63, 0x61, 0x70, 0x61, 0x20, 0x53, 0x43, 0x4d, 0x47, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0a,
+    0xc0, 0xc1, 0x00, 0x00, 0x00, 0x00, 0x00, 0xc5, 0x01, 0x06, 0x19, 0xc6,
+    0x51, 0x75, 0x61, 0x6e, 0x74, 0x61, 0xca, 0x43, 0x49, 0x2d, 0x41, 0x6e,
+    0x61, 0x63, 0x61, 0x70, 0x61, 0x46, 0x10, 0x00, 0x00, 0x00, 0x00, 0x1a,
+    0x82, 0x2d, 0x0c, 0x47, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x83,
+    0x71, 0xd9, 0xd6, 0xc0, 0xc1, 0x00, 0x00, 0xe2
+};
+static const size_t scm_eeprom_len = sizeof(scm_eeprom);
+
+/*
+ * "Anacapa BMC Storage Module" FRU data. Generated with frugen.
+ *
+ *    {
+ *      "board": { "mfg": "Quanta", "pname": "Anacapa BMC Storage Module",
+ *                 "pn": "00000000000", "serial": "00000000000000" },
+ *      "product": { "mfg": "Quanta", "pname": "CI-Anacapa",
+ *                   "pn": "10000000001", "ver": "MP",
+ *                   "serial": "10000000000000", "atag": "QEMU" }
+ *    }
+ */
+static const uint8_t bsm_eeprom[] = {
+    0x01, 0x00, 0x00, 0x01, 0x0a, 0x00, 0x00, 0xf4, 0x01, 0x09, 0x00, 0x00,
+    0x00, 0x00, 0xc6, 0x51, 0x75, 0x61, 0x6e, 0x74, 0x61, 0xda, 0x41, 0x6e,
+    0x61, 0x63, 0x61, 0x70, 0x61, 0x20, 0x42, 0x4d, 0x43, 0x20, 0x53, 0x74,
+    0x6f, 0x72, 0x61, 0x67, 0x65, 0x20, 0x4d, 0x6f, 0x64, 0x75, 0x6c, 0x65,
+    0xce, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30,
+    0x30, 0x30, 0x30, 0xcb, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30,
+    0x30, 0x30, 0x30, 0xc0, 0xc1, 0x00, 0x00, 0x10, 0x01, 0x08, 0x00, 0xc6,
+    0x51, 0x75, 0x61, 0x6e, 0x74, 0x61, 0xca, 0x43, 0x49, 0x2d, 0x41, 0x6e,
+    0x61, 0x63, 0x61, 0x70, 0x61, 0xcb, 0x31, 0x30, 0x30, 0x30, 0x30, 0x30,
+    0x30, 0x30, 0x30, 0x30, 0x31, 0xc2, 0x4d, 0x50, 0xce, 0x31, 0x30, 0x30,
+    0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0xc4,
+    0x51, 0x45, 0x4d, 0x55, 0xc0, 0xc1, 0x00, 0x00, 0x00, 0x00, 0x00, 0x77,
+};
+static const size_t bsm_eeprom_len = sizeof(bsm_eeprom);
+
+/*
+ * "Anacapa R Bridge Board" FRU data. Generated with frugen.
+ *
+ *    {
+ *      "board": { "mfg": "Inventec", "pname": "Anacapa QEMU RBB EVT2",
+ *                 "pn": "00000000000", "serial": "00000000000000" },
+ *      "product": { "mfg": "Inventec", "pname": "CI-Anacapa",
+ *                   "pn": "10000000001", "ver": "MP",
+ *                   "serial": "10000000000000", "atag": "QEMU" }
+ *    }
+ */
+static const uint8_t rbb_eeprom[] = {
+    0x01, 0x00, 0x00, 0x01, 0x08, 0x00, 0x00, 0xf6, 0x01, 0x07, 0x19, 0xb4,
+    0xa4, 0xf2, 0xc8, 0x49, 0x6e, 0x76, 0x65, 0x6e, 0x74, 0x65, 0x63, 0xd5,
+    0x41, 0x6e, 0x61, 0x63, 0x61, 0x70, 0x61, 0x20, 0x51, 0x45, 0x4d, 0x55,
+    0x20, 0x52, 0x42, 0x42, 0x20, 0x45, 0x56, 0x54, 0x32, 0x47, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0a,
+    0xc0, 0xc1, 0x00, 0x70, 0x01, 0x06, 0x19, 0xc8, 0x49, 0x6e, 0x76, 0x65,
+    0x6e, 0x74, 0x65, 0x63, 0xca, 0x43, 0x49, 0x2d, 0x41, 0x6e, 0x61, 0x63,
+    0x61, 0x70, 0x61, 0x46, 0x10, 0x00, 0x00, 0x00, 0x00, 0x1a, 0x82, 0x2d,
+    0x0c, 0x47, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x83, 0x71, 0xd9,
+    0xd6, 0xc0, 0xc1, 0x0e
+};
+static const size_t rbb_eeprom_len = sizeof(rbb_eeprom);
+
+/*
+ * "Anacapa L Bridge Board" FRU data. Generated with frugen.
+ *
+ *    {
+ *      "board": { "mfg": "Inventec", "pname": "Anacapa QEMU LBB EVT2",
+ *                 "pn": "00000000000", "serial": "00000000000000" },
+ *      "product": { "mfg": "Inventec", "pname": "CI-Anacapa",
+ *                   "pn": "10000000001", "ver": "MP",
+ *                   "serial": "10000000000000", "atag": "QEMU" }
+ *    }
+ */
+static const uint8_t lbb_eeprom[] = {
+    0x01, 0x00, 0x00, 0x01, 0x08, 0x00, 0x00, 0xf6, 0x01, 0x07, 0x19, 0xb4,
+    0xa4, 0xf2, 0xc8, 0x49, 0x6e, 0x76, 0x65, 0x6e, 0x74, 0x65, 0x63, 0xd5,
+    0x41, 0x6e, 0x61, 0x63, 0x61, 0x70, 0x61, 0x20, 0x51, 0x45, 0x4d, 0x55,
+    0x20, 0x4c, 0x42, 0x42, 0x20, 0x45, 0x56, 0x54, 0x32, 0x47, 0x00, 0x00,
+    0x00, 0x00, 0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0a,
+    0xc0, 0xc1, 0x00, 0x76, 0x01, 0x06, 0x19, 0xc8, 0x49, 0x6e, 0x76, 0x65,
+    0x6e, 0x74, 0x65, 0x63, 0xca, 0x43, 0x49, 0x2d, 0x41, 0x6e, 0x61, 0x63,
+    0x61, 0x70, 0x61, 0x46, 0x10, 0x00, 0x00, 0x00, 0x00, 0x1a, 0x82, 0x2d,
+    0x0c, 0x47, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x83, 0x71, 0xd9,
+    0xd6, 0xc0, 0xc1, 0x0e
+};
+static const size_t lbb_eeprom_len = sizeof(lbb_eeprom);
+
+/*
+ * "Anacapa HPM BRD ID" FRU data. Generated with frugen.
+ *
+ *    {
+ *      "board": { "mfg": "Inventec", "pname": "Anacapa HPM BRD ID",
+ *                 "pn": "00000000000", "serial": "00000000000000" },
+ *      "product": { "mfg": "Inventec", "pname": "CI-Anacapa",
+ *                   "pn": "10000000001", "ver": "MP",
+ *                   "serial": "10000000000000", "atag": "QEMU" }
+ *    }
+ */
+static const uint8_t hpm_brd_id_eeprom[] = {
+    0x01, 0x00, 0x00, 0x01, 0x08, 0x00, 0x00, 0xf6, 0x01, 0x07, 0x19, 0x41,
+    0x2d, 0xf2, 0xc8, 0x49, 0x6e, 0x76, 0x65, 0x6e, 0x74, 0x65, 0x63, 0xd2,
+    0x41, 0x6e, 0x61, 0x63, 0x61, 0x70, 0x61, 0x20, 0x48, 0x50, 0x4d, 0x20,
+    0x42, 0x52, 0x44, 0x20, 0x49, 0x44, 0x47, 0x00, 0x00, 0x00, 0x00, 0x00,
+    0x00, 0x00, 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0a, 0xc0, 0xc1, 0x00,
+    0x00, 0x00, 0x00, 0x42, 0x01, 0x06, 0x19, 0xc8, 0x49, 0x6e, 0x76, 0x65,
+    0x6e, 0x74, 0x65, 0x63, 0xca, 0x43, 0x49, 0x2d, 0x41, 0x6e, 0x61, 0x63,
+    0x61, 0x70, 0x61, 0x46, 0x10, 0x00, 0x00, 0x00, 0x00, 0x1a, 0x82, 0x2d,
+    0x0c, 0x47, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x83, 0x71, 0xd9,
+    0xd6, 0xc0, 0xc1, 0x0e
+};
+static const size_t hpm_brd_id_eeprom_len = sizeof(hpm_brd_id_eeprom);
+
 static void anacapa_bmc_i2c_init(AspeedMachineState *bmc)
 {
     /* Reference: aspeed-bmc-facebook-anacapa.dts */
@@ -50,7 +251,8 @@ static void anacapa_bmc_i2c_init(AspeedMachineState *bmc)
 
     /* &i2c6 */
     /* eeprom@50 */
-    at24c_eeprom_init(i2c[6], 0x50, 32 * KiB);
+    at24c_eeprom_init_rom(i2c[6], 0x50, 32 * KiB,
+                          hpm_eeprom, hpm_eeprom_len);
 
     /* &i2c8 */
     /* i2c-mux@72 (PCA9546) */
@@ -65,7 +267,8 @@ static void anacapa_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 0),
                             TYPE_PCA9552, 0x24);
     /* eeprom@50 */
-    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 16 * KiB);
+    at24c_eeprom_init_rom(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 16 * KiB,
+                          rpdb_eeprom, rpdb_eeprom_len);
 
     /* i2c8mux ch1 */
     /* pca9555@22 */
@@ -75,13 +278,16 @@ static void anacapa_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 1),
                             TYPE_PCA9552, 0x24);
     /* eeprom@50 */
-    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x50, 16 * KiB);
+    at24c_eeprom_init_rom(pca954x_i2c_get_bus(i2c_mux, 1), 0x50, 16 * KiB,
+                          lpdb_eeprom, lpdb_eeprom_len);
 
     /* &i2c9 */
     /* eeprom@50 */
-    at24c_eeprom_init(i2c[9], 0x50, 16 * KiB);
+    at24c_eeprom_init_rom(i2c[9], 0x50, 16 * KiB,
+                          scm_eeprom, scm_eeprom_len);
     /* eeprom@56 */
-    at24c_eeprom_init(i2c[9], 0x56, 8 * KiB);
+    at24c_eeprom_init_rom(i2c[9], 0x56, 8 * KiB,
+                          bsm_eeprom, bsm_eeprom_len);
 
     /* &i2c10 */
     /* i2c-mux@71 (PCA9548) */
@@ -92,7 +298,8 @@ static void anacapa_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 5),
                             TYPE_PCA9552, 0x22);
     /* eeprom@52 */
-    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 5), 0x52, 32 * KiB);
+    at24c_eeprom_init_rom(pca954x_i2c_get_bus(i2c_mux, 5), 0x52, 32 * KiB,
+                          rbb_eeprom, rbb_eeprom_len);
 
     /* &i2c11 */
     /* i2c-mux@71 (PCA9548) */
@@ -105,7 +312,8 @@ static void anacapa_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 5),
                             TYPE_PCA9552, 0x22);
     /* eeprom@52 */
-    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 5), 0x52, 32 * KiB);
+    at24c_eeprom_init_rom(pca954x_i2c_get_bus(i2c_mux, 5), 0x52, 32 * KiB,
+                          lbb_eeprom, lbb_eeprom_len);
 
     /* &i2c13 */
     /* i2c-mux@70 (PCA9548) */
@@ -116,7 +324,8 @@ static void anacapa_bmc_i2c_init(AspeedMachineState *bmc)
 
     /* i2c13mux ch4 */
     /* eeprom@51 */
-    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 4), 0x51, 32 * KiB);
+    at24c_eeprom_init_rom(pca954x_i2c_get_bus(i2c_mux, 4), 0x51, 32 * KiB,
+                          hpm_brd_id_eeprom, hpm_brd_id_eeprom_len);
 
     /* i2c13mux ch7 */
     /* nfc@28 — no model */

-- 
2.53.0-Meta


