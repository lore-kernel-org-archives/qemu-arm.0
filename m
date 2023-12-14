Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp2615649ejo;
        Thu, 14 Dec 2023 13:18:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKdOHcApfUbKFmd/izLfckxCXV6ffaPjjUHe9ilUgSOQLX3G+3NIaJOmYAzURdyTIZFpdj
X-Received: by 2002:a05:6358:7e83:b0:170:73d:fce9 with SMTP id o3-20020a0563587e8300b00170073dfce9mr11046579rwn.16.1702588732420;
        Thu, 14 Dec 2023 13:18:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702588732; cv=none;
        d=google.com; s=arc-20160816;
        b=w0TBQCQ/qPPHzMQJAkS7cW2EM8wfy/aY/Lh8fkxQpKOgnM2qcbmnKG8GOtS1bBmATv
         ceRnwKJOGJ8xU0FdaM/XD3TbVXPzsAT773GAXcjSSFPzYKWgwOp101KepoPwCixy03LZ
         62WRsxG7d+ifLLQ3rFXyH+QtbDaMNbXSP3MajhRkxPZK97gDatdwRr+GBtu0/IlIuDBr
         U5WIpH6nloGFKlL2OKZa/PIV6EG94ZnEkFG8y6aIYGnbu25c+ZCKmgLEt1EJ6qg9hPGw
         /bAh5zre8Ees4LxzGKZxVEtR+EbkKjFfAnFG59wK9D8ctVeshIu+kYMPkNNdKbEv3EGZ
         JFyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=THE8NnuUb7NBph9vZ2fuGB8Sryx7pSkYnupUZ3ZaVIU=;
        fh=+aVB0apLn7P4p3cMF9Qg7nFZ6+AnRx2Fcri+oFjNFtM=;
        b=pwUP9xhISASsqVLJiCy05C8S/OMa8N73LaPhe1abieT+2dVtk89tLhX7GJQJuOvP1S
         AD70gNjASBPJ4RfY55541+RkROzVx5qTU3dj8V9mIkpQmBAha6NDEQmPXtkyUG0seqjq
         bv9sHlQ50KYAOq3HpM9mMICodWKHAllROghcvhkjtEzshhsXd6Z+0ziyAsMMC1PQB+dC
         3Sl0o5wCPhhLlxRcfqfLxqsjUDxs7CK7XgPCAe+ay+U9j8TOOaxJqMMoiMQXas/znwwZ
         Ji03DYs7gi5nuW1xnRlAF/yDX/gIzZ7gbzH4TtVK/QWJsNBlJ/5ejIqjIWbRMiP++DO1
         WA4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=OEUTK+LL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pn10-20020a056214130a00b0067abc334c2dsi7347212qvb.440.2023.12.14.13.18.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Dec 2023 13:18:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=OEUTK+LL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rDt3s-0002cP-Hr; Thu, 14 Dec 2023 16:16:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3dXB7ZQwKCnYhUVcbYmnYZUhaiiafY.WigkYgo-XYpYfhihaho.ila@flex--nabihestefan.bounces.google.com>)
 id 1rDt3d-0002UR-Ob
 for qemu-devel@nongnu.org; Thu, 14 Dec 2023 16:15:51 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3dXB7ZQwKCnYhUVcbYmnYZUhaiiafY.WigkYgo-XYpYfhihaho.ila@flex--nabihestefan.bounces.google.com>)
 id 1rDt3T-0005vQ-Lt
 for qemu-devel@nongnu.org; Thu, 14 Dec 2023 16:15:49 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-dbcec98047bso841850276.3
 for <qemu-devel@nongnu.org>; Thu, 14 Dec 2023 13:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702588533; x=1703193333; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=THE8NnuUb7NBph9vZ2fuGB8Sryx7pSkYnupUZ3ZaVIU=;
 b=OEUTK+LLyPvTJiPBVJbtu6eMGddgQIbsH3033Lgv9LBdkbYKWK4TEmsiCS526PiiPK
 hoawVXQl1ZRcOjuLtnVo+AtSSBwLNQ1ssYO92BTKoFaUkSoePR9mqhnIna1gC9fd+/EY
 D17ivPCrGcXjH/1I7xb/54Ww/p5n6h18jmt6CNvg1jblBC95aBGqxei5uPy/kz/Cx8vt
 0pdm22KlAvrupz1QsBtLbRLLNqMdllSM4VWc70MGGMQBoORo7pz7Xm4G6gRhumwJrSt8
 aPZpsW+yF9gfZ3Ydpu1nx4WYPkDylLoQsntM9sCAwIvsE417bsegO2eD3TR1rGwmw22X
 svlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702588533; x=1703193333;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=THE8NnuUb7NBph9vZ2fuGB8Sryx7pSkYnupUZ3ZaVIU=;
 b=CvIkZALN3aIQkvSMETGR04GKowgtO6ycuhLUwRc6wPCB7aNwrn7M5+2wEQQxX0uVdQ
 rHhJTuGgogThMj5EnpzwiGIPaFqRWFLhU/KAl/BP+X4+ZrbfilSa0kUgyPEOidc8zUL3
 1N6k7TowUT8RVtvIAy/PEUQBot7t7iPZzJCiWQo16wf2xiGc+OQp89V5rhbRxCFZlx7Y
 Nlc9wFNOw+SwwtDfvw3tqWG8Yf4x3IiEHNIAAs2qnPvlKk6MwmEyKjZkfgfCkxx52shM
 bAmnPTR1hwo5Rri8tEguIkeiEwTRxxPunV54GlnWAPnYtI96hFLbiBueQdouutxik7xc
 oLcw==
X-Gm-Message-State: AOJu0YyX3LIJUnLpu3VeFiNpTC4qp6Il6UjRwB4vPCo3hiav6CgXrDkS
 2Fi1U9Ap0nRsx5OJ3kl+2o2b4pT/o38araHL7dE=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a25:8a09:0:b0:db5:3676:74dd with SMTP
 id g9-20020a258a09000000b00db5367674ddmr115543ybl.3.1702588533590; Thu, 14
 Dec 2023 13:15:33 -0800 (PST)
Date: Thu, 14 Dec 2023 21:15:18 +0000
In-Reply-To: <20231214211527.1946302-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20231214211527.1946302-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231214211527.1946302-3-nabihestefan@google.com>
Subject: [PATCH v8 02/11] hw/arm: Add PCI mailbox module to Nuvoton SoC
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3dXB7ZQwKCnYhUVcbYmnYZUhaiiafY.WigkYgo-XYpYfhihaho.ila@flex--nabihestefan.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
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
X-TUID: iqLaTbYVQHwl

From: Hao Wu <wuhaotsh@google.com>

This patch wires the PCI mailbox module to Nuvoton SoC.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Nabih Estefan <nabihestefan@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
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
2.43.0.472.g3155946c3a-goog

