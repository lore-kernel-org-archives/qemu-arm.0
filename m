Received: by 10.223.188.70 with SMTP id a6csp408763wrh;
        Fri, 18 Aug 2017 07:01:10 -0700 (PDT)
X-Received: by 10.99.95.200 with SMTP id t191mr2716877pgb.366.1503064870092;
        Fri, 18 Aug 2017 07:01:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503064870; cv=none;
        d=google.com; s=arc-20160816;
        b=QDndap6qFNmc8Gd5slEs8EZwWiySIveQxiULwNYYT0IGHHyn7s8k2LkbF9SEzJOU66
         gcbTrF1OxURXYZ+GUBw7AJtB6fjdOe/CTZ3JmyUkQjd2TC1hNzqBuiBhjl74el6+8Rx6
         kENjFzBt72ws+tCSY3Z52KAydwpH3ZA0/Lx340xTMtMU6v2fsEzuASXsiRtMkFYuGmbw
         cDnw8nwSWOyFyzX7K3X1H9ufMY0gA0QMDRfH12kwYzZ4p8Y6NLQN5fr7T0Il/GwobpI1
         /RvZYarVNiUzrgiZqvVZNKiHgVXt7f8IOopOjsfuTv8U8iMtvJ5n1whwr7bYvyuprPVG
         KqMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=iO7AGXP+gMgNfvzVPlJGjJHT8R8LTg1Rz6/6bHrsjW4=;
        b=X1k0pc5OGYUohf1MXBB48cZNVa90HGqYubdPx8QBWQ2SbsDpn9opxD8cLC1j7aJkwm
         eAuvK7xxQpsTXaD2Z2cgT67W6g5zqJAf+PjrGgJi/gE3KrjElhWpBcNxiQkXJI2yP8E4
         WeIZ6r1ziGCzHmUGxhnu1n7HsHDZHPxlLBBzoaJHHgLd9QQ0w0D3OTyKKyNZoFcB9QlU
         z3lz8DbaY9sTQ6Xxx15Mb0a+axsm1CwuiHS7i2UbxLMRrcmojrTqRcnZ04nMMjeCD64U
         dR2PzF8LHGkkVIbToscwQcdsYj6AbOKm0FR8EKAlSH6H03jQ6V3vkLbbxZGDdzom8sRf
         qidA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Return-Path: <linux-kernel-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d37si3984390plb.195.2017.08.18.07.01.09;
        Fri, 18 Aug 2017 07:01:10 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753554AbdHROBG (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 26 others); Fri, 18 Aug 2017 10:01:06 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4074 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752202AbdHROBD (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Fri, 18 Aug 2017 10:01:03 -0400
Received: from 172.30.72.58 (EHLO DGGEMS411-HUB.china.huawei.com) ([172.30.72.58])
        by dggrg05-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DFM74401;
        Fri, 18 Aug 2017 22:00:47 +0800 (CST)
Received: from linux.huawei.com (10.67.187.203) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.301.0; Fri, 18 Aug 2017 22:00:13 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <mst@redhat.com>, <imammedo@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <pbonzini@redhat.com>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>, <kvm@vger.kernel.org>,
        <edk2-devel@lists.01.org>, <christoffer.dall@linaro.org>,
        <marc.zyngier@arm.com>, <will.deacon@arm.com>,
        <james.morse@arm.com>, <tbaicar@codeaurora.org>,
        <ard.biesheuvel@linaro.org>, <mingo@kernel.org>, <bp@suse.de>,
        <shiju.jose@huawei.com>, <zjzhang@codeaurora.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <kvmarm@lists.cs.columbia.edu>, <linux-kernel@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>, <devel@acpica.org>,
        <john.garry@huawei.com>, <jonathan.cameron@huawei.com>,
        <shameerali.kolothum.thodi@huawei.com>, <huangdaode@hisilicon.com>,
        <wangzhou1@hisilicon.com>
CC:     <huangshaoyu@huawei.com>, <wuquanming@huawei.com>,
        <linuxarm@huawei.com>, <gengdongjiu@huawei.com>,
        <zhengqiang10@huawei.com>
Subject: [PATCH v11 3/6] ACPI: build and enable APEI GHES in the Makefile and configuration
Date:   Fri, 18 Aug 2017 22:23:44 +0800
Message-ID: <1503066227-18251-4-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1503066227-18251-1-git-send-email-gengdongjiu@huawei.com>
References: <1503066227-18251-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.187.203]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A020201.5996F30F.0212,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 42727865dfb62d32f4afad31125f8e15
Sender: linux-kernel-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
X-TUID: VETpfrEzCR80

Add CONFIG_ACPI_APEI configuration in the Makefile and
enable it in the arm-softmmu.mak

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
