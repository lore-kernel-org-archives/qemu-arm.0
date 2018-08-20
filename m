Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp740532wrd;
        Mon, 20 Aug 2018 07:18:08 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPx2WP3kKJ9Nm3FsXwpTJ//mRVSXoGV9f0yMbvcpioQByBq6lWaRrdOSZv1N8sW9btfJ8llA
X-Received: by 2002:a37:1fcd:: with SMTP id n74-v6mr16035959qkh.427.1534774688674;
        Mon, 20 Aug 2018 07:18:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534774688; cv=none;
        d=google.com; s=arc-20160816;
        b=Mfb3MIDuc06aVa2L0LUow2XwUXTy5QsCv6+4UzVuYekUvRVyvOddGchksqTq5UDarU
         LIqT3Q6o4btcpvCvrrxYHV/ewxDS9jK+d3h0UJQ/95wLEQdBU1pdC/FQ2N6+veuLQFO7
         PxMdHRNQsC0OchBRBgl0jlj2iLQ23ZDSFWmq+KCX94YNufAPYUN5ZLkHHcG+Wk6JknFB
         cn7bLWTj0VzJ9/8yxyHacE9cniFvz7lsx1dXvdFTHVBasUMy1xsbTQ2gYcMeekyoJmfb
         dpWdGXpuur4qj3tAgVb6O2H7rKlMOpbR6lNhCY+I+IQtJSbDlNgcNGbKfPBn5O8yPlwB
         FfRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=3A//FTw0FxcBXnSn/wWO/Jt92QKCmUBhKpJ4oueWoeo=;
        b=hgvdiaGV75f+tOc6it5JcxFF6dQmqp6uf4iGBug2owEkHQG2EkQaioceh28gNUoPvZ
         7tPErVNdlCoB9CsgxGxhS/+jtQ4flCZSRiFYRWPKW0zeAVpd7M2mUWJHN6OuAgRqHS31
         yT1WtXBMSh7Ll7FJj7Xr0RH+uWhhKRcQQixubxrjdN3842wuvBgCrWHIlLU5G0dMAABm
         ExGVdMclj8lmKfhR7xcDjQ69BOZ5eXLFlcaMmRjRzoTfPezvKbDudYdQTuODpgxkjfIB
         EVkkABjPe6811K38+8GbcTz2VdOsDi3+yxPKTVyK4WluJDgfYJZLnzMjw5ljASNMayEW
         XyqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 17-v6si1607475qkv.119.2018.08.20.07.18.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 07:18:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47326 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1frl0S-0000R9-1g
	for alex.bennee@linaro.org; Mon, 20 Aug 2018 10:18:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42111)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frkuE-0003dk-N6
	for qemu-devel@nongnu.org; Mon, 20 Aug 2018 10:11:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frkuE-0007Ob-1N
	for qemu-devel@nongnu.org; Mon, 20 Aug 2018 10:11:42 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44662)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1frkuB-0007La-Fc; Mon, 20 Aug 2018 10:11:39 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1frkuA-0003TW-JC; Mon, 20 Aug 2018 15:11:38 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 20 Aug 2018 15:11:11 +0100
Message-Id: <20180820141116.9118-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180820141116.9118-1-peter.maydell@linaro.org>
References: <20180820141116.9118-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 17/22] hw/ssi/pl022: Don't directly call
 vmstate_register()
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uS096dArVUUf

Use the DeviceState vmsd pointer rather than calling vmstate_register()
directly.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ssi/pl022.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ssi/pl022.c b/hw/ssi/pl022.c
index 0b5f90b857f..c9989537062 100644
--- a/hw/ssi/pl022.c
+++ b/hw/ssi/pl022.c
@@ -279,7 +279,6 @@ static int pl022_init(SysBusDevice *sbd)
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
     s->ssi = ssi_create_bus(dev, "ssi");
-    vmstate_register(dev, -1, &vmstate_pl022, s);
     return 0;
 }
 
@@ -290,6 +289,7 @@ static void pl022_class_init(ObjectClass *klass, void *data)
 
     sdc->init = pl022_init;
     dc->reset = pl022_reset;
+    dc->vmsd = &vmstate_pl022;
 }
 
 static const TypeInfo pl022_info = {
-- 
2.18.0

