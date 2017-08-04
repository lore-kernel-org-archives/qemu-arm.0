Received: by 10.25.221.202 with SMTP id w71csp1591187lfi;
        Thu, 3 Aug 2017 22:40:07 -0700 (PDT)
X-Received: by 10.55.31.76 with SMTP id f73mr1495150qkf.85.1501825207339;
        Thu, 03 Aug 2017 22:40:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501825207; cv=none;
        d=google.com; s=arc-20160816;
        b=0ZtsIIWLleb3Pniy/hjZJUKVN4OB0weoj9tN6eU+g4OH4Yif/Zz3wt5ulsCKwFbIIm
         Y9K4ihVvJigcYIjdV0H6zz/j/3U8aBnyTgXxljER2cdEpGE3uIUfI6lnLKNB0OhPProo
         PU0jAiAxU8vHgZL5gSgAFwBlHIDjl0iPKiekJPSz5TAO6m7YLCUNhTXaxwioNz1wdHpx
         iXTwUFRJRtaaZ54Zf+peQDiGaej2Y3q0S+XgoqyzwfLwIGNZ9B5ys5DgDX1pZFVnQ9es
         BwWkRD/9AEwsBfqsb6BagTgJ/6ZKCT59SHHb6sx6b/Aa6IQZVWXARwkYDTECHcVs6u9b
         Anyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=HyfIBbs3fVN5KhhuEO9+Ou1ckxs3GZqkgmV8bwv8UCM=;
        b=y2UmNw+QQp4g+IPgnnZ6c7faV/fIJWs5MzSMtXKUN3eYULUkJx+Yjbc2U5RaoU/wKa
         Ns2SyYh/Kxb1DPcLPItx+ENPFEatYUQ34tuY+K5ihYK8zRs0nUr7HFZhWFDrZPpkYO1G
         RORW2xZKCrPVJtYHds2vym5BRtXBmZz+Q1l8FZz922XDenXfUW96DyT3wcGqCQ62mXDi
         U0B5AXbCJE+7NTNLscZEmGgSMyCJoYoGbpefgNi13LJosiHgiTb8vaiC5pYylxRnI/h5
         qWhtRkyKleonRqRTEhPVCTIqUFRUFAs4kDVdZqhNbzris4QOP7KpAzBZpS6H3ZN7QRUM
         tlGA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 15si907477qtn.542.2017.08.03.22.40.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 22:40:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36252 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddVLA-0001j4-M8
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 01:40:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40918)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1ddVD9-0002G5-IV
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 01:31:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1ddVD8-0005gu-MR
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 01:31:47 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:4481)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>)
	id 1ddVD2-0005W8-Ul; Fri, 04 Aug 2017 01:31:41 -0400
Received: from 172.30.72.53 (EHLO DGGEML402-HUB.china.huawei.com)
	([172.30.72.53])
	by dggrg01-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id ATU25596; Fri, 04 Aug 2017 13:31:36 +0800 (CST)
Received: from linux.huawei.com (10.67.187.203) by
	DGGEML402-HUB.china.huawei.com (10.3.17.38) with Microsoft SMTP Server
	id 14.3.301.0; Fri, 4 Aug 2017 13:31:27 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <lersek@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
	<zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
	<qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Fri, 4 Aug 2017 13:51:12 +0800
Message-ID: <1501825872-12555-4-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1501825872-12555-1-git-send-email-gengdongjiu@huawei.com>
References: <1501825872-12555-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.187.203]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090205.598406B9.000C, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 928e1e74f6a7bf9a997219771967300e
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.187
Subject: [Qemu-arm] [PATCH v8 3/3] ACPI: build and enable APEI GHES in the
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
Cc: zhengqiang10@huawei.com, wuquanming@huawei.com, huangshaoyu@huawei.com,
	gengdongjiu@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +Lj+YH57rKBG

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

