Received: by 10.223.159.82 with SMTP id f18csp1393593wrg;
        Mon, 27 Nov 2017 02:45:07 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbjrW+3udMf5Fxvn4mT/wGgVcgIjaEa/14FrPpbRDpxQw0CUxgBs6XRM9VpFZm0kdPMvhTI
X-Received: by 10.129.57.133 with SMTP id g127mr10914473ywa.426.1511779507210;
        Mon, 27 Nov 2017 02:45:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511779507; cv=none;
        d=google.com; s=arc-20160816;
        b=PqgI1lTvDk/ku20vgptfIsUHhFDUzt8DJfI/95wP143ZV6YnSMEhscdYUeR1EtdYRe
         +2xc4/qABGq5wjq1UV5MqU5UMCE2Z86VqI3ZiYRC4+z/rd0LQmcz2CKmUGJaR6oZO3QJ
         bV0ugLytZPd/zzjKVB/MQUAMf+2OcnfFaObMAJAy5tytHD4plSQqQAlhtWO+gGOxMP8K
         DLZ+9paB+f7fbp30kVhJpqgZ2itJ9a4WQ+1NQ88xVbyoriZtP7pWoX9qhMkz1ckin6e8
         jajSPbkZmpHEfbwFY5Nu/cis631DwLE2Jy6u4VMvfFKaL30sGmyqRnqxRo3nVVT3zgQv
         DaEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=K1J1UM4BvBWAKnBTWNPc3Mdn+gwQ6o+rpogBTiKlBXU=;
        b=e1YYZAIC/c4DcPS4nLjHOSwQpHzpUB3fwC9oQEkvPI0KX0D3wOr/wYkgRMEl8hOj7P
         BjvNO7N2azhZLpUAqzsudt1iHOLv4MAVXURUAx4XGTS23Ns/fq4pXmIjOgm3jE8yfDij
         59SxruxEfH395kNlnsVQVYwmiFLvg4ilTDsmMRG268vK1xQI8JSrQHplPAscxMI+UVVD
         mM7+il0FHcZqqc7feQP0zjvQqgw9v0tOZhnzuv6QOUrORdBvc5Aa9FsOL/69BIdSNj9l
         bhreKIonycDh1cEgtC/50RWym6HEX3WTNxLwV5fuj+wlWizTnhR0ueuxsvoXqvj2o6/s
         PpEA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y77si5964101ybe.590.2017.11.27.02.45.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Nov 2017 02:45:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60083 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eJGuQ-0002JO-Kr
	for alex.bennee@linaro.org; Mon, 27 Nov 2017 05:45:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58541)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1eJGty-00025s-Ix
	for qemu-arm@nongnu.org; Mon, 27 Nov 2017 05:44:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1eJGtt-0007eL-TX
	for qemu-arm@nongnu.org; Mon, 27 Nov 2017 05:44:38 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2114 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1eJGtt-0007ct-GQ; Mon, 27 Nov 2017 05:44:33 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 794EB810DE318;
	Mon, 27 Nov 2017 18:44:25 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server
	id 14.3.361.1; Mon, 27 Nov 2017 18:44:18 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
	<zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
	<mtosatti@redhat.com>, <james.morse@arm.com>, <lersek@redhat.com>,
	<marc.zyngier@arm.com>, <christoffer.dall@linaro.org>, <rth@twiddle.net>,
	<ehabkost@redhat.com>, <kvm@vger.kernel.org>, <guohanjun@huawei.com>,
	<lijinyue@huawei.com>, <huangshaoyu@huawei.com>, <wuquanming@huawei.com>,
	<zhengqiang10@huawei.com>, <linuxarm@huawei.com>, <qemu-devel@nongnu.org>, 
	<qemu-arm@nongnu.org>
Date: Tue, 28 Nov 2017 02:49:47 +0800
Message-ID: <1511808595-24158-5-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1511808595-24158-1-git-send-email-gengdongjiu@huawei.com>
References: <1511808595-24158-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH v13 04/12] ACPI: enable APEI GHES in the
 configure file and build it
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HQB1gkZheGU/

Add CONFIG_ACPI_APEI configuration in the arm-softmmu.mak
and add build choice in the Makefile.objs.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 default-configs/arm-softmmu.mak | 1 +
 hw/acpi/Makefile.objs           | 1 +
 2 files changed, 2 insertions(+)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index bbdd3c1..c362113 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -129,3 +129,4 @@ CONFIG_ACPI=y
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

