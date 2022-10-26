Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp829521ejn;
        Wed, 26 Oct 2022 13:22:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Vu02aMtTZ68bNxuNc3UIsFJL0EG3Ynf8+AC8+SzO3QAyQFxpIbXl+nKj3spctRxQtYAK2
X-Received: by 2002:ac8:7f43:0:b0:3a4:b916:c73 with SMTP id g3-20020ac87f43000000b003a4b9160c73mr7569057qtk.212.1666815779217;
        Wed, 26 Oct 2022 13:22:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666815779; cv=none;
        d=google.com; s=arc-20160816;
        b=unq08pKNqLOLXPOYYos5DXKA7cUyHGC5CGk7HUOO3Gse36F4+EL+nm6vthVrIHm5w8
         IWxT72+COAwGqI4G2BiKv7RxKLDLxqKhNBT2XyvgVkEAVRlKhR/tAmx4pu+w51NsHmbq
         df/ZWl6ZgZtR2NLxdb03E5UntReLzGxTKxEU1rXYJMPzFjbjL7AfGzJlp6e87/bb103P
         WDcqO0uyLTHY+W/+b9HrsFyVnuYYKs3wM4JQfsJ4PKoVSCXV97ZzuXxuX+FQEViZDQTA
         uXSh+uisOJGoPa1kS5mUDAAI4nCquuXCJ0JDxUpT/zPPXLdwO9kop76trdqvjdtiZcJz
         9K4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ec4i6BMee4yKTkO53ipp611zEYxfjKiuSx03CvbSML0=;
        b=QdEcg7ePp32rJjndvYgb5+ZPYMTpkA3tfJXt6/PoG7Ty1T54x2vvnj1GKkieJzo/al
         hEUABIT7+FRCWTVD4VISQZ3YHQnnPGWwwFc5anyXR8hxEOz/Chs5gvWySxDcn3fLXPuM
         pInj+lPYsrGh+ypanukHQtx9K4hShgB5LCati0FGcvI5dMQqrWzh9DtSRxJe+Aw/ZQ+w
         6M91J6AGugE+DTCPSlf8XvVMDwoYPoTGSeVot57X+7qwl/ArMQ26SzCWhLLXIPkUFyvY
         +8lHg28PYkd/vNn0MBIT9bCNAYkwQMq6415yoNyIf9123kccsD3UlOfP49+P7eOY6kmO
         2OVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=30HmOr60;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fv22-20020a05622a4a1600b003976b4bee7fsi997183qtb.657.2022.10.26.13.22.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Oct 2022 13:22:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=30HmOr60;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1onmpz-0002bg-DW; Wed, 26 Oct 2022 16:17:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmoy-0001b4-Sk
 for qemu-arm@nongnu.org; Wed, 26 Oct 2022 16:16:17 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onmox-0003Ai-46
 for qemu-arm@nongnu.org; Wed, 26 Oct 2022 16:16:16 -0400
Received: by mail-pf1-x434.google.com with SMTP id 192so9413136pfx.5
 for <qemu-arm@nongnu.org>; Wed, 26 Oct 2022 13:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ec4i6BMee4yKTkO53ipp611zEYxfjKiuSx03CvbSML0=;
 b=30HmOr60VoamG2tDcWNTs6baR/BdFbL1BKuBqa+96nOidHAiBiwXAp78axFoeNOnLp
 UrjKKN3Hgs76/ARZCwkbpgAnMWU0ia7pc9KbEkSwO9H+4B6Mp7U9GHsRyFdLRODLEhyx
 XoN3qbwZB1uAZMIzqMP110lQYTJV/Gil35nTZRTh2Fkg0unL8eg7IYH9AlD13AlVSnXE
 sexhg98QQZVr24octrjtn3P+btLMZE0LKVi14oUgTsEU5Kla+vYU8IeCRtuAO2ZAxNLq
 7ZAPm6ylnTfbsRN+684W/QBDQQzv5U3Vfi0KvOeXGwxIh+jD3E7Azl2vvARBNMUopBSQ
 ZsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ec4i6BMee4yKTkO53ipp611zEYxfjKiuSx03CvbSML0=;
 b=cVef1/nbyciiE2YOLnfI0C2AY4RCzJ6BnISmofkygC6LE8WpfJoQisNnVz0H6VFm30
 4fMf5C6V29FFlYvxALK/zX+sVEapDfD7lT7as5Y/P4WlnutT7KlO4+VmCO0l/C+8G+gt
 dXKnixMA4HTteEu8IPQsyjEIAQ02BGEh+YfKMdAVTDspw3LI0lSHqqcgg7Dk9w3TG6Ee
 TToEdoRU53xqWnnuDFfTwBl5uvFrnYmo4wRODUy30mhvWgvVdqR0AVGqyplrh8XrGg4b
 xVsVflrL2/Jo+ZST/25CwT+lqHAlCOEsqyTTtPbpPl/qCJ/HornM0SF1Z1dVoz7Fgkls
 B6cg==
X-Gm-Message-State: ACrzQf2qmIikDekjU9EsC5h9W5i7CwziA9BS8EmouWmr/PwUOqqo/efI
 ZgWTbwuR+0M30ye3pc0hDxF4+g==
X-Received: by 2002:a63:1301:0:b0:457:f3b7:238b with SMTP id
 i1-20020a631301000000b00457f3b7238bmr38771003pgl.262.1666815371354; 
 Wed, 26 Oct 2022 13:16:11 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa78f25000000b00541c68a0689sm3375770pfr.7.2022.10.26.13.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:16:10 -0700 (PDT)
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
Subject: [PATCH v3 06/16] hw/nvme: Omit errp for pci_add_capability
Date: Thu, 27 Oct 2022 05:15:17 +0900
Message-Id: <20221026201527.24063-7-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221026201527.24063-1-akihiko.odaki@daynix.com>
References: <20221026201527.24063-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::434;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x434.google.com
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
X-TUID: Fk3w+X4jNydX

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. This behavior is appropriate heare because all of
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

