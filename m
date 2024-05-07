Received: by 2002:a05:7022:ef03:b0:7c:9548:a19d with SMTP id qy3csp2007002dlb;
        Tue, 7 May 2024 06:04:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXLG9kSDLg3StaiLsAWO1K91FeajLoqkHNXmeoEXeapxOqh2H6Kz+/97pgnd/OCiIFLJ5NpKNTbeSw64NtBlNr2NAB+WygC
X-Google-Smtp-Source: AGHT+IGmMQZgtqm2qcvgGuCylpzXx+UtZCJWNeS0G344TtOx2w2SEGKj5m4vBDpnvhk1pAEJ66Gz
X-Received: by 2002:ac8:5705:0:b0:43a:a0a3:61c0 with SMTP id 5-20020ac85705000000b0043aa0a361c0mr4391928qtw.26.1715087083826;
        Tue, 07 May 2024 06:04:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715087083; cv=none;
        d=google.com; s=arc-20160816;
        b=ZUxSgpywMu9avHRJ6xSRQxiynGocHnHeMO0iJEZQxtImWB7JJLX3iomeikoccbpe7H
         lQYWlUPkLiRZGpTWLV7SukMGnMlBIu+iHdiK0nxsznaTalehUfRWjOArxDq3w+zdnzE7
         +3t8IcW+lTKKXOnrN+y/K5Kq4MsBSlO+l9OpFdScskpUFzLdVroBSnjfhkebqxARZvKe
         Snwh4/dmRk+yvprrSQMnBkxGdhBqosTHSnaQO/VN4Vu9v4c0tdiW6kyLaHAbfp/SeU+1
         +0SyC3w+1j4iFa8eRxyRFw0HUEcPiyr7t4d1oUAxqvcrYT+qs9X3JzttYEljUKpXEDJA
         fJVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=aq52NMkzfxwtO3Ey9uV/39RqjptH8wyrmoiQ/Fhwpng=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=nIZkdVrvnTqPzsZWwgjmMVNcEtE6um0++yepOkzO4i2u73hXKyMh3XXKA5Raoqk9Zx
         pXaaiysZS+bVr0yaniZaR+X+SpmQQylW5xar469iFbE/JmVc1NYsJzXncoxssu3c3ANr
         et8Oftw2y8R+najilcmA0z4EJDl+ogid8VNHVPK7QdaXS7FHdA77rEMA5ozbQBlCR4Vl
         OEhFriUmfatcXtrAaPVu0n6Dt/H+fEnXumtB+Nxv9SmIoRuGu2Bk6SKuye0AKnEoxCLB
         j4f+S7bkRYSq2++aY2MxadArr7JdwnUVw0sUtK6fVk3K3QSZhLU8dZ625XvtehCZlO8S
         AX0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11-20020ac8584b000000b0043ac98c7cbdsi11741745qth.358.2024.05.07.06.04.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 May 2024 06:04:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s4KUk-0000I5-Is; Tue, 07 May 2024 09:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1s4KUA-0008OL-Mv; Tue, 07 May 2024 09:03:58 -0400
Received: from dedi548.your-server.de ([85.10.215.148])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1s4KU8-0007vl-H1; Tue, 07 May 2024 09:03:58 -0400
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by dedi548.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1s4KU5-000MRj-8F; Tue, 07 May 2024 15:03:53 +0200
Received: from [82.100.198.138] (helo=mail.embedded-brains.de)
 by sslproxy03.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1s4KU4-000Oxn-2L; Tue, 07 May 2024 15:03:53 +0200
Received: from localhost (localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id 939184801C8;
 Tue,  7 May 2024 15:03:52 +0200 (CEST)
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 97qsmiWzOLzJ; Tue,  7 May 2024 15:03:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id 5B698480045;
 Tue,  7 May 2024 15:03:52 +0200 (CEST)
X-Virus-Scanned: amavis at zimbra.eb.localhost
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavis, port 10026)
 with ESMTP id rXToXnqkKFWJ; Tue,  7 May 2024 15:03:52 +0200 (CEST)
Received: from zimbra.eb.localhost (unknown [192.168.96.242])
 by mail.embedded-brains.de (Postfix) with ESMTPSA id 2F8084801C4;
 Tue,  7 May 2024 15:03:52 +0200 (CEST)
From: Sebastian Huber <sebastian.huber@embedded-brains.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 1/2] hw/arm/xilinx_zynq: Add cache controller
Date: Tue,  7 May 2024 15:03:48 +0200
Message-Id: <20240507130349.86851-2-sebastian.huber@embedded-brains.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240507130349.86851-1-sebastian.huber@embedded-brains.de>
References: <20240507130349.86851-1-sebastian.huber@embedded-brains.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: smtp-embedded@poldi-networks.de
X-Virus-Scanned: Clear (ClamAV 0.103.10/27268/Tue May  7 10:25:13 2024)
Received-SPF: pass client-ip=85.10.215.148;
 envelope-from=sebastian.huber@embedded-brains.de; helo=dedi548.your-server.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mBLXqJ8VUXrY

The Zynq 7000 SoCs contain a CoreLink L2C-310 cache controller.  Add the
corresponding Qemu device to the xilinx-zynq-a9 machine.

Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
---
 hw/arm/xilinx_zynq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 3190cc0b8d..078abd77bd 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -242,6 +242,7 @@ static void zynq_init(MachineState *machine)
     busdev =3D SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(busdev, &error_fatal);
     sysbus_mmio_map(busdev, 0, MPCORE_PERIPHBASE);
+    sysbus_create_varargs("l2x0", MPCORE_PERIPHBASE + 0x2000, NULL);
     sysbus_connect_irq(busdev, 0,
                        qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_IRQ));
=20
--=20
2.35.3

