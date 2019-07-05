Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3538773wru;
        Fri, 5 Jul 2019 13:41:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxe4+EWhoEjpJ9AaWVD369kgqnot4DJIuCxEJZtM718Z2xTkDdkWwzq7c0DtwL2AUxxa8Gx
X-Received: by 2002:a05:6402:1707:: with SMTP id y7mr6480233edu.223.1562359276458;
        Fri, 05 Jul 2019 13:41:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562359276; cv=none;
        d=google.com; s=arc-20160816;
        b=PZmAfFw0dyuO7OFmpjGMQYW0Y7A3zVjkwz2cINKl/k83DXx59a8OI1n79D4nfiCz2g
         nmpwgXLeUSvT1+IVmO0nW4gl+PuZveli4jMsl3KcEBfY/scnTI4DM6Zj+ekuSC9apYpq
         fDPfj0PfmAT1JQJDWb5bYlvJPP2XVNKGws3lM/HuD6+YbdvY3M3fRR5kUpNXHaei4gML
         A6kaxS/B/BdLcTayNyMIu8m+LQtaqvzYS7utkhUQ2KAoEONu7k4dQbgOF2VQqn2jyd9R
         hV8HITzd34opE2yxSoe47mK2dgaYYKwlzaKsqUbZqDFwg8WFZpcJawEINqIApLCTtCQD
         7kng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=jhOYDIEHev7EfskdVmj64eEXYFOxwB+8H9sVETZNhOY=;
        b=ArWroCWOjxY6JOV2DcYVkyQ6pc51pPuFNLYS7ll23YuFombm7ZmajJGf4B3sBgkvyR
         Ds1U+Y0bgls+DLMNzmdUqZ9aOVc81HcKKWZPE4aTePELCai20DdLExEQCNGzrPcb8F9p
         qJ70GMBF6A7dZwaRBpGSeDlBQ9xgkLBLv8d1s7i+iISTzSdgHTStqrC40g+yA9xH1UL8
         mbg0EYeqiIYLP9CmRPNDx66YfQDEgQqmAwNCQB6tyDfAyJIPlj/qgFKzXiiorRboh5e7
         fZbYNgE0dUosSfrrsh0uyHgflKPi2TRfXCO+4ZyLPMTwoo3UMznfrxwwZXiYOCMszSSx
         jjbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f28si1918287edb.80.2019.07.05.13.41.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jul 2019 13:41:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hjV19-00055c-I0
	for alex.bennee@linaro.org; Fri, 05 Jul 2019 16:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34635)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hjUlq-0005zC-Ej
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 16:25:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hjUlp-0004PX-92
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 16:25:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46696)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hjUlp-00044T-29; Fri, 05 Jul 2019 16:25:25 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D6B5683F40;
 Fri,  5 Jul 2019 20:25:11 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-45.brq.redhat.com [10.40.204.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8ED0661993;
 Fri,  5 Jul 2019 20:25:09 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  5 Jul 2019 22:24:58 +0200
Message-Id: <20190705202500.18853-2-philmd@redhat.com>
In-Reply-To: <20190705202500.18853-1-philmd@redhat.com>
References: <20190705202500.18853-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Fri, 05 Jul 2019 20:25:11 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH-for-4.1 v4 1/3] hw/ssi/xilinx_spips: Convert
 lqspi_read() to read_with_attrs
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Prasad J Pandit <ppandit@redhat.com>, Lei Sun <slei.casper@gmail.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I3mjhUlRIzIG

In the next commit we will implement the write_with_attrs()
handler. To avoid using different APIs, convert the read()
handler first.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v4: Do not ignore lqspi_read() return value (Francisco)
---
 hw/ssi/xilinx_spips.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index 8115bb6d46..b7c7275dbe 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -1202,27 +1202,26 @@ static void lqspi_load_cache(void *opaque, hwaddr=
 addr)
     }
 }
=20
-static uint64_t
-lqspi_read(void *opaque, hwaddr addr, unsigned int size)
+static MemTxResult lqspi_read(void *opaque, hwaddr addr, uint64_t *value=
,
+                              unsigned size, MemTxAttrs attrs)
 {
-    XilinxQSPIPS *q =3D opaque;
-    uint32_t ret;
+    XilinxQSPIPS *q =3D XILINX_QSPIPS(opaque);
=20
     if (addr >=3D q->lqspi_cached_addr &&
             addr <=3D q->lqspi_cached_addr + LQSPI_CACHE_SIZE - 4) {
         uint8_t *retp =3D &q->lqspi_buf[addr - q->lqspi_cached_addr];
-        ret =3D cpu_to_le32(*(uint32_t *)retp);
-        DB_PRINT_L(1, "addr: %08x, data: %08x\n", (unsigned)addr,
-                   (unsigned)ret);
-        return ret;
-    } else {
-        lqspi_load_cache(opaque, addr);
-        return lqspi_read(opaque, addr, size);
+        *value =3D cpu_to_le32(*(uint32_t *)retp);
+        DB_PRINT_L(1, "addr: %08" HWADDR_PRIx ", data: %08" PRIx64 "\n",
+                   addr, *value);
+        return MEMTX_OK;
     }
+
+    lqspi_load_cache(opaque, addr);
+    return lqspi_read(opaque, addr, value, size, attrs);
 }
=20
 static const MemoryRegionOps lqspi_ops =3D {
-    .read =3D lqspi_read,
+    .read_with_attrs =3D lqspi_read,
     .endianness =3D DEVICE_NATIVE_ENDIAN,
     .valid =3D {
         .min_access_size =3D 1,
--=20
2.20.1

