Received: by 10.223.159.82 with SMTP id f18csp507004wrg;
        Tue, 21 Nov 2017 02:31:56 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZEbKf1YtPpey9BHrBCb4kbTepEmDMCLB5GpXI6HlDr9oQbzHn2MSVXyaqTkFTSiIhgfVw/
X-Received: by 10.84.132.46 with SMTP id 43mr17408224ple.126.1511260316056;
        Tue, 21 Nov 2017 02:31:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511260316; cv=none;
        d=google.com; s=arc-20160816;
        b=Ierb9bz/BD1XdmBo3YridQwQotuvrNgrQE5Ck5p6CGP7DPJT2qsIMUon2UTErBJWkR
         UIGW3W2nj7hZoFRioP0VBzgdDBDJtRlZmrec+xBD5sXfOabr8KhFaXGQXdeWWxgxGUgm
         LTJRtJG18ipXFWgLS94xDiupbN3dAYGxb/fUkU0Nqe7aEvkFLhieI0UXxvG60Xtdlrb2
         3rOzUY5yoLF/X2iOni3OlVMV8XSWgD1YFy2vw9QSFxQ85jY4Sfi37v1nSvKXk+FVqqx1
         I4eZv0DUKIE7uzpHAZjdqtE7aUYLAn3GFxp0kNQKpThlLQktRLbxawFYrX9FZDQt4Hmv
         Tepw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=K1J1UM4BvBWAKnBTWNPc3Mdn+gwQ6o+rpogBTiKlBXU=;
        b=UAGk/DFiFvWZTZv5WsVtZBpnyIr056iQHl1Utaw1Q/mXFsa/sfqMiurvUmN11U55EN
         eTOlgdSynhBzO6meti6t2ZG3QjfboeK+rz+ijZU2X5QiGbTf/x6lwzXNjsJvL2hK3zyn
         1KRM5NBVI13OjZeL0KnYT3yPXsT49Ls1o1QIgPEEfOL3iLv17Rw7jpD1xLPm42uwhfcP
         M5eQt/hAw9sao3PIWKPa3hFoPdd/tlfNCa4lVK/+dIZHmIAsHeOwqDxBEQA8EI4nwdyb
         FsXpOwSohYRHpokGMFGJKQW50qZpABW9I6ekMTG9sSZsP7lcolxanapFRQwkU40CNZ3f
         ju9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 1si10611141pla.339.2017.11.21.02.31.55;
        Tue, 21 Nov 2017 02:31:56 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752009AbdKUKbx (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Tue, 21 Nov 2017 05:31:53 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:10962 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751988AbdKUKbv (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 21 Nov 2017 05:31:51 -0500
Received: from 172.30.72.58 (EHLO DGGEMS402-HUB.china.huawei.com) ([172.30.72.58])
        by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DLG39776;
        Tue, 21 Nov 2017 18:31:40 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.361.1; Tue, 21 Nov 2017 18:31:33 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <james.morse@arm.com>, <lersek@redhat.com>,
        <marc.zyngier@arm.com>, <christoffer.dall@linaro.org>,
        <rth@twiddle.net>, <ehabkost@redhat.com>, <kvm@vger.kernel.org>,
        <guohanjun@huawei.com>, <lijinyue@huawei.com>,
        <huangshaoyu@huawei.com>, <wuquanming@huawei.com>,
        <zhengqiang10@huawei.com>, <linuxarm@huawei.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <dingtianhong@huawei.com>, <wangxiongfeng2@huawei.com>
CC:     <gengdongjiu@huawei.com>
Subject: [PATCH RESEND v12 04/12] ACPI: enable APEI GHES in the configure file and build it
Date:   Wed, 22 Nov 2017 02:37:06 +0800
Message-ID: <1511289434-1551-5-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1511289434-1551-1-git-send-email-gengdongjiu@huawei.com>
References: <1511289434-1551-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A020204.5A14008E.00D4,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: ed02a0ea2c6f99c77883c21077c309b9
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 3taVlNPZ0wjY

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
