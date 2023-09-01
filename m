Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp495692ejc;
        Fri, 1 Sep 2023 02:43:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpJu47DmXO37jct8hIoX28Mfg55djzsYiamrhw3b+0A+98PpLzmHjZKltXKahWwrk2c2Or
X-Received: by 2002:a05:620a:9d3:b0:76c:c636:4772 with SMTP id y19-20020a05620a09d300b0076cc6364772mr1818225qky.65.1693561388831;
        Fri, 01 Sep 2023 02:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693561388; cv=none;
        d=google.com; s=arc-20160816;
        b=YifRDUAeBB1BDcTEqxbe+m0ZDeAqM58EPYShRDKZaSb0l0Tv5DNyFMggyCYB64RHfB
         Qw0CNNtB81eL9SyjoVBjAlSzwjDI3qhRtLATtXSQWDY7nC2pcfbabjlmY3gJ/E9PNN4U
         cKGZl6sVahWZ08sYcB2TAsEy9WXiAHu+ugfKJ70y8dXJAOZE0nYbRuavFXpsZ203upSf
         0gymjOrc0Ojs1VhUeK8+tzOiMq25pZB+Nf+mG80zvxkJ+lEuUSF78JCoc4QJafRQv6hN
         5lLLlU8idSlkNRH1620eZCDwCMBfuwsA2WxW16rpfjWPFP4Ayb3FSy7/Kd301AvGtfaZ
         JXEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=VomUVCZj7MnQUfbzxWJ2wH+ChBgGVKx6Y1oDXYN9dgc=;
        fh=4jctf1SUPkov0c0IvxiKECRneLh+aY640s7QBLGg/KU=;
        b=OEoHQST+RzWucVzVmb4zbdWz7NXRrzHDcGrYloZD7RSJovUYyefBUkZYCTZFLB9gWl
         pyngFc5qsKljBEbDhWVZJQTgl6fXzaCumCNMyPwWS9RHW0EBn5vzW2tBkOkX6smGghol
         wzkIcT7xvwXyFuyWtEDqRoVlgaPyWwnU7GSD5vHyhN2NM55zrYvqBIulGVVW3a4yJ8gO
         lwQTXC1c8ulYsgN6aPWyMxcsC1p78BLkxqSOZcFK7VCOUJCIV7biDP8Hu9G0iGdXnQN7
         ZoeI7f3RyKMidv5LDGQGV/7jRsmh4dn/Nwwy9iPt2M7EFSqDho+qd+qX5JBDXL8mY7i5
         yfaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dl11-20020a05620a1d0b00b0076db2d9ae71si2124760qkb.257.2023.09.01.02.43.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Sep 2023 02:43:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qc0fr-0001a5-Gs; Fri, 01 Sep 2023 05:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0fq-0001VE-72; Fri, 01 Sep 2023 05:42:42 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0fn-0002wb-L8; Fri, 01 Sep 2023 05:42:41 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RcY3d2STnz4x2b;
 Fri,  1 Sep 2023 19:42:37 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RcY3b2J0Pz4x2Y;
 Fri,  1 Sep 2023 19:42:35 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Joel Stanley <joel@jms.id.au>
Subject: [PULL 07/26] hw/ssi: Introduce a ssi_get_cs() helper
Date: Fri,  1 Sep 2023 11:41:55 +0200
Message-ID: <20230901094214.296918-8-clg@kaod.org>
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
X-TUID: fppcCpIgMaX+

Simple routine to retrieve a DeviceState object on a SPI bus using its
CS index. It will be useful for the board to wire the CS lines.

Cc: Alistair Francis <alistair@alistair23.me>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/ssi.h |  2 ++
 hw/ssi/ssi.c         | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
index c5bdf1f2165f..3cdcbd539042 100644
--- a/include/hw/ssi/ssi.h
+++ b/include/hw/ssi/ssi.h
@@ -112,4 +112,6 @@ SSIBus *ssi_create_bus(DeviceState *parent, const char *name);
 
 uint32_t ssi_transfer(SSIBus *bus, uint32_t val);
 
+DeviceState *ssi_get_cs(SSIBus *bus, uint8_t cs_index);
+
 #endif
diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
index 4e33e0ea5bc2..54ca3c34e9d0 100644
--- a/hw/ssi/ssi.c
+++ b/hw/ssi/ssi.c
@@ -27,6 +27,21 @@ struct SSIBus {
 #define TYPE_SSI_BUS "SSI"
 OBJECT_DECLARE_SIMPLE_TYPE(SSIBus, SSI_BUS)
 
+DeviceState *ssi_get_cs(SSIBus *bus, uint8_t cs_index)
+{
+    BusState *b = BUS(bus);
+    BusChild *kid;
+
+    QTAILQ_FOREACH(kid, &b->children, sibling) {
+        SSIPeripheral *kid_ssi = SSI_PERIPHERAL(kid->child);
+        if (kid_ssi->cs_index == cs_index) {
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
2.41.0

