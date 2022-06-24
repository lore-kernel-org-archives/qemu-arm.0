Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp353469lft;
        Fri, 24 Jun 2022 07:13:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uor8FG2Em5r887e3xHtUvYHPylupCa2bvA2mrgvroMdq8On5Dyg174R2NNpgNOGhKKBOlS
X-Received: by 2002:a05:6214:20c6:b0:470:5525:390e with SMTP id 6-20020a05621420c600b004705525390emr15534176qve.39.1656080001751;
        Fri, 24 Jun 2022 07:13:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656080001; cv=none;
        d=google.com; s=arc-20160816;
        b=e9QHt5G39Whfn4yjwACciUYBh6f3BA+wwT3D1atPcn5vACC3mUgNuPW1aU3FNQfWB/
         el8hJZc4w6InrEQai3QCCcVDXuZdXPrArCJeDIeLfzvvnyNgck2o2nlFlPDiTaQ0pTAR
         TuLACHu/7aeIbhaL53nuQtet2l8vuQ8ceLpNKCmsjRRo2dmDttcGa9wAJOUc0tEUhkJA
         tcqDp19lJf5pDQXyPBSHGMwfAg8iUMX8gQDnoKUXzyrlX9XidcqZXJlwqPVx6bA8Ug/j
         F2qPkiRYSpSNNWAULUG4jfKx3zL4mu7Y0Ex4P3HqLmbW5z6kWjZbk9KQ1MK3plzQGt/B
         LmMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=luDz1ZXPN+WGigbs9Pbnm8iuZlTciBSqREre8wp1GDA=;
        b=lay0WfDjoe0l8BGQQrLGZRur5Ba03bWdgKRnJS5+dzA9je3tspCnJfmkMgmnuoLKEb
         6ndmKKvE/LiM6rbucj2M0ZPxGK+b+eUqAafyhs7gCvDaaD4UPbQh4AMeldaKIxu7xMLC
         6gVyChTnCdRRDpyguptJODs6WNM/MFblliAsTRo/o7WCxfsoA2XMzKAPLgbiaMNtaM2N
         QsjdNcs9tMK+XMkwiW/ix/+b57Jf2Kjm/OKnO2WGYhlEBrqJpAn92sskoV2Wzy/DwzZn
         siUDj5LIAwNwln+tdietwbbmDIjea3LVDmzdZUpGIo7AFBoOOkdiP8a2aNTViTiW76zz
         7MVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=cGk8Xur6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7-20020a05620a214700b006a6d57659acsi1715595qkm.589.2022.06.24.07.13.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 07:13:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=cGk8Xur6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:35318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4k3l-0002ra-80
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 10:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jbG-0003MR-WD; Fri, 24 Jun 2022 09:43:55 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jbF-0005L9-FR; Fri, 24 Jun 2022 09:43:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=luDz1ZXPN+WGigbs9Pbnm8iuZlTciBSqREre8wp1GDA=; b=cGk8Xur6oire/NL8/FTpFEFN28
 +AeyXf9E5r+9tgfFjLG/8xlH04bvJH4qZxqlYg3ZT9aYBcoJrB9q28goP9DnHmvDXIBPLzlg3q6yV
 merScdJ6MKYWF7UpiBPVXNzmXPROyc0dB85T8Xk9tf/uez7Npq8uuKnv2vHJodBDAVUhZkAPhFGTB
 lGfUr5oppcCkl6EVieHakSpe+hdClWwdGzU+kGUZEascSKMnvJfzNRA6Fz/J7SwbwfHT8YuXpgGhg
 KssH117l4Civ3dotTcypemoMOb6b0HDBTR9T/vvz94iU0un2DJ+KkiFc82FwVbmgzEIUzznbOCRcx
 UYUVkdsn2qVrJ1dMmsV81HU4qgCcoRlayLi6aLZaYrE+ZAtniBIN0JlMP6+9CFezaJ4HGF5LC9wbJ
 T8GwJoAhOyY9lUeONM19iNM2oMeryNhNE+Huy9kjRO9/kmifME8jONruNMFW4ImZbGad4T9JsEMRB
 Gxq2TGLjnVZS+gcgpS9TJ3r/qPNkJR9MWZN53Se9GR1DtGpe3h+4rEjC2Tv8joBzcYwW3kg6IC83C
 aVmUSmpq4R+4BMJiYXbo7S99nMJh8MBcCGc+GogILi/yRzckhfociANu/Kba0PnBk+xKdjU9oOeF+
 6IUBBUVA/Zn1Hzm+tRRMsCBF+97+vI++5SAJ00Hao=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZh-00037t-OW; Fri, 24 Jun 2022 14:42:17 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:52 +0100
Message-Id: <20220624134109.881989-38-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 37/54] pl050: add QEMU interface comment
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tO6m1S4vE0vO

This describes the PL050 device interface implemented within QEMU.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/pl050.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index c665a4fc99..ffaa72dea4 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -7,6 +7,14 @@
  * This code is licensed under the GPL.
  */
 
+/*
+ * QEMU interface:
+ * + sysbus MMIO region 0: MemoryRegion defining the PL050 registers
+ * + Named GPIO input "ps2-input-irq": set to 1 if the downstream PS2 device
+ *   has asserted its irq
+ * + sysbus IRQ 0: PL050 output irq
+ */
+
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
-- 
2.30.2

