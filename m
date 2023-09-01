Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp495779ejc;
        Fri, 1 Sep 2023 02:43:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtszG31DguFzgJZAlpUOBI/BdndlP0pSTQirL64/m7J9tNfa913SECoCyNgaPf2EjbJtca
X-Received: by 2002:a0c:b2d7:0:b0:641:8d17:96fd with SMTP id d23-20020a0cb2d7000000b006418d1796fdmr1786381qvf.41.1693561397757;
        Fri, 01 Sep 2023 02:43:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693561397; cv=none;
        d=google.com; s=arc-20160816;
        b=n1J3HtEFSyKkcxIFjBX9jIInDjyFH9KPkv0hZ51wNrTZASWJBEEI51E8zZyUPOkucl
         HGKYDK2NQn1inPlQjeTxMVdpcDGzAyiI2xEjSEioG4V4Bu1fyrctjcYV1DipKikfF5tg
         kOaGDghd2F5KSgfRMoI6S4CVkU5aeyUTJPuaRDiwXmmwmZBYlt7owQLvtq1nrTwOUtsK
         RnEcD0uVHihXjPsNPZefdIJ+0ke6bDZJCefbPUPpxegTQbhKfqDo7o5TaZZkT1lQpYsZ
         0ZHpi3c5knegwPME2cul5oMOh164yd0zpZhEo4m7mhs+IOGTRYpVZ68LO385CjX/hm4x
         sH/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=iH+P0pJ+VlhzyWuJzFE4veTPbhGub1nhrPm2LECO7GM=;
        fh=4jctf1SUPkov0c0IvxiKECRneLh+aY640s7QBLGg/KU=;
        b=boz6TPyaolnCBV9YDcMJEyU4AQl8T2nounm+LztsOilW6z6fhMw6S0dHcfdNjbuzsa
         ofB7ycpPIxkWJc1+lXMyrGo5sDqqMEvPMRZoUpdKE0v4pZvVvIONlie4dsaxDv/HTuLH
         LdVF575nubuhOJBpIEnfjwwOi/I7iEjenYG85Ub6YDtILS2PzkYofMW0cfVjhrDiO/gf
         JEnpF3z9uIYDqaCQa+yzT0DdUXmzA57xjfE2fUrEJXYaLEIdDauCtXr4AAYvPZCkfNg9
         4HkgBIxoWQ6x+O51hEd7IUx6knjs20wLm42GSWElE+1wHY0RMfVL+lSv9HLUHApt0seM
         14LQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r20-20020a0ccc14000000b0064727d4b77asi2174267qvk.600.2023.09.01.02.43.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Sep 2023 02:43:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qc0g8-00022J-RN; Fri, 01 Sep 2023 05:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0g1-0001u1-Dg; Fri, 01 Sep 2023 05:42:55 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0fy-0002wb-TD; Fri, 01 Sep 2023 05:42:53 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RcY3p4rFXz4x3D;
 Fri,  1 Sep 2023 19:42:46 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RcY3m4hFGz4x2D;
 Fri,  1 Sep 2023 19:42:44 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Joel Stanley <joel@jms.id.au>
Subject: [PULL 11/26] m25p80: Introduce an helper to retrieve the BlockBackend
 of a device
Date: Fri,  1 Sep 2023 11:41:59 +0200
Message-ID: <20230901094214.296918-12-clg@kaod.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230901094214.296918-1-clg@kaod.org>
References: <20230901094214.296918-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=SnXb=ER=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 8+OAT1tfKzFJ

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

