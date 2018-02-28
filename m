Received: by 10.28.91.67 with SMTP id p64csp669300wmb;
        Wed, 28 Feb 2018 06:25:39 -0800 (PST)
X-Google-Smtp-Source: AG47ELtWfgM/f93Gb3GMR264/79gMjGpgdmsCfKzipZQ/DmYUSPQEFmT9pbyB5k7Drk4DBnQq9S4
X-Received: by 2002:a25:ad04:: with SMTP id y4-v6mr12028530ybi.168.1519827939642;
        Wed, 28 Feb 2018 06:25:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519827939; cv=none;
        d=google.com; s=arc-20160816;
        b=Ga7iyu+KB8VMJliDT5HdeimflkGFzrf06fAjnifO5zWpDT7LYbwP2e9ZlO5bjWAiwv
         ZhCgoj4efI20E7/5LlaxnQc4l0wJvQ/DyCtIhekMNNt+CSxChOjQI95tp4kjq7RfyDNd
         MxSDt7SI0XoBoU2QA9Qn8Yisuja0qy/BxmsV8KDKcNjEDSvrpQXnVE3P5j7selarutHp
         dzkkX8fpoh6X3eExfnkRG4EThfuYwLfKIUGt2XofsxaI7AjfspxkiUUmcU5tTc2hU0Dl
         iSzEU7oJl94+z12cnG2dOgN0VjkkYwcYBZuaEJDoNePsBWbD12diO3JRc999Ik0AwuWm
         vQxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=kGuKZ09Sa2SbFQ6EwnYY59aNooOIwFQyH7tHcUEd6Qs=;
        b=sAJ4xSoSQ533UayRnCubht1oTc/MpS+97h/zXZHBA4HfABdqtLKfdbG4h+vRlTUfg0
         mSXDnY6K4dnCi2VIJCIhAAWBaPR7gk3woWp0RxOmCJ/64M4EQQ/td0y7gy+ROUF3sU+V
         JuRUSWRS2xRO/zzoRpq/uHcDViYjBK0/DElBSx7gYWU9qXKHZ8fp+TYWxEaWrZT0CWGw
         ajFWHt5PEMub6yII/SwCFaGgqmhaUTYx2t85qD/KT661dniga3EZYED31AzH1mpnNMV1
         LqHZtaGMrU3hBLDLiU8fySQ6jvL5Mok4WKUXU6EPT8+2M2FD3qM8LksGHjeWUlCCQt9e
         X4Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p197-v6si280862yba.630.2018.02.28.06.25.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 06:25:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44598 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1er2fq-0004gQ-TA
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 09:25:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33425)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1er2fd-0004eL-JF
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 09:25:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1er2fb-0001sj-6T
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 09:25:25 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37534 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1er2fa-0001sR-Td; Wed, 28 Feb 2018 09:25:23 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7EF8840FB647;
	Wed, 28 Feb 2018 14:25:22 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A20C2946B7;
	Wed, 28 Feb 2018 14:25:21 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 28 Feb 2018 15:23:46 +0100
Message-Id: <1519827835-239519-2-git-send-email-imammedo@redhat.com>
In-Reply-To: <1519827835-239519-1-git-send-email-imammedo@redhat.com>
References: <1519827835-239519-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 28 Feb 2018 14:25:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 28 Feb 2018 14:25:22 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 01/10] acpi: remove unused acpi-dsdt.aml
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
Cc: Auger Eric <eric.auger@redhat.com>, Shannon Zhao <zhaoshenglong@huawei.com>,
	qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tmOdU9Eq3XLc

SeaBIOS blob which is currently shipped with QEMU
doesn't need acpi-dsdt.aml nor is able to use it
and code that loaded it in QEMU was removed by
(commit 9fb7aaaf4c "pc: drop external DSDT loading")
in 2013.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 Makefile              |   1 -
 pc-bios/acpi-dsdt.aml | Bin 4405 -> 0 bytes
 2 files changed, 1 deletion(-)
 delete mode 100644 pc-bios/acpi-dsdt.aml

diff --git a/Makefile b/Makefile
index 90e05ac..f3a4cf9 100644
--- a/Makefile
+++ b/Makefile
@@ -648,7 +648,6 @@ bepo    cz
 ifdef INSTALL_BLOBS
 BLOBS=bios.bin bios-256k.bin sgabios.bin vgabios.bin vgabios-cirrus.bin \
 vgabios-stdvga.bin vgabios-vmware.bin vgabios-qxl.bin vgabios-virtio.bin \
-acpi-dsdt.aml \
 ppc_rom.bin openbios-sparc32 openbios-sparc64 openbios-ppc QEMU,tcx.bin QEMU,cgthree.bin \
 pxe-e1000.rom pxe-eepro100.rom pxe-ne2k_pci.rom \
 pxe-pcnet.rom pxe-rtl8139.rom pxe-virtio.rom \
diff --git a/pc-bios/acpi-dsdt.aml b/pc-bios/acpi-dsdt.aml
deleted file mode 100644
index 558c10f51ccbbf9ec2f47a4a998a7055059a8963..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 4405
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
U_=PAMqG*c36NN8|mMC`Mf01wzJpcdz

-- 
2.7.4

