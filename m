Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp642691ejc;
        Thu, 25 Jan 2024 19:41:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvLXUAbicSLl4rp8nT7Z5+EtuQ4U5CawfbtbbsgI1Yg90/+xWpDQIi7ibyfgPen0bWYL4W
X-Received: by 2002:a05:622a:1c4:b0:42a:4c59:43fe with SMTP id t4-20020a05622a01c400b0042a4c5943femr863377qtw.102.1706240501381;
        Thu, 25 Jan 2024 19:41:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706240501; cv=none;
        d=google.com; s=arc-20160816;
        b=AbCHfdR8RUo2fZER8skrZtTCi3nHZjU6D2880KuMMJf5hs3+LRnNPvrmCnNWSFGRc0
         iDlqCpk0HxjmTNS3vlnlvhMGKP7JvmSl8M7EmzuRLz8gKSt4fM9xh6aPGD7VaZpQvxhf
         XVb91OXUQswpbn8ZSBfhV/jNxCqNIO6RSTcOJNSXJjgTYejXHEoQO0MmKgohSZ8uQqek
         +mhn860jaI0cPOwIhcllx1lfBZhXJwclz83EENpv9fqJG0zvezBH8AZN9UCizc7VVUPX
         Ori9z+A57VNQY5Zd8qIbhDbsWhAG9vvWREFf/ekeAM4Qnusl6ofmsE7+aELtRdcCrmPS
         obCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Lb12eo0TCXkBl1ZxMZIUwJQLB6il4Zanesrv81jlf7E=;
        fh=oCcW8YgO0uPSEPLT85zmruvbAEZ25ywTEvlgBH92cAY=;
        b=vezGVJGS2G8DA5kL63M4ObIxvbkof2AM1C7Eei0tu1uOrRZwm+XER/AYIgsLny/miB
         oiXqXIrpuKptWJ0qDMOKbWnqpqclFXAenn73Uk530nKaY43ieYQ/Fg7+4JaYkfgHJGDc
         PCMtsO0w60ubiu5QVyqdP0B/1DAnzjipYGD2IDin8v/2tJMcjigDTvgt6bxDpsHdkZZl
         69J6uMXEqc4J9P4nazhbrQug/nPpXUci803OuVyewvCJvxK9gF1C3SUIz1hCskIMh0ke
         3h38LYBARsOMgLg1nM4RvuatKhFO9Yb6QNoTwzgrBs7CpKEFYdqtd2o1jJszm3WvEkxs
         /w4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=AI8AI8aH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h22-20020ac85856000000b0042a2f36a973si337530qth.76.2024.01.25.19.41.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jan 2024 19:41:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=AI8AI8aH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rTD5F-0004bP-AU; Thu, 25 Jan 2024 22:40:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rTD5C-0004X7-Pj; Thu, 25 Jan 2024 22:40:46 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rTD5A-0003NW-S2; Thu, 25 Jan 2024 22:40:46 -0500
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 40Q2OTRR007976; Fri, 26 Jan 2024 03:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Lb12eo0TCXkBl1ZxMZIUwJQLB6il4Zanesrv81jlf7E=;
 b=AI8AI8aH+DxwHMhqc+fjTH25J7NswG74OJanOCtGfZP2zovbi6Uu250h/9zYMVBb4Ncy
 sjeMvcl+bG7ljCB91GMBXEt8oPnCD3VKHVB39EwT1USUsCfUcfTkIbXfHgAyItd03G2g
 Es1Hc6Ahh6XYc6AO6hhGGgfxmhqiwgv0DpNraT5pAqHbn35fFdhAi/YJnElTpZXUbhpk
 N9xaa/zWAkNP2idgQCmrOvbNs4E4sXByd1UX59fhYxAILrHIi4HmLqDPTdc96GPQguJF
 S/wRHVkgYcDlYzHDn/pOXSMGZfTNaTJlpgqGfckUcNb9/6j9xiJvp4yULDT/Vx8P0tlS ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vv2t1at0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 03:40:32 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40Q3UTMN006824;
 Fri, 26 Jan 2024 03:40:31 GMT
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vv2t1at02-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 03:40:31 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 40Q10NvA025637; Fri, 26 Jan 2024 03:40:30 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vrsgpgfmc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 03:40:30 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 40Q3eUj418219594
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jan 2024 03:40:30 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2FD5C5805D;
 Fri, 26 Jan 2024 03:40:30 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2F6D58043;
 Fri, 26 Jan 2024 03:40:29 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jan 2024 03:40:29 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@codeconstruct.com.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v11 03/11] hw/fsi: Introduce IBM's FSI Bus
Date: Thu, 25 Jan 2024 21:40:18 -0600
Message-Id: <20240126034026.31068-4-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126034026.31068-1-ninad@linux.ibm.com>
References: <20240126034026.31068-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 29lY_DSwkU8qNtx9WTH1qx8exlWs9Wrt
X-Proofpoint-GUID: YdqzujI5PZ3yCZfyd6SIQZi9mACmrgzN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=577 spamscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401260024
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
X-TUID: 5621JpFfjaq3

This is a part of patchset where FSI bus is introduced.

The FSI bus is a simple bus where FSI master is attached.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
[ clg: - removed include/hw/fsi/engine-scratchpad.h and
       	 hw/fsi/engine-scratchpad.c
       - dropped FSI_SCRATCHPAD
       - included FSIBus definition
       - dropped hw/fsi/trace-events changes ]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
v11:
  - Split the patch.
---
 include/hw/fsi/fsi.h | 19 +++++++++++++++++++
 hw/fsi/fsi.c         | 22 ++++++++++++++++++++++
 hw/fsi/meson.build   |  2 +-
 3 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/fsi/fsi.h
 create mode 100644 hw/fsi/fsi.c

diff --git a/include/hw/fsi/fsi.h b/include/hw/fsi/fsi.h
new file mode 100644
index 0000000000..50e8f5c888
--- /dev/null
+++ b/include/hw/fsi/fsi.h
@@ -0,0 +1,19 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2024 IBM Corp.
+ *
+ * IBM Flexible Service Interface
+ */
+#ifndef FSI_FSI_H
+#define FSI_FSI_H
+
+#include "hw/qdev-core.h"
+
+#define TYPE_FSI_BUS "fsi.bus"
+OBJECT_DECLARE_SIMPLE_TYPE(FSIBus, FSI_BUS)
+
+typedef struct FSIBus {
+    BusState bus;
+} FSIBus;
+
+#endif /* FSI_FSI_H */
diff --git a/hw/fsi/fsi.c b/hw/fsi/fsi.c
new file mode 100644
index 0000000000..60cb03f7a2
--- /dev/null
+++ b/hw/fsi/fsi.c
@@ -0,0 +1,22 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2024 IBM Corp.
+ *
+ * IBM Flexible Service Interface
+ */
+#include "qemu/osdep.h"
+
+#include "hw/fsi/fsi.h"
+
+static const TypeInfo fsi_bus_info = {
+    .name = TYPE_FSI_BUS,
+    .parent = TYPE_BUS,
+    .instance_size = sizeof(FSIBus),
+};
+
+static void fsi_bus_register_types(void)
+{
+    type_register_static(&fsi_bus_info);
+}
+
+type_init(fsi_bus_register_types);
diff --git a/hw/fsi/meson.build b/hw/fsi/meson.build
index 93ba19dd04..574f5f9289 100644
--- a/hw/fsi/meson.build
+++ b/hw/fsi/meson.build
@@ -1 +1 @@
-system_ss.add(when: 'CONFIG_FSI', if_true: files('lbus.c'))
+system_ss.add(when: 'CONFIG_FSI', if_true: files('lbus.c','fsi.c'))
-- 
2.39.2

