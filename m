Received: by 10.25.44.15 with SMTP id s15csp192739lfs;
        Tue, 11 Jul 2017 18:49:33 -0700 (PDT)
X-Received: by 10.237.55.129 with SMTP id j1mr3504212qtb.152.1499824173116;
        Tue, 11 Jul 2017 18:49:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499824173; cv=none;
        d=google.com; s=arc-20160816;
        b=ad3NR1x+/P6svDBrtCFzDlXJFd+kPDzF6yQ+p368GCqd8RaO6cGFall6hD84wVPS1n
         KeoCM+iDtwt6sDfATPW7lsoI/hREMwI1shKmuqjb/eF8HswUpP7a0rvmLOQacmxld5h8
         X8m3fpD0NGM7rtxnFr2uFkp2KMrI4lhDrpkh8iV+8PWZXN+RNDq4uxQrcMA9k9vCtq6z
         XI9RMzw3l+7T2rHlUSwWarhe2AsIrnb7J75FfUsdYV7g9D+ycc0makg0pWc6neHHCn7T
         Us90VbTTct2+W9WNmPgJHXtGgTpKXhiBlZqnEt5VwXsrgA4upXrcCJivQk963n9y30KA
         Vr2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=QlygdGhdN8CXL99PVnvUiuEhRdeXFdc4LFK2Oq5YHoY=;
        b=pMmbIn9unmQwqf0lS74o1wU/Coy5SYwS7apmn6cOblH0+o9wLaYcrp3IWzQmcnVVWN
         gQ2H4abY3vrX0L5Q7/H3tUaJbWlT3wxxDCA3O99JbKTEArhm1geM4XldzBR4VxmDFXCN
         D7WxtjOax9hWm57JoJAnkrlAQVUltXa9fp3CedkVwmppplMlL1rvX4X92fAYVXoG/FzN
         9FEcc/udJhmXxgi7LvrAY1G9jwU3QHmzXYL2XhJ4zBv26S36/tpQNROBif8MWpCacUCm
         wWIaEOLbYQYVL/DZaD7t1eUL+7lGfYO7aaC8t14uEUvuTKpROpU0PMWw8nLr2nkxzl+p
         d2kw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id s45si951593qtb.195.2017.07.11.18.49.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 18:49:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49753 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dV6m5-00056L-Eh
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 21:49:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dV6kX-00044n-JO
	for qemu-devel@nongnu.org; Tue, 11 Jul 2017 21:47:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1dV6kU-0000GT-GX
	for qemu-devel@nongnu.org; Tue, 11 Jul 2017 21:47:33 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:4028)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>)
	id 1dV6kT-0000Ev-TE; Tue, 11 Jul 2017 21:47:30 -0400
Received: from 172.30.72.54 (EHLO DGGEML402-HUB.china.huawei.com)
	([172.30.72.54])
	by dggrg01-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id ARX36948; Wed, 12 Jul 2017 09:47:24 +0800 (CST)
Received: from linux.huawei.com (10.67.187.203) by
	DGGEML402-HUB.china.huawei.com (10.3.17.38) with Microsoft SMTP Server
	id 14.3.301.0; Wed, 12 Jul 2017 09:47:15 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <lersek@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
	<famz@redhat.com>, <qemu-devel@nongnu.org>, <zhaoshenglong@huawei.com>, 
	<peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<james.morse@arm.com>, <zhengqiang10@huawei.com>,
	<huangshaoyu@huawei.com>, <wuquanming@huawei.com>
Date: Wed, 12 Jul 2017 10:08:17 +0800
Message-ID: <1499825297-20335-4-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1499825297-20335-1-git-send-email-gengdongjiu@huawei.com>
References: <1499825297-20335-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.187.203]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.59657FAC.0075, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: dfc7e8a83c6eaf4e51d8a11f07565bd3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.187
Subject: [Qemu-devel] [PATCH v5 3/3] ACPI: build and enable APEI GHES in the
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
X-TUID: wJscv1w9doan

Add CONFIG_ACPI_APEI configuration in the Makefile and
enable it in the arm-softmmu.mak

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
thanks a lot Laszlo's review and comments: 

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
2.10.1

