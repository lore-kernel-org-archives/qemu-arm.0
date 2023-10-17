Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4255861ejc;
        Tue, 17 Oct 2023 16:05:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhWc1pqzocxdUmK5eszmYBr4qV81Q/4nTFkXkgdt2vndMhANuv90yK2kV6cafnHVLs1Rrb
X-Received: by 2002:a05:620a:783:b0:76f:839:6bdd with SMTP id 3-20020a05620a078300b0076f08396bddmr3936679qka.3.1697583936151;
        Tue, 17 Oct 2023 16:05:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697583936; cv=none;
        d=google.com; s=arc-20160816;
        b=P7C9SzMgR2FKNs6NkNrcRstW+q3FNe9E+U2iWVS77BDYW40eNfIgzWJB3sIzIPlvHZ
         jmdEtailIN6XPoM/5FWHzPsouMR9yJ0wKaBULlMLLqN/OU2djgKX6DvHdOnrLoe7j+Pq
         R+pHP9/bVEEFpiwhTwrRXqwMC/fkVr8Ua+Frs7wAKhMfi/dSRJZ3EuLPoPDSDKfllZHE
         8rmE7HvmUcJMfw/1s1z5uPVJti8jnAxAFWy+TX8ir/t640IRYWqaODSt/DJUeDCCseDV
         NoOEiw+dRcvxq+06vSapL6AFmP7yNGSKAumwxVRMJNPC06fQYOtJUh6RwQ4N2tQ5B8P9
         i4pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=xVjSz03YhlqWn4x5rMD+S7ZjWNLMHmSXRcMSJqLVbbo=;
        fh=VpdIyJR9n9QpzQWHJW541W97F/M8Z10MnahQ3EEY1JY=;
        b=ctxVwcBkQot2e6gNN682E4U9VNu8cf7YtyAN6jT2LsWFjO37w/dfnquU2eSL0aHLL8
         5m3MpW71yyaz86qkbYwTt+udvwtRW6pM70HnmKIQN60B848ZPDzrM8hGv6VwfdWscMJ1
         C2t2mTPHqpftz7oY+BU1mA7k7nWauaHvy7X/ZLhESzYW9YCwMC6Vq7QNAB14iMuTIXis
         DW34a5o35kvRxGIu92pcVnNf6UH1/Ok8iJNONOqt4rNV6/cXifebDgAMSKRliH5V346N
         /T/xJGDWGW0eBakk91HzxTsFXrtzuSkBSiYDrtt6uNRI7JKawBNdZG31BTLL83rXB9ly
         FYOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=U6SBgGL3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3-20020a37c203000000b00773af69e605si1737616qkm.85.2023.10.17.16.05.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 16:05:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=U6SBgGL3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qst6c-0006LN-0E; Tue, 17 Oct 2023 19:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <34BIvZQwKCPEgTUbaXlmXYTgZhhZeX.VhfjXfn-TkfghgZgn.hkZ@flex--nabihestefan.bounces.google.com>)
 id 1qst6Z-0006G5-Gz
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 19:04:03 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <34BIvZQwKCPEgTUbaXlmXYTgZhhZeX.VhfjXfn-TkfghgZgn.hkZ@flex--nabihestefan.bounces.google.com>)
 id 1qst6X-0002Jl-RV
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 19:04:03 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-d9ab7badadeso8597567276.1
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 16:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697583840; x=1698188640; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=xVjSz03YhlqWn4x5rMD+S7ZjWNLMHmSXRcMSJqLVbbo=;
 b=U6SBgGL3Fp0iFxrpQljWW9VC6TWaxMhrKDzqG5ahf9fX/PAkfukNFSUqnPSxbh5vBv
 Q+DAc+QkJPRjvAEcfZyg/0ITtyvbkfyuemeMdFPfs2HLII5e/c5mSiC3fCUIfK5/FQbz
 BBCH1jgwUrxbYj9NfadMuVzzAItecIVVWA73X1Ic9+YAO65hj/o2OW7hvwhE4rNBqc9+
 aXUqbE/BZQ+Ng7wkNSzq3TGNf2ZXSrHTvbtkDeGQs0tvJMMUkW50tvMcRiOm9Kg8xiui
 4vL26rhxLUohjV5WdJW75g9UUKKJ8fQWEEfg8W23CafLKg2aYeNBofAcr83Gd6zgxjQ6
 bjgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697583840; x=1698188640;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xVjSz03YhlqWn4x5rMD+S7ZjWNLMHmSXRcMSJqLVbbo=;
 b=fCHTpjBpn1LAKg16ETujpU5ZPxoTtgDq2qoAVjwJupzPrIbKBwTxPz5KvNXNvINZTQ
 tgNjXyFefUWDncKo4ODvDzo7I8Z7mCvwtM765uGWn7CZLC1Fe68BoTUb65dTuaddxWjK
 staAeDjwejriXNNB8lSz9Vo3yk2Bed3GrvOZYPUCmH7napSrrt+5QQxN6BVlk1BY2rzv
 PFDZvKXQFvNCEy18A79OaCo94djyh8964xm4m+YIlHWz6Ak7nIMCm5AHhLBfDDTZRlGC
 VuaaKjBe2LnOlDxSf54v2Yaw/uU9yH2zZ9k49hVv64iWcWjxjDfE/srtfCjZSgt7bXu+
 pohg==
X-Gm-Message-State: AOJu0Yxv63CaP3dm/1cn2mgozoiAYnX2xoKYUSZTcX+t1CdGAGkpAPsc
 FGbN/hfLe4IL8kbLW8LS48jU6hHKcAcMbV7+Trs=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a05:6902:1825:b0:d9a:c3a2:48a3 with
 SMTP id cf37-20020a056902182500b00d9ac3a248a3mr73028ybb.6.1697583840239; Tue,
 17 Oct 2023 16:04:00 -0700 (PDT)
Date: Tue, 17 Oct 2023 23:03:36 +0000
In-Reply-To: <20231017230342.311227-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20231017230342.311227-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
Message-ID: <20231017230342.311227-6-nabihestefan@google.com>
Subject: [PATCH v3 05/11] hw/arm: Add GMAC devices to NPCM7XX SoC
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, avi.fishman@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=34BIvZQwKCPEgTUbaXlmXYTgZhhZeX.VhfjXfn-TkfghgZgn.hkZ@flex--nabihestefan.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: CMbk7ky9kWcj

From: Hao Wu <wuhaotsh@google.com>

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx.c         | 36 ++++++++++++++++++++++++++++++++++--
 include/hw/arm/npcm7xx.h |  2 ++
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index c9e87162cb..12e11250e1 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -91,6 +91,7 @@ enum NPCM7xxInterrupt {
     NPCM7XX_GMAC1_IRQ           = 14,
     NPCM7XX_EMC1RX_IRQ          = 15,
     NPCM7XX_EMC1TX_IRQ,
+    NPCM7XX_GMAC2_IRQ,
     NPCM7XX_MMC_IRQ             = 26,
     NPCM7XX_PSPI2_IRQ           = 28,
     NPCM7XX_PSPI1_IRQ           = 31,
@@ -234,6 +235,12 @@ static const hwaddr npcm7xx_pspi_addr[] = {
     0xf0201000,
 };
 
+/* Register base address for each GMAC Module */
+static const hwaddr npcm7xx_gmac_addr[] = {
+    0xf0802000,
+    0xf0804000,
+};
+
 static const struct {
     hwaddr regs_addr;
     uint32_t unconnected_pins;
@@ -462,6 +469,10 @@ static void npcm7xx_init(Object *obj)
         object_initialize_child(obj, "pspi[*]", &s->pspi[i], TYPE_NPCM_PSPI);
     }
 
+    for (i = 0; i < ARRAY_SIZE(s->gmac); i++) {
+        object_initialize_child(obj, "gmac[*]", &s->gmac[i], TYPE_NPCM_GMAC);
+    }
+
     object_initialize_child(obj, "pci-mbox", &s->pci_mbox,
                             TYPE_NPCM7XX_PCI_MBOX);
     object_initialize_child(obj, "mmc", &s->mmc, TYPE_NPCM7XX_SDHCI);
@@ -695,6 +706,29 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(sbd, 1, npcm7xx_irq(s, rx_irq));
     }
 
+    /*
+     * GMAC Modules. Cannot fail.
+     */
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_gmac_addr) != ARRAY_SIZE(s->gmac));
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(s->gmac) != 2);
+    for (i = 0; i < ARRAY_SIZE(s->gmac); i++) {
+        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->gmac[i]);
+
+        /*
+         * The device exists regardless of whether it's connected to a QEMU
+         * netdev backend. So always instantiate it even if there is no
+         * backend.
+         */
+        sysbus_realize(sbd, &error_abort);
+        sysbus_mmio_map(sbd, 0, npcm7xx_gmac_addr[i]);
+        int irq = i == 0 ? NPCM7XX_GMAC1_IRQ : NPCM7XX_GMAC2_IRQ;
+        /*
+         * N.B. The values for the second argument sysbus_connect_irq are
+         * chosen to match the registration order in npcm7xx_emc_realize.
+         */
+        sysbus_connect_irq(sbd, 0, npcm7xx_irq(s, irq));
+    }
+
     /*
      * Flash Interface Unit (FIU). Can fail if incorrect number of chip selects
      * specified, but this is a programming error.
@@ -765,8 +799,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.siox[2]",      0xf0102000,   4 * KiB);
     create_unimplemented_device("npcm7xx.ahbpci",       0xf0400000,   1 * MiB);
     create_unimplemented_device("npcm7xx.mcphy",        0xf05f0000,  64 * KiB);
-    create_unimplemented_device("npcm7xx.gmac1",        0xf0802000,   8 * KiB);
-    create_unimplemented_device("npcm7xx.gmac2",        0xf0804000,   8 * KiB);
     create_unimplemented_device("npcm7xx.vcd",          0xf0810000,  64 * KiB);
     create_unimplemented_device("npcm7xx.ece",          0xf0820000,   8 * KiB);
     create_unimplemented_device("npcm7xx.vdma",         0xf0822000,   8 * KiB);
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index cec3792a2e..9e5cf639a2 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -30,6 +30,7 @@
 #include "hw/misc/npcm7xx_pwm.h"
 #include "hw/misc/npcm7xx_rng.h"
 #include "hw/net/npcm7xx_emc.h"
+#include "hw/net/npcm_gmac.h"
 #include "hw/nvram/npcm7xx_otp.h"
 #include "hw/timer/npcm7xx_timer.h"
 #include "hw/ssi/npcm7xx_fiu.h"
@@ -105,6 +106,7 @@ struct NPCM7xxState {
     OHCISysBusState     ohci;
     NPCM7xxFIUState     fiu[2];
     NPCM7xxEMCState     emc[2];
+    NPCMGMACState       gmac[2];
     NPCM7xxPCIMBoxState pci_mbox;
     NPCM7xxSDHCIState   mmc;
     NPCMPSPIState       pspi[2];
-- 
2.42.0.655.g421f12c284-goog

