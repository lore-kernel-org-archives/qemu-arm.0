Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3333962lfp;
        Sun, 2 Feb 2020 16:17:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqxPLwQeqYg9P4kfuO3rEqAlIcVvORuPcVS59kwhFrw6VF2dACv1KcRUJ6uIRjDuNLZr1Zc6
X-Received: by 2002:aed:2be4:: with SMTP id e91mr21832692qtd.148.1580689059096;
        Sun, 02 Feb 2020 16:17:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580689059; cv=none;
        d=google.com; s=arc-20160816;
        b=syNW5XINbLxVnce74YybeA5n+qnXmb40hegIpnGc8lLI5/sSkTpBjNtdfjg6g9bVwf
         Vf1cSP5xyZfcqnD/O34mC0pIApL0YZaUafvv9ZxEgPxoIqjycN6T4jnwOwAASh36Yxh+
         FUbn9NLRGSpZ+USihZdQcI6Taay76eczPhZO++ZDPTHrFornM5yKPR4WNdcMmyYi+FKT
         BnekVruH0sOSQR2M7107jPP7x6DK393kqfU6HaWUZzUesjvbe3XSI7faCrAv/8JyGmi9
         3YpYx75v37Zko5MyluRy8ecv/gWYNamXNYazfferias5dmkY1o6fgig89bx3kTXNyJzw
         ebjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=D4F1yr4YIGOL5F4MoguhvY8ZW0WRQ0kvW3DgAV4DRw4=;
        b=oOhncv0gPBE6tzi6r0D1SlOegKC95YxNFwHbdTQkav8Tx/fOHKztdPOmy1TPz2Ocw4
         mL8gtxHxiGfZ8TzJIFP9hv/u7iAcc9nq/QHjGID3ZSZbd7c0E9xB4r63rH9nw0kq6EK3
         uqCKSMVCj63+HJK5sYp5wCRtV94oa7b3N/ZIxyHhQ7zkNhNFrKBDdC5kHqxEuqvq6oSe
         ZAuKfiO5yB+L1tVhPn/lkwaPHcW8l+tPEP/M0eem4zDAcSLQmgJQ5cR/kZSN5VJ6TquG
         a66e+CjL3C8ovg8IhrZbVT/x005sFC4B7Xa7HUXi6+QvWNVC08aHymEd/9yiwLSqwSi+
         gRdw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 127si11241421qkl.279.2020.02.02.16.17.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Feb 2020 16:17:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyPQo-0007KF-IF
	for alex.bennee@linaro.org; Sun, 02 Feb 2020 19:17:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33091)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iyPQV-0006vB-Mk
 for qemu-arm@nongnu.org; Sun, 02 Feb 2020 19:17:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iyPQU-0004BN-KS
 for qemu-arm@nongnu.org; Sun, 02 Feb 2020 19:17:19 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:38208 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iyPQU-00048G-9a; Sun, 02 Feb 2020 19:17:18 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 67CB4D6B5B1CFFB84D44;
 Mon,  3 Feb 2020 08:17:14 +0800 (CST)
Received: from linux-TFkxOR.huawei.com (10.175.104.212) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Mon, 3 Feb 2020 08:17:04 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 6/7] arm/acpi: simplify the description of PCI _CRS
Date: Mon, 3 Feb 2020 08:15:04 +0800
Message-ID: <20200203001505.52573-7-guoheyi@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200203001505.52573-1-guoheyi@huawei.com>
References: <20200203001505.52573-1-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Igor
 Mammedov <imammedo@redhat.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z6yDEuGyslno

The original code defines a named object for the resource template but
then returns the resource template object itself; the resulted output
is like below:

Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
{
    Name (RBUF, ResourceTemplate ()
    {
        WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
            0x0000,             // Granularity
            0x0000,             // Range Minimum
            0x00FF,             // Range Maximum
            0x0000,             // Translation Offset
            0x0100,             // Length
            ,, )
        ......
    })
    Return (ResourceTemplate ()
    {
        WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
            0x0000,             // Granularity
            0x0000,             // Range Minimum
            0x00FF,             // Range Maximum
            0x0000,             // Translation Offset
            0x0100,             // Length
            ,, )
        ......
    })
}

So the named object "RBUF" is actually useless. The more natural way
is to return RBUF instead, or simply drop RBUF definition.

Choose the latter one to simplify the code.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>

---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 hw/arm/virt-acpi-build.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f3e340b172..fb4b166f82 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -236,7 +236,6 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMa=
pEntry *memmap,
                              size_mmio_high));
     }
=20
-    aml_append(method, aml_name_decl("RBUF", rbuf));
     aml_append(method, aml_return(rbuf));
     aml_append(dev, method);
=20
--=20
2.19.1

