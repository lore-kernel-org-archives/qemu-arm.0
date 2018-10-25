Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp713742wro;
        Thu, 25 Oct 2018 06:35:50 -0700 (PDT)
X-Google-Smtp-Source: AJdET5ecIbbSiT7+j/1ZHoEyWuxYOMWYcRCOjXYPcSdE7VxP2Nz3unmhJ5M4sBPcAEACz7FdDAJx
X-Received: by 2002:ae9:c20d:: with SMTP id j13-v6mr1451856qkg.40.1540474550264;
        Thu, 25 Oct 2018 06:35:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540474550; cv=none;
        d=google.com; s=arc-20160816;
        b=WK2OX41qEQPrtMmPdk/E9DWkStveM29YGfzkaGrmH3QRqNFz+QfM3CCbTXODikoeGO
         OPJGkX2UsRQlW8OzqoBfSF1CpVLVOHM9x3RHxpUktEutW+yAr6hxNBv1uPGi/85+vaAw
         8Nh+triDXlGCDCa5mL1EtvbMbvKAzM1DNgioNwu6hsd+EKVsBzCPDDv2ASNVKwEVvrh7
         PIFo/4WorIzjC0qSDcH7hDK+LdTzw6mHY2iYB4clzpBNqJ1aF2WFy6ZLtBhS9UH+HnDv
         997MVkOCOzQ4qfuyWhx1opby0HnT/hmMX2jo6duuMQYFW3LntfBhZNoQtTVSZfjZRHAO
         GWdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=el0LgCnI8aB8EKJECz7gRHH5N0LxHZAYIbbDwQwiD6c=;
        b=Oi5NmB6EpIINgjfKLHLNZPKkVCmoH+iS4iZYVPgdvq1a0Kz4D47a01Y8Yps4doi1Fr
         vJb8F7fUxFHU6A1Y7Dpxoalc0WVeYhKqiPoNXZ96Ub+a98od9m1NK2u+MEnmZb2S1L6E
         qhY2YNLlS6FJtinDC3a3RnSfTj17BtxaFq77sokjEav4CG4Om+wZFP2GQKhywiFwubFV
         qugl0NspV54pmVRQLk/Rqdm+UHv0KGLaP9orOsfdFmtsBSek6ubtyK3yhg+wkCkZNjSu
         xfcw+WbipCTrTXB9xVCU9uwZzA3L4iVcNIrAOmKIB2jdPzMgXz/N9QZ7sZ9hCnCPp7gM
         zbdg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d7si6607867qvn.147.2018.10.25.06.35.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 06:35:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54483 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFfnh-0002oY-68
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 09:35:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfmn-00029R-Q7
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:34:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfmh-0007nP-VI
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:34:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:14752)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFfmh-0007kD-Jd; Thu, 25 Oct 2018 09:34:47 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B33A286668;
	Thu, 25 Oct 2018 13:34:39 +0000 (UTC)
Received: from localhost (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 97B9627BB6;
	Thu, 25 Oct 2018 13:34:31 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:32:30 -0300
Message-Id: <20181025133301.16578-13-ehabkost@redhat.com>
In-Reply-To: <20181025133301.16578-1-ehabkost@redhat.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 25 Oct 2018 13:34:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v2 12/43] hw/sparc64/niagara: Model the I/O Bridge
 with the 'unimplemented_device'
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Eric Blake <eblake@redhat.com>, Rob Herring <robh@kernel.org>,
	Alexander Graf <agraf@suse.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tu6vZWfdrhu0

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

