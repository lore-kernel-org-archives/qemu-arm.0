Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp723054ejb;
        Fri, 8 Sep 2023 15:31:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCaI6GiARjZkhqCwGUXiq6rzhteRzILRunK59Gf7IXmOrIvCdWBs6ujhJZ/VOqiujIQOUn
X-Received: by 2002:a05:6358:98a7:b0:13e:ea2a:40aa with SMTP id q39-20020a05635898a700b0013eea2a40aamr4014020rwa.8.1694212295544;
        Fri, 08 Sep 2023 15:31:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694212295; cv=none;
        d=google.com; s=arc-20160816;
        b=BMCJuUFuq0FLIORbn0LLxebyW8NntQ3LlG+sQb956Kww13d/SCaDt+qTFUyqtnyNny
         TN/c27TvjS0+SF5255xPB8UM69PF9g4w/SCPyCxT9eXot+fBuKsltHd+qa/rwcqk2aDp
         n8ZtvxH4At9GyJplAUStxyd2X9j7Ch2lytA02hGkiaXSroFUGjzO8/EJrjt6RbGVmJjt
         C5zm5tck/Ca9Q4xYMagdDyusHiphUh62bcOe7LPyJ2j2Eova26bCR92WU7XfIq53Xafa
         IVV/yYR5c38GpZ8sBz0xmiHBtSi92JxPLXlf6M0KykBIOVocj4txrSSeZiFXj6kgIT6U
         D0bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JEfDxe1wkjL8VLqNo8M0S2KGPEeG8mtNVKQJpTZkxGk=;
        fh=/Ww3feT/iFt+UtShtcSrm/ZkK0mSMJwi4QyqgqL+GT0=;
        b=kfLeX/JaHxsiisOPJOiGDLxejrmXYHGnBOidU0NPb77v4Q2VBux8LhtDGBwLp6e7Go
         MeQrw77I2rOHz1vSZtpfglBK6Yyuh5AxapWz2rjsnrd3nejn2nfXIkeX4XSjqyDAJmX7
         UzYgkivyaxs56YqrKTrHtkUSLJLBGfrAN1zPVvgssHR5RR+JxiXOtoGS5AVytwwdU4UO
         h6ITZY9JD8sWcIf9sAeLUKeXX3YaHKWv8NV8YsA8PPLgQMCpEEWkOWwUxSQY89wfwbBj
         dF3c14XOlg7x8SZ6wIuZnraW86WmPjlvgfj62cyfjnH0wk6LxCwPGu0kHhkerMNEtXMn
         ooKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=Df20s3y1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z17-20020a0cf011000000b0063d456fcd44si1744613qvk.515.2023.09.08.15.31.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 15:31:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=Df20s3y1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qejyo-0001gj-OH; Fri, 08 Sep 2023 18:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qejyk-0001cc-B2; Fri, 08 Sep 2023 18:29:30 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qejye-0003F6-Hp; Fri, 08 Sep 2023 18:29:30 -0400
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 388MO2DG031393; Fri, 8 Sep 2023 22:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=JEfDxe1wkjL8VLqNo8M0S2KGPEeG8mtNVKQJpTZkxGk=;
 b=Df20s3y1UUAWi07jHBhG2q1j9khRgDanRMWSMA+SNYvE5setUPz0XMGoQxk1tYhB5RF5
 s3g+fDVI1gOyq1j1uupUPUdSzxuIwuUWxZyaPBRqVXFd83dQplbG3iAVO47sB7v5WkQZ
 WxPh1WMB02vpNJnohxaMxeDM9dAZBNBCOBWO7I2myqgG0bsutywQbxFPRNfTj76ZqbgI
 7Auip4/pVuGaeY308zWTF/7Uyj1IpcS98a7Z3Yaiqq+tU2uerNzWeff48YHaAR9+nwNq
 a1gN52in5YTINrwB9L1W/+tCwgkI9OOYkt9YIYeqFQVOzEK8OEC4Gr5jo4/5Yk0d9YVr Tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t0ccfg2nn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Sep 2023 22:29:13 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 388MTC1E013963;
 Fri, 8 Sep 2023 22:29:12 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t0ccfg2n9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Sep 2023 22:29:12 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 388L20su012246; Fri, 8 Sep 2023 22:29:11 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3svhkkpvu8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Sep 2023 22:29:11 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com
 [10.241.53.102])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 388MTAVa32244006
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Sep 2023 22:29:11 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B887158061;
 Fri,  8 Sep 2023 22:29:10 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BA3C58056;
 Fri,  8 Sep 2023 22:29:10 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Fri,  8 Sep 2023 22:29:10 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org
Subject: [PATCH v4 05/10] hw/fsi: IBM's On-chip Peripheral Bus
Date: Fri,  8 Sep 2023 17:28:54 -0500
Message-Id: <20230908222859.3381003-6-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230908222859.3381003-1-ninad@linux.ibm.com>
References: <20230908222859.3381003-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NuCxRWad_fL8bxLtVExgB-QCR3jSms3i
X-Proofpoint-ORIG-GUID: kf001BYqKJzYYHTbjB6A45yknie8ssSO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_18,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309080201
Received-SPF: pass client-ip=148.163.158.5; envelope-from=ninad@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cN2uVFto86S+

This is a part of patchset where IBM's Flexible Service Interface is
introduced.

The On-Chip Peripheral Bus (OPB): A low-speed bus typically found in
POWER processors. This now makes an appearance in the ASPEED SoC due
to tight integration of the FSI master IP with the OPB, mainly the
existence of an MMIO-mapping of the CFAM address straight onto a
sub-region of the OPB address space.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
v2:
- Incorporated review comment by Joel.
---
 hw/fsi/Kconfig       |   4 +
 hw/fsi/fsi-master.c  |   6 +-
 hw/fsi/meson.build   |   1 +
 hw/fsi/opb.c         | 194 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/fsi/opb.h |  43 ++++++++++
 5 files changed, 244 insertions(+), 4 deletions(-)
 create mode 100644 hw/fsi/opb.c
 create mode 100644 include/hw/fsi/opb.h

diff --git a/hw/fsi/Kconfig b/hw/fsi/Kconfig
index 087980be22..560ce536db 100644
--- a/hw/fsi/Kconfig
+++ b/hw/fsi/Kconfig
@@ -1,3 +1,7 @@
+config OPB
+    bool
+    select CFAM
+
 config CFAM
     bool
     select FSI
diff --git a/hw/fsi/fsi-master.c b/hw/fsi/fsi-master.c
index fe1693539a..46103f84e9 100644
--- a/hw/fsi/fsi-master.c
+++ b/hw/fsi/fsi-master.c
@@ -7,14 +7,12 @@
 
 #include "qemu/osdep.h"
 
+#include "qemu/bitops.h"
 #include "qapi/error.h"
-
 #include "qemu/log.h"
 
-#include "hw/fsi/bits.h"
 #include "hw/fsi/fsi-master.h"
-
-#define TYPE_OP_BUS "opb"
+#include "hw/fsi/opb.h"
 
 #define TO_REG(x)                               ((x) >> 2)
 
diff --git a/hw/fsi/meson.build b/hw/fsi/meson.build
index ca80d11cb9..cab645f4ea 100644
--- a/hw/fsi/meson.build
+++ b/hw/fsi/meson.build
@@ -2,3 +2,4 @@ system_ss.add(when: 'CONFIG_LBUS', if_true: files('lbus.c'))
 system_ss.add(when: 'CONFIG_SCRATCHPAD', if_true: files('engine-scratchpad.c'))
 system_ss.add(when: 'CONFIG_CFAM', if_true: files('cfam.c'))
 system_ss.add(when: 'CONFIG_FSI', if_true: files('fsi.c','fsi-master.c','fsi-slave.c'))
+system_ss.add(when: 'CONFIG_OPB', if_true: files('opb.c'))
diff --git a/hw/fsi/opb.c b/hw/fsi/opb.c
new file mode 100644
index 0000000000..ac7693c001
--- /dev/null
+++ b/hw/fsi/opb.c
@@ -0,0 +1,194 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2023 IBM Corp.
+ *
+ * IBM On-chip Peripheral Bus
+ */
+
+#include "qemu/osdep.h"
+
+#include "qapi/error.h"
+#include "qemu/log.h"
+
+#include "hw/fsi/opb.h"
+
+static MemTxResult opb_read(OPBus *opb, hwaddr addr, void *data, size_t len)
+{
+    return address_space_read(&opb->as, addr, MEMTXATTRS_UNSPECIFIED, data,
+                              len);
+}
+
+uint8_t opb_read8(OPBus *opb, hwaddr addr)
+{
+    MemTxResult tx;
+    uint8_t data;
+
+    tx = opb_read(opb, addr, &data, sizeof(data));
+    /* FIXME: improve error handling */
+    assert(!tx);
+
+    return data;
+}
+
+uint16_t opb_read16(OPBus *opb, hwaddr addr)
+{
+    MemTxResult tx;
+    uint16_t data;
+
+    tx = opb_read(opb, addr, &data, sizeof(data));
+    /* FIXME: improve error handling */
+    assert(!tx);
+
+    return data;
+}
+
+uint32_t opb_read32(OPBus *opb, hwaddr addr)
+{
+    MemTxResult tx;
+    uint32_t data;
+
+    tx = opb_read(opb, addr, &data, sizeof(data));
+    /* FIXME: improve error handling */
+    assert(!tx);
+
+    return data;
+}
+
+static MemTxResult opb_write(OPBus *opb, hwaddr addr, void *data, size_t len)
+{
+    return address_space_write(&opb->as, addr, MEMTXATTRS_UNSPECIFIED, data,
+                               len);
+}
+
+void opb_write8(OPBus *opb, hwaddr addr, uint8_t data)
+{
+    MemTxResult tx;
+
+    tx = opb_write(opb, addr, &data, sizeof(data));
+    /* FIXME: improve error handling */
+    assert(!tx);
+}
+
+void opb_write16(OPBus *opb, hwaddr addr, uint16_t data)
+{
+    MemTxResult tx;
+
+    tx = opb_write(opb, addr, &data, sizeof(data));
+    /* FIXME: improve error handling */
+    assert(!tx);
+}
+
+void opb_write32(OPBus *opb, hwaddr addr, uint32_t data)
+{
+    MemTxResult tx;
+
+    tx = opb_write(opb, addr, &data, sizeof(data));
+    /* FIXME: improve error handling */
+    assert(!tx);
+}
+
+void opb_fsi_master_address(OPBus *opb, hwaddr addr)
+{
+    memory_region_transaction_begin();
+    memory_region_set_address(&opb->fsi.iomem, addr);
+    memory_region_transaction_commit();
+}
+
+void opb_opb2fsi_address(OPBus *opb, hwaddr addr)
+{
+    memory_region_transaction_begin();
+    memory_region_set_address(&opb->fsi.opb2fsi, addr);
+    memory_region_transaction_commit();
+}
+
+static uint64_t opb_unimplemented_read(void *opaque, hwaddr addr, unsigned size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: read @0x%" HWADDR_PRIx " size=%d\n",
+                  __func__, addr, size);
+
+    return 0;
+}
+
+static void opb_unimplemented_write(void *opaque, hwaddr addr, uint64_t data,
+                                 unsigned size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: write @0x%" HWADDR_PRIx " size=%d "
+                  "value=%"PRIx64"\n", __func__, addr, size, data);
+}
+
+static const struct MemoryRegionOps opb_unimplemented_ops = {
+    .read = opb_unimplemented_read,
+    .write = opb_unimplemented_write,
+    .endianness = DEVICE_BIG_ENDIAN,
+};
+
+static void opb_realize(BusState *bus, Error **errp)
+{
+    OPBus *opb = OP_BUS(bus);
+    Error *err = NULL;
+
+    memory_region_init_io(&opb->mr, OBJECT(opb), &opb_unimplemented_ops, opb,
+                          NULL, UINT32_MAX);
+    address_space_init(&opb->as, &opb->mr, "opb");
+
+    object_property_set_bool(OBJECT(&opb->fsi), "realized", true, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    memory_region_add_subregion(&opb->mr, 0x80000000, &opb->fsi.iomem);
+
+    /* OPB2FSI region */
+    /*
+     * Avoid endianness issues by mapping each slave's memory region directly.
+     * Manually bridging multiple address-spaces causes endian swapping
+     * headaches as memory_region_dispatch_read() and
+     * memory_region_dispatch_write() correct the endianness based on the
+     * target machine endianness and not relative to the device endianness on
+     * either side of the bridge.
+     */
+    /*
+     * XXX: This is a bit hairy and will need to be fixed when I sort out the
+     * bus/slave relationship and any changes to the CFAM modelling (multiple
+     * slaves, LBUS)
+     */
+    memory_region_add_subregion(&opb->mr, 0xa0000000, &opb->fsi.opb2fsi);
+}
+
+static void opb_init(Object *o)
+{
+    OPBus *opb = OP_BUS(o);
+
+    object_initialize_child(o, "fsi-master", &opb->fsi, TYPE_FSI_MASTER);
+    qdev_set_parent_bus(DEVICE(&opb->fsi), BUS(o), &error_abort);
+}
+
+static void opb_finalize(Object *o)
+{
+    OPBus *opb = OP_BUS(o);
+
+    address_space_destroy(&opb->as);
+}
+
+static void opb_class_init(ObjectClass *klass, void *data)
+{
+    BusClass *bc = BUS_CLASS(klass);
+    bc->realize = opb_realize;
+}
+
+static const TypeInfo opb_info = {
+    .name = TYPE_OP_BUS,
+    .parent = TYPE_BUS,
+    .instance_init = opb_init,
+    .instance_finalize = opb_finalize,
+    .instance_size = sizeof(OPBus),
+    .class_init = opb_class_init,
+    .class_size = sizeof(OPBusClass),
+};
+
+static void opb_register_types(void)
+{
+    type_register_static(&opb_info);
+}
+
+type_init(opb_register_types);
diff --git a/include/hw/fsi/opb.h b/include/hw/fsi/opb.h
new file mode 100644
index 0000000000..f8ce00383e
--- /dev/null
+++ b/include/hw/fsi/opb.h
@@ -0,0 +1,43 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2023 IBM Corp.
+ *
+ * IBM On-Chip Peripheral Bus
+ */
+#ifndef FSI_OPB_H
+#define FSI_OPB_H
+
+#include "exec/memory.h"
+#include "hw/fsi/fsi-master.h"
+
+#define TYPE_OP_BUS "opb"
+OBJECT_DECLARE_SIMPLE_TYPE(OPBus, OP_BUS)
+
+typedef struct OPBus {
+        /*< private >*/
+        BusState bus;
+
+        /*< public >*/
+        MemoryRegion mr;
+        AddressSpace as;
+
+        /* Model OPB as dumb enough just to provide an address-space */
+        /* TODO: Maybe don't store device state in the bus? */
+        FSIMasterState fsi;
+} OPBus;
+
+typedef struct OPBusClass {
+        BusClass parent_class;
+} OPBusClass;
+
+uint8_t opb_read8(OPBus *opb, hwaddr addr);
+uint16_t opb_read16(OPBus *opb, hwaddr addr);
+uint32_t opb_read32(OPBus *opb, hwaddr addr);
+void opb_write8(OPBus *opb, hwaddr addr, uint8_t data);
+void opb_write16(OPBus *opb, hwaddr addr, uint16_t data);
+void opb_write32(OPBus *opb, hwaddr addr, uint32_t data);
+
+void opb_fsi_master_address(OPBus *opb, hwaddr addr);
+void opb_opb2fsi_address(OPBus *opb, hwaddr addr);
+
+#endif /* FSI_OPB_H */
-- 
2.39.2

