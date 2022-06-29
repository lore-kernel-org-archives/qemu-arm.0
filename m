Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp421933lft;
        Wed, 29 Jun 2022 05:55:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v300J7y46Xv6gDf8uTL7s1g9dc5H/Bs5ABkQHlPL41lkBuB3ltD+geokmUxE5h5PRqhmxO
X-Received: by 2002:ac8:5c91:0:b0:305:2c4e:47d4 with SMTP id r17-20020ac85c91000000b003052c4e47d4mr2199797qta.531.1656507323008;
        Wed, 29 Jun 2022 05:55:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656507323; cv=none;
        d=google.com; s=arc-20160816;
        b=kHVowK3gQHZyAzbqSLUBe5micXVo/FcLkU4mANlXmSjuYGd4fIeoQbFCBTaVY37l0N
         kZXnDaLuaWSe/qFwZM45ZXYMm0XquDlwdyBcTbEaRrmjcSMUk/JRkjJTHpAzaobmK/Aa
         0gQ9wbWRFe+mtYeHUw+1ZW6UENTb72H8EVKKzGrInOMgVyvja5E6Oo93Ij4YfUgyMXE0
         fRtk7qJVptU25RAHmHWLO2mkMpDd3Diu8YbMP6dMXksgiBnX8nQ6qadyYwHfCAW76wB0
         0msG734QdTd+bFeBRjEMS83MiDqGylkp6jCGQKeV5A4AAbHbaw+3/y+qkdcubWtEhs8w
         K1RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=DoNOeL8PBXDleC4tnUHr2YHr4mUwvSyUZJ6zT0cVGLk=;
        b=CasWAInXiEZ7QKH91Lm6t3W7sZdbxG5umoZMoQwpov+A/qmALcZptDRlcTC7Fir2TK
         VLhTzieZHfhowIaAuvuQlfqgjreVGKfKoM80KL9Iyo0cJxTWp3+hD7C5b5egYkDSISzt
         MuXefimsVXL6aFiVbP395qsqJSny6+0CWQSAg0TtqAkNGWuU6ftBzjHAtpxJ+YdBBQJ+
         5X5OMMWIUbvhe3JfG92W+5MVirINdDaLWyuPerBTHFrV/Q8Fl9gLlIdJIZFvUblEMBcG
         71jGA4iz6tht1EfDVqIIgGqF5/InsR3NonBljc6kgIyYJvXi+naFbkvyuJNBWD+Go1Ga
         i9sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=hIaLW4RX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jn9-20020ad45de9000000b004727475e220si3825373qvb.59.2022.06.29.05.55.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jun 2022 05:55:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=hIaLW4RX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:52348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6XE2-0007NC-Cj
	for alex.bennee@linaro.org; Wed, 29 Jun 2022 08:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X0m-0008MQ-Cy; Wed, 29 Jun 2022 08:41:40 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X0j-0004iA-NM; Wed, 29 Jun 2022 08:41:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DoNOeL8PBXDleC4tnUHr2YHr4mUwvSyUZJ6zT0cVGLk=; b=hIaLW4RXAkAuu/0biEfih/S6M0
 /4BhjAo0uIJKlqd3o+CuoqzpF87YL1LJPtRo+7c4AzxwFyrZLtsehQAa2hhF8RLJGFjIBBaAuI2PG
 kBFjBG17wfN45VgO7jr2zYP06RDwstoCuIE8ZCOQlpRnlgDC7vZinJOHLpAR/JeKMsi7dVxYSLeOu
 hdB/cQLar+A3Nwj733foWkxRbqPzneFaLUthAallJ7psP532/JLXJ/lTX8REz+BnYoNYhAfo+xYMk
 eS+TOYCqAr9R7rPNLlGp5wyMcDP5cthG+AFx6Ukw1itV906wRgPsjyxBCzujydt9+jFbrr0WYfN0+
 u1NHyIyqgv1u/sPwX9RlJaqlN3EN44mOST5OGA4HAPMJRftGADCwNAxeaS4qdyQMpek7Vx7nipj2n
 HIl5P48su0G/Zx8v0a/5hCpmxZywQSPJ/haL8Tk35+k2JiwqAadThiXhGgg9BO/yQoTqmEUXaD15J
 1OrCRyqEP24POR+d0xFgo+87US261DYcxdQ3UKA9RCPMh+KhvTbbqt36Y+2wySVunT1cPp+szT2It
 /uUG9n+AHt49RNzsRst0y4y0F8MjYZO87XruU40mL1f7vhgQRWUQB7gppjLzUPC2xdLZmC7cvkm96
 xfd2UIKrd4G5q4ogmDvmzAkDg5utQ96Picx4xMQEE=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wz9-0002tZ-E3; Wed, 29 Jun 2022 13:39:59 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:40:03 +0100
Message-Id: <20220629124026.1077021-18-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 17/40] lasips2: introduce new LASIPS2_KBD_PORT QOM type
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
X-TUID: oSSUBXnUYaYx

This will be soon be used to hold the underlying PS2_KBD_DEVICE object.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c         | 7 +++++++
 include/hw/input/lasips2.h | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 56bfd759af..b043f2e264 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -318,10 +318,17 @@ static const TypeInfo lasips2_port_info = {
     .abstract      = true,
 };
 
+static const TypeInfo lasips2_kbd_port_info = {
+    .name          = TYPE_LASIPS2_KBD_PORT,
+    .parent        = TYPE_LASIPS2_PORT,
+    .instance_size = sizeof(LASIPS2KbdPort),
+};
+
 static void lasips2_register_types(void)
 {
     type_register_static(&lasips2_info);
     type_register_static(&lasips2_port_info);
+    type_register_static(&lasips2_kbd_port_info);
 }
 
 type_init(lasips2_register_types)
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index f4514081fe..504e2c06de 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -43,6 +43,13 @@ struct LASIPS2Port {
     bool irq;
 };
 
+#define TYPE_LASIPS2_KBD_PORT "lasips2-kbd-port"
+OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2KbdPort, LASIPS2_KBD_PORT)
+
+struct LASIPS2KbdPort {
+    LASIPS2Port parent_obj;
+};
+
 struct LASIPS2State {
     SysBusDevice parent_obj;
 
-- 
2.30.2

