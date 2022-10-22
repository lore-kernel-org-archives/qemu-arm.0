Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1699668ejn;
        Fri, 21 Oct 2022 21:48:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM59tMBhA7vTTDmRzZwqYHbV13m79+6ucs2nFPlxc8rwf4gCTBjf+ekDX3NXOAXMYkGMTsKw
X-Received: by 2002:a05:622a:508:b0:39c:bddd:7509 with SMTP id l8-20020a05622a050800b0039cbddd7509mr18816808qtx.510.1666414097697;
        Fri, 21 Oct 2022 21:48:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666414097; cv=none;
        d=google.com; s=arc-20160816;
        b=iFYt6bDcNVvPIw9tZCKH/Y3LD2b4mRX7sE0hQRWFPAvvG1CGIIYVyi4wFRonXrM6yC
         1sX0yC0Y65boz55h6Hrg7VMFqszYFc82sehcDZTH8dvweckHW613wPjKupMkjYmfgzCc
         V+dUhwCtJAM2nMkn5itqHA5rxsQRPBiI6m+RmWKt/PHfuoD7d9ISJubPku4MozeQL7Aj
         IlpzCvSkQ2muTXBD4TEXK2Vw788yitpywAF1c2AsKrAnxdmo35xXVtOHhncwIPgy1cAA
         9hJxeeNiEHpfbtVauDyz4x4bH3oyAqdwffbjFQy3QJeAIlTqP+yQwUuMkzbe6rBOq3iS
         sv6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=P+vwGTfDGUfglEd+A+a9uNkSk8M5X1nPBLZPxAQj164=;
        b=BwWh6wHHifkCChNPdmA3H0VwPK255obicEZOan7cs84ri8XduK20nPKdt/lgG+PqpH
         SVvdRm7vZ1MhMquirZ1sf8n4XC6Q0poRH87JE6ACakN7vfiDCU80jS2vFpNBCT9LWbN+
         XizpRuubucwhpHtzfvzgkFQkYUFqKzfDK+bjjnpjVer45tbjHNxMMR0FuFgD2P+m35LE
         mQeMkFU2EYb0hmTEbcQ19G1iVrGdf2XOcGGdBmvJYagWmCcdO/s21z6PgS+UZ6HpVrX8
         /hNMTm2gpr/ngiFaoVqOvR5SQyx/+aP8JpMiZ8tBQ7PjCwYRYKdig8/p4UbFg1Or5si1
         D1nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=sUBdSnHR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kl20-20020a056214519400b004b3ee7de9e6si12952969qvb.521.2022.10.21.21.48.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Oct 2022 21:48:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=sUBdSnHR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1om6KF-0005OZ-Ir; Sat, 22 Oct 2022 00:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6KD-0005OI-Pn
 for qemu-arm@nongnu.org; Sat, 22 Oct 2022 00:41:33 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6KC-0003j8-9i
 for qemu-arm@nongnu.org; Sat, 22 Oct 2022 00:41:33 -0400
Received: by mail-pg1-x530.google.com with SMTP id b5so4255643pgb.6
 for <qemu-arm@nongnu.org>; Fri, 21 Oct 2022 21:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P+vwGTfDGUfglEd+A+a9uNkSk8M5X1nPBLZPxAQj164=;
 b=sUBdSnHRlDEeVwMhCgWYsNI0QvMLEqxkgU+pu8XY1BjW2yGdOwCcC5615ZqmYm6Nwv
 ktIoEaxpkE5YQddrKjM5DscTjlOhBYFDvORS3geweqmmT0fVR3j8ne4yltJVc9D2XgXB
 OYFq3PrRm/4+9J1n4S7dtsQ1194cODcu0QBxbhuha4oSuW4kAoVzQfLKqZepc2vbGlHN
 pbQeN9h/wHH4+bVItDNlKKP+QhLx1kgWDKb/9qM9VBMvww+1L/3pNO4d/1bgMKwAsNNX
 H5N0yVONLukLT5U6ic+Ojo9im2S8zXB+P2wBN4p+kt9ocasDzDtHeR3BwxuX0wYyvQmG
 KsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P+vwGTfDGUfglEd+A+a9uNkSk8M5X1nPBLZPxAQj164=;
 b=QvFihq0Wf+2A89vVJ/SnoMKxG0nl3BZrjCBNqoLgNcSLPwJK8kk9thjhUS6mDHbjZ+
 8RS1NBtV/Ba4RKMkby/+CdfeYfGigSPA5DmYwyGCTkyuSObKRfUlcVhgz45IpFvfJylP
 PvHoPkMBnUgmVLfhLj+3lU/9HpUkurzb9wH5gpiCAl7uCBDUwJ3wtjq3XBS/nkYb4lJR
 o/2Zgy0efQfVtqiL4Yopnw0tEkyQMYdOabxGw1YTFc308CT15v0hwGdf4UBsCsF9mWTk
 neEODJkvGkePcv1E5DJqHMpnSFeY09z7U0XcCbCuILV943RMzdfhTuK0OLMCXSDmVgOF
 jFyg==
X-Gm-Message-State: ACrzQf2jkvzN1p76aeJ7KPANWL0kEGbuD/TqBlekkVLefb2im9zR7Bws
 c7pf2BdvWnY7k/1zyMsAekWZzQ==
X-Received: by 2002:a63:5702:0:b0:44b:290:f24f with SMTP id
 l2-20020a635702000000b0044b0290f24fmr19105076pgb.558.1666413690163; 
 Fri, 21 Oct 2022 21:41:30 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b001868d4600b8sm178049pli.158.2022.10.21.21.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 21:41:29 -0700 (PDT)
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
Subject: [PATCH v2 04/17] e1000e: Omit errp for pci_add_capability
Date: Sat, 22 Oct 2022 13:40:40 +0900
Message-Id: <20221022044053.81650-5-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022044053.81650-1-akihiko.odaki@daynix.com>
References: <20221022044053.81650-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::530;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-TUID: XhVoaO8cFt40

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000e.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index ac96f7665a..e433b8f9a5 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -377,17 +377,10 @@ e1000e_gen_dsn(uint8_t *mac)
            (uint64_t)(mac[0])  << 56;
 }
 
-static int
+static void
 e1000e_add_pm_capability(PCIDevice *pdev, uint8_t offset, uint16_t pmc)
 {
-    Error *local_err = NULL;
-    int ret = pci_add_capability(pdev, PCI_CAP_ID_PM, offset,
-                                 PCI_PM_SIZEOF, &local_err);
-
-    if (local_err) {
-        error_report_err(local_err);
-        return ret;
-    }
+    pci_add_capability(pdev, PCI_CAP_ID_PM, offset, PCI_PM_SIZEOF);
 
     pci_set_word(pdev->config + offset + PCI_PM_PMC,
                  PCI_PM_CAP_VER_1_1 |
@@ -400,8 +393,6 @@ e1000e_add_pm_capability(PCIDevice *pdev, uint8_t offset, uint16_t pmc)
 
     pci_set_word(pdev->w1cmask + offset + PCI_PM_CTRL,
                  PCI_PM_CTRL_PME_STATUS);
-
-    return ret;
 }
 
 static void e1000e_write_config(PCIDevice *pci_dev, uint32_t address,
@@ -480,10 +471,7 @@ static void e1000e_pci_realize(PCIDevice *pci_dev, Error **errp)
         trace_e1000e_msi_init_fail(ret);
     }
 
-    if (e1000e_add_pm_capability(pci_dev, e1000e_pmrb_offset,
-                                  PCI_PM_CAP_DSI) < 0) {
-        hw_error("Failed to initialize PM capability");
-    }
+    e1000e_add_pm_capability(pci_dev, e1000e_pmrb_offset, PCI_PM_CAP_DSI);
 
     if (pcie_aer_init(pci_dev, PCI_ERR_VER, e1000e_aer_offset,
                       PCI_ERR_SIZEOF, NULL) < 0) {
-- 
2.37.3

