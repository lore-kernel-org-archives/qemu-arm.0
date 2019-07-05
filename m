Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3009997wru;
        Fri, 5 Jul 2019 03:43:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwDMXRWCJ3nLqyQz+yVgGUZWOt7r7tG4flHhuuvXGk5f8KbALh6rfTbVeZFqwPlo8QqdZke
X-Received: by 2002:a05:6402:8cc:: with SMTP id d12mr3773699edz.60.1562323401873;
        Fri, 05 Jul 2019 03:43:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562323401; cv=none;
        d=google.com; s=arc-20160816;
        b=EUJBHTL/liKoLePCMeCPk8YfuS48H2YlL29On49qlFmLXNY3tngfJD/CcymelvuD7d
         q3Pg+IVnC2v2blXM56qnDtx17V4ooR//QzoqdqVXDdQ4pT2Qh3dHPaUBSjso/HgmZJ4y
         Xziyd6qjyPTR5OCD+VGlng9gKKGnZS+wY2s7ncgjvbxcfKDiBx7p4MXdmkc4L2WjctAT
         n3mDdHReM97+jZp1Pyk+pwtMfEDPLW8dSgKfAhhaeV3OxGImp9SjYTiKeu3ZuUQMl9B8
         OQs3k9CTiLR4GpE+xXU7plrVDYmWahFq1M0RYXupK1qCrhzFNJpi3EjIDfYWm0eJN+sc
         yyfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=ml7nk8nCxHH03HLINrwx+R5ZSSi3LkTrq3VkueLV22A=;
        b=vE6wUwZzpGvvW0Ialg0x1v4SXwcMfHI7yaNnwOZW9oXRt46UAZdsPTy8eJJCD0y+A0
         oUZRQ1fDm0rDKbdSQj7y1Y6qspcDgLlycSedw7DJN5WBTCuL9Aioe6MNWdKbChPhPDya
         OwLj1MIgWWHrZQY9TKwPGynU+fWo6KYfSRzLgBihNFZ6ClgaZK64nLIW3Z4NMth21R9v
         DBtqvn6Qfu/y79P2UC2hVxvBvyFumrHvM77lNDbJRXyhfgVM3WrXqt9OFOXVqZJ9XP5P
         DbmCASXmk6Ayzcp1MG7RN3TGUbIem+Ud++oDDtYoGPmfEuKZyOEvtAhgFkqT9YNQq20V
         rI1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7si1762251ejc.279.2019.07.05.03.43.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jul 2019 03:43:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hjLgX-0006SZ-0q
	for alex.bennee@linaro.org; Fri, 05 Jul 2019 06:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57987)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hjLgL-0006PB-VZ
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 06:43:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hjLgK-00056Y-5h
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 06:43:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56892)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hjLgJ-0004vG-Uj; Fri, 05 Jul 2019 06:43:08 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4D120301E11B;
 Fri,  5 Jul 2019 10:43:03 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-45.brq.redhat.com [10.40.204.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A01EA100164A;
 Fri,  5 Jul 2019 10:42:57 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  5 Jul 2019 12:42:55 +0200
Message-Id: <20190705104255.24027-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Fri, 05 Jul 2019 10:43:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH-for-4.1 v2] hw/ssi/xilinx_spips: Avoid AXI writes
 to the LQSPI linear memory
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
X-TUID: L6x7DusN72N4

Lei Sun found while auditing the code than a CPU write would
trigger a NULL pointer deference.

From UG1085 datasheet [*] AXI writes in this region are ignored
and generates an External Slave Error (SLVERR).

Fix by checking the access is a READ before calling the region
callback.

[*] https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-=
ultrascale-trm.pdf

Reported-by: Lei Sun <slei.casper@gmail.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v1: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg01238.html
---
 hw/ssi/xilinx_spips.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index 8115bb6d46..0c9ccd12bf 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -1202,6 +1202,18 @@ static void lqspi_load_cache(void *opaque, hwaddr =
addr)
     }
 }
=20
+static bool lqspi_accepts(void *opaque, hwaddr addr,
+                          unsigned size, bool is_write,
+                          MemTxAttrs attrs)
+{
+    /*
+     * From UG1085, Chapter 24 (Quad-SPI controllers):
+     * - Writes are ignored
+     * - AXI writes generate an external AXI slave error (SLVERR)
+     */
+    return !is_write;
+}
+
 static uint64_t
 lqspi_read(void *opaque, hwaddr addr, unsigned int size)
 {
@@ -1225,6 +1237,7 @@ static const MemoryRegionOps lqspi_ops =3D {
     .read =3D lqspi_read,
     .endianness =3D DEVICE_NATIVE_ENDIAN,
     .valid =3D {
+        .accepts =3D lqspi_accepts,
         .min_access_size =3D 1,
         .max_access_size =3D 4
     }
--=20
2.20.1

