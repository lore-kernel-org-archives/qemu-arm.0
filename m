Received: by 2002:adf:a557:0:0:0:0:0 with SMTP id j23csp3632876wrb;
        Tue, 9 Jul 2019 05:33:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx3QGVFwn8mf147+PYeAY+021ciXFRxsJ1lYDSh8WJtQ+Opnd5drzBx6EZEjgx3+zw/IJtd
X-Received: by 2002:a17:906:5806:: with SMTP id m6mr21148544ejq.80.1562675628750;
        Tue, 09 Jul 2019 05:33:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562675628; cv=none;
        d=google.com; s=arc-20160816;
        b=g2S+lAKF1y2tvtTX1w9CXYKO4sllAF5S7/fLfO0w+zkiORR8VPl6JZRT4nDivDLR+C
         lBnkwN0BAHQ7FCC+e4jy1LwzBJIumbkfqQ51lmk9sLtfs2W5NG9GT9L0LsWskEInO20k
         m9sXaRNjJh+b35uP3gD3QSaGmA766fKLqe6peGVMLedXsAq0z6N5V54I6ddkbECJJul2
         FuvjvcnaBl2HtLTi+s3gW0be2U5AGcG5T4fqcxMTToXVCdh0+DeN2MQh/oKBb1QS801f
         8iWSvk+pFKUN6SWgWN4K7umLKgfrwvu1w+4R1C+LQoec2wuBS927j0A55dCJ3ZcDA+VY
         zvuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=+V7q+yod+Z5WoiEVvGFwtBtx2OFcAE4E5UbFjk5DKLY=;
        b=kCX9peDN5IMdoIDy1XUoi0C3X892tutCJ/uZFdToHVjJSV7olvNBg7KQCAU07PoezK
         yw1hmid5plKs5rfsIPfg98xdvPQiBAjE4AcSKTEmcLdThhQ3b6kNN7PGHOCCmYqM0Vnh
         nxzxNcLqlTh59ml5P/BKjPWqFLRgi+ScAIXpOJvLg1RebQpwCUTHfZfS7Yk9XwcesDPp
         VTR1Y1GXgce4Qroii8GyY1jrkT6MlS+kU6P5AIfW1PkbjpbokgqcMZRQYIw03lbOe7Jm
         JoOJ67yZosApTg0j+OglrydfEKhgBc6M4kSpvw7AZ8ICElURmmHKUrC21+5AvjoD8ZTs
         Nq9g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s49si15411455eda.99.2019.07.09.05.33.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2019 05:33:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hkpJa-0002nf-7M
	for alex.bennee@linaro.org; Tue, 09 Jul 2019 08:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59518)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hkpJ1-0002lP-Bo
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 08:33:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hkpJ0-0004cQ-9l
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 08:33:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36630)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hkpIw-0004ZI-Jq; Tue, 09 Jul 2019 08:33:06 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AB24C30C26A1;
 Tue,  9 Jul 2019 12:33:00 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-166.brq.redhat.com [10.40.204.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E36721001B0F;
 Tue,  9 Jul 2019 12:32:57 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  9 Jul 2019 14:32:40 +0200
Message-Id: <20190709123240.16298-4-philmd@redhat.com>
In-Reply-To: <20190709123240.16298-1-philmd@redhat.com>
References: <20190709123240.16298-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Tue, 09 Jul 2019 12:33:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH-for-4.1 v6 3/3] hw/ssi/xilinx_spips: Avoid
 out-of-bound access to lqspi_buf[]
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-stable@nongnu.org,
 Prasad J Pandit <ppandit@redhat.com>, Lei Sun <slei.casper@gmail.com>,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LJZt+JLl/1i0

Both lqspi_read() and lqspi_load_cache() expect a 32-bit
aligned address.

From UG1085 datasheet [*] chapter on 'Quad-SPI Controller':

  Transfer Size Limitations

    Because of the 32-bit wide TX, RX, and generic FIFO, all
    APB/AXI transfers must be an integer multiple of 4-bytes.
    Shorter transfers are not possible.

Set MemoryRegionOps.impl values to force 32-bit accesses,
this way we are sure we do not access the lqspi_buf[] array
out of bound.

[*] https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-=
ultrascale-trm.pdf

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Tested-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v6: fix datasheet reference
v5: add datasheet reference, drop RFC prefix, fix build (Francisco)
---
 hw/ssi/xilinx_spips.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index 3c4e8365ee..b29e0a4a89 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -1239,6 +1239,10 @@ static const MemoryRegionOps lqspi_ops =3D {
     .read_with_attrs =3D lqspi_read,
     .write_with_attrs =3D lqspi_write,
     .endianness =3D DEVICE_NATIVE_ENDIAN,
+    .impl =3D {
+        .min_access_size =3D 4,
+        .max_access_size =3D 4,
+    },
     .valid =3D {
         .min_access_size =3D 1,
         .max_access_size =3D 4
--=20
2.20.1

