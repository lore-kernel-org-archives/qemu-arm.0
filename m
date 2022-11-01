Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp2033653ejc;
        Tue, 1 Nov 2022 10:05:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM51Yd9MoKrz5RjtabamhT48TP1H2xrPWweSWrHD97OV5T+VnWhVvkFF7tP9RqM9g7I1lQaJ
X-Received: by 2002:a05:600c:4ed0:b0:3cf:7fb1:e1ec with SMTP id g16-20020a05600c4ed000b003cf7fb1e1ecmr2615171wmq.181.1667322312105;
        Tue, 01 Nov 2022 10:05:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667322312; cv=none;
        d=google.com; s=arc-20160816;
        b=zHFzu9RzHodKCtKEf56uU2SxSuecAK1KbSjoFFpEXUgqks5aRUS75kvb6hLQqBvWkk
         H/wjp5uZ3PdaUeBpRSgU2gkVArm0fg4lXPV1091AtBdw+pstW2+9m3GW7w4TfFljQsdy
         GpLyl530Swyf2fruYa04aMgIeD8hBOMpea153Ax07qiYju4LLqfG+X6aWCNT95hMhbbn
         dhvBuCCt5z41UmJaFM0xJ5j+TKlBmMr96f/CMpsw0W1TcEbKxlJSbBLXcIsbL08EzNmv
         yzPc+4Yk5NNq6JJJsvnytlMWMPn27AWdvTBiNIsVoXrMrE3XNokBmqPh7QhuCRxhbOOt
         Bjjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jJjPRo2jnYNBTT+kAOkS5uMVCK0dMEO9iW4TvwZKw3A=;
        b=A/Fbwa8/LDpfMvK44vIfB9wZbviQH+CtHRfVLc/U+D2JsiwnESX9lkQB8YSZHeLeG1
         UMZ/+nYmd+5gNaDw7MHMquhb+zFE0lZhJwq/gw35GcaFe1mxsf/oUrabLtAKi0T+5QJZ
         ilXkE1yg0vxAa/bsJuKFr7qFPMY30ZdJ8ahl9mVw4CoQ0IG/L7VwWkiaYa8P0wXoiuG5
         x0XTcuNHDZ8l31Azhuc5y2+6jC2glMehO7NYqUIuJJbXonNdrmFAyRBLdUYl69LcoAOk
         8rB8mTsfiMV1JXX1ysMYCc7YhIXxTLkDpL64yHZ6w5bGcc0GwZ3ru7hZuktytrioHHLL
         0PUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=bRB5XjY4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o9-20020a5d4749000000b0022cc157bf08si8021556wrs.260.2022.11.01.10.05.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Nov 2022 10:05:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=bRB5XjY4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oprmd-0005nT-IV; Tue, 01 Nov 2022 09:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprmZ-0005mn-5t
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 09:58:26 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprmX-0003tc-Nl
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 09:58:22 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 m6-20020a17090a5a4600b00212f8dffec9so13029550pji.0
 for <qemu-arm@nongnu.org>; Tue, 01 Nov 2022 06:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jJjPRo2jnYNBTT+kAOkS5uMVCK0dMEO9iW4TvwZKw3A=;
 b=bRB5XjY4lQBHDkiv+auw3OjDrKlMXgjIUsRmMi5+wF0hFOR9oMG93qQ+xH6qoTOmic
 DB3TDR9377mw3OIbmdgbDBrhGI4zsjQKCEEgk2HJUKLrN4TE95e3RFYOa/MxIeRjnpEk
 UJ+kueecXWjcQO+09daV4EOqnXXLgluwHloDc1kpUTf9gvJuVtff66TJXcpB3Jfht8ZI
 tQ4d/FIJ3F16wMpMR6JHL62kH74FOESLmiTkZiuDAuQeOAhRCb/mJaQC5NkBuvxR0xbv
 ol/zx+8/Z6PqPLeyoZ5S5c7XcVZuzB4UFdppWu4Ejj6O+9FffTi4twnb14IJxKcvh5NL
 kyQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jJjPRo2jnYNBTT+kAOkS5uMVCK0dMEO9iW4TvwZKw3A=;
 b=Y9ZNcymSJgpXakFiaJ/y42DUhAKG4GMinZeyukcz2kDbfYl9f4TL+X9edqPkldXKlb
 vuaDlXSSmBZFV30RRCMxJ4vBqfx0subfJkqvVhMYQAhAS69GfuxCKOfZ9hYkZ0s9I84h
 RB6+Y0oZRw79mWw1O982bBZ1fuHM3EiDExlaV7AT1/2jk9cJjLPJiG26VvcaRcTcuAWI
 8+VKd9FIYn3M8j66nqGR6EVxDP+oo2qz1LKGhdS4veEkVsDEIxfl0cJ8cm58WNfWLJHY
 m7II4IzETBxxXON8m2fSgXBrEldBEGpbE/f6+6h5s9WwMhERXs11A4ziOkfzQcP/ZF8i
 ULrA==
X-Gm-Message-State: ACrzQf0P9WJxhvdjedPDBA+dsZxW/f86F1JW6zn0NIBUPAuhO0FyjSWU
 LP6bAjU6Bly4d1R/yiqnJUQ6pw==
X-Received: by 2002:a17:902:8e88:b0:185:3cea:6335 with SMTP id
 bg8-20020a1709028e8800b001853cea6335mr19734673plb.96.1667311100429; 
 Tue, 01 Nov 2022 06:58:20 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y4-20020aa79ae4000000b0056bdc3f5b29sm6510722pfp.186.2022.11.01.06.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 06:58:19 -0700 (PDT)
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
Subject: [PATCH v8 04/17] ahci: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 22:57:36 +0900
Message-Id: <20221101135749.4477-5-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101135749.4477-1-akihiko.odaki@daynix.com>
References: <20221101135749.4477-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1036.google.com
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
X-TUID: frrsOpCEuPsw

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
2.38.1

