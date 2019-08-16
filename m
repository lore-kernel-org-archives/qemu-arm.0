Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp486851wrs;
        Fri, 16 Aug 2019 00:49:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqydEsKUa8OVuRcYw/y1CGZcCciFtGILLvN/3fSyrngaIKrOTJbiKiqHgHxaeBbyXubCr5+N
X-Received: by 2002:a37:67c3:: with SMTP id b186mr7541400qkc.320.1565941762669;
        Fri, 16 Aug 2019 00:49:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565941762; cv=none;
        d=google.com; s=arc-20160816;
        b=XZ8CPONgzoTcLlMB0wFtcZD8D6ol+esql0DbzIHCpjTHLzT+wk0ortUL0qhSULT5ID
         EhUjAN0r4pwbzVhvG4YdkeIBCy5ShIemtf+vRsPFdaFueK9T+bTQ34gDBhfER+tG1F5z
         3xT3OAQCem1zTyV190AFfcINyAhqVjdhRW5uAyaTqRLa0jaPIxoRjJ6mYeX9VIabarxu
         /1N1aHaWjOaDmi36MSHAbAmpFBIBB0KvK4s2ulDMi/6UW4S6cUKTcgxY4QbHRbeIhhqR
         7hUeWapH4cawFghYEM1n6DtTJNz+Z1UhZU+JJqOCdZstaF4u75wysF56UrOtMmk7lC4C
         t1lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:to:from;
        bh=HW/z4dp80tF0X4uwlahhXu/Sq8ysgm6unVkuurYM+JM=;
        b=sa2BQqVeTU1PWT/ZhFugMlzDP2V7PczO7YFVKHZnYOY3PcNf1ISCAYc3CGQnOOxAH2
         8fsOr3ut5Hq9CQnm01wTnDWL5diuUQGAKmq29BkV2VM6IRDcVH7zLWq6kyNd+sVcXQWD
         9sVpNtHU7hAXiMB5ABxEkk/JcVaM14gSNmLDAPwc2flsO6xZKUK93u2rfNVRXKSTEYl5
         qITSZ8zKXEDI7NatujfObrCCUgHk/HdFxo4C4OGQDzkoxvLwuFKSR4BlfOplI/FyJTtn
         mT0uHiCyO1mYI70D+YNa1IrcNhysbO+dFvh+3HExwWEFF8TaPT/qtFmTolPIw3MfqoQ8
         l+4A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d142si2873668qkb.99.2019.08.16.00.49.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 00:49:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:50882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyWzB-0006og-J1
	for alex.bennee@linaro.org; Fri, 16 Aug 2019 03:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39059)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWjv-0006sf-0X
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 03:33:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hyWjs-0000ON-KF
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 03:33:34 -0400
Received: from smtpe1.intersmtp.com ([213.121.35.80]:56624)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hyWjI-0008Uc-Og; Fri, 16 Aug 2019 03:32:58 -0400
Received: from tpw09926dag18g.domain1.systemhost.net (10.9.212.34) by
 BWP09926085.bt.com (10.36.82.116) with Microsoft SMTP Server (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1713.5; Fri, 16
 Aug 2019 08:32:44 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18g.domain1.systemhost.net (10.9.212.34) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 16 Aug 2019 08:32:47 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 16 Aug
 2019 08:32:47 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v7 18/42] hw/display: Declare device little
 or big endian
Thread-Index: AQHVVATMm+Gw97XX1E69XWqXb5W1uQ==
Date: Fri, 16 Aug 2019 07:32:47 +0000
Message-ID: <1565940766250.74217@bt.com>
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.40]
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 213.121.35.80
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: [Qemu-devel] [PATCH v7 18/42] hw/display: Declare device little or
 big endian
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
Cc: frederic.konrad@adacore.com, berto@igalia.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, pasic@linux.ibm.com, hpoussin@reactos.org,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org, lersek@redhat.com,
 jasowang@redhat.com, jiri@resnulli.us, ehabkost@redhat.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 stefanha@redhat.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 andrew@aj.id.au, claudio.fontana@suse.com, crwulff@gmail.com,
 laurent@vivier.eu, sundeep.lkml@gmail.com, michael@walle.cc,
 qemu-ppc@nongnu.org, kbastian@mail.uni-paderborn.de, imammedo@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, david@redhat.com, palmer@sifive.com,
 keith.busch@intel.com, jcmvbkbc@gmail.com, hare@suse.com,
 sstabellini@kernel.org, andrew.smirnov@gmail.com, deller@gmx.de,
 magnus.damm@gmail.com, atar4qemu@gmail.com, minyard@acm.org, sw@weilnetz.de,
 yuval.shaia@oracle.com, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 jan.kiszka@web.de, clg@kaod.org, shorne@gmail.com, qemu-riscv@nongnu.org,
 i.mitsyanko@gmail.com, cohuck@redhat.com, philmd@redhat.com,
 amarkovic@wavecomp.com, peter.chubb@nicta.com.au, aurelien@aurel32.net,
 pburton@wavecomp.com, sagark@eecs.berkeley.edu, green@moxielogic.com,
 kraxel@redhat.com, edgar.iglesias@gmail.com, gxt@mprc.pku.edu.cn,
 robh@kernel.org, borntraeger@de.ibm.com, joel@jms.id.au,
 antonynpavlov@gmail.com, chouteau@adacore.com, Andrew.Baumann@microsoft.com,
 mreitz@redhat.com, walling@linux.ibm.com, dmitry.fleytman@gmail.com,
 mst@redhat.com, mark.cave-ayland@ilande.co.uk, jslaby@suse.cz, marex@denx.de,
 proljc@gmail.com, marcandre.lureau@redhat.com, alistair@alistair23.me,
 paul.durrant@citrix.com, david@gibson.dropbear.id.au,
 xiaoguangrong.eric@gmail.com, huth@tuxfamily.org, jcd@tribudubois.net,
 pbonzini@redhat.com, stefanb@linux.ibm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wNyuz2sOfW/D

For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
targets from the set of target/hw/*/device.o.

If the set of targets are all little or all big endian, re-declare
the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN
respectively.

This *naive* deduction may result in genuinely native endian devices
being incorrectly declared as little or big endian, but should not
introduce regressions for current targets.

These devices should be re-declared as DEVICE_NATIVE_ENDIAN if 1) it
has a new target with an opposite endian or 2) someone informed knows
better =3D)

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 hw/display/pl110.c    | 2 +-
 hw/display/tc6393xb.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/display/pl110.c b/hw/display/pl110.c
index 2bdfc3c..d0c6317 100644
--- a/hw/display/pl110.c
+++ b/hw/display/pl110.c
@@ -471,7 +471,7 @@ static void pl110_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps pl110_ops =3D {
     .read =3D pl110_read,
     .write =3D pl110_write,
-    .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
 };

 static void pl110_mux_ctrl_set(void *opaque, int line, int level)
diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c
index 0b7c59c..6bc3360 100644
--- a/hw/display/tc6393xb.c
+++ b/hw/display/tc6393xb.c
@@ -547,7 +547,7 @@ TC6393xbState *tc6393xb_init(MemoryRegion *sysmem, uint=
32_t base, qemu_irq irq)
     static const MemoryRegionOps tc6393xb_ops =3D {
         .read =3D tc6393xb_readb,
         .write =3D tc6393xb_writeb,
-        .endianness =3D DEVICE_NATIVE_ENDIAN,
+        .endianness =3D DEVICE_LITTLE_ENDIAN,
         .impl =3D {
             .min_access_size =3D 1,
             .max_access_size =3D 1,
--
1.8.3.1

?
