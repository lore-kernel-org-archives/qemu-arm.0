Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp2031700ejc;
        Tue, 1 Nov 2022 10:03:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM71HUmqGjkUoly5TmaSyfwZ5BDudvQSdpkHh1wOZN0FVT27TUMLzkPiILgynj34L03UdvpI
X-Received: by 2002:a0c:8e89:0:b0:4bb:62a2:b3cb with SMTP id x9-20020a0c8e89000000b004bb62a2b3cbmr16887662qvb.58.1667322187471;
        Tue, 01 Nov 2022 10:03:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667322187; cv=none;
        d=google.com; s=arc-20160816;
        b=Op7Ocjp2hX2NKqO/yklJwM5nfxqwkFYJQRJd01FYCqm/N3Ov80dFHNU7UBWdTLlNJl
         PYUR7daZQJfDjQsT+V/YNiz2kvkvI8AWmTeQoaaDfV7ad9PafCXWyNqTxqWz0cEXLARD
         Ou14f9NTRzcADBdDZ7/+b4YBanH/+6xItTejao8itNINipLZKf8XTIpn74atgOVEvvI1
         ZP/whdF/dJ0xO4btfbZov2JVCxIA1FWgYMxkLIBsiYPH+bCKfbta8KRw/46EUEgF+SIb
         3M7JGiNt+EFzhTVPcrli0B1ay5n7602291j24uKZBicXS3UUcyirVTxRfG8PoFPUcaDq
         wMDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LeDajy+wDOnHrF4VJbDnI9K6oGioqFYjvnSTZ44MAKY=;
        b=BrZfnfRqQf8OZATRFT5fiBNooVwBiuDfGTvxq9/N2LQw8H3bZqvrmmK1Zz/tqQZt/L
         UuLYpYvkFSW0+DqPasi/Lg4w5YnXtYDX9ZGzDbAom3jtFdWffpJeWCt1nanKeD61Cwxp
         iRlvB8wHqoauG2Sq9NJKWH+NtMtRW/IbdnXD1WWQ1+LhQfNGsNYpeXPlkxK19Yl2lowK
         jx/p4heNDTvwoGmGAoxvuINGdjQAmDn5ZLJ0CvvJLuCnrkmXgWb2naucIDYggX+BcvMc
         8vMXZefINZkNczVX1zI7FnjvTcITBX4qqz18uyqk9ZxFKizQ9W/vLX05v+7iOZCMVM1l
         8YzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=sgT+ZR4Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e11-20020a0562140d8b00b004bb7179688dsi6092819qve.319.2022.11.01.10.03.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Nov 2022 10:03:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=sgT+ZR4Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oprmi-0005of-1P; Tue, 01 Nov 2022 09:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprmg-0005oB-ET
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 09:58:30 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprme-00041W-E2
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 09:58:30 -0400
Received: by mail-pl1-x631.google.com with SMTP id l2so13612574pld.13
 for <qemu-arm@nongnu.org>; Tue, 01 Nov 2022 06:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LeDajy+wDOnHrF4VJbDnI9K6oGioqFYjvnSTZ44MAKY=;
 b=sgT+ZR4QXYsn4d/I/Wl0J7zcdq6qnUL5MSr8R3CYgHaJYTtEapnCWw6g2mH/9BRpbM
 mM0xkU9zbNSG4mXkayFzv6TDryIBbznY6BxpKHp/oowIr/1eFhRyvS/x3QcKjpRfr6Av
 c4Nd/Ep5qcSppimlUuJPXLEqm5WpP1ZdkluNuDF3tDA44BHw5tjuzocy4BZtl+/Gs+kM
 1NnyrbUjiuuEBFTufG6wJSuhQ3S81Ha37JCLm1Ea8abFdC0/n9RHq4XxhrsDdmSQb+ug
 YsQkI1Ybkz2/QFu07J0XOUMJuJ1lEgwX292RHNAa1FEop0J9pTnUMtWm6p+kIVq0OAiA
 7SeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LeDajy+wDOnHrF4VJbDnI9K6oGioqFYjvnSTZ44MAKY=;
 b=rqk5ZfduFrls5Nn8aUC5+W+jZlTIcZLcQYQTN3eWrem4OJoOGRa17mYqUlKgvPv3bI
 xCkJEugM+U0621/NaEg/Z56t9o6+Z3PniAaprWTnE3B62fBHHcAZ6/TZOrphrfjjs1A2
 CMdjAHTBmCRe/XV9lTb/3O1S4+jZ4O+AgA0kQAfM5lbuS0a+2nm7i36x4TYDwbkYDLcd
 p6tM7n/g5bogY7Wi+SmKe3SEZgwew1rBrfb1OmRLek8y5Bwy26mZpAOlZ0EbWWH3AGmj
 oQRFEQ69u1itEokF2HKmxN2mWPI8G7kXJNp0a6wLH3YVkYYGKcjZFllGy2kGfvymxwbK
 u8FQ==
X-Gm-Message-State: ACrzQf1AwfnoJfMTbASpAG8OM4o2z661zLMD4CcnT3k8IgGowiZ+OasN
 kdmlG8R9b92F7pW3Wz0zb0eZ3Q==
X-Received: by 2002:a17:902:8e84:b0:178:57e4:805b with SMTP id
 bg4-20020a1709028e8400b0017857e4805bmr19825699plb.144.1667311105619; 
 Tue, 01 Nov 2022 06:58:25 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y4-20020aa79ae4000000b0056bdc3f5b29sm6510722pfp.186.2022.11.01.06.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 06:58:25 -0700 (PDT)
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
Subject: [PATCH v8 05/17] e1000e: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 22:57:37 +0900
Message-Id: <20221101135749.4477-6-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101135749.4477-1-akihiko.odaki@daynix.com>
References: <20221101135749.4477-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x631.google.com
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
X-TUID: d95PtmfKdKJz

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. This behavior is appropriate here because all of
the capabilities set in this device are defined in the program and
their overlap should not happen unless there is a programming error.

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
2.38.1

