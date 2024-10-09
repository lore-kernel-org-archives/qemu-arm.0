Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp596460njl;
        Tue, 8 Oct 2024 20:25:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUSwLMAvwlHJ83lAZWb/9YZVd4RdKSZZ71aZMtURYCBpFlUacAWiIHoMUBoCvV3wwvNUf1XBBLK/W27YA==@linaro.org
X-Google-Smtp-Source: AGHT+IHZ2E/liLAvn3yv8kGNp8chRQ55/Ai3mvMN/U5qesTW0TCwkogfPtaUMYcxrytSuL7SiLmE
X-Received: by 2002:a17:90a:9514:b0:2da:d766:1925 with SMTP id 98e67ed59e1d1-2e2a2564a43mr1230060a91.37.1728444351911;
        Tue, 08 Oct 2024 20:25:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728444351; cv=none;
        d=google.com; s=arc-20240605;
        b=ddZt4xsdyKkKX0Fk+JG4TGLGFyfGB7x0W0kQUtcO8QiyOM6r6W12mbvVXTmRr9aKfN
         pnpXD3iuJvW0Gaefy+FzcYB5JTD0ONLF6dogXjhAGVBWNXBSU+eBxWiwYqe8POWiAulr
         4Hy/GlohuCAyvdBte4jNgfMFVNE7NRFL5Dyz9r/IDoV8Wx0yEhmEkmmcqrXBavzkN1vm
         pUpJzbw2qDlm+rxDnvBK4QBw2cC/o0BJyoCRz+TyxOLujBia7fjefEwujpbvVkshAVVC
         zvyAInQ/L5XzjGZUGPn0r5Zeo8XXF6qHzEOT4qAnzruVwzXW24zRX1ZtmiifTgm/g8WP
         27mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=PMqpw0gYhIV49WF1nFtgVHeoKLNZGnwpEgzne9Ln7kc=;
        fh=4Dgx8jc1gJCFDIGNl8iT3gucG+cuHYR9XmJ7yDXtNzA=;
        b=czRsiehGfpBTWl6kY9KUEh5eqpatlWEXzndFn+eSeMm0p85Gro7D+q7jeFf10FTi8X
         t8EKGNA+jdacD4820zQS2uCxuk6fdVLPQxiRvlNnxw44CEVvXbzPnnkE6wxTqnBztsG8
         5+14QOY2FNzUBhyuPcbFRnoMJqZJW0rXWow61/VXwLPRaQDf4WDAGXbb6kjiVNc/h5VY
         VqX7krO59A+IdpfgsYphzmSRRgjkrxqC/Nx3enOORbXWAil7fVP0kH0NM+4Y+16FfG8c
         VHdBsYpfZ2/NTCtb9dWn66h8fy6tJ/B/InZpxeKUizG2buDqq/jmiKzXBwzudtMq4LlI
         4oXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2e2a55eeae4si677473a91.11.2024.10.08.20.25.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2024 20:25:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XNdZ50ghQz6K98k;
	Wed,  9 Oct 2024 11:25:33 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id B7C8C140A34;
	Wed,  9 Oct 2024 11:25:49 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.173.89) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 05:25:30 +0200
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<gshan@redhat.com>, <rafael@kernel.org>, <borntraeger@linux.ibm.com>,
	<alex.bennee@linaro.org>, <npiggin@gmail.com>, <harshpb@linux.ibm.com>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH RFC V4 19/33] target/arm: Force ARM vCPU *present* status ACPI *persistent*
Date: Wed, 9 Oct 2024 04:18:01 +0100
Message-ID: <20241009031815.250096-20-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009031815.250096-1-salil.mehta@huawei.com>
References: <20241009031815.250096-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.173.89]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: EOGpUXnzRxuF

The ARM CPU architecture does not permit changes to CPU presence after the
kernel has booted. This is an immutable requirement from ARM and represents a
strict architectural constraint [1][2].

The ACPI update [3] reinforces this by specifying that the `_STA.Present` bit
in the ACPI specification cannot be modified once the system has booted.
Consequently, the firmware, ACPI, and QEMU must provide the guest kernel with a
persistent view of the vCPUs, even when they are not present in the QOM
(i.e., when they are unplugged or have yet to be plugged into the QOM after the
kernel has booted).

References:
[1] KVMForum 2023 Presentation: Challenges Revisited in Supporting Virt CPU Hotplug on
    architectures that don’t Support CPU Hotplug (like ARM64)
    a. Kernel Link: https://kvm-forum.qemu.org/2023/KVM-forum-cpu-hotplug_7OJ1YyJ.pdf
    b. Qemu Link:  https://kvm-forum.qemu.org/2023/Challenges_Revisited_in_Supporting_Virt_CPU_Hotplug_-__ii0iNb3.pdf
[2] KVMForum 2020 Presentation: Challenges in Supporting Virtual CPU Hotplug on
    SoC Based Systems (like ARM64)
    Link: https://kvmforum2020.sched.com/event/eE4m
[3] Check comment 5 in the bugzilla entry
    Link: https://bugzilla.tianocore.org/show_bug.cgi?id=4481#c5

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 target/arm/cpu64.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 2a517fdb9f..a84f312ae2 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -794,6 +794,13 @@ static void aarch64_cpu_initfn(Object *obj)
      */
     cs->disabled = true;
     cs->thread_id = 0;
+    /*
+     * To provide the guest with a persistent view of vCPU presence, ACPI may
+     * need to simulate the presence of vCPUs even when they are not present in
+     * the QOM or are in a disabled state. This flag is utilized during the
+     * initialization of ACPI hotplug state and during vCPU hot-unplug events.
+     */
+    cs->acpi_persistent = true;
 }
 
 static void aarch64_cpu_finalizefn(Object *obj)
-- 
2.34.1
