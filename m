Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp793626ejc;
        Fri, 26 Jan 2024 02:50:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMoGUWJt/ReIkHRFyAI8w8M2fqI4EZC2Ew33RmQBCreoUk/W7JD/XochWMzoWbBMo984g0
X-Received: by 2002:a0c:f510:0:b0:67f:62e5:bf17 with SMTP id j16-20020a0cf510000000b0067f62e5bf17mr993989qvm.34.1706266256129;
        Fri, 26 Jan 2024 02:50:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706266256; cv=none;
        d=google.com; s=arc-20160816;
        b=aupqmnUMHH9aislOc3/Y1qN6SmY7pLNS/UZQjeEME01wdBfL90jujleY94DjjEkdsA
         ykH2PqswIjvRjDJCWaQWk+E08Git/KPJSoybcbnlJoHBVpOsskzrfqMt8AvSaptokCmU
         HdCXxTIfD8whvLHGd/bMb0/Jnq7ZLhEspE0Ge/+gWLopoJYPsIlieWdgUAvdmYxFeP09
         aercva/EWQLEG6h3MA3Ledo+yRyD0rsXpM+YkzulZyX3yWRw/9ljOejy7dXa4LXrLj9y
         /Nj6LbQNRUIrYMOzGGPDFsi0MT595Z4bdac8xkHBQvKqSP382+SbBi4GYs3nAqTICITG
         cYSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gytrUlfFJFBs659QKOtPZ4lJ13+baI6s6eg+lrAyw/w=;
        fh=oCcW8YgO0uPSEPLT85zmruvbAEZ25ywTEvlgBH92cAY=;
        b=t01rL0kX++SGVssisFaAi5TL1j68QtPBU6Y/ISB63gfr46Jg+mbYNMDA487st/Sm6q
         zwmZoycY3OcsmS6/XHpJ9HZxexTnwIrfjMefwEzF+Si9liMtnT6zB+qv91jfPR/ywtgA
         wH0zp65WVvHCCaMZQeBnw9dGepCKGWFAjTmQPZQdlhyYy1TMZyN/Mh2DP5CtYYawUTRH
         V2w8PvZbdkdCS3cUpKuCOBzrZ8tocsh2QRprxJTpLVFLY4JuwmQNOPeUTdjYfmJ+Ek3p
         LuedSG+Yor4nrpwsw525lJCDwkVqw9mZnq1OlZv7YCbi4UVp0Zd8E/P6tP7lsj70SHa9
         PuSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=QU0qJ7wq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id im6-20020a056214246600b0067a8bf10affsi1069872qvb.220.2024.01.26.02.50.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 02:50:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=QU0qJ7wq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTJnA-0004gw-Dd; Fri, 26 Jan 2024 05:50:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rTJn1-0004Yk-Q3; Fri, 26 Jan 2024 05:50:27 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rTJmy-00068R-AF; Fri, 26 Jan 2024 05:50:27 -0500
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 40QAlNeT016904; Fri, 26 Jan 2024 10:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=gytrUlfFJFBs659QKOtPZ4lJ13+baI6s6eg+lrAyw/w=;
 b=QU0qJ7wqFcryOr/vfqvd3cZr+2ZRe+yqD0HBa13Fu1+DDFy5Me7osuJxhIdzofvYT8jZ
 ZzQE4xO2xjh2BAy20Sq6/r3jjynMSCbIYnOfTPvpjTYAi1HtpvSFVV/JyLYkJOKK9Rfa
 996Iq1U3dRHw4MksMDfm/83gu8zG7MUvJ9SLM8YFQeBTpmFlqkN+wrZtR1mf9cMTLOWZ
 QTbkXbSRGN3ggoQQJH7XKQjsoAkW6T0II2Y0k+5j/uxIqgFIv1IpO2hQfrYFP37uEWez
 6to1rIIGahwu5ZH0cME/JGLL5ygD0xOokxCb0VeTzlQ2P8OfKuzJ949lSUbgCerXuD90 XA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vvb9ug1hk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 10:50:05 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40QAo4NO024350;
 Fri, 26 Jan 2024 10:50:04 GMT
Received: from ppma22.wdc07v.mail.ibm.com
 (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vvb9ug1h3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 10:50:04 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 40Q86Tgx010854; Fri, 26 Jan 2024 10:50:04 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
 by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vrrw0ab7d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 10:50:04 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 40QAo2su4391920
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jan 2024 10:50:03 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA9F558053;
 Fri, 26 Jan 2024 10:50:02 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00D9258043;
 Fri, 26 Jan 2024 10:50:02 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jan 2024 10:50:01 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@codeconstruct.com.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v12 03/11] hw/fsi: Introduce IBM's FSI Bus
Date: Fri, 26 Jan 2024 04:49:48 -0600
Message-Id: <20240126104956.74126-4-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126104956.74126-1-ninad@linux.ibm.com>
References: <20240126104956.74126-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cSr6B80ZalOHi3CgdvSikvjJSLtPysbb
X-Proofpoint-GUID: Qd9bKOwph5cWBQKS35EkNeZjFaTbD5gI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=605 adultscore=0 classifier=spam adjust=0 reason=mlx
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
X-TUID: eHS9hQ0nXqgv

This is a part of patchset where FSI bus is introduced.

The FSI bus is a simple bus where FSI master is attached.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
[ clg: - removed include/hw/fsi/engine-scratchpad.h and
       	 hw/fsi/engine-scratchpad.c
       - dropped FSI_SCRATCHPAD
       - included FSIBus definition
       - dropped hw/fsi/trace-events changes ]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
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

