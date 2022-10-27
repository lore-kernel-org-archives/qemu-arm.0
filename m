Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp157713ejn;
        Wed, 26 Oct 2022 23:40:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5g0h6KPyP2RUXWLzU0A872UIUC/8P+3IZLquEGrrxa5xYMeNt9VWfzRqPzhFGCHubx+aRs
X-Received: by 2002:ac8:7d55:0:b0:39b:ef52:a79e with SMTP id h21-20020ac87d55000000b0039bef52a79emr40096927qtb.658.1666852798486;
        Wed, 26 Oct 2022 23:39:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666852798; cv=none;
        d=google.com; s=arc-20160816;
        b=mv4+Yb8srXCBn2gJPjXOMNPNNCz/zNptcn3QCIUCR0yCM8ObCe4ZiI7J2y8gLImIol
         Lv9vZITu+Tywrgg7NMcJ40fV4zQ59WqzCXQ+R5xK3aeVY3w4A7fihKDRzgl+uR6liG+D
         3ZdfZBa0gyldJ5iPNYUwyEBe1KCooRzdGCt2jp6/Lxy0vBAfrzZqg4DR/Xtnp5/D65W+
         Pb6gwHv7gPXURlOncEZ8cj3p7vv+SRb/BSGG74SOXXuGawcxhOo1mPgheI26cY7DmTA9
         8Iovdzrg9tW4wM0ml71/zeqgzlX8WfUh006OoZM+THKrUevQ3n9E5kPXnnydV6v1ElOb
         TECw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cnBDuSRzJzbfjGOnLipW4bK9mOlxmQGPcT+G95Rowy4=;
        b=iAOdvKhQ+OaF4bIs5gt7Gw84ILEQkNofFvXcIc5EEXQyLdGyyNyMN6euhectD4WBLK
         YsDPP2ml0YCdROFLvmADWv8iiNXKYllydFTF+FxE4yrlB/MCklZv6TG5aOPT26kFK5ad
         tJEFzBN7HpeSgMKCdxAK42WBd99Je0AHoIj1H97FxSmWMxqb0plq6QbcguO//PXnhpON
         JXwQH5DhG+032NSKfJEt0BVatOHr1wLZbw/tZ08PzYqoRYKsRmfuQt9VDt8ASwa99cTP
         06BPW3lgWDtFrrOMExJ08o+CkXeg8Qb7vccc38dlckc4fo+DqP2D4fshQ7uGxwrqjOaO
         zypA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=MeHfhgZU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x22-20020a05622a001600b0039cf603cddbsi405149qtw.664.2022.10.26.23.39.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Oct 2022 23:39:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=MeHfhgZU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1onwXp-0000L9-R5; Thu, 27 Oct 2022 02:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwWN-0002ta-Fb
 for qemu-arm@nongnu.org; Thu, 27 Oct 2022 02:37:47 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwWH-0003AT-QQ
 for qemu-arm@nongnu.org; Thu, 27 Oct 2022 02:37:43 -0400
Received: by mail-pl1-x630.google.com with SMTP id y4so481670plb.2
 for <qemu-arm@nongnu.org>; Wed, 26 Oct 2022 23:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cnBDuSRzJzbfjGOnLipW4bK9mOlxmQGPcT+G95Rowy4=;
 b=MeHfhgZUvAA+DefOhUFBIHvAOfdOBGXYrbFiAocNz5xmSa/Ljc76E8FFCeYhg0jzGm
 hcq5w37ilZFHtIesmvmudogCpg4hhP651pTBLvglgOlQY6Rgk5xM+hJNuJSCLludCw00
 LmHes1ITW9ldIWM4wx/TcntP1w3RkTfa4h89hK0MM1c8oOZ8BfXA2UeBPck7KumP6J9L
 me5sEy4me3T16WKTaZvPmbH/NxmFBy1PeytmsztDtc06VdzDMyDsUhdSDj366fJc/0Zt
 0CUpf4dlMPFHJP+mtuHFu/6S4cIDVaxi0SKzJ51Xct37T8JiDb+RwC0b4403zHUs5e/9
 DjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cnBDuSRzJzbfjGOnLipW4bK9mOlxmQGPcT+G95Rowy4=;
 b=edEbtkd17h4sC0f6xvEZ+8zyD79Ci7BtkYIJ+sO3iLwThDtvf4wZRAspbXKM47nhTR
 0gYtyrZbVhfZls742jFzf8Eh5uG1GaYBVPGUdWaJTbVdcyaNlCMutqIoPRj/V717x3lh
 4FKfdRyag07Kuw1aksWQr88ixKuDWJLFbYutbVB4clPqR/bNz493jj3b4HoOk/vVxgU/
 dRRTRTSR7s4ELcee9Pwxk/0G33+OYzDxPQq7vW8dqVir8d1v6PgKc+9ntVEk5PB+A8cg
 7P2NPL9N8Z05rLPN5upK98EpdseOh1txk6h3gi6dpuSaoOssl5oRjpt63/OlSmS9srzC
 pNDg==
X-Gm-Message-State: ACrzQf1hGnBtURxeGtNSaipZvxUo0TBRiMlzKO85t/sYrJ4KIT1yx7RG
 mDBRyMivPEaPJSwb0eji4qtapg==
X-Received: by 2002:a17:902:d4c5:b0:183:6e51:503 with SMTP id
 o5-20020a170902d4c500b001836e510503mr47557684plg.84.1666852655687; 
 Wed, 26 Oct 2022 23:37:35 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 z17-20020aa79491000000b0056b818142a2sm448872pfk.109.2022.10.26.23.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 23:37:35 -0700 (PDT)
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
Subject: [PATCH v4 04/17] ahci: Omit errp for pci_add_capability
Date: Thu, 27 Oct 2022 15:36:52 +0900
Message-Id: <20221027063705.4093-5-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027063705.4093-1-akihiko.odaki@daynix.com>
References: <20221027063705.4093-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::630;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x630.google.com
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
X-TUID: 7QA85B15G99J

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
2.37.3

