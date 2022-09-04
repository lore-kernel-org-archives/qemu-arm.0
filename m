Received: by 2002:a05:7108:414f:0:0:0:0 with SMTP id l15csp2914594gdo;
        Sun, 4 Sep 2022 16:35:51 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6QvEaIL3JuJkc0tqVvSildnGv7oxbGACEYePLE0r94pVVUcgg46Jye+JKYzYrK04In/vHK
X-Received: by 2002:ac8:5bc9:0:b0:343:7c69:4a0e with SMTP id b9-20020ac85bc9000000b003437c694a0emr37461881qtb.487.1662334551248;
        Sun, 04 Sep 2022 16:35:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662334551; cv=none;
        d=google.com; s=arc-20160816;
        b=MVwOOpylFJvdtF8F8CjsmY1zuBwuABDTHSN0YQyhhmBi54I9vNJfOF+4HxWqYQPsTj
         R1faqhvKtjstxI7mYE3406CYh6eXTp/oqgw+9RqM/IB7BCBY+TFn1xMJYFyzqC4sLBFi
         TH2DkrSgX3kUojlybNJZCq5UZcya2BFuo3fY81dXaGPSuc6htsHftRgBXE5lS8fYThnC
         fvJAa70U9q0175/BkQqCjX9snGWIagq6oeKC/cNCuXx3TiVHp1s9XdhZkB8bMaR9AdxT
         uXEBOR7WxCBVHqLuA3W1wiv91LNiJMhCCesJ24J/VPXlsejITtkNNXQb3mm6egf4oh6I
         T7Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HovcpPksbyRH4MetLfjOHLX26QOG2cA8NngwzZBGLTg=;
        b=m0ifA5bAq7uiKr/8+b3rugnX9cRfKoLjN6duM4DIe1bMUwXtygxUUAjWJLqAQo1iMc
         CbtiEi+Zd9pigJvQIWWX9ALryefIioNsvlIAbMZ3n24SZeEV3CCp7Dz+GmYvMn9aijNa
         kKbYcvG6wzTJMpEVKs3D4rl3/G4tU+NZJ8JjRrKxuu8mJWNVsxV8EpFd2XBfy5KEY7+e
         CXLWi70ImVby5HZYDTBCayE57vmRyy9yJhEci4BFYI9sZXJyGXiMio6TSX5XCvIe8cdu
         qwnp+stKwl/CPGvHYT2xPW8YzcCTjPK5Ur/oZsy6osxeVWcWmKSdeMT+lx4/sT3VI87k
         s0kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="e/qJ2ngI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dm51-20020a05620a1d7300b006b25d607c65si5082786qkb.697.2022.09.04.16.35.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 04 Sep 2022 16:35:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="e/qJ2ngI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oUz9a-0006kN-Rj
	for alex.bennee@linaro.org; Sun, 04 Sep 2022 19:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz8u-0006hS-DQ; Sun, 04 Sep 2022 19:35:08 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:44679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oUz8s-0004wz-Mb; Sun, 04 Sep 2022 19:35:08 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 t11-20020a05683014cb00b0063734a2a786so5187260otq.11; 
 Sun, 04 Sep 2022 16:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=HovcpPksbyRH4MetLfjOHLX26QOG2cA8NngwzZBGLTg=;
 b=e/qJ2ngIxltIyrc7/PR0+LvflU1ys+K3+bSDKWpo5L6Xj2NaOIQQz92UVq6PVTnFQD
 J+Dz2QwJzBu+4gZY9PirQTTo1vBn+fkH8qaZNcSgPXXl8mrnuk0tNjt9IgbBqpPfdOn0
 uiBXIJfQSCD8RYbd28niJhCa6ho+47H+eD58A50u4guZbX4hjcim0EzdCSyfc8OrGsJY
 VBntBOfhdlTNJWx7DCUQiu3xS/Xn7FzV+Qn5QYCsWXorFK1MOLrxeDVjmhrCHl5aoCW5
 gC6uCq0f1CS6PDmXH3qHAFDD4L3wdA51HxtedmL3fwtA9Qr4LMt6rS/8CI1NS7lLkLBi
 Wyng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=HovcpPksbyRH4MetLfjOHLX26QOG2cA8NngwzZBGLTg=;
 b=RUcQ80l7mLaqSEPir8ZhWyiGjz/RhR0kG33DW8uRtSUi6qfpxMmk5rMgxYk64UUfk8
 rQvqSdr0VYDbIkz5N0EW9T63u/COLTyjKr0mdKqE9ChtclmCca6bBQU/YatYWx7jFx7F
 ewoKSgQOnige89ukW51CLFtSx2QoXfj5KEcN2ZN0VsS/PwHxVJpOhPUy+6+feLJBUWtZ
 DAc8pFUTSisIcNLj2u94WfX6JO+5+XJz3u0Otq92frFnFO9DlOcinkVgP5yLyU6S87nY
 jllMK2lnWuUS9RyT9BGlV7+qVAVFb2YRD233oeyb6LBLexqWRV2llu36zgWQTtI4vwaS
 Kylg==
X-Gm-Message-State: ACgBeo36pSUqi04kLu6Rs9wu3hi2GmLbeNUp0JfwRDBkS/bcvGKTc/Zk
 64jeEmondcOR5ZuDlMNbeMeiQbHm36aOpA==
X-Received: by 2002:a05:6830:3914:b0:638:f80c:e964 with SMTP id
 br20-20020a056830391400b00638f80ce964mr18348282otb.220.1662334504590; 
 Sun, 04 Sep 2022 16:35:04 -0700 (PDT)
Received: from balboa.ibmuc.com (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 o7-20020a4a9587000000b0044b4acd27c5sm2549793ooi.17.2022.09.04.16.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 16:35:04 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v6 01/14] hw/arm: do not free machine->fdt in arm_load_dtb()
Date: Sun,  4 Sep 2022 20:34:43 -0300
Message-Id: <20220904233456.209027-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904233456.209027-1-danielhb413@gmail.com>
References: <20220904233456.209027-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0AaHhH3wNQ7Q

At this moment, arm_load_dtb() can free machine->fdt when
binfo->dtb_filename is NULL. If there's no 'dtb_filename', 'fdt' will be
retrieved by binfo->get_dtb(). If get_dtb() returns machine->fdt, as is
the case of machvirt_dtb() from hw/arm/virt.c, fdt now has a pointer to
machine->fdt. And, in that case, the existing g_free(fdt) at the end of
arm_load_dtb() will make machine->fdt point to an invalid memory region.

This is not an issue right now because there's no code that access
machine->fdt after arm_load_dtb(), but we're going to add a QMP/HMP
FDT command that will rely on machine->fdt being valid.

Instead of freeing 'fdt' at the end of arm_load_dtb(), assign it to
machine->fdt. This will allow the FDT of ARM machines that relies on
arm_load_dtb() to be accessed later on.

Since all ARM machines allocates the FDT only once, we don't need to
worry about leaking the existing FDT during a machine reset (which is
something that other machines have to look after, e.g. the ppc64 pSeries
machine).

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/arm/boot.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index ada2717f76..60bbfba37f 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -684,7 +684,8 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
      */
     rom_add_blob_fixed_as("dtb", fdt, size, addr, as);
 
-    g_free(fdt);
+    /* Set ms->fdt for 'dumpdtb' QMP/HMP command */
+    ms->fdt = fdt;
 
     return size;
 
-- 
2.37.2

