Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4800800wro;
        Mon, 29 Oct 2018 15:33:17 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dFg6UY7im/2W/vTivCzjRzpPokUOnCljTP5ffATCxyo9t7WHTnFJFchymS93PgDRRPPPcN
X-Received: by 2002:a0c:9384:: with SMTP id f4mr14967483qvf.239.1540852397060;
        Mon, 29 Oct 2018 15:33:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540852397; cv=none;
        d=google.com; s=arc-20160816;
        b=cdZ0+q0u4o7bl5bgVtZfJ3Pvfd+tj/VjPR99mFzG8+1Gb1Ipq17oDuMdgXmg/n9srZ
         ro3Oii68jP3/D3z60t/2hOwteKQSe/d6C620krMLJYdL4SH3sM92S2fG531P0IP8iO3f
         mDGl3t7EMXQwlH3y8lmIYPNMrNI3dLOL4COxIpi6LArw1h5CaTKoVCW6HNpO1MLzDW9s
         66pKrHNo8PCxPuA3xwCSBW9mqrlS/1Kik1+kzduSV4Rs7Ko7oOqk2z9ADlBjaZyzHLig
         /iME1Skdazj1KrTJcHUDntiFiUkFo1mRqHJ0WAeBBFBPWxWpv4bJudfeeM+mxvosm4xG
         4DSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=vwP7VgsQ66gR6Lt/Dyc+x33BPy2BF/9vcL7fQDIy70I=;
        b=muJoHPN5VapC7kYJTtnnSDHCz2RccmxHP9jMHTf+E/jEopH1LMCcbiy0lyR+oh8/yM
         tioYGZrChp81ydc6CqQTnE/xsZ3fN9spbSU2so846T1ywJs+NwwwgiKo3ma6j7RGhAos
         sZGFZEON1dOvfCAkYUcu07s3SvMkSYMnnqZH0CLbiIf/VI/e/eSfYiLF4GifXsCFzCck
         lqRUnlyY7qdPmWOdizMJ9+owYfEv/rXOvIG0+kSOjH9kAmBsYMfPQaRAIYt4MK2IFhbB
         uk2FbN0jnxKHzl8m1PeUDy2xjWev9YjcemMlvF3QpfwOvqgObtLQo0eEbK0pojL8kqX8
         nHDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y19-v6si1214180qki.259.2018.10.29.15.33.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 15:33:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49352 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHG60-0008WT-IU
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 18:33:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHG5n-0008Vk-HP
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 18:33:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHG5k-0006PJ-DL
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 18:33:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57658)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gHG5k-0006PB-7i; Mon, 29 Oct 2018 18:33:00 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7BA1A3084217;
	Mon, 29 Oct 2018 22:32:59 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-38.brq.redhat.com [10.40.204.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4290258A9;
	Mon, 29 Oct 2018 22:32:50 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Icenowy Zheng <icenowy@aosc.xyz>,
	Guenter Roeck <linux@roeck-us.net>, Gerd Hoffmann <kraxel@redhat.com>
Date: Mon, 29 Oct 2018 23:32:05 +0100
Message-Id: <20181029223207.31878-2-philmd@redhat.com>
In-Reply-To: <20181029223207.31878-1-philmd@redhat.com>
References: <20181029223207.31878-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Mon, 29 Oct 2018 22:32:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 1/3] arm: allwinner: Enable USB OHCI
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y+ijXClaNcGY

From: Guenter Roeck <linux@roeck-us.net>

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
[PMD: Intented tabs -> space]
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/allwinner-a10.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 9fe875cdb5..0a8ac929f5 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -22,6 +22,8 @@
 #include "hw/sysbus.h"
 #include "hw/devices.h"
 #include "hw/arm/allwinner-a10.h"
+#include "hw/boards.h"
+#include "hw/usb/hcd-ehci.h"
=20
 static void aw_a10_init(Object *obj)
 {
@@ -110,6 +112,11 @@ static void aw_a10_realize(DeviceState *dev, Error *=
*errp)
     /* FIXME use a qdev chardev prop instead of serial_hd() */
     serial_mm_init(get_system_memory(), AW_A10_UART0_REG_BASE, 2, s->irq=
[1],
                    115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
+
+    if (machine_usb(current_machine)) {
+        sysbus_create_simple("sysbus-ohci", 0x01c14400, s->irq[64]);
+        sysbus_create_simple("sysbus-ohci", 0x01c1c400, s->irq[65]);
+    }
 }
=20
 static void aw_a10_class_init(ObjectClass *oc, void *data)
--=20
2.17.2

