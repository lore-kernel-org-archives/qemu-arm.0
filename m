Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp2042715ejc;
        Tue, 1 Nov 2022 10:16:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5f0xSb+VpszYzCUklVGNLG2p115YIRE41rFh7kRiKwm32IVS7x2vIRItdbl+RY9kcMDyIY
X-Received: by 2002:a05:622a:1f19:b0:3a5:1ba5:cb7c with SMTP id ca25-20020a05622a1f1900b003a51ba5cb7cmr13337387qtb.414.1667322974117;
        Tue, 01 Nov 2022 10:16:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667322974; cv=none;
        d=google.com; s=arc-20160816;
        b=e6awM0Qp3eK9AQLUXHLwx/RGwx2VBmB7Y9TTwPv/plwSe7k0uaG9V4+3U5TooWMsh7
         UX1R+YnfFAfP8tbL1pvFdCWV0yT1UT/tpK8LaMIx+YJu2ewjt3zQydfFqZGKHL8L8Ief
         w89x/jK8atnPZOCXy5rKoJwgHxEpEiJezzSxgN3/O0l+3X/1Vfw/cQ77uYMH5g5TeJcK
         Tik9U/DtaQKhc8PLVmfZYU8NRzUqbLzi9pjhFat67hOrnPSYvOIT5XdRWoIKmZ3pAi4c
         mbn46uvOXeW1RfUPYAuMpSQZ5vWsCD2i2wg53Xr6k7G1SaSBufBC5AnW19NjoXR5I3cL
         hucQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ve64Yknp9Z5jtrd7y/2CScvNeMugfa6S0tD/94xCa3A=;
        b=ClfpTiQ38p+U0qHPas0IxvJMZX//32d13hO3ZOd2ZvgMoPSR60I+Xu4sxPG3KzCZJ/
         +rmL3FtzzIMTJlDpN97XTWZBamtOLSgHVoFfPT0r8U/yJBwWpoQ6vGdAIw9n0NtBE90p
         zbQWrbn3VLZhO44I2ilv3zVPakfSj6E+kxxoozWD9BASDnjbWWgLwUFPdLCj+Czbq80b
         DQsE8BBIv7/8wheiFDgz2SAmKH3tz59nmqiM88nXiPzxlwHrmWwBaDW0ydpb9FHqTMrb
         N7IeO2oBt6slGsjD5QvOahp8RTcOQdXTUEdovM1mIQvG+ESbK8WM9ocWh0W3Iwolx39H
         spDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=bAWiqJdq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11-20020a05620a400b00b006ead289f6b4si7206818qko.521.2022.11.01.10.16.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Nov 2022 10:16:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=bAWiqJdq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opshc-000727-IJ; Tue, 01 Nov 2022 10:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opshZ-00070C-A4
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:57:17 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opshX-0003iS-Et
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 10:57:16 -0400
Received: by mail-pf1-x430.google.com with SMTP id b185so13680280pfb.9
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 07:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ve64Yknp9Z5jtrd7y/2CScvNeMugfa6S0tD/94xCa3A=;
 b=bAWiqJdqIgjLtNbnpm3kBUlGN/ls+F/6Th3SLwjv7Fh6sSvp/tTD/lTwIjSPrkFGKM
 BN35tSPLicLsLI5rS3m1pdUneTlAJLF1/xgAH3BRLGEWFzYlJlYyCMPBJ9X6dnQuo9oy
 Wnt2sgnhggJAjRFCXXDdJ84t5McEaG1D6L8zGPicoJLr2V4L18afLGmjF+GYr892d8rR
 VKWE6V43GwN0/gLQQ216JRK/nGYcjuWg3PLxpSX2LGTTeswooKeYt2E0AZZMQ7ldmCsA
 TcqbUiIDuigVkq4T1yhCDn0ESaM5qW3+zIq809/GLR7LcB9KJHhzvqRfvNzlLoyUjIoH
 f8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ve64Yknp9Z5jtrd7y/2CScvNeMugfa6S0tD/94xCa3A=;
 b=u8In0bDqbxHYkWMbRg4KaECoirUbl0FT+8LHQRWroht8E95gGzadGVMyByqOxIoobB
 Vn40DOhER4szLBlYmliCteeJP8Qvz3sfcEUePrjXmTB54bpE3IKprfU5uRr0pIdRmLVe
 KjeYwdjxdQ302M3Jn3B5BSSf4PCN0PmVjPS1PyjDaKrGKhWDUeyZGKXgj3lYjawAMlZ6
 qwGp73KCuLxzVFtmrohPeLE0GWYThZ6Bah8nz3b5QyCCxIv734vTW6/ihzP4B2Bhfls9
 L42XDLiooiN+uKhE5oJThrK1XL9NCdbhiqCbwN+XMfv3QgmZ6/v/LyF0n77cwDDVVMLm
 p4SA==
X-Gm-Message-State: ACrzQf1NSdKDpH2pZWFGNhb1guVG4XzVmHUnyl3zeO1f9rVf3haBx3ae
 6oL24AHjHb2l4wcgYccHnr2VYSGd743QMkwB
X-Received: by 2002:a63:ea41:0:b0:439:19f:d0da with SMTP id
 l1-20020a63ea41000000b00439019fd0damr148865pgk.232.1667314633795; 
 Tue, 01 Nov 2022 07:57:13 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 22-20020a631656000000b0046f9f4a2de6sm4783219pgw.74.2022.11.01.07.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 07:57:13 -0700 (PDT)
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
Subject: [PATCH v9 12/17] msix: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 23:55:53 +0900
Message-Id: <20221101145558.3998-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101145558.3998-1-akihiko.odaki@daynix.com>
References: <20221101145558.3998-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::430;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x430.google.com
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
X-TUID: DzDNL0hdW3Ua

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. A caller of msix_init(), which calls
pci_add_capability() in turn, is expected to ensure that will not
happen.

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
2.38.1

