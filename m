Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp297713lfm;
        Tue, 21 Jul 2020 20:54:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlAWsjRUwgx3vj66M8mZ5mtXx9HHNJXflCfFxtR4rB72GUnZuk7gNqAK1v56bDxBAHNecH
X-Received: by 2002:a25:d843:: with SMTP id p64mr50936268ybg.68.1595390094517;
        Tue, 21 Jul 2020 20:54:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595390094; cv=none;
        d=google.com; s=arc-20160816;
        b=iQab4dnINrQXp2BVJUZpcUg+2TX9SIKIYx7aVVFJiJYCErcuhjuhRR8CMzg00x7Ll+
         9SroXAg0ANOgIl8dDegRpPtk+O1hWDOYQDNOYR+WZN0kLsj2lRETluVd5BJ0GsHQo1Bd
         e2NN/cIAmuF5rQ4tkmYi0aDLemWybZOtZAjXachxy0P4LEcNSJipXupSVVkhWgxMBBNo
         TxygoZMyw9Wl0sg1h4ohTdH0wNyK4KF/eWhOqSWP/Ft3fGdzRDY952GNC/d+aQGXIyZc
         AXce01o581Y8LwGaCfiie+8xu67wi49THOZsGZjJ8sPuHJBRtsvDVAGMcBrX/Z5yyRQU
         g7ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=EXnkIJM4ffGhwpGl+Zzluh1JRUVviptYT92Zx61iO6U=;
        b=Yefsb0s8I6eI4sW13mAmGjZMU/mBEkjjl7LnKknuLXvw0j0C1azcx6F0loCVSYlPyV
         Jn4XX5WMKBxDSrzb+ibQO2xdW3qUrAkzaXgmlP1oCO7yo13+b6FmKlDigJb4AF3NFuZL
         UsvyTSHIzwsZNR2M838fccXC2iXMuILMvpn051mShHGU9R411nJYjaKMS/t6CQPFJ7Fa
         NmvcTFlT5YNhBoMz+qfwl7JDnfL4/hCnAY7hk1zOIFYLHHlGFTkMJFkH50YLRcML4lt3
         zSrwZKXL2x1dAb0wqjqAvIC3flaw893c76ubZXu0+Bs24Kb7gVgb9lK0jWYe/nxsTxxR
         93Ug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v82si21712341ybb.285.2020.07.21.20.54.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jul 2020 20:54:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:37626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jy5qH-0003Cc-TV
	for alex.bennee@linaro.org; Tue, 21 Jul 2020 23:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bauerman@linux.ibm.com>)
 id 1jy5o3-0007NQ-Ub; Tue, 21 Jul 2020 23:52:35 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:61406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bauerman@linux.ibm.com>)
 id 1jy5o2-00042x-2N; Tue, 21 Jul 2020 23:52:35 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06M3WZvE140269; Tue, 21 Jul 2020 23:52:13 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32bvqw7gfv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 23:52:13 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06M3WuY5140990;
 Tue, 21 Jul 2020 23:52:12 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32bvqw7gfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 23:52:12 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06M3pEej008617;
 Wed, 22 Jul 2020 03:52:11 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02wdc.us.ibm.com with ESMTP id 32brq98r96-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 03:52:11 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06M3qBd453477664
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 03:52:11 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE31FAE05C;
 Wed, 22 Jul 2020 03:52:10 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50911AE060;
 Wed, 22 Jul 2020 03:52:05 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.163.58.88])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 22 Jul 2020 03:52:05 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: qemu-ppc@nongnu.org
Subject: [RFC PATCH v2 8/9] sparc/sun4m: Use one cpu_reset() function for main
 and secondary CPUs
Date: Wed, 22 Jul 2020 00:50:15 -0300
Message-Id: <20200722035016.469075-9-bauerman@linux.ibm.com>
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
 mlxlogscore=999 spamscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=1 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007220022
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=bauerman@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 23:51:27
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
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
X-TUID: zdUzHickN9Qw

If we rely on cpu_common_reset() setting CPUState::halted according to the
start-powered-off property, both reset functions become equivalent and we
can use only one.

Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 hw/sparc/sun4m.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

NB: I was only able to test that this patch builds. I wasn't able to
run it.

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 7b3042a801..deb5e9f027 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -218,16 +218,7 @@ static void dummy_cpu_set_irq(void *opaque, int irq, int level)
 {
 }
 
-static void main_cpu_reset(void *opaque)
-{
-    SPARCCPU *cpu = opaque;
-    CPUState *cs = CPU(cpu);
-
-    cpu_reset(cs);
-    cs->halted = 0;
-}
-
-static void secondary_cpu_reset(void *opaque)
+static void sun4m_cpu_reset(void *opaque)
 {
     SPARCCPU *cpu = opaque;
     CPUState *cs = CPU(cpu);
@@ -818,7 +809,6 @@ static const TypeInfo ram_info = {
 static void cpu_devinit(const char *cpu_type, unsigned int id,
                         uint64_t prom_addr, qemu_irq **cpu_irqs)
 {
-    CPUState *cs;
     SPARCCPU *cpu;
     CPUSPARCState *env;
 
@@ -826,12 +816,9 @@ static void cpu_devinit(const char *cpu_type, unsigned int id,
     env = &cpu->env;
 
     cpu_sparc_set_id(env, id);
-    if (id == 0) {
-        qemu_register_reset(main_cpu_reset, cpu);
-    } else {
-        qemu_register_reset(secondary_cpu_reset, cpu);
-        cs = CPU(cpu);
-        object_property_set_bool(OBJECT(cs), "start-powered-off", true,
+    qemu_register_reset(sun4m_cpu_reset, cpu);
+    if (id != 0) {
+        object_property_set_bool(OBJECT(cpu), "start-powered-off", true,
                                  &error_abort);
     }
     *cpu_irqs = qemu_allocate_irqs(cpu_set_irq, cpu, MAX_PILS);
