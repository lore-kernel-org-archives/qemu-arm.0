Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4110582ejc;
        Tue, 17 Oct 2023 11:13:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYrzGmtL+hX299wD0uCe9nrLXTk9S3V1WeRZGrd5g4EHco3nnlu89BuLoiPnMybF3efNr4
X-Received: by 2002:a67:ab43:0:b0:44d:5e09:e387 with SMTP id k3-20020a67ab43000000b0044d5e09e387mr3159627vsh.20.1697566406003;
        Tue, 17 Oct 2023 11:13:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697566405; cv=none;
        d=google.com; s=arc-20160816;
        b=KGK2jnOW9Ue/pmH4nDq6K4GBMGiLWBz5ej941FHq4v3zvRLlIU5yz3QNJn09NFP8P/
         Nq1nFerA/e66xkcIZwlERCV8rpNOA2QSVj3s/ARek3zZlQsZeIwKXYO6++VNcLx/gbQE
         CefmS7Fc4JbGtpHB5sH6Cj9kXHJk+f1fAh8yFjGGM8t5zfBC9oYQsCSGDxZtaLAdKhxP
         +WlGJg7LsSfdaeE5UZAYFqFf0tb8Z86m0hcqlCtbqnPU4CYykOFIWaxt998uPiQoVdwh
         S0tB+65dgK4uo2Zqw8j6S71NcBS5HMZ+IkbMHK1DJ5MCO+TlSBx5uIzN0ynC3M4QAGAV
         kelg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=fpTYqbzbpK0KwCDIcxLgpCv/rd2lgYasN8Y7y7lzZh8=;
        fh=VpdIyJR9n9QpzQWHJW541W97F/M8Z10MnahQ3EEY1JY=;
        b=QKQP5mm54BF56iAmw3NCE+wB+CqE2OeqFCpAcXldGhLGP2V+kVxx2y4LN2coU0Rq3q
         ldYJ3c7naMxamJ55iKfsnwN9RcH8AatTAAIYH+NgT8PfJhzza79RpafPmt+lOwCYOn2I
         NRSHpbWOLyjlsj72dxF4PO6GVeXPACQEsz14MCO9eGW12dQmsHUdUhOf+ir9uV/eUbDb
         6IbhPn8qQjsKIPyk7hukSXkehFEaCEh3CSqpzpekx8ebLwOCHP2j/+lHpztolfTYEaZh
         +BDia7kownmP0iCwIt2FKRYywAR8p+I/l0KX6pFvP+tpbjQDTBYNuojvsM/BUNQlcHxl
         SsFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=0EJ7vdvd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u4-20020a05622a198400b004198a46d6d9si1612485qtc.30.2023.10.17.11.13.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 11:13:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=0EJ7vdvd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsoY2-0004rc-RH; Tue, 17 Oct 2023 14:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3cc4uZQwKCPgsfgnmjxyjkfslttlqj.htrvjrz-fwrstslsz.twl@flex--nabihestefan.bounces.google.com>)
 id 1qsoY1-0004qK-3I
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 14:12:05 -0400
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3cc4uZQwKCPgsfgnmjxyjkfslttlqj.htrvjrz-fwrstslsz.twl@flex--nabihestefan.bounces.google.com>)
 id 1qsoXz-0006vg-69
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 14:12:04 -0400
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-5a828bdcfbaso65672007b3.2
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 11:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697566321; x=1698171121; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=fpTYqbzbpK0KwCDIcxLgpCv/rd2lgYasN8Y7y7lzZh8=;
 b=0EJ7vdvddHz7J3ZP3g1KPANgxYBmdk7flFMCc5JjSDHHdA2Dd7DRTEOiPdZrks83C9
 YQVFNDpFXXyySG//EMfk55oakbfUNp59cETkcAEB6RJFvfEM8DmQDukbeCaZD2KzlP07
 TFRjXPVieESlEq+ha0AR0NnRjSHBXh4yABH1yNMf1GbHgX7domfyo87Ou5mmnhcsHqy0
 MRqHYu3qvHeC9853vJ6oqBhd1Ulb1PMwUq6veRYQ1pC1bMeJksBLlUPTdKzUAd2YvM5b
 AkVYUuPPYRifSwPBH6HfeoHWybiIyrkZCpnhs4s6ujqatxKoJUYX+M4Y+jliJm3WyW7p
 dbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697566321; x=1698171121;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fpTYqbzbpK0KwCDIcxLgpCv/rd2lgYasN8Y7y7lzZh8=;
 b=SLKcprTgi6pEyzbOeQJHUYh50aYA6wrNnPiw2+l1QdtN3Eyt2Nwm7VRPRtrZXrqpYv
 1BZfOCSm5f5gr805IoI9Yf/CmKjU3rN0O3C/2ohD8hC/MEA4FmsSGy0xgqDHuLleQXr3
 lgc/bA6srU6t+o4tOxtARmiYhQZrq0AVoU7JcLysZhy4gBMrct3nSXqG5i6iMijbNo+C
 S+ha7H819qyaD5oDq1Jj9lVazmW7AStKcV0E3Qx8nbI50Umax3o5+nYSKtoaRV2bCrJm
 cjpMePU2m+Q2YNfZofE7uuhOBJDyz8zF5nZPrLLBJiRZ8iN+AY8olOnERTWXmjEgnjSU
 n3QQ==
X-Gm-Message-State: AOJu0YzFK1HLHcnx9Qex0VdcekA6OxvgZfmfDhPrNCFU4O+/2kee6oh0
 9lz3VsS2QuLkcrXM6Rw1Ddg0tPSd8KbGUNGdrwY=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a25:4e09:0:b0:d9b:341a:ba5d with SMTP
 id c9-20020a254e09000000b00d9b341aba5dmr60656ybb.13.1697566321193; Tue, 17
 Oct 2023 11:12:01 -0700 (PDT)
Date: Tue, 17 Oct 2023 18:11:43 +0000
In-Reply-To: <20231017181152.201887-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20231017181152.201887-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
Message-ID: <20231017181152.201887-3-nabihestefan@google.com>
Subject: [PATCH 02/11] hw/arm: Add PCI mailbox module to Nuvoton SoC
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, avi.fishman@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3cc4uZQwKCPgsfgnmjxyjkfslttlqj.htrvjrz-fwrstslsz.twl@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: 50oUqO4cpz+a

From: Hao Wu <wuhaotsh@google.com>

This patch wires the PCI mailbox module to Nuvoton SoC.

Google-Rebase-Count: 5
Google-Bug-Id: 262938292
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Change-Id: Ifd858a7ed760557faa15a7a1cef66b2056f06e2e
---
 docs/system/arm/nuvoton.rst | 2 ++
 hw/arm/npcm7xx.c            | 3 ++-
 include/hw/arm/npcm7xx.h    | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index 0424cae4b0..e611099545 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -50,6 +50,8 @@ Supported devices
  * Ethernet controller (EMC)
  * Tachometer
  * Peripheral SPI controller (PSPI)
+ * BIOS POST code FIFO
+ * PCI Mailbox
 
 Missing devices
 ---------------
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index c69e936669..c9e87162cb 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -86,7 +86,6 @@ enum NPCM7xxInterrupt {
     NPCM7XX_UART1_IRQ,
     NPCM7XX_UART2_IRQ,
     NPCM7XX_UART3_IRQ,
-    NPCM7XX_PECI_IRQ            = 6,
     NPCM7XX_PCI_MBOX_IRQ        = 8,
     NPCM7XX_KCS_HIB_IRQ         = 9,
     NPCM7XX_GMAC1_IRQ           = 14,
@@ -463,6 +462,8 @@ static void npcm7xx_init(Object *obj)
         object_initialize_child(obj, "pspi[*]", &s->pspi[i], TYPE_NPCM_PSPI);
     }
 
+    object_initialize_child(obj, "pci-mbox", &s->pci_mbox,
+                            TYPE_NPCM7XX_PCI_MBOX);
     object_initialize_child(obj, "mmc", &s->mmc, TYPE_NPCM7XX_SDHCI);
 }
 
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 273090ac60..cec3792a2e 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -105,6 +105,7 @@ struct NPCM7xxState {
     OHCISysBusState     ohci;
     NPCM7xxFIUState     fiu[2];
     NPCM7xxEMCState     emc[2];
+    NPCM7xxPCIMBoxState pci_mbox;
     NPCM7xxSDHCIState   mmc;
     NPCMPSPIState       pspi[2];
 };
-- 
2.42.0.655.g421f12c284-goog

