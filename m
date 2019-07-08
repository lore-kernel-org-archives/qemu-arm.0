Received: by 2002:adf:a557:0:0:0:0:0 with SMTP id j23csp2293877wrb;
        Mon, 8 Jul 2019 03:51:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw0JeASbUlqxRmzui7x0b5cUfpqNw3eT+DjOIsWSN8g5Ij4O5V9dMByR5vB8+Nl+QMWm3jK
X-Received: by 2002:a05:6402:1707:: with SMTP id y7mr18992889edu.223.1562583097271;
        Mon, 08 Jul 2019 03:51:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562583097; cv=none;
        d=google.com; s=arc-20160816;
        b=FZflckZ5uk3MUMSv+gSu35bAGFUnQfVgQVurDMwcsJTFhnMfDhWvJR1YifuisZu2Ud
         CDw+IBouzWmVXCJM1vWEkFWAOJcPVY5D5mdR0IQNElt+nV4/elYkzXYTi9h83NNDK3bS
         9O/82nxM70lQGUSAjSLmzm24sdoEBDgPmL49A88CrmIOcDvJk+vj8Lk+//ilfOCc8Acn
         4O7WDRbZNVPhNpfWNI9Pr7YNIBVso03AhfzxgPrhrCWZTaVhyLRlw6DsIb0bUVrCSEsU
         yNoEEvJMc/TcSFctaM3zZXE7r+lbjFSRTJfQeCLQ4bHHdWOmitTLMwECXSKvDD4aZLf0
         6qsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=LDInV+w4ZeXuaMPzxIvXlVye/WE0ytZH7yR7hD92dzw=;
        b=BN0Wh1a7zoMxqscUWoOu3h5KMKovP1lk1ICDW9B2Zb6h/VKc2/264XAuV8tK+8u38M
         Tu/Nqhggl0PjtiQHbLvqxdFJ61uMT6rQaPgmrjXFR6qbIY1b7aCbhiY4zjCvt5aR5lTq
         TeR0jvOODS6H9afh6Vg42UhmEyLAkTPht5IPLnKoa9NOJ2qMxbVyMEl7VVBMM63mZqza
         KshN26KrKR97e0ttMlelhfsdHhj8Lp353CFhpUNBY8mfRP5zAN2OhM2iD65NN7dH2HOo
         eWjK2X7py9uIqVIdew6dDDueFRMmCRsUowuqnPxbbMxMsd5wkiPpwKVxP8Zcbj1xl36j
         Amhw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qn18si5216092ejb.331.2019.07.08.03.51.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jul 2019 03:51:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hkRFA-00068n-CR
	for alex.bennee@linaro.org; Mon, 08 Jul 2019 06:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39949)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hkRC9-0002xz-WE
 for qemu-arm@nongnu.org; Mon, 08 Jul 2019 06:48:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hkRC8-0006II-Pu
 for qemu-arm@nongnu.org; Mon, 08 Jul 2019 06:48:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46770)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hkRC8-0006Hw-K9; Mon, 08 Jul 2019 06:48:28 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0B6E02DE413;
 Mon,  8 Jul 2019 10:48:24 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-112.brq.redhat.com [10.40.204.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A66662E03C;
 Mon,  8 Jul 2019 10:48:18 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  8 Jul 2019 12:47:50 +0200
Message-Id: <20190708104750.1071-4-philmd@redhat.com>
In-Reply-To: <20190708104750.1071-1-philmd@redhat.com>
References: <20190708104750.1071-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Mon, 08 Jul 2019 10:48:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH-for-4.1 v5 3/3] hw/ssi/xilinx_spips: Avoid
 out-of-bound access to lqspi_buf[]
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
 Alistair Francis <alistair@alistair23.me>, qemu-stable@nongnu.org,
 Prasad J Pandit <ppandit@redhat.com>, Lei Sun <slei.casper@gmail.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: joIKTxYhsV52

Both lqspi_read() and lqspi_load_cache() expect a 32-bit
aligned address.

From UG1085 datasheet [*] Chapter 22: Quad-SPI Controller:

  Transfer Size Limitations

    Because of the 32-bit wide TX, RX, and generic FIFO, all
    APB/AXI transfers must be an integer multiple of 4-bytes.
    Shorter transfers are not possible.

Set MemoryRegionOps.impl values to force 32-bit accesses,
this way we are sure we do not access the lqspi_buf[] array
out of bound.

[*] https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-=
ultrascale-trm.pdf

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
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

