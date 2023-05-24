Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2443753ejb;
        Wed, 24 May 2023 03:19:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4oOyJpabpRQCUKbUjNEH3euR4bTbzOWxoiARpWmpyNbvuM2TCqqZpWRoI4nZ0hA80DOTj2
X-Received: by 2002:a05:620a:914:b0:75b:23a0:e7ca with SMTP id v20-20020a05620a091400b0075b23a0e7camr7134787qkv.43.1684923579095;
        Wed, 24 May 2023 03:19:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684923579; cv=none;
        d=google.com; s=arc-20160816;
        b=C4n3QpWpgIykVmYJ/ShuH+AnN4uke0BvTAmaNowKdGcFhzP7fiwPosaNXbmyGrS7za
         OPHAVZoMZywNwHZmjnoTQW151VWUUZ4rTaeZyQ1u0JSHpWtMWNRW7e6QOWqrMFNa1BB5
         zQ8XYZqOR98ky7HwO8fRtfpbzmcbHoYI0CMAiwtuqvP2HQknezL/ktEGe5hrx2XmqwmH
         CErkuZ3QXce286sWgruIIXgVmzTxuaasyH9bbASVNxwhkO2LmlN4sUomRGVJ72yzTXNH
         4T3QN3kXTBB0aeI2lr1WekvLSvhJrv3zxhlBt754Msly6vNTh1KIjXtPa5+tm2qn14Ni
         szlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=5iCtZ0zw0D63rzvbOkNUh8jiYEVh9oIGUX5sYXb6FkE=;
        b=yrqj5Ffmzs/bznao/0VRNCbiRmXF7N7eoTcU69rCWNRebmdCPpGsU+gRjg1BQtqdHY
         C340ELSFp6f9xc5suJ6ZQCBd1+ivgdg2Crm04uqFGIxAIiDy/Gh3qBpXxSTiyl8tFBzp
         lcyX8zSKZsXYkQfvLR6HiEF3jQ0zzzjobX+U4Lln6D7dY5mE60hkzGCKy+Q47nEiEQto
         SRdszteZJR7Cc0HBzbKG4BLydJ0TCi7wO6UyT/PLE3JI2Clb8LE/S0wj5ThYqGPOQUND
         X6wlr7uLwz9FO1BBECuHRQ+wPB8p07ZWqvQYsxILjLlo5TN/UjYlwMX9aEnyALBM8kln
         aqeg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 23-20020a05620a071700b007465ee1d5ffsi6056851qkc.718.2023.05.24.03.19.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 03:19:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q1lZw-0003U8-Ej; Wed, 24 May 2023 06:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1lZo-0003Q1-3x; Wed, 24 May 2023 06:18:41 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1lZk-0006cn-1B; Wed, 24 May 2023 06:18:39 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id E34E5260287;
 Wed, 24 May 2023 12:18:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bsqOaSAfmlQY; Wed, 24 May 2023 12:18:31 +0200 (CEST)
Received: from applejack.lan (83.21.125.167.ipv4.supernova.orange.pl
 [83.21.125.167])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id B5997260B8B;
 Wed, 24 May 2023 12:18:29 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v2 3/5] hw/arm/sbsa-ref: honor "-vga none" argument
Date: Wed, 24 May 2023 12:18:21 +0200
Message-Id: <20230524101823.810737-3-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524101823.810737-1-marcin.juszkiewicz@linaro.org>
References: <e682f6d5-acbe-7910-54ef-4d75c88a3d28@redhat.com>
 <20230524101823.810737-1-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Rd9c2LutmiHu

In case someone wants to run without graphics card.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 hw/arm/sbsa-ref.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 9c3e670ec6..c540b2f1ba 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -649,7 +649,9 @@ static void create_pcie(SBSAMachineState *sms)
         }
     }
 
-    pci_create_simple(pci->bus, -1, "bochs-display");
+    if (vga_interface_type != VGA_NONE) {
+        pci_create_simple(pci->bus, -1, "bochs-display");
+    }
 
     create_smmu(sms, pci->bus);
 }
-- 
2.40.1

