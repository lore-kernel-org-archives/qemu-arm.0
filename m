Received: by 10.25.221.202 with SMTP id w71csp1811601lfi;
        Fri, 4 Aug 2017 02:51:43 -0700 (PDT)
X-Received: by 10.233.221.131 with SMTP id r125mr2169757qkf.267.1501840303453;
        Fri, 04 Aug 2017 02:51:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501840303; cv=none;
        d=google.com; s=arc-20160816;
        b=PaXEn5rBus9n+17QKs32TIX61uuse+HhHJvbDqVOFETuNl+4C9A4vQHwK1PKVheAvs
         u0N3T7pdcH1jdadPoQEhwT4KICep35M1J43XQYRntS0LVDxXPg6/2hWlQrX98JyEbNLF
         Aqlggfn5jxrFXHc9iev41yd2pYK+YE0oD6XG09+yFIOM3cJJOnm1ASAtqFSmpFKn0mQ2
         GPqvNo1I8oNMIYbxAmXzh1EsMBq1xUO0r25sIfRnUSdfquBnt9i8vMI0RnrdfUVZePuH
         f2BM1cYD7UJkiw+3yaTsEimlEC2R0azJi7xhyEUZZV1X04LAihEJ3ZlqtTtL44moRqiY
         Wlrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=HyfIBbs3fVN5KhhuEO9+Ou1ckxs3GZqkgmV8bwv8UCM=;
        b=om0JsObMEBZWjq+HpcQqmBZUPIq3OCDXFfqk0GbwqRk/02/nLFZhvme54R++YFRfqs
         5Yfy8U6aGILbPpcStlH3yF4ZkY5J5RJ27SQf4Q2W/Z1a2b8PZ51/T9FteQP1Mb0DIXCF
         pMkRLk5c5SiF+IK0J0nrDHnIXg0vwbpHHdqv8xEeAlEjHD5X1nwh6dTToBE7yR3sKRwc
         QrYTkzkejas9GHMb9QNHWqX9LHSHlaM6ZpqR3BvZIm1RiokcdUsnJVfsFTiugMxbyxwG
         LiN8yw0MCpEe/KbJ2xfTuXgH5Pu+8w+RIRivf7484M8m/gC+Vfz6DNtyUjevwVB1eica
         6qFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u13si1214764qki.491.2017.08.04.02.51.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Aug 2017 02:51:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52165 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddZGe-0007bu-N5
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 05:51:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38568)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1ddZEq-0006PH-Ta
	for qemu-devel@nongnu.org; Fri, 04 Aug 2017 05:49:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1ddZEn-000479-Rr
	for qemu-devel@nongnu.org; Fri, 04 Aug 2017 05:49:48 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:4414)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>)
	id 1ddZEn-00045j-8b; Fri, 04 Aug 2017 05:49:45 -0400
Received: from 172.30.72.54 (EHLO DGGEML402-HUB.china.huawei.com)
	([172.30.72.54])
	by dggrg02-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id ASW04676; Fri, 04 Aug 2017 17:49:39 +0800 (CST)
Received: from linux.huawei.com (10.67.187.203) by
	DGGEML402-HUB.china.huawei.com (10.3.17.38) with Microsoft SMTP Server
	id 14.3.301.0; Fri, 4 Aug 2017 17:49:31 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <lersek@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
	<zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
	<qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Fri, 4 Aug 2017 18:09:16 +0800
Message-ID: <1501841356-6486-4-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1501841356-6486-1-git-send-email-gengdongjiu@huawei.com>
References: <1501841356-6486-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.187.203]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.59844335.0059, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: fef60eaecf1c28c15ff459b02be33903
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.188
Subject: [Qemu-devel] [PATCH v9 3/3] ACPI: build and enable APEI GHES in the
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
Cc: zhengqiang10@huawei.com, wuquanming@huawei.com, huangshaoyu@huawei.com,
	gengdongjiu@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yY+EhZok5VZD

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

