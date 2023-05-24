Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2400978ejb;
        Wed, 24 May 2023 01:40:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4isfaF+Kx8RpG+RF3moHg6VO1fvLpv0JtMgtiMGhftxMKw7RRoAxcPIhAbmb0MuqEQS9ZY
X-Received: by 2002:a05:6214:1d27:b0:5f1:6a6a:f566 with SMTP id f7-20020a0562141d2700b005f16a6af566mr28125117qvd.19.1684917628524;
        Wed, 24 May 2023 01:40:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684917628; cv=none;
        d=google.com; s=arc-20160816;
        b=FygxxC0XvpqSdG+El0/NnObxzCHBcl79QlzqQBmneDOB8VR6CcR/po4ScMKX5Motit
         u5MgGuyr7d43q/QVuGYVIF9BKE0qLw752pK6yjSj0M13g8u0rzN3bpIM3CPiwNn0Iu7t
         zynHFw3intyFJPFE8CVYJHAwZeprm70MP+mJVyDoKVZHEwkjXnoFDrkcjtTNG0GuVTE3
         r/oWrJBK5SoIyov1/HMASEqEU7dtb7ZnBuKUYbWH7a+lMuyuObsiQ9xx+XUGJbqR4bxB
         TGNJQYr2kEPZJ2UhB9IQpjXiLckN1KH0/p+aN2eAikaEd6tap2CrkCzreRaMDP14H1ZO
         awRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=5iCtZ0zw0D63rzvbOkNUh8jiYEVh9oIGUX5sYXb6FkE=;
        b=AhZp+s5VhNZKe4LTYfzmaMFC8cHbnPwECyrXTNt/3r93epdjIYc2g4yiTQUyCNUWDO
         RUmtm/qjDxuhs0hcQEDoVtjLKiIU1xIQPvNc4E29BrCEd+4RAtiniGQuxkChnCP2oNTz
         g0JRlRCYm4FMJUBSZYuuaHVWEiVn6yQdE8X1NNrP12G3uQzYL6HNTl2Sr5xxgJ4Wujre
         +5UXUvY5J3bnq3dEiPfj8sm093OxeSzkqjZwH9lWNwtTOiyHXfOQ4x5ktQa/ORgRwMiH
         FjDPT+kUSAYG/tl7eMcB/o0iGiYTYqU8X93O3tqm3ulSdEJcH8Ixf9RD2uVfyQqKI4Zo
         A8WA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o2-20020a0562140e4200b0061ce1dc98f5si6295717qvc.63.2023.05.24.01.40.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 01:40:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q1k1m-00057q-Fi; Wed, 24 May 2023 04:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1k1k-00056R-UE; Wed, 24 May 2023 04:39:24 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1k1j-0000MA-C6; Wed, 24 May 2023 04:39:24 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 4AF942602AC;
 Wed, 24 May 2023 10:39:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r4NjRbBBMfsa; Wed, 24 May 2023 10:39:17 +0200 (CEST)
Received: from applejack.lan (83.21.125.167.ipv4.supernova.orange.pl
 [83.21.125.167])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 2565F260249;
 Wed, 24 May 2023 10:39:16 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 1/3] hw/arm/sbsa-ref: honor "-vga none" argument
Date: Wed, 24 May 2023 10:39:11 +0200
Message-Id: <20230524083913.696175-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <e682f6d5-acbe-7910-54ef-4d75c88a3d28@redhat.com>
References: <e682f6d5-acbe-7910-54ef-4d75c88a3d28@redhat.com>
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
Reply-To: 20230524082037.1620952-1-thuth@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9AopOIZFZnNn

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

