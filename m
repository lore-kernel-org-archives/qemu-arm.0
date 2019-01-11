Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp192029wrt;
        Fri, 11 Jan 2019 06:21:06 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7oRyyLi3SRD6Gd5JJKOeiQKz8//sN7fPNAqghVEwbaObRu67jQvxiTVmjmYbqi0eHpWsZ6
X-Received: by 2002:a19:59c2:: with SMTP id n185mr7816733lfb.118.1547216466856;
        Fri, 11 Jan 2019 06:21:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547216466; cv=none;
        d=google.com; s=arc-20160816;
        b=vlDFz+P0c4bHbB37VllU1XtKbQ4fxCiuXtUWrnMXHDgYXfCi+J+pk7ddTICEPhCaMG
         gL7UEt7Wx/BwLmdp2MYD2rhFF6TgQIfarV19zU5JfNUbFCG0zH+ZlCJ61Yc9LfoOCyEs
         UDCwbYfEtAQXDaz46a+yZnqKjt/bY0i19s5b96DpQTnkp3JNHmo138EZkyvSFdkwStVG
         VT2CNtsIBscCsARZIV3jZVBEm1JJTGBESo31zz5W56v9YcMKaqGwymf3OSJC0E1mUfOi
         j+AbK2TDsInavD/DO3waOpOIKNeJKK0/XalfrQtzALayR871l4HwWk9fyWOzGWww+wuU
         ooLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=0NkL0RoeepddDnsfz3tyeS4fUx+G5Ui1XwB2PqkdhoI=;
        b=wwy0H0IabgtlktY6qCXneRPBnpx7FsKMlG8XmKiuyBKkjd6oKOOBiaNB3QbfXYykAJ
         nHlVtl57/HQqY/ofpIV/nPddXm45fqghY2bQEKIa+scG6z0+STcXMcQx7IJdBDdhxfdt
         K+jAN2IJi1yy2CAbVGw2athzIpwblgR0MGUSVgk6rd7d5kP7DZXusWGLpygIiufc5maK
         qW6eiXXii/4ApRA4BkimStpt0Etg6HOA5xEVeB91Mnib1KmhpXTAJ0GSIYmzhHbXlw1g
         MmunNjxTgsBMVr0GwyUwqfIu3rIl1fdZJ0YmJ7V1Wd/1iXksGEmdWFRcWUNZVZ+Ky4kZ
         sFjA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 128si68005931lfi.53.2019.01.11.06.21.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Jan 2019 06:21:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34473 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghxgH-0007Ta-Dx
	for alex.bennee@linaro.org; Fri, 11 Jan 2019 09:21:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxdu-0005cg-EJ
	for qemu-devel@nongnu.org; Fri, 11 Jan 2019 09:18:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxXS-0006kT-QT
	for qemu-devel@nongnu.org; Fri, 11 Jan 2019 09:11:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52470)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1ghxXN-0006Tb-QL; Fri, 11 Jan 2019 09:11:53 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4AFE52D7F8;
	Fri, 11 Jan 2019 14:11:51 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-254.brq.redhat.com [10.40.204.254])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08E8A5D6A9;
	Fri, 11 Jan 2019 14:11:44 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Date: Fri, 11 Jan 2019 15:08:54 +0100
Message-Id: <20190111140857.4211-13-philmd@redhat.com>
In-Reply-To: <20190111140857.4211-1-philmd@redhat.com>
References: <20190111140857.4211-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 11 Jan 2019 14:11:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 12/15] ui/console: Remove MouseTransformInfo
 from qemu/typedefs.h
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zDsPYTj/NEjT

MouseTransformInfo is only used in "ui/console.h", there is no
need to expose it via "qemu/typedefs.h".

Move the declaration to "ui/console.h" (removing the forward
declaration).

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/devices.h    | 1 +
 include/qemu/typedefs.h | 1 -
 include/ui/console.h    | 4 ++--
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/devices.h b/include/hw/devices.h
index 0e27feb0c2..b5f1662225 100644
--- a/include/hw/devices.h
+++ b/include/hw/devices.h
@@ -4,6 +4,7 @@
 /* Devices that have nowhere better to go.  */
=20
 #include "hw/hw.h"
+#include "ui/console.h"
=20
 /* smc91c111.c */
 void smc91c111_init(NICInfo *, uint32_t, qemu_irq);
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 9baebe9d33..e44f1473a5 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -49,7 +49,6 @@ typedef struct MigrationIncomingState MigrationIncoming=
State;
 typedef struct MigrationState MigrationState;
 typedef struct Monitor Monitor;
 typedef struct MonitorDef MonitorDef;
-typedef struct MouseTransformInfo MouseTransformInfo;
 typedef struct MSIMessage MSIMessage;
 typedef struct NetClientState NetClientState;
 typedef struct NetFilterState NetFilterState;
diff --git a/include/ui/console.h b/include/ui/console.h
index 853fcf4eb7..b74246f0f5 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -65,13 +65,13 @@ void qemu_remove_led_event_handler(QEMUPutLEDEntry *e=
ntry);
=20
 void kbd_put_ledstate(int ledstate);
=20
-struct MouseTransformInfo {
+typedef struct MouseTransformInfo {
     /* Touchscreen resolution */
     int x;
     int y;
     /* Calibration values as used/generated by tslib */
     int a[7];
-};
+} MouseTransformInfo;
=20
 void hmp_mouse_set(Monitor *mon, const QDict *qdict);
=20
--=20
2.17.2

