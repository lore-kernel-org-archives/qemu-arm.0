Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp2341273njb;
        Tue, 15 Oct 2024 03:09:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV5/Ip2Ku28L4DOaZCGY6G9rGh3g4bwBUbdAk9so4fviNy8Tr4u+dqDAkHvmIJRGpV0NCYk57rRH6+a8A==@linaro.org
X-Google-Smtp-Source: AGHT+IFcv9m1RAwcRP5F40aM73HVHCnqQhVNQe5Mqt19CKrwCQXomm2Yoe3sjaZQjniv97iU2P3p
X-Received: by 2002:a5d:6e43:0:b0:37c:cee0:96e6 with SMTP id ffacd0b85a97d-37d551fc08dmr11871999f8f.27.1728986985591;
        Tue, 15 Oct 2024 03:09:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728986985; cv=none;
        d=google.com; s=arc-20240605;
        b=UAMWVSBOQ70wQBsx0BSlHcI7yitl5Q69z7guDko2ipEZlSgPRXUsND5wmh1k0R9K7M
         TjAhF+06TNEF+haOprw8GVEuPnkurbDvTGRYQbwQLFBhHQcBjwwWFKUNfTpXSZjTtrKM
         rh4N3AaELKiTksTdKIeSZEgMXbZUc3tJ8yPGC2EzNdS7fncTMwoITsj82vMYbFM9OmSH
         PRpArFFXQ9lvfdJKz/puH+4ELHGNWrt712nEwBCo/yTujlpbstF6N/1FS1iWjc94y4QK
         g0KoF7XuI0BG9SUDuRslVtUmPEBqJtKa/EdSOgQs4Oe7uknpbugId11cjbyriVF362xN
         EqCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=941y336J4Aosp/Z+nB50nJkwKhcNLqIO+eVe0f4LkSI=;
        fh=f7aqOn0Aylihzqer4hTA2kHSEaA8DU6KE1VFtniI5w4=;
        b=JP6FONsOSKxLNJg+Gr4vdyj7Caa+ryZU6wNvpIWCd2sSqMqWBXApCOl44RQ+q4qYZv
         AXLXS0+WAc/rpqIIW9LrNpWiAU8eIabao5m6xr6QisGKHZHmlw/nLM36i6eOEJZjraco
         U35gb7dZGKiJ6K87dR+BSSymjeKWVcsGPXow3y4WkgJOygmWgCyXOLEvkqLW5QUaJQaE
         IVnb6uu0JymM6a0qUAjMXe0J01xfJqNdjtZsWORSXqA52d4bMLuIe73GVCh8iqhKTW/z
         rHyOPgmyigVjsONsD76vq8hmmjUsuET4mwz1bTnaJ3VXBd5QU0jgj0xYgSccI1Hkxg5D
         YIkQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d7fbedb7dsi545479f8f.149.2024.10.15.03.09.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2024 03:09:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XSV8X2KtSz6DB4D;
	Tue, 15 Oct 2024 18:05:16 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id A3C5C1404F5;
	Tue, 15 Oct 2024 18:09:44 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.146.149) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 12:09:24 +0200
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <peterx@redhat.com>, <eric.auger@redhat.com>,
	<will@kernel.org>, <ardb@kernel.org>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>, <npiggin@gmail.com>,
	<harshpb@linux.ibm.com>, <linux@armlinux.org.uk>,
	<darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
	<vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
	<miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH RFC V5 26/30] hw/intc/arm_gicv3_common: Add GICv3CPUState 'accessible' flag migration handling
Date: Tue, 15 Oct 2024 11:00:08 +0100
Message-ID: <20241015100012.254223-27-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015100012.254223-1-salil.mehta@huawei.com>
References: <20241015100012.254223-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.146.149]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: f3cHxnDSoaj+

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
index c21fff4903..53045ad6bc 100644
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
+    if (cs->cpu && !gicv3_cpu_accessible((cs))) {
+        warn_report("Found CPU %d enabled, for incoming *disabled* GICC State",
+                    cs->cpu->cpu_index);
+        warn_report("*Disabling* CPU %d, to match the incoming migrated state",
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
