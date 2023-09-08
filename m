Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp722364ejb;
        Fri, 8 Sep 2023 15:30:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESU/FNI7CyzavBHuB3Zf1bT+Sk2xxDmP0SGF0v5XLci99R5z8aQ1AZR2sQceZxdT06izSQ
X-Received: by 2002:a0c:e0d0:0:b0:64f:6c68:4463 with SMTP id x16-20020a0ce0d0000000b0064f6c684463mr3500185qvk.11.1694212214327;
        Fri, 08 Sep 2023 15:30:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694212214; cv=none;
        d=google.com; s=arc-20160816;
        b=lPPz5tEtDuMwwUYr9b8QLPQZPAPwxklEtmBsamttQrPXIRDeWFHG+ozcr9tMEelD4V
         OjPXwTspUJsYGxLPWstxNMxlOBtBiNexcx3+NgwQoo7trZcqvDvK36HziTwGVxctsJaQ
         kmL9OxowAe/GlySwzVu8TshrTkm2IxEtbyHe3tXJ2VB21ZoDa7AMDYXMbhnBwMduW9mE
         3G9nDUCRGgUsrHX2gYvJKTh9sbbydLxc/lk8uzbo1bS2XpEvTXSzHTHyv3aQ6rcx0Aq3
         FwZrJYC2JnvfsPFJyOk/WMFAHpNYcqvqmIUfo+JU07MioVVmHfSRuJP5VFIzoUZ91iyN
         uovw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kSKQCPO7vZyGTofQD7lTXoQyaIqWnQcwmBVQHUDX3bA=;
        fh=/Ww3feT/iFt+UtShtcSrm/ZkK0mSMJwi4QyqgqL+GT0=;
        b=LI3sfE7ZA56Rsp9yT1PJGJS4LP17VtVo0yioLshcCIGyaIQgj6Liy/jFDSsA2VpTwu
         B2UI3H3ZnVOASmpbmzeON+5feLVRp60WRBv75PAb+cP/5DZuOSRNHpuCyIWqHhrJXzea
         i51TTkqSozKkGu+azujpqW4DhGimZdyDw9pdHdPQPJ3fe5xc1YhyxI1ngZ3lHXE/6cAG
         1r5m2/uh4uYVMOEQMjh9qBUNth0xO/VUQ/wqVZlA8ci1nqsYBQ3u5Oguq7gNgIBneuCj
         8NYqSCggqIp1wahuBB3wuIuP68Kq8OyGZsuK9ZtwrTkY29z1sB6jEgwY0CRoaXg+mHlV
         U8hQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=izS4YQ77;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h30-20020a0cab1e000000b0063d27c74571si1672481qvb.149.2023.09.08.15.30.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 15:30:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=izS4YQ77;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qejyj-0001bo-9l; Fri, 08 Sep 2023 18:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qejyh-0001b3-R3; Fri, 08 Sep 2023 18:29:27 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qejye-0003Fc-Hu; Fri, 08 Sep 2023 18:29:27 -0400
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 388M7LBW022618; Fri, 8 Sep 2023 22:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=kSKQCPO7vZyGTofQD7lTXoQyaIqWnQcwmBVQHUDX3bA=;
 b=izS4YQ775WorIPVmPO7jUoEUVyQ+zP/GQBXecD2FEWXJRxaId88myT6SZDuqojaca/HG
 qg18tjHsXnXIkYMbXFiivPdMOsoFcfTneq6uNSIEHOhwMOVUpK/5X748Pgpqekj9Zd+F
 aPU3xL5EWJMDNN3wy59FSWYgckGnQcI5gYpGAu6PBjGRbPR0uV23LXopvKdVHDgCudnz
 2a0xzvEfmfbFEFhvPZZCwMuoDnpxy+tP3neoR6gIdHlJEqQbB1yZ6+fHxfju94o2olsQ
 b5+N1lKcZeOt1VYcpV73IEa0pEI9Wf9NLECpnbpIeETUfWNSxDSaH/P17z7kuWvtBIQw EA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t0bv5913p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Sep 2023 22:29:15 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 388MJ0ts018862;
 Fri, 8 Sep 2023 22:29:14 GMT
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t0bv5913a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Sep 2023 22:29:14 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 388KcDkf006603; Fri, 8 Sep 2023 22:29:14 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3svgvm70vq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Sep 2023 22:29:14 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com
 [10.241.53.102])
 by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 388MTDKp66060708
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Sep 2023 22:29:13 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EB3F58056;
 Fri,  8 Sep 2023 22:29:13 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E399458063;
 Fri,  8 Sep 2023 22:29:12 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
 by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Fri,  8 Sep 2023 22:29:12 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: qemu-devel@nongnu.org, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joel@jms.id.au, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org
Subject: [PATCH v4 10/10] hw/fsi: Update MAINTAINER list
Date: Fri,  8 Sep 2023 17:28:59 -0500
Message-Id: <20230908222859.3381003-11-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230908222859.3381003-1-ninad@linux.ibm.com>
References: <20230908222859.3381003-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hAqyFAwr9Y4ETvJjckEOYhSzSLd4zHiv
X-Proofpoint-ORIG-GUID: 5F4TRhER8XET8mssmHH0TEungnjRA7-f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_18,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=907
 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309080201
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
X-TUID: NJSxs0L8hD4u

Added maintainer for IBM FSI model

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
V4:
  - Added separate commit for MAINTAINER change.
---
 MAINTAINERS | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6111b6b4d9..285f3a3bc9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3395,6 +3395,28 @@ F: tests/qtest/adm1272-test.c
 F: tests/qtest/max34451-test.c
 F: tests/qtest/isl_pmbus_vr-test.c
 
+FSI
+M: Ninad Palsule <ninad@linux.ibm.com>
+S: Maintained
+F: hw/fsi/aspeed-apb2opb.c
+F: hw/fsi/cfam.c
+F: hw/fsi/fsi.c
+F: hw/fsi/fsi-slave.c
+F: hw/fsi/opb.c
+F: hw/fsi/engine-scratchpad.c
+F: hw/fsi/fsi-master.c
+F: hw/fsi/lbus.c
+F: include/hw/fsi/aspeed-apb2opb.h
+F: include/hw/fsi/cfam.h
+F: include/hw/fsi/fsi.h
+F: include/hw/fsi/fsi-slave.h
+F: include/hw/fsi/opb.h
+F: include/hw/fsi/engine-scratchpad.h
+F: include/hw/fsi/fsi-master.h
+F: include/hw/fsi/lbus.h
+F: docs/specs/fsi.rst
+F: tests/qtest/fsi-test.c
+
 Firmware schema specifications
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
 R: Daniel P. Berrange <berrange@redhat.com>
-- 
2.39.2

