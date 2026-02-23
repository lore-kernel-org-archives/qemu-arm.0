Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E6FEC1112
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:11:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZKD-0001JT-L6; Mon, 23 Feb 2026 12:02:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZKA-0001CR-U4
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:23 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZK9-0008VK-A0
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:02:22 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-43767807da6so3410314f8f.2
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866140; x=1772470940; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Bp3RXdjJyq2zUkMPFoXr57Ilr22nwEt2DEhIgGusj+Q=;
 b=OxZ9v46BKMhJwt8TwEKAcCSe3Q1PCbjwhH1sQ24HIhDhQHEuLOsxaYhK5++D3jN/dG
 ZINsItsXfmpHJPoRWODIpRKmLZ4J3jbxrmpsAkfePLA5eiPMTNZrvfs+fT1YSqIBxwud
 GIH0XOsH9xCOB01JiN6QcQEW+6jnH+9kyRo1uAoVR0QffwVQO5TdTOfn0XBMbcnj9T5e
 bj5gvBBp/1cgm795QRG1jATPPVFkjHhZc6HFM0LRBvpsaOGVuBnWSIL57iIkDp0hsUfy
 ndfXV3VISxPjSCzG37FbBPo0wXUiA7Ps9t7IrBmUHd+KXbhz1ZkektHidbTW58XexeQT
 MroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866140; x=1772470940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Bp3RXdjJyq2zUkMPFoXr57Ilr22nwEt2DEhIgGusj+Q=;
 b=wwzLqX24ypYNbd1jH4T+UDjFJsL1b3MUK0Jp0jDAUm0swzhJ0NouF3dMQoL9PV+tgp
 zKbHE8PfcZDzVPPAGYQhvpY46PcO3TcO6ixx++oePotUe87YDeUJcxs2amr/qlnUnRCs
 8D+7EEjaAH61OZ61QbWsAponBMyrw4C0Kti1IMktDtEH1oPSG3YF226O17xmFD1Q+mYg
 QiAP2syLIt11ndY5ZvciDHTXNUvFaXWVPTbqM4tmllFr1pxp/BfvSB/fU84Sy25O24ar
 fmvB6HZ/Dh/PHZ8Y450J74qUrdwWrKQUxA6dUWDjL3Mt0AwdyBX1YgNNrlg/sqgGMO/Y
 ItaQ==
X-Gm-Message-State: AOJu0YznE4z4M48X/A20sSkaf5t+mMyD8ti/WoCOgHEegQdFbBF70N6H
 hFgKXOsQFMQMzAIxTVFx79ue005nKGtXC8HaO0LJG/a7SJRD3cE7vD/Y/xfNA1l0j47gVutq702
 ZPy5n
X-Gm-Gg: AZuq6aILrKX9ENZWiDrzFesKzVd0Oiy0gbm9pr3Q3Hl0cnh0KhdT8yRZPJfeVow73Oc
 4MEnEwNJZ2YvsoyfQpp6CRhJ0BQgldnReV9ySwQ7pT+8tq1mLZopCIWVpu10g36I42olze13/bk
 VG0VsqfHelcNm4MRUzrZeBn1rVyuMuUer01LSHGnXJyPxC8q+6IdRNVP5rfveeQgsE3FzONIzKA
 ZylVLyKPcmPBJgp4mcEZOGTfpt/+CyoX/1z9OXHJyyFt+zYf2JYuXt3/6K65L/hTcoN7eUahKaQ
 cATq1GaZqIVaW3mYymeQt7UFQ9/bguyAIrj0KlWsSNQtgUp/mNPZu9MZK45YpX4u+xhisXDwQD7
 F3z7SZvfqF88syUFi9R4uncehtWXFL1yNd88kC0nRWtwKI53kwkBsyPjgEfvuwzHucLnynl9eat
 TyF4EkLhAOB/iWo5ti7+RNzWyABLF+ueDkbwhNjrC72ZQYaWDm1wi2mmtb6CXjEC8UOsnE2haJG
 x2gA6WzgH9Ht1qG9Jw7dzhlDe5cdEc=
X-Received: by 2002:a05:600c:a00d:b0:480:690e:f14a with SMTP id
 5b1f17b1804b1-483a95bf2f3mr162385865e9.14.1771866139684; 
 Mon, 23 Feb 2026 09:02:19 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:02:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/65] hw/intc/arm_gicv5: Add migration blocker
Date: Mon, 23 Feb 2026 17:01:12 +0000
Message-ID: <20260223170212.441276-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This initial version of the GICv5 will not support migration:

 * the spec is still only at EAC level, so the data to be
   migrated might in theory change before it is finalised
 * when we add support for missing features like EL2/EL3/Realm
   we might find we want to refactor the data structures we use
 * I still need to check against the proposed KVM GICv5
   handling to see if there are any awkward mismatches
   that might affect how we want to store the data
 * it's experimental, so for pragmatic reasons I'm skipping
   it to get the initial version done faster

Install a migration blocker to enforce this.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 0eb4348e81..73a6e629df 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -11,6 +11,7 @@
 #include "qapi/error.h"
 #include "qemu/log.h"
 #include "trace.h"
+#include "migration/blocker.h"
 
 OBJECT_DEFINE_TYPE(GICv5, gicv5, ARM_GICV5, ARM_GICV5_COMMON)
 
@@ -194,6 +195,7 @@ static void gicv5_realize(DeviceState *dev, Error **errp)
 {
     GICv5Common *cs = ARM_GICV5_COMMON(dev);
     GICv5Class *gc = ARM_GICV5_GET_CLASS(dev);
+    Error *migration_blocker = NULL;
 
     ERRP_GUARD();
 
@@ -202,6 +204,12 @@ static void gicv5_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    error_setg(&migration_blocker,
+               "Live migration disabled: not yet supported by GICv5");
+    if (migrate_add_blocker(&migration_blocker, errp)) {
+        return;
+    }
+
     /*
      * When we implement support for more than one interrupt domain,
      * we will provide some QOM properties so the board can configure
-- 
2.43.0


