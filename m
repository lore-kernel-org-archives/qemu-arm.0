Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp1430330ejc;
        Mon, 31 Oct 2022 17:59:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4wpqFOY0vHnKH7hJTdfvPKY8qibE0FRaHEdlPGDWy7/SbFzkTlp1HiJfX90XavSOU7kOn3
X-Received: by 2002:ac8:5c07:0:b0:39c:de84:64ad with SMTP id i7-20020ac85c07000000b0039cde8464admr12909121qti.336.1667264395604;
        Mon, 31 Oct 2022 17:59:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667264395; cv=none;
        d=google.com; s=arc-20160816;
        b=YwUTcwr340TwuMn2r785CdWM/nYyAREHjuj43Kblx1nqdtdm86JaF7auNV+oyLbZcY
         aypPDQukVTbGM3v/9Uo3qisLRjJIShVkAPLxCPzeU68bDJRSHrBQvQ4ghs6sJvB1+ccy
         eUAsLd01yUrBizpYR9IAkprA9Sv7Z4UTKdHBUg/s06HsSnURSn3bKIpGYY/9ygGpKOhZ
         3CZvdHUwlNdmvhA+aVfsKJsgOfvxgMH0I3cEAF0NphaDcTYTVmPOxCQGtKP8e/Um8+M1
         nBUdJEjEUje6qh3wnD127gpGUIwA5jWLUCyRu5MWJ90iFSVXL+62tV8SGkHxFqy5GAKy
         JvWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jJjPRo2jnYNBTT+kAOkS5uMVCK0dMEO9iW4TvwZKw3A=;
        b=F76xqwUqoAVi1sCC3yeqe2Z47XrXQSph0IJE/ORbZKH3fihi8eX4SECVOee3oP4Qey
         M3CncRh4m5Br8SvlIXlMs+m381vG85ubKPoqhfG3Yhb0DhPrXgKuPsWCHzVih48UKnGK
         Bwi57GrImAcfGabyueAjDhpXPzXk684iWKL8Q2xQtNnDOJQYuZBg+oEsSG4/wUWvI/Et
         Ygbte+twGZNsQtE0Rs92W/+bx5diq+Cu1Irz+ZOb0xqNL6lxiGkbtJzoEPMELISjvdxi
         JDWuJyBF6vO4mCF8C2YgHOS0GXCYtUvU3gt95lDIqXTgYYQlWAUfsprdt3h9Ms/VxTgO
         ldlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=NUJ2c86K;
       spf=pass (google.com: domain of qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v11-20020a05622a188b00b0039cf9855ea9si5286767qtc.491.2022.10.31.17.59.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 17:59:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=NUJ2c86K;
       spf=pass (google.com: domain of qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opfcr-0004L0-3q; Mon, 31 Oct 2022 20:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfcq-0004Kh-09
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 20:59:32 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfco-0005el-J4
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 20:59:31 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 3-20020a17090a0f8300b00212d5cd4e5eso17438888pjz.4
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 17:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jJjPRo2jnYNBTT+kAOkS5uMVCK0dMEO9iW4TvwZKw3A=;
 b=NUJ2c86KAf1DvwqIIo7mBXJMgXqo46/vcTBbHVM/KSSj9x10BOxyzfseGFg5/CDftK
 YDd3qlN3wikr1nZYTLwEQkAsr5k5Z7plJGvdprI8+SGf5ei6QdR0krKd0ULUj9n7JpMP
 CMp0F5umsIstA1lXq6eyG/FJghpnspMp3CYkQjRHtnLiy5UeYxrNbzm4g3c5Z8tSeAP2
 wm0cAxIdy3q5Z/hxxUhYOqKvPKZaUurG8zoL5lMp3p0+EJndRQ5YVwOpXnUmJNktKovm
 V5hmuNCRjfKGHNWIhfJlF+cEg0jj4lNFDjtmH0CdsGsvt2+Wlj0n/nK5exYjJ3AZBNFU
 ZhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jJjPRo2jnYNBTT+kAOkS5uMVCK0dMEO9iW4TvwZKw3A=;
 b=SFhTbYVRJpbEPUWQe/xUchBQMrQef6dDpWy81B8FYqQ4TUrqPJmGnWnAEM+19dfLCn
 +31S0t8Kg5IgGRSdynwnsvPJC+7Q/DTfcmgEpQt3II58YMyFDOmYharqP1SCYOXpU/Wo
 OD+ZMWInpR5cI+tOKEltje0YmdSycAGG4FKaHMhqfJP5gZWQkTZWK/bR7MUTS+8/4tU+
 xU4GF6WCHC7m1/zDcuhQBt9aKPTOflnGQgZOrE142mbEA5DfTNn82RbZCtfHHU1wq5WQ
 gKI84ze3ECROGECNw1nofQBWldauwtrj7R3CtLJQhDmH39dPP0dtNEF7qVzk1zTB1MqC
 RJtQ==
X-Gm-Message-State: ACrzQf1Of+kVPkdPqkSY3xp8benkR+g27rXPbnpb+Z+1wBWsPZtGvG0S
 lVzLjglt+JkG7g6f1+AmHTaVnQ==
X-Received: by 2002:a17:90a:6045:b0:212:fe9a:5792 with SMTP id
 h5-20020a17090a604500b00212fe9a5792mr33810394pjm.178.1667264369199; 
 Mon, 31 Oct 2022 17:59:29 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 o9-20020aa79789000000b0056d98e359a5sm1875644pfp.165.2022.10.31.17.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 17:59:28 -0700 (PDT)
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
Subject: [PATCH v7 04/17] ahci: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 09:58:46 +0900
Message-Id: <20221101005859.4198-5-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101005859.4198-1-akihiko.odaki@daynix.com>
References: <20221101005859.4198-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102b.google.com
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
Errors-To: qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: 3opc7aNMFKsT

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

