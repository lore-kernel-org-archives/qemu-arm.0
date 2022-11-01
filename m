Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp2028105ejc;
        Tue, 1 Nov 2022 09:59:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6kJw/ezeNDCU1/s9nOeTuMq7T2sN2GnaXO6Oe1BGhGYA3X2HYFQaY6Q8XZ5t7D69NYAsS0
X-Received: by 2002:ac8:5fc8:0:b0:398:db76:62ef with SMTP id k8-20020ac85fc8000000b00398db7662efmr138194qta.116.1667321941628;
        Tue, 01 Nov 2022 09:59:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667321941; cv=none;
        d=google.com; s=arc-20160816;
        b=GmtGiJ/okWU6B8GxkyfOlgmCqvsWqIb1Q/8Tgyr0oGVYDXcoA65tA+TI6oANbYvVin
         zkoZIbPpJXcn7I3dS+TMUBdfN6zsIoSJUEvkrTng3mM034ItcTgXVRys9FaV8UGbZNgF
         UVNESdnkvh8vJ3A7TXswfCU0meTB0yslr6EiHpct4R0ouCfszIKJ5wFUrBDsSPZDaswG
         UplLntpMcUznFlQBJaj1sw6nC3eOLR5yACxcUvVuMhy4D4QN504t3Fhm1b0c61YfS5ia
         LOxtkMXkWJrN9d8OiJRPsOfbRE54otqGjCzPGCV4jifVljRlhF78WGKqJKiZ1Y9lnGrs
         0tWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ve64Yknp9Z5jtrd7y/2CScvNeMugfa6S0tD/94xCa3A=;
        b=ze4ALuxePTt81Py2LYwOF5CG1NrhlMMDDtwcaPx+UDtFtZ9TThIEytPBcTtRUEVK+I
         UWaQGgkKmkYILLXtsbFUw8qDm4vfIlWWQZ7kYHO6p0wwMEL1fQbKCZK5XDH06YqioIY9
         pESr5qthKX//VHEbWQhI/b0/zT+2AfGh7Br1aOCkZvdP8zghdM5qc49DdNnSe7feYsOI
         hSbxcfMqxdnRyOVZ8jlABiQ3SgmDDWs5luxAtGwwvRlbLfOUH/UJqDphR3qtd3bS+i/Y
         SEUsDO5vEn0miKmVuwRj50HLNc7FTVATt3efqhVUrg3EGtvIqCMqAAkSq+QkGdWm9dav
         2P/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=seVPVcjY;
       spf=pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl26-20020a05620a1a9a00b006e4734af463si6893234qkb.737.2022.11.01.09.59.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Nov 2022 09:59:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=seVPVcjY;
       spf=pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oprnO-00063f-Mc; Tue, 01 Nov 2022 09:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprnG-00062B-Kp
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:59:07 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprnE-0004bj-6z
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:59:06 -0400
Received: by mail-pf1-x42a.google.com with SMTP id y13so13526701pfp.7
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 06:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ve64Yknp9Z5jtrd7y/2CScvNeMugfa6S0tD/94xCa3A=;
 b=seVPVcjYWgwOnMdmIA3FozE2Cy9a5IiAswJIotzm9SgdcDDuKSJILYkHIozLPE6YOr
 mASdg9Zsy7LE+a5AdG2zzfppBAt2Q93pzEnZMLd1M8OHh4GlU2IMJLSzIueM9SeGQ3WB
 MI/B0u9Eh+Ckug6MikIq6LjmoRJOQesBmrsmDE48fkd9vx3RqJsU3kmhWUoRIIS3leJU
 4n3g9GwMpKOZpR/63ggQJw7oJqUW9Yfb3sIuSO5ioE5atMRwNNUcrFXx+FlA3VIdehSh
 AHfGshtk8CzO1aNNJUrmeqv/e8YCF58EIbaMiPUy995V98WRqfdiH9yTYfbnEd1C8zQF
 RI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ve64Yknp9Z5jtrd7y/2CScvNeMugfa6S0tD/94xCa3A=;
 b=kfm71n38Qq07bPOTPUOJDTRN6QoroAuGXimalcDW/c1NuGeesNlajwybmqHbwOxs2T
 tViK3GE7a0ArBTjtLqKjxnfd8O+1Vjcc2w4xtsv8n2SQdZ0PK7TSDpp+FfLDWriK+78I
 2Etnjl6ZbOLJDRC8LIJi9CrZ1sKBmU9yssMBrHJrPqk9PE4VTmHm2LeTjo5GEIvv8KNH
 tPXfRnKBok221Y7TMW95EyKlJid56gIIATmQGkvZ/odcLMHI63OENT5Mu2/EtnZvavmj
 Ft7Y7esriRIsMqRpoukLbhF9RuJ5whXVzGCPFAfm1Et7QygL04o9uIgUNIgYG3bPM8Fj
 l1hg==
X-Gm-Message-State: ACrzQf1hRxaf0PZwwGU4KGWhE5YDLYEyHDzdj+sKM4v5RVpMW9TIh+2m
 pz2aFqCaviVBAVgnSfIboDelzejPW1f95xZJ
X-Received: by 2002:a65:4508:0:b0:43c:e3c6:d1c2 with SMTP id
 n8-20020a654508000000b0043ce3c6d1c2mr17137387pgq.582.1667311142548; 
 Tue, 01 Nov 2022 06:59:02 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y4-20020aa79ae4000000b0056bdc3f5b29sm6510722pfp.186.2022.11.01.06.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 06:59:02 -0700 (PDT)
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
Subject: [PATCH v8 12/17] msix: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 22:57:44 +0900
Message-Id: <20221101135749.4477-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101135749.4477-1-akihiko.odaki@daynix.com>
References: <20221101135749.4477-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42a.google.com
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
Errors-To: qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: 8PNnJJfpo16S

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

