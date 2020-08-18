Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3458465lfy;
        Mon, 17 Aug 2020 20:35:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTCQlpoAkODsJXFeAagfE5E9WlQtKfmepTfuk+OgFS9dQQcUCiqmMcoH8rSycvJGQVX0y9
X-Received: by 2002:a63:1457:: with SMTP id 23mr12265115pgu.80.1597721715484;
        Mon, 17 Aug 2020 20:35:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597721715; cv=none;
        d=google.com; s=arc-20160816;
        b=PNNkpzji6N1kD/h89PcTWXdTSR3ywuMYMYKQqGEfy7uD7m1Bgs0r5pGzM6mQBYAzvX
         uW1v8K/KJcKmFVoHZF9RupFQaXyKKt5fiJzmXQcwyqNPNvAO5ZKtGTI1FGJecwXGazys
         XyLckJeQxZYQCT1Qb+2ycDQDq0264PCr4Yoni1+D1S357dxyOfNvNAvz7z8ikS0dE1i7
         534TpXUj4PkeAD10CIC+7iV3VtKIOne6tpfR39n1RUZDRDTkc6UgcBHo2GV9wLLC2I5t
         hH+a6CErb5OG83BQpIr6Dm1hZPcj9cUw/zLWqo+PN9+YSJ7me1bn8NVRmc1S7/vRsYR/
         WWYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=HsHh9+eB0O5SPNaxMaxjkrsjZ6McJ76mgHj6uxA4AdA=;
        b=eD6l19lAYtDRqewl4z8aBG0UW5ddB60QDw2TTU6tHHl/qFVxspXnb4skGYBF6rnf1m
         2Ol9zfSojuYwPXS16urGupGm5Mlu6nIYGzZr2DTFxDi9jlOtwHg5p4IQMJdFHZLfYvE5
         +zmV5lJViNkzfco7W+7lU4R2syDZpjT8lggyQMktTkwB6HlHZKWlN+rHkPVnc1OgM8d8
         ryijGBGY+bQcJHn9IrUssVhfCMElB4g0g9EGsWBThMx8KgwQit6wxRWZgnuBRO6D+4CH
         hAf2f7l59A8oFNgILCX2eje7DJikA3cD4UWi/1TNWdDde3sAYPfj/Y8SxyvcZRgeb36m
         rR6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=jwhpRNTK;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id m20si15244362pfd.216.2020.08.17.20.35.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2020 20:35:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=jwhpRNTK;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07I3WgDr127784;
	Mon, 17 Aug 2020 23:34:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=HsHh9+eB0O5SPNaxMaxjkrsjZ6McJ76mgHj6uxA4AdA=;
 b=jwhpRNTKJVLaI/FO6htpC32ZPCuGqe7jJ3XhWaZSg4NqLReUwmf7NPo+gXwQ0QpZkbcN
 thHo5LRjd9APv7Xtb0E9MW0pRYGJJtxCYDlsgmRnGjWzELHDYo1kjsVNuUe+P+0MPbST
 jSm8q7hxDT77JZj14U3KBbWoLvMS+rJq/SDfSLcjeSqnxK8xCcRMXOVczerYdRH7W4on
 4RehNnHN2WS0khdMginJAKKJ1vJmjVoO0MfuEqcrFW2FlbjYPQ3bs4C1nb1O93XAlbiS
 u0BS6yijMI0w5BEYI5ssrhdmGonFBCyg8rG6+JKzlDq7fmZpS1bAfmbrPhQ7VQ9Ihkd4 eA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304u6k4hb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2020 23:34:48 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07I3XMCw129582;
	Mon, 17 Aug 2020 23:34:48 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304u6k4gw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2020 23:34:47 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07I3VC7u012889;
	Tue, 18 Aug 2020 03:34:46 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
	by ppma04dal.us.ibm.com with ESMTP id 3304uq8y7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 03:34:46 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07I3Ykj115008650
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Aug 2020 03:34:46 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1790EAC05B;
	Tue, 18 Aug 2020 03:34:46 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 09E74AC059;
	Tue, 18 Aug 2020 03:34:39 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.211.138.167])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
	Tue, 18 Aug 2020 03:34:38 +0000 (GMT)
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
Subject: [PATCH v4 7/8] sparc/sun4m: Use start-powered-off CPUState property
Date: Tue, 18 Aug 2020 00:33:22 -0300
Message-Id: <20200818033323.336912-8-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818033323.336912-1-bauerman@linux.ibm.com>
References: <20200818033323.336912-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-18_01:2020-08-17,2020-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 spamscore=0
 suspectscore=1 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008180022
X-TUID: PBXYJL2ewNHg

Instead of setting CPUState::halted to 1 in secondary_cpu_reset(), use the
start-powered-off property which makes cpu_common_reset() initialize it
to 1 in common code.

This makes secondary_cpu_reset() unnecessary, so remove it.

Also remove setting of cs->halted from cpu_devinit(), which seems out of
place when compared to similar code in other architectures (e.g.,
ppce500_init() in hw/ppc/e500.c).

Finally, change creation of CPU object from cpu_create() to object_new()
and qdev_realize() because cpu_create() realizes the CPU and it's not
possible to set a property after the object is realized.

Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 hw/sparc/sun4m.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index f1d92df781..41a7c5fa86 100644
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
@@ -810,21 +801,24 @@ static const TypeInfo ram_info = {
 static void cpu_devinit(const char *cpu_type, unsigned int id,
                         uint64_t prom_addr, qemu_irq **cpu_irqs)
 {
-    CPUState *cs;
     SPARCCPU *cpu;
     CPUSPARCState *env;
+    Error *err = NULL;
 
-    cpu = SPARC_CPU(cpu_create(cpu_type));
+    cpu = SPARC_CPU(object_new(cpu_type));
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
+
+    if (!qdev_realize(DEVICE(cpu), NULL, &err)) {
+        error_report_err(err);
+        object_unref(OBJECT(cpu));
+        exit(EXIT_FAILURE);
+    }
 }
 
 static void dummy_fdc_tc(void *opaque, int irq, int level)
