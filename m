Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp1885135ejq;
        Mon, 8 May 2023 01:01:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ55fFoaqZulVd7Qe1KrPQX+m2qWQhBp5r7Zj8OZawbJ4/H+HCVIpVHyLgIjF5rprORCpvHL
X-Received: by 2002:a05:6214:c64:b0:60e:52e:33df with SMTP id t4-20020a0562140c6400b0060e052e33dfmr12102808qvj.36.1683532903450;
        Mon, 08 May 2023 01:01:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683532903; cv=none;
        d=google.com; s=arc-20160816;
        b=tNRIqSRZdZlFZSeJA0yL0yaZyJnIG2HP9Aa03K5g6VX+JBEmlLWEX8cm2/WzVxXtvD
         3tiasE4TEKsvwiazNsjSBDfSgBIXGg7QALfPxFVG1V9w7CWQUE9NhOl8Gxb+W/veHJbg
         pGq0jh4oyzfmPkf88yZhadJAas1+1awxBh6tQg8s4DIq4DoIIffI9p7570MGaEeALdSu
         OSIuODRo13uQnCKmFMTaLfd17KjTz8mhq0OVSEX8oNeBPSZPAl5EXeymls/CdteJcXwD
         5JJ1oz71kq/AlGrLoX8ykpSA3e6Pby9QAQw2+LhcRp7XF07BVTWqne1XIDJcxUHEqiJA
         G0Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=YR1MHRHLg2YFn06Qq5NGIYukuvHZTzilEErZtKQ95nQ=;
        b=mSXx92DbUoDQWnP922PZNvj4+aYSHkvVcsr6NSvYBAgbUQRbl90QMZIzDiKUn70NET
         +zs5/Mf622hj+ISltgkSJDHuj4v4EFL6qop92QtWOpHWg6Dh1Rf6b1pI2+HvMVOfHBhl
         9BSTjHNOHrDcbsxCukYg4QMB92SQ0KVKmDlYOTpEww+rBvxiWgXNI0ycBdgfnDlSdV15
         7CeOxtZTlN/ZPS8TYa7PiN3xfcY/gwJISvRWjBl4SmKw6bGnaoOvcVo0tK6S+sLqzXeV
         TeDuNsG6cibaHM+Xvu9CIe9jCGaLD1bv4ykPLe2lkF9CuGC/f8WpJqIx0iTfZaqLT6WC
         +d8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gy2-20020a056214242200b0056ea3d10d19si2725106qvb.396.2023.05.08.01.01.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 May 2023 01:01:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvvmm-0008GL-L9; Mon, 08 May 2023 03:59:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5sq4=A5=kaod.org=clg@ozlabs.org>)
 id 1pvvmV-00082U-1y; Mon, 08 May 2023 03:59:39 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5sq4=A5=kaod.org=clg@ozlabs.org>)
 id 1pvvmT-0001A5-B5; Mon, 08 May 2023 03:59:38 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QFDGJ28FDz4x48;
 Mon,  8 May 2023 17:59:36 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QFDGF61lzz4x49;
 Mon,  8 May 2023 17:59:33 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alistair Francis <alistair@alistair23.me>
Subject: [PATCH 09/12] m25p80: Introduce an helper to retrieve the
 BlockBackend of a device
Date: Mon,  8 May 2023 09:58:56 +0200
Message-Id: <20230508075859.3326566-10-clg@kaod.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230508075859.3326566-1-clg@kaod.org>
References: <20230508075859.3326566-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=5sq4=A5=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 8iNEiCqOnEAA

It will help in getting rid of some drive_get(IF_MTD) calls by
retrieving the BlockBackend directly from the m25p80 device.

Cc: Alistair Francis <alistair@alistair23.me>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/block/flash.h | 4 ++++
 hw/block/m25p80.c        | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 7198953702..de93756cbe 100644
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
index dc5ffbc4ff..afc3fdf4d6 100644
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
2.40.0

