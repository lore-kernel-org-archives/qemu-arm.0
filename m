Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp358126lft;
        Fri, 24 Jun 2022 07:19:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sbO9oCG5eOZk62CPlfyggZTtVCx/dV8DJlsnXHyOESvperEcJS9gfnE8qEvImU0fx8uAMO
X-Received: by 2002:ac8:5e4d:0:b0:305:2e8e:e186 with SMTP id i13-20020ac85e4d000000b003052e8ee186mr12899590qtx.530.1656080342711;
        Fri, 24 Jun 2022 07:19:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656080342; cv=none;
        d=google.com; s=arc-20160816;
        b=AYyqxFogfyhzZUOXYTxuxjRQTQZnGIrBhEPL51+avAwWkj7KpdnaHkUmRbjXjhvIej
         emcFsYZXKWpZXdMeDrUyz0vu/Ln3hp0q6sdmPb9VNnMm/8FXKGYyt/eEROLVISP4vNEi
         Yi3IfC/H5GU0bHF59l+AI+cspyJ11d87zL/NMXxt6C7c1jKNYsCJ8VNVomrrb7kaMTyI
         eYTDKDDxGhocdSx0F/DmMZeOFSb2JdD4fQkQDvb1ljTa7H7mRv/gMyyptOBt2UmhAFLy
         aFd4GKGtwGib1c9t6MYsiwDcc6iQ500eSBk68KU20f/qEG1cryt5H5uZe/oX2zgGOf+K
         z3LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=wby1Pq/oqMaNmEyBRu06KxgR42dc/l6kP7ARriQsA2k=;
        b=DW91dwL3Q9sK3gEC9uvcv8ozxczZpRnZc7qiL8cQjJt7TMH3p62pH7LZDBUNTMxLrX
         XPYEa70M5pb2fAd7FXLOOXnyPkZHdvltVniBhPjwzM8lf7a942QwQHoCfTc8s5QADjWu
         uFHY8ni4pGFY7Lo24LtDRAV5d/fSPJ181YLLqppT+PkqpqeZUVcJA+NJNJAbs1UGrCRh
         lidhBP1UkT7ZfNENa75pSTCtTGHZbn2ciRxAWvUf0O96kxvCe0aJ4/tX7dk1l31w+fhH
         wPSg5iN9iR1ZGPbTPgCG3wwAJYUvuCKr3EwKpwSMqkojYBFDsqC5kMgAxsfWwGgc1dvz
         H4Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=M0QWCLkG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k15-20020a05620a414f00b006a7316a341csi2351407qko.475.2022.06.24.07.19.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 07:19:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=M0QWCLkG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:51228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4k9G-0005g0-6O
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 10:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jbP-0003SL-Us; Fri, 24 Jun 2022 09:44:04 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jbO-0005MY-88; Fri, 24 Jun 2022 09:44:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wby1Pq/oqMaNmEyBRu06KxgR42dc/l6kP7ARriQsA2k=; b=M0QWCLkG/BZfHy3yt5DSOFHJYv
 rFJlDmmpknk3aNFImgMvDin3289Dv+oCDYIOgI1I9ACLmGERaPC1v2zsEarePR6k75b9g0WHW2YAi
 ZGTao7fjbOQhRqbULC8v9ggbwDfpzX6dCHJvMaqaudeFafLOnp/BaGoN1Sfh9Q9D0gIyziGgTSFM8
 bR0cWl8wiCQEQRvkX/x1+UGSPQMQMlo5rMNwMf8nJkQ+prO+GGhv/ehwLw/3ckCmGZpudKr3bTaGj
 V2UsMm9OjsGgXnBCf06/YBQI0JHvhy8a/lxST1B6k8QL6X8rBZfKmABO9IdJmSX0EDuiWM2UgmzTa
 9ipXtvs8A46MdpplPopTjsqWHytfoJFG8dFNddet7McXnBQXfOsbkTTsXqXBMmRVJiSR+XBHwtGu+
 2SAVUWWvaATGy0LDkBGkpBsFEsr94GUGHLdJlkeBslK3N17VPcWVi8JqMRiVhDaVw2CSgJ3Kjc0NN
 MVyDtPcbi252xbMmxJo1wKzGyX7AQRxFNN2UXIZ8BwWLYl3mxD08mzAhu5jlalwX0f5KWoyfXWIeF
 LAcXf9msR2F1TgI69fapGJ9E7g7n7bWbgIGmYYPApOIw/GrNQvYJE0wGXhT+zWUI2MD2YOO2AxK1x
 nHLFE4MXK8dkJWtnN2c16VGqv6muEb+2YIi435A+s=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZm-00037t-1P; Fri, 24 Jun 2022 14:42:25 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:54 +0100
Message-Id: <20220624134109.881989-40-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 39/54] lasips2: move lasips2 QOM types from lasips2.c to
 lasips2.h
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
X-TUID: gskMkujTnCJp

This allows the QOM types in lasips2.c to be used elsewhere by simply including
lasips2.h.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/lasips2.c         | 23 -----------------------
 include/hw/input/lasips2.h | 22 ++++++++++++++++++++++
 2 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index db0a791e6c..2caa80bd3c 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -35,29 +35,6 @@
 #include "qapi/error.h"
 
 
-struct LASIPS2State;
-typedef struct LASIPS2Port {
-    struct LASIPS2State *parent;
-    MemoryRegion reg;
-    void *dev;
-    uint8_t id;
-    uint8_t control;
-    uint8_t buf;
-    bool loopback_rbne;
-    bool irq;
-} LASIPS2Port;
-
-struct LASIPS2State {
-    SysBusDevice parent_obj;
-
-    LASIPS2Port kbd;
-    LASIPS2Port mouse;
-    qemu_irq irq;
-};
-
-#define TYPE_LASIPS2 "lasips2"
-OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2State, LASIPS2)
-
 static const VMStateDescription vmstate_lasips2 = {
     .name = "lasips2",
     .version_id = 0,
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 0cd7b59064..ddcea74c14 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -8,8 +8,30 @@
 #define HW_INPUT_LASIPS2_H
 
 #include "exec/hwaddr.h"
+#include "hw/sysbus.h"
+
+struct LASIPS2State;
+typedef struct LASIPS2Port {
+    struct LASIPS2State *parent;
+    MemoryRegion reg;
+    void *dev;
+    uint8_t id;
+    uint8_t control;
+    uint8_t buf;
+    bool loopback_rbne;
+    bool irq;
+} LASIPS2Port;
+
+struct LASIPS2State {
+    SysBusDevice parent_obj;
+
+    LASIPS2Port kbd;
+    LASIPS2Port mouse;
+    qemu_irq irq;
+};
 
 #define TYPE_LASIPS2 "lasips2"
+OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2State, LASIPS2)
 
 void lasips2_init(MemoryRegion *address_space, hwaddr base, qemu_irq irq);
 
-- 
2.30.2

