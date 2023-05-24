Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2400722ejb;
        Wed, 24 May 2023 01:39:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6DuLhH3zw5Ile7Y48O7jVQKN9E153FS1qqXSrCL7A7FgpC/AOTFezDryfuJOI7goK7/nd3
X-Received: by 2002:a05:622a:3d4:b0:3f6:aaad:2b5a with SMTP id k20-20020a05622a03d400b003f6aaad2b5amr15791140qtx.36.1684917592853;
        Wed, 24 May 2023 01:39:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684917592; cv=none;
        d=google.com; s=arc-20160816;
        b=S1TcaFvp97J4qn8oDooBlc5R5wE10sngQoovE3wdUVWBmSf3ooIcoqYBfWldM/DPHG
         G3GJepUoO+tOSXwqoYd7e8RplA1cpeE+q9GlyEWBUjvZoX6LA/V4MxhYGr6cIk4yUZBB
         gwavARm7Mq5d80Mg7HHp38bmHi8gRGlmHOQ3R3o1EY3dn4hsTlJZWem0I7kuOXkc28ic
         /pUTc/6m3BsfmTuaheyMVqbG4rgMhhULXGYe5GA8z2bR3mvsLrSxUsHFTQ2B2phYaXQk
         4vDkMKhLTJY2hvqNtnzUcuj0Dg2LrHfQDp88G12gNIojlbx9Xs5TF+3sNxLIA45IZ810
         tAQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=RFl0lkku0rEx44cSL97n6ibaCEcLL6BIlhLypm/82Mw=;
        b=FbXblWypgt3x/S/0ppAYVfZWlDXSALBHZEL1TU1uXvTC9TmSyBZVyRI5ZtW+FYP5kq
         RQJoU9Pci3tvw4n4TfmZucLVU16kNbfUqwPCwKixbsO3uqTdcP5ACw6NPoE9hjWArXwy
         oywR36qC98z4FAo6N1jTlqMDMTLIluGSYdMgVXZXYzYGodpvHKJ5tdKIXm9TMJLcLWgW
         bcMT0DhjXq0p/B8RVcl+6JaeLNhQL5FJ0G+32azHR2zOhwjU9QFmM57sh0LAGlVu7w91
         JxpHgbOgPzKiIpbf/eSrmjXwcWE6sU536Jh06VOiodGLFJZ8Swgu6XpA77R6vLNyDuv2
         fP3g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n17-20020a05622a11d100b003f53a28fe05si6311903qtk.749.2023.05.24.01.39.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 01:39:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q1k1p-00059H-6d; Wed, 24 May 2023 04:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1k1l-00057c-MK; Wed, 24 May 2023 04:39:25 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1k1j-0000M9-Ca; Wed, 24 May 2023 04:39:25 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 2A307260BBC;
 Wed, 24 May 2023 10:39:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PBN7Kpnp3Ogx; Wed, 24 May 2023 10:39:18 +0200 (CEST)
Received: from applejack.lan (83.21.125.167.ipv4.supernova.orange.pl
 [83.21.125.167])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id C6B4F2602AC;
 Wed, 24 May 2023 10:39:17 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 2/3] hw/arm/sbsa-ref: add gfx card only if we have pci
Date: Wed, 24 May 2023 10:39:12 +0200
Message-Id: <20230524083913.696175-2-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524083913.696175-1-marcin.juszkiewicz@linaro.org>
References: <e682f6d5-acbe-7910-54ef-4d75c88a3d28@redhat.com>
 <20230524083913.696175-1-marcin.juszkiewicz@linaro.org>
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
X-TUID: JSASi7isu14H

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

