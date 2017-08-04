Received: by 10.25.221.202 with SMTP id w71csp1524256lfi;
        Thu, 3 Aug 2017 21:18:47 -0700 (PDT)
X-Received: by 10.237.35.81 with SMTP id i17mr1307213qtc.19.1501820327062;
        Thu, 03 Aug 2017 21:18:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501820327; cv=none;
        d=google.com; s=arc-20160816;
        b=tjI2I2A3fc+cG7p7DNsLFpVwB5JhRRxlCHqYlXUNB0GpWTAXDfAxiGqu0ZfURGCyc8
         +WHuVrz+Tr5cBgGd4AzZ1Znlf8v6GAqQvuDyw00GiXW4011dXu+OiFxwLjD2AVKpwnmq
         /fpUOAUDZrceYl0IzilzQGNIZiMzh/X52rnuhd1tkHMy9F1rZg48qyMgGuRQ9EfgTMPR
         iA+3x8IizD19HtJJuGhrx+jXfYzT6aXVT6XPRlMa0+mGQj8fnbV13IdhuO0Tv7NJuHbM
         G+zFDQjUyAGGnb66W+uuG8PuKV2SWXmYuYpKkkrSR2ceNTPiZc12/VeTXFNRmjswT6Di
         JorQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=HyfIBbs3fVN5KhhuEO9+Ou1ckxs3GZqkgmV8bwv8UCM=;
        b=q+nnSMDltC0k7mO1z0I9Io9wvq7ADVvm5GZkHOXz43xsG2fUn1xbfKuYzpl64elwrf
         J5tqP+N1BAvudAnstd6V3Kfsj6g5Q5UYz53dncD5HnnrOCxhPDcnE8UjoqOYKDhjayNH
         Oj/j6kSaxrNUWZlf7iCeEq2LvGjQkYI66YP0jYcbVf/lWCQorDKBmB5XEixQEDt4pe7m
         F3MiZ/XmSccy+QQO2UApzGAyg5OGIz/XOU43J5iQ0UgiHD6liQ3qfIRJz8U+3NdbdMLt
         GZg8FjSJOeQXLWCw+fg75CbkNIYUB3G87KZLUdgqJ/t2D6bCVKk6erRcIf9ug3dQ6pqe
         N1iw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u17si731947qtf.79.2017.08.03.21.18.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 21:18:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57926 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddU4S-0006qH-97
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 00:18:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1ddU4G-0006ob-D4
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 00:18:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1ddU4F-0006JF-Hk
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 00:18:32 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:4409)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>)
	id 1ddU4A-0006BQ-Mf; Fri, 04 Aug 2017 00:18:27 -0400
Received: from 172.30.72.56 (EHLO DGGEML403-HUB.china.huawei.com)
	([172.30.72.56])
	by dggrg02-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id ASU19231; Fri, 04 Aug 2017 12:18:19 +0800 (CST)
Received: from linux.huawei.com (10.67.187.203) by
	DGGEML403-HUB.china.huawei.com (10.3.17.33) with Microsoft SMTP Server
	id 14.3.301.0; Fri, 4 Aug 2017 12:18:10 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <lersek@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
	<zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
	<qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Fri, 4 Aug 2017 12:37:55 +0800
Message-ID: <1501821475-14647-4-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1501821475-14647-1-git-send-email-gengdongjiu@huawei.com>
References: <1501821475-14647-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.187.203]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.5983F58C.00DD, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: ee31a131f885d8f484333c02c95efcd0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.188
Subject: [Qemu-arm] [PATCH v6 3/3] ACPI: build and enable APEI GHES in the
 Makefile and configuration
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
Cc: wuquanming@huawei.com, huangshaoyu@huawei.com, gengdongjiu@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4SnWjkAaw0c0

Add CONFIG_ACPI_APEI configuration in the Makefile and
enable it in the arm-softmmu.mak

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
thanks a lot Michael and Laszlo's review and comments: 

change since v5:
(1) no change

change since v4:
(1) fix email threading in this series is incorrect issue

change since v3:
(1) change name to "CONFIG_ACPI_APEI" from CONFIG_ACPI_APEI_GENERATION
---
 default-configs/arm-softmmu.mak | 1 +
 hw/acpi/Makefile.objs           | 1 +
 2 files changed, 2 insertions(+)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 1e3bd2b..ee6f5fc 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -121,3 +121,4 @@ CONFIG_ACPI=y
 CONFIG_SMBIOS=y
 CONFIG_ASPEED_SOC=y
 CONFIG_GPIO_KEY=y
+CONFIG_ACPI_APEI=y
diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs
index 11c35bc..bafb148 100644
--- a/hw/acpi/Makefile.objs
+++ b/hw/acpi/Makefile.objs
@@ -6,6 +6,7 @@ common-obj-$(CONFIG_ACPI_MEMORY_HOTPLUG) += memory_hotplug.o
 common-obj-$(CONFIG_ACPI_CPU_HOTPLUG) += cpu.o
 common-obj-$(CONFIG_ACPI_NVDIMM) += nvdimm.o
 common-obj-$(CONFIG_ACPI_VMGENID) += vmgenid.o
+common-obj-$(CONFIG_ACPI_APEI) += hest_ghes.o
 common-obj-$(call lnot,$(CONFIG_ACPI_X86)) += acpi-stub.o
 
 common-obj-y += acpi_interface.o
-- 
1.8.3.1

