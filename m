Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7042866wrv;
        Mon, 22 Jul 2019 08:48:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyRlgWy4D583C3KfHhsv7CM+dpFlrkG5h1hs9N9lfGq84hXp43zJjcwdIcgUM3hYu3qL2X+
X-Received: by 2002:ab0:a1:: with SMTP id 30mr42858264uaj.29.1563810513964;
        Mon, 22 Jul 2019 08:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563810513; cv=none;
        d=google.com; s=arc-20160816;
        b=AFk1KLFN7k7uGSeFvvMuaFG0EyaOn7xO5jfKe1MHcjud9aLYFoWFYgC6t4E/mxi03I
         0t+t3G0/3tSDc/4mNCFOsMG/MudSh6FuViOM7RMTpZ+1Lyv+xFWMnY6RBvQyqCUUz5+P
         NP0cRrmi8VQdNFw8j9ZfHVerDbACXMps2aaaBLE74fRyWPhcMsZcZNzj05CodbKtBEAV
         H4kqa1qnEXNNHna9CESeS/jfd6B0CsbQhJqtGUcyP/XzyFvDSp8SJb0Z1j8/gUd+ob9k
         jAdp64ebxlI5qQdCqi4iKOluGc1gmBLDWzlVVIXUIl3v6qi/Py/MjfvSijTWU/wIqZPj
         HEpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:to:from;
        bh=h+Yyft3LkdYzi3P26BfviVaU3Vo2epUj+laX5N+t2e0=;
        b=mTVQtUJUAFofY0mePwWv5Q6tHMe1wEewemvHEHtY4pgpjOzlVaKTUUUW8M0T01JkWJ
         QJfMyFWSoWyiV6JrR6Ihvbuwjt13hTO3leqVnLbGYqizJY2sw+stjTPdvrS0MIwHRyxv
         8JP9rkDrreDDBdGjCOY7Z9YzLnC3wm2IuoImBUKY07A3iMhAD4tZlVn8RqiarizBUft3
         lWFB505Hzb1/UIVtnL6uafdw7VfN/8RwybRRSvhojc5j4vSfJ6JJ23T1hyJBo2qb8eo4
         d3h5R4feBf7BDTwFDlqJHKLPhc4QBKjl5gSnWx5kWt9f/IAVRk73TDdcOD1pej38Tgvt
         1Qiw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 123si9889548vsu.37.2019.07.22.08.48.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2019 08:48:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:34952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hpaYD-0002uR-2J
	for alex.bennee@linaro.org; Mon, 22 Jul 2019 11:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53560)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hpaXr-00024B-Hk
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 11:48:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hpaXq-0007ak-An
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 11:48:11 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.74]:26775)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hpaXQ-0007AZ-8o; Mon, 22 Jul 2019 11:47:44 -0400
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 BWP09926079.bt.com (10.36.82.110) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Mon, 22
 Jul 2019 16:47:37 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Mon, 22 Jul 2019 16:47:15 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Mon, 22 Jul
 2019 16:47:15 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v2 10/20] hw/intc/armv7m_nic: Access
 MemoryRegion with MemOp
Thread-Index: AQHVQKS8ru+KIa1tqke/bCiWCh2RRA==
Date: Mon, 22 Jul 2019 15:47:15 +0000
Message-ID: <1563810434810.27249@bt.com>
References: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.37]
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.74
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: [Qemu-devel] [PATCH v2 10/20] hw/intc/armv7m_nic: Access
 MemoryRegion with MemOp
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, mst@redhat.com,
 palmer@sifive.com, mark.cave-ayland@ilande.co.uk, Alistair.Francis@wdc.com,
 arikalo@wavecomp.com, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, rth@twiddle.net, atar4qemu@gmail.com,
 ehabkost@redhat.com, sw@weilnetz.de, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 cohuck@redhat.com, claudio.fontana@huawei.com, alex.williamson@redhat.com,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3qlMnf/I6cP2

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 hw/intc/armv7m_nvic.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 9f8f0d3..25bb88a 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -18,6 +18,7 @@
 #include "hw/intc/armv7m_nvic.h"
 #include "target/arm/cpu.h"
 #include "exec/exec-all.h"
+#include "exec/memop.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "trace.h"
@@ -2345,7 +2346,8 @@ static MemTxResult nvic_sysreg_ns_write(void *opaque,=
 hwaddr addr,
     if (attrs.secure) {
         /* S accesses to the alias act like NS accesses to the real region=
 */
         attrs.secure =3D 0;
-        return memory_region_dispatch_write(mr, addr, value, size, attrs);
+        return memory_region_dispatch_write(mr, addr, value, SIZE_MEMOP(si=
ze),
+                                            attrs);
     } else {
         /* NS attrs are RAZ/WI for privileged, and BusFault for user */
         if (attrs.user) {
@@ -2364,7 +2366,8 @@ static MemTxResult nvic_sysreg_ns_read(void *opaque, =
hwaddr addr,
     if (attrs.secure) {
         /* S accesses to the alias act like NS accesses to the real region=
 */
         attrs.secure =3D 0;
-        return memory_region_dispatch_read(mr, addr, data, size, attrs);
+        return memory_region_dispatch_read(mr, addr, data, SIZE_MEMOP(size=
),
+                                           attrs);
     } else {
         /* NS attrs are RAZ/WI for privileged, and BusFault for user */
         if (attrs.user) {
@@ -2390,7 +2393,8 @@ static MemTxResult nvic_systick_write(void *opaque, h=
waddr addr,

     /* Direct the access to the correct systick */
     mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]=
), 0);
-    return memory_region_dispatch_write(mr, addr, value, size, attrs);
+    return memory_region_dispatch_write(mr, addr, value, SIZE_MEMOP(size),
+                                        attrs);
 }

 static MemTxResult nvic_systick_read(void *opaque, hwaddr addr,
@@ -2402,7 +2406,7 @@ static MemTxResult nvic_systick_read(void *opaque, hw=
addr addr,

     /* Direct the access to the correct systick */
     mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]=
), 0);
-    return memory_region_dispatch_read(mr, addr, data, size, attrs);
+    return memory_region_dispatch_read(mr, addr, data, SIZE_MEMOP(size), a=
ttrs);
 }

 static const MemoryRegionOps nvic_systick_ops =3D {
--
1.8.3.1


