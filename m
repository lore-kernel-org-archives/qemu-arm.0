Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3557632wru;
        Fri, 5 Jul 2019 14:07:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxQpppDZPo2WEKwr0jXiaxqphIz0dX7dgyxcInu0kQ0d93VA5S+Y9elZcTW7xjkjURGJp76
X-Received: by 2002:a50:b48f:: with SMTP id w15mr6818577edd.260.1562360868913;
        Fri, 05 Jul 2019 14:07:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562360868; cv=none;
        d=google.com; s=arc-20160816;
        b=gRIKGnMEHSa7TX+TyiIzYzcaQ0IZvFtXxzCKU3cWmsrqTjRbCAo5J28T8t/NhXlQeu
         TcPKwqeBLgp1CAzNNWnY5t3v6vxk+Qh7AMBsUNDyN4cmbAVgBUyAAQU9jrV+w4PzUiNy
         YBICImp5sP/C8whdaiz9Zs8hXPqQgDqkarqFUfHsMfDCPH6wFPbx80ypMO7aw+87J7gO
         5dnjNqzkVK2wyloo6HtXD406Tal/xg+XI90AmJhuaIJA0SSVLUr9BjQ/rLgKGzVCpfvv
         HJy/709+pgTGYLn1n5huhod6vXmJFxd/Xxj1l/FExTIGmxsrV9IlKRgDBELG41IRbNOE
         Zlkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Y/qK6wnCYYVhyqInXeWbmnzabQeYOGdFBRU+ssWpyoc=;
        b=y8U1GNHoyUCfeFW3xy+6k8CEm+FIqJi3xoYje2pfkFDyrA1kMPsLKQ39JElAIAHeKq
         uHKdQBZg/yloQeudO5xOHXGhOqSEE8pgQDriYl+RhnTd00RgygArMul/bhRTaI7yKwyB
         +J2wJfh7X7HwF2UJ7NEwiO7d/XrmL6gtcmZ9xrYyUTZvG7xacpQ7gq/UgwH90Q2z2Pk5
         fU9DRn2uXq/OPfyO4XLMMbs1IwlLJzxPGEJq5dNmd/qELnACsmiK/K5Q3XXk1DcH2GbO
         HQIXJYeFb4T1h1hBr4F05SloOkI3hXQAn5ManWcpGLbzhT6uN5cOHAfOk+9LICpExDBh
         z/9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g15si6733654ejm.175.2019.07.05.14.07.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jul 2019 14:07:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hjVQq-0002DK-00
	for alex.bennee@linaro.org; Fri, 05 Jul 2019 17:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34653)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hjUlq-00060V-Uf
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 16:25:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hjUlp-0004QG-LZ
 for qemu-arm@nongnu.org; Fri, 05 Jul 2019 16:25:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36252)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hjUlp-000478-Eg; Fri, 05 Jul 2019 16:25:25 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 980CC59451;
 Fri,  5 Jul 2019 20:25:14 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-45.brq.redhat.com [10.40.204.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 53DC016908;
 Fri,  5 Jul 2019 20:25:12 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  5 Jul 2019 22:24:59 +0200
Message-Id: <20190705202500.18853-3-philmd@redhat.com>
In-Reply-To: <20190705202500.18853-1-philmd@redhat.com>
References: <20190705202500.18853-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 05 Jul 2019 20:25:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH-for-4.1 v4 2/3] hw/ssi/xilinx_spips: Avoid AXI
 writes to the LQSPI linear memory
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
X-TUID: mNVQTRmEqSeh

Lei Sun found while auditing the code that a CPU write would
trigger a NULL pointer dereference.

From UG1085 datasheet [*] AXI writes in this region are ignored
and generates an AXI Slave Error (SLVERR).

Fix by implementing the write_with_attrs() handler.
Return MEMTX_ERROR when the region is accessed (this error maps
to an AXI slave error).

[*] https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-=
ultrascale-trm.pdf

Reported-by: Lei Sun <slei.casper@gmail.com>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v4: Fix typos (Francisco)
---
 hw/ssi/xilinx_spips.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index b7c7275dbe..3c4e8365ee 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -1220,8 +1220,24 @@ static MemTxResult lqspi_read(void *opaque, hwaddr=
 addr, uint64_t *value,
     return lqspi_read(opaque, addr, value, size, attrs);
 }
=20
+static MemTxResult lqspi_write(void *opaque, hwaddr offset, uint64_t val=
ue,
+                               unsigned size, MemTxAttrs attrs)
+{
+    /*
+     * From UG1085, Chapter 24 (Quad-SPI controllers):
+     * - Writes are ignored
+     * - AXI writes generate an external AXI slave error (SLVERR)
+     */
+    qemu_log_mask(LOG_GUEST_ERROR, "%s Unexpected %u-bit access to 0x%" =
PRIx64
+                                   " (value: 0x%" PRIx64 "\n",
+                  __func__, size << 3, offset, value);
+
+    return MEMTX_ERROR;
+}
+
 static const MemoryRegionOps lqspi_ops =3D {
     .read_with_attrs =3D lqspi_read,
+    .write_with_attrs =3D lqspi_write,
     .endianness =3D DEVICE_NATIVE_ENDIAN,
     .valid =3D {
         .min_access_size =3D 1,
--=20
2.20.1

