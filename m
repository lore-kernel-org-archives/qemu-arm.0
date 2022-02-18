Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp537825lfq;
        Fri, 18 Feb 2022 00:20:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4ONjqlJrQi6DJ2fm9bgyqWKKsNfozNg7OPWkyeohNfbSx5ZYD44DPFxeMzLra9UnPRxgD
X-Received: by 2002:a05:6214:966:b0:42c:f983:b9c6 with SMTP id do6-20020a056214096600b0042cf983b9c6mr5057020qvb.107.1645172403911;
        Fri, 18 Feb 2022 00:20:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645172403; cv=none;
        d=google.com; s=arc-20160816;
        b=bHidTermX+8FPtWmfIMck9+hdBbXlWfvm0ZDTcxHrIRdTnskK9eteEjAeJUV6tZO9f
         vP4SSPCXsd1LtApTxuDXG1JI/RXKnkid/YxH8BU30fWszh1cvCqs2IV09HzBx6fDEVBX
         anXeNaEffj75JgngpIdZkK8X5YXlpgeeTA+t1RlDMkIpcTcRlQI7NQUxbez0qxedHsjK
         bG5qZLW/2jsDjLExkGQ9Ow6qqP+SvQJAwFN4ZzcOiRvkBjcHt9lL/M1CnmVGVtadiBDX
         sGEV9qBdGc+YPK3rOM0gjMzFxDLF0DFMgoCnINZX8PYwvA9VPJkYgYYv+dtgEPfcPWKk
         ELmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=92+xqn5RqpzX7I+kTm2ibzrQpUaaBiG5ne/wwr9n7G0=;
        b=oDWqTxbFKlkeuqjT7EhuVZOz6Q2fo0KhaAherYvY3L1+CgJKR1h+z/aMjcJ+9I6dgU
         R3e5057wAJ5xtKPMUwhwIOqRJbvLhlhU0D+nJwi4gxpzLvysvGhacWECOoyAUv0V5Yo1
         2bHC1UeLZz8Y6m9rk/5/JsTsjTEw5aEcRPcv1OWAJbLMWHIpfZBo8yOUkHMQ8xzcKUPP
         RiJDrtd5TJ9F/sJTsEjuepYFRtNjKlusf1dprmALVnkdwaGOS45XJKg6t7yve8+6u8aH
         Ou0z/cM3OXfshAqJydUU4OF7ASsAzRHcmzeVZl0oAyYWmNTBl3RkVO/+ezb4zsB3Yx74
         sZQg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x144si76929qkb.730.2022.02.18.00.20.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Feb 2022 00:20:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nKyUl-00085S-Cx
	for alex.bennee@linaro.org; Fri, 18 Feb 2022 03:20:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKyTP-00078C-Q6; Fri, 18 Feb 2022 03:18:40 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:22216
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKyTO-0000ZF-Ac; Fri, 18 Feb 2022 03:18:39 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21I5b6bj028526; 
 Fri, 18 Feb 2022 08:18:28 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ea55jk894-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 08:18:28 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21I8C193013019;
 Fri, 18 Feb 2022 08:18:25 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3e64haremt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Feb 2022 08:18:25 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21I8IM9b45154574
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Feb 2022 08:18:23 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDBBCA4053;
 Fri, 18 Feb 2022 08:18:22 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99EC9A4051;
 Fri, 18 Feb 2022 08:18:22 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 18 Feb 2022 08:18:22 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.87.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id DEE982201E5;
 Fri, 18 Feb 2022 09:18:21 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 7/7] aspeed/sdmc: Add trace events
Date: Fri, 18 Feb 2022 09:18:15 +0100
Message-Id: <20220218081815.641169-8-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218081815.641169-1-clg@kaod.org>
References: <20220218081815.641169-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -pbdpVYJ0i_6InfmaH0M9akBWFKrShoW
X-Proofpoint-ORIG-GUID: -pbdpVYJ0i_6InfmaH0M9akBWFKrShoW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-18_03,2022-02-17_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxlogscore=658
 priorityscore=1501 spamscore=0 mlxscore=0 phishscore=0 clxscore=1034
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202180051
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.187,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /tegFyP4by5u

This is useful to analyze changes in the U-Boot RAM driver when SDRAM
training is performed.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_sdmc.c | 2 ++
 hw/misc/trace-events  | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 08f856cbda7e..d2a3931033b3 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -130,6 +130,7 @@ static uint64_t aspeed_sdmc_read(void *opaque, hwaddr=
 addr, unsigned size)
         return 0;
     }
=20
+    trace_aspeed_sdmc_read(addr, s->regs[addr]);
     return s->regs[addr];
 }
=20
@@ -148,6 +149,7 @@ static void aspeed_sdmc_write(void *opaque, hwaddr ad=
dr, uint64_t data,
         return;
     }
=20
+    trace_aspeed_sdmc_write(addr, data);
     asc->write(s, addr, data);
 }
=20
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 1c373dd0a4c5..c3fc9fecbe34 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -205,6 +205,10 @@ aspeed_i3c_write(uint64_t offset, uint64_t data) "I3=
C write: offset 0x%" PRIx64
 aspeed_i3c_device_read(uint32_t deviceid, uint64_t offset, uint64_t data=
) "I3C Dev[%u] read: offset 0x%" PRIx64 " data 0x%" PRIx64
 aspeed_i3c_device_write(uint32_t deviceid, uint64_t offset, uint64_t dat=
a) "I3C Dev[%u] write: offset 0x%" PRIx64 " data 0x%" PRIx64
=20
+# aspeed_sdmc.c
+aspeed_sdmc_write(uint32_t reg, uint32_t data) "reg @0x%" PRIx32 " data:=
 0x%" PRIx32
+aspeed_sdmc_read(uint32_t reg, uint32_t data) "reg @0x%" PRIx32 " data: =
0x%" PRIx32
+
 # bcm2835_property.c
 bcm2835_mbox_property(uint32_t tag, uint32_t bufsize, size_t resplen) "m=
box property tag:0x%08x in_sz:%u out_sz:%zu"
=20
--=20
2.34.1

