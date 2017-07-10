Received: by 10.25.44.15 with SMTP id s15csp3131723lfs;
        Mon, 10 Jul 2017 02:07:48 -0700 (PDT)
X-Received: by 10.200.43.58 with SMTP id 55mr3085803qtu.202.1499677668623;
        Mon, 10 Jul 2017 02:07:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499677668; cv=none;
        d=google.com; s=arc-20160816;
        b=E4KaPd/T62EQKJlMv1bAF7eOEqzHcadcVDvCPdu9v0IZThMLsYo7l/f11REpAWFW3T
         Fq+yUzPVr2McsaFr9eXcg5s3akHMUaaeXte2Iwg1gjT5NuGe+kYpaYnAlYcYz/XgHf7v
         M+0//Jd/Eu9sCT17hc9KmZSkI3kvPqi/SRS9Nkk38+NzLh/kQmJdVjmjyYtgXLfl2hA7
         wTNmOCafbFfp2zIzw6XWmpYtncKDF7tdeGEbCJBTKakYVY9R3RRr9p6DEhyjeqG1RdpR
         z5TMqgoPl7J5kuBCTS4l197m4bHsRaakBdiwxhPQGB84SYHuPmxO/fKcf7Lbz5pltY3C
         nFbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=mXxofg21RBKwpU6dgG8Yq+YFi8bRhYKSjNub5NW+thk=;
        b=X6DpQi7NICrXWiQBGnTaf7Y3AxqBuGtRTu3av+Vm4htdIDttLarSiMRTYKgRocaD/z
         RVlgPbJ7bHFu1lEtCCbveoUOQfbWPvpAEWtHWQYch0Ks7YzIjsfsWcUM6dmZSI5SAndP
         Fkll9vSWgUmEDhkN67Rcve314jiroZHsZF3GzArjSymFFM+eYkT+XX43rXhvJ3DJElH9
         SpBtGx6lhHoY2NPc+tpfjBnZV0DDJmz48fi9C9dbaoY4Yz7pmecrVpAwJZhadmbsbEyF
         rvS65UYMUeUTAk/zUi8I3kRlGWyjwgk3lBHN+woFaJqcHHSKn+BmVXN1DHLS+t3/mxcT
         BJNw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id q7si10495275qtd.274.2017.07.10.02.07.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Jul 2017 02:07:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39363 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUUfR-0006Kd-Rv
	for alex.bennee@linaro.org; Mon, 10 Jul 2017 05:07:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59071)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dUUdN-00051p-Qf
	for qemu-devel@nongnu.org; Mon, 10 Jul 2017 05:05:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dUUdJ-00011x-Mo
	for qemu-devel@nongnu.org; Mon, 10 Jul 2017 05:05:37 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:4024)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>)
	id 1dUUdJ-00010I-2j; Mon, 10 Jul 2017 05:05:33 -0400
Received: from 172.30.72.55 (EHLO DGGEML402-HUB.china.huawei.com)
	([172.30.72.55])
	by dggrg01-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id ARU58044; Mon, 10 Jul 2017 17:05:26 +0800 (CST)
Received: from linux.huawei.com (10.67.187.203) by
	DGGEML402-HUB.china.huawei.com (10.3.17.38) with Microsoft SMTP Server
	id 14.3.301.0; Mon, 10 Jul 2017 17:05:18 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <lersek@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
	<famz@redhat.com>, <qemu-devel@nongnu.org>, <zhaoshenglong@huawei.com>, 
	<peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<zhengqiang10@huawei.com>, <huangshaoyu@huawei.com>,
	<wuquanming@huawei.com>, <zhihui.gao@huawei.com>
Date: Mon, 10 Jul 2017 17:26:25 +0800
Message-ID: <1499678785-6057-1-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.7.7
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.187.203]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.5963435A.0076, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 2d65973ac249e283b8ca08b9d4316214
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.187
Subject: [Qemu-devel] [PATCH v4 3/3] ACPI: build and enable APEI GHES in the
 Makefile and configuration
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
X-TUID: oIbCN6gLL+2a

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

