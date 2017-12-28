Received: by 10.223.134.117 with SMTP id 50csp5137173wrw;
        Wed, 27 Dec 2017 21:28:09 -0800 (PST)
X-Google-Smtp-Source: ACJfBosMp18EqtUgoU+F5lPZV13NcguOdZCTFdvOHBa0taDFvnnmxKME4YUDdYm+3Co/dYQFsvZw
X-Received: by 10.159.246.7 with SMTP id b7mr29601460pls.81.1514438889225;
        Wed, 27 Dec 2017 21:28:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514438889; cv=none;
        d=google.com; s=arc-20160816;
        b=U4dAj+RzPr3D/hJy2Gqqug2J6htQXAfV5VkXesVI+a5obWjW2u1skpH48gqQwNYzB1
         pdS6jTSrLTqlacktNjYLm1hmqkGOeVaFQmXWUrs+SODHCd2709kTONiqbqPUXDs+aMoX
         8BUOhq5NXZgmUHc7D47GWXELf/ZTyoHKhobg+gdYVLpmS7CwIzqq1MjqMJ3Z/KhvMgvh
         ysVJ16ePi/RJ74FSEfr7y0YP0X/tmU/4Uw7f+pfpfDf9p6d+wBzNwbuNLB8dxIuHP0pq
         45z1t+4mktPlWZmkyI/20/ak/QPwRUYLkhKRRXLLDrT+eG/kNYaKQVQ8UGe23NqZp3q7
         L8uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=K1J1UM4BvBWAKnBTWNPc3Mdn+gwQ6o+rpogBTiKlBXU=;
        b=dO/R0eJUACFwvrRHjzKsFSRVHVilg8WT00j73clb1MSaeWg06cGUqxeYZAQPOqY1Nl
         xFYY56Eao+lsTrbexRRl6S99ZSSkJ85vh5UGT6axB0M4MRa8PxGPUgVU1fpOHmwhD7Qk
         apBQfuZeB10+OCsIzeF0QR2NWJwvE/8W5JknVjmsM47uNg7ejJQPJpvJeGlg/IT4mSI0
         deg4YS0wVwPZt7ch2V63Ttq9BO3saPMIfshj5rqJyHlLVDcSHO9qYjHDmmCo+zuy/6FL
         6MtZvJuxfwMMcqQfbBxC138P5WlIMCYr2OF/+8GO2RlK9QDcfrePPBSpJCn1E5C5e1Rf
         LBZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d17si23639783pge.93.2017.12.27.21.28.09;
        Wed, 27 Dec 2017 21:28:09 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751409AbdL1F15 (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Thu, 28 Dec 2017 00:27:57 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3188 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751372AbdL1F1y (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 28 Dec 2017 00:27:54 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 894317B9421F9;
        Thu, 28 Dec 2017 13:27:38 +0800 (CST)
Received: from linux.huawei.com (10.67.187.203) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.361.1; Thu, 28 Dec 2017 13:27:31 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <james.morse@arm.com>, <christoffer.dall@linaro.org>,
        <marc.zyngier@arm.com>, <kvm@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC:     <gengdongjiu@huawei.com>, <huangshaoyu@huawei.com>,
        <zhengqiang10@huawei.com>, <xuwei5@hisilicon.com>
Subject: [PATCH v14 4/9] ACPI: enable APEI GHES in the configure file
Date:   Thu, 28 Dec 2017 13:54:13 +0800
Message-ID: <1514440458-10515-5-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
References: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.187.203]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: k+2/EgiUOkDG

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
