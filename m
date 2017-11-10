Received: by 10.223.150.237 with SMTP id u100csp3629171wrb;
        Fri, 10 Nov 2017 03:14:43 -0800 (PST)
X-Google-Smtp-Source: ABhQp+RDCk439i8xZdlJxaUBv51EO1nQMd2ztE9AU5alzG2CwpHqs3jZEaGWe9KKUsRwiJ9Q71ff
X-Received: by 10.99.124.75 with SMTP id l11mr3875170pgn.453.1510312482884;
        Fri, 10 Nov 2017 03:14:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510312482; cv=none;
        d=google.com; s=arc-20160816;
        b=SLa/vYWnbF9LVqBfKlwpF7feVSyFwLWJPwgXaOuk5E5wZOtJqrJAadsI1X2lgQOzwX
         MFJ8omIuu6gHp1RKvmDyiKF+9R+BUR8IR3LwbCPBhBwWnT+RPGWD61zm/fDu6PGOby4h
         4UmE5wSG5PIkwTW3WWFJhw7rKZVBIFItsqwG6YQoVsY+R23HQ0tXgRtGfHzZwvGzTC6R
         VifdtoU2XlXbzPZpae+g542O/ENJmGpzMPEU0qGzVEOu2yfFLcidEU8wiEC7uuk4Tbuc
         r7u33XOwd52y59i8umfglzJ/9Ux9d8vGFjc5tpgCHKm/ZZlBOY1WSJmhiT6sVK5B5GHD
         lRFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:arc-authentication-results;
        bh=K1J1UM4BvBWAKnBTWNPc3Mdn+gwQ6o+rpogBTiKlBXU=;
        b=TEFVdxNfLCUTHHV8Qq4SV8KadL0wW2aM3GqwjGHQQbQvIQ6UBO0tL0c6VYNn0FB+kf
         m0nEeTOk69I4twlGJcxS0qMrhzed5X+ywWH4WefK6WJ9G/Vk8bxgT4pwOS+XyxZrIx0d
         OEcselFgpZdfiMn8QqUvyJcLjxF8luGeMwJ1ce9P80F7YZxBJn4lnEimAgQPPWShCogQ
         WLTjcl+APnwETBDKf/JyNDwc0SQO9YyQWHllOCoWSZq4ATrcuPcri3Jv08GOiN+zvg6O
         5zt4hQiIwG0B/T22Jw6x05Op4gsVXTYcfZGi5n0vagaP5TE6P0kgLAifGqNhQF39uCea
         ifyw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s15si8697707plp.268.2017.11.10.03.14.42;
        Fri, 10 Nov 2017 03:14:42 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753051AbdKJLOl (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Fri, 10 Nov 2017 06:14:41 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:10443 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753035AbdKJLOi (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 10 Nov 2017 06:14:38 -0500
Received: from 172.30.72.58 (EHLO DGGEMS403-HUB.china.huawei.com) ([172.30.72.58])
        by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DKO46189;
        Fri, 10 Nov 2017 19:14:10 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.361.1; Fri, 10 Nov 2017 19:14:02 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <james.morse@arm.com>, <lersek@redhat.com>,
        <marc.zyngier@arm.com>, <christoffer.dall@linaro.org>,
        <rth@twiddle.net>, <ehabkost@redhat.com>, <kvm@vger.kernel.org>,
        <guohanjun@huawei.com>, <lijinyue@huawei.com>,
        <huangshaoyu@huawei.com>, <wuquanming@huawei.com>,
        <zhengqiang10@huawei.com>, <linuxarm@huawei.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v12 04/12] ACPI: enable APEI GHES in the configure file and build it
Date:   Sat, 11 Nov 2017 03:19:43 +0800
Message-ID: <1510341591-22817-5-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1510341591-22817-1-git-send-email-gengdongjiu@huawei.com>
References: <1510341591-22817-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A090202.5A058A05.008D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: b4247890d1a3baf0bfc1f7292f1229a7
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: lyv7PpauLDMu

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
