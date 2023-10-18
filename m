Received: by 2002:a17:906:b794:b0:9b6:5cec:e61e with SMTP id dt20csp20070ejb;
        Wed, 18 Oct 2023 11:14:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEf7YBS++kvY0bZ/TXP4rN4YI2MAtU5bhLSW3f0tX4oSaPukXw4V8Twr3AXB+Zes2Voyd6x
X-Received: by 2002:a05:6214:2129:b0:635:93fb:fc05 with SMTP id r9-20020a056214212900b0063593fbfc05mr68840qvc.10.1697652843793;
        Wed, 18 Oct 2023 11:14:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697652843; cv=none;
        d=google.com; s=arc-20160816;
        b=TSmOuN7CLpepUxF1NbM9tuCLMRr2T7MR85UcurIz/TtdR3KAFS9BIfrjzn7KrzSyhk
         wdj6lutEp7RU4sPRz8ncO0aAeg1vDDmYktmTzDjJPenpckV/WCUV69oed1TdK6lh94eP
         2qad07lJDSbPA11lEGzqB6dan6jiyO48iSnhgfsufq4LVRgU/WvLoY1rcfZfgxkNkC2X
         Wdn9KMvNVsI4509siRWKY/gXuUrOmTezfu22dJv0dfyk894N9PWCFGBS9ztF1492Dms0
         YznKkGzrZRMUoiKENfiiR5sV93Qku/2Q7AMp+NWyikU9TQ4yxZVzaTHHbrnc68aLU8hY
         VGgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=fpTYqbzbpK0KwCDIcxLgpCv/rd2lgYasN8Y7y7lzZh8=;
        fh=8TcdNm2PUOSTOLTAPwKw1HRZgze8qTDV0WK6iGCckjQ=;
        b=xyWj4yiiRgJ09bAQr/iu/Oxd3sMFQ+coTTMCvfyAakT39wEjaOz2I0eYArPnllFcTW
         Cbysk8PTFMVR14Otjsdsk6QRkPgNQtZKIdagG2WX2jxR2QkX79Gx6yS05iRS+oGoAoVb
         2nt9jG0MLsuW0Oafgal5owNcjaYowMXI+LsV9Gdn79pyPnEKi1yK6p+thcSvak/WlLN0
         xfsE+c0cRlImBC2wCXYHyw4bBH8rio8nyZSzy0XrB+p7TssZXTeQmB7ZYGzlEPqXofZp
         Zacc0a/o0aHZSISdbGc0YPvqYtRXyd00DqhnevXdnxGYJr5V4cNWOy3EoF9hbYuU2wZF
         DYfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=bcSfo5Xp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c26-20020ae9e21a000000b007788bb3ee9esi290923qkc.554.2023.10.18.11.14.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 11:14:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=bcSfo5Xp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtB2b-0008KH-ST; Wed, 18 Oct 2023 14:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3MSAwZQwKCmINABIHESTEFANGOOGLE.COMQEMU-DEVELNONGNU.ORG@flex--nabihestefan.bounces.google.com>)
 id 1qtB2Z-0008BA-Vz
 for qemu-devel@nongnu.org; Wed, 18 Oct 2023 14:13:08 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3MSAwZQwKCmINABIHESTEFANGOOGLE.COMQEMU-DEVELNONGNU.ORG@flex--nabihestefan.bounces.google.com>)
 id 1qtB2Y-0008HI-F0
 for qemu-devel@nongnu.org; Wed, 18 Oct 2023 14:13:07 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-d9a3942461aso10415213276.2
 for <qemu-devel@nongnu.org>; Wed, 18 Oct 2023 11:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1697652785; x=1698257585; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=fpTYqbzbpK0KwCDIcxLgpCv/rd2lgYasN8Y7y7lzZh8=;
 b=bcSfo5XpiXYtxDNP/ZhronBAVbTw4cOvmt6Z1z5koegpbWbnI9qeRzDTo03fvD0UoT
 18/f/S/3g16RKrPOc1kl19FBit8m/OOh0Q6kTOP9zG8rH8KFuQlUSCbFwC+GpCTxveO6
 iG+Ok3KcS3+1dzjBjgLRzDJ1XhAVMeGTJOneXzu7q1GZk5+QPDedealv2HHNYGhgcANP
 21kIJZAJchoKdeywCcE+jaXlNILzrBysEQLsY2SEcPOnwSY6R435SvBiS8jtgZ810H/x
 UbEFO2RMXJXf06L0kIL+xNO3R2EIhX9jpTt3++VnqHpoqqHl/Tt64OszPBGjdmupTw9M
 5d9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697652785; x=1698257585;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fpTYqbzbpK0KwCDIcxLgpCv/rd2lgYasN8Y7y7lzZh8=;
 b=WfDWN+eVjlp2juxTsVobJPLDeMWhksdDvMibYhwtx25WB29cAthOZPUmvRBzS8xQ49
 X8/n1umG4it12WCDK9kaya2ZqxZHDtL1iMaPmCPtuMTINgx0qabfGJtSzqa5R/QuVL27
 YViy/nC1Rh7xFCbihZ+Dk92g+Iim+7dIHrdLVdLQsjQE+1bUdP0qc5giJwKGRCNAbF8X
 lQ7Gjpc6sa/kNKgkmWPnf/Q0Ka/f26d0xscOw69HTRLcep4P2204p3JoxRUWwZ9NJFNs
 BBCgXW/A8XoVK+QhIb5nnqufgcRZQY57OcmwG1YhSDIkrD6wq+aQnDKDfNXjPw/8P0bY
 t9kg==
X-Gm-Message-State: AOJu0Yy/xWN3Vl7vL/vqjdZrjfbn2j0AEIRTDVYfPFioe/yekgIa0ADf
 rMESjKMNOjOTkbtgvuKdhMesxrHJ8Hc+jAjCYqw=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a25:b21b:0:b0:d9a:4329:86cf with SMTP
 id i27-20020a25b21b000000b00d9a432986cfmr2648ybj.12.1697652785392; Wed, 18
 Oct 2023 11:13:05 -0700 (PDT)
Date: Wed, 18 Oct 2023 18:12:50 +0000
In-Reply-To: <20231018181259.748819-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20231018181259.748819-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
Message-ID: <20231018181259.748819-3-nabihestefan@google.com>
Subject: [PATCH v4 02/11] hw/arm: Add PCI mailbox module to Nuvoton SoC
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3MSAwZQwKCmINABIHESTEFANGOOGLE.COMQEMU-DEVELNONGNU.ORG@flex--nabihestefan.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lnAYP3jbV9E+

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

