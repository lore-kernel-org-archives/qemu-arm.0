Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp931465ejc;
        Mon, 31 Oct 2022 05:36:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6qSk46pX6Sb6GsjbJi78KvacrE0GMCgf+uVBdLaar57kVQNBrWtKsaj5hxisuRCfBF+t3J
X-Received: by 2002:ac8:7d92:0:b0:39c:f4b6:f014 with SMTP id c18-20020ac87d92000000b0039cf4b6f014mr10009766qtd.513.1667219801691;
        Mon, 31 Oct 2022 05:36:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667219801; cv=none;
        d=google.com; s=arc-20160816;
        b=lG1o+9BRqy6nUrONukrjJGWGtRETznLZ0J85QIXgkvk8dKyQ7/F2DPais3jaXNtGiE
         dPHls2MCPpuFxHHYo8F1a5bfZJhuMHz5m2auhZcOqahbyP5sg+8jnUCcZKDiL2X1CUQw
         KUAyFzqyhu0aK0nSJC/ZWY/nORfaAlyyaMvezmr3e+tlhcavBSoXEiR5hlEbqlHkybJw
         wRslSsRu4+kb8x0PY6pSP2AR0sHu4ZFPIotkDOXO06oILVn2ZD17IxU2E9M+jSxbtASL
         JWhvg/mKSHPrLZRoRUM51HoE1s4zxZ+qI2iAv7ZOwpNSUnU2hb7LxUgxeWB/nhIk9jS1
         hHEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rOjHWNXn/Wht1Shk+YGDnbsD8G3ScWO/Koc/z3Bsls4=;
        b=VYJFxDHGVg5BAqVHcnOWXMisgiQ2SvFdmYmvWUT0qiD3T/9+vtMxaMeV+gXVflawbG
         cmXVTX13jz1GB3oxHUF4pLAfTgDfCOWPM8woIYgfePzwfj4AhlRvSjMT66kh+B8KZKMN
         ZDC3/i51vCJfHGju6HZBZzpuBC483Uk5YYUAcX+rTCJTqkCr5r+2S2QAIWdllkGBR35t
         G65/jX7gSrjgettn5Ord+UamM9tM+6T/AhlQy0E0kiq3hovFDZbQqkjfaxS3fFit4P16
         ThoKebdir0w7AU6Sq7xosrKsiWkuMZB6MnzBW6vzg9/OZHb3G/jg8JQ1l5w7eteekILp
         9Clg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=u2birZTK;
       spf=pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cb20-20020a05622a1f9400b003a4fedfbbb1si3956555qtb.253.2022.10.31.05.36.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 05:36:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=u2birZTK;
       spf=pass (google.com: domain of qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+peter.griffin=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opU0k-0005gD-Nx; Mon, 31 Oct 2022 08:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opTzl-0003WF-5L
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:34:29 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opTzh-0004Ok-Ot
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:34:24 -0400
Received: by mail-pj1-x1031.google.com with SMTP id k5so2700559pjo.5
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rOjHWNXn/Wht1Shk+YGDnbsD8G3ScWO/Koc/z3Bsls4=;
 b=u2birZTKvuAI0Mbv1QJ6/Bz86V7LFLywE5wgKFdVyqk1JoCo0/SNwNIqsDqKzlqKo3
 QOx4TdpNAfH2cVpNOx4q82G7zTpcf9aKpZPOodHy4y9cKybPMFN21JWsem9OXMYy/D+O
 Z+xeks7RP/80UoDmz5sM5qCXoFq3USY17iCeIkUQaR6IBMn04FohspNSY/D89qwK8PaI
 LNcAaXJqLxbPQ73eZ9OCLudBxl6qFaNlqEw9egJ9tP7CGhVpmVbloeu2dM4jw5NaNSpr
 dUj1C33WOr4KVWiJMW5RPGrx/WluEigeGDqh0R24vGGrTRDKrtF8jiWUrIFy5HlfXtr+
 D/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rOjHWNXn/Wht1Shk+YGDnbsD8G3ScWO/Koc/z3Bsls4=;
 b=QnTbdaXMgi/fq4fu8DQFqLKLD3bqTFOdVLp5cFl3o6McK170dMzQj7fgLN4+TKSdHC
 X7CfzXr1gwP/wGu0HPClNAdzskUQJzj5ClZUBMpYD8CNTEzcW6CYLAMoWv4GnH5L5EOH
 B1Ts9O9/gOZjD/qfvf4o//9okeH2HGW28o/X3trfmMeUjoLq+sQVmDl1qeKB+5850RC+
 zAV5JKLPFxnr0g/Gu8irgVG0IBAsgL2703FOYyygLjXdVZYObBQ+IqF2C79QEv8E/L2w
 3gGBBFcXaR7YTCS9AEv7m4ijcrZ6RFZVEHmEnIN24Y8yx9icF0nQYjvxhU6nUaV6qVMk
 k8Jg==
X-Gm-Message-State: ACrzQf3bvUVIJ4cYHBle1Ja7Q6lylDN6WiSSUGER7tO4/d37H5nC92jx
 MZaubZFmKdvwb2gDNPqdTjVMBfRtwtN06/cP
X-Received: by 2002:a17:902:f68f:b0:186:9b98:8d8a with SMTP id
 l15-20020a170902f68f00b001869b988d8amr13975971plg.59.1667219649515; 
 Mon, 31 Oct 2022 05:34:09 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a6545ca000000b0042b5095b7b4sm4093810pgr.5.2022.10.31.05.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:34:08 -0700 (PDT)
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
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v6 08/17] msi: Omit errp for pci_add_capability
Date: Mon, 31 Oct 2022 21:33:10 +0900
Message-Id: <20221031123319.21532-9-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221031123319.21532-1-akihiko.odaki@daynix.com>
References: <20221031123319.21532-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1031.google.com
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
X-TUID: grkBn32KrAde

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

