Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1715555ejn;
        Fri, 21 Oct 2022 22:17:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4B2JhVjb4NN/VBPYeTFIjFGqp1EAvOsLcwNP3nx9s3syI0AC6/O5bDUfh0rqlMuakL11qb
X-Received: by 2002:a05:620a:2057:b0:6e6:f4d:980b with SMTP id d23-20020a05620a205700b006e60f4d980bmr16230036qka.544.1666415826870;
        Fri, 21 Oct 2022 22:17:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666415826; cv=none;
        d=google.com; s=arc-20160816;
        b=CAoEG57dt7Znd7E6uys2i5mUAsgiS7161qW8UYsRbSBxIe7luKZLraHiS7fy+S8WX8
         j1ITE8ERDptU6+8A8fxtDLHTxTpElTSw9GKmi3gyKEIdQtufVgmMMhih31/v6JdAt12O
         px1o5QwU2ZLNGG3Ou6UnWUcywB9TrUywDRRGU/7wtEK4HuLn4WOKDxBBg1I1fK2HTbH8
         9zof0cncyHcLbRCyrfeJpomyfUeMl3k3d0MdFwef5wF9MChk4NVm1vaVk+03M1qds8ae
         Ytsf48vE+ca8pyKQYwdKLc5lmWlyfVBMM1xMuyu10s+KoZ2o1RbcWBrRhcTuxBgUWwj0
         mCeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=P456vDZvNHM/FODrG1z+/gsnFf1I6mbykD78iDuTXLo=;
        b=ifhdfDpKHDaxDlDNQUSsuHsaD0sLAhKYI/t9n9ZdZIu8w5ywZq24x+xmykIk9qmpn0
         +NKAuKkfJ4EVtajzEEqsH2aVq///LdQQ/zncxbqzDEJGmyTj91LMsR+WUfHh0pUhFzww
         DbYNXP+m5tnkhCYCq0rUZkkwMoCSkRqvmM78qgbPVb4lPHcr0pfWypUz3E+UImXQQnVF
         mi5bNQzEMgHITDe9ohgz+pqElQIas9ft1Ggqotd5IGQAjtsnVjLGK1GZH5j+vnO4CwCc
         oALAVja6vGSrUW4LYEByq701QUsTUcmlgDI6dbaAekfnr4qJgIFUWNMGusrF2B46iyp5
         IDVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=3qO3noBj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15-20020a0562140d0f00b004afb621a445si13285332qvh.75.2022.10.21.22.17.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Oct 2022 22:17:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=3qO3noBj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1om6Kv-0005eZ-BF; Sat, 22 Oct 2022 00:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6Ko-0005d3-E6
 for qemu-arm@nongnu.org; Sat, 22 Oct 2022 00:42:10 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6Kl-0003kD-AI
 for qemu-arm@nongnu.org; Sat, 22 Oct 2022 00:42:08 -0400
Received: by mail-pf1-x42f.google.com with SMTP id g62so422414pfb.10
 for <qemu-arm@nongnu.org>; Fri, 21 Oct 2022 21:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P456vDZvNHM/FODrG1z+/gsnFf1I6mbykD78iDuTXLo=;
 b=3qO3noBjD32v2hLct3xJUKTUW5hz3q762W51xK5zfwC0ekXkz70C5glEZJAaCOrdg/
 AdkP6uOlSp5W/k2b2mGNs8400GxdzmyAac8HZ9Opo1JdPCaEYymFRsDiZJZvAroDEsk2
 F5TQyEWUbVBIZ3FDtFhHk/sxhDitb0UN6VfRmmypgIIo8RqKYZlNa+V7DMgOs4ilPIXU
 cXiyYxe/7chDiNUmMbedLkGPQJdfwjzUWSgzVsXF54U3XdWE0zMBZth02zQqJXeFzs5Y
 BK/3HUUoz39SRAkuyDrlkC7D1Qs6nCr3eLtA5N/dRBjt6CZ/7U7zTedCac2SkpFTWAeV
 quJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P456vDZvNHM/FODrG1z+/gsnFf1I6mbykD78iDuTXLo=;
 b=NLfumrd9fZr4iBh4lYU3wiAP5EGgCJJvr8NOAQ+sND5SZCjUcYR2VZBZCiLCp68Err
 f3Px/UnXewb1G0uQMrbA1ztQA/hawnDW0Onuc2f+2mUx0IX9kWdVrFEwx5up8jUew2a/
 xWmja/h58ut89gy7mgppMgmA5lONxAslj86JRi09gA7g+xci0DhCnG0s3falN6HUHaYJ
 +s2AoQqLhIQVExdsYDbIP+e9oktxTVHAl5fvwNVSMdHPmERU1ihF4Efba7WMJqgR9zXR
 PAN9RbmUFyCYREzf9Mf5QZSUvK7/fIzHspEQpxACqa7ss9cHP5eX6olrNlijg2UXd8pA
 jL7A==
X-Gm-Message-State: ACrzQf0G/EGTq2lXLDv6CPkgJwY/IK5dT2udEz8Qk+A/Ol6wVsCQrNzn
 3FDPzLKxzdkyWOrtbYCPvZI74Q==
X-Received: by 2002:a63:5b5c:0:b0:461:8ba9:457e with SMTP id
 l28-20020a635b5c000000b004618ba9457emr19304018pgm.218.1666413726676; 
 Fri, 21 Oct 2022 21:42:06 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b001868d4600b8sm178049pli.158.2022.10.21.21.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 21:42:06 -0700 (PDT)
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
Subject: [PATCH v2 11/17] msix: Omit errp for pci_add_capability
Date: Sat, 22 Oct 2022 13:40:47 +0900
Message-Id: <20221022044053.81650-12-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022044053.81650-1-akihiko.odaki@daynix.com>
References: <20221022044053.81650-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42f.google.com
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
X-TUID: 808ZJ8BkTdMM

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci/msix.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index 1e381a9813..28af83403b 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -311,7 +311,7 @@ int msix_init(struct PCIDevice *dev, unsigned short nentries,
               uint8_t pba_bar_nr, unsigned pba_offset, uint8_t cap_pos,
               Error **errp)
 {
-    int cap;
+    uint8_t cap;
     unsigned table_size, pba_size;
     uint8_t *config;
 
@@ -340,11 +340,7 @@ int msix_init(struct PCIDevice *dev, unsigned short nentries,
         return -EINVAL;
     }
 
-    cap = pci_add_capability(dev, PCI_CAP_ID_MSIX,
-                              cap_pos, MSIX_CAP_LENGTH, errp);
-    if (cap < 0) {
-        return cap;
-    }
+    cap = pci_add_capability(dev, PCI_CAP_ID_MSIX, cap_pos, MSIX_CAP_LENGTH);
 
     dev->msix_cap = cap;
     dev->cap_present |= QEMU_PCI_CAP_MSIX;
-- 
2.37.3

