Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2447554ejb;
        Wed, 24 May 2023 03:28:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ40XHRcNrJLVycK/SmZc9UjCMoyPwpsS5g07Ec6hJQ9+1JvfAcnojiDo77X/uEuIyb5yjKF
X-Received: by 2002:a05:6214:27e9:b0:56f:796e:c3a5 with SMTP id jt9-20020a05621427e900b0056f796ec3a5mr23557695qvb.4.1684924107414;
        Wed, 24 May 2023 03:28:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684924107; cv=none;
        d=google.com; s=arc-20160816;
        b=Vvgo9jJ+cCTm89iTk3u8IOvRvgBgiAwk4TqiMC1rFFbavZ69i6tGUjpXGMn5aZWtof
         0SyscKqeZpxr/qbCF9DJPxIXIF6m6/SBz6ZEoK5rds+2b1p2JUJ3Vf9MwlfZ4Pc4qRZu
         KzCigsQXE6McbCdCHWVXL5sZClqrMfgJVvtbNHZsOkbbHkjCxFGJA7QXKL9klMm9f64l
         QduCzsyPljLWliVstzKrwHHeUO5qK+Lf7k8LR4JHO2b6haDi0J/LSQPACaQk34JP0+K1
         CxYV2mbkRP0kZNHJg/VSKolcSN3plNzr9yFFEbKvXRycmJdxip9h0giQr9tp81Leo05W
         TulQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=5iCtZ0zw0D63rzvbOkNUh8jiYEVh9oIGUX5sYXb6FkE=;
        b=0/I3zsis6zj086sRvPnwI+az57MLQVXy1VVQZ5IwJ0rcJFUSwcAqk+feYp/ArJHBiJ
         1Po7CnR0aEeL4/+5LBtbj91NgpE28Zf1Z+Jxt+3UtVfaX7Hm17raZwN95o4iBYROR2uj
         O4MXIV2V/bZxmHSK2SfOLYVi8V/4kdy/bQ4w2BVwULryMuMiu5tkGzTLEvIJZCkUpYCq
         q4QdSgGx7Q6pUUX+1guy3JS6z1hD+SYpkqMB4+B0S0VwnlD5Bl9AbalTjkQ3vBzmRKW7
         vbcBA51PWuC0YFKs98y8SDn0zxDMRM4KWpGJMzjB8SW5zWH8aAHF7XY/Hx7CzzpRF/rf
         o+Og==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pn11-20020a056214130b00b005e05935d813si6368957qvb.593.2023.05.24.03.28.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 03:28:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1lip-00082e-DW; Wed, 24 May 2023 06:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1lia-0007r3-1H; Wed, 24 May 2023 06:27:45 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1liX-0000Od-RA; Wed, 24 May 2023 06:27:43 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 5A4BF260287;
 Wed, 24 May 2023 12:27:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fBbqNbJIHXzZ; Wed, 24 May 2023 12:27:36 +0200 (CEST)
Received: from applejack.lan (83.21.125.167.ipv4.supernova.orange.pl
 [83.21.125.167])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 68AD8260B8B;
 Wed, 24 May 2023 12:27:35 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v3 3/5] hw/arm/sbsa-ref: honor "-vga none" argument
Date: Wed, 24 May 2023 12:27:27 +0200
Message-Id: <20230524102729.810892-4-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524102729.810892-1-marcin.juszkiewicz@linaro.org>
References: <20230524102729.810892-1-marcin.juszkiewicz@linaro.org>
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
X-TUID: eDkAF2XBew16

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

