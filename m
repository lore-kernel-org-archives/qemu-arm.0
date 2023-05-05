Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp367615ejq;
        Fri, 5 May 2023 05:10:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7wP+OoDFHRDbB/rzhL33kx6ygtYOQutifFvSSQ8S4RTyu+Y5cwo0LK4zZWRw8s2f7bsVIW
X-Received: by 2002:ac8:7fd3:0:b0:3e4:e8be:c3a4 with SMTP id b19-20020ac87fd3000000b003e4e8bec3a4mr2086960qtk.56.1683288612724;
        Fri, 05 May 2023 05:10:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683288612; cv=none;
        d=google.com; s=arc-20160816;
        b=xejqp5dlhBQ1vbe/kfmIiAnelBxGw3r+EmKPNfyjDa8A2s2HFXcffXwM3b4aLeg+QE
         wsxHgZ/9oz4jy8tRwcn2ZhG6SxuBN94kkWDaSAxVDAwMxXCVCQSuIQDLGzhfmdm9sfpL
         H06HI/eqrn+mq6/sKmgUTyMjjoBsFuFVj5z1HTUhLApgNmAVauh0KKMVWwLsMhO+Zdcn
         5YcvGWLa4LVqFD2J2jLkjSfBKAzD2T4IcwJ7uoYQuQE8zz1aXYGv7rfPZJdDuayn60DO
         i55sVF4mNW2kqR9AlUBWpNp1DRBJsL4BK2s6cgf5kmhVhJFdqOEsKp3CKL8iBNMxKGV3
         kr2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=5UCWb14JBdbvgw+gAeZW5Kx5+tpPk2KD434xYAWdpTc=;
        b=kVL7tzmJRZdSI92VmJAbBVZ8A6foBJpbSUieXqudq4b6AKCgLRSsNeeoAg9Cd8XNLe
         E+pHv9l0+fyvIX50vlXgccNVuasw/gpa3gKWsv9PKP/04XIiqHbi2/Af2FWdcGdNrEk8
         BWdxofQ/1Rl7S6LdwAi5Vzrs7WdM2II4kXsnODMmK2hCyhixn46Zbbix1Dw3srZDJvsa
         //JtlxXl3tdASS/DIsTz4m5jXUcqAUGopITe6GUIM7V7w+SAZ9FcuM1KUQZPIpCBBfJw
         n9/hFydCrRGfQsc8HtuQs2zuQJ+m0KSeQ2SMsMwhd9f7czWpPIBNWHQ5eXAvJ0/bJlPt
         henw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d19-20020a05620a167300b007469914cd5esi569943qko.596.2023.05.05.05.10.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 05:10:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puuG7-0004xL-F2; Fri, 05 May 2023 08:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1puuG6-0004vy-Fd; Fri, 05 May 2023 08:09:58 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1puuG4-0004PL-PO; Fri, 05 May 2023 08:09:58 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id DDCD72609C0;
 Fri,  5 May 2023 14:09:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4WBfUddEDb9c; Fri,  5 May 2023 14:09:52 +0200 (CEST)
Received: from applejack.lan (83.11.34.59.ipv4.supernova.orange.pl
 [83.11.34.59])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id BF5242600D4;
 Fri,  5 May 2023 14:09:46 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH] sbsa-ref: use Bochs graphics card instead of VGA
Date: Fri,  5 May 2023 14:09:36 +0200
Message-Id: <20230505120936.1097060-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iHkdiRwGlpsF

Bochs card is normal PCI Express card so it fits better in system with
PCI Express bus. VGA is simple legacy PCI card.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 hw/arm/sbsa-ref.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 3e3671f66e..0ace0fcc35 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -679,7 +679,7 @@ static void create_pcie(SBSAMachineState *sms)
         }
     }
 
-    pci_create_simple(pci->bus, -1, "VGA");
+    pci_create_simple(pci->bus, -1, "bochs-display");
 
     create_smmu(sms, pci->bus);
 }
-- 
2.40.1

