Received: by 2002:a17:906:70a:b0:9d0:bf65:29fa with SMTP id y10csp112939ejb;
        Tue, 31 Oct 2023 01:07:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHrqDf0MJvIMWLjzztJjI/XMpgVXOtxE58erUb68xXN0+rojL97ITfo2JmhmopaKkJes/Y
X-Received: by 2002:a05:620a:4109:b0:778:a8b3:6cb7 with SMTP id j9-20020a05620a410900b00778a8b36cb7mr12941247qko.9.1698739631140;
        Tue, 31 Oct 2023 01:07:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698739631; cv=none;
        d=google.com; s=arc-20160816;
        b=VyyGBun/U2fLPoeY5rXIt+KYi6+A/KyKCPguzFIMicmS0i4Hi2lH6q+QfTyZhMGNk1
         GIQhxwuGDdGEL9qJhWw0hJ8cRdItmTrb/9kyQmztoib9x17KNNgSSX+13t4f6T9fCkfP
         IFazMOHaFWPrsLnUfVc4JR7gFoqLpiq6Ac+87/04zRsATuWgagQ2imyEeeHBFL5+pKcN
         YCkFMsUdRfYjILtyJM9Ta0atytwIjQRLwYtOKmsC9L7tQK9mtMACKG38Bb4z2x8hvkvD
         1XA6YYNOmaLlaY7PsnZk1ytCw6w9SVV8QBs4XxPf4yuCH99jcyU2m+Hta5+GrtFBhaJb
         bmCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ha8dKFtw42TsNomh687LpbxdL60bRbWiCDY5i3DR55Y=;
        fh=1JHJ2VXNDcNFvwcekHCS10Diyb0sI1dcCk8Jb4gpIP4=;
        b=aAhwR8OarBqX6NaShBErAkX+O2P6OuH+kMS4s97CdLKgh2ynlasdmMbyNTRNR4DTb2
         tz2cWC+syhSvKUWRSkVmgnVgRRJ+jgIRuoZtz9WF3KT+LMWXyTtee0dSpXsC3pFQUg4v
         DMluBfFzXhAitzuOS1eEZJRhF04cQGlNg5uLQ+C2rohAKWaepUWbSY96YObfdbJT5SW5
         wdBltC+vjHrr553l79KiFti0yNmjq0yuPxnhBtIAAvhvNC6WkJh2gUgazM57DgGb5Rh1
         q2XSyWbtn8W/E4PfM8pp7xLd6NwM+vgHy9uzOkgf4HG127bn5Nf+mUFhdh23W2nYMJE6
         4Wew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uhyS39og;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h7-20020a05620a284700b007786a540453si629376qkp.568.2023.10.31.01.07.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Oct 2023 01:07:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uhyS39og;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qxjla-0008KN-IY; Tue, 31 Oct 2023 04:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxjlU-0008Iq-8c
 for qemu-devel@nongnu.org; Tue, 31 Oct 2023 04:06:22 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxjlQ-00052V-F9
 for qemu-devel@nongnu.org; Tue, 31 Oct 2023 04:06:20 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-53e07db272cso8457199a12.3
 for <qemu-devel@nongnu.org>; Tue, 31 Oct 2023 01:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698739574; x=1699344374; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ha8dKFtw42TsNomh687LpbxdL60bRbWiCDY5i3DR55Y=;
 b=uhyS39ogcwAeIpSsEpOHuF8uYoCh/+TOzyVjItp9u3LDOmdK2DmMMImvQob8v1SVIT
 KwJJXPK5PSs2ZtfyXWlkCJHYe+8/nIZwGAfpbqf55wE0kksBwi5WJQcN7WmKE6znXi/y
 H0Tp7uRP9udvqaJMpN7wwDzPac3O41NnDtB3k5M8fD6XBu4qwaRodUhm21Yn5ydu55Ax
 v2yzvM6okeUod8Tl4gZ3vLKJU8Y6lRHdlRAOPNhvTRLRJREGoMp/fkW9a8i5U+xfzilM
 wFfOZFal/UCESE80MMK+xGZMD9ua86bBly92IJeI2vIzyFolVMQoZe+7rBCRTlU0QP6y
 dbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698739574; x=1699344374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ha8dKFtw42TsNomh687LpbxdL60bRbWiCDY5i3DR55Y=;
 b=uvNJiyh6LHdO4vWue0Gyi0ikkdXDBnexH4El2pX30SXWJg1PDuBfudUg2xxxhYj/D/
 TARdwW1OHd2+QaRW1gI16UQ5Hv2SA9T7YYXXd+GoiDzCedU+b29zXkGtQo6dDTo1bvWu
 f3g+I5YvMszQJw9UkAYgLB0gSd9yKXQLPkoLToQggufRscY5bP+oG6zX2xocFDH50/TW
 cqoU/AFWNe4pJN6/1uWIF++B1A8TKjSy0USgSgFHYaF1WsmQE3E17RyvBKKalEF+VPgi
 YGu/qLb1VGyHXZFt5LIk2D6m9H51wo1CAoY3cnJraXn9fmSqkbOxSVvPPeUmzC/7Fume
 tTXA==
X-Gm-Message-State: AOJu0YyCdRq0UnSDIkiJ/vxR3FpQtSmPUvhOiCVyGG6PKixUzpALjfQa
 9nos0JdbJi6iXb/njvuPigkIMgiPtTRCdbon2xE=
X-Received: by 2002:a17:906:55c5:b0:9d2:b968:9ddf with SMTP id
 z5-20020a17090655c500b009d2b9689ddfmr4383293ejp.25.1698739574192; 
 Tue, 31 Oct 2023 01:06:14 -0700 (PDT)
Received: from m1x-phil.lan (gjh33-h01-176-171-208-14.dsl.sta.abo.bbox.fr.
 [176.171.208.14]) by smtp.gmail.com with ESMTPSA id
 3-20020a05600c234300b0040586360a36sm995126wmq.17.2023.10.31.01.06.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 31 Oct 2023 01:06:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Bin Meng <bin.meng@windriver.com>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, qemu-block@nongnu.org
Subject: [PATCH 1/1] hw/sd: Declare CPU QOM types using DEFINE_TYPES() macro
Date: Tue, 31 Oct 2023 09:06:03 +0100
Message-ID: <20231031080603.86889-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231031080603.86889-1-philmd@linaro.org>
References: <20231031080603.86889-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: C+//T+FI/I0m

When multiple QOM types are registered in the same file,
it is simpler to use the the DEFINE_TYPES() macro. In
particular because type array declared with such macro
are easier to review.

Mechanical transformation using the following comby script:

  [pattern-x1]
  match='''
  static const TypeInfo :[i1~.*_info] = {
      :[body]
  };
  static void :[rt1~.*_register_type.](void)
  {
      type_register_static(&:[i2~.*_info]);
  }
  type_init(:[rt2~.*_register_type.])
  '''
  rewrite='''
  static const TypeInfo :[i1][] = {
      {
      :[body]
      },
  };

  DEFINE_TYPES(:[i1])
  '''
  rule='where :[i1] == :[i2], :[rt1] == :[rt2]'

  [pattern-x2]
  match='''
  static const TypeInfo :[i1a~.*_info] = {
      :[body1]
  };
  ...
  static const TypeInfo :[i2a~.*_info] = {
      :[body2]
  };
  static void :[rt1~.*_register_type.](void)
  {
      type_register_static(&:[i1b~.*_info]);
      type_register_static(&:[i2b~.*_info]);
  }
  type_init(:[rt2~.*_register_type.])
  '''
  rewrite='''
  static const TypeInfo :[i1a][] = {
      {
      :[body1]
      },
      {
      :[body2]
      },
  };

  DEFINE_TYPES(:[i1a])
  '''
  rule='''
  where
  :[i1a] == :[i1b],
  :[i2a] == :[i2b],
  :[rt1] == :[rt2]
  '''

and re-indented manually.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/aspeed_sdhci.c   | 19 ++++++++-----------
 hw/sd/bcm2835_sdhost.c | 33 ++++++++++++++-------------------
 hw/sd/cadence_sdhci.c  | 21 +++++++++------------
 hw/sd/core.c           | 19 ++++++++-----------
 hw/sd/npcm7xx_sdhci.c  | 21 +++++++++------------
 hw/sd/pl181.c          | 35 +++++++++++++++--------------------
 hw/sd/pxa2xx_mmci.c    | 35 +++++++++++++++--------------------
 hw/sd/sd.c             | 37 ++++++++++++++++---------------------
 hw/sd/sdhci-pci.c      | 25 +++++++++++--------------
 hw/sd/ssi-sd.c         | 19 ++++++++-----------
 10 files changed, 113 insertions(+), 151 deletions(-)

diff --git a/hw/sd/aspeed_sdhci.c b/hw/sd/aspeed_sdhci.c
index be8cafd65f..e53206d959 100644
--- a/hw/sd/aspeed_sdhci.c
+++ b/hw/sd/aspeed_sdhci.c
@@ -198,16 +198,13 @@ static void aspeed_sdhci_class_init(ObjectClass *classp, void *data)
     device_class_set_props(dc, aspeed_sdhci_properties);
 }
 
-static const TypeInfo aspeed_sdhci_info = {
-    .name          = TYPE_ASPEED_SDHCI,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(AspeedSDHCIState),
-    .class_init    = aspeed_sdhci_class_init,
+static const TypeInfo aspeed_sdhci_types[] = {
+    {
+        .name           = TYPE_ASPEED_SDHCI,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(AspeedSDHCIState),
+        .class_init     = aspeed_sdhci_class_init,
+    },
 };
 
-static void aspeed_sdhci_register_types(void)
-{
-    type_register_static(&aspeed_sdhci_info);
-}
-
-type_init(aspeed_sdhci_register_types)
+DEFINE_TYPES(aspeed_sdhci_types)
diff --git a/hw/sd/bcm2835_sdhost.c b/hw/sd/bcm2835_sdhost.c
index 9431c35914..a600cf39e2 100644
--- a/hw/sd/bcm2835_sdhost.c
+++ b/hw/sd/bcm2835_sdhost.c
@@ -436,24 +436,19 @@ static void bcm2835_sdhost_class_init(ObjectClass *klass, void *data)
     dc->vmsd = &vmstate_bcm2835_sdhost;
 }
 
-static const TypeInfo bcm2835_sdhost_info = {
-    .name          = TYPE_BCM2835_SDHOST,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(BCM2835SDHostState),
-    .class_init    = bcm2835_sdhost_class_init,
-    .instance_init = bcm2835_sdhost_init,
+static const TypeInfo bcm2835_sdhost_types[] = {
+    {
+        .name           = TYPE_BCM2835_SDHOST,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(BCM2835SDHostState),
+        .class_init     = bcm2835_sdhost_class_init,
+        .instance_init  = bcm2835_sdhost_init,
+    },
+    {
+        .name           = TYPE_BCM2835_SDHOST_BUS,
+        .parent         = TYPE_SD_BUS,
+        .instance_size  = sizeof(SDBus),
+    },
 };
 
-static const TypeInfo bcm2835_sdhost_bus_info = {
-    .name = TYPE_BCM2835_SDHOST_BUS,
-    .parent = TYPE_SD_BUS,
-    .instance_size = sizeof(SDBus),
-};
-
-static void bcm2835_sdhost_register_types(void)
-{
-    type_register_static(&bcm2835_sdhost_info);
-    type_register_static(&bcm2835_sdhost_bus_info);
-}
-
-type_init(bcm2835_sdhost_register_types)
+DEFINE_TYPES(bcm2835_sdhost_types)
diff --git a/hw/sd/cadence_sdhci.c b/hw/sd/cadence_sdhci.c
index 75db34befe..ef4e0d74e3 100644
--- a/hw/sd/cadence_sdhci.c
+++ b/hw/sd/cadence_sdhci.c
@@ -175,17 +175,14 @@ static void cadence_sdhci_class_init(ObjectClass *classp, void *data)
     dc->vmsd = &vmstate_cadence_sdhci;
 }
 
-static const TypeInfo cadence_sdhci_info = {
-    .name          = TYPE_CADENCE_SDHCI,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(CadenceSDHCIState),
-    .instance_init = cadence_sdhci_instance_init,
-    .class_init    = cadence_sdhci_class_init,
+static const TypeInfo cadence_sdhci_types[] = {
+    {
+        .name           = TYPE_CADENCE_SDHCI,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(CadenceSDHCIState),
+        .instance_init  = cadence_sdhci_instance_init,
+        .class_init     = cadence_sdhci_class_init,
+    },
 };
 
-static void cadence_sdhci_register_types(void)
-{
-    type_register_static(&cadence_sdhci_info);
-}
-
-type_init(cadence_sdhci_register_types)
+DEFINE_TYPES(cadence_sdhci_types)
diff --git a/hw/sd/core.c b/hw/sd/core.c
index 30ee62c510..52d5d90045 100644
--- a/hw/sd/core.c
+++ b/hw/sd/core.c
@@ -259,16 +259,13 @@ void sdbus_reparent_card(SDBus *from, SDBus *to)
     sdbus_set_readonly(to, readonly);
 }
 
-static const TypeInfo sd_bus_info = {
-    .name = TYPE_SD_BUS,
-    .parent = TYPE_BUS,
-    .instance_size = sizeof(SDBus),
-    .class_size = sizeof(SDBusClass),
+static const TypeInfo sd_bus_types[] = {
+    {
+        .name           = TYPE_SD_BUS,
+        .parent         = TYPE_BUS,
+        .instance_size  = sizeof(SDBus),
+        .class_size     = sizeof(SDBusClass),
+    },
 };
 
-static void sd_bus_register_types(void)
-{
-    type_register_static(&sd_bus_info);
-}
-
-type_init(sd_bus_register_types)
+DEFINE_TYPES(sd_bus_types)
diff --git a/hw/sd/npcm7xx_sdhci.c b/hw/sd/npcm7xx_sdhci.c
index b2f5b4a542..9958680090 100644
--- a/hw/sd/npcm7xx_sdhci.c
+++ b/hw/sd/npcm7xx_sdhci.c
@@ -166,17 +166,14 @@ static void npcm7xx_sdhci_instance_init(Object *obj)
                             TYPE_SYSBUS_SDHCI);
 }
 
-static const TypeInfo npcm7xx_sdhci_info = {
-    .name = TYPE_NPCM7XX_SDHCI,
-    .parent = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(NPCM7xxSDHCIState),
-    .instance_init = npcm7xx_sdhci_instance_init,
-    .class_init = npcm7xx_sdhci_class_init,
+static const TypeInfo npcm7xx_sdhci_types[] = {
+    {
+        .name           = TYPE_NPCM7XX_SDHCI,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(NPCM7xxSDHCIState),
+        .instance_init  = npcm7xx_sdhci_instance_init,
+        .class_init     = npcm7xx_sdhci_class_init,
+    },
 };
 
-static void npcm7xx_sdhci_register_types(void)
-{
-    type_register_static(&npcm7xx_sdhci_info);
-}
-
-type_init(npcm7xx_sdhci_register_types)
+DEFINE_TYPES(npcm7xx_sdhci_types)
diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index 5e554bd467..2b33814d83 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -519,14 +519,6 @@ static void pl181_class_init(ObjectClass *klass, void *data)
     k->user_creatable = false;
 }
 
-static const TypeInfo pl181_info = {
-    .name          = TYPE_PL181,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(PL181State),
-    .instance_init = pl181_init,
-    .class_init    = pl181_class_init,
-};
-
 static void pl181_bus_class_init(ObjectClass *klass, void *data)
 {
     SDBusClass *sbc = SD_BUS_CLASS(klass);
@@ -535,17 +527,20 @@ static void pl181_bus_class_init(ObjectClass *klass, void *data)
     sbc->set_readonly = pl181_set_readonly;
 }
 
-static const TypeInfo pl181_bus_info = {
-    .name = TYPE_PL181_BUS,
-    .parent = TYPE_SD_BUS,
-    .instance_size = sizeof(SDBus),
-    .class_init = pl181_bus_class_init,
+static const TypeInfo pl181_info[] = {
+    {
+        .name           = TYPE_PL181,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(PL181State),
+        .instance_init  = pl181_init,
+        .class_init     = pl181_class_init,
+    },
+    {
+        .name           = TYPE_PL181_BUS,
+        .parent         = TYPE_SD_BUS,
+        .instance_size  = sizeof(SDBus),
+        .class_init     = pl181_bus_class_init,
+    },
 };
 
-static void pl181_register_types(void)
-{
-    type_register_static(&pl181_info);
-    type_register_static(&pl181_bus_info);
-}
-
-type_init(pl181_register_types)
+DEFINE_TYPES(pl181_info)
diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index 124fbf8bbd..d785a3d80f 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -580,25 +580,20 @@ static void pxa2xx_mmci_bus_class_init(ObjectClass *klass, void *data)
     sbc->set_readonly = pxa2xx_mmci_set_readonly;
 }
 
-static const TypeInfo pxa2xx_mmci_info = {
-    .name = TYPE_PXA2XX_MMCI,
-    .parent = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(PXA2xxMMCIState),
-    .instance_init = pxa2xx_mmci_instance_init,
-    .class_init = pxa2xx_mmci_class_init,
+static const TypeInfo pxa2xx_mmci_types[] = {
+    {
+        .name           = TYPE_PXA2XX_MMCI,
+        .parent         = TYPE_SYS_BUS_DEVICE,
+        .instance_size  = sizeof(PXA2xxMMCIState),
+        .instance_init  = pxa2xx_mmci_instance_init,
+        .class_init     = pxa2xx_mmci_class_init,
+    },
+    {
+        .name           = TYPE_PXA2XX_MMCI_BUS,
+        .parent         = TYPE_SD_BUS,
+        .instance_size  = sizeof(SDBus),
+        .class_init     = pxa2xx_mmci_bus_class_init,
+    },
 };
 
-static const TypeInfo pxa2xx_mmci_bus_info = {
-    .name = TYPE_PXA2XX_MMCI_BUS,
-    .parent = TYPE_SD_BUS,
-    .instance_size = sizeof(SDBus),
-    .class_init = pxa2xx_mmci_bus_class_init,
-};
-
-static void pxa2xx_mmci_register_types(void)
-{
-    type_register_static(&pxa2xx_mmci_info);
-    type_register_static(&pxa2xx_mmci_bus_info);
-}
-
-type_init(pxa2xx_mmci_register_types)
+DEFINE_TYPES(pxa2xx_mmci_types)
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 4823befdef..1106ff7d78 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -2278,16 +2278,6 @@ static void sd_class_init(ObjectClass *klass, void *data)
     sc->proto = &sd_proto_sd;
 }
 
-static const TypeInfo sd_info = {
-    .name = TYPE_SD_CARD,
-    .parent = TYPE_DEVICE,
-    .instance_size = sizeof(SDState),
-    .class_size = sizeof(SDCardClass),
-    .class_init = sd_class_init,
-    .instance_init = sd_instance_init,
-    .instance_finalize = sd_instance_finalize,
-};
-
 /*
  * We do not model the chip select pin, so allow the board to select
  * whether card should be in SSI or MMC/SD mode.  It is also up to the
@@ -2303,16 +2293,21 @@ static void sd_spi_class_init(ObjectClass *klass, void *data)
     sc->proto = &sd_proto_spi;
 }
 
-static const TypeInfo sd_spi_info = {
-    .name = TYPE_SD_CARD_SPI,
-    .parent = TYPE_SD_CARD,
-    .class_init = sd_spi_class_init,
+static const TypeInfo sd_types[] = {
+    {
+        .name           = TYPE_SD_CARD,
+        .parent         = TYPE_DEVICE,
+        .instance_size  = sizeof(SDState),
+        .class_size     = sizeof(SDCardClass),
+        .class_init     = sd_class_init,
+        .instance_init  = sd_instance_init,
+        .instance_finalize = sd_instance_finalize,
+    },
+    {
+        .name           = TYPE_SD_CARD_SPI,
+        .parent         = TYPE_SD_CARD,
+        .class_init     = sd_spi_class_init,
+    },
 };
 
-static void sd_register_types(void)
-{
-    type_register_static(&sd_info);
-    type_register_static(&sd_spi_info);
-}
-
-type_init(sd_register_types)
+DEFINE_TYPES(sd_types)
diff --git a/hw/sd/sdhci-pci.c b/hw/sd/sdhci-pci.c
index c737c8b930..9b7bee8b3f 100644
--- a/hw/sd/sdhci-pci.c
+++ b/hw/sd/sdhci-pci.c
@@ -68,20 +68,17 @@ static void sdhci_pci_class_init(ObjectClass *klass, void *data)
     sdhci_common_class_init(klass, data);
 }
 
-static const TypeInfo sdhci_pci_info = {
-    .name = TYPE_PCI_SDHCI,
-    .parent = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(SDHCIState),
-    .class_init = sdhci_pci_class_init,
-    .interfaces = (InterfaceInfo[]) {
-        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-        { },
+static const TypeInfo sdhci_pci_types[] = {
+    {
+        .name           = TYPE_PCI_SDHCI,
+        .parent         = TYPE_PCI_DEVICE,
+        .instance_size  = sizeof(SDHCIState),
+        .class_init     = sdhci_pci_class_init,
+        .interfaces     = (InterfaceInfo[]) {
+            { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+            { },
+        },
     },
 };
 
-static void sdhci_pci_register_type(void)
-{
-    type_register_static(&sdhci_pci_info);
-}
-
-type_init(sdhci_pci_register_type)
+DEFINE_TYPES(sdhci_pci_types)
diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index 167c03b780..a6cc1ad6c8 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -403,16 +403,13 @@ static void ssi_sd_class_init(ObjectClass *klass, void *data)
     dc->user_creatable = false;
 }
 
-static const TypeInfo ssi_sd_info = {
-    .name          = TYPE_SSI_SD,
-    .parent        = TYPE_SSI_PERIPHERAL,
-    .instance_size = sizeof(ssi_sd_state),
-    .class_init    = ssi_sd_class_init,
+static const TypeInfo ssi_sd_types[] = {
+    {
+        .name           = TYPE_SSI_SD,
+        .parent         = TYPE_SSI_PERIPHERAL,
+        .instance_size  = sizeof(ssi_sd_state),
+        .class_init     = ssi_sd_class_init,
+    },
 };
 
-static void ssi_sd_register_types(void)
-{
-    type_register_static(&ssi_sd_info);
-}
-
-type_init(ssi_sd_register_types)
+DEFINE_TYPES(ssi_sd_types)
-- 
2.41.0

