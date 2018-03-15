Received: by 10.28.91.67 with SMTP id p64csp1791062wmb;
        Thu, 15 Mar 2018 12:12:17 -0700 (PDT)
X-Google-Smtp-Source: AG47ELt/SX+hLhST1jzo+RIl9cHdh89m31cx18NfKovroTSpidIcx7ERFIOHjLuneHmTrmpu/l/4
X-Received: by 10.55.246.26 with SMTP id y26mr14481056qkj.127.1521141137015;
        Thu, 15 Mar 2018 12:12:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521141137; cv=none;
        d=google.com; s=arc-20160816;
        b=QF9FyOCelPLxQKUALj2EKxco1v2z1tf3DG9/zuinjq3KCVETpoZYtqOu1XTJQpjtwc
         /dnS1eGti+gvbQekC+Z2K/K8O9HedSjOvw93uGQjQ+amRie300yodycqw6z37UA0gE5z
         oGMLP8Y92iNmd70F8sQ9Emzlckf9zVSf1mJb5UTyyb+fZGhuWXG5mQQuNVfKWARbQxkD
         TTMjRDv6ddPFhctV60gP6IuWe1/NwxOQJ3awC0UpUxHbEthI/jqrVlWyLc5Ed7x2FQ8h
         hbbhL/4XVvN/pQZlkpuvKe/nQtykcYB72poFn4k7Wops0eHAKTkzOMSKgks+NfTKSOfm
         R/pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=RAEOuQAWfmKnVJfHGL47V3EF2KPeI1ZZ9cvHSdl5MHM=;
        b=V/Zu0SSyDwUuEmZI40KuFL3uukRdf2jPN7QH5+QXM0wJN0AgziKodvZUzwz/2518uI
         N0XT4i/SrEaX8Bb6jrOsqWz2I2WR9xaz/zmkxfwPuqO6kcZFhCqpecZcbVrM6kmLu++e
         uZeEZ+vFT4WEknxDHShtHK7823vEAuY+7HQm2LZ0o3jNEiMMnby1h6cKqpUW1Cd1PGDM
         SPNQgSxe7juxiG6WlCE1dZ/oAbnb3Ue+kKDJmFHnPSk5eyfUwEjkEqZSoD3kpJLdKYB/
         Xnl/7Ku5AAKtDS2xx0MDGsmswop2PV3UJQudXthLoamZZrCgR7fwA9lJYvZZTxf8cgJk
         maTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GmOz5THH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j57si6234341qtc.107.2018.03.15.12.12.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Mar 2018 12:12:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GmOz5THH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52986 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ewYIS-000632-Cv
	for alex.bennee@linaro.org; Thu, 15 Mar 2018 15:12:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ewYIG-0005zr-Iz
	for qemu-arm@nongnu.org; Thu, 15 Mar 2018 15:12:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ewYIF-0001cm-Ca
	for qemu-arm@nongnu.org; Thu, 15 Mar 2018 15:12:04 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:32994)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ewYIA-0001Zp-Qe; Thu, 15 Mar 2018 15:11:58 -0400
Received: by mail-pg0-x243.google.com with SMTP id g12so3142160pgs.0;
	Thu, 15 Mar 2018 12:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RAEOuQAWfmKnVJfHGL47V3EF2KPeI1ZZ9cvHSdl5MHM=;
	b=GmOz5THHe4NntCbqmgblf5uj2pwfaI1KV+LtEr3gRy5JxI3FCR0t8HK/WieSSkqi6l
	PwtFQ0Y2Aw3GDLRqBmTj6Si6sOy68BGTKREcVqX8glJbRzM9kcLwZtc/AoKzzcuehanM
	iMMuQtup/vAV25XehgA9GAd6ezBCatR+ZraVWfgUwbO5LSZQRUmdyqBFywrXfY9VeBXv
	Xvxo0oKbduwRT6I/SnBF3E5Gmip8eRyZhfH5tQtKjqhoyfpEF6thkabHaHxDPvS/7oke
	RT6uvJ40NnR6v/ofVULN3cSdnIrrEuKqGivflZ68GCaZm+TajvjVv84At8NTCSxhRbAR
	AMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RAEOuQAWfmKnVJfHGL47V3EF2KPeI1ZZ9cvHSdl5MHM=;
	b=KYfL0ZCW6n8nlytxBrZuVA4S6WL5D1n1/5VuyytOfRFa8KYOU67DAtqq2yxWXGHqT+
	4p+oGluWC26XdMpK2ZYm4oG9WKRthBkjBr51ndRgqGYITzMnwlwm/32RNXADUK660YBD
	j3l7SQA3HXGXZbBkUonmFMRBml3fauEwzCX3xQs5WmYtnhAcIFgx3/MH4Q9TTJNqdewQ
	Kz2oUKsE84+uq/B+mrMXKMowkQyeoU4PpNJWcikVoU0Qs6tcskzXbuHqdIGg8CCX+VsU
	XevF3JY5EeRB6B9W9tDFlyefLvv0OEjO7Z9cYbguSnlvURX7S60LymnjYhfE0sRwdmD/
	slqA==
X-Gm-Message-State: AElRT7FPdI2JhhRYJ5ol3Pop/nvOJzk17ewf5IBxF+qR3+h0VK2w6YcP
	xUnE57zFkY4cw9SC0PwQ3Do=
X-Received: by 10.98.87.212 with SMTP id i81mr8674617pfj.197.1521141117777;
	Thu, 15 Mar 2018 12:11:57 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	d193sm9732665pgc.30.2018.03.15.12.11.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 15 Mar 2018 12:11:57 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Mar 2018 12:11:41 -0700
Message-Id: <20180315191141.6789-2-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180315191141.6789-1-andrew.smirnov@gmail.com>
References: <20180315191141.6789-1-andrew.smirnov@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-arm] [PATCH 2/2] char: i.MX: Add support for "TX complete"
 interrupt
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Bill Paul <wpaul@windriver.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: li77nmXPaMEY

Add support for "TX complete"/TXDC interrupt generate by real HW since
it is needed to support guests other than Linux.

Based on the patch by Bill Paul as found here:
https://bugs.launchpad.net/qemu/+bug/1753314

Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: Bill Paul <wpaul@windriver.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---

Bill:

I only tested this with i.MX7/Linux guest combo and am hoping you can
take this and previous patch and give it a try on your VxWorks setup.

Peter:

Bill is the author of original code, so I am not sure how to handle
Signed-off-by from him. I'd like to add it to this patch, but since
his original submission to launchpad didn't have one it is currently
omitted.

 include/hw/char/imx_serial.h |  3 +++
 hw/char/imx_serial.c         | 20 +++++++++++++++++---
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/include/hw/char/imx_serial.h b/include/hw/char/imx_serial.h
index baeec3183f..5b99cee7cf 100644
--- a/include/hw/char/imx_serial.h
+++ b/include/hw/char/imx_serial.h
@@ -67,6 +67,8 @@
 #define UCR2_RXEN       (1<<1)    /* Receiver enable */
 #define UCR2_SRST       (1<<0)    /* Reset complete */
 
+#define UCR4_TCEN       BIT(3)    /* TX complete interrupt enable */
+
 #define UTS1_TXEMPTY    (1<<6)
 #define UTS1_RXEMPTY    (1<<5)
 #define UTS1_TXFULL     (1<<4)
@@ -95,6 +97,7 @@ typedef struct IMXSerialState {
     uint32_t ubmr;
     uint32_t ubrc;
     uint32_t ucr3;
+    uint32_t ucr4;
 
     qemu_irq irq;
     CharBackend chr;
diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
index d1e8586280..1e5540472b 100644
--- a/hw/char/imx_serial.c
+++ b/hw/char/imx_serial.c
@@ -37,8 +37,8 @@
 
 static const VMStateDescription vmstate_imx_serial = {
     .name = TYPE_IMX_SERIAL,
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .fields = (VMStateField[]) {
         VMSTATE_INT32(readbuff, IMXSerialState),
         VMSTATE_UINT32(usr1, IMXSerialState),
@@ -50,6 +50,7 @@ static const VMStateDescription vmstate_imx_serial = {
         VMSTATE_UINT32(ubmr, IMXSerialState),
         VMSTATE_UINT32(ubrc, IMXSerialState),
         VMSTATE_UINT32(ucr3, IMXSerialState),
+        VMSTATE_UINT32(ucr4, IMXSerialState),
         VMSTATE_END_OF_LIST()
     },
 };
@@ -71,6 +72,11 @@ static void imx_update(IMXSerialState *s)
      * unfortunately.
      */
     mask = (s->ucr1 & UCR1_TXMPTYEN) ? USR2_TXFE : 0;
+    /*
+     * TCEN and TXDC are both bit 3
+     */
+    mask |= s->ucr4 & UCR4_TCEN;
+
     usr2 = s->usr2 & mask;
 
     qemu_set_irq(s->irq, usr1 || usr2);
@@ -163,6 +169,8 @@ static uint64_t imx_serial_read(void *opaque, hwaddr offset,
         return s->ucr3;
 
     case 0x23: /* UCR4 */
+        return s->ucr4;
+
     case 0x29: /* BRM Incremental */
         return 0x0; /* TODO */
 
@@ -191,8 +199,10 @@ static void imx_serial_write(void *opaque, hwaddr offset,
              * qemu_chr_fe_write and background I/O callbacks */
             qemu_chr_fe_write_all(&s->chr, &ch, 1);
             s->usr1 &= ~USR1_TRDY;
+            s->usr2 &= ~USR2_TXDC;
             imx_update(s);
             s->usr1 |= USR1_TRDY;
+            s->usr2 |= USR2_TXDC;
             imx_update(s);
         }
         break;
@@ -265,8 +275,12 @@ static void imx_serial_write(void *opaque, hwaddr offset,
         s->ucr3 = value & 0xffff;
         break;
 
-    case 0x2d: /* UTS1 */
     case 0x23: /* UCR4 */
+        s->ucr4 = value & 0xffff;
+        imx_update(s);
+        break;
+
+    case 0x2d: /* UTS1 */
         qemu_log_mask(LOG_UNIMP, "[%s]%s: Unimplemented reg 0x%"
                       HWADDR_PRIx "\n", TYPE_IMX_SERIAL, __func__, offset);
         /* TODO */
-- 
2.14.3

