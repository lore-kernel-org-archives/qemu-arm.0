Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp435508lft;
        Wed, 29 Jun 2022 06:12:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1smEqOvgWsZZm1WjbND+zECPgBOz7yw13vUuVQK+uR81tTyrVJge1STrSI60D3BVZdtesoJ
X-Received: by 2002:a37:a3ce:0:b0:6ae:fbe4:9642 with SMTP id m197-20020a37a3ce000000b006aefbe49642mr1905682qke.388.1656508337917;
        Wed, 29 Jun 2022 06:12:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656508337; cv=none;
        d=google.com; s=arc-20160816;
        b=TLbLz5CnPPJIot9+olTGCNlcmen6Xh7Zt+/kp95T5l0NKoeRwlmwG9zJNJmxJ9G/tV
         MSaloPeNFYkXspxht/GaCTIyO09A8dM3wR9FhM1Q9ZdUS7ls3q2hv7C6eSk/TAqKrMx/
         LdY9zzA5vPgmqnXsjS12w7k/9DvW1vkOtRYakTCUe4xyFRuWN1eNv/2/yhBLceqsRwch
         WWssUSYXBVl7lotxkGyCCxwINEzqUrCzG2d8uIzwhS1Tj46ErwmRSGwAeoAqG9+uHav7
         yFG9JFq/ZX8dxNM4ZRJBGG0RL1sTuFGZEVVxTkDCoeQRfkiIRau5entWcDXtpkyifQKC
         08rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=VbEztOvZKnUh4SGBoT9UTzIiDKN7bLNMRRsKDrU5JdM=;
        b=Bh8I166Av8IQSFb8A6Q849iRFZDfEhnQxxeUBS0E939T2VAN2nuOsv9emCgtfzfqlC
         e7cL2kH2wr3WmtgtU6ojz/KQbdoFKTq0o8inrLY5/aVarndnILVnvsIjakhnXDoV+4lW
         yHhJMKb1WgbZb18uteOHJc9pV+TJeSN7e0nqNiGxe2qBXaYMYOss97V2df3xmnSzklji
         ectJPWihA6S407ksAnKCh4JKdhmR2WGuO56N7OgN3sleXXyDbnlG1ycHeU/h762z37sZ
         lJStL6XSIqMgALWbS3zyjRrr6HQYBgdICfspqNaWZgpIcQoiftc3Hi+2b1jQJve4KzWz
         ZX9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=ThvUZTUk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7-20020a05620a24c700b006af2404de51si5262020qkn.688.2022.06.29.06.12.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jun 2022 06:12:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=ThvUZTUk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:51126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6XUO-0001U7-9j
	for alex.bennee@linaro.org; Wed, 29 Jun 2022 09:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1A-0000Qv-An; Wed, 29 Jun 2022 08:42:04 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X18-0004kc-KG; Wed, 29 Jun 2022 08:42:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VbEztOvZKnUh4SGBoT9UTzIiDKN7bLNMRRsKDrU5JdM=; b=ThvUZTUkq0/QYGdfGNzDjcKztH
 1bvBsARzHOhs+A5kjhJ46F+eV103DowyZv8qb3Dccfmn7EJDrlKbZNSdn2Jve929eQ3aEXesjYdN3
 xLTfgbF7jT7rfl7X+C9zAdI4d57lGK9zhmS3I1UUFxO/tDoPclAJoN4Qkmm7/SXbgZ9LcSWDj3S5m
 znpPlWCM2RvPDHDkO0bpg+59Uo1GLtD4w03o7QpiZmYRfE7mCBY6tjgcTU63fsuolKUA4n3Tr5Ioa
 RNEnnQL6zHCgpouZ2gkoLNfQVCbS8RnOx+ogUevBlpe3qn+LtgWJsJ1lCbvDSWTX193eBiELlMP/Y
 zLnhzgeP1sbc1PKJRRCcKNo47xG5LgFqn4Fw7oJibToZrBthKPh8Ag7EqtX+YZFAWnbXrIHDMX6vf
 wmjYc7sjMacefbsNcoxbB58Tj79DiWcfVQWPLyYka+Am9iDaXfB4y5NuByX8C0eOlghwYD+aIxuus
 2uc02nUGugvoEkYHPFLH+9yGOaKSE+VTxK+tcbCn0x9y3xk0D4Hy7MJ+0ta0unpNZJmJWoqILbmAF
 86GR6oFbcxuFHtajfYPFuQuFI1iQbOPlhqbxl5GpN9AD1lMXLYdjOwrxvQmoLrVyVlVn7+jQMdijs
 7Y3LYsvE99YL2Qr8u+C393827VuuLDYe0LbR6wbpE=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6WzR-0002tZ-1b; Wed, 29 Jun 2022 13:40:21 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:40:08 +0100
Message-Id: <20220629124026.1077021-23-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 22/40] lasips2: introduce lasips2_mouse_port_class_init() and
 lasips2_mouse_port_realize()
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
X-TUID: JsH/I9IiPXTK

Introduce a new lasips2_mouse_port_class_init() function which uses a new
lasips2_mouse_port_realize() function to initialise the PS2 mouse device.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index b4fdaed5cb..ce87c66f2a 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -277,7 +277,6 @@ static void lasips2_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    lp->ps2dev = ps2_mouse_init();
     qdev_connect_gpio_out(DEVICE(lp->ps2dev), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-mouse-input-irq",
                                                  0));
@@ -363,6 +362,13 @@ static const TypeInfo lasips2_kbd_port_info = {
     .class_init    = lasips2_kbd_port_class_init,
 };
 
+static void lasips2_mouse_port_realize(DeviceState *dev, Error **errp)
+{
+    LASIPS2Port *lp = LASIPS2_PORT(dev);
+
+    lp->ps2dev = ps2_mouse_init();
+}
+
 static void lasips2_mouse_port_init(Object *obj)
 {
     LASIPS2MousePort *s = LASIPS2_MOUSE_PORT(obj);
@@ -374,11 +380,19 @@ static void lasips2_mouse_port_init(Object *obj)
     lp->parent = container_of(s, LASIPS2State, mouse_port);
 }
 
+static void lasips2_mouse_port_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = lasips2_mouse_port_realize;
+}
+
 static const TypeInfo lasips2_mouse_port_info = {
     .name          = TYPE_LASIPS2_MOUSE_PORT,
     .parent        = TYPE_LASIPS2_PORT,
     .instance_size = sizeof(LASIPS2MousePort),
     .instance_init = lasips2_mouse_port_init,
+    .class_init    = lasips2_mouse_port_class_init,
 };
 
 static void lasips2_register_types(void)
-- 
2.30.2

