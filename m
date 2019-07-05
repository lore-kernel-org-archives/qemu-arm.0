Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3270540wru;
        Fri, 5 Jul 2019 08:10:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw4HiDRjhMRlyo7bfREQAhnzubTJxm9PTEscUH3r+GDNOfPfwVZG0e3jZDax1r/tjhxuOdd
X-Received: by 2002:a17:906:914:: with SMTP id i20mr4033842ejd.213.1562339408249;
        Fri, 05 Jul 2019 08:10:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562339408; cv=none;
        d=google.com; s=arc-20160816;
        b=TtCiWfiK++AUV1WY8wUKOdXV1hOlFO/oudjREhaqX1MJXMARiWgYemjgACdno02KFM
         re5ic5Lk6pTZrMNrmt4GBf3WF6QPmYhzMPxnZ3AEZ7GlS557j/BkuGbbIe/sC5/zoWPt
         O7pH7UWeGsdWVnzrdvRlYrCKcHqyYurnwxL3KztXCByXqz/YPUyhBCbv7tzjbMfQHccn
         jEVavLwA9RuRAYbeY+F9g0fdTkeDusXVzbM/gaXPDvpyEVhx0wtrJq8M3kDCRvlFcEQR
         eVB9aj3hHziiIM7BR7Io2+4zZiJ1Y3ToKkCmnhdEhSixjUsnzHRoEBE06TzQQEQKQ91K
         ILcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=qhF45NEgP+RWyyQFMQACZDwUnvEkV/nUyb8Il570IHs=;
        b=QT1PXV3JZPR9cvtNUUZ8qlALkS3wRuTr2KaMfy311ePJF6eUzGQLnsYnh3hkzJtdRq
         FVRgGJg3cxCK4c8mLI5vhOQujwJF6uXPUah0KRuWu4YkZC3CIoxMLtHWUUaZkcFVIBfk
         7mFIGCX68ZZyaYTcfYkxxzymfXs1SP35NslMztHfMloBZlqidPR1889Fkio5Ryu4FE1N
         0pPNpKQqNjxnZ41bd2XWui/GRf5g9HGmu+N8x2AzvCUC0p2kQbGDbwEQxFdllO+mgXZi
         PPkwQwwIozeb93ed/Car4L6iwqYZdsajqUu5BazqJ37+StuR5TWquGFhJ8xA4z6V5NVt
         +L0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6si1676251eda.197.2019.07.05.08.10.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jul 2019 08:10:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hjPqg-0001s9-B9
	for alex.bennee@linaro.org; Fri, 05 Jul 2019 11:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57750)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hjPpl-0001hM-LX
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 11:09:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hjPpi-0000FB-M4
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 11:09:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43482)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hjPpi-0008Gl-Gi; Fri, 05 Jul 2019 11:09:06 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8117A81F18;
 Fri,  5 Jul 2019 15:09:00 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-45.brq.redhat.com [10.40.204.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 034C880DB9;
 Fri,  5 Jul 2019 15:08:57 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  5 Jul 2019 17:08:49 +0200
Message-Id: <20190705150850.4967-2-philmd@redhat.com>
In-Reply-To: <20190705150850.4967-1-philmd@redhat.com>
References: <20190705150850.4967-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Fri, 05 Jul 2019 15:09:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 1/2] hw/ssi/xilinx_spips: Convert lqspi_read()
 to read_with_attrs
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
X-TUID: oGf9niAiQG+6

In the next commit we will implement the write_with_attrs()
handler. To avoid using different APIs, convert the read()
handler first.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/ssi/xilinx_spips.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index 8115bb6d46..e80619aece 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -1202,27 +1202,27 @@ static void lqspi_load_cache(void *opaque, hwaddr=
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
+        *value =3D cpu_to_le32(*(uint32_t *)retp);
+        DB_PRINT_L(1, "addr: %08" HWADDR_PRIx ", data: %08" PRIx64 "\n",
+                   addr, *value);
     } else {
         lqspi_load_cache(opaque, addr);
-        return lqspi_read(opaque, addr, size);
+        lqspi_read(opaque, addr, value, size, attrs);
     }
+
+    return MEMTX_OK;
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

