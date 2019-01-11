Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp203491wrt;
        Fri, 11 Jan 2019 06:31:54 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4N75gs0cRwV1+WWycrgC6SmFTSyhtcQ9SUCDEyTnrfIdcIaUVeRZge74xG5gaintQUV7U4
X-Received: by 2002:a7b:c7c7:: with SMTP id z7mr2704696wmk.74.1547217114207;
        Fri, 11 Jan 2019 06:31:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547217114; cv=none;
        d=google.com; s=arc-20160816;
        b=02ce32h0m3EYQtoCwF76Ifso8V+M9J42rt7m/y6QypszjLENOMUG3SDJCKYWJTHrTx
         FuhJbeu/SBMlpYEvIjIe8n3gLlYath5S3K5z5zgDP2BioWwWUfAtV5EAA7glWu/7BRUN
         X1l2Xu4wpk+tsRGIKj3Q/QspLXKBMf78ebrpgB9E2DoPopKtu0DHySK6OueDxlF+Nib5
         z2GQ7O0jHYjUW2jhjD+KvR+OCbGp+jOEfGauie768NsLsySxt/hFzd2XVMfZ++odRW0w
         xnUAOsjY8r04ZjWJDtbEdnEB94Pe2K2NX1ZfDNLSZaMPGyp4Fegfflz12TRxii9V6IUS
         Icpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=SocKeOwUbkQubg70ffjgn1h11b+pZM83bNvp5P4Sw0g=;
        b=Nfc8Uqu0j10ub7MMOeGDWvxzdGmTbeTi9zilLGLGRdwQRcRGk5Lf3Bu794K0Pltufl
         72oBMWJuvfEFgpnoePTxL30pglt70GB+nJqZSFkYspgX6etGTFI3kA0SlPGaFwK6XH5D
         q7A+WZlwxfB69sttjV8Q7/4avwsf8eS4DBdZtwrC4vkaCKv7KDwkjK1UtNlmkJHwGyOA
         kQd9LYMdkdHkWooAQg/hzYpARDwR1qEgwNehheSQSptUYlsgBM4GaQ0iLCivvUPoaC1z
         /ivV3SSOnxAy0h9IJcnTmaQUcMyXLZpSJ+lYQK0UU0dBYy12j5iZXM0sWZnZL6PjxuZM
         Ylhw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9si42363179wrn.219.2019.01.11.06.31.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Jan 2019 06:31:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37520 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghxqg-0000WH-E1
	for alex.bennee@linaro.org; Fri, 11 Jan 2019 09:31:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxe5-0005cg-EG
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 09:18:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxVJ-0000zb-47
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 09:09:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53007)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1ghxVI-0000xC-SI; Fri, 11 Jan 2019 09:09:45 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E430E4E93F;
	Fri, 11 Jan 2019 14:09:43 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-254.brq.redhat.com [10.40.204.254])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39AE15D6A9;
	Fri, 11 Jan 2019 14:09:30 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Date: Fri, 11 Jan 2019 15:08:45 +0100
Message-Id: <20190111140857.4211-4-philmd@redhat.com>
In-Reply-To: <20190111140857.4211-1-philmd@redhat.com>
References: <20190111140857.4211-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 11 Jan 2019 14:09:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 03/15] hw/ssi: Remove SSIBus from
 "qemu/typedefs.h"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Andrzej Zaborowski <balrogg@gmail.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vkDd+fj06ZOL

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

There are only three files requiring this typedef, let them
include "hw/ssi/ssi.h" directly to simplify "qemu/typedefs.h".

To clean "qemu/typedefs.h", move the forward declaration
to "hw/ssi/ssi.h".

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/arm/strongarm.h      | 1 +
 include/hw/arm/pxa.h    | 1 +
 include/hw/ssi/pl022.h  | 1 +
 include/hw/ssi/ssi.h    | 1 +
 include/qemu/typedefs.h | 1 -
 5 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/arm/strongarm.h b/hw/arm/strongarm.h
index e98840b461..ae51a1ae34 100644
--- a/hw/arm/strongarm.h
+++ b/hw/arm/strongarm.h
@@ -3,6 +3,7 @@
=20
 #include "exec/memory.h"
 #include "target/arm/cpu-qom.h"
+#include "hw/ssi/ssi.h"
=20
 #define SA_CS0          0x00000000
 #define SA_CS1          0x08000000
diff --git a/include/hw/arm/pxa.h b/include/hw/arm/pxa.h
index f6dfb5c0cf..f184349f02 100644
--- a/include/hw/arm/pxa.h
+++ b/include/hw/arm/pxa.h
@@ -13,6 +13,7 @@
 #include "exec/memory.h"
 #include "target/arm/cpu-qom.h"
 #include "hw/pcmcia.h"
+#include "hw/ssi/ssi.h"
=20
 /* Interrupt numbers */
 # define PXA2XX_PIC_SSP3	0
diff --git a/include/hw/ssi/pl022.h b/include/hw/ssi/pl022.h
index a080519366..1cf16f1539 100644
--- a/include/hw/ssi/pl022.h
+++ b/include/hw/ssi/pl022.h
@@ -22,6 +22,7 @@
 #define HW_SSI_PL022_H
=20
 #include "hw/sysbus.h"
+#include "hw/ssi/ssi.h"
=20
 #define TYPE_PL022 "pl022"
 #define PL022(obj) OBJECT_CHECK(PL022State, (obj), TYPE_PL022)
diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
index 6a0c3c3cdb..bdbf3c51f5 100644
--- a/include/hw/ssi/ssi.h
+++ b/include/hw/ssi/ssi.h
@@ -13,6 +13,7 @@
=20
 #include "hw/qdev.h"
=20
+typedef struct SSIBus SSIBus;
 typedef struct SSISlave SSISlave;
 typedef struct SSISlaveClass SSISlaveClass;
 typedef enum SSICSMode SSICSMode;
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 3bd9215d55..c026229573 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -108,7 +108,6 @@ typedef struct Range Range;
 typedef struct SerialState SerialState;
 typedef struct SHPCDevice SHPCDevice;
 typedef struct SMBusDevice SMBusDevice;
-typedef struct SSIBus SSIBus;
 typedef struct uWireSlave uWireSlave;
 typedef struct VirtIODevice VirtIODevice;
 typedef struct Visitor Visitor;
--=20
2.17.2

