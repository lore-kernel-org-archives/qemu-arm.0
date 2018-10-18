Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2804933wrt;
        Thu, 18 Oct 2018 13:08:24 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60Nu7IRiYkgWKH26Ou0hLr1LsERfR9+2lQWgHQ4lzQKT87wSWD1Oba4oM7Mb+caQcHHGodH
X-Received: by 2002:ac8:47c4:: with SMTP id d4-v6mr2385882qtr.220.1539893304238;
        Thu, 18 Oct 2018 13:08:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539893304; cv=none;
        d=google.com; s=arc-20160816;
        b=UT3BqldqmB1FLB5+j/pnjvtmSJbcnP0Vg0Fea6nmLdcvizubxgHJromM8/Hnz9mpru
         pRhesaJtJVLs7u4K1Ar3fAh59jKhV0POemxGPz3928yvQP2WPzf53x+i/4HB+GSmsepp
         3mR74hN/vz/hqaFu3YvvPK/RtdIsiXF/qHPaRhKqVyfxy46qahSuSoyAPgtKy4nI187V
         Q1Q0KkdzcNIUQoSzgFvb2WOn2GJ29EZLJua46NB6qrjNvZRvZ5XisSx//DegB789stpM
         Z2RKG5TTUqos7wYkciTAfvG6pNjgnUbO7Wlbv11GFte8I0DwMYs7xkOFCbcUsQ3Zq95d
         S5YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=6Q53XhXX1+k8jqEEE7bCucbh+UJcorj4UXA//S/dLfM=;
        b=haVi+8fLandb2DgUfx4W1nOlQz5GGUKZgvjcU45F4nKjwGjsvbrqy6LDIDaZVr2VKI
         FE6RBPXrsP/ktqTFDGNmVtmxMwWX+hno1dxfmz4p08goqMm7x/6oDFfXyF7Z4fb4AChR
         +tQ0wR0qo7G6cRjsG9yJhfKKmVVFdDi3dcka+eJj/7g4Fa7EvaM01l8ILMMyFycDuaw7
         OLD7I2N5Uc0px/xKEMHRHIcFxsgklu4BBh+4tTQKAiIbi4ta7sSBQyq1aDf62qxT3til
         hwDUgEcFdiYcfS/aS3eZqtLOBqglzwu8hx7WRCzOh6XcgveFIIdazXvE7Aex3vK6Cgjr
         FhzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o68-v6si3622735qkd.9.2018.10.18.13.08.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:08:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44277 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDEal-00022r-Lu
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:08:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEXh-0007qK-Lt
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:05:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEXe-0007Z3-Ji
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:05:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43348)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEXe-0007Vq-9m; Thu, 18 Oct 2018 16:05:10 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2A3C07F7B2;
	Thu, 18 Oct 2018 20:05:09 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8254963BB2;
	Thu, 18 Oct 2018 20:05:08 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:03:43 -0300
Message-Id: <20181018200422.4358-7-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 18 Oct 2018 20:05:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 06/45] hw/timer/sun4v-rtc: Convert from DPRINTF()
 macro to trace events
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
X-TUID: ZCF8yyh4UKwN

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Artyom Tarasenko <atar4qemu@gmail.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20181002212522.23303-3-f4bug@amsat.org>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/timer/sun4v-rtc.c  | 13 +++----------
 hw/timer/trace-events |  4 ++++
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/hw/timer/sun4v-rtc.c b/hw/timer/sun4v-rtc.c
index 310523225f..13be94f8da 100644
--- a/hw/timer/sun4v-rtc.c
+++ b/hw/timer/sun4v-rtc.c
@@ -14,15 +14,8 @@
 #include "hw/sysbus.h"
 #include "qemu/timer.h"
 #include "hw/timer/sun4v-rtc.h"
+#include "trace.h"
=20
-//#define DEBUG_SUN4V_RTC
-
-#ifdef DEBUG_SUN4V_RTC
-#define DPRINTF(fmt, ...)                                       \
-    do { printf("sun4v_rtc: " fmt , ## __VA_ARGS__); } while (0)
-#else
-#define DPRINTF(fmt, ...) do {} while (0)
-#endif
=20
 #define TYPE_SUN4V_RTC "sun4v_rtc"
 #define SUN4V_RTC(obj) OBJECT_CHECK(Sun4vRtc, (obj), TYPE_SUN4V_RTC)
@@ -41,14 +34,14 @@ static uint64_t sun4v_rtc_read(void *opaque, hwaddr a=
ddr,
         /* accessing the high 32 bits */
         val >>=3D 32;
     }
-    DPRINTF("read from " TARGET_FMT_plx " val %lx\n", addr, val);
+    trace_sun4v_rtc_read(addr, val);
     return val;
 }
=20
 static void sun4v_rtc_write(void *opaque, hwaddr addr,
                              uint64_t val, unsigned size)
 {
-    DPRINTF("write 0x%x to " TARGET_FMT_plx "\n", (unsigned)val, addr);
+    trace_sun4v_rtc_read(addr, val);
 }
=20
 static const MemoryRegionOps sun4v_rtc_ops =3D {
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index ca9ad6321a..75bd3b1042 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -66,5 +66,9 @@ cmsdk_apb_dualtimer_read(uint64_t offset, uint64_t data=
, unsigned size) "CMSDK A
 cmsdk_apb_dualtimer_write(uint64_t offset, uint64_t data, unsigned size)=
 "CMSDK APB dualtimer write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size=
 %u"
 cmsdk_apb_dualtimer_reset(void) "CMSDK APB dualtimer: reset"
=20
+# hw/timer/sun4v-rtc.c
+sun4v_rtc_read(uint64_t addr, uint64_t value) "read: addr 0x%" PRIx64 " =
value 0x%" PRIx64
+sun4v_rtc_write(uint64_t addr, uint64_t value) "write: addr 0x%" PRIx64 =
" value 0x%" PRIx64
+
 # hw/timer/xlnx-zynqmp-rtc.c
 xlnx_zynqmp_rtc_gettime(int year, int month, int day, int hour, int min,=
 int sec) "Get time from host: %d-%d-%d %2d:%02d:%02d"
--=20
2.18.0.rc1.1.g3f1ff2140

