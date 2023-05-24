Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2443687ejb;
        Wed, 24 May 2023 03:19:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4HKrDH6eWkCgEw9QaeZFUEAo3jTqbKiBbqNpEqPk1H5jceQtTKW0AV2GlF4pKzK+dhelnJ
X-Received: by 2002:a05:6214:3005:b0:621:363c:ea8a with SMTP id ke5-20020a056214300500b00621363cea8amr25608047qvb.36.1684923571504;
        Wed, 24 May 2023 03:19:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684923571; cv=none;
        d=google.com; s=arc-20160816;
        b=AGNh6xHfeGzaGoiBGgahOa30TUkx+Z+yoccXii6BlJ1eW3pcX3qOM7dabL6CX+Ese4
         BpsLt5FkAoRUEr2Y/9+PO5zclInoWl7DJD7EC5cS0PdN9l3stXrGFqtNpOkMb0ZsD4r0
         3/1utuHecKZnQrPZxQh9k6VtNv7YiNBXi6ZE4f2kFBnolT1/sdZCjDCKeVrCUoUAlnTH
         gstExTp6DHTbp9fRUKYjm7YIHmkbaodRFjYx9lQoyMi7JfkB6IXuCCzs/vHWXkKDOshT
         oGm1uCGwtm0de1Eo5/dwjjjVKtsjLSdYBfA+m+xgotqgKrwNSY0akuEJkvd1KL1xUEf8
         /VAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=RFl0lkku0rEx44cSL97n6ibaCEcLL6BIlhLypm/82Mw=;
        b=tiXGeQIppolPB5sDsA0Cty+82ux+wYR760yA2atRBHQ1C1nhZMDeML+UAvECdu+BoL
         oU8DRNOBuUFCXo5EoGGVwe8gB0mgmMoUcz3vO/0J5TvLKvrhAQH/RMMQWUU+QvfMUIDA
         UP4HFCtYYk0POQPKzXXEYUq52rNWVFK5I00zIwnBMA0ZI9ggcAjw0OmsQCFP6HBbq+WY
         5KSkpXj/BdIU9q1DqNrAMXoRwzuWrS1TwAl0nXIGfEwAmaxSW7KMFEZESiN+/F8VuDir
         yphxCeoqDbIoPAaQoytZX8SUm2e4hvcgm4yjqreek/ZowDA8Ez4I5dLM6mMllmgFIpTh
         v2WA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jp11-20020ad45f8b000000b0062126d1ba0asi6526869qvb.490.2023.05.24.03.19.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 03:19:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q1lZx-0003Ut-My; Wed, 24 May 2023 06:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1lZo-0003QC-7v; Wed, 24 May 2023 06:18:41 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1lZk-0006cv-1G; Wed, 24 May 2023 06:18:39 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 3685C260B8B;
 Wed, 24 May 2023 12:18:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 79o3OUpz0qyQ; Wed, 24 May 2023 12:18:31 +0200 (CEST)
Received: from applejack.lan (83.21.125.167.ipv4.supernova.orange.pl
 [83.21.125.167])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 50778260BBC;
 Wed, 24 May 2023 12:18:30 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v2 4/5] hw/arm/sbsa-ref: add gfx card only if we have pci
Date: Wed, 24 May 2023 12:18:22 +0200
Message-Id: <20230524101823.810737-4-marcin.juszkiewicz@linaro.org>
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
X-TUID: 5E7rm8fd9D2Y

Creation of network card is guarded with check do we
have pci bus. Do the same with graphics card.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 hw/arm/sbsa-ref.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index c540b2f1ba..9a3d77d6b6 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -647,10 +647,10 @@ static void create_pcie(SBSAMachineState *sms)
 
             pci_nic_init_nofail(nd, pci->bus, nd->model, NULL);
         }
-    }
 
-    if (vga_interface_type != VGA_NONE) {
-        pci_create_simple(pci->bus, -1, "bochs-display");
+        if (vga_interface_type != VGA_NONE) {
+            pci_create_simple(pci->bus, -1, "bochs-display");
+        }
     }
 
     create_smmu(sms, pci->bus);
-- 
2.40.1

