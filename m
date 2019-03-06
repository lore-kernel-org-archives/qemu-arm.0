Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5902660wrx;
        Wed, 6 Mar 2019 05:38:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqye/VJImzPxb6yBJmiv3lPNA+S3mXJPl43R/JVz2Q7Fq7z6orbdbC5zN2gIkpVryXe5aRrl
X-Received: by 2002:a25:c06:: with SMTP id 6mr6491540ybm.280.1551879506332;
        Wed, 06 Mar 2019 05:38:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551879506; cv=none;
        d=google.com; s=arc-20160816;
        b=Ta4i+WA5i2M+ZXzt/kKeaQ1T2ulzJkPNl9k8vWMTBzXobJeva/o8HN+s37X97gx7td
         AOdtklKnrVqR3s3ZkaJ/7vIywVZSJH7/R2ZKug8eKwFT5MrcpBvLL3H4LJdcxI4lKGgK
         kOf6h+VuvIu5+a97L3AXbcPUjE25dKnf0iZeadJMFiZ1LKbUCVWKO5/0gqdAse5X0x2x
         PKrHB2g44QKPJv2/zRlntwB1UawRPe2jef4+UYhLf7XJwXg0HMK0VAUXkeDZpr+77FJX
         yZ7qnS59D+aG/rInE7ttsVbWtQQPYtT/+Re1ClTTxNJPAQ1HNYPIvGdWE0JvlezcPVPo
         20OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from;
        bh=iUcn9TLxwUHJOSww43QrtcYOg14hn1W71vhoPEAqDqU=;
        b=Kqwtnszon4M36vvj4mBRcWLhRlMqmUAk8HZC9usCT6P5k+1CKq0RsmfR99gWcgnlxJ
         2zQuucV8P6rnKghHS57TGTuypoW5PGj1aowZDlV/NVqAkrORBe/RAsvquZCz/ADGabwL
         yo0eZktIh0wewT2oj5mUgJmAvZupcCTZGj09kW5uqdFWWda72tGr3+edE4kvVZA76Lp4
         /Ah0fTEcV8fKMLn6YbGTH7HagdsgCAnCRFp9/eoBXV8BuEMrNq+aGHtCl6d5icBfUDvT
         Qjfi7hNQLdM5u19NX2tP89pERlY1tpT9np5MNP/JJV6wFBifiJonjO+v2TY/MSO/ZqTa
         sFLw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v68si974390ybi.163.2019.03.06.05.38.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Mar 2019 05:38:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:33490 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1Wkb-0008SZ-PO
	for alex.bennee@linaro.org; Wed, 06 Mar 2019 08:38:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37009)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h1WkR-0008SK-Tv
	for qemu-arm@nongnu.org; Wed, 06 Mar 2019 08:38:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <guoheyi@huawei.com>) id 1h1WkR-00025J-5d
	for qemu-arm@nongnu.org; Wed, 06 Mar 2019 08:38:15 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:39278 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <guoheyi@huawei.com>)
	id 1h1WkQ-00024R-Qa; Wed, 06 Mar 2019 08:38:15 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 78558897A066077E54EA;
	Wed,  6 Mar 2019 21:38:10 +0800 (CST)
Received: from localhost.localdomain (10.175.104.222) by
	DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server
	id 14.3.408.0; Wed, 6 Mar 2019 21:38:04 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Wed, 6 Mar 2019 21:36:55 +0800
Message-ID: <1551879417-21031-1-git-send-email-guoheyi@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.222]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH v4 0/2] arm/acpi: simplify aml code and enable
 SHPC
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Heyi Guo <guoheyi@huawei.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PCHivXieVkcx

After the introduction of generic PCIe root port and PCIe-PCI bridge, we will
also have SHPC controller on ARM, and we don't support ACPI hot plug, so just
enable SHPC native hot plug.

Igor also spotted the store operation outside of bit and/or is not necessary, so
simply the code at first.

v4:
- Improve the code indention.

Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>

Heyi Guo (2):
  hw/arm/acpi: simplify AML bit and/or statement
  hw/arm/acpi: enable SHPC native hot plug

 hw/arm/virt-acpi-build.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

-- 
1.8.3.1

