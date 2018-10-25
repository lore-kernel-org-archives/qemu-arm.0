Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp719326wro;
        Thu, 25 Oct 2018 06:40:50 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dRMWbir0skJkixey9a9lQC5A2fS4/Ypn5F8qaQ8HQbX5oysjq5DocIpoyGm0j6XHulq1K5
X-Received: by 2002:ac8:5389:: with SMTP id x9-v6mr1504358qtp.254.1540474850702;
        Thu, 25 Oct 2018 06:40:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540474850; cv=none;
        d=google.com; s=arc-20160816;
        b=x19oQmLt/Cc+qo42MBVZYqdwzqQj6oj815wVaN4d/57Dpf72NG5DMDNvq7+byKVz2P
         2CTbmHKp9aZU18v4GwNa6U0uASyVD7lgMiQcQ6DwmaZ2X0TMTse5PHeFKh3/bE9FxhQ/
         LLzpRG0kCQLzf8djE+HEeKVtfoLi6ZuiBeRAc7V0gNGhI1RcNAJZb8D7VtW6XuF71UDL
         1AQadzZyDskljnbGMdQsSoip4zdV/SG+BqQaDf+2FTTOpu1gc664oIZYLbKq+BTzpeG7
         tBe0BgDSTW900203XIkuNkFTKiXuUrSmNnd+OFcdaQoX2baDJiaRzRcl0+aJkmbZYFz/
         a1IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=6Q53XhXX1+k8jqEEE7bCucbh+UJcorj4UXA//S/dLfM=;
        b=ff7Xz5aOvewE7ETw5a41nuy9kgGlv+TysT1EUnWvguzqGPoEqqIV2UzXSeXIwc6McZ
         AAsYXwdIyOfoc0Q7TYyXzTtBrwu05BJbw6mh88/TU6zJZo9gIXHh/qBGZq6zGtutTVn1
         Gb3IvYvlk6RyAEI7pHQoRZrh0p5GbdFHokGB3RKX0pjO64w4qInyk1DDuafomfyVsfKq
         ZIRFtTFKYPd/kp6ZK0DeUnDlfPyOyMVvqmKKzV7w1PPYFk53E3LwIFV6zU4feAYw+sOS
         BQ5cNxRY16K58vRFUK54xVqvtqerZiFHqWynF3teTKgRGPznuNglxJvHfhg/mAZODQjD
         hV2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o2-v6si5841387qtl.192.2018.10.25.06.40.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 06:40:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54518 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFfsX-0007YF-9t
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 09:40:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfms-0002Dq-3F
	for qemu-devel@nongnu.org; Thu, 25 Oct 2018 09:34:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFflm-0006xy-44
	for qemu-devel@nongnu.org; Thu, 25 Oct 2018 09:33:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37028)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFflj-0006w4-Kh; Thu, 25 Oct 2018 09:33:47 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 732F7C01F601;
	Thu, 25 Oct 2018 13:33:46 +0000 (UTC)
Received: from localhost (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 46D20605D1;
	Thu, 25 Oct 2018 13:33:39 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:32:23 -0300
Message-Id: <20181025133301.16578-6-ehabkost@redhat.com>
In-Reply-To: <20181025133301.16578-1-ehabkost@redhat.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 25 Oct 2018 13:33:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v2 05/43] hw/timer/sun4v-rtc: Convert from
 DPRINTF() macro to trace events
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
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
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
X-TUID: Z6e6OubkLWi4

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

