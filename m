Received: by 2002:adf:a557:0:0:0:0:0 with SMTP id j23csp3572694wrb;
        Tue, 9 Jul 2019 04:38:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzeuSdfznOpcrukRd9717A1sXhOkL0sPn+/6N1hEtcdNVqiKtMZL3FsO2t5oC7M88pbx8q3
X-Received: by 2002:a50:996e:: with SMTP id l43mr25378061edb.187.1562672285560;
        Tue, 09 Jul 2019 04:38:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562672285; cv=none;
        d=google.com; s=arc-20160816;
        b=TRWqbZRxyKhzbDQcpLxl2lcxFZ1SbqfIQNDRgwYje05HdDuulnkBwfjNXjm6fW+SxE
         47WmF2EFPcTq1pP+NtM3NBqVVHeKo4o4M8NOjFDvenT35LqK39DC6bzp0+h3ALcrfiJu
         zZsZszC/ryMRBdA7RgcqmIakHXRz8CMZDRoRurpBPUKYRjlKGhuWfectgI+1EYR6eauV
         DfebHVuMzseZMf7SwLQAB1ybcNHtYGmf4KRAorvzvlaFNnRgw8ok6PGyP4FlEYRswyZO
         iFCNRFZYVvYEByNuVLDMY3I0iVNLKKhubnZGoQpMuPnE8bbo1YTHHK3eB3Kvr52otewF
         X9yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=LA+ccWiP1K9VRqKhbFwSNiErAeiTyvQWWpyuZOapxv4=;
        b=VdEm32Wj0LIYY8XCGec66qVG2Pql0mpmabB9vRY2zpx5Ff2JHcWOt1z1Y6omT+2OHF
         wZuoVtrYTQyBuxCtXr1fmzdy1r8Q/j8TGFNX9mAc1VccHvOzChDFe3zdLyB/6M83q0yl
         vWSnUjYZNsosfzEFyDTQyyMLTL5si4YDLSj9DTuUSqLlAkURNDvAUAxM1lj89dllx4AA
         D2sSBsc1QI54AmtQ7VrXfzDDIXTLCPcAdx8bippbSnjzVHvwsc0ZpN993F63qlrT2Kog
         a3twmb4ghegJTKakh5BiT9B0YxN0X+ak3sYPC3PanNu2RWU4W/fAiIh3AEvS56tCWn9L
         +UUw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n3si11708460ejk.56.2019.07.09.04.38.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2019 04:38:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hkoRg-0004XI-MS
	for alex.bennee@linaro.org; Tue, 09 Jul 2019 07:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46271)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hkoR8-0004VP-SN
 for qemu-arm@nongnu.org; Tue, 09 Jul 2019 07:37:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hkoR6-00079Y-O1
 for qemu-arm@nongnu.org; Tue, 09 Jul 2019 07:37:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60480)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hkoR4-00076V-PF; Tue, 09 Jul 2019 07:37:28 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5F77B5D672;
 Tue,  9 Jul 2019 11:37:24 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-166.brq.redhat.com [10.40.204.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CEF292AEF;
 Tue,  9 Jul 2019 11:37:22 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  9 Jul 2019 13:37:13 +0200
Message-Id: <20190709113715.7761-2-philmd@redhat.com>
In-Reply-To: <20190709113715.7761-1-philmd@redhat.com>
References: <20190709113715.7761-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Tue, 09 Jul 2019 11:37:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 1/3] hw/ssi/mss-spi: Convert debug printf()s to
 trace events
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
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X8XXPCULIRb9

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Useful while debugging, can be skipped for next dev cycle.

 Makefile.objs       |  1 +
 hw/ssi/mss-spi.c    | 23 ++++++-----------------
 hw/ssi/trace-events |  6 ++++++
 3 files changed, 13 insertions(+), 17 deletions(-)
 create mode 100644 hw/ssi/trace-events

diff --git a/Makefile.objs b/Makefile.objs
index 6a143dcd57..60ec443091 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -178,6 +178,7 @@ trace-events-subdirs +=3D hw/scsi
 trace-events-subdirs +=3D hw/sd
 trace-events-subdirs +=3D hw/sparc
 trace-events-subdirs +=3D hw/sparc64
+trace-events-subdirs +=3D hw/ssi
 trace-events-subdirs +=3D hw/timer
 trace-events-subdirs +=3D hw/tpm
 trace-events-subdirs +=3D hw/usb
diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c
index 918b1f3e82..4878279482 100644
--- a/hw/ssi/mss-spi.c
+++ b/hw/ssi/mss-spi.c
@@ -27,18 +27,8 @@
 #include "hw/ssi/mss-spi.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "trace.h"
=20
-#ifndef MSS_SPI_ERR_DEBUG
-#define MSS_SPI_ERR_DEBUG   0
-#endif
-
-#define DB_PRINT_L(lvl, fmt, args...) do { \
-    if (MSS_SPI_ERR_DEBUG >=3D lvl) { \
-        qemu_log("%s: " fmt "\n", __func__, ## args); \
-    } \
-} while (0)
-
-#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
=20
 #define FIFO_CAPACITY         32
=20
@@ -187,9 +177,9 @@ spi_read(void *opaque, hwaddr addr, unsigned int size=
)
         }
         break;
     }
-
-    DB_PRINT("addr=3D0x%" HWADDR_PRIx " =3D 0x%" PRIx32, addr * 4, ret);
+    trace_mss_spi_read(addr << 2, ret);
     spi_update_irq(s);
+
     return ret;
 }
=20
@@ -225,9 +215,9 @@ static void spi_flush_txfifo(MSSSpiState *s)
         s->regs[R_SPI_STATUS] &=3D ~(S_TXDONE | S_RXRDY);
=20
         tx =3D fifo32_pop(&s->tx_fifo);
-        DB_PRINT("data tx:0x%" PRIx32, tx);
+        trace_mss_spi_flush_fifo("tx", tx);
         rx =3D ssi_transfer(s->spi, tx);
-        DB_PRINT("data rx:0x%" PRIx32, rx);
+        trace_mss_spi_flush_fifo("rx", rx);
=20
         if (fifo32_num_used(&s->rx_fifo) =3D=3D s->fifo_depth) {
             s->regs[R_SPI_STATUS] |=3D S_RXCHOVRF;
@@ -262,9 +252,8 @@ static void spi_write(void *opaque, hwaddr addr,
     MSSSpiState *s =3D opaque;
     uint32_t value =3D val64;
=20
-    DB_PRINT("addr=3D0x%" HWADDR_PRIx " =3D0x%" PRIx32, addr, value);
+    trace_mss_spi_write(addr, value);
     addr >>=3D 2;
-
     switch (addr) {
     case R_SPI_TX:
         /* adding to already full FIFO */
diff --git a/hw/ssi/trace-events b/hw/ssi/trace-events
new file mode 100644
index 0000000000..6e494b913c
--- /dev/null
+++ b/hw/ssi/trace-events
@@ -0,0 +1,6 @@
+# See docs/devel/tracing.txt for syntax documentation.
+
+# mss-spi.c
+mss_spi_read(uint32_t addr, uint32_t value) "read addr:0x%02x value:0x%0=
8x"
+mss_spi_write(uint32_t addr, uint32_t value) "write addr:0x%02x value:0x=
%08x"
+mss_spi_flush_fifo(const char *name, uint32_t value) "flush fifo:%s valu=
e:0x%08x"
--=20
2.20.1

