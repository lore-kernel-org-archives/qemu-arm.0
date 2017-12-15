Received: by 10.223.159.74 with SMTP id f10csp7092208wrg;
        Thu, 14 Dec 2017 19:19:13 -0800 (PST)
X-Google-Smtp-Source: ACJfBotId6+/SAh+xAGmcItwgBRQxgm15o0ahu11cy0CguA4w8/7JW7DirWgOhKEYjF9fwgtM7YQ
X-Received: by 10.129.41.18 with SMTP id p18mr6012830ywp.245.1513307953841;
        Thu, 14 Dec 2017 19:19:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513307953; cv=none;
        d=google.com; s=arc-20160816;
        b=kxZWbarxN17yCTboLG+Obe+IPaLicfHXzpok8zzMHdmobmT2v/G4lsVhG2JF/qjxc3
         8v+LFviSJRB840t/X30STV0r72ROCJsAw3rQKvicYT32kOy6IBuNonsYvXrX5CH448dw
         EBu67/fyZRI9eRKlgKT6VZ5yIXFzi4YPRkJPh5NVxE0ahGU+ZegU926VaCz18+E0nUlW
         nn8KGbICOCsXt1rPdGjgbhH5RwVi5viSjpwxjvomRzKRSMRd0u7k5UQIoIFdKmtCuqGD
         UcJRegY71DhK9N9IiwA4YgB6UYOnz4Xwpe4hM1sl8r36WJApkWD/RwPAhCGXZEubrRrK
         NOkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=5pfinWsdwnR1Jc7lTvX1Xe+KRjO8N5jDEN+jgmrkaEU=;
        b=O8RBRgIz2tGdO9RiGcMPcHiP49BvDCyDgb81vD757NkcYJq7vB4YvvGl0yfIAoYgnx
         7SY/K93Auh/6AOS/Gxus+PYfgYMjcaUOqyLY4E4qh5p5G4S7hVROaCmJtRb/b4NkO2bg
         i0vOn9PiIxEdaM+heZ9IfR7oQuX27PBNDsBKmlh2E3iZHv1WF+ISlO4L+FCJDN5ATc3j
         qKOHmNl2o1PUvHmNziyGlmGms1EmSMCsfERAHg7YO2Bs+PO+iIrxfZQq32RTlMFhFDBC
         9pQEpXidvYdDDvwEJYm9j+navDbNSXz0UY6MrA9xYdmJSK6UAiYrnbf4L3xBgcVlZsf2
         +OBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ct9qKrJc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z132si1101874ybb.384.2017.12.14.19.19.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 19:19:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ct9qKrJc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43954 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePgWn-0007WT-8j
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 22:19:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53589)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgU4-0005gL-6g
	for qemu-devel@nongnu.org; Thu, 14 Dec 2017 22:16:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgU1-0000rP-22
	for qemu-devel@nongnu.org; Thu, 14 Dec 2017 22:16:24 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:43731)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgU0-0000qx-TW; Thu, 14 Dec 2017 22:16:20 -0500
Received: by mail-qk0-x243.google.com with SMTP id j207so8835929qke.10;
	Thu, 14 Dec 2017 19:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=5pfinWsdwnR1Jc7lTvX1Xe+KRjO8N5jDEN+jgmrkaEU=;
	b=ct9qKrJcDUJIfcsLynFnxks62wpCm4meFFl/iqOtxPeAtUsuwJhFkSBzccAuf4Wkyn
	yMh/MHY4cpt9OMeFwmglBTXiSpZBuJeGSUCgbnxc0CSTTv+9mbuDq+qsbpPBZSYsBp53
	GRdQ/Aj9ZmEDhFoO/eYrBXXjbnvmzdTPJ2p/LNHDbOeGqV9C8N2y8iggKqEw6gyVf332
	yjRvISlWgynsUhOkkGSqW88lmefzAzZD7vNUZ3Yb/0VupynOHid/2G3+IiHfZDXyP1dZ
	IfIOnVSMEMCOlO13CQwJDeE8vI2NgszmhG2as1oINVjdyXyRUHLyrmAmaFdDG3RcIbD7
	Rukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=5pfinWsdwnR1Jc7lTvX1Xe+KRjO8N5jDEN+jgmrkaEU=;
	b=WQwZFu7rvtTWMwOC+g5YEZcNRL8XwOajZ6jc6eG152uaSQNwJtrCQJ9sGOgnO+HQ1r
	A2efcTQFxw3BO2ykakYTCq02Y3a4EEdYe0Ol65BrNJgC9eYhGJyoQwxEvQ6eeuddwwdI
	qd3VZsx/97c9xbX1La1URdtkhWqoJ7IufvRgyE2k6QK52SgCydAVxGyX8riL1BcSNh2a
	H0naqwY6rvkB6MCRo5gWqVdJSdsWFrwyzcYSlRoVcNZFzyfoX/fzaSLYg9j2NjzAEosC
	F1Pk5chR8T9DpQm/lTpWwp9/+UjlyvBZWnWeBDWvnrV2fl8djzRqBZ1atJRjKzG/Bu9f
	0KQA==
X-Gm-Message-State: AKGB3mKQrCkRQYYHrR9daOjCM0ghUlsb9iVrJi2uFIIChnhOzlCY16kS
	qRk4YK9XAnkMlhUbyIoCGtc=
X-Received: by 10.55.166.82 with SMTP id p79mr19919596qke.302.1513307780433;
	Thu, 14 Dec 2017 19:16:20 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	l125sm3484740qkc.3.2017.12.14.19.16.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:16:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>
Date: Fri, 15 Dec 2017 00:15:31 -0300
Message-Id: <20171215031547.31006-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215031547.31006-1-f4bug@amsat.org>
References: <20171215031547.31006-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-devel] [PATCH v2 04/20] sdhci: refactor same sysbus/pci
 properties into a common one
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>,
	qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bx8R0R0H8ozv

add sysbus/pci/sdbus separator comments to keep it clearer

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 2823da00da..dbdfd54350 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1265,13 +1265,17 @@ const VMStateDescription sdhci_vmstate = {
 
 /* Capabilities registers provide information on supported features of this
  * specific host controller implementation */
-static Property sdhci_pci_properties[] = {
+static Property sdhci_properties[] = {
     DEFINE_PROP_UINT32("capareg", SDHCIState, capareg,
             SDHC_CAPAB_REG_DEFAULT),
     DEFINE_PROP_UINT32("maxcurr", SDHCIState, maxcurr, 0),
+    DEFINE_PROP_BOOL("pending-insert-quirk", SDHCIState, pending_insert_quirk,
+                     false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
+/* --- qdev PCI --- */
+
 static void sdhci_pci_realize(PCIDevice *dev, Error **errp)
 {
     SDHCIState *s = PCI_SDHCI(dev);
@@ -1304,7 +1308,7 @@ static void sdhci_pci_class_init(ObjectClass *klass, void *data)
     k->class_id = PCI_CLASS_SYSTEM_SDHCI;
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
     dc->vmsd = &sdhci_vmstate;
-    dc->props = sdhci_pci_properties;
+    dc->props = sdhci_properties;
     dc->reset = sdhci_poweron_reset;
 }
 
@@ -1319,14 +1323,7 @@ static const TypeInfo sdhci_pci_info = {
     },
 };
 
-static Property sdhci_sysbus_properties[] = {
-    DEFINE_PROP_UINT32("capareg", SDHCIState, capareg,
-            SDHC_CAPAB_REG_DEFAULT),
-    DEFINE_PROP_UINT32("maxcurr", SDHCIState, maxcurr, 0),
-    DEFINE_PROP_BOOL("pending-insert-quirk", SDHCIState, pending_insert_quirk,
-                     false),
-    DEFINE_PROP_END_OF_LIST(),
-};
+/* --- qdev SysBus --- */
 
 static void sdhci_sysbus_init(Object *obj)
 {
@@ -1359,7 +1356,7 @@ static void sdhci_sysbus_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->vmsd = &sdhci_vmstate;
-    dc->props = sdhci_sysbus_properties;
+    dc->props = sdhci_properties;
     dc->realize = sdhci_sysbus_realize;
     dc->reset = sdhci_poweron_reset;
 }
@@ -1373,6 +1370,8 @@ static const TypeInfo sdhci_sysbus_info = {
     .class_init = sdhci_sysbus_class_init,
 };
 
+/* --- qdev bus master --- */
+
 static void sdhci_bus_class_init(ObjectClass *klass, void *data)
 {
     SDBusClass *sbc = SD_BUS_CLASS(klass);
-- 
2.15.1

