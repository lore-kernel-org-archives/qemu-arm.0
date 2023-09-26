Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp981731ejc;
        Tue, 26 Sep 2023 03:09:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOf/p1AADpCtYgbap+ZHIeaV9vN2fFmaiwOh+IhEMqSTl4RuWJzGBGzw1onLoIF92gNGXI
X-Received: by 2002:a17:902:e745:b0:1c3:cee1:cc8e with SMTP id p5-20020a170902e74500b001c3cee1cc8emr10013379plf.68.1695722956757;
        Tue, 26 Sep 2023 03:09:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695722956; cv=none;
        d=google.com; s=arc-20160816;
        b=MBVKAQm88Ez9PEJauijFyBtRK0eU4JwYI85SzjMiBOINnu61nCV/Duia+AhBwVBsul
         TY++I6aMpsGPFAVQIXLtrXzOE3wGEX1NMPRN/Uvg1BJFjxxUMsr4eoiKNCHYIvORcZWx
         tMNQX3On8StiQv9vyeyQ9GqEPO/nyf9UtzSM1FpP6swkp3hmfK7WzF7IG1JV+JGl7Hka
         L0lDbyOcnmWwVdU5WPQfGSxYcmGjAQvHqgSsSzmOH6st5Ya7CsuB+URzZ1iOoueCExIp
         gX+wfCujSPMIAOGPs7uYngNdTKUrUYhV4OyiXxU/H187P1GVG1ZfByzn1NnS8yfqg7yh
         t2fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=jR/XlNN6qFMeKxeY2ScTeQLcO5O2N21LVaGbClpDb/w=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=BzFWjt9UzUy0+ekn0OlqCAHaYVUr2bXej5TImy9GshMVkkJ9oMaMi5VKbWvt35mgZR
         xJCO4m18GwBMt1NXDIJncC1LmHFt0mO+S/FPXKA32wmG5JgO0Bo/YsXC/mEOvc+KPz9M
         RlMCdcSzjUlqTEX3N+3wTUPCzFjyBdYgNxod20rY0lpk7R2LBn8wl0dqyOsBIBOStPt2
         DATAWbCbHKaG0jR1gBaeGv4hjJrxHn3ynij29AieQ71fAVeu/rgTVJV+pyPPbB6UvJgZ
         sw5hi3Fk/O3fKS3tmdDBR2jamIHItdLdMV3tjHnXvRIJpRmrorJCzSOsDwYJ4s76QTM4
         t4LA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id x12-20020a1709028ecc00b001b87bd2f7b0si11350327plo.402.2023.09.26.03.09.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:09:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvwRL58wkz6K62x;
	Tue, 26 Sep 2023 18:07:58 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:08:54 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<mst@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>
Subject: [PATCH RFC V2 12/37] hw/acpi: Use qemu_present_cpu() API in ACPI CPU hotplug init
Date: Tue, 26 Sep 2023 11:04:11 +0100
Message-ID: <20230926100436.28284-13-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926100436.28284-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: koyiOcKE5D6j

ACPI CPU Hotplug code assumes a virtual CPU is unplugged if the CPUState object
is absent in the list of ths possible CPUs(CPUArchIdList *possible_cpus)
maintained on per-machine basis. Use the earlier introduced qemu_present_cpu()
API to check this state.

This change should have no bearing on the functionality of any architecture and
is mere a representational change.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/acpi/cpu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 45defdc0e2..d5ba37b209 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -225,7 +225,10 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
     state->dev_count = id_list->len;
     state->devs = g_new0(typeof(*state->devs), state->dev_count);
     for (i = 0; i < id_list->len; i++) {
-        state->devs[i].cpu =  CPU(id_list->cpus[i].cpu);
+        struct CPUState *cpu = CPU(id_list->cpus[i].cpu);
+        if (qemu_present_cpu(cpu)) {
+            state->devs[i].cpu = cpu;
+        }
         state->devs[i].arch_id = id_list->cpus[i].arch_id;
     }
     memory_region_init_io(&state->ctrl_reg, owner, &cpu_hotplug_ops, state,
-- 
2.34.1
