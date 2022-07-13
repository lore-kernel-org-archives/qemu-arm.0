Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp368935lfp;
        Wed, 13 Jul 2022 13:47:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sB+alWEkm2lqV+YEjURDFqWqmHHCAvQIAj3woeHv5A210Sm9sro3wh92r9bAgl92VdYVdA
X-Received: by 2002:a05:6214:20e9:b0:472:f2bd:3f7a with SMTP id 9-20020a05621420e900b00472f2bd3f7amr4945209qvk.20.1657745269325;
        Wed, 13 Jul 2022 13:47:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657745269; cv=none;
        d=google.com; s=arc-20160816;
        b=0+k1M2/jzSJNXfwJs8pckRUmyBZptidIhebtNJRJa/i/awO03vbps4ofwq6ESBd6F9
         I68676hBIisRlWeUBI/EEeNoSse4CSp2lk1Cr7zaHO/IJEDRO2DuciV48zNlf4vee1tS
         1VEhbdpRYBwxFdbrszo/F+k9+4bSc1T2OWqsnfADcGKYDpZ3bkpa/jeG3X9Ou87ZZH1s
         fg7Lmqa5IBFrYB356TURo/zvCzV28Irvfd16ENsmOFpSwTP+gt5p9KJ4nLJ4GBpji508
         otiQFGtqWY5gJalTfcwTB1N21aa5ODAj4L4aWv+isqofAHCdXGngeJBPwRtVVyZfEMUp
         xPAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=NpLSOwnb1opwEj5sRdHHb+Q4I4C3joh/XBqUSeW9Bf4=;
        b=n3z9VIfl/d+PcMvyl4HCnVsrabCW4bO+UL1DXzMqtpyoU1dHzWwmSmQH11kEIGzbd8
         b5OpKXi5XyGfZ23DOCPqqmLbmelKmEcnl5PVHYraYI3DPaxdoEyfmkqcC89GCX8KE4fH
         kQZHNO+rXh3ZD2X4f3aNtcMol4Sw//o1aqR9UzgTB/4r0W+JxeI/Cy/TQCj2mpmpPnkx
         lLUpGsuES3VAL1ySFtVtDMsFiK1zIreVarZJhsnzuZJQpjm4MxfHt9iW5RgF2nzAvNOf
         UASan+U6x9LsjuAFawC2o6t9BHpqQM+LSte3rNDmsGijlCQgnO2+8npY9RRgATxAsy7l
         /KGg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11-20020a05622a064b00b003066cea1912si9556243qtb.354.2022.07.13.13.47.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jul 2022 13:47:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBjGu-0007SM-SZ
	for alex.bennee@linaro.org; Wed, 13 Jul 2022 16:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@codethink.co.uk>)
 id 1oBfwT-0006dl-6R; Wed, 13 Jul 2022 13:14:29 -0400
Received: from imap4.hz.codethink.co.uk ([188.40.203.114]:38714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@codethink.co.uk>)
 id 1oBfwR-0003CY-Lk; Wed, 13 Jul 2022 13:14:28 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=rainbowdash)
 by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1oBfdU-003M8o-18; Wed, 13 Jul 2022 17:54:51 +0100
Received: from ben by rainbowdash with local (Exim 4.96)
 (envelope-from <ben@rainbowdash>) id 1oBfdS-0009kn-1k;
 Wed, 13 Jul 2022 17:54:50 +0100
From: Ben Dooks <ben.dooks@sifive.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Jude Onyenegecha <jude.onyenegecha@sifive.com>,
 Sudip Mukherjee <sudip.mukherjee@sifive.com>,
 William Salmon <william.salmon@sifive.com>,
 Adnan Chowdhury <adnan.chowdhury@sifive.com>,
 Ben Dooks <ben.dooks@sifive.com>
Subject: [PATCH 3/7] pci: designware: clamp viewport index
Date: Wed, 13 Jul 2022 17:54:45 +0100
Message-Id: <20220713165449.37433-4-ben.dooks@sifive.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220713165449.37433-1-ben.dooks@sifive.com>
References: <20220713165449.37433-1-ben.dooks@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.40.203.114; envelope-from=ben@codethink.co.uk;
 helo=imap4.hz.codethink.co.uk
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Jul 2022 16:45:07 -0400
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P4sXGk1+hUCx

The current Linux driver for this assumes it can write the 255 into
this register and then read back the value to work out how many
viewports are supported.

Clamp the value so that the probe works and does not cause memory
corruption as the value is not well clamped elsewhere in the driver.

Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
---
 hw/pci-host/designware.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index d213d7324c..6403416634 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -345,6 +345,10 @@ static void designware_pcie_root_config_write(PCIDevice *d, uint32_t address,
         break;
 
     case DESIGNWARE_PCIE_ATU_VIEWPORT:
+        /* clamp this value, linux uses it to calculate the
+         * available number of viewports */
+        if (val >= DESIGNWARE_PCIE_NUM_VIEWPORTS)
+            val = DESIGNWARE_PCIE_NUM_VIEWPORTS-1;
         root->atu_viewport = val;
         break;
 
-- 
2.35.1

