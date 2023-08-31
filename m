Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5059544ejc;
        Thu, 31 Aug 2023 05:40:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEP+O85DZV/cOYuwB63dK3uajPAnsxTtHsJ2k+4CADq46kOTt6Lt7155pBMDji53PdiWtCg
X-Received: by 2002:a1f:4a02:0:b0:48f:8891:296b with SMTP id x2-20020a1f4a02000000b0048f8891296bmr4505235vka.0.1693485628972;
        Thu, 31 Aug 2023 05:40:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693485628; cv=none;
        d=google.com; s=arc-20160816;
        b=xl9c02HTdiT/3uQ8FdJ4S+NjskCfHJKhI7vf8yxgzB90BI76oRKZxAUjxSnkwnlbmJ
         +q+1+O+/j6Dfl82mU5ME2UcVRKitI19AC+9NhEqvzLsaH+eA4W33Z+UYq0NeBJeR8sRk
         bfeRr/+1r4VoPS3B7hwallRBzQqx2R46GAClm3fDSl8BWj8aq/tffGc2badYXiUAlm4g
         o1T7xPragmpfvhQAjacX46tXC059CNoEttG/CVgdNTWk8b+qFnJZBC2+sONWtiG1wHJs
         4zwR6ajqJXxB4sb33N0DVZ9ECZdXvWOWEdo4Zhv2Xs7Q+LVBJ3lygE8JCoBkoZP5adS2
         BAfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=iH+P0pJ+VlhzyWuJzFE4veTPbhGub1nhrPm2LECO7GM=;
        fh=tFVUO55lSns9GhhnCQOHLDWxRjUsUCf2I+VgIYDA7Qc=;
        b=xSZX1SzjGJ3HuMdwHlV34RSIYHZiazLAuQKpL3BQGYsaPjcKyeViTfUX0vauBamk+K
         aVovz2PknyZbEAemCoG7m2f0lBZ/NFlWasU4Du4ylzmXsQcuDtovrJ1rhIN9bF9AD+JM
         /0IGjWaeA3f73CPNfTI7DyZtZoMiC6LnTEK2MSZxiXblF1VJ/Ir/7H9rd4vjOO2kcLPy
         S6cAmLAdbAkAZeztiNLQSPJV4PuQpl08K7x/F0htyTmTKYO/qROtSV5KqX+wZdCb6DXH
         H6MYgOK3puZSRCPgoWWGwYpHsUOrLpdFT0sdEVqsnGmwfxHV4XL6SG71TRy6OEjmcrzy
         Kpfw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d3-20020a05622a15c300b00412184dcff5si797021qty.498.2023.08.31.05.40.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 05:40:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qbgxq-00081s-VC; Thu, 31 Aug 2023 08:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=TXcQ=EQ=kaod.org=clg@ozlabs.org>)
 id 1qbgxk-0007vb-9Q; Thu, 31 Aug 2023 08:39:52 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=TXcQ=EQ=kaod.org=clg@ozlabs.org>)
 id 1qbgxh-0008Gs-VT; Thu, 31 Aug 2023 08:39:52 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Rc12W4w2kz4x2Y;
 Thu, 31 Aug 2023 22:39:47 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rc12T1Cq1z4wb0;
 Thu, 31 Aug 2023 22:39:44 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v3 6/7] m25p80: Introduce an helper to retrieve the
 BlockBackend of a device
Date: Thu, 31 Aug 2023 14:39:21 +0200
Message-ID: <20230831123922.105200-7-clg@kaod.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831123922.105200-1-clg@kaod.org>
References: <20230831123922.105200-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=TXcQ=EQ=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: XsxVW0acfSXQ

It will help in getting rid of some drive_get(IF_MTD) calls by
retrieving the BlockBackend directly from the m25p80 device.

Cc: Alistair Francis <alistair@alistair23.me>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/block/flash.h | 4 ++++
 hw/block/m25p80.c        | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 7198953702b7..de93756cbe8f 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -76,4 +76,8 @@ uint8_t ecc_digest(ECCState *s, uint8_t sample);
 void ecc_reset(ECCState *s);
 extern const VMStateDescription vmstate_ecc_state;
 
+/* m25p80.c */
+
+BlockBackend *m25p80_get_blk(DeviceState *dev);
+
 #endif
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index dc5ffbc4ff52..afc3fdf4d60b 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -25,6 +25,7 @@
 #include "qemu/units.h"
 #include "sysemu/block-backend.h"
 #include "hw/block/block.h"
+#include "hw/block/flash.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "hw/ssi/ssi.h"
@@ -1830,3 +1831,8 @@ static void m25p80_register_types(void)
 }
 
 type_init(m25p80_register_types)
+
+BlockBackend *m25p80_get_blk(DeviceState *dev)
+{
+    return M25P80(dev)->blk;
+}
-- 
2.41.0

