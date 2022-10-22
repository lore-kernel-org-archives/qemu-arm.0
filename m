Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1702223ejn;
        Fri, 21 Oct 2022 21:55:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6LzVHNpkLPnVrMSFYp13QTWWpsv5RdHQHLE1ecExtLzaJYlXZ7iHuAe1jXsN9Rs94fXBFg
X-Received: by 2002:a37:b885:0:b0:6cf:4bb1:f056 with SMTP id i127-20020a37b885000000b006cf4bb1f056mr16598244qkf.167.1666414557983;
        Fri, 21 Oct 2022 21:55:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666414557; cv=none;
        d=google.com; s=arc-20160816;
        b=ATXsq/G0ChmglUS2lgj+9ZfnpXqtx/+v8enPG0hD0Vkg2g+H5m+BtJBQlDVy+7kWag
         KSsnmsCb38SpYzPC4YylHWyXNrdFFyA8hIxk2ETMZpVcB9mUazeGVEsDniZ49r0iE2NM
         8ocr/FVeWLMiAwURqWGwLi1CUY6HGReStDqrzfCjbdt5P+wLdoDKh56kAzQGzk/bH3VD
         OIG/U6VL64X7dMfw4aTa+pdrQ2kGC7ArOEnGjYykw5X73x3aWDdbHCDFPOi38WlSLbWi
         hMMjMXobiseUiL7yEgA2hqJN1SCoSlr9PB27D42+bylOfGUupWWttlA5gLgTnvQl012/
         YtFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9SeCwLTdTT2Bw5AILxPJaOeyCAlvYtbi/crdSeALVqg=;
        b=OJ+Uup6tYn6b3suHf2wvI7/Ww4+fkj35dYPHJ0IipqrrWuHp8Vc8qB4nU2g/CXW/2y
         7cKJdhD6nRIBScuZ+m0L+AjC9IPqjmSNcXXDzUSULJktx4HJY80JbfCFKlM7ugYUupGx
         z+spSUAnqUk1/Ga+2kgVq7Pk6Whe+PihPi+P6e230AUkenxJqfuc0HERK8nmArxdAXOw
         5wbfd0S+0zlrbd5MVuESPMqR1SB74+NqydAy6IIHVnblaAqlV8hR7TvTH9xDImWHKfTs
         xk6mKPcX4u/LR/H7T53SRCsRgNne8Lo4fVPDViL6se5/cGtMTLR+icl3qtuhqdfYIn1H
         yTjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=VYPDJftx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m8-20020a05620a290800b006bc1b18328fsi14792121qkp.16.2022.10.21.21.55.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Oct 2022 21:55:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=VYPDJftx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om6KA-0005O4-VH; Sat, 22 Oct 2022 00:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6K8-0005MO-Se
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:41:28 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6K6-0003hP-6V
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:41:28 -0400
Received: by mail-pj1-x102d.google.com with SMTP id h14so4038101pjv.4
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 21:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9SeCwLTdTT2Bw5AILxPJaOeyCAlvYtbi/crdSeALVqg=;
 b=VYPDJftxt8oHr4Laz6QF1SvaYZGVZtHuUubiyv4wY2WQ0VECexmShMOgLwQNVz4VwZ
 I0gE/nMeD9T1lomdrA88mxe0KRbMQ6gbSUdrQzEPQJmR4fg7jNYM7UaaNVyuQkRIVyWF
 ORXDToIb2zV86e+Vuas0UUyYCOLMBygW6CqxsI0yXeS4ACZh+m8GLnp4Gu8r7m27/rSV
 HOvQlxZrujAowcbf9H5UCGwBcCVowPp98hojYEGsm2wuDRMSzjdOWnsl/uqMHEL7WYdH
 9qmUoZyJVA9/2oU6XNebUd31sIi6dGEoLO6/gLJ0FkTzIEoeP0OT+tQ+oArnhlb3pjhD
 zV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9SeCwLTdTT2Bw5AILxPJaOeyCAlvYtbi/crdSeALVqg=;
 b=76MW9gxnc2Ncg59gQHVff+6reQCboykVdLC75zlhs6eM+9OXehkqNTyuhgyQbFImi5
 Pmu79l1P1nwVYPaiOyRcjB/89Tp3P8rBaV+/voaWv4OwY26JWxP2OFrVBlcbtrWfP46R
 nWLNZg//I6V80dbwkxXf6IljXwH1T2du+83c1B/iLdAuRMgPNFtnf9dGNhU+3gLIWFMK
 eMXwcea/uwOpqZRP3+pSJiQH+qanTLTwrpxLM7UttqAd6qcbfhFvWMqC6+L9xTmAGLj7
 l4AiKCYHiDTXbQJkSyR4Qhet86Gk4LshqRsoKXGO1fykucF9c83+JANg1G3tALdt8Hd+
 WYHw==
X-Gm-Message-State: ACrzQf3v5T/qRIDPRJkTzeqOMA6xufGc/muIcD/IS0k/ktmZlcgU/4yH
 z6BV40L3jTPJ0/Nknmh3eDQ4xZDg8dBiJf+e
X-Received: by 2002:a17:903:2691:b0:17a:8f3:bef0 with SMTP id
 jf17-20020a170903269100b0017a08f3bef0mr22650775plb.17.1666413684838; 
 Fri, 21 Oct 2022 21:41:24 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b001868d4600b8sm178049pli.158.2022.10.21.21.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 21:41:24 -0700 (PDT)
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
Subject: [PATCH v2 03/17] ahci: Omit errp for pci_add_capability
Date: Sat, 22 Oct 2022 13:40:39 +0900
Message-Id: <20221022044053.81650-4-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022044053.81650-1-akihiko.odaki@daynix.com>
References: <20221022044053.81650-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102d.google.com
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
X-TUID: tzLCqzqHk2EF

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

