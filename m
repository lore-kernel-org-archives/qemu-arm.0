Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp298329lfm;
        Tue, 21 Jul 2020 20:56:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqVwOJwSAAMIucQLUGemcOoI4RJyHBC7dLMaF7AKtYBS3j8yY0+AagRW7/z7ce9ygNRyLk
X-Received: by 2002:a25:d807:: with SMTP id p7mr48535739ybg.229.1595390172271;
        Tue, 21 Jul 2020 20:56:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595390172; cv=none;
        d=google.com; s=arc-20160816;
        b=W8Rl3IQMiFMqmlIeZ9c4CGyNCATd1YAk+kJvSLNszCtDV3KcHIYQguk9lH+vylJexO
         pmckMDDINkc36LqbHqvgRBFKQMlFicEAJi2ch+Om+gn/P/jqWz37InA14q1HOZ//fRK7
         HyJlW0J4Hyz6JBZx5lc9A/aE7ChfIBDMptv5+ZJPUb2G59lx1NJNlW7JUZwDCTobSEm7
         EvZwZ6iQUdDWYnoMQ+09PL34wn8nUv+7LaxK9TU43bsrBV57qAcn2YIuOy7am6LYSihf
         x7qnoMSlquZ0NYh2+syKZSf0Uf+6vCRIyuG8Qg1RI/W8j8ReQhz/yWQJblQ1A8uX3L2j
         +GVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=4/ZXk2uzinh3mFPQeipdQX2bi5/oYg/AjruIk3pJ9bc=;
        b=EvzTyjiwHwoX5lz60Dx7gbKwyWLpRvMeLo53S7+kcr2WjfOfNbxiA+FUDFUCGAkrAP
         zdF5FC2A9qRstgmCF6vFEvuZBFPy67HR+y+EuV+aXhGyHvDoPPpUL0ZljhwDd4v/56Il
         h1cQUih/TA5ZIxv33/4+dtXi/NohWI+yp2cYDmNLl/uHvgi9ZGyGcauHrGhCMdSZ8SCl
         nEVLDu6DdPwSypJNz+bLDRWzvAf1NRThWaJO4Te3KvDVyk7M3W7WKHaNaVAsJZavRIcW
         /QrsjwJdCTiZF5QZ6EK/QyKcx9zN9nZkLzkLT0YN1yB+yFjToy8dmJcufd/WpyAuBIu2
         scgw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d38si21388903ybe.239.2020.07.21.20.56.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jul 2020 20:56:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:43650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jy5rX-0005gs-Ly
	for alex.bennee@linaro.org; Tue, 21 Jul 2020 23:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bauerman@linux.ibm.com>)
 id 1jy5nv-00072h-U1; Tue, 21 Jul 2020 23:52:27 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49054
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bauerman@linux.ibm.com>)
 id 1jy5nu-0003zg-8u; Tue, 21 Jul 2020 23:52:27 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06M3XAIK155504; Tue, 21 Jul 2020 23:52:07 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32e1vrk0x4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 23:52:07 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06M3XTY0156167;
 Tue, 21 Jul 2020 23:52:07 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32e1vrk0wq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 23:52:06 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06M3oEc9002721;
 Wed, 22 Jul 2020 03:52:05 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 32brq9gx2y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 03:52:05 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06M3q43i40304936
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 03:52:04 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C849CAE062;
 Wed, 22 Jul 2020 03:52:04 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 731D8AE060;
 Wed, 22 Jul 2020 03:51:58 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.163.58.88])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 22 Jul 2020 03:51:58 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: qemu-ppc@nongnu.org
Subject: [RFC PATCH v2 7/9] sparc/sun4m: Don't set CPUState::halted in
 cpu_devinit()
Date: Wed, 22 Jul 2020 00:50:14 -0300
Message-Id: <20200722035016.469075-8-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200722035016.469075-1-bauerman@linux.ibm.com>
References: <20200722035016.469075-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_01:2020-07-21,
 2020-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=1 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007220022
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=bauerman@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 23:52:01
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e+u/zHBrkvlN

Remove setting of cs->halted from cpu_devinit(), which seems out of place
when compared to similar code in other architectures (e.g., ppce500_init()
in hw/ppc/e500.c).

Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 hw/sparc/sun4m.c | 1 -
 1 file changed, 1 deletion(-)

NB: I was only able to test that this patch builds. I wasn't able to
run it.

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 766e79bb5e..7b3042a801 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -831,7 +831,6 @@ static void cpu_devinit(const char *cpu_type, unsigned int id,
     } else {
         qemu_register_reset(secondary_cpu_reset, cpu);
         cs = CPU(cpu);
-        cs->halted = 1;
         object_property_set_bool(OBJECT(cs), "start-powered-off", true,
                                  &error_abort);
     }
