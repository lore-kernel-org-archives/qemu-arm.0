Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2812619wrt;
        Thu, 18 Oct 2018 13:14:51 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63U9PVTVUK0jFiUh2KQzvSTH3NvG0OeBTKMDfVOTooApdlVBSRgJWF2LXAqYz14hDR8mDvn
X-Received: by 2002:a37:bc03:: with SMTP id m3-v6mr30017544qkf.114.1539893691038;
        Thu, 18 Oct 2018 13:14:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539893691; cv=none;
        d=google.com; s=arc-20160816;
        b=sRH3J1ypS1VQuaU+YkbDlM6BCPiDT8n6ZeCZrBggE06WbX8U/fbn2Itvhoj8CzCIN3
         yWHh02I/xewzECo02fbMqXCIWe2WFAhmllNFfKI/hSDcrJE7ketFtZ5aqpsecWq6xchX
         JnxOF2OsW3DqpQbTe0AtfaZsj/HeLShohNJk3fe6oXAxLCmPfZj+bj3crUoiheox2ZnF
         9pTJeu5yUgvq571UGqxoosW2XhyJSrS4QSyB84jFW/sqZghXm8PzJC7EKqYZz+u/byaS
         LkAElEU5exNgMLCNi79q99niEtaJkX19NdX8k+tpyZN6a0PCbGUzVIuZVPzyLUMs71pO
         Vuzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=el0LgCnI8aB8EKJECz7gRHH5N0LxHZAYIbbDwQwiD6c=;
        b=AQz2z3IPuFQi+jIBCBAZW7cy4xOcMEAkf7/CpWtD00nakRsug9CQJdApqTfbuuK1m7
         hybPxMYUwM+nmCjp2H8NHEiyuWw//k/Cie2zr1JxTHZWcm2BRMr05wA0GWBUTUZkJu7Y
         LRdGaxVttX1DjYaCZA0fx8yjDAWC926BlmX9pmZJjJUeYt2hT70Jyjm2Kl1tc/ujJXkR
         FOPyTClZ74CUDEHWVAWimOATfnmX7PNLp9duyXk+pboGn4Eb30f6ujztA48a8sHYQ8xa
         p6D0JKUPfjjS0kxhimJpckhsM1iTrciFqkxtFlqa+2/i+E9Uz1QCw+kYDZ0nD+GywzKK
         AJzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c25-v6si1300931qkc.157.2018.10.18.13.14.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:14:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44315 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDEgz-0007xU-V5
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:14:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39045)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEYO-0008Pi-Au
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 16:05:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEYN-0000VI-EK
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 16:05:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43610)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEYJ-0008WR-Cw; Thu, 18 Oct 2018 16:05:51 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 111D08830C;
	Thu, 18 Oct 2018 20:05:50 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 71FEF60150;
	Thu, 18 Oct 2018 20:05:49 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:03:50 -0300
Message-Id: <20181018200422.4358-14-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 18 Oct 2018 20:05:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 13/45] hw/sparc64/niagara: Model the I/O Bridge
 with the 'unimplemented_device'
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Rob Herring <robh@kernel.org>, Alexander Graf <agraf@suse.de>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vs2hkFbPskJE

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Since the I/O Bridge device is not implemented,  Use the
TYPE_UNIMPLEMENTED_DEVICE which suits better: if the user
asks for 'unimp' warnings via the -d option then all accesses
will generate logging.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Artyom Tarasenko <atar4qemu@gmail.com>
Message-Id: <20181002212522.23303-10-f4bug@amsat.org>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 default-configs/sparc64-softmmu.mak | 1 -
 hw/sparc64/niagara.c                | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/default-configs/sparc64-softmmu.mak b/default-configs/sparc6=
4-softmmu.mak
index 52edafe547..ce63d47046 100644
--- a/default-configs/sparc64-softmmu.mak
+++ b/default-configs/sparc64-softmmu.mak
@@ -16,5 +16,4 @@ CONFIG_SIMBA=3Dy
 CONFIG_SUNHME=3Dy
 CONFIG_MC146818RTC=3Dy
 CONFIG_ISA_TESTDEV=3Dy
-CONFIG_EMPTY_SLOT=3Dy
 CONFIG_SUN4V_RTC=3Dy
diff --git a/hw/sparc64/niagara.c b/hw/sparc64/niagara.c
index 4fa8cb2904..f8a856f611 100644
--- a/hw/sparc64/niagara.c
+++ b/hw/sparc64/niagara.c
@@ -29,7 +29,7 @@
 #include "hw/hw.h"
 #include "hw/boards.h"
 #include "hw/char/serial.h"
-#include "hw/empty_slot.h"
+#include "hw/misc/unimp.h"
 #include "hw/loader.h"
 #include "hw/sparc/sparc64.h"
 #include "hw/timer/sun4v-rtc.h"
@@ -161,7 +161,7 @@ static void niagara_init(MachineState *machine)
         serial_mm_init(sysmem, NIAGARA_UART_BASE, 0, NULL, 115200,
                        serial_hd(0), DEVICE_BIG_ENDIAN);
     }
-    empty_slot_init(NIAGARA_IOBBASE, NIAGARA_IOBSIZE);
+    create_unimplemented_device("sun4v-iob", NIAGARA_IOBBASE, NIAGARA_IO=
BSIZE);
     sun4v_rtc_init(NIAGARA_RTC_BASE);
 }
=20
--=20
2.18.0.rc1.1.g3f1ff2140

