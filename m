Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1732336ejn;
        Fri, 21 Oct 2022 22:44:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM514f3nclvy4vBYBv5vaBqaP6FuVQ8sRO7Dgxs+sLvmkPm9omJZ7m24YjZONvzW58Ugc8SJ
X-Received: by 2002:a05:620a:404c:b0:6d9:9fa1:535e with SMTP id i12-20020a05620a404c00b006d99fa1535emr17139513qko.509.1666417488067;
        Fri, 21 Oct 2022 22:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666417488; cv=none;
        d=google.com; s=arc-20160816;
        b=XF2GiTbzJwBmHygLT/u5SCu5aC0mEOskpDsY8jXxHPa21nj2DTPIK2S+yK2Win9Ljx
         Ao/6N7fMA5kcve3X0gltqNJNH3AH3RrJ3PExTWTelnaf0TeJ3it1ZN8ECq1xOVJD3UEB
         yDNQGBCKtG8q2D050ExpsZDWD+NVzv8pV4gkn7H3R54LfuozyVm7YfJ0jA5SebwHvZoL
         4LbKxenyCHg4ZpDNIR3waLZoNYYZD7Q5yHNcpJD0ADmxYpvTlvlDy/1n9QN5YmdnpvES
         8/VzrDlmST0tiwJ3kFk2Nw4+pV2c72zD93bjbfwLvtNi48egU7117EAzYSZD7vZ8d0IH
         hhoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YMCYespmeOg3BBkL5WBcqPLvSzItOSN0B+fYLg73s3E=;
        b=qKFXh+Mwg+VyYvZP9f5qTi0m9PhI7D9xh2bgOmjOtdX6n2tFhE6dE3KXb5FIREG57y
         y0g+qUJImogRlmqLVUVzTa6xpUwRUcO7wZY4lzP2Q1CY6lBJt5hHtckG6crmAl+N/Hn2
         CNW6oukDxa2HFuvpgtPjhNunCXiqncGT+yxk99pHVnjiogBSIwCdXMKqBq9F/z6MqQLZ
         pMrcJ1zGXnAClQxBA01U+vZti/LWWn2xtTR6m0NAKHDbHgzrPlhAdHt5poUwvw6ai1qX
         /LXpoBNziMCVcFw4Wlr48yB8tcduUxCQyOpoVx9EpsUpD+XOABd4hjKI2rj/manK5UFm
         Ojbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=mLyfvUGL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18-20020ac87f92000000b0039cdc8a22c8si13495450qtj.567.2022.10.21.22.44.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Oct 2022 22:44:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=mLyfvUGL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om6KZ-0005Yv-KJ; Sat, 22 Oct 2022 00:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6KX-0005Xi-8n
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:41:53 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6KR-0003l5-Pb
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:41:51 -0400
Received: by mail-pl1-x633.google.com with SMTP id l4so4071649plb.8
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 21:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YMCYespmeOg3BBkL5WBcqPLvSzItOSN0B+fYLg73s3E=;
 b=mLyfvUGLY6abBkJnAtKcKlgMcwmR70JPY2RNcIMcLTgQnn9bzkD0xdgiB8b8RvqwjV
 iZHcKB8dfDKvEr4G32V1AGwakxGsragehef0CEJvakMrOvZ57gusWnAkki1yttVdUmrN
 PBgM8ZKMhIS96znHSxEALWs6PmHB2ds7ymopXLEowoHbJlJQoeKALWPNB6d39T2cVuOH
 SxbxSXMAyvRS8tEX1lEz2MA055aJlVsEwZH1K0UyNNFbOoLa1h/SR/se0VpBYU4vpMsN
 oneCZ6BfhEuMaj1mkxXyRhbJhMuU9EkX7XkhkmzCYgbgBVkwR07o7EADFBwQaal7y6Tq
 MQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YMCYespmeOg3BBkL5WBcqPLvSzItOSN0B+fYLg73s3E=;
 b=bI8C8/GeqRQUjVb8YKTODARVQDiMzWjCrAKnClO31YKJCkd+vdye2GV63zNYYc64I9
 AewWZflJt/cnLRhGLWEu3WCUJntu85dh5Uin4mVvqaKXlp0t3v3WTMkurz8OKExhwDiw
 GOznMK3XUFVqxwP2aNQXM31wB3z+68gWhKtNtgPAHDecPE5rS28DnoWhM1sIU56hGhfz
 d31vR50xlJ7EqKwoeBbbjJ+Lf+DSqb0CLlwHIL+GhNMctIh7CQG6hlXjsWlKlCurFUb+
 +wvRVDQksMLfpSe9YO9Gaqe5HekplzTtvMRrduaHehLSfQhFyhuKW3g5Uat8UwOzwfhr
 +VqA==
X-Gm-Message-State: ACrzQf1jyZwcsce50RUUR92VXDYh9fFzugk5ey25iWTNgP1Mh4ZV/KVx
 GFV1aF/ZvdMed/vvcs/A8ZWqiw==
X-Received: by 2002:a17:903:2442:b0:17f:8069:533a with SMTP id
 l2-20020a170903244200b0017f8069533amr22235913pls.46.1666413705938; 
 Fri, 21 Oct 2022 21:41:45 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b001868d4600b8sm178049pli.158.2022.10.21.21.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 21:41:45 -0700 (PDT)
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
Subject: [PATCH v2 07/17] msi: Omit errp for pci_add_capability
Date: Sat, 22 Oct 2022 13:40:43 +0900
Message-Id: <20221022044053.81650-8-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022044053.81650-1-akihiko.odaki@daynix.com>
References: <20221022044053.81650-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::633;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: RH4jmZ9Mm/ZA

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
2.37.3

