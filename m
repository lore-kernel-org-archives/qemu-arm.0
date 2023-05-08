Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp1885074ejq;
        Mon, 8 May 2023 01:01:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7lR7Ip5j6FlS5+uIeezHXSgbm+bMntI8NZzggCcx6ifHVtAiomFEPxvUbGirIngAyd3e2S
X-Received: by 2002:a05:6214:1d2f:b0:61b:7bac:aeb7 with SMTP id f15-20020a0562141d2f00b0061b7bacaeb7mr17140073qvd.40.1683532898472;
        Mon, 08 May 2023 01:01:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683532898; cv=none;
        d=google.com; s=arc-20160816;
        b=mDPTiLUraJrzoEBnSxsvEGClt7+Z82c2+klMYpWLS2WEQRSUw1jv6O+Zpu4ExQJOU3
         FgHk3ufU16C2sHiGLfMpWxuyYu5R0YoIYNVSgp1wuNO9nPeOyVwKQrQFn3uaMPKFblmR
         pxVESpDtihZmLyjny1w421Fn6FWhLm64Xb62xPw/1XAH/9wqmfZtUPZmwdMfwVU39uIG
         iYymUcaf83qJLaVRDq15DtOrcF38gDpmqCKbLlvlBgdZtaJ8J+yegAERcUXqeV+Nj8Ne
         PRjo5ZStb8b3pKLqSeNeDc408/viVOAlXDQDWV2kbMRSnXxMibvkpoOLGqjluX/o/Jkh
         X+ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=4RpL+CXySlm4N+c22uWk6wv+5obO6vU0QhPfIa6ZWOM=;
        b=HNRBYBCK2Popx9MN3zv1X5dhW5weWB93qOZsPhWxGVX/b35/Io04U2oC+FCgmHz7mk
         nO3W+53kT3izk5CQ6VZyj2GOntMbet+QnSCNzTr2fz9twns+3voZrSKaKrQDp9rDioOH
         tNlZrcyFMZpzUrupIVD+FhDsrmVeJyVJ6wxGUJmyS/pMhesnwx2WNNsSnwP4Cb/qKI0q
         YdCUh4+itsYdp9YvjeKhpLljQJ6V2z312hE0hjCtppk1MuxekFCwNhwOz7oww8yXXsmn
         a9r8+RbTT8hBZpbCJSksVTIFhQt2aobIwytkLCTTz1ZWW9lZ80rrq1Yd+S4rd2lpB5vW
         tCbw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iv13-20020ad45ced000000b005e05935d813si823602qvb.593.2023.05.08.01.01.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 May 2023 01:01:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pvvmM-00081s-1N; Mon, 08 May 2023 03:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5sq4=A5=kaod.org=clg@ozlabs.org>)
 id 1pvvmK-00080N-Iq; Mon, 08 May 2023 03:59:28 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5sq4=A5=kaod.org=clg@ozlabs.org>)
 id 1pvvmI-000190-W0; Mon, 08 May 2023 03:59:28 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QFDG44Y47z4x4J;
 Mon,  8 May 2023 17:59:24 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QFDG21Q7tz4whj;
 Mon,  8 May 2023 17:59:21 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alistair Francis <alistair@alistair23.me>
Subject: [PATCH 05/12] hw/ssi: Introduce a ssi_get_cs() helper
Date: Mon,  8 May 2023 09:58:52 +0200
Message-Id: <20230508075859.3326566-6-clg@kaod.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230508075859.3326566-1-clg@kaod.org>
References: <20230508075859.3326566-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=5sq4=A5=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: GXrWNcqZ36rB

Simple routine to retrieve a DeviceState object on a SPI bus using its
address/cs. It will be useful for the board to wire the CS lines.

Cc: Alistair Francis <alistair@alistair23.me>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/ssi.h |  2 ++
 hw/ssi/ssi.c         | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
index ffd3a34ba4..c7beabdb09 100644
--- a/include/hw/ssi/ssi.h
+++ b/include/hw/ssi/ssi.h
@@ -112,4 +112,6 @@ SSIBus *ssi_create_bus(DeviceState *parent, const char *name);
 
 uint32_t ssi_transfer(SSIBus *bus, uint32_t val);
 
+DeviceState *ssi_get_cs(SSIBus *bus, int addr);
+
 #endif
diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
index 9fffe4f27a..a25e064417 100644
--- a/hw/ssi/ssi.c
+++ b/hw/ssi/ssi.c
@@ -27,6 +27,21 @@ struct SSIBus {
 #define TYPE_SSI_BUS "SSI"
 OBJECT_DECLARE_SIMPLE_TYPE(SSIBus, SSI_BUS)
 
+DeviceState *ssi_get_cs(SSIBus *bus, int addr)
+{
+    BusState *b = BUS(bus);
+    BusChild *kid;
+
+    QTAILQ_FOREACH(kid, &b->children, sibling) {
+        SSIPeripheral *kid_ssi = SSI_PERIPHERAL(kid->child);
+        if (kid_ssi->addr == addr) {
+            return kid->child;
+        }
+    }
+
+    return NULL;
+}
+
 static const TypeInfo ssi_bus_info = {
     .name = TYPE_SSI_BUS,
     .parent = TYPE_BUS,
-- 
2.40.0

