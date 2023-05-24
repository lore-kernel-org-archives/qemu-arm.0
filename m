Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2447687ejb;
        Wed, 24 May 2023 03:28:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Ju4xDkzX9lO/gN6NhkZlsxCdNqSbqG6YOTBJmwjGL4N6xJ3Kyey5anGCLkV16Ra42psap
X-Received: by 2002:a05:6214:27ea:b0:619:a7e3:99e2 with SMTP id jt10-20020a05621427ea00b00619a7e399e2mr27667023qvb.17.1684924129374;
        Wed, 24 May 2023 03:28:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684924129; cv=none;
        d=google.com; s=arc-20160816;
        b=t9n5H/GZ+evBxaYw7dLTEdOiDt0yiC2eSohMz53XY5kgBQhlX+TpyCTlv0DHN0FNL5
         fTxFY2oWAysFd/aWIcIsnMoeIJ+gRzAr5uDlXVnePLz+XEyk0SgsWgingJyQhjwNMZva
         ErUsBaOkAAVGa9pgBmp9Nwg+/RZ5UKo5J0oeR7z0bn6eMQtbQ5ZdgWt5cZjZB4fYVRS9
         6aups7VjwXbaEBQuHP9+JwaFcJBgzRxW2b8Nh0Z/MZRHiWUDio0WZbsBu2dPGO6AnyFd
         7s6bnA5WzEdKcTFqz0T0VQATGlay/waP30umNgB4rLmewrPzrtSFz+5sTT5/GzRC2jhh
         ABrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=RFl0lkku0rEx44cSL97n6ibaCEcLL6BIlhLypm/82Mw=;
        b=xk9+7Y53RPqH7mb/BsM4ibbis565QU6DTtVS8kwLvBm2cRTmHKtD4Q8h8cSt79t2SD
         B3nu6t8DbH+15YcxzgLJnoHYiIJvxDaAUqKUzOEySgbBpaxCIjPwhvzzJt3lO1HTiTV0
         xmQdG3NoVixD6+HaeagIVD4orgg7/KgjxdibsqocwRVHzSUrSmo+F5JRQNYJ6M4zffbr
         UfAtI3poSAjCDLDM9t+Bc2tCZnlfvPwJnTh/rY6FpOpTtUWlD20uljSfeeXIPS6E4u47
         nvLvPt1DNd3V8Sh5h68Gc0Ka5hYIptKeIt7R1wgluB/30hFhYtsq6CQN9WVaqG5oxZxs
         JxBw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eo4-20020ad45944000000b0061b6c6928besi6456658qvb.257.2023.05.24.03.28.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 03:28:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1lim-0007xw-1f; Wed, 24 May 2023 06:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1lia-0007ro-Pd; Wed, 24 May 2023 06:27:46 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1liX-0000Oy-RG; Wed, 24 May 2023 06:27:44 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 303072609C0;
 Wed, 24 May 2023 12:27:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D3nAMwFrj-Jh; Wed, 24 May 2023 12:27:38 +0200 (CEST)
Received: from applejack.lan (83.21.125.167.ipv4.supernova.orange.pl
 [83.21.125.167])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 01221260BBC;
 Wed, 24 May 2023 12:27:35 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v3 4/5] hw/arm/sbsa-ref: add gfx card only if we have pci
Date: Wed, 24 May 2023 12:27:28 +0200
Message-Id: <20230524102729.810892-5-marcin.juszkiewicz@linaro.org>
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
X-TUID: LOXbflDvNdxa

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

