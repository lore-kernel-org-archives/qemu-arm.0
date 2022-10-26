Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp829769ejn;
        Wed, 26 Oct 2022 13:23:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7VgCY8qasFiEHFBED/mFNbYId9Lc5ptF+9cbdqjMA0TCvBdV1hqlEC4WmqgEOdjCLR3QJA
X-Received: by 2002:a05:620a:29cd:b0:6d2:c5d6:6fe0 with SMTP id s13-20020a05620a29cd00b006d2c5d66fe0mr33262579qkp.148.1666815804506;
        Wed, 26 Oct 2022 13:23:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666815804; cv=none;
        d=google.com; s=arc-20160816;
        b=uZjfagSR6KrLK/9mAQiSUPmTxvaPRL6iuQ1uqcNTaMoZrKuYkV7ow77Y43x5s1oKQN
         1/g1XqYQnqlSnHaimr8j8BOu+TDgpW7jkwo+7fsykVMZ/xTHJzXNT9i8+CErmGILjoH6
         rVkOaV1fbD42HA/1xqiO2rujRApEQxe6iNYqMHSsdkCDzI4GxDwsDZ0U8YZ02d0Mm4FK
         yCx1qiDibHOzqTepV5XrDONtj9IIpcrosKjPkgAHZGAkzbu2rTj86TpC5LGe11TWB2Uf
         +wTJOyd+oDI0S3ovbYNgPlA7sOdop/WRihguc96D4JCW+apfzq6miHNkKDdPFH4a49u9
         ymxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=T1V32ZG9tKSMT+jultHAIQTiINzO8gq1BfBocAzoeU4=;
        b=XokCGoog0W4fJQYI+hVB0Prj/lH8If7hWtNeVIvIf1Vov3Uf9OjTlDRnFCbLqeeSXu
         BNLjNVwlHgAAUGV7AhFNtxTkYAylgroBGeVnTqpWDcWokJ1o1OFc5zbt9jxij4O16mL2
         aJh/LxJ645Y90uQ2SkKU+MVvqBjGRCgIhAU2VLAc3lV4hAUyfwiXcMKGj6s92RxzylN3
         KEmMEXpCw23yfUOBX3z0C+eMaLKgoC3tcIEitC0EL5yNx49/GiGIfE91hoxWr1CE0NF/
         Tk+SqTuT47wAJS23Ly7lhaKdyoLCMbFf+nvJp2kvspV0JRaIAcMzPPR5/xtXNCaK8vpf
         w7eA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=uBZBwW7m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gc14-20020a05622a59ce00b0038e85fb6757si3391821qtb.25.2022.10.26.13.23.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Oct 2022 13:23:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=uBZBwW7m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onmpw-00029k-3w; Wed, 26 Oct 2022 16:17:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmok-0001Ru-Ok
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:16:09 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmoe-00035F-VJ
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:15:58 -0400
Received: by mail-pg1-x536.google.com with SMTP id e129so16026914pgc.9
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 13:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T1V32ZG9tKSMT+jultHAIQTiINzO8gq1BfBocAzoeU4=;
 b=uBZBwW7mjG+fGRI1VuaabJzvkrw+UCgPEzyyz0e7c6Q95YPuX5maaiLgod84GaO23/
 6uQWmyU2Iln6xbOGEQTgKAXPaYPjixmgELAOyCCToFnyvTQe2hrqdjSqSyy3s0MXq4/q
 hOoYqR8r2asFA5DM4LQ3ONsRERy9LM88Fgme9cAaXkYfZw+e5jsBMcDr5cMwAf0CCoBa
 cNa3euOfM8jYsUPk75XxvEWwv+Lyd+TEv4JgXdizZS/RaX7FjE6AVViQqYLxZm6JpUiT
 mTy3sv2ZF7euEyWJQl8weCjTEXmw+YDcM4mhxvtZv2Wx/V/yZ6JVOe8bi4PAOfQjS7Ps
 /z8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T1V32ZG9tKSMT+jultHAIQTiINzO8gq1BfBocAzoeU4=;
 b=eJhYyWzpYTfxcRofLxlI+aisvJRbE6yECCDUWlqyDInaMygZ5hW5FM254m2mE+DDa+
 qo9G4jlU1jVWj3yDmy1vPNy1KJm/CXgSU2rY0dcFsVPEAmQGar8yphnnR9vuS2yUykmQ
 yOPfrGKqdxWtUD2Jftp7HcGa8Rg1PruEP7y0gWoRJCVgTW0sDy+whTBU7oJCi4ozN8HI
 zSSsOK8C+a2+q1IoswkD2T2+AK0dqXhWwJ+wf28sFGzvMezqpudBdcDqDjXkr6IC9Upf
 PMswEPKjwyvFEQ6ZlNDpLl8fN8eOhS++cg4HUGtjwRK11c/fWoPllaR7lUy/rmKNWjcD
 Fixw==
X-Gm-Message-State: ACrzQf0/Vq10I+G4EMQFRj8k8mTQgl3ZipbF5sns8eGMiYy8Z7o2RTNY
 bYNGxchCiYq/+udco6ERloKYQQ==
X-Received: by 2002:a63:6b09:0:b0:453:b1f8:bb3b with SMTP id
 g9-20020a636b09000000b00453b1f8bb3bmr40340965pgc.36.1666815355811; 
 Wed, 26 Oct 2022 13:15:55 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa78f25000000b00541c68a0689sm3375770pfr.7.2022.10.26.13.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:15:55 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 03/16] ahci: Omit errp for pci_add_capability
Date: Thu, 27 Oct 2022 05:15:14 +0900
Message-Id: <20221026201527.24063-4-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026201527.24063-1-akihiko.odaki@daynix.com>
References: <20221026201527.24063-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::536;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: z2tztVPQG0HV

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. This behavior is appropriate heare because all of
the capabilities set in this device are defined in the program and
their overlap should not happen unless there is a programming error.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/ide/ich.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/ide/ich.c b/hw/ide/ich.c
index 1007a51fcb..3b478b01f8 100644
--- a/hw/ide/ich.c
+++ b/hw/ide/ich.c
@@ -106,7 +106,7 @@ static void pci_ich9_ahci_init(Object *obj)
 static void pci_ich9_ahci_realize(PCIDevice *dev, Error **errp)
 {
     struct AHCIPCIState *d;
-    int sata_cap_offset;
+    uint8_t sata_cap_offset;
     uint8_t *sata_cap;
     d = ICH9_AHCI(dev);
     int ret;
@@ -130,11 +130,7 @@ static void pci_ich9_ahci_realize(PCIDevice *dev, Error **errp)
                      &d->ahci.mem);
 
     sata_cap_offset = pci_add_capability(dev, PCI_CAP_ID_SATA,
-                                          ICH9_SATA_CAP_OFFSET, SATA_CAP_SIZE,
-                                          errp);
-    if (sata_cap_offset < 0) {
-        return;
-    }
+                                          ICH9_SATA_CAP_OFFSET, SATA_CAP_SIZE);
 
     sata_cap = dev->config + sata_cap_offset;
     pci_set_word(sata_cap + SATA_CAP_REV, 0x10);
-- 
2.37.3

