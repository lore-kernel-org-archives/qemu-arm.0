Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1713909lfp;
        Tue, 12 Jul 2022 15:28:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sgax6DLW97woC7fDDZCf8qj5++m+d6BIS4YqQ0wTDatE/RWQHoByB5aumSHSHMAytKk0fo
X-Received: by 2002:a05:622a:64f:b0:31e:6182:933b with SMTP id a15-20020a05622a064f00b0031e6182933bmr254953qtb.380.1657664937672;
        Tue, 12 Jul 2022 15:28:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657664937; cv=none;
        d=google.com; s=arc-20160816;
        b=VZUhjnDCJs3iEC/qyol2D+wNsHNiazdNzOXLSKTHuxDNhwUZz6jT/q6XSTPNA2Kiaz
         j/WazLf3gbTeUKjpI+E8Nelzn7GrORcsnpJOQKaozaLCGtHOaJk1+YKxHLD6ihGzlxRS
         CJ+O0yLq5fil3jF8Atud1jK4qH5aZ5crVpQlQ3LzRUWPeOZILjZLAFoHc0L/lxqwn8YB
         QjO4FGt3/J6nJeOU1yn0vWf7VjMHiC0pQ7t5RRY4n7hfacv9YjQNtKh6/mkP46PuY1xV
         LnoY9Tszri4gY7FOSMGemPYUpAgDbnbBqlbKyJ6LCPUWpkLtKCStYDVF9iX1/LtwaDYk
         fGeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=OnuiQkD/doPGjmSJoFJNK/BQF0b2VudiyT/o1PVirc8=;
        b=gLvYXcKqdYCmYeNNUAMCtzQB14dumkvTvBjKWolN4vBr5QsX82mgTeXQ2OMgWw5MhT
         U4nGvYL0a4eUFp5BSG0G3w1VFQ5o/JB7cd+yisU/YfjpMLyb/AHXXElEbcV4Y45q+U6H
         +q4Cb7NsKWauDFSQw6Ok28uHsJe23NRrsB7UMLgczwthmTB9qcmQ44mYw5+wx8Msorj1
         5C0SPsspoM0poAphTc99kSOr8QmmjXxEifXm/meUlLV5MH89rP327txY0SUueQCTvssZ
         mRM3TOOW9UmyyK7+Gnum8tiPz857/1PJ4KcPHryyJTObmYrXwDvx8WsTx+aRnvP/wZj5
         QLNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=QqSHCGrZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6-20020a05621419e600b00473223bfb82si7245799qvc.458.2022.07.12.15.28.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jul 2022 15:28:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=QqSHCGrZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:57238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBONF-0001y4-41
	for alex.bennee@linaro.org; Tue, 12 Jul 2022 18:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqs-0004nO-V5; Tue, 12 Jul 2022 17:55:31 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqr-0008At-GJ; Tue, 12 Jul 2022 17:55:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OnuiQkD/doPGjmSJoFJNK/BQF0b2VudiyT/o1PVirc8=; b=QqSHCGrZwQRcUKnUWmGxDcrDrz
 oarMj06URswLWSoLymljotHfikFr+Vy+OaQ8oMpIPfXSBjf2zM+OOutYZbQFzjk/5MVqmBddt7tnT
 zehyKbmvNM7Nm2xb4vryXUhWhNhmPR0yqhBmHoUbx233MV9AdxmlPkV8r0DCOBBLUKqFUP+PdxqR0
 WuIXe0CDlAi0JkspEzOnhVpzs97ztDCw3WXQ0Kh005x/+bvN2DY81J5rcuNTdv6LM8fdsX9hUwGAW
 lizZCSUFgukUVWnbifuI3+HxsjPYeJ5yGOKrK7FTUGG16yKqmkY3jqCooewr9BIkDZ5V93h9T2tM/
 O/Xiv1XJ9/5nwm0Kk1Ew1hz/ETAxuWaNSYTBO2PsyVbFHKHne7KpFSxke8a79I5l8T9xJMirg4bo0
 M058RzQk0mytj7iQno2mmBuK/M3RSAehnomP/pVbqaSnfDPk9ngCharSzWOVEdVU8rdDykzeUBqRg
 kD7sT4JYy5gHlF/o7oJQ+MjW5bJV2P1T5zQFC1Unnkbht0mRCLb+ZNM9HRHavp/IcY9ngBmVWw9A+
 w/X1XHaS8FaC6q5/kbi0oDUWajIQGdG65FVUPI9dWp7uy9Ck49DIEMqrr6pj4dmiVO3KvevuGr3Bm
 e8GrszaLBsZpOoOgvhYIJ/kYmFu3JyCb7PWERjVDM=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNp6-000Bqt-8v; Tue, 12 Jul 2022 22:53:43 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:45 +0100
Message-Id: <20220712215251.7944-35-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 34/40] lasips2: update VMStateDescription for LASIPS2 device
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
X-TUID: 0EEhULCkvH+R

Since this series has already introduced a migration break for the HPPA B160L
machine, we can use this opportunity to improve the VMStateDescription for
the LASIPS2 device.

Add the new int_status field to the VMStateDescription and remodel the ports
as separate VMSTATE_STRUCT instances representing each LASIPS2Port. Once this
is done, the migration stream can be updated to include buf and loopback_rbne
for each port (which is necessary since the values are accessed across separate
IO accesses), and drop the port id as this is hardcoded for each port type.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/input/lasips2.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index e602e3c986..ea7c07a2ba 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -35,15 +35,28 @@
 #include "qapi/error.h"
 
 
+static const VMStateDescription vmstate_lasips2_port = {
+    .name = "lasips2-port",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(control, LASIPS2Port),
+        VMSTATE_UINT8(buf, LASIPS2Port),
+        VMSTATE_BOOL(loopback_rbne, LASIPS2Port),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_lasips2 = {
     .name = "lasips2",
-    .version_id = 0,
-    .minimum_version_id = 0,
+    .version_id = 1,
+    .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-        VMSTATE_UINT8(kbd_port.parent_obj.control, LASIPS2State),
-        VMSTATE_UINT8(kbd_port.parent_obj.id, LASIPS2State),
-        VMSTATE_UINT8(mouse_port.parent_obj.control, LASIPS2State),
-        VMSTATE_UINT8(mouse_port.parent_obj.id, LASIPS2State),
+        VMSTATE_UINT8(int_status, LASIPS2State),
+        VMSTATE_STRUCT(kbd_port.parent_obj, LASIPS2State, 1,
+                       vmstate_lasips2_port, LASIPS2Port),
+        VMSTATE_STRUCT(mouse_port.parent_obj, LASIPS2State, 1,
+                       vmstate_lasips2_port, LASIPS2Port),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.30.2

