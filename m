Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1706362lfp;
        Tue, 12 Jul 2022 15:06:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tv+TNr+2t3B94ASQwW7AQqbn1+U/OXQa8r/YhtNzR6hPERiGsDzVYUWfb4o6Spcc1uyPA1
X-Received: by 2002:a05:6214:c2c:b0:473:7c44:5d28 with SMTP id a12-20020a0562140c2c00b004737c445d28mr301711qvd.43.1657663572972;
        Tue, 12 Jul 2022 15:06:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657663572; cv=none;
        d=google.com; s=arc-20160816;
        b=AETnnhdUK0pH2PjQLvsziblev32cvoxaGZH+cg3ZzPZLIvnyH9SSe5nWXAvR1yWD8x
         ZvnNJPK9vYCi5kCoKlhTYgOXppmMJTpYypUSiMXRekeW6tZMaPE6LJeS3ajQvOgMYGw5
         9B5UvXNMd4Lry4dLDMR57arrGK942dLpHdTiN3pcxO9ztpOalzYVUHkYB9QavQRKc7b9
         ug+V3tPXiUJRt23eKvki+J95wEFBhPty6TXRa9j2K0Ugzxw2tXztNNkvFvgwK1sNxvMm
         ADIA8KS0Dm3iXefqxTz2Pl5bm3F+kaLy+qnX4bP0/rZA2n5P5uSPNg26dGGDJWtcQmyd
         NvkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=vYDoaLGOSh9zh6SxbCzMeBkFO57cLarjy2f54HLBIZU=;
        b=LNpMdYZKz5hWtY0dRWeI5LdgtjbXV3R1oi6tJ/PHukhP95/Bj9/eGssBhbINPv2b0j
         hHtWI2V9oYazC3mqOeP9Djb6LVxZrPnyFtL99ZjaQsvid1Pyg5/Fkgj2rsWb1cEkLRmU
         +5/u8+//qFH7Zgfy/hGdwDrLMpqMxmyOnRNV6YQhBu4NalEP8dteRC9LfwBAeiYwj20y
         66BYG3Sxz6ZJ2Z54l2VAHtp5m5TWa2OEh4MABy0mrjaOMgw7d/3lAmrArCGoR8WPBBkO
         CDq3pLRsCmfPhCZLDWFA71uRYS/sNYiU4CPwn5TLW9lyeUi+XJoSdBQuQ7zs7RZqrEJy
         legA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=I2BKH6wz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a3-20020ac81083000000b0031d352c7b5esi6476149qtj.199.2022.07.12.15.06.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jul 2022 15:06:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=I2BKH6wz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:55784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBO1E-0003hG-8g
	for alex.bennee@linaro.org; Tue, 12 Jul 2022 18:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNpl-0002Gm-EC; Tue, 12 Jul 2022 17:54:21 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNpj-0007sI-2Z; Tue, 12 Jul 2022 17:54:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vYDoaLGOSh9zh6SxbCzMeBkFO57cLarjy2f54HLBIZU=; b=I2BKH6wz+Wa+/rte4WJq+CoZKx
 HvPSRzNqHajNaUNbGLZfcCTC9nU8gv+OqY5VjTB13tpQQG2hwzmRtBFg8hd/C74Br2+l0cok3oBom
 qIKwXSKZYDDv0ssnpy17DTcpy/I3ovwfmDFszMnTfqHnkTnnCe8qmj9tldb4D9aBEUH/bkru/gecV
 9Xc2tWMQTmG4C+I+3cRAF0UB9qCxStEwtO6kSQKkp2OeG3SSL79XbMWdMC3QsSQn/bJ1K16FFP/xu
 uMu9m0mGWoLggjlrBQjAVkwDG31xBdu7kJDIhOzW4wx44sY90IEc5CPjesyzPA899YemccmvrrLOy
 8/yLb2imTferhFRItuiSPhV8gbv4wDdrJxY3FFEVfv8sZRfhDPGSMRWtb06V+jHAqecphpQA8owxs
 sYAdY6A1w38iopn+ZDzzhWI9DGffGukJLQlHnpn+bBmq8GyQAIAWAXDHbGixGlMABmG3EtflVaF7Z
 d3PymSb+sZ02zazI8xorDQtG0s2PvInX0pAQV9eFEtggL/vKJB7vYELagle3qwHmG0T7+h0MS0pBB
 NeeYNe/gx+v+Mh6pxmsxXzJnpeRCg2e8a+73RczBYwEufQ5u1zXC4qmV3JN0RNyRUs8xncxSN0Rfy
 eyBSmxGRe1UgIthGWgm0UM7gx5yhJ+5HlSR+WrJoo=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNo1-000Bqt-JA; Tue, 12 Jul 2022 22:52:37 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:27 +0100
Message-Id: <20220712215251.7944-17-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 16/40] lasips2: QOMify LASIPS2Port
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
X-TUID: wmqZr+ctm7fM

This becomes an abstract QOM type which will be a parent type for separate
keyboard and mouse port types.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/lasips2.c         |  8 ++++++++
 include/hw/input/lasips2.h | 14 ++++++++++----
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index b539c4de7a..56bfd759af 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -311,9 +311,17 @@ static const TypeInfo lasips2_info = {
     .class_init    = lasips2_class_init,
 };
 
+static const TypeInfo lasips2_port_info = {
+    .name          = TYPE_LASIPS2_PORT,
+    .parent        = TYPE_DEVICE,
+    .instance_size = sizeof(LASIPS2Port),
+    .abstract      = true,
+};
+
 static void lasips2_register_types(void)
 {
     type_register_static(&lasips2_info);
+    type_register_static(&lasips2_port_info);
 }
 
 type_init(lasips2_register_types)
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 9746b7a132..f4514081fe 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -25,9 +25,15 @@
 #include "hw/sysbus.h"
 #include "hw/input/ps2.h"
 
-struct LASIPS2State;
-typedef struct LASIPS2Port {
-    struct LASIPS2State *parent;
+#define TYPE_LASIPS2_PORT "lasips2-port"
+OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2Port, LASIPS2_PORT)
+
+typedef struct LASIPS2State LASIPS2State;
+
+struct LASIPS2Port {
+    DeviceState parent_obj;
+
+    LASIPS2State *parent;
     MemoryRegion reg;
     PS2State *ps2dev;
     uint8_t id;
@@ -35,7 +41,7 @@ typedef struct LASIPS2Port {
     uint8_t buf;
     bool loopback_rbne;
     bool irq;
-} LASIPS2Port;
+};
 
 struct LASIPS2State {
     SysBusDevice parent_obj;
-- 
2.30.2

