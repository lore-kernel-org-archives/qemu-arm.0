Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp930214ejc;
        Mon, 31 Oct 2022 05:35:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7CovULx3gRjq9cyDy5PuKKqzUAKrIimAazeGfVGmAnURKyZ6vjTqkQwUGuUM32LqN0s2Oj
X-Received: by 2002:a37:8dc6:0:b0:6cf:33cd:2c4f with SMTP id p189-20020a378dc6000000b006cf33cd2c4fmr8753125qkd.372.1667219704119;
        Mon, 31 Oct 2022 05:35:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667219704; cv=none;
        d=google.com; s=arc-20160816;
        b=Kc/FwXKoNwGBrsekw8VoKruwzgIcIq/MD4x8Zo2Eu0BqWUPwG1NNE8DOBVF7FiCIFv
         NQSszPukJaZYrSJj7NHN3poav9/mW3rik0zMD+jjlhZocaQAC9xvB6sR+weBMSft8tvh
         uwu5fnYWX4vfrrOeCy3o0lkEaGFVTKWbmoetaji6wcMrP58wEtA9mt4GDOPrMAtslYhP
         ktsLsuZIra743n5IoNcdVW+FjOuwTUL5xo3BZgivAzTyCFBPlACCsaLrqZq7HiQECKmJ
         /ttYQ+yWkvrCEjTJaM0PwIaLfmHsBmRNvywX/CEwpjdRRIPFyRiT0YAgzWyUr2Bhyvs5
         tXGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jJjPRo2jnYNBTT+kAOkS5uMVCK0dMEO9iW4TvwZKw3A=;
        b=e3Ok9nI0t+D7cGxNoTIXOD5asrQ6vJmN2sCzh4OBbTZS/RDgl1Zkcz3QaCMbe3QGXx
         rx1nuGALq6p/FJjUygyxVN5l5m0y1q8tdj2LPUDWonfer4j1ugjnVj4k9lODil+jv6+2
         v0xuitpeOP8oUbj9m1ZpQa0Ioo5eJRornLmCf+c4y1u7iUlYBMSBqk7km+APus+nCMuQ
         Dgmxr39tGlIDdkLMjttefM1PESiv4cxClQMXQU4pbvIlsYN4mk1Q4hx+aP9D6uho6zR8
         hK+dS7Nd+RvRH2lLI3zsCmsRAf7Rmdxavk6fno+Z1FYIH8hXXtvCMh59q93uXjY07Y3p
         WiZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=gD0CUWN4;
       spf=pass (google.com: domain of qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id js6-20020a0562142aa600b004b3f40d26e2si3555050qvb.288.2022.10.31.05.35.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 05:35:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=gD0CUWN4;
       spf=pass (google.com: domain of qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opU0G-0004cT-V5; Mon, 31 Oct 2022 08:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opTzL-0003F6-Eh
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 08:33:59 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opTzE-0004LI-Jf
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 08:33:55 -0400
Received: by mail-pl1-x629.google.com with SMTP id v17so7584735plo.1
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 05:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jJjPRo2jnYNBTT+kAOkS5uMVCK0dMEO9iW4TvwZKw3A=;
 b=gD0CUWN4xTz0cfQginNv+aIFbilCQNOJiya9FtDe+LgFS7c6pVTroUY1/N13zKTBVi
 7g9ICIMoq/5taXJuiCfh0ocY+zZo60PfCJMkd2ByoUELtlhYtTDuqN/O1rzW9N/L6Abi
 L0JiLYhaD437X5BaoaVOyIg2QmujrTTXzt8NEryS1tvUlK55l6ASCXJ1qBzSC/U4YtML
 71SqqNZJfJmMExOFWqxXWGVDeDqM325MBiAkgK/XWs7tQ7V/FK3/+hfdFSUNfOI+xZ/b
 mMxVq8+fBBltrc7d+cvaw3clmrTDOQBDX/Dq475r931M2Fnzle8mtMokGowzOQ7Ld2BC
 mW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jJjPRo2jnYNBTT+kAOkS5uMVCK0dMEO9iW4TvwZKw3A=;
 b=gIYtlxRLxjdgSlW1BNqnym1o4SAX93nzKq/8XKr67aW+zEhlcqrgTeDgaIELRTywAN
 l+s1v0nAyQeWwg485QcfPlaLRQU8YQuJIlD8X8l1AEEabbVuAXvtK9o9uD6cHr51cPGI
 pQU5xjzc5suCwklL7in5ZOMWYUNbiaqgYMLmI8z05+Epx6FEedBByzq7/ByYizrK+unn
 1WdJEUfYV4AXew8+XiSAkmEJGunnNx1RnfH18dyZ24Rz7l+zVeKmHFO9khOXgtRtap63
 kj9myTstmZLHQlkexWAKT/FcSCvZX1jNj9WZEkQfqzqNlTbsUyANZlOdEjEZItvkzPFg
 QnXg==
X-Gm-Message-State: ACrzQf1/AymMPq2kpw0256xym8LFGnhAJMRxkmhWk96QuXzQSua/hCRm
 1WRlPiZnN2B3SNSIIifYAn3c+lzYezu3ctFi
X-Received: by 2002:a17:902:da92:b0:187:25ae:16ad with SMTP id
 j18-20020a170902da9200b0018725ae16admr3504030plx.20.1667219629011; 
 Mon, 31 Oct 2022 05:33:49 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a6545ca000000b0042b5095b7b4sm4093810pgr.5.2022.10.31.05.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:33:48 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
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
Subject: [PATCH v6 04/17] ahci: Omit errp for pci_add_capability
Date: Mon, 31 Oct 2022 21:33:06 +0900
Message-Id: <20221031123319.21532-5-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221031123319.21532-1-akihiko.odaki@daynix.com>
References: <20221031123319.21532-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: +r4afuB6Xggz

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. This behavior is appropriate here because all of
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
2.38.1

