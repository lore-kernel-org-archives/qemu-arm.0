Received: by 10.25.44.15 with SMTP id s15csp4397549lfs;
        Mon, 10 Jul 2017 23:27:45 -0700 (PDT)
X-Received: by 10.55.183.129 with SMTP id h123mr8756022qkf.75.1499754465552;
        Mon, 10 Jul 2017 23:27:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499754465; cv=none;
        d=google.com; s=arc-20160816;
        b=NUagk4yJMqcLbbfkvKtlGpErkHsQWrMPCsgIUWvN04MwnEEvJhxIuqPLqALxORvU0V
         IxEP5u7/oHDZGDmAx2vTt309nXt+JIEE3a7fWNDUIf5riFE3wkF9nxl2i0y0d6JA5X7u
         NaYXR9z1axEB3irEHEJ3RE2JXp2PgCqXhpjY9cRoca9TQtwjGkXSmwQThcUSgVHIAa7Q
         xqRR78DS2Q/BtS4XHhZhc5lCShhbW35VgIEdCp4Qx2rR4vGG2DGyrv5xF6Tw02sfgT6R
         FLnv0qJZHvCNGP1ZqdzCt+n9nKPkYfvncGYLcGnFxAgEgZpTzK6UJ9ri+Z+a8+zvuwi5
         ypAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=c5VIVgdTRFeCpwOHFDhnW+zAoWoN/kTk0JHfNPkPeec=;
        b=eSL5kXLmGt4J8E5HRhJUWTx4Hg+DQ1+VlqSGHw7w7ka2Jw7ZPUvgk2z6cmZc9ri9ow
         Z+b5y0f5Tnhk3RILotuRGTgqnULWrLItI1A101XUyXoAYGZ7/6APqWxlpRJTVZLTC7To
         dUB6emMFat5pt5orgiAvhqNv6aznFeoyNii2q7oXQIKXBT4aGm1VEOC+FEaEPi4xAihi
         BEMWQnejUVWSPc2QIUbg6+DzFg0CHa61JLocrzm8cRA02cZzoGmF5c8BsL4Hp/6hZfXZ
         Mg5nELxxhNSXSWe4DL3zxCI/hCtIUxVfHWixwnl7uSGrC+1JvZ9rEco+JfWLFsvwAixP
         sJ7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 46si13048258qtb.24.2017.07.10.23.27.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Jul 2017 23:27:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44469 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUoe6-0007AC-Qt
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 02:27:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33864)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dUocc-0006Iz-68
	for qemu-devel@nongnu.org; Tue, 11 Jul 2017 02:26:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dUocY-0001qw-7z
	for qemu-devel@nongnu.org; Tue, 11 Jul 2017 02:26:10 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3963)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>)
	id 1dUocX-0001qR-L5; Tue, 11 Jul 2017 02:26:06 -0400
Received: from 172.30.72.54 (EHLO DGGEML403-HUB.china.huawei.com)
	([172.30.72.54])
	by dggrg02-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id AQV87138; Tue, 11 Jul 2017 14:26:01 +0800 (CST)
Received: from linux.huawei.com (10.67.187.203) by
	DGGEML403-HUB.china.huawei.com (10.3.17.33) with Microsoft SMTP Server
	id 14.3.301.0; Tue, 11 Jul 2017 14:25:54 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <lersek@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
	<famz@redhat.com>, <qemu-devel@nongnu.org>, <zhaoshenglong@huawei.com>, 
	<peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<zhengqiang10@huawei.com>, <huangshaoyu@huawei.com>,
	<wuquanming@huawei.com>, <zhihui.gao@huawei.com>
Date: Tue, 11 Jul 2017 14:47:00 +0800
Message-ID: <1499755620-31804-1-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.7.7
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.187.203]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090206.59646F79.007C, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: bbab0109a8b7691767243970dedaed05
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.188
Subject: [Qemu-devel] [PATCH resend v4 3/3] ACPI: build and enable APEI GHES
 in the Makefile and configuration
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: gengdongjiu@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3j/vzSel5+QN

Add CONFIG_ACPI_APEI configuration in the Makefile and
enable it in the arm-softmmu.mak

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
thanks a lot Laszlo's review and comments: 

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
2.10.1

