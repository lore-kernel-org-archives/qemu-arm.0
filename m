Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4844851wrg;
        Tue, 25 Jun 2019 04:29:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxDtUfHP21PltjT4ltz2b7sQWXSGEyfZ24cYUWu3pEgzwZqdLP/yHVSvFPkosDwBAu+B31o
X-Received: by 2002:a17:906:1c94:: with SMTP id g20mr50383890ejh.179.1561462142495;
        Tue, 25 Jun 2019 04:29:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561462142; cv=none;
        d=google.com; s=arc-20160816;
        b=Cw8yHrq2leZkeRNdHPU56zXeRPPdokszq0fgWVF5JejLxOjrgqw8NAvY/hCScY1TO+
         TRUJhbiX8IcjiBaC4HQPcr2oCeBA8WN8+WOC5EFyLNndIddr5glLkaFGCwFSSwMxKQ3K
         EkLlcdmHrpteNNj+x1SDZD6UYr7Bh1RQJoKxitErWVolXLzrNvQ8CFJQQaLZIw7t0z4K
         VKR6xNRenwowe0/PXuOb95ly3MQ8HbE9i+//a0Q7QDYd2Rb4mFxOZLa+VpYhZR3/eIPJ
         pskeLc41u0MO56DgE+/xcG8MrXi6heTQukCumvUDA7VjbtGKz/5nHXPG/vLuaKB3bRhA
         W2lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=qMcxO4raslvVJG6txQX0mMT0wpxkNdyDdLmdGkGclPM=;
        b=lYUkOcrh7m/Cj5I8WuyZxciwcrfHvPgNhAaDPXhwCeLVjdlC/mOv9JznfjG9wq47xq
         StfGaccee2K7uHA7UY0LPn2jrcoNDiF4NWcVzFNJ8wYiB9eWkfqXKK6isBH9mZ7dCufB
         PwXdt9O24HcynCJ3+m6x9C8chIrgGNnP7lsuSXLiUN1XtkpbebIoWIyq0LO8zGqflPA/
         MGmJEMQrWw/zFeWUR4Cqcd8xexiM1/IXIRjh1L5cYRjbu4i1y9wCV1IJQYo311iq8oij
         XQxQ0NJ9mMA0gBqSj/54TV5JpKxmN2UnqhkHKSFcJ3KcGQKzoPfSUmwTFDBfVcv74b1q
         f+PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r5si157859edm.368.2019.06.25.04.29.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2019 04:29:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58956 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hfjdF-0006ql-K8
	for alex.bennee@linaro.org; Tue, 25 Jun 2019 07:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53584)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jonathan.cameron@huawei.com>) id 1hfjd6-0006qI-Rm
 for qemu-arm@nongnu.org; Tue, 25 Jun 2019 07:28:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jonathan.cameron@huawei.com>) id 1hfjd5-00042n-Pr
 for qemu-arm@nongnu.org; Tue, 25 Jun 2019 07:28:52 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2245 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jonathan.cameron@huawei.com>)
 id 1hfjd5-0003pz-DL; Tue, 25 Jun 2019 07:28:51 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 24C6874FDD6BAC980AD9;
 Tue, 25 Jun 2019 19:28:43 +0800 (CST)
Received: from lhrphicprd00229.huawei.com (10.123.41.22) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Tue, 25 Jun 2019 19:28:34 +0800
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Tue, 25 Jun 2019 19:27:47 +0800
Message-ID: <20190625112752.83188-3-Jonathan.Cameron@huawei.com>
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
Subject: [Qemu-arm] [RFC PATCH 2/7] pci: Add Huawei vendor ID and Huawei
 Emulated CCIX Device IDs.
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
X-TUID: V0IYOf6HHfP4

These device IDs have been allocated for emulated only devices,
giving us more flexibility than would be possible by emulating
real devices.

They will be used for the CCIX PCIe configuration space emulation
modules that follow.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 include/hw/pci/pci_ids.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
index 0abe27a53a..f49be07328 100644
--- a/include/hw/pci/pci_ids.h
+++ b/include/hw/pci/pci_ids.h
@@ -220,6 +220,11 @@
 #define PCI_VENDOR_ID_FREESCALE          0x1957
 #define PCI_DEVICE_ID_MPC8533E           0x0030
=20
+#define PCI_VENDOR_ID_HUAWEI             0x19E5
+#define PCI_DEVICE_ID_HUAWEI_CCIX_UP     0xA260
+#define PCI_DEVICE_ID_HUAWEI_CCIX_DOWN   0xA261
+#define PCI_DEVICE_ID_HUAWEI_CCIX_EP     0xA262
+
 #define PCI_VENDOR_ID_INTEL              0x8086
 #define PCI_DEVICE_ID_INTEL_82378        0x0484
 #define PCI_DEVICE_ID_INTEL_82441        0x1237
--=20
2.20.1

