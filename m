Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4839325ejb;
        Fri, 30 Dec 2022 03:36:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvNuNq+f9ApF7KMRPZJ1nlwzEc8DDyxyeDBQpMN4gS6lBSsm2k6v+tadA52gZo+pBRN2zhW
X-Received: by 2002:ac8:7409:0:b0:3a8:35c:cb75 with SMTP id p9-20020ac87409000000b003a8035ccb75mr37028830qtq.13.1672400181943;
        Fri, 30 Dec 2022 03:36:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672400181; cv=none;
        d=google.com; s=arc-20160816;
        b=hPbyrhbAkUzaeJpv9VbVTaBabWILhzzyOklv3zp0nqCsF0ZEBVxnXSyXt4VFQ/hYzR
         H0dCOozuOpyPOd0mEah3UuIQ27FRsxeF9JoEfGKzwizwwyaCddocmvKwg+zWS4sWtF4g
         1Qj8X8EpUUKP6PFG3bRp03P/KO4KFlRQVucQuH+YUtg2rgpFeZaIjA8/7GHZRIzp6k9m
         PrUGUS7ybYDJvasiHubzekiARIZg3nR7yLGx623q7baOqBwYR060nE3Zq/DN+Z1QJymP
         cA/a8WTPdamxo8icu+ICRuXNayHxWQ3pxNXbgm/z6JegJxBuXbWw8f1YvNibvRUhSGEV
         ZkkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jwcfecgiR0FIp2svYcWH8+Gc+mTlFvrMBZzkgfCKb4w=;
        b=IdCmXYakKCLSctkTI1OnojUyVWSBGFalklHau+nR6kIqvf3+vFTCPIFgNqwgHybK8u
         G4ex5ElnY9RlEmG+ff5Tj0KpYC82GrKBdDqtJfhsV7dTSaHIk8MnpYu8aJwAahVGi9Uv
         JcYLh2lMZPBIgpt96KJclCmCY6NsgSj5p55g7XtMutA2R7x/DZHwFQ61T/1vz9Lp4UCG
         WVIpqiZlYCEom7IgbDyC3TIINhv2kL3GmQAyBR1+vvTIC2EEDkpxrfwKYO4hf3nBsXpY
         tDx6y4WvfPr2z6Dp2nk/eJ5My5Z9SkE+WEBAypgrkJMQFdlQgd9L4bmECGXCq/nccQj6
         wqYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XZERgT9F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bt8-20020ac86908000000b0039972a004a3si10365397qtb.608.2022.12.30.03.36.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Dec 2022 03:36:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XZERgT9F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pBDg9-0006eL-8x; Fri, 30 Dec 2022 06:36:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDg1-0006a3-DJ
 for qemu-arm@nongnu.org; Fri, 30 Dec 2022 06:35:53 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDfz-0003rD-M9
 for qemu-arm@nongnu.org; Fri, 30 Dec 2022 06:35:53 -0500
Received: by mail-wr1-x429.google.com with SMTP id j17so14311415wrr.7
 for <qemu-arm@nongnu.org>; Fri, 30 Dec 2022 03:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jwcfecgiR0FIp2svYcWH8+Gc+mTlFvrMBZzkgfCKb4w=;
 b=XZERgT9F5sbNIEYJwMZp8XqwOlgcEdp3uAUz0spFvOE41bn7OFvWSlsfSTprUZ6SZA
 D07AnZg9RYGkzpZAVJpcRTNgXy4HbGgy4Zfoy/l42O8GhcsQcUEmJOMoqYf163JyU55i
 lgzCVAo1gywCDB9xuKKCGOIeevSBC1oYgEb/oYi+/mD3DahPOQ7+pohUNuq5DQ1PI2cH
 zRlKoN+ntzyhXbFiPsUMbN2rdyVnAx2FRhuHITapXgqhl6nHv6OzN63EEIRIjkQ68uGm
 29TIj7B1QgclbYFnAgUQDWm5OxGFy+XbC6XQqcdGcrJMgy+AMtu4fXOGuQ5Y/CJJz0T5
 WGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jwcfecgiR0FIp2svYcWH8+Gc+mTlFvrMBZzkgfCKb4w=;
 b=EJL4Q/m/EcY5hAAm0dZfq734z+k2hAfJBdvr2m/6SAuvPT2Mmq/mYzVaKmUgbSn+4v
 tiDyGq8FV5Ycdwmg1UErHbvuYoFEn0zvaZPAc524Otb7ZeV1V1iFAJ5Rn+Zl78HkBbCG
 KMEtu0ir0UjPUVfe55lJ9dd1e3c+IYH9B0ZiqzxMNImyneQ5pFwkdXSLoueytJStlNp4
 DZZGV48NgSzHyuZVMIjcTuiRf/4ISibgnYHmEHK/KVNstWD4X59J+R1tnz5G+2LwP/xz
 kZrzYMYWlHSR5R+p/eGPeWewSXWL9VKMyMO1Ln6iPG54ZSxjNotxjkHgBcGo7zMcpufz
 KK6w==
X-Gm-Message-State: AFqh2ko/Zh0hiK73BkBlrmgvzWb4cwN1QOy/4RTqVG59zjYJ1mJ2hapx
 Y5krREXkWJdbFHZ4xOMtDwLBRw==
X-Received: by 2002:a5d:4884:0:b0:242:3812:f948 with SMTP id
 g4-20020a5d4884000000b002423812f948mr20895635wrq.24.1672400151006; 
 Fri, 30 Dec 2022 03:35:51 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a5d4f04000000b002365cd93d05sm20185641wru.102.2022.12.30.03.35.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 30 Dec 2022 03:35:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Peter Delevoryas <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>
Subject: [PATCH v2 08/11] hw/arm/aspeed_ast10x0: Map the secure SRAM
Date: Fri, 30 Dec 2022 12:35:01 +0100
Message-Id: <20221230113504.37032-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221230113504.37032-1-philmd@linaro.org>
References: <20221230113504.37032-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +7LFk2auZTsp

Some SRAM appears to be used by the Secure Boot unit and
crypto accelerators. Name it 'secure sram'.

Note, the SRAM base address was already present but unused
(the 'SBC' index is used for the MMIO peripheral).

Interestingly using CFLAGS=-Winitializer-overrides reports:

  ../hw/arm/aspeed_ast10x0.c:32:30: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
    [ASPEED_DEV_SBC]       = 0x7E6F2000,
                             ^~~~~~~~~~
  ../hw/arm/aspeed_ast10x0.c:24:30: note: previous initialization is here
    [ASPEED_DEV_SBC]       = 0x79000000,
                             ^~~~~~~~~~
This fixes with Zephyr:

  uart:~$ rsa test
  rsa test vector[0]:
  [00:00:26.156,000] <err> os: ***** BUS FAULT *****
  [00:00:26.157,000] <err> os:   Precise data bus error
  [00:00:26.157,000] <err> os:   BFAR Address: 0x79000000
  [00:00:26.158,000] <err> os: r0/a1:  0x79000000  r1/a2:  0x00000000  r2/a3:  0x00001800
  [00:00:26.158,000] <err> os: r3/a4:  0x79001800 r12/ip:  0x00000800 r14/lr:  0x0001098d
  [00:00:26.158,000] <err> os:  xpsr:  0x81000000
  [00:00:26.158,000] <err> os: Faulting instruction address (r15/pc): 0x0001e1bc
  [00:00:26.158,000] <err> os: >>> ZEPHYR FATAL ERROR 0: CPU exception on CPU 0
  [00:00:26.158,000] <err> os: Current thread: 0x38248 (shell_uart)
  [00:00:26.165,000] <err> os: Halting system

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/arm/aspeed_ast10x0.c     | 11 ++++++++++-
 include/hw/arm/aspeed_soc.h |  3 +++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 6c6d33d4a0..e74e2660ce 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -22,7 +22,7 @@
 
 static const hwaddr aspeed_soc_ast1030_memmap[] = {
     [ASPEED_DEV_SRAM]      = 0x00000000,
-    [ASPEED_DEV_SBC]       = 0x79000000,
+    [ASPEED_DEV_SECSRAM]   = 0x79000000,
     [ASPEED_DEV_IOMEM]     = 0x7E600000,
     [ASPEED_DEV_PWM]       = 0x7E610000,
     [ASPEED_DEV_FMC]       = 0x7E620000,
@@ -222,6 +222,14 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     memory_region_add_subregion(s->memory,
                                 sc->memmap[ASPEED_DEV_SRAM],
                                 &s->sram);
+    memory_region_init_ram(&s->secsram, OBJECT(s), "sec.sram",
+                           sc->secsram_size, &err);
+    if (err != NULL) {
+        error_propagate(errp, err);
+        return;
+    }
+    memory_region_add_subregion(s->memory, sc->memmap[ASPEED_DEV_SECSRAM],
+                                &s->secsram);
 
     /* SCU */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->scu), errp)) {
@@ -401,6 +409,7 @@ static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
     sc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
     sc->silicon_rev = AST1030_A1_SILICON_REV;
     sc->sram_size = 768 * KiB;
+    sc->secsram_size = 9 * KiB;
     sc->spis_num = 2;
     sc->ehcis_num = 0;
     sc->wdts_num = 4;
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 9a5e3c0bac..bd1e03e78a 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -71,6 +71,7 @@ struct AspeedSoCState {
     AspeedSMCState spi[ASPEED_SPIS_NUM];
     EHCISysBusState ehci[ASPEED_EHCIS_NUM];
     AspeedSBCState sbc;
+    MemoryRegion secsram;
     UnimplementedDeviceState sbc_unimplemented;
     AspeedSDMCState sdmc;
     AspeedWDTState wdt[ASPEED_WDTS_NUM];
@@ -105,6 +106,7 @@ struct AspeedSoCClass {
     const char *cpu_type;
     uint32_t silicon_rev;
     uint64_t sram_size;
+    uint64_t secsram_size;
     int spis_num;
     int ehcis_num;
     int wdts_num;
@@ -143,6 +145,7 @@ enum {
     ASPEED_DEV_SCU,
     ASPEED_DEV_ADC,
     ASPEED_DEV_SBC,
+    ASPEED_DEV_SECSRAM,
     ASPEED_DEV_EMMC_BC,
     ASPEED_DEV_VIDEO,
     ASPEED_DEV_SRAM,
-- 
2.38.1

