Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp159026ejn;
        Wed, 26 Oct 2022 23:42:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5mUcdAu6GtGNCiRmVdzYI10ptDivMjkVfIuBGRqswVNmGmsEDjymTJhrGq5QVwTNnWqgNE
X-Received: by 2002:a05:6214:2528:b0:4b8:2025:5f6e with SMTP id gg8-20020a056214252800b004b820255f6emr31368985qvb.88.1666852975700;
        Wed, 26 Oct 2022 23:42:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666852975; cv=none;
        d=google.com; s=arc-20160816;
        b=PzyoKE9hnEO+kCTZEJfygvfPB4k9KB5snWH61bymI00UXMp2n6DdMlJOGfgXVHAmYo
         XJ44FPyECXcIcjog7xehqeOzlyVZQEeu7okGwMTWYkW38dxp0LlUiZ+ZSToFy2Y3ARNK
         VcF9QeQWbno66O5MaiuUuB6zTcO8GZxheI1kJwqa58mQY0vUfMcwN7YZT1rWMRwh/a7W
         07nO7a6HJphnjudv3UK40AoATB3HeluimxdU1FJIbQcAiE4ahpQ08nDGlC3ml0gzB1Cb
         ctFIiPr22grciJ1DbbAKBHqfKhIUtAKrxnVrk0brs113pKEcyZFPnt0euBZgukdNuNIp
         shRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6T08FDbNNqEO12Zwu/jhonyIkuoJ+EhaugR2jE60b2U=;
        b=m76E9dwF0kAjO+/8y4WW200zy/J+jPgqclTpD6UqvDpvDyNKe3pA4jBKUiK/CFo1IO
         CNsQ+qZ9y7rJL4K5lQSB/N0s+GQklkf9X7FDFzo2FlVA2GCaja7cQdvaE+Xmo3xnhhjE
         utwDb0pmgeMqhh7PU00tHQicvz/MPAn0TCdflmNbsGIA3a6kCCtc610StGqEeyJWOnLf
         L3gK7ZNs4LlPeRgQYbRfhzBBgAQeFbZiUlUxDsxk739TpNhZLSqC0mb659conN4l2RDk
         70OtfS7Ll0bcDOox0N4t9h7Me91V+ldbnIFP9UUS9/j0bA9iNcGVPvbl82L3Ia2p+IlG
         WDbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=Oo3z1Mq9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j9-20020a05621419c900b004af937773e9si404803qvc.320.2022.10.26.23.42.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Oct 2022 23:42:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=Oo3z1Mq9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1onwYo-0003TR-LZ; Thu, 27 Oct 2022 02:40:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwWb-0003Vh-CV
 for qemu-arm@nongnu.org; Thu, 27 Oct 2022 02:37:57 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwWX-0003Da-Jt
 for qemu-arm@nongnu.org; Thu, 27 Oct 2022 02:37:57 -0400
Received: by mail-pl1-x62a.google.com with SMTP id f23so466170plr.6
 for <qemu-arm@nongnu.org>; Wed, 26 Oct 2022 23:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6T08FDbNNqEO12Zwu/jhonyIkuoJ+EhaugR2jE60b2U=;
 b=Oo3z1Mq9iJQSSgDEJQf+9+I62K4uedAU9viS7nGM7MSOYR5BU47hp0yyoNesUiWl3A
 dQccWhG3aZc4pmucKUeAlNcrgcDOmUsa7t+fI+XJ+9lzXKoDcrtoARuKF1BxwaMDzQwT
 8ZMWZb/a9PsP53vi3fLM72m4Iyor4O4GlWSRtnp3JvtZmhsCZAqkJfBRtoSlrxri+gZm
 xVskmfpKppw1Yh6cTEGKejfX7ehma5oXl6Ogp/GGA1YRoH1B8EGycoOpgou5kOi4nlvK
 PSGMOSP+p/zkxwwy0tcgqvfRVRIcrRA2NZHSb1rfnv3qht59Urb+QX2YpVsS+UCKwgVW
 F39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6T08FDbNNqEO12Zwu/jhonyIkuoJ+EhaugR2jE60b2U=;
 b=ju4mGTMVx3gC1DAsPw4MrNy5bnOVYEgu5oRIQTFRoDqgbgSTjybdZ9KiKiZmCmzXBu
 EDC2bDkUCvFb1ZbKorGl3oM6vlBAKAolXyw++3zJk1oY8R/C2xFLrITMZMsCjOSC7wHi
 jwov7o752STVCzjQXFujJ95oKd2NsVD6rYLqxDYNFD7yuGXlrLx2XtTjdiawssJ5TCtl
 9KIeYh8G2VbKrcCXx1WGT6Wm59JCv66GivDnXUAdfNEIqE6IafouLj6xc+RQ0NK721sM
 w5r0rivs3mWOujR+OQAOLVJfOztRdeLocXRJJLWotDlaBuvOpFHW4YegDo/Ce/rmEZRd
 81AA==
X-Gm-Message-State: ACrzQf1rk/l7nQzWuNrHkh/HnaAMqtzsOJkLj9j39DBzZWw2MJYD0t88
 g5QuSFvjRegxyn4Nz6uNquiqmg==
X-Received: by 2002:a17:90b:1643:b0:212:d286:bb13 with SMTP id
 il3-20020a17090b164300b00212d286bb13mr8608359pjb.11.1666852671213; 
 Wed, 26 Oct 2022 23:37:51 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 z17-20020aa79491000000b0056b818142a2sm448872pfk.109.2022.10.26.23.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 23:37:50 -0700 (PDT)
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
Subject: [PATCH v4 07/17] hw/nvme: Omit errp for pci_add_capability
Date: Thu, 27 Oct 2022 15:36:55 +0900
Message-Id: <20221027063705.4093-8-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027063705.4093-1-akihiko.odaki@daynix.com>
References: <20221027063705.4093-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62a.google.com
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
X-TUID: ggwk3Z/J/B0z

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. This behavior is appropriate here because all of
the capabilities set in this device are defined in the program and
their overlap should not happen unless there is a programming error.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/nvme/ctrl.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 87aeba0564..ff4e2beea6 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -7325,17 +7325,9 @@ static void nvme_init_sriov(NvmeCtrl *n, PCIDevice *pci_dev, uint16_t offset)
                               PCI_BASE_ADDRESS_MEM_TYPE_64, bar_size);
 }
 
-static int nvme_add_pm_capability(PCIDevice *pci_dev, uint8_t offset)
+static void nvme_add_pm_capability(PCIDevice *pci_dev, uint8_t offset)
 {
-    Error *err = NULL;
-    int ret;
-
-    ret = pci_add_capability(pci_dev, PCI_CAP_ID_PM, offset,
-                             PCI_PM_SIZEOF, &err);
-    if (err) {
-        error_report_err(err);
-        return ret;
-    }
+    pci_add_capability(pci_dev, PCI_CAP_ID_PM, offset, PCI_PM_SIZEOF);
 
     pci_set_word(pci_dev->config + offset + PCI_PM_PMC,
                  PCI_PM_CAP_VER_1_2);
@@ -7343,8 +7335,6 @@ static int nvme_add_pm_capability(PCIDevice *pci_dev, uint8_t offset)
                  PCI_PM_CTRL_NO_SOFT_RESET);
     pci_set_word(pci_dev->wmask + offset + PCI_PM_CTRL,
                  PCI_PM_CTRL_STATE_MASK);
-
-    return 0;
 }
 
 static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
-- 
2.37.3

