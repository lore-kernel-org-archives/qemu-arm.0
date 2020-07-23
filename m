Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1282178lfm;
        Wed, 22 Jul 2020 19:58:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvD4N8sdBPPK4yoAVHM+urUD2wiTLxnRaQh9mq97ePoQ6x1PHRUfMdMvq1mIi0Pv/4JjTA
X-Received: by 2002:a17:90a:1b64:: with SMTP id q91mr2201928pjq.119.1595473117457;
        Wed, 22 Jul 2020 19:58:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595473117; cv=none;
        d=google.com; s=arc-20160816;
        b=drhpUlksxMfGEbHhwm1yCulUpeK2RWlMCX1IV56UbcvxzWl8tTz1fLA0W7qcqRBc9r
         /jAhQPfWwFsyRSAFg4GTHV3znhhiC3i3AzCHi/7pMdnRmqcNn/3vNpsncWnHIEoHPwon
         tfUoYRi8oRRTqH/socx/L6ker2ZY2Gg/qSsGc1hy0mw8dtpvSi2076h5cE4sifArz6Vm
         3f4v5dVUcGJ4P+WrR31IJ7+cGtIrC+6xZN40yJMdPqCHVHGz0TGhR4nHNzslSFRWVdY5
         zsBGYYyY7Wb+SSWhRLY5MTGIJYZND2ZhFdsaCirc9/fa9iofCvIzuRIDJa1CgLMs5wQD
         9mig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=121Vlj3F3R//QtwrKEk6iFGTEspJmtgvNuPif74sX+4=;
        b=pVrEkFm6HYyhsBNuBSzwKcAkInXY+D80fvPSmKAMl89GIOBFQZ85GbgYqMEg4ZaVCc
         Ybjz8x7HLJmjYXaR0Q0Dya8/kT3AYc8FEQ31qqFy5D4Q+Zq86agSMkjuWXpeUZMeAPef
         ml1NcjxrwgPOXy8t/E/JKZMrn5oyz8Y5xYWF8qX6vdhDTkOvRrywfdyTshD8B06Fw0+Q
         IcyQq0DEJPJPEUoHVs5PkmPL/UxZbRh0dvIjD9E2dPAMfuu04KLGcILDBIiwV59npNU/
         HZ1jnQOVqfLnEmsMEoqIHLjPEVcc7dZvc7N5cVrqps/FT1QBu7TxQLFG56JbORYjqX5j
         01Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id gp12si990427pjb.43.2020.07.22.19.58.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Jul 2020 19:58:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06N2WV8V195286;
	Wed, 22 Jul 2020 22:58:16 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32f1gt8u68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2020 22:58:16 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06N2sMhW062138;
	Wed, 22 Jul 2020 22:58:16 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32f1gt8u5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2020 22:58:15 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06N2p62a019304;
	Thu, 23 Jul 2020 02:58:14 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
	by ppma03wdc.us.ibm.com with ESMTP id 32brq9h32c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2020 02:58:14 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 06N2wELY36831634
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jul 2020 02:58:14 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 33671AC05B;
	Thu, 23 Jul 2020 02:58:14 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6DD9AAC059;
	Thu, 23 Jul 2020 02:58:07 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.211.93.190])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jul 2020 02:58:07 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: qemu-ppc@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
        David Gibson <david@gibson.dropbear.id.au>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Peter Maydell <peter.maydell@linaro.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Greg Kurz <groug@kaod.org>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: [PATCH v3 7/8] sparc/sun4m: Use start-powered-off CPUState property
Date: Wed, 22 Jul 2020 23:56:56 -0300
Message-Id: <20200723025657.644724-8-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200723025657.644724-1-bauerman@linux.ibm.com>
References: <20200723025657.644724-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-22_17:2020-07-22,2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 phishscore=0 spamscore=0 suspectscore=1 adultscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007230018
X-TUID: 2bE1nb3owsHI

Instead of setting CPUState::halted to 1 in secondary_cpu_reset(), use the
start-powered-off property which makes cpu_common_reset() initialize it
to 1 in common code.

This makes secondary_cpu_reset() unnecessary, so remove it.

Also remove setting of cs->halted from cpu_devinit(), which seems out of
place when compared to similar code in other architectures (e.g.,
ppce500_init() in hw/ppc/e500.c).

Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 hw/sparc/sun4m.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

NB: I was only able to test that this patch builds. I wasn't able to
run it.

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index f1d92df781..fd74e516bb 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -218,15 +218,6 @@ static void dummy_cpu_set_irq(void *opaque, int irq, int level)
 {
 }
 
-static void secondary_cpu_reset(void *opaque)
-{
-    SPARCCPU *cpu = opaque;
-    CPUState *cs = CPU(cpu);
-
-    cpu_reset(cs);
-    cs->halted = 1;
-}
-
 static void cpu_halt_signal(void *opaque, int irq, int level)
 {
     if (level && current_cpu) {
@@ -810,7 +801,6 @@ static const TypeInfo ram_info = {
 static void cpu_devinit(const char *cpu_type, unsigned int id,
                         uint64_t prom_addr, qemu_irq **cpu_irqs)
 {
-    CPUState *cs;
     SPARCCPU *cpu;
     CPUSPARCState *env;
 
@@ -818,11 +808,8 @@ static void cpu_devinit(const char *cpu_type, unsigned int id,
     env = &cpu->env;
 
     cpu_sparc_set_id(env, id);
-    if (id != 0) {
-        qemu_register_reset(secondary_cpu_reset, cpu);
-        cs = CPU(cpu);
-        cs->halted = 1;
-    }
+    object_property_set_bool(OBJECT(cpu), "start-powered-off", id != 0,
+                             &error_abort);
     *cpu_irqs = qemu_allocate_irqs(cpu_set_irq, cpu, MAX_PILS);
     env->prom_addr = prom_addr;
 }
