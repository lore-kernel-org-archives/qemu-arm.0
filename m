Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp597277njl;
        Tue, 8 Oct 2024 20:29:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXFQ87cEccDE+exzrMMtKdoYoSW4NTQVnnA3mt869sbsk/6muTk7Hme/pb+ZasB0wjcIqA9ymYhr530LQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEPxzuGhVO1ugPXL80QBjdA5U9Xoqsh8M4C7p+tAPxzmK/jbZGxjuJhPCWMlreReIdM0oK1
X-Received: by 2002:a05:6a00:3c88:b0:71d:f012:6de7 with SMTP id d2e1a72fcca58-71e1dbd0567mr1803795b3a.27.1728444548187;
        Tue, 08 Oct 2024 20:29:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728444548; cv=none;
        d=google.com; s=arc-20240605;
        b=EvQUlmfu20//5mifWarRx4O9TSiUQEFMTyIURR81jZapLHrwpRW2AtBQchYLErsIVV
         8RvLfYJfBx3xGfUVm2jbPl6gh+6QJHfuinJqFq9/Vm14csySsQxSil+D6YdRsRtxI82M
         +9e3eb4ow/EzTWDw+4+I9FKGc0KK0ye1WBfJMNxzt71DZWb7gpxZgvyGWYm7xwAX5QUS
         RukdQ+Qv5Aa+pIIHqsqrIclO257UJmDEszg3DTjTO2D5QM5INyZrfyZwjbtiZgHLgxwz
         v4lukOdP0Ec6EKlM/qf9Gy0AUzZFUcxPERivT/Flno1oXOErOZmNd4wHktWbPou3Geku
         8j7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Ap+VpmTHXghYzzEkGHSxMOEN2+FHE07YfY1YyAwcmnM=;
        fh=4Dgx8jc1gJCFDIGNl8iT3gucG+cuHYR9XmJ7yDXtNzA=;
        b=CJON4j68IMyqySQ8l1VmDluCGOgY6Hc9pWf1bNjX5PSKfId70EA/WSsslJbbXlExNE
         nG82tZ5QXe1TgbqXVCNfZDDaMc20uZoX/0TtbVNcFzpKR5Wd3OJkIAk6eGqNTd1zR6QR
         FZ8ZITpFBCADWC+faZcfH+C9oSTGEYGEemZowBzMknd8V/dAXI76+cn+18EULh30qft3
         77rKne6xDDaRsEGoBGzxo0kf7qVd49kuAbWgl2u9ikyERI6IXbW51hOV/21plryW8mKE
         HN7Pe0ZDahIGe6wU7tyn5VOQCNxfGH6qjWRa9WsXKI0boVt0hSE8q96JMZEiaheRO42G
         Zpyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d2e1a72fcca58-71df0d5d8c7si10255314b3a.217.2024.10.08.20.29.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2024 20:29:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XNddq72fNz6K98k;
	Wed,  9 Oct 2024 11:28:47 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 9FFE9140A90;
	Wed,  9 Oct 2024 11:29:04 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.173.89) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 05:28:45 +0200
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
Subject: [PATCH RFC V4 29/33] hw/intc/arm_gicv3_common: Add GICv3CPUState 'accessible' flag migration handling
Date: Wed, 9 Oct 2024 04:18:11 +0100
Message-ID: <20241009031815.250096-30-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009031815.250096-1-salil.mehta@huawei.com>
References: <20241009031815.250096-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.173.89]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: kMgXQ9tKWqYQ

The QOM `GICv3CPUState` (and consequently the corresponding KVM VGIC `ICC_*_EL1`
registers) can be either 'accessible' or 'inaccessible', depending on the state
of the associated QOM vCPUs. This `gicc_accessible` state should be saved during
migration at the source and restored at the destination.

Ideally, the number of possible and enabled QOM vCPUs should match between the
source and destination. Ensuring this consistency is the responsibility of the
administrator. However, if the destination QEMU has more enabled vCPUs than the
source, we can either fail the migration or override the destination QEMU’s vCPU
configuration to match the source. We have adopted the latter approach as a
mitigation for the mismatch. Nonetheless, the administrator should still ensure
that the number of possible QOM vCPUs is consistent at both ends.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/intc/arm_gicv3_common.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index e7b2d04358..5dda14ce1c 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -126,6 +126,29 @@ static int vmstate_gicv3_cpu_pre_load(void *opaque)
     return 0;
 }
 
+static int vmstate_gicv3_cpu_post_load(void *opaque, int version_id)
+{
+    GICv3CPUState *cs = opaque;
+
+    /*
+     * If the destination QEMU has more *enabled* vCPUs than the source, we can
+     * either *fail* the migration or override the destination QEMU’s vCPU
+     * configuration to match the source. Since it is safe to override the
+     * `CPUState` of the extra *enabled* vCPUs at the destination, we have
+     * adopted the latter approach as a mitigation for the mismatch.
+     * RFC: Question: any suggestions on this are welcome?
+     */
+    if (!gicv3_cpu_accessible((cs)) && qemu_enabled_cpu(cs->cpu)) {
+        warn_report("Found CPU %d enabled for incoming *disabled* GICC State\n",
+                    cs->cpu->cpu_index);
+        warn_report("Disabling CPU %d to match the incoming migrated state",
+                    cs->cpu->cpu_index);
+        qdev_unrealize(DEVICE(cs->cpu));
+    }
+
+    return 0;
+}
+
 static bool icc_sre_el1_reg_needed(void *opaque)
 {
     GICv3CPUState *cs = opaque;
@@ -186,6 +209,7 @@ static const VMStateDescription vmstate_gicv3_cpu = {
     .version_id = 1,
     .minimum_version_id = 1,
     .pre_load = vmstate_gicv3_cpu_pre_load,
+    .post_load = vmstate_gicv3_cpu_post_load,
     .fields = (const VMStateField[]) {
         VMSTATE_UINT32(level, GICv3CPUState),
         VMSTATE_UINT32(gicr_ctlr, GICv3CPUState),
@@ -207,6 +231,7 @@ static const VMStateDescription vmstate_gicv3_cpu = {
         VMSTATE_UINT64_2DARRAY(icc_apr, GICv3CPUState, 3, 4),
         VMSTATE_UINT64_ARRAY(icc_igrpen, GICv3CPUState, 3),
         VMSTATE_UINT64(icc_ctlr_el3, GICv3CPUState),
+        VMSTATE_BOOL(gicc_accessible, GICv3CPUState),
         VMSTATE_END_OF_LIST()
     },
     .subsections = (const VMStateDescription * const []) {
-- 
2.34.1
