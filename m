Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03931D1D89E
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Dec 2025 09:36:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vR5kq-0001zl-TO; Thu, 04 Dec 2025 04:36:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1vR5kC-0001EO-GG
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 04:35:25 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1vR5k8-0003TX-2B
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 04:35:24 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-644fcafdce9so1143193a12.1
 for <qemu-arm@nongnu.org>; Thu, 04 Dec 2025 01:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764840918; x=1765445718; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QoHTI8fj0k9cPGTzgILaiqPxxBchjhp4wkj4lGHM5cM=;
 b=YBXm9lSzS3F5Im/VMvx5ySqhZlR+4H07TYEBT3Em52FS9NR0QUrSOyJSm/pLbdWnzK
 HZZLmaleAj10MhVwBkCQgaFUvq/O3n2x2bt5kZFcoS4pHfkiFAIQvGFFe/3QBlTTVZYZ
 ml6TaFwUzvkUmsv7mgBWrD0p2fH+7DmG9AIPR8Ehk559y25UR2jKI/wHX16UyHIxvIQn
 LuQcf/eBncwVe4kCpMpBt8iSt5rdJxVG7Hj7gxoYMDSErsgzsw8IyIm2Pd3LAty/2pLX
 k6hjhmtvT3XwVDViSti4P4cAdo5lO0bPygBqx0pFiIUHGqo/TnF9jjcovcE9RRRvlUqT
 6JyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764840918; x=1765445718;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QoHTI8fj0k9cPGTzgILaiqPxxBchjhp4wkj4lGHM5cM=;
 b=qWiRVtFazfp+c69R6TehjZXdZBiRIU38NXCp3AgkRKW+0LJ9xnfHA1g1p0KeUsxtuy
 2thn24Kdu6gP9oz5iaIA2xoh0ntPk0CTHN0aJsbAHnZGXApXoQLd9ZIin2xhnpTTaNq5
 q5Wj1AFiPPcNELJO/17N9y8y8KUYQwUL4h5jhNwhuQzEwPVdP5NxGYI9W/4WOci3poff
 FfUvfDV2vJlDeHpGZPeR9xqfXf6/R1LTU3IwIHRl0e1AHztAPysgzHH0nCnfyE91RGYH
 a6nJQ83kc9JlTEGIrnaq/UZ8LruApgVLxcSRyIZqW1ULC2526kcTRWQug3WF6jCjWOFf
 8NHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVYijhsfHs41JVUS8+hLgbRRwaa4k27OYyY07+Z4CuItthoYjOv0xecCt5CRjUfh9ICJVdRFPOew==@nongnu.org
X-Gm-Message-State: AOJu0Yz00CFnQMZ804fTnbiW03ODwcpsW4YV29OyGaw7cZw+jEvTeK6z
 rOLGOJVXGWEZomZRETq924mJjivOkktrQI84xJ7dDxyA4Qn1M1ZDR/0s
X-Gm-Gg: ASbGncuqnFTV/GD2TYG2/9RmwTxYiFfSWOf+x7wK55FuxmBIpZs7E02c5n+qlQR/2w3
 uk2VIHZNsMY+Z5b4weW5SRLuAEGb3OrcI7/EI5r+lEc0Q6Lvs1ziiDFnm/7UPtCK2t6diuhZTMi
 F2v8zWpmB+KPzXksfY+ZEk0AD3XQYCLdEOtFAWq3+EDWC1JXwOGD5m4xN7Pkp+tblbZrYQBHklZ
 /2q/Pya0ReoTH3cbK7T42ZtJiqGa3iTF4XI5l8ex4+h7eJJbW0W66A0Cx3cy5jAWm2mwCMB+zmX
 nRzUzpbLy02pNl0XCPEZ4UNY23ku0zwC95alzFkJ3elSzUfUXbPg8SKHhU+B/RLc0TDanrDz0qp
 Q808fWScoX2UyARHfgmtgMXKQBYeprYAJsR651k1cuG/Wcer2B+nS98oEGgl8Sy+1XreCLhQmBx
 /7nfXNSVyRwoyEsqq6V0ae5L7Fnj3A4oo=
X-Google-Smtp-Source: AGHT+IF8bDJxFdN26MzH3XnStPbW3ikTtYQS1+34s0dsLKh9rON8ms9vpkvUg6MGsWBeD5DUK5V5Kw==
X-Received: by 2002:a17:906:478d:b0:b73:58a0:e064 with SMTP id
 a640c23a62f3a-b79ec6ce11amr218281866b.50.1764840918171; 
 Thu, 04 Dec 2025 01:35:18 -0800 (PST)
Received: from PC-DA2D10.beckhoff.com ([195.226.174.194])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b2edf72asm856573a12.11.2025.12.04.01.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 01:35:17 -0800 (PST)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Yannick=20Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 YannickV <Y.Vossen@beckhoff.com>
Subject: [PATCH v5 13/15] hw/arm/xilinx_zynq: Add flash-type property
Date: Thu,  4 Dec 2025 10:35:00 +0100
Message-ID: <20251204093502.50582-14-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251204093502.50582-1-corvin.koehne@gmail.com>
References: <20251204093502.50582-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=corvin.koehne@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: YannickV <Y.Vossen@beckhoff.com>

Read flash-type value as machine property and set the flash type
accordingly.

Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
---
 hw/arm/xilinx_zynq.c         | 25 ++++++++++++++++++++-----
 include/hw/arm/xilinx_zynq.h |  1 +
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 4d095ab6f3..db4fac17c8 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -120,7 +120,8 @@ static void gem_init(uint32_t base, qemu_irq irq)
 }
 
 static inline int zynq_init_spi_flashes(uint32_t base_addr, qemu_irq irq,
-                                        bool is_qspi, int unit0)
+                                        bool is_qspi, int unit0,
+                                        const char *flash_type)
 {
     int unit = unit0;
     DeviceState *dev;
@@ -152,7 +153,7 @@ static inline int zynq_init_spi_flashes(uint32_t base_addr, qemu_irq irq,
 
         for (j = 0; j < num_ss; ++j) {
             DriveInfo *dinfo = drive_get(IF_MTD, 0, unit++);
-            flash_dev = qdev_new("n25q128");
+            flash_dev = qdev_new(flash_type);
             if (dinfo) {
                 qdev_prop_set_drive_err(flash_dev, "drive",
                                         blk_by_legacy_dinfo(dinfo),
@@ -190,6 +191,14 @@ static void zynq_set_boot_mode(Object *obj, const char *str,
     m->boot_mode = mode;
 }
 
+static void zynq_set_flash_type(Object *obj, const char *str,
+                                                Error **errp)
+{
+    ZynqMachineState *m = ZYNQ_MACHINE(obj);
+    g_free(m->flash_type);
+    m->flash_type = g_strdup(str);
+}
+
 static void ddr_ctrl_init(uint32_t base)
 {
     DeviceState *dev;
@@ -283,9 +292,12 @@ static void zynq_init(MachineState *machine)
         pic[n] = qdev_get_gpio_in(dev, n);
     }
 
-    n = zynq_init_spi_flashes(0xE0006000, pic[58 - GIC_INTERNAL], false, 0);
-    n = zynq_init_spi_flashes(0xE0007000, pic[81 - GIC_INTERNAL], false, n);
-    n = zynq_init_spi_flashes(0xE000D000, pic[51 - GIC_INTERNAL], true, n);
+    n = zynq_init_spi_flashes(0xE0006000, pic[58 - GIC_INTERNAL], false, 0,
+                              zynq_machine->flash_type);
+    n = zynq_init_spi_flashes(0xE0007000, pic[81 - GIC_INTERNAL], false, n,
+                              zynq_machine->flash_type);
+    n = zynq_init_spi_flashes(0xE000D000, pic[51 - GIC_INTERNAL], true, n,
+                              zynq_machine->flash_type);
 
     sysbus_create_simple(TYPE_CHIPIDEA, 0xE0002000, pic[53 - GIC_INTERNAL]);
     sysbus_create_simple(TYPE_CHIPIDEA, 0xE0003000, pic[76 - GIC_INTERNAL]);
@@ -473,6 +485,9 @@ static void zynq_machine_class_init(ObjectClass *oc, const void *data)
                                           "Supported boot modes:"
                                           " jtag qspi sd nor");
     object_property_set_default_str(prop, "qspi");
+
+    prop = object_class_property_add_str(oc, "flash-type", NULL, zynq_set_flash_type);
+    object_property_set_default_str(prop, "n25q128");
 }
 
 static const TypeInfo zynq_machine_type = {
diff --git a/include/hw/arm/xilinx_zynq.h b/include/hw/arm/xilinx_zynq.h
index ec80441e7c..7379fe3988 100644
--- a/include/hw/arm/xilinx_zynq.h
+++ b/include/hw/arm/xilinx_zynq.h
@@ -31,6 +31,7 @@ struct ZynqMachineState {
     Clock *ps_clk;
     ARMCPU *cpu[ZYNQ_MAX_CPUS];
     uint8_t boot_mode;
+    char *flash_type;
 };
 
 #endif /* QEMU_ARM_ZYNQ_H */
-- 
2.47.3


