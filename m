Received: by 10.25.221.202 with SMTP id w71csp1577108lfi;
        Thu, 3 Aug 2017 22:24:08 -0700 (PDT)
X-Received: by 10.200.41.247 with SMTP id 52mr1537472qtt.0.1501824248765;
        Thu, 03 Aug 2017 22:24:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501824248; cv=none;
        d=google.com; s=arc-20160816;
        b=cWK4rd0rY+PS+CihQwAvn5SwU8Sro9YzRpePsfqbE/aoS2IxtgXFu94Eou9iW389Yj
         ptyuas5SUefcVrwBIqkPxKvLq8aH2Ynf0Vuz5mRUSXhXJGs2N/EdfD7HoKD8UyY00iQ/
         YJmduFMDBSXk3lpetwoZtyt1OOp7HldmJo6XCJU/Nx2k3P1zNibuleUrdjhiZqUw6W1J
         62fkhe4V6TlKnGbF7JoMcpKM7gApjHRx2s4Htjs6GXg8Ng2ZUbjd+elxCJ9Jz3DzNZYm
         reD8yaZVrM/nuxR6b0Y+iboz+n4TI5QZBbzakZN6EftapPl66ErL+eqUQto+7YKvOJaS
         wgRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=HyfIBbs3fVN5KhhuEO9+Ou1ckxs3GZqkgmV8bwv8UCM=;
        b=whXZ6cxrx7t2Cihb/efxSvhkJD4lUlEyUVSP98oF8T1DStKCP1lWXzeZPUuyNQj/Z7
         EjhKdQkxAxULa3XpqiHFwN8tYHSNPBfS+3FghBDTKWPJRcV0JPDyihxWg8RtZqyK/L9c
         08H54r9n5kpP59a4dAAWCl3/lF5XkJUHFmckWn3KoXQvgE4fOjljbIYkZ+kfh1GhPRC+
         VMFj3UvRYhQcDrCDt06USRJQY/CF9R5agl+59Tg2y6G4jXAU258feY/Fn6UojLAThtk7
         2cfsMxBjlf3jNIERN7c8XLUwNL3Vf37SZQEWyWYo9gMewfACHCY4t9l5vuoq01EnD4En
         SHWg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p35si814871qtf.45.2017.08.03.22.24.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 22:24:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35197 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddV5i-0004Qi-7X
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 01:24:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56283)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1ddV47-0003Pz-4R
	for qemu-devel@nongnu.org; Fri, 04 Aug 2017 01:22:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1ddV44-00072a-FE
	for qemu-devel@nongnu.org; Fri, 04 Aug 2017 01:22:27 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:4478)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>)
	id 1ddV43-0006wY-Ot; Fri, 04 Aug 2017 01:22:24 -0400
Received: from 172.30.72.54 (EHLO dggeml405-hub.china.huawei.com)
	([172.30.72.54])
	by dggrg01-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id ATU24759; Fri, 04 Aug 2017 13:22:17 +0800 (CST)
Received: from linux.huawei.com (10.67.187.203) by
	dggeml405-hub.china.huawei.com (10.3.17.49) with Microsoft SMTP Server
	id 14.3.301.0; Fri, 4 Aug 2017 13:22:05 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <lersek@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
	<zhaoshenglong@huawhuawei.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>
Date: Fri, 4 Aug 2017 13:41:51 +0800
Message-ID: <1501825311-4559-4-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1501825311-4559-1-git-send-email-gengdongjiu@huawei.com>
References: <1501825311-4559-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.187.203]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090202.5984048A.0068, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 819f74fb690641ac697ab5e3113b198f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.187
Subject: [Qemu-devel] [PATCH v7 3/3] ACPI: build and enable APEI GHES in the
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
Cc: wuquanming@huawei.com, zhengqiang10@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r6E/Uar5HpXs

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

