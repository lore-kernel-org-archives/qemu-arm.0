Received: by 10.223.188.70 with SMTP id a6csp1285298wrh;
        Fri, 1 Sep 2017 10:22:39 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb4kvm1OoJG1AjRPBcLKnNRGojaI1B5zMnkO//co67fgjaccL6Cco/0T6lD+9r98Nx5ArOhy
X-Received: by 10.55.164.82 with SMTP id n79mr3866785qke.45.1504286559337;
        Fri, 01 Sep 2017 10:22:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504286559; cv=none;
        d=google.com; s=arc-20160816;
        b=FpUQig1Lge47BlMFiGjuW5wG1GSzf1r2EgYetK+ZEly82fck8kJcT0+gh41qmaqo/f
         NR7EtpS5VjBFWV6uH9imaBnFGTBkoAedy62mK0xaWK/1Cy23pA1rFykXKbU/8EVRmjAk
         3L1LaWbsbuF81d8t3+73G5jp2/NOLBL7NuTbk/0foL5fP8U1toKXIxk3xdHlbUQbfn/7
         3/uitnE1bRgxoBs1yhu90D0SC3h8iNUa1WGatxIVmHqjc77mBLyKMAcmCWLZBmH7ZVID
         P7b4dDg6jlzjjxZHN/A5LW7qgGdB0ATqUUtIhZF3wWbZ9K1NHFAaySgzDFgcHEdbQmjL
         v6xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=Ovq5YEoGmL/BOEA4xhyhu2LuIpsVQoz/3ppk1Q9jqYk=;
        b=oMTX7ExnqlMdvTjxJheG6O+HWB4zdnU+aoq2tEO8hluqIBX7XfcWlCcBN/rDDbcdVB
         gvIy79xl2RUg4/Csx1VoZRibluYzl/K1f7qfpNoqrF//3wX5TS2RBp7N0QPtW0u39jQs
         s7eoaochF7WIH3s687Cjj0/2+tzkpFGq2pXsTR0Z5zxnC4JP8ukWHR6sF1qnIhuzAy4a
         yweC4/vrPFfk1EyKlFIBjOVNyvQPiiBL9AXo8RVdcuU5i/of53MbeF9NJpGmhoxZhk7+
         7cnVNd02PgTHjBO/ebUF0UU2vWWVjY1nJDwXOswJ8gs4ku5oh7awDSekw3x76oJ9bsrp
         EsFA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t27si10879336qkt.24.2017.09.01.10.22.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Sep 2017 10:22:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51225 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnpeO-0005E3-Um
	for alex.bennee@linaro.org; Fri, 01 Sep 2017 13:22:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpeI-0005CH-Sl
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 13:22:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpeH-0002YF-PH
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 13:22:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49608)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dnpeH-0002XL-Gn; Fri, 01 Sep 2017 13:22:29 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7BA7981DF5;
	Fri,  1 Sep 2017 17:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7BA7981DF5
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-117-241.ams2.redhat.com
	[10.36.117.241])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 16A2617100;
	Fri,  1 Sep 2017 17:22:22 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Fri,  1 Sep 2017 19:21:09 +0200
Message-Id: <1504286483-23327-7-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 01 Sep 2017 17:22:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v7 06/20] hw/arm/smmuv3: Wired IRQ and GERROR
 helpers
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
Cc: mohun106@gmail.com, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	will.deacon@arm.com, robin.murphy@arm.com, peterx@redhat.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org, wtownsen@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 92SfS5eBsTHG

We introduce some helpers to handle wired IRQs and especially
GERROR interrupt. SMMU writes GERROR register on GERROR event
and SW acks GERROR interrupts by setting GERRORn.

The Wired interrupts are edge sensitive.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

Is CMD_SYNC interrupt enabled somewhere?
---
 hw/arm/smmuv3-internal.h | 20 ++++++++++++++++++
 hw/arm/smmuv3.c          | 55 ++++++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/trace-events      |  2 ++
 3 files changed, 77 insertions(+)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 488acc8..2b44ee2 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -198,4 +198,24 @@ static inline int smmu_enabled(SMMUV3State *s)
     return smmu_read32_reg(s, SMMU_REG_CR0) & SMMU_CR0_SMMU_ENABLE;
 }
 
+/*****************************
+ * Interrupts
+ *****************************/
+
+#define smmu_evt_irq_enabled(s)                   \
+    (smmu_read64_reg(s, SMMU_REG_IRQ_CTRL) & SMMU_IRQ_CTRL_EVENT_EN)
+#define smmu_gerror_irq_enabled(s)                  \
+    (smmu_read64_reg(s, SMMU_REG_IRQ_CTRL) & SMMU_IRQ_CTRL_GERROR_EN)
+#define smmu_pri_irq_enabled(s)                 \
+    (smmu_read64_reg(s, SMMU_REG_IRQ_CTRL) & SMMU_IRQ_CTRL_PRI_EN)
+
+#define SMMU_PENDING_GERRORS(s) \
+    (smmu_read32_reg(s, SMMU_REG_GERROR) ^ \
+     smmu_read32_reg(s, SMMU_REG_GERRORN))
+
+#define SMMU_CMDQ_ERR(s) (SMMU_PENDING_GERRORS(s) & SMMU_GERROR_CMDQ)
+
+void smmuv3_irq_trigger(SMMUV3State *s, SMMUIrq irq, uint32_t gerror_val);
+void smmuv3_write_gerrorn(SMMUV3State *s, uint32_t gerrorn);
+
 #endif
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 0a7cd1c..468134f 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -29,6 +29,61 @@
 #include "hw/arm/smmuv3.h"
 #include "smmuv3-internal.h"
 
+/**
+ * smmuv3_irq_trigger - pulse @irq if enabled and update
+ * GERROR register in case of GERROR interrupt
+ *
+ * @irq: irq type
+ * @gerror: gerror new value, only relevant if @irq is GERROR
+ */
+void smmuv3_irq_trigger(SMMUV3State *s, SMMUIrq irq, uint32_t gerror_val)
+{
+    uint32_t pending_gerrors = SMMU_PENDING_GERRORS(s);
+    bool pulse = false;
+
+    switch (irq) {
+    case SMMU_IRQ_EVTQ:
+        pulse = smmu_evt_irq_enabled(s);
+        break;
+    case SMMU_IRQ_PRIQ:
+        pulse = smmu_pri_irq_enabled(s);
+        break;
+    case SMMU_IRQ_CMD_SYNC:
+        pulse = true;
+        break;
+    case SMMU_IRQ_GERROR:
+    {
+        /* don't toggle an already pending error */
+        bool new_gerrors = ~pending_gerrors & gerror_val;
+        uint32_t gerror = smmu_read32_reg(s, SMMU_REG_GERROR);
+
+        smmu_write32_reg(s, SMMU_REG_GERROR, gerror | new_gerrors);
+
+        /* pulse the GERROR irq only if all fields were acked */
+        pulse = smmu_gerror_irq_enabled(s) && !pending_gerrors;
+        break;
+    }
+    }
+    if (pulse) {
+            trace_smmuv3_irq_trigger(irq,
+                                     smmu_read32_reg(s, SMMU_REG_GERROR),
+                                     SMMU_PENDING_GERRORS(s));
+            qemu_irq_pulse(s->irq[irq]);
+    }
+}
+
+void smmuv3_write_gerrorn(SMMUV3State *s, uint32_t gerrorn)
+{
+    uint32_t pending_gerrors = SMMU_PENDING_GERRORS(s);
+    uint32_t sanitized;
+
+    /* Make sure SW does not toggle irqs that are not active */
+    sanitized = gerrorn & pending_gerrors;
+
+    smmu_write32_reg(s, SMMU_REG_GERRORN, sanitized);
+    trace_smmuv3_write_gerrorn(gerrorn, sanitized, SMMU_PENDING_GERRORS(s));
+}
+
 static void smmuv3_init_regs(SMMUV3State *s)
 {
     uint32_t data =
diff --git a/hw/arm/trace-events b/hw/arm/trace-events
index 8affbf7..c1ce8eb 100644
--- a/hw/arm/trace-events
+++ b/hw/arm/trace-events
@@ -17,3 +17,5 @@ smmu_set_translated_address(hwaddr iova, hwaddr pa) "iova = 0x%"PRIx64" -> pa =
 
 #hw/arm/smmuv3.c
 smmuv3_read_mmio(hwaddr addr, uint64_t val, unsigned size) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x"
+smmuv3_irq_trigger(int irq, uint32_t gerror, uint32_t pending) "irq=%d gerror=0x%x pending gerrors=0x%x"
+smmuv3_write_gerrorn(uint32_t gerrorn, uint32_t sanitized, uint32_t pending) "gerrorn=0x%x sanitized=0x%x pending=0x%x"
-- 
2.5.5

