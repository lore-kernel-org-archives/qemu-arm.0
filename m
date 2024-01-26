Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp793974ejc;
        Fri, 26 Jan 2024 02:51:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHG6LNYPrjIci2hvyceRrwyppzPWRhVWLVEKd7GcW3MFTI2YfUvPRDApHiD1CeypsIObaGl
X-Received: by 2002:a05:622a:64c:b0:42a:70fe:9870 with SMTP id a12-20020a05622a064c00b0042a70fe9870mr1220750qtb.107.1706266317337;
        Fri, 26 Jan 2024 02:51:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706266317; cv=none;
        d=google.com; s=arc-20160816;
        b=NBXngrlx7n1MOxDLvOIb9Z4k6vZdR+nOMG5JhcKbcaVi6p7gaPrc7M+RutO05XCFWb
         xwAzMGcOYtwR10KTLZzjQJM8iAnnfXzv6x8y8mk/3huHdISSaL8IWZp9lvoE096w0JWb
         4e/cUZLF3r6Aigq+/uvXXtbpLCnxkQ0JVFF4ozhPgZK5EX3V1zHNFCAtco/a6Evpp7MF
         Pg9S4KFfYTtLi9zrDjJz43Kz7ULl61yhQO917Oe2tnpizHEnXerkWjKZw9/ByYdFFmWT
         x6tHNib1sh8Y8gKsoglsuK0Zm1D4pgfn1ayd5o9lnsEMlV01IBwFDCthxQ1JI7TCY/00
         ZQFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZBhlDE9I+f1IfaRKQtDvZ3so4516U2twYD0GN+0VgDU=;
        fh=oCcW8YgO0uPSEPLT85zmruvbAEZ25ywTEvlgBH92cAY=;
        b=iIr+JUpqxDiGHN5C+i1/wpv6tFk305WYaAIF6lJne8FjMHJF8+IYlozT3V7poyVr6y
         95Em3eAJSueFuHccfhG1QVJ6pHs/1NEyEDCM+xpZB+zsJdXnrotFbUYBOCyo+UOeJakZ
         iwQZDIOkNmIONb/dVyysqv5DN1VgfiqurEPqWorIsALpgWWfVE3IN7330eVGbKkVuLMx
         M+E39RnWPubH+Qu2dwl7pkDr3UlzX4RFrA0j+60PGaB3bA39GLsp4OO/1m9VFtaKUpsT
         RkHgadLPlPsKACDqJiSpfTewMkOb02yRVfV8sq+ykVgAP8Ohr5fB/EsfDkRGLXzYwGEy
         AWdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=MvX9Vzzd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3-20020a05622a1a0300b0042a266c5902si1012607qtb.584.2024.01.26.02.51.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 02:51:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=MvX9Vzzd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rTJnd-0004vi-4b; Fri, 26 Jan 2024 05:51:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rTJn2-0004Zp-SB; Fri, 26 Jan 2024 05:50:29 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rTJn0-0006AJ-92; Fri, 26 Jan 2024 05:50:28 -0500
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 40QAlMBY016849; Fri, 26 Jan 2024 10:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=ZBhlDE9I+f1IfaRKQtDvZ3so4516U2twYD0GN+0VgDU=;
 b=MvX9Vzzdow7ruGQiMOA9rIr3yKhBakYfPMi/RaT76v0vgrh91puwqPDyRJmf5g477jI3
 Df3nwYdIg3zCyYkKJukIjDnIp3HdWCwk3x+Y/kB6Njug83URGIrgieaf+5Owb8nEMITr
 O0G0AldfFiu8eB9D2vOB/1uPR7IMWWrt3e/SVkNiGwY48tVFWMo3kS2BDp57+gbDOZ71
 umGSo3caD0IoR/JgebsBB/4wFK133AYFYIMSpf1oMdut7lQb2f23cNA495QbSYtCH+AU
 KW6jD1RwMtwRFCKcMnaRz11dfjHAk5Optr+c3XYC2V2Cfr2t9Ui618GlpL2pHS+6rAzD Qw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vvb9ug1gw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 10:50:04 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40QAlYKq017439;
 Fri, 26 Jan 2024 10:50:03 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vvb9ug1gg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 10:50:03 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 40Q9giV3026509; Fri, 26 Jan 2024 10:50:02 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vrrgttj8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 10:50:02 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 40QAo2Zw66716012
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jan 2024 10:50:02 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA8BA58053;
 Fri, 26 Jan 2024 10:50:01 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1D4D58043;
 Fri, 26 Jan 2024 10:50:00 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jan 2024 10:50:00 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@codeconstruct.com.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v12 02/11] hw/fsi: Introduce IBM's scratchpad device
Date: Fri, 26 Jan 2024 04:49:47 -0600
Message-Id: <20240126104956.74126-3-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126104956.74126-1-ninad@linux.ibm.com>
References: <20240126104956.74126-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hDFzJDuVEX4QjhCwtXMfnfL_mZPPa6xd
X-Proofpoint-GUID: gO27nHvBZRxzw3y0F94MRBDB9Ulkv3cv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=916 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2401260078
Received-SPF: pass client-ip=148.163.158.5; envelope-from=ninad@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3zCbz8wJQOwy

This is a part of patchset where IBM's Flexible Service Interface is
introduced.

The scratchpad provides a set of non-functional registers. The firmware
is free to use them, hardware does not support any special management
support. The scratchpad registers can be read or written from LBUS
slave. The scratch pad is managed under FSI CFAM state.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
[ clg: - moved object FSIScratchPad under FSICFAMState
       - moved FSIScratchPad code under cfam.c ]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 include/hw/fsi/lbus.h | 11 ++++++
 hw/fsi/lbus.c         | 78 +++++++++++++++++++++++++++++++++++++++++--
 hw/fsi/trace-events   |  2 ++
 3 files changed, 89 insertions(+), 2 deletions(-)

diff --git a/include/hw/fsi/lbus.h b/include/hw/fsi/lbus.h
index e8a22e22a8..558268c013 100644
--- a/include/hw/fsi/lbus.h
+++ b/include/hw/fsi/lbus.h
@@ -29,4 +29,15 @@ typedef struct FSILBus {
     MemoryRegion mr;
 } FSILBus;
 
+#define TYPE_FSI_SCRATCHPAD "fsi.scratchpad"
+#define SCRATCHPAD(obj) OBJECT_CHECK(FSIScratchPad, (obj), TYPE_FSI_SCRATCHPAD)
+
+#define FSI_SCRATCHPAD_NR_REGS 4
+
+typedef struct FSIScratchPad {
+        FSILBusDevice parent;
+
+        uint32_t regs[FSI_SCRATCHPAD_NR_REGS];
+} FSIScratchPad;
+
 #endif /* FSI_LBUS_H */
diff --git a/hw/fsi/lbus.c b/hw/fsi/lbus.c
index 44d2319087..20495f42fd 100644
--- a/hw/fsi/lbus.c
+++ b/hw/fsi/lbus.c
@@ -8,11 +8,12 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/fsi/lbus.h"
-
 #include "hw/qdev-properties.h"
-
+#include "qemu/log.h"
 #include "trace.h"
 
+#define TO_REG(offset) ((offset) >> 2)
+
 static void fsi_lbus_init(Object *o)
 {
     FSILBus *lbus = FSI_LBUS(o);
@@ -34,10 +35,83 @@ static const TypeInfo fsi_lbus_device_type_info = {
     .abstract = true,
 };
 
+static uint64_t fsi_scratchpad_read(void *opaque, hwaddr addr, unsigned size)
+{
+    FSIScratchPad *s = SCRATCHPAD(opaque);
+    int reg = TO_REG(addr);
+
+    trace_fsi_scratchpad_read(addr, size);
+
+    if (reg >= FSI_SCRATCHPAD_NR_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, addr);
+        return 0;
+    }
+
+    return s->regs[reg];
+}
+
+static void fsi_scratchpad_write(void *opaque, hwaddr addr, uint64_t data,
+                                 unsigned size)
+{
+    FSIScratchPad *s = SCRATCHPAD(opaque);
+
+    trace_fsi_scratchpad_write(addr, size, data);
+    int reg = TO_REG(addr);
+
+    if (reg >= FSI_SCRATCHPAD_NR_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, addr);
+        return;
+    }
+
+    s->regs[reg] = data;
+}
+
+static const struct MemoryRegionOps scratchpad_ops = {
+    .read = fsi_scratchpad_read,
+    .write = fsi_scratchpad_write,
+    .endianness = DEVICE_BIG_ENDIAN,
+};
+
+static void fsi_scratchpad_realize(DeviceState *dev, Error **errp)
+{
+    FSILBusDevice *ldev = FSI_LBUS_DEVICE(dev);
+
+    memory_region_init_io(&ldev->iomem, OBJECT(ldev), &scratchpad_ops,
+                          ldev, TYPE_FSI_SCRATCHPAD, 0x400);
+}
+
+static void fsi_scratchpad_reset(DeviceState *dev)
+{
+    FSIScratchPad *s = SCRATCHPAD(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+}
+
+static void fsi_scratchpad_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->bus_type = TYPE_FSI_LBUS;
+    dc->realize = fsi_scratchpad_realize;
+    dc->reset = fsi_scratchpad_reset;
+}
+
+static const TypeInfo fsi_scratchpad_info = {
+    .name = TYPE_FSI_SCRATCHPAD,
+    .parent = TYPE_FSI_LBUS_DEVICE,
+    .instance_size = sizeof(FSIScratchPad),
+    .class_init = fsi_scratchpad_class_init,
+};
+
 static void fsi_lbus_register_types(void)
 {
     type_register_static(&fsi_lbus_info);
     type_register_static(&fsi_lbus_device_type_info);
+    type_register_static(&fsi_scratchpad_info);
 }
 
 type_init(fsi_lbus_register_types);
diff --git a/hw/fsi/trace-events b/hw/fsi/trace-events
index e69de29bb2..c5753e2791 100644
--- a/hw/fsi/trace-events
+++ b/hw/fsi/trace-events
@@ -0,0 +1,2 @@
+fsi_scratchpad_read(uint64_t addr, uint32_t size) "@0x%" PRIx64 " size=%d"
+fsi_scratchpad_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size=%d value=0x%"PRIx64
-- 
2.39.2

