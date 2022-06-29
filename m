Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp423714lft;
        Wed, 29 Jun 2022 05:58:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sYKAkLqU4u6llp8rBsx1/GHMQ1nIuDiMF/qvYbAQ89nXo90Lkrv7/m4D/wt3VmwjevLmgG
X-Received: by 2002:ac8:7c47:0:b0:31d:2562:4955 with SMTP id o7-20020ac87c47000000b0031d25624955mr1564975qtv.424.1656507493624;
        Wed, 29 Jun 2022 05:58:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656507493; cv=none;
        d=google.com; s=arc-20160816;
        b=TUqv3CSGG+l6BNIm9GujucMN+Ij8MvLSeQqx19ev9Zj5NDhpMByB2eWzlN8IOs6iS4
         nyDsxE66Xtn8a4GxESuVQ4j/jELFs7Jfh1nvF9hsEl9ymvMX0bwCDzC/o+BYua4sxNpX
         36nsJPNOGlmerlHIF07izXJH771qLPSaZ+sPA7NzRFff4CMlcoXl86DNgLT3Hlx/k4Jn
         rMTXOLxHw7ew6z2Exk2XDehMiqWNAXghZFhgtFcePCBlZzNQeVX3w8C34c2u/RM8nWhA
         MRjMC0g/iZ4jdpflJKbJLkF4q5OztFpkARjPiQHmqFHmgKX31MtgHM/cyJSkFJRCb1C/
         5l+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=nowFY51tVcYxldI0p/96EqP0og+7QjCadnxYo+SBE00=;
        b=deLGswnLZac78WDY/uJ3OhdjIh94hMYbK7tEcxRALTy9dBtua0rq2SgcpeAHN/pg0a
         Y+IpUH+XGJY5n81MgnRzOBpRgh84xPg7yZpPr0Hzdxxfz8DqqZ36Gb4KBjO+8LWI8mqe
         xRQaXUJaDIMV/gtIT7fA7nWcKn0IVK53ev7aa5Z8JlR4+iheLR+LTdPM/odHVmoxAzxZ
         NUTJhT7cKP76e29p/4Rkhql9woCBSAP0oFv1nblUueSblb7G9mwb9LOLCdfC9BPNiHVn
         6cQAhpsMDUmXX+ftdimO8XTZNh+4PsWmFZa3k9DZHWDDlJGrm9KsLzOBu+SYfMfOAaTg
         uVNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=NqayM4Uo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hr8-20020a05621423c800b00470a84a9742si7236366qvb.479.2022.06.29.05.58.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jun 2022 05:58:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=NqayM4Uo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:57522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6XGj-0002af-9g
	for alex.bennee@linaro.org; Wed, 29 Jun 2022 08:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X0r-0008Pr-EY; Wed, 29 Jun 2022 08:41:46 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X0o-0004iO-T7; Wed, 29 Jun 2022 08:41:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nowFY51tVcYxldI0p/96EqP0og+7QjCadnxYo+SBE00=; b=NqayM4UoHcuLtUH8S2+dpuZYe1
 Vs0XJLAalSTXy2mARly0a6LXc5B+coEDUoNUTOLWE4HgkuwWw3XSmO9rWWW4nrEPMiOA42+3ni/Gp
 TkqvcfocAhZgCnhpLH/xEzu3NEkoNhkPULXpdYv9OSqlMaDa1Z7qvxfSWomoJ3MxvweiZnF0FoeZ6
 I8EGTRjVa+vbhbZuIi+S9hFBG/KN/DmcQ4pxR9J7goskgA2ckU0c17YueKzyzOJiVxtInYWXxmrq3
 O3t8/w6g2toNGQoXnnwfw+ZtePCqq+aZnVniTDj7/5Aeg7dQkduGj9URhGZEt13k2VLoluhXsVIvA
 O3x2SsdkQmZaSvsdzSsxP5jbGAZ8t7r8c5e6ZkmCaAW95WFxBsOFjfYLIn8P3VdLKTfvE/XMHQI7l
 XjeHazVumsVhzchQh5vSDP65Kpo06ydrEcCfWpgwkMZ2ISFfkPgii5J1decQNknvBSLOHg6qasgJe
 XV8IEPveXYl8xd9u1QAKC4YEI9nzFKHtq5KkHcyHhPyKmcympustscA03Ew16Xx+GlhXuEs3shS8V
 zZxtHwAMtiH8aB9dUjB6++xW77etDnVfxoAODvpUjXSSP9zGX8D4rwjMvjps1ESHtFAsxADQAlN6S
 aIiw33kP+JfHwufS/se5MdUMUniqFJLfqnapae0mU=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wz9-0002tZ-SO; Wed, 29 Jun 2022 13:40:04 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:40:04 +0100
Message-Id: <20220629124026.1077021-19-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 18/40] lasips2: introduce new LASIPS2_MOUSE_PORT QOM type
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
X-TUID: +yFkAhJ9hLnK

This will be soon be used to hold the underlying PS2_MOUSE_DEVICE object.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c         | 7 +++++++
 include/hw/input/lasips2.h | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index b043f2e264..f70cf893f6 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -324,11 +324,18 @@ static const TypeInfo lasips2_kbd_port_info = {
     .instance_size = sizeof(LASIPS2KbdPort),
 };
 
+static const TypeInfo lasips2_mouse_port_info = {
+    .name          = TYPE_LASIPS2_MOUSE_PORT,
+    .parent        = TYPE_LASIPS2_PORT,
+    .instance_size = sizeof(LASIPS2MousePort),
+};
+
 static void lasips2_register_types(void)
 {
     type_register_static(&lasips2_info);
     type_register_static(&lasips2_port_info);
     type_register_static(&lasips2_kbd_port_info);
+    type_register_static(&lasips2_mouse_port_info);
 }
 
 type_init(lasips2_register_types)
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 504e2c06de..aab6a3500c 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -50,6 +50,13 @@ struct LASIPS2KbdPort {
     LASIPS2Port parent_obj;
 };
 
+#define TYPE_LASIPS2_MOUSE_PORT "lasips2-mouse-port"
+OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2MousePort, LASIPS2_MOUSE_PORT)
+
+struct LASIPS2MousePort {
+    LASIPS2Port parent_obj;
+};
+
 struct LASIPS2State {
     SysBusDevice parent_obj;
 
-- 
2.30.2

