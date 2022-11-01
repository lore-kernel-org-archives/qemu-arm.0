Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp2040615ejc;
        Tue, 1 Nov 2022 10:13:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM69grP2de/V5d/NoLaQSh2SiALBbR+yc5PRqxluJz6Jq38Ry+/I6CmnosdlrhFehsI5+XGB
X-Received: by 2002:a05:6214:226b:b0:4bb:6500:8f44 with SMTP id gs11-20020a056214226b00b004bb65008f44mr16852559qvb.109.1667322790656;
        Tue, 01 Nov 2022 10:13:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667322790; cv=none;
        d=google.com; s=arc-20160816;
        b=f90D1CJFte2b36Lp2RUTf4mwsr6xon4/3T33Cz0AKW3/35hyK6vmgyAd921bh7JeFG
         VpLRJ08U1hC9tI/E9Ipd4KVQTVDCHXJz4ZfdJLM9aPGAq+0Wn00sxZUy0bNL/L7pY2rb
         v7JKI+DyEABRlgtOqDh+FASP5XjnXVcRuUHCpeQ3hy0GhWgDy3w3lRprakr1XAkAVkXk
         Qu6AWj2Y6D5W6MUuX4UhKK7FOW29/x/I012R8fw70e2jRfdjTjuyynd7qDriq60fAIA3
         +17okcTJQC+Xv74jX9ZEhiTDeGtKdd4AmTKnIw9w1ZpdUqzEKqiYAnOgaZP8JwlD3VrA
         fmOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rOjHWNXn/Wht1Shk+YGDnbsD8G3ScWO/Koc/z3Bsls4=;
        b=L6T7nt+HjiPTSPr/JJQz1BayzvZFvi0Q9cZtVrjchwyrDnykJdkZcPjWuqqZG91sFU
         xwRCLq8yBMfvfSHKNTZufhFQE4mQqKc7X23HxccInIaY1pGObkDODv4ymvnP5HgTsjIT
         sQgyMYUvPMDlGjJTH2JkS62ZQ0BcPZFJFDk1xWdQ3mjpKfKPmMDtWcC8nC4QVN1Lmjud
         bFJwmWvwauSHmmDE0BQO2xpGipWBJm77RtR94KBPFMbrpzsDrmKDa9YX7GNSrqICDccl
         hjL86/4ZdL1JmvhuOBLqc9CJ8qAsH0NZ7hPdKRzFIrEDm7Z8lvoAtnXT7vftImsU1sl5
         3v2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b="zXB/PpX/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12-20020a056214202c00b004b4786a4989si6685650qvf.164.2022.11.01.10.13.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Nov 2022 10:13:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b="zXB/PpX/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opshF-0006x4-5J; Tue, 01 Nov 2022 10:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opshB-0006wP-D2
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 10:56:54 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opshA-0003f7-1e
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 10:56:53 -0400
Received: by mail-pj1-x1035.google.com with SMTP id k5so5866805pjo.5
 for <qemu-arm@nongnu.org>; Tue, 01 Nov 2022 07:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rOjHWNXn/Wht1Shk+YGDnbsD8G3ScWO/Koc/z3Bsls4=;
 b=zXB/PpX/CcuMGL6gjhZkelOZ3Aq9HFs3fnEpfhJSvRwqYd7SonKZ/tD/XI+uc+ds9q
 eIKamgtn1xJoYgILOfFU5dHWAxhCteKgl8wNGrPtxT8Bh4igJBMniD5aBdIQ3CReC1+R
 KuCx0nzlKKLAKF4al1m7Ceg8cZnMRPd5gOTrmSsX4cN6VLAvgTMdBzu3YyrEj64VayTD
 y2Z+37iGbEdlbsg0e/5AzLlACS2Y8DwmnKpWZoTXYiotzmsGLETHM5UNPkruYOhpNVqw
 UEMR9F9vCRbFbKeTTe6IUrDyE4xJp8oNTf0oZ1w7KoCgVzJusAB1gRC+3p5a9cwU4sOG
 LzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rOjHWNXn/Wht1Shk+YGDnbsD8G3ScWO/Koc/z3Bsls4=;
 b=1pangofBdRMBwaJHLNtJUUO9SbOykP/jdkYX4fyG2XMR6QQ23MSK10WQ2Pz9xbHoHP
 xku7eyGzGOgyUD2fy5gNQyGn/7RtQoSlFcqOQQudtSxb0ZkOPVuGVntvNr1tsrGF2gbP
 c/K/ecsWv7/NQIN6us4u93za0wq78tbE5p/0WJjdT6N/krAH9E7iPQ6KLVJXDAi28ElJ
 qBaokcakWygOJT6XE+HjK/iAErUVBO3MC1ZlCmLtT208y5Yen8JE7+CRCEdks9ltGE5L
 +cpewDDksT5eMOxXb6rnJWvix1ijbWAe/3filZGfqTlSliyEXBiuT49sKMDS9WTzWNb5
 sPvw==
X-Gm-Message-State: ACrzQf3o56zhIfSBucnaBbyCYtd1y8Y8HZGYLS5zOvyKi4npzcCfgxGx
 sIDXQ+RUkKeq92fljSlkD519gQ==
X-Received: by 2002:a17:902:ea85:b0:187:1851:bb02 with SMTP id
 x5-20020a170902ea8500b001871851bb02mr13696296plb.57.1667314610966; 
 Tue, 01 Nov 2022 07:56:50 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 22-20020a631656000000b0046f9f4a2de6sm4783219pgw.74.2022.11.01.07.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 07:56:50 -0700 (PDT)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v9 08/17] msi: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 23:55:49 +0900
Message-Id: <20221101145558.3998-9-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101145558.3998-1-akihiko.odaki@daynix.com>
References: <20221101145558.3998-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1035.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PMwTzGt0dZbN

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. A caller of msi_init(), which calls
pci_add_capability() in turn, is expected to ensure that will not
happen.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci/msi.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index 058d1d1ef1..5283a08b5a 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -194,7 +194,6 @@ int msi_init(struct PCIDevice *dev, uint8_t offset,
     unsigned int vectors_order;
     uint16_t flags;
     uint8_t cap_size;
-    int config_offset;
 
     if (!msi_nonbroken) {
         error_setg(errp, "MSI is not supported by interrupt controller");
@@ -221,13 +220,7 @@ int msi_init(struct PCIDevice *dev, uint8_t offset,
     }
 
     cap_size = msi_cap_sizeof(flags);
-    config_offset = pci_add_capability(dev, PCI_CAP_ID_MSI, offset,
-                                        cap_size, errp);
-    if (config_offset < 0) {
-        return config_offset;
-    }
-
-    dev->msi_cap = config_offset;
+    dev->msi_cap = pci_add_capability(dev, PCI_CAP_ID_MSI, offset, cap_size);
     dev->cap_present |= QEMU_PCI_CAP_MSI;
 
     pci_set_word(dev->config + msi_flags_off(dev), flags);
-- 
2.38.1

