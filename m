Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp54367lfy;
        Tue, 18 Aug 2020 19:43:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxojHss7eCqXohUh5tTLV4JwPjhut84Lyz67G5qUFYHDU9zp1YTxMtrjDs0vOy9k6G53wPm
X-Received: by 2002:a25:8149:: with SMTP id j9mr8149928ybm.214.1597805018413;
        Tue, 18 Aug 2020 19:43:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597805018; cv=none;
        d=google.com; s=arc-20160816;
        b=uTynBjI11p7IioHa53I/CVizvDQVBpxRp8rqH+D6+EiT4vKI5kxVOXeggWssXMCv+9
         m9Na8cfhghNCPVGzxGAjWHMBMx0wLKYmPnotlUaL6WKIsiteAVwZVgpBNLT0ttRLAL1x
         3Y4JUHIH9H1qg+NQ61NwCdjKVEMe+nT6Jf26vdHgqW4BY5jsSxIgNvjA8YYv7aFj+k3X
         q+N92hm0tgnCgxpJwaiJqxa7lyprVmmNWDKrr3bq1W2EGfI/GaIFabrjwe7bhb30AYEl
         wtpN8nhrsuCk2Qf4duLwEjNt8fYR45u6T3XzFZrDVnM/94YLSuNwajmndK0Jn13+ccGy
         YnYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=u2zlSxFcjsQ+3ryFRUb2we9G7yLgFd0GcUAaRd1m3Rk=;
        b=DJSW7brF5/HVJ9yVuztpA4j/eRTrWcs75ggF+u1efGDxhiGiyuyU7bCHwGmv2RCUuF
         9KN1QUcANtmqo+zZ55Mkc6bDDTWJSnCBpZpVswx+sN6Fh8rLR0KMfK88ASmQ1swKPSYk
         XFGLW26DCuaCQ5Kgb6n9qtRetJx6qfyjauAE3bMTWO1wI7JoQwa4vZ7h5TEwHPjkAnrt
         ReGOmHuXDS2qxw7kIT3NWVBgEEvGzTDEmlGTRVzZc3uDrun1F16EfMGQx8GXJv/AMzyx
         YYFaiOF6ZAChjxBAUcHpkCcyP3oSZM0rn7vfOF1+7xbQ2jt7CDSe68+DEXdlh4sR9Pga
         MRuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=OjVxaYrw;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id h80si22075997ybg.85.2020.08.18.19.43.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 19:43:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=OjVxaYrw;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07J2Wh3O001678;
	Tue, 18 Aug 2020 22:43:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=u2zlSxFcjsQ+3ryFRUb2we9G7yLgFd0GcUAaRd1m3Rk=;
 b=OjVxaYrw7G7uxDO1mK8SQ6a7o4/ZYKoaNCcNUM1nARXyJcITVS+fk26HDa3Y7sCjUNvv
 iWLB63Yo1pMoHKEaIkf3sU5dD6wfo3Pt+smdttWoLNB7J1/FwD4scaeKar15LFDX5HRz
 U/Awma4zVKefR4579qmx/stYU9oBZtLh9RpHeF0xa+4eAHEHWQ9VNOe6QLJNzyjd0U1g
 rZlGd2GWa7VpKF4q4DqxpDO6Kv92UWIJa6XdydGXCoEGE2nWZZCIFU4PB9jBX363jU+E
 wjPx3m8kPsTQKJjYe9ccsfaPLMCjW11MDTB1VwZKJS9wgoS6vMKeuTAFk3MDnwsWyrxP cw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304nuxpfv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 22:43:18 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07J2X1lb002558;
	Tue, 18 Aug 2020 22:43:18 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304nuxpfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 22:43:18 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07J2ba0F016238;
	Wed, 19 Aug 2020 02:43:17 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
	by ppma03dal.us.ibm.com with ESMTP id 3304ccjv4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 02:43:17 +0000
Received: from b03ledav005.gho.boulder.ibm.com (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
	by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07J2hD0Z39780728
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Aug 2020 02:43:14 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 91A69BE051;
	Wed, 19 Aug 2020 02:43:16 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 73D24BE04F;
	Wed, 19 Aug 2020 02:43:11 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.163.41.251])
	by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 19 Aug 2020 02:43:11 +0000 (GMT)
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
Subject: [PATCH v5 7/8] sparc/sun4m: Use start-powered-off CPUState property
Date: Tue, 18 Aug 2020 23:42:19 -0300
Message-Id: <20200819024220.587612-8-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200819024220.587612-1-bauerman@linux.ibm.com>
References: <20200819024220.587612-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-19_02:2020-08-18,2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=1
 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008190022
X-TUID: iAnreb5S1XJF

Instead of setting CPUState::halted to 1 in secondary_cpu_reset(), use the
start-powered-off property which makes cpu_common_reset() initialize it
to 1 in common code.

This makes secondary_cpu_reset() unnecessary, so remove it.

Also remove setting of cs->halted from cpu_devinit(), which seems out of
place when compared to similar code in other architectures (e.g.,
ppce500_init() in hw/ppc/e500.c).

Finally, change creation of CPU object from cpu_create() to object_new()
and qdev_realize_and_unref() because cpu_create() realizes the CPU and it's
not possible to set a property after the object is realized.

Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 hw/sparc/sun4m.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 22c51dac8a..1925f415e7 100644
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
@@ -810,21 +801,19 @@ static const TypeInfo ram_info = {
 static void cpu_devinit(const char *cpu_type, unsigned int id,
                         uint64_t prom_addr, qemu_irq **cpu_irqs)
 {
-    CPUState *cs;
     SPARCCPU *cpu;
     CPUSPARCState *env;
 
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
+                             &error_fatal);
     *cpu_irqs = qemu_allocate_irqs(cpu_set_irq, cpu, MAX_PILS);
     env->prom_addr = prom_addr;
+
+    qdev_realize_and_unref(DEVICE(cpu), NULL, &error_fatal);
 }
 
 static void dummy_fdc_tc(void *opaque, int irq, int level)
