Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499C4CCD19F
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 22:14:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAy8l-0005KT-DZ; Mon, 20 Oct 2025 18:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAy8j-0005Ik-BS
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:14:05 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAy8f-0006VD-Fd
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:14:04 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47118259fd8so29099665e9.3
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 15:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760998424; x=1761603224; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jmGk5ww52rySfPa3ko3wyuX1izMOGeRMMwZAnOTeG10=;
 b=Bfdo5NL/jaFONN/aMQ2fHZPgTQe850lLjILS3WQ1QSYRN8KNZmQF+kVAX9CXyv+fwg
 MxvMxHfeMRbUOhV0kjBG+bd1swh6hLm70xzUujkIPW3P8/nfyEQ6txfMb8qfKDkU9Tfe
 lbSgqx9Bp3bhwndrAv71URmPyZgUCqSgjCHqZjt+MzBZvN7HQ/Tsxni+HxDNTEH7t/9x
 EhuBuhmQT3bXkrrqhg7yU9JCbwwQSuiOcDOrCs0AwZy6qXbFbVtSo0tBfFT/+A7h0EMN
 kES6q+LuXFF5b43De6gn3ZcmRAWLnMoJlweSdYpOHzRb04yiDNHf9QOaMGXNC4s3FB0E
 J/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760998424; x=1761603224;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jmGk5ww52rySfPa3ko3wyuX1izMOGeRMMwZAnOTeG10=;
 b=HoXCUIiapL+7DsgH4xt7SWjPtNjY/dh0pnrY7OEVow495SMdlChOf4FIMbMeyqnBMM
 ragee9f7gxMDMVxVbHAbZiYXbUvonVgjOGJgiK4nToGC7qnK5oAF0gFN1WaOaYRCHMPl
 7+PmFPsQ7wROpcJTwTmSiF8sCoVTF9PSWjVMnZ58S0BiIubKlEKnhv4hbeEFNzfLC6vv
 z/6+QtaMakLNQFbFxH8QbOJDY/vfADvndFQlOmMzS0XAG4xYPaOXIIRnKwkRi/huuTzq
 Yow7WZsaI4P8oebnvPKcxcZBKNN4sn1gJX0J0dAvpASmpZeHr2Itj6KaGwgv81QZXDK5
 ZJpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuSuVFHMp1+JAzvXjQxJQF08vFVeTP94zV8OKPMWxbr33sas3PNcR783y5+27UmIrcOlXdBa58SA==@nongnu.org
X-Gm-Message-State: AOJu0YzAfGGGtP0qh3vDlyOM7pNSa+oSO+4JWSsAM11jTT6UK8LQDroF
 co/5amy0Ds70tMa4nlvetSXyFy/9LaBn52TB5Id4pODDj646FTxsqzVMvBJ5PUZCRAQ=
X-Gm-Gg: ASbGnctGSWs+NV92CxYnRjfRxezQXxVUMABxbN2cpmcXTBvF7lm7/IljaFKSbGdsRfX
 3jXHmLwubUP5pmvrWtDLdyV/w9TLyWdTPNdz594jv5kRXvKS4+5TX9wEWrrB5aLgAtdzgNfLCG5
 cb0n36EVg9DxtYVEBqB5Y3gV+hXA97ytkZPiOsXEFqqmwpcK+njOkrG/sltoSj78cbVU60kJleR
 XFTcX19ckhY8Fphc+5wx+b2qU/UsyAc3eEVHv0JZZ6V5xcjFT7yCLjEIAaJeNFN2EPMLx2dmrIw
 64a3qutMWquznzvjPnemQ8zz6k/3+jrD1gPZsjRq0bhH2jQRTMcLQ2/6txilmXexUvaiqAm9Za5
 +GxRzl/fMBU31qSdBL5tiFWH44H+bqe3oHmxzUZb3ahnv8qGaolnkwjTvCpSjsL6gsNvCSyodue
 8DFLpYxjIXsxk9UNSoc7OIV/eFtJ+nupzBUDDHKfqWp29BgJOQuBtE9XbxygNa
X-Google-Smtp-Source: AGHT+IFkz0Av3W/g1VhOZxXU6mjDc5TaUKOSOc0zH9wva6/d5f82wvJvMWfD58bsSr17NAceqqtGvQ==
X-Received: by 2002:a05:600d:8231:b0:471:1db3:6105 with SMTP id
 5b1f17b1804b1-4711db36173mr65383545e9.33.1760998424482; 
 Mon, 20 Oct 2025 15:13:44 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471529598c9sm162711665e9.5.2025.10.20.15.13.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Oct 2025 15:13:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Subject: [PATCH 12/30] hw/arm/aspeed: Build objects once
Date: Tue, 21 Oct 2025 00:13:17 +0200
Message-ID: <20251020221336.66479-2-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020220941.65269-1-philmd@linaro.org>
References: <20251020220941.65269-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Now than Aspeed machines can be filtered when running a
qemu-system-arm or qemu-system-aarch64 binary, we can
remove the TARGET_AARCH64 #ifdef'ry and compile the
aspeed.c file once, moving it from arm_ss[] source set
to arm_common_ss[].

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/aspeed.c    | 6 ------
 hw/arm/meson.build | 9 ++++-----
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 0cd76b587f7..d1a746e3b0b 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -180,13 +180,11 @@ struct AspeedMachineState {
 #define AST2600_EVB_HW_STRAP1 0x000000C0
 #define AST2600_EVB_HW_STRAP2 0x00000003
 
-#ifdef TARGET_AARCH64
 /* AST2700 evb hardware value */
 /* SCU HW Strap1 */
 #define AST2700_EVB_HW_STRAP1 0x00000800
 /* SCUIO HW Strap1 */
 #define AST2700_EVB_HW_STRAP2 0x00000700
-#endif
 
 /* Rainier hardware value: (QEMU prototype) */
 #define RAINIER_BMC_HW_STRAP1 (0x00422016 | SCU_AST2600_HW_STRAP_BOOT_SRC_EMMC)
@@ -1869,7 +1867,6 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
     aspeed_machine_class_init_cpus_defaults(mc);
 }
 
-#ifdef TARGET_AARCH64
 static void ast2700_evb_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = bmc->soc;
@@ -1921,7 +1918,6 @@ static void aspeed_machine_ast2700a1_evb_class_init(ObjectClass *oc,
     mc->default_ram_size = 1 * GiB;
     aspeed_machine_class_init_cpus_defaults(mc);
 }
-#endif
 
 static void aspeed_machine_qcom_dc_scm_v1_class_init(ObjectClass *oc,
                                                      const void *data)
@@ -2074,7 +2070,6 @@ static const TypeInfo aspeed_machine_types[] = {
         .parent         = TYPE_ASPEED_MACHINE,
         .class_init     = aspeed_minibmc_machine_ast1030_evb_class_init,
         .interfaces     = arm_aarch64_machine_interfaces,
-#ifdef TARGET_AARCH64
     }, {
         .name          = MACHINE_TYPE_NAME("ast2700a0-evb"),
         .parent        = TYPE_ASPEED_MACHINE,
@@ -2085,7 +2080,6 @@ static const TypeInfo aspeed_machine_types[] = {
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_ast2700a1_evb_class_init,
         .interfaces    = aarch64_machine_interfaces,
-#endif
     }, {
         .name          = TYPE_ASPEED_MACHINE,
         .parent        = TYPE_MACHINE,
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index b88b5b06d7e..98783bbbdeb 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -40,20 +40,19 @@ arm_common_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal.c', 'x
 arm_common_ss.add(when: 'CONFIG_FSL_IMX25', if_true: files('fsl-imx25.c', 'imx25_pdk.c'))
 arm_common_ss.add(when: 'CONFIG_FSL_IMX31', if_true: files('fsl-imx31.c', 'kzm.c'))
 arm_common_ss.add(when: 'CONFIG_FSL_IMX6', if_true: files('fsl-imx6.c'))
-arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
+arm_common_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed.c',
   'aspeed_soc_common.c',
+  'aspeed_coprocessor_common.c',
   'aspeed_ast2400.c',
   'aspeed_ast2600.c',
   'aspeed_ast10x0.c',
-  'aspeed_eeprom.c',
-  'fby35.c'))
-arm_common_ss.add(when: ['CONFIG_ASPEED_SOC', 'TARGET_AARCH64'], if_true: files(
   'aspeed_ast27x0.c',
   'aspeed_ast27x0-fc.c',
   'aspeed_ast27x0-ssp.c',
   'aspeed_ast27x0-tsp.c',
-  'aspeed_coprocessor_common.c'))
+  'aspeed_eeprom.c',
+  'fby35.c'))
 arm_common_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2.c'))
 arm_common_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2-tz.c'))
 arm_common_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-soc.c'))
-- 
2.51.0


