Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4844883wrg;
        Tue, 25 Jun 2019 04:29:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy5axYa/46ekwAyE5OquKASbNc6eoxnR4L2eSa93Mh6zt/mojogGYxB9j1nBG5OEGafmio+
X-Received: by 2002:a17:906:3452:: with SMTP id d18mr113663750ejb.24.1561462144802;
        Tue, 25 Jun 2019 04:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561462144; cv=none;
        d=google.com; s=arc-20160816;
        b=tREI+jvb1HaZwEbu6l/TGKCiv0+hTmpFMdPX65i2XVTUAJt4OCTeCUKZjFiVCNAoRu
         Xhv7IgmFTyK36numWBMQ3Zq3nyv4lWjyR6YPMVcSLRT+aW8dit5DejS4iml25saZRO1M
         ekuR4Tjzoj9uqD/XZYq9w6CLEbs12IVtRAkI8lIgempIts6f7wdt7A9aMnKZEROXNmEx
         1bWLs2IXQOd7Y8avj6qcKo0jduAvwOuBLetIu2mbRR6ygA8rwqf4ljwW1tjy49qJnY3o
         xLOLK1rdTX8i15686fKYW8iNWykqCyVA4yn4Dm/jcMTvVGI8iSGV/YS4K8tGtYw9Ph6f
         A1ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=AX0pOlAnoRhNCilNvemgiHPoqZSbF6HHLGMGzYBjws4=;
        b=RSZ0h21d8FcbNqh+kxWNuCmgkIo0Hz9ZEISkbYFlRIj6LVfbxb6UHyTBTpT8Qhr28X
         WTUPTJbbvQwAp5fw2JusDL3ShDS/4rHKYJH+Ieww1wV43K/5/7xfkB63mvcCPII12eiw
         rj+TWphs1B9y4zUHvA2dWNmN6l18c8zeRC3vZ8IPrH6H0N4VsQCG4ihz9G/YZsRbC76q
         MwNUSxx9MlSDbO1In0RbdSLB+OdG6F3QMedo2R7e9pZTNj63wRZT49eefdczvOB5WvsD
         2fYt/OojjDMJ8iwuqK8l4zFFZkSgUA0WOIwfDnIjqr24kCQQKqLCv5rJI9PNY4znjKIV
         brSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l29si191814edd.330.2019.06.25.04.29.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2019 04:29:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58958 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hfjdH-0006sL-U6
	for alex.bennee@linaro.org; Tue, 25 Jun 2019 07:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53585)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jonathan.cameron@huawei.com>) id 1hfjd6-0006qJ-SM
 for qemu-arm@nongnu.org; Tue, 25 Jun 2019 07:28:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jonathan.cameron@huawei.com>) id 1hfjd5-00042t-QU
 for qemu-arm@nongnu.org; Tue, 25 Jun 2019 07:28:52 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2244 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jonathan.cameron@huawei.com>)
 id 1hfjd5-0003q0-DT; Tue, 25 Jun 2019 07:28:51 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 29B65258D9C69BBF49A5;
 Tue, 25 Jun 2019 19:28:43 +0800 (CST)
Received: from lhrphicprd00229.huawei.com (10.123.41.22) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Tue, 25 Jun 2019 19:28:32 +0800
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Tue, 25 Jun 2019 19:27:46 +0800
Message-ID: <20190625112752.83188-2-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625112752.83188-1-Jonathan.Cameron@huawei.com>
References: <20190625112752.83188-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.123.41.22]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [RFC PATCH 1/7] Temp: Add the PCI_EXT_ID_DVSEC
 definition to the qemu pci_regs.h copy.
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jcm@redhat.com,
 linuxarm@huawei.com, Auger Eric <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PkGgvkn/vFLh

This hasn't yet been added to the linux kernel tree, so for purposes
of this RFC just add it locally.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 include/standard-headers/linux/pci_regs.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/standard-headers/linux/pci_regs.h b/include/standard=
-headers/linux/pci_regs.h
index 27164769d1..224b52e62b 100644
--- a/include/standard-headers/linux/pci_regs.h
+++ b/include/standard-headers/linux/pci_regs.h
@@ -709,7 +709,8 @@
 #define PCI_EXT_CAP_ID_DPC	0x1D	/* Downstream Port Containment */
 #define PCI_EXT_CAP_ID_L1SS	0x1E	/* L1 PM Substates */
 #define PCI_EXT_CAP_ID_PTM	0x1F	/* Precision Time Measurement */
-#define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_PTM
+#define PCI_EXT_CAP_ID_DVSEC	0x23    /* Designated Vendor-Specific */
+#define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_DVSEC
=20
 #define PCI_EXT_CAP_DSN_SIZEOF	12
 #define PCI_EXT_CAP_MCAST_ENDPOINT_SIZEOF 40
--=20
2.20.1

