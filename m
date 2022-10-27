Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp159802ejn;
        Wed, 26 Oct 2022 23:44:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Mg/14rkuA1g+L8DAyUs7bOCWqtrUlH/dxxdT1TUxfe5DA87OFdyQxicc59Rq7MQQc5p2W
X-Received: by 2002:ac8:5908:0:b0:39c:d7dd:14e9 with SMTP id 8-20020ac85908000000b0039cd7dd14e9mr40548572qty.623.1666853073314;
        Wed, 26 Oct 2022 23:44:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666853073; cv=none;
        d=google.com; s=arc-20160816;
        b=NQyWnSMOrN4uKdpfkpcHXgUxWqtlfaec2LpV6nY9FsKoKFAXqamXC1xbjjhYheCN1G
         xRcJbvBLxW7xub4OSRBF3WJsNtlUbuafOSwl06PNXHhGhQKTwH9n8fuH15ZZTtQrhM5h
         pxTaeuZ2ultphw8YkobFEL4yN1wunrovYyXEgeAdOb0s4KbKwWqXT2OrG8PG5kXbXa0Q
         pauLa10dhj4veiYokjnqk6jXwRA0pNUnP/h6FYEfEs1aF1r9AcRdz0ybFXzSyGRyHMPv
         4uAZIzax4yJ8GJ/04U1aGTW4Utnh4EJHx/rHrKh0XyeivS/Omserxjsd5cVe8RVAftio
         j7Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4pfSqCSZKPH6hPwzrQBqfV/qjUVeTCARV2Lk3Wi9/is=;
        b=PBeLDGHl2D0v1oI4Bo1gsOBM6vXYSHHhofIsXXYtvowjDabo3wktYfIxhSE2TrGbXT
         CqVDZsrY5wPSOFw0yELU2I8eeDrygiI1TlQwoiWZWJkt9EuMkm2RxyyV7HbZcsdpLdId
         Bp8dpIM6XKenD5pdVYRosSwaoxzKQp+XK6rgNveudBHUDg2pnc9iEa7/WrFj6/Ju5/WS
         JLP2npeeemoMP1wPt0Gto6QVKTQWDhOkWae5y2x5TMYgiI5MwFISKZm/URj5/R+cMmHB
         ib4DdBktg1zHBZkrXXr1Oh51kK+zsibNNsXG5TziuByb7/10cNjelKqeGcaJsh9NOriG
         y3nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=oa+sMtYC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gu9-20020a056214260900b004afa0e448fasi413773qvb.202.2022.10.26.23.44.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Oct 2022 23:44:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=oa+sMtYC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onwZ2-0004dQ-Bx; Thu, 27 Oct 2022 02:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwWs-0004Io-5j
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:38:19 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwWb-00039p-0s
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 02:38:13 -0400
Received: by mail-pg1-x533.google.com with SMTP id g129so389337pgc.7
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 23:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4pfSqCSZKPH6hPwzrQBqfV/qjUVeTCARV2Lk3Wi9/is=;
 b=oa+sMtYCPPIdYOb3AxhkEQ3JYuf6f+27kCUoninJqrYO7nDN7/CJwjNcH53e4D79Q9
 AZGsnzC4I6U2e/ud50t9RHw6u7ro9s2yu/HYUshpNNmn1lN57Z3JEsvS6vvvQws16KcA
 ptemUYV+ULHR4juqG12jx625rHr594s6ALG7lNWw+Oom7cBR2hej6oVRvjC7DQF/BE4V
 E4iQhb2UxQBX7kmeLhsNn1KUy5c5FMQhM3Uv1rhR9pVxveScneL8zWoOk/AIxlsbw0b4
 9Sv5MmcdsInXTOm+KLmQeDGil+/UbM7hu+MI1N7m4z3oJ8Bn8XiX8ow3WRwPLHGD469Z
 aCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4pfSqCSZKPH6hPwzrQBqfV/qjUVeTCARV2Lk3Wi9/is=;
 b=FUd7bMJyyKsWAnMvtMkELJ+uFFcJ9n6CT+KK9nxNRAnWFiMl8VVAxtmUOsDzNFhctZ
 ylmtwGMUO6igdgJX1qRzBv++U2n9cRG5e4FUrgX77fUyCvVqcCNAzG9WD84qbYZRmEQg
 Nw6b1ZMZfgK4dy3fNDghKmD75rjZ5aBlsHG5rdSqueVr20krHoPUOWXxcPIc/PXdMXtp
 YNFpUBrZ3xDgAzis1gYSFn4KNBJ+dWF22RejpoIS9B2f2m5RBxib47r4bznWpZvM5Fot
 FepyYggrltuPiVcmJ7oof3euAJjgn6tYlp7yEGCa675+AOIiLHrEyYsHFk+pMKMh0bu3
 sNmQ==
X-Gm-Message-State: ACrzQf0vr4j8FPZEBnhNwRJV7Cf7SEd4OkNO94P2sYBK8fiQlTozevQ0
 PoKRW5Ln7Nr7QZ9TRpVVpSK+CQ==
X-Received: by 2002:a05:6a00:b86:b0:56c:349f:5d4a with SMTP id
 g6-20020a056a000b8600b0056c349f5d4amr10410866pfj.72.1666852676396; 
 Wed, 26 Oct 2022 23:37:56 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 z17-20020aa79491000000b0056b818142a2sm448872pfk.109.2022.10.26.23.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 23:37:55 -0700 (PDT)
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
Subject: [PATCH v4 08/17] msi: Omit errp for pci_add_capability
Date: Thu, 27 Oct 2022 15:36:56 +0900
Message-Id: <20221027063705.4093-9-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027063705.4093-1-akihiko.odaki@daynix.com>
References: <20221027063705.4093-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::533;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: F6759gcEcEPs

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
2.37.3

