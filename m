Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4687334lfp;
        Mon, 3 Feb 2020 17:46:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqyLEN6yzNW/1ECK+7EspUIElc1weQcHDdbWPQxyy1MzzJnJH/R4RGvfBENt75XqlIcsjzk7
X-Received: by 2002:a05:620a:ced:: with SMTP id c13mr13509217qkj.47.1580780812860;
        Mon, 03 Feb 2020 17:46:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580780812; cv=none;
        d=google.com; s=arc-20160816;
        b=Rig2A+lgjUGry1rp1+nGfj7a2dhMbnEcDf6+VxoDZYqICB4Tedzigj6KlP6s59k+u7
         Ab0UEH3QTXsMH/pGWsjUldYnvPlgtdu5HPpkopJafuGd6sA6SvcOYnVWZMhHxwr9wyyQ
         27AXgfMvgaLl228lVCG7r9xAkDLQiIrX6M6ukZDWrxEs0hsFg5xHfnn/AmgY3IVoCX4W
         zZWjyZ7FyNVeNK3qphrPHLtX2tIy3VubvUfQvWaI2JJXFf5/WcRdzvi5VrjAztBS0oEF
         21AN/QxSusxNU+Iw9bjWyILCYY4SwE2vt943ef9pd2/8esCw+ijdk031FRmCe4LtPJge
         OJJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Wk/8hTjHvXFCXZFih27+JvgdN3jdLTmEI60MEY67shs=;
        b=f2LOYrheq1Wa7PZXrD7Uimbvvwb1TSkvDFhn8kcsQT5oHeXAR3FIAJfqAlJ+vpyVSf
         dBdHke5EbIbyr2vjKVr2lWFsV8GjduCXXBJ7xVZ2YFZmZWL1WVVoxTeJ/xUmf8a6cqyc
         /yGPOTrmw597VOt5LgHTTlxZKB62hj5ieG+OEog/kJT/ypHWVCDqBCgm5YRiOLcutJD4
         wrJiMu0Xt81FLcoUmiM6Vy4IEdb3lteO0EUC+TWyoqFQMxrTFNtpyQ84XTGoK0LOD9kQ
         2g7AMBCwmfdmig0xCPRxaN8HbJxDWt82906PqGCcYFzUkJVlStuQzMgDxuX+/FDdVVKE
         t98A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11si13242554qkm.233.2020.02.03.17.46.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 17:46:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iynIi-0007jN-5v
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 20:46:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47864)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iynIK-0007hj-Hp
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 20:46:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iynIJ-0008Dm-FO
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 20:46:28 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2752 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iynIJ-0008Az-4c; Mon, 03 Feb 2020 20:46:27 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 2F88B313F97BAA3A3976;
 Tue,  4 Feb 2020 09:46:25 +0800 (CST)
Received: from linux-TFkxOR.huawei.com (10.175.104.212) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Tue, 4 Feb 2020 09:46:19 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 6/7] arm/acpi: simplify the description of PCI _CRS
Date: Tue, 4 Feb 2020 09:43:24 +0800
Message-ID: <20200204014325.16279-7-guoheyi@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200204014325.16279-1-guoheyi@huawei.com>
References: <20200204014325.16279-1-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
X-TUID: OL9O8Klh3UpF

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
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

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

