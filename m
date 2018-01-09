Received: by 10.28.173.206 with SMTP id w197csp3163531wme;
        Mon, 8 Jan 2018 18:08:04 -0800 (PST)
X-Google-Smtp-Source: ACJfBovFc5jK+O6byp0wQ03P6vVt9n7NTg9EaZQrs9LPFnyPUW+8tnk+fTNjrnlaDcuJv46vrzA4
X-Received: by 10.37.61.7 with SMTP id k7mr13085359yba.87.1515463684106;
        Mon, 08 Jan 2018 18:08:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515463684; cv=none;
        d=google.com; s=arc-20160816;
        b=0ABsiAqLcwAYMn6AxG5FWOC9rDhnXr9R8bPKwP35Z1DPM6yhSZOgjiM4EzJ0M99Bad
         /9sCzzDpKxcvQwFfg+P5UKRrpQuD0+KUd4nH15OPaXxiBPTdE0GWzExebsit5d9SRRuh
         7OFE1PTefc6dMVj0EBuSBLyycKPnTZfEumvfitURrzxNtt5KEQKn0kI7TCHPj3Xe3Wy5
         8C3bk+oxeWiBqLnQEvsiDvU0X5W1P+GMn/teqdFpCIpxv+aAtt+WXjre1PlWK+TS+fu6
         i2XF/lUVb5cIKCHFeS2f3rhpGyTbtjW7yyHS4uXcQelydcWFhlly15sySmh8WHWha3WC
         h+LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ZOTaH/UnVeLSQKwA/VibZPZW/1zvBtksWbl57K3vjP4=;
        b=ibL2YRfAc7UxW8CJyCLbvszZnzPYZ6bRvrOhwDOduAwU8+heHuX6xXqSdufI+wVj+j
         frYRIu76zs9RZ/GpiEHv5d9m0Z9pF81fEYZzQofRKyk0XkroI2gI9Ed8rRLBBecwhnEi
         oUiawvtmVY3W9jcu0mZuCOyDKxOBmCvlreyUK2AmiepuH4nG4psdJTmmGwx1gSpDiPEW
         OLKlgPNaxaZGRP8droRQFnpVe5Wk/a957E8n9jHw2tvZIUbR6+7VrEw2VNjeNz/ZUC3U
         g8cqwQCxA3pOGEIgKlZ4Zs7sWQpBI6+K2e6totsLJPXqMH9L0RSCUneqijnQ0Sl2fu7g
         QJAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oldsV3Oq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g4si567396ybd.563.2018.01.08.18.08.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 18:08:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oldsV3Oq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45883 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYjKd-0006ny-J7
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 21:08:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjES-00023D-UQ
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 21:01:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjEP-0002Q2-6k
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 21:01:40 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:41096)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYjEP-0002Pg-2k; Mon, 08 Jan 2018 21:01:37 -0500
Received: by mail-qt0-x242.google.com with SMTP id i40so16085896qti.8;
	Mon, 08 Jan 2018 18:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ZOTaH/UnVeLSQKwA/VibZPZW/1zvBtksWbl57K3vjP4=;
	b=oldsV3OqXGNEKYuyJsLxyfh4dqutLUkJTs70dKCa8AAhhVdnbVTWRTvrvA1MRU7cYJ
	9Y9g6+j7Utirauux9cyquwnNnw9+ecGnWqi/jstvTKNC8Hd/CygNJphB3Q91z+ShrjOx
	sV09eJHFg6xq0Pu41WWvw1/WGcnmPfvob+B5iI6kJ2/KoxuNU9IEPuOiDtXrGms8ApxO
	z5tLn6jNnSMw8oEX30y8sIZUpkk6w1nkSwMVU7hnBlOgK9h6r+SLyxxqWI4Sxuf6AnH7
	dgCVpEl0W9qlUHxKXftyvxe3/TXV38qmPPF2hYzGZTUr3ZyphYDHe0G9NZxC+WIpkleP
	DwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ZOTaH/UnVeLSQKwA/VibZPZW/1zvBtksWbl57K3vjP4=;
	b=kmMWHR9YQvA3gFrKwVurOjWiVboNV6INkKE4A9kgH39HIdGZvlyy9Iw0f3ejtyPPDI
	yY+UDBb7AqlJCBA3hrJyeFhV3c4lg6gU0XBUpDX5ET+iBGOOEj6wLf1r/ugLgZ2UbKdP
	K/Wy64C1XPebyZYawvSyv/5Xt/T8Av9dm+H09IGYo/04if6ghH/Vt+8LEOBYUy/P2X/U
	BkWHM1FEaYkntd5gt8fXcCBfcsRl1UiUW3VJBM10xPH+4rDXnrwPochnQjejWmGsyUUG
	z2m5wX//8VwKs30cjs5OUTfYrF3MQp74TXNwmDKcwPU2VlixCbsxgRCWIMbwpN/qAmbB
	9tIQ==
X-Gm-Message-State: AKwxytfBFV1t7Pw4SW1ytv4qoHDNFi3HTpk3qsVJFFaG2YJOGSlPmf8V
	OXNOw+QASnQ1TGSCJ51xCRk=
X-Received: by 10.237.41.69 with SMTP id s63mr18557732qtd.32.1515463296504;
	Mon, 08 Jan 2018 18:01:36 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	r22sm8605027qtc.71.2018.01.08.18.01.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 18:01:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Date: Mon,  8 Jan 2018 23:00:51 -0300
Message-Id: <20180109020054.32553-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180109020054.32553-1-f4bug@amsat.org>
References: <20180109020054.32553-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-devel] [RFC PATCH v2 6/9] hw/usb/hcd-ehci: add 'xlnx,
 ps7-usb' FDT aliases
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
Cc: qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5K15Dd9UaneJ

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/hcd-ehci-sysbus.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/usb/hcd-ehci-sysbus.c b/hw/usb/hcd-ehci-sysbus.c
index 3b83beb140..0c1a995c2f 100644
--- a/hw/usb/hcd-ehci-sysbus.c
+++ b/hw/usb/hcd-ehci-sysbus.c
@@ -16,6 +16,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/sysbus-fdt.h"
 #include "hw/usb/hcd-ehci.h"
 
 static const VMStateDescription vmstate_ehci_sysbus = {
@@ -244,6 +245,13 @@ static const TypeInfo ehci_fusbh200_type_info = {
 
 static void ehci_sysbus_register_types(void)
 {
+    static const char *xlnx_ehci_fdt_aliases[] = {
+        "xlnx.zynq-usb",    /* Zynq */
+        "xlnx.ps7-usb",     /* Zynq-7xxx SoC */
+        NULL
+    };
+
+    type_register_fdt_aliases("xlnx,ps7-usb", xlnx_ehci_fdt_aliases);
     type_register_static(&ehci_type_info);
     type_register_static(&ehci_xlnx_type_info);
     type_register_static(&ehci_exynos4210_type_info);
-- 
2.15.1

