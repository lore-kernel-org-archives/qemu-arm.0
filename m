Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp606427lfy;
        Wed, 19 Aug 2020 09:44:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuvVf+LZLRRWEiYpcU0nIKGpwCDEAl93Ih+kTfO1lcK2I0nQPw+NNACCCXsldesJrbMsyw
X-Received: by 2002:a17:90a:4a97:: with SMTP id f23mr101606pjh.138.1597855472170;
        Wed, 19 Aug 2020 09:44:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597855472; cv=none;
        d=google.com; s=arc-20160816;
        b=iO75ByO7JDDo+uXEsCiaif2WCRNocBnDg2gBXwFJiBfy12RUkYKQXotiY40WYeFsQD
         0XUtxUUdXiQOhGZN0KRexd79ffAQ9yRUlUWKMgviI9xsDcTnSEYOKs7ZeIcscE+s2047
         h20Goxucy8DSdyPNrE8ne02O7Nm2Pnb/Z+lUH9Pz1GWcX9uSsmkgHyfZlO9wpTjj7bsk
         rnD2Qdiu/+9SytzHpqgSvu4ISU1LHzbhoBrlfSJy4kIsLVrv4P/imHL74Qhx42vqREOr
         lgrLM5XM6Jhi9XYJJuQGaB0KXRpRnKwKCGuc3NyY0J65STA0OJbeMl0zUA59XQCGydiA
         x1Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=dzOkIcHJWWuF7eF0ga+ot+oX2WE7wN2TXmImTs/C7MI=;
        b=VsBl0QM8BCX8+HT1Bb6owrc/h1/FytNVOqs1BV9t38WijJMutUQHmck/fPBBo+jfcv
         UwOzJRNDZMdydHu8M51qDA8Dj731Yn8ZosNyrxrVZwV6huNo+armSQbNRgLQo9IPqliy
         SmtAJepKdVG4ziiDyoadTAbSrtuqh0bU20BucNwJDS6f3RNj+9Na/n26vwSRZHLOV4+c
         Enp1RJuEIHWZOf+FjUVAVIjebbBgyoM/KXuXwmmfbOaG5D1IzyPzD8yvzL+6FGjdKZck
         gINOI8sKhVeGv9WsBfwteMaHYH7DYlw2hHv/lMRb6EiKv2sK55P+qUn8eeW3nc6Evcqy
         +xZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="sVya3qE/";
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id x20si2814372pjt.26.2020.08.19.09.44.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Aug 2020 09:44:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="sVya3qE/";
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07JGWe9e103697;
	Wed, 19 Aug 2020 12:44:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=dzOkIcHJWWuF7eF0ga+ot+oX2WE7wN2TXmImTs/C7MI=;
 b=sVya3qE/FlnO0zVnNRe7YNbOIjSTjW32wrrZDfi4qfmUSmZgQIFJ6A5YieOfaNsCFLzz
 YGHb6nHAyJQsM+PWUhqfLkIED8sf/oC9EHkfc6xMLZA9r4lc1YYNBojv72DD443NG8iB
 XgH6dm/+7xBJxTwPMDBjIiu7k9d7RlP3pXAzbwE8uFaMUWWOAq3bCJ3gTcS+ihBnio6H
 QkaRWDuXOWKHEvWtya2ctD+HsnUxpuyBw5Raj7DWWfgLqRJ/g1n5J225AtAgpA7MoRqN
 G+V2cYEB1Nh17nMih9fpxnGJRgGv4ACg8+BcSCn1OFgHyDQMhpwmnuzIqIChDt0XIYsF 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3310eyfkjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 12:44:11 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07JGYMaF108216;
	Wed, 19 Aug 2020 12:44:10 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3310eyfkhw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 12:44:10 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07JGPQB8020394;
	Wed, 19 Aug 2020 16:44:09 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
	by ppma03dal.us.ibm.com with ESMTP id 3304ccrupr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 16:44:09 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07JGi8bl20840814
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Aug 2020 16:44:08 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5435BC605B;
	Wed, 19 Aug 2020 16:44:08 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E7A28C6055;
	Wed, 19 Aug 2020 16:44:02 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.211.41.171])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 19 Aug 2020 16:44:02 +0000 (GMT)
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
        Greg Kurz <groug@kaod.org>, Igor Mammedov <imammedo@redhat.com>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: [PATCH v6 7/8] sparc/sun4m: Use start-powered-off CPUState property
Date: Wed, 19 Aug 2020 13:43:05 -0300
Message-Id: <20200819164306.625357-8-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200819164306.625357-1-bauerman@linux.ibm.com>
References: <20200819164306.625357-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-19_09:2020-08-19,2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 suspectscore=1
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008190138
X-TUID: 54O7w2tuj1IW

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
 hw/sparc/sun4m.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 22c51dac8a..23991ccd47 100644
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
@@ -810,19 +801,16 @@ static const TypeInfo ram_info = {
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
+    qdev_realize_and_unref(DEVICE(cpu), NULL, &error_fatal);
     *cpu_irqs = qemu_allocate_irqs(cpu_set_irq, cpu, MAX_PILS);
     env->prom_addr = prom_addr;
 }
