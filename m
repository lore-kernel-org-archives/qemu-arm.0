Received: by 10.223.159.74 with SMTP id f10csp7093728wrg;
        Thu, 14 Dec 2017 19:21:25 -0800 (PST)
X-Google-Smtp-Source: ACJfBosRhxXEv5aUB3tl+tlFuExhLvqRwNQvnExD9HZ3aK35L5Jgt1ktMNX5yAICPJxsaCr/Ch8L
X-Received: by 10.37.185.207 with SMTP id y15mr6000186ybj.102.1513308085092;
        Thu, 14 Dec 2017 19:21:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513308085; cv=none;
        d=google.com; s=arc-20160816;
        b=d90EVqqKNE1B8Nt8zJr9nQcMfymDfg63/kdAG9SQwqseXPtmcIo97Uwjpr6+rycAaH
         9CFrHzxvM6pd7WxvBITRgVFJw1cCyinlZU+GYdw0waJKlOOuZf8iNQiA3hNfl+qSxXyT
         NqiOo9GRqUBk3f9zYancarYBnI1hA52bJM+QWyaqk6od0EYatxxkt+7wDwNO1qM/XD+O
         qwTQPAKIhgilJN/BuQKMT9BvZociqFqFOCUfGC9yhdkhYQgVFlgKk0BqeLClRlK92B8C
         xTLlW67dxLwV+MsbH8gzGJvIl5oXkZOzdWvpW/9M4hBHCqOrNPfBl69xJqmTtHoyATRi
         1F4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=TMwWmdstrcnSudHAvX0LaZgcSc8QP3696KzBEhx1+pY=;
        b=MGBQp3KhP8O5MdQPKHhomMVV2jOOGhjSdP0NBSmlulcY6TIICxrIMIr0BBiX/z1whH
         iaSa+oxr25eXxeicXhsndybZvwQ7Ad/XYwitvrkWBDLNVFY0axpwXXSl6E8cmmY6lFo7
         YmHnvcimKLjX/Bkbjboez7JEtv6ETg8XfJpqzCp5m9J/YZSjblIgnBb2+kDtR0IIVIZT
         dUIFXz10zvlL1sVepmSywA9Ab91DfTCQD4LftATWqVSGIZugYzKZnl7mEcv7RKqOc6r/
         Xp1qjE9k/BrnYqLJnImNWIXyyL4vbe5oqTt60YHLlacP0u+DmP0kaLNZ9YtedXHVf7ml
         Vahw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iI25wkhX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k8si1096184ywi.613.2017.12.14.19.21.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 19:21:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iI25wkhX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43978 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePgYu-00013v-Ew
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 22:21:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUD-0005nM-9i
	for qemu-devel@nongnu.org; Thu, 14 Dec 2017 22:16:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUA-0000ys-57
	for qemu-devel@nongnu.org; Thu, 14 Dec 2017 22:16:33 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:43731)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgUA-0000yM-10; Thu, 14 Dec 2017 22:16:30 -0500
Received: by mail-qk0-x241.google.com with SMTP id j207so8836274qke.10;
	Thu, 14 Dec 2017 19:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=TMwWmdstrcnSudHAvX0LaZgcSc8QP3696KzBEhx1+pY=;
	b=iI25wkhX3VdnDBWu266vG/ENBNtxTdXzWd850AkhKacm+pmWabGbr5HEF6OhjGWpns
	wVo+qL2AAcoPrAsYHjONZuHUBumPCBeodSdQgGgdaJRAQPBX6P3qHMdFZXOd11AGddJS
	NOEwkMUB0ylmN6n41+7T3rTBO+odBhd9HfgVjb0VTQmqFy8vIqPXSJuF3cOflDQQaODf
	gTDvheKf1i3pdjPgJKU6pUiI9xq193+S3rmCSTnqfBcUdUrPVg8AVx1F+SEkcAMu8fKs
	ECzOv48COWZr4iI+pUS3o2cRUfckK9SJJvfnz4hBcVTapovdDBf7eUJNbwyRMjBfNFg+
	2eMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=TMwWmdstrcnSudHAvX0LaZgcSc8QP3696KzBEhx1+pY=;
	b=sFSga5HPhpPU//BXIt346dixZOr5YkNP5h3qryIB7fqa1bb/DjahHYiNiaKa963+p4
	rhV9blB5dCEkjgT6ETBbTVM4YwVcJapl0mxC/YYhhvVfRw+xJSeFMIHS4uJPKoudq8Qj
	vdEesA7uQvSPuss84X8GS3gN/nTaLnv/j9XO97T+XvIyVSsI4I0hTSnaR2gGaD6oBoSi
	2siLZhDoVeuPCFj7++c4S59wvMdZLv8tG8FJfQZ8N3tG4zaGW8nhALaw/dnPPhwh4td7
	+0D/iJuaWjx5zImnNmtNK3ACEpA+xfhrHHmuv5ZGms/9Z16vIHqfk/e1/cQ3V1L+aNk2
	Rn5w==
X-Gm-Message-State: AKGB3mLouVk7Xq8Gi45e4/TViMOr0/YlhL5aA7750rq66+C04rsNIuBt
	otiGbN6EXFwGNs/q4EtnuUM=
X-Received: by 10.55.188.6 with SMTP id m6mr19503167qkf.75.1513307789617;
	Thu, 14 Dec 2017 19:16:29 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	l125sm3484740qkc.3.2017.12.14.19.16.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:16:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>
Date: Fri, 15 Dec 2017 00:15:33 -0300
Message-Id: <20171215031547.31006-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215031547.31006-1-f4bug@amsat.org>
References: <20171215031547.31006-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-devel] [PATCH v2 06/20] sdhci: refactor common sysbus/pci
 class_init() into sdhci_class_init()
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
X-TUID: MdfMeZbAcbAZ

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index fc5bac5cb9..f574495b19 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1283,6 +1283,16 @@ static Property sdhci_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static void sdhci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
+    dc->vmsd = &sdhci_vmstate;
+    dc->props = sdhci_properties;
+    dc->reset = sdhci_poweron_reset;
+}
+
 /* --- qdev PCI --- */
 
 static void sdhci_pci_realize(PCIDevice *dev, Error **errp)
@@ -1306,7 +1316,6 @@ static void sdhci_pci_exit(PCIDevice *dev)
 
 static void sdhci_pci_class_init(ObjectClass *klass, void *data)
 {
-    DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
     k->realize = sdhci_pci_realize;
@@ -1314,10 +1323,8 @@ static void sdhci_pci_class_init(ObjectClass *klass, void *data)
     k->vendor_id = PCI_VENDOR_ID_REDHAT;
     k->device_id = PCI_DEVICE_ID_REDHAT_SDHCI;
     k->class_id = PCI_CLASS_SYSTEM_SDHCI;
-    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
-    dc->vmsd = &sdhci_vmstate;
-    dc->props = sdhci_properties;
-    dc->reset = sdhci_poweron_reset;
+
+    sdhci_class_init(klass, data);
 }
 
 static const TypeInfo sdhci_pci_info = {
@@ -1361,10 +1368,9 @@ static void sdhci_sysbus_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
-    dc->vmsd = &sdhci_vmstate;
-    dc->props = sdhci_properties;
     dc->realize = sdhci_sysbus_realize;
-    dc->reset = sdhci_poweron_reset;
+
+    sdhci_class_init(klass, data);
 }
 
 static const TypeInfo sdhci_sysbus_info = {
-- 
2.15.1

