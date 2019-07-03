Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1147513wru;
        Wed, 3 Jul 2019 12:09:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyVUASj9wPZ6cthguDqS29gEpbzf+MxMPf+h8M31fh2MjmuynF3AqQEPpbBk3BlOv1nSf08
X-Received: by 2002:a17:906:5788:: with SMTP id k8mr24186904ejq.71.1562180995802;
        Wed, 03 Jul 2019 12:09:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562180995; cv=none;
        d=google.com; s=arc-20160816;
        b=A0WzuU4DuBDCX3BtvIva83QvFlzCearcGdoguD2dWLM5odUVDOPGfnOiBaazHDBySV
         ExojTkY5IaM7jm0u9QQ/3mUeMuLvaQaAJYJEC/gOOlynwnvtp3YlWccYrU4MUzfmRX5Y
         B5q7VXbvR2B6gy006tlty1ujtQ0XV1MPM/SJNu/erUoBrytQcFTpaN0JjTTKH3SksBeC
         QvlyPd09HrnjmryQJezlpfI6BrW0TO5VlmKpT89aO2AvMU1qm2oboLqHEvXVmLIwUFQz
         1YH+TBb6Dz635lQJ3ezsGndw+py/Ip2Oscip7pdTWpfPSIiZlj1QvACl8GewxPcNJigl
         4dDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=8YvvvUUS1bmT7mLlNYLk14PQaoD87dLr8QiW1qqn1/A=;
        b=dtm0XGTNJxmyrt0P1Eb5dMQII41SI5INKRbbonGsEb7z11Jrs2kMkIIlLLrMEHlM6i
         gUmLMqlc7ltAEQOjxgomI5KXnW80m+f7P8z0oV9NMf2QdRMFPvMcd+U3mLt3jBHLlhsJ
         ssy8SHXUEesTx3ARDHked84CVDjUDAME4JtvTM5CpfMrd9uBjao0ldFLXb3UwxSDdE86
         WQKY9+Z3aagGge0+Z2ximyJ7US3qXxCnlKMUp++l3d1X3gh/SH/eIqercwNOBjt2+cg6
         9Th1zjC3tgaJ2vBwCfyDWDA/+vxEasK5oNvXJI6OlI7s8HoKUk9ooY2mFpMDrue6P435
         Qa3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i15si2281375ejv.336.2019.07.03.12.09.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2019 12:09:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hikde-0004I1-Ug
	for alex.bennee@linaro.org; Wed, 03 Jul 2019 15:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39672)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ppandit@redhat.com>) id 1hikcY-0003bJ-8T
 for qemu-arm@nongnu.org; Wed, 03 Jul 2019 15:08:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ppandit@redhat.com>) id 1hikcX-00087x-0X
 for qemu-arm@nongnu.org; Wed, 03 Jul 2019 15:08:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60216)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ppandit@redhat.com>)
 id 1hikcW-000871-Jh; Wed, 03 Jul 2019 15:08:44 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 530DE3082E51;
 Wed,  3 Jul 2019 19:08:26 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-160.sin2.redhat.com
 [10.67.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18C05968A0;
 Wed,  3 Jul 2019 19:08:21 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: Qemu Developers <qemu-devel@nongnu.org>
Date: Thu,  4 Jul 2019 00:36:15 +0530
Message-Id: <20190703190615.31436-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Wed, 03 Jul 2019 19:08:31 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] hw/ssi/xilinx_spips: add lqspi_write routine
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Prasad J Pandit <pjp@fedoraproject.org>, Lei Sun <slei.casper@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kugsTXt5yPeY

From: Prasad J Pandit <pjp@fedoraproject.org>

Define skeleton lqspi_write routine. Avoid NULL dereference.

Reported-by: Lei Sun <slei.casper@gmail.com>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/ssi/xilinx_spips.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index 8115bb6d46..0836b8977a 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -1221,8 +1221,15 @@ lqspi_read(void *opaque, hwaddr addr, unsigned int=
 size)
     }
 }
=20
+static void
+lqspi_write(void *opaque, hwaddr addr, uint64_t data, unsigned size)
+{
+    return;
+}
+
 static const MemoryRegionOps lqspi_ops =3D {
     .read =3D lqspi_read,
+    .write =3D lqspi_write,
     .endianness =3D DEVICE_NATIVE_ENDIAN,
     .valid =3D {
         .min_access_size =3D 1,
--=20
2.21.0

