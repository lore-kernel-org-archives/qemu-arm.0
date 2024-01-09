Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp673003ejs;
        Tue, 9 Jan 2024 14:25:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCU1AQzj+vhynWcn5EkSFA7lHh/Z6RIQeVhnuUMA3FsCb1XnjEm/lIYH33gwB7gtM7SboH
X-Received: by 2002:ac8:7d4d:0:b0:429:b1f1:5006 with SMTP id h13-20020ac87d4d000000b00429b1f15006mr301611qtb.42.1704839152463;
        Tue, 09 Jan 2024 14:25:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704839152; cv=none;
        d=google.com; s=arc-20160816;
        b=zNZi9HnrznURxTmyZ47zBCD75OA8Cm2KIX6kg2gGEVUYo8SbEI0vBflfhND/QxNhmm
         Th8vBTJbzN52BWHo1s4BgrN/WhH1Z7CuUKwng6HH/9pU/QK6yYixpEPyHRdU9X5zg47d
         4+tq1ZEXU2dSL8s7OqDv1qXK9BsA+VqmAPyNegIUb5aQvsd0UXmknlxa7R4Ae62OXfEb
         HTrf2CYnNd4sGdG3jNGzFWGxLwfgvl9UT2XI1gyG803e5o30JsA4ldMeILDT2a4+AB5C
         AJ63y1GgJWfx4Os8Af2kYtPYFyrUYqVz6lpYMG4D9fpuKN4txbKELbFepNHm0BWvnoH1
         LatQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qVy1gu9DESPjM0g2Fp5VfF4gdAqryGgXBFpVxscAy0M=;
        fh=oCcW8YgO0uPSEPLT85zmruvbAEZ25ywTEvlgBH92cAY=;
        b=e/OBh1aEe28s8QboOEOIbrVfJibYrb2lwCLE+4MjBYYvEWeuJFUgKoujnrb5vLFeXo
         tIbijshMARTudmx9G9Twzhwy7Npa8r4vOagy8KoEhUio9bgkZOPU27YD8NTFzRaWTHv7
         UCpchJ5xZs3xSGtuyGBWMgswkYAAhnvaxsyFTeRaWClRp+RalJNm+LQeZWnROj8UOa2+
         n0kuSsu1Mf+GEOxCHLMdKyP41Ga1wx62qu5o/swLicom83uLGd6WHqEpRRgWmOa9QUH9
         Kq3uq0Sew+vzJQbcHWnoTvPDt+9lTu3/AT1yGZWkAhe7UFr64we3RWhGAGTELZgezrGL
         zY7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=D1tLQsKE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8-20020ac857c8000000b00429b2e2e534si216363qta.389.2024.01.09.14.25.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jan 2024 14:25:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=D1tLQsKE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rNKVu-0006Xb-25; Tue, 09 Jan 2024 17:24:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rNKVr-0006UO-Ty; Tue, 09 Jan 2024 17:23:59 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rNKVp-0002BE-7d; Tue, 09 Jan 2024 17:23:59 -0500
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 409LHsg7022940; Tue, 9 Jan 2024 22:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=qVy1gu9DESPjM0g2Fp5VfF4gdAqryGgXBFpVxscAy0M=;
 b=D1tLQsKESjIbERJcdklW7KWlJ+HkZPXGWY3ilSFJ+UIKMWLsi1eKpJ6akSxfh84hlOIJ
 Qb9uwkiwr9wflaQB89ZZc9kLGg8kMUcnLEKsFbahODDaFuxL2PAsbWWZbgiPjivR3iWf
 X37OSC23pGU46CYfIAfxLDaC1ka3FCjns4RB4HEM88JeBSPwbj4CBezgxuzfMriy9xms
 ZThBFR82r4dna19cRNfENattAMLPKGat0evyzBcOoCJzU0E9hIXGujVKqII9laKhsebS
 lArCPIcuewXpDKPTw2inxbFQh1AcdTigsnwc9uGPX0VCW+S9P8aW4Luxz97ivzxsUxkf gA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vhdx4h28k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jan 2024 22:23:39 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 409MKo8Z022748;
 Tue, 9 Jan 2024 22:23:39 GMT
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vhdx4h27q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jan 2024 22:23:39 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 409JPJJX022859; Tue, 9 Jan 2024 22:23:37 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vfj6nhgbe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Jan 2024 22:23:37 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com
 [10.241.53.101])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 409MNbZn24117920
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Jan 2024 22:23:37 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1028E58051;
 Tue,  9 Jan 2024 22:23:37 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B8545805E;
 Tue,  9 Jan 2024 22:23:36 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue,  9 Jan 2024 22:23:36 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@codeconstruct.com.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v9 02/10] hw/fsi: Introduce IBM's FSI Bus
Date: Tue,  9 Jan 2024 16:23:25 -0600
Message-Id: <20240109222333.1225031-3-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240109222333.1225031-1-ninad@linux.ibm.com>
References: <20240109222333.1225031-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: G4-Tydr12K_3Q9zapebXH0PgWO9IdMw5
X-Proofpoint-ORIG-GUID: 2nOHv0ZFcZtmYfoxODxD9nzUKmzLqcqX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-09_11,2024-01-09_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 mlxscore=0 clxscore=1015 bulkscore=0 adultscore=0 mlxlogscore=671
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401090179
Received-SPF: pass client-ip=148.163.156.1; envelope-from=ninad@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
X-TUID: tlxFr6IXddna

This is a part of patchset where FSI bus is introduced.

The FSI bus is a simple bus where FSI master is attached.

[ clg: - removed include/hw/fsi/engine-scratchpad.h and
       	 hw/fsi/engine-scratchpad.c
       - dropped FSI_SCRATCHPAD
       - included FSIBus definition
       - dropped hw/fsi/trace-events changes ]

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 include/hw/fsi/fsi.h | 19 +++++++++++++++++++
 hw/fsi/fsi.c         | 22 ++++++++++++++++++++++
 hw/fsi/Kconfig       |  3 +++
 hw/fsi/meson.build   |  1 +
 4 files changed, 45 insertions(+)
 create mode 100644 include/hw/fsi/fsi.h
 create mode 100644 hw/fsi/fsi.c

diff --git a/include/hw/fsi/fsi.h b/include/hw/fsi/fsi.h
new file mode 100644
index 0000000000..a75e3e5bdc
--- /dev/null
+++ b/include/hw/fsi/fsi.h
@@ -0,0 +1,19 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2023 IBM Corp.
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
+#endif
diff --git a/hw/fsi/fsi.c b/hw/fsi/fsi.c
new file mode 100644
index 0000000000..8dca472bc3
--- /dev/null
+++ b/hw/fsi/fsi.c
@@ -0,0 +1,22 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Copyright (C) 2023 IBM Corp.
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
diff --git a/hw/fsi/Kconfig b/hw/fsi/Kconfig
index e650c660f0..f4869c209f 100644
--- a/hw/fsi/Kconfig
+++ b/hw/fsi/Kconfig
@@ -1,2 +1,5 @@
+config FSI
+    bool
+
 config FSI_LBUS
     bool
diff --git a/hw/fsi/meson.build b/hw/fsi/meson.build
index 4074d3a7d2..487fb31cbc 100644
--- a/hw/fsi/meson.build
+++ b/hw/fsi/meson.build
@@ -1 +1,2 @@
 system_ss.add(when: 'CONFIG_FSI_LBUS', if_true: files('lbus.c'))
+system_ss.add(when: 'CONFIG_FSI', if_true: files('fsi.c'))
-- 
2.39.2

