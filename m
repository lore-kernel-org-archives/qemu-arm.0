Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp473187lfc;
        Tue, 25 Aug 2020 22:57:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynzqP2TULZAKEATeclME//aZvVpAKXuQgg7tR+/Jn0pTaKNAvEyldZcHEhEv6fvhIqmU3w
X-Received: by 2002:a17:90a:ca94:: with SMTP id y20mr4590006pjt.0.1598421420366;
        Tue, 25 Aug 2020 22:57:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598421420; cv=none;
        d=google.com; s=arc-20160816;
        b=xEBRzEJ7LRqsL+9zIq2Q6MG75TQ5YgPsFd2SG2khMO8cTMQtu5EoIeDPWOb1RerVPN
         bSpZo5gGB03XGHxrZQLV1PuowC3NAy8ifqIB/zzlMOvZu/mFomjGwdC+1pFZCGluMmvo
         yCQ5sOxHws/a+54VEQTfhc1ZxS6q+YAvJ9NWOUk+pZgCUU+h0W8fDvtLB0gKfNrgZ80w
         H9jYL9oKcTOn/MkC6nm/ZEUmDbTBEnFOAyUAM7jRVWX3RUwqAnBXhw6je67/LkZ75VAr
         HgAkclKZ4Bsf62fLvTBSuucsnbEZWWbPgqRsuC63YcyBQTxOU8tTRhLFs2RKxwUMGvcR
         Gzvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ginZlmRS//+Wh2w9altSJdeQH8Wl+oNf3o/V2korlOA=;
        b=ddcBF3t0yfu5nP45Tj22PIw+uK0X/wThDxf1z+MQAVw8X4yi4rZe6MTZOTgfBDASNS
         vVKvsjPp+d0y39krnWN69+DiYwqi3w4fQh0RXssRBmyiP9n8lUQmhH3dB+YNevksjkmf
         DAtqFiCxmpSafOrad2niAMy7xAP+SeGsX2Nx9ney93/ysmfIbfZJmGssZ7FayjwGa+ta
         jExSWAiZmsGe928tuP0sz4Iw6nq50rdmDpKgg8RN6kHmuT0mBgz2yr4uFzLtpCMoRDMU
         k7ZSq8a5noRQxC8dKmXhOvWRV2BwjLGjsC6EMHQoaz91rvHOOdB9rlaURZZi9eYf5xcg
         JrZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="CAU/H73a";
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id c17si1083713pfb.67.2020.08.25.22.57.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Aug 2020 22:57:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="CAU/H73a";
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07Q5lnOM027507;
	Wed, 26 Aug 2020 01:56:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=ginZlmRS//+Wh2w9altSJdeQH8Wl+oNf3o/V2korlOA=;
 b=CAU/H73a1IJY5AhuU2PWo/t+4Xpzo/WiQzBLIbj/HEkPk3vP3i2vv/6vd80uK7aITuU8
 Lg+/D8ryiarOSrA513h2HzZRd6Bu4l3Oz2BJYrTTrdedWoin2RfzOFZHD61gDBYBcYn5
 WWnskBK7wr2qPbqIJLjd74SFQfPHuCp9WCLzMfOzFIkcZcW7qa6vb60f7uUM2Zbu7QMR
 fuoxGUSxz2X5r2uHCoNUes62hiWzYRcLZLwn4PqM61sqzd852ZskNSLavlKT1FOUIXWR
 JhH5bJHPWLPBnh5zexzV041a0MLU+S7fwXMU0Oyv3OiWEAB4k0t73Ezg9gZktVrDgyVD Gw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 335hwgg73j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2020 01:56:34 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07Q5mFi3030294;
	Wed, 26 Aug 2020 01:56:34 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com with ESMTP id 335hwgg72t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2020 01:56:34 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07Q5l3n3013783;
	Wed, 26 Aug 2020 05:56:32 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma01wdc.us.ibm.com with ESMTP id 332uwaf8ax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2020 05:56:32 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07Q5uSTQ18219360
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Aug 2020 05:56:28 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AFC10C6055;
	Wed, 26 Aug 2020 05:56:31 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 671EBC6059;
	Wed, 26 Aug 2020 05:56:26 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.163.48.38])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 26 Aug 2020 05:56:26 +0000 (GMT)
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
        =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: [PATCH v7 7/8] sparc/sun4m: Use start-powered-off CPUState property
Date: Wed, 26 Aug 2020 02:55:34 -0300
Message-Id: <20200826055535.951207-8-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200826055535.951207-1-bauerman@linux.ibm.com>
References: <20200826055535.951207-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-25_11:2020-08-25,2020-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 suspectscore=1 priorityscore=1501
 mlxscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008260042
X-TUID: 2yWpsLXoInHr

Instead of setting CPUState::halted to 1 in secondary_cpu_reset(), use the
start-powered-off property which makes cpu_common_reset() initialize it
to 1 in common code.

Now secondary_cpu_reset() becomes equivalent to main_cpu_reset() so rename
the function to sun4m_cpu_reset().

Also remove setting of cs->halted from cpu_devinit(), which seems out of
place when compared to similar code in other architectures (e.g.,
ppce500_init() in hw/ppc/e500.c).

Finally, change creation of CPU object from cpu_create() to object_new()
and qdev_realize_and_unref() because cpu_create() realizes the CPU and it's
not possible to set a property after the object is realized.

Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 hw/sparc/sun4m.c | 25 ++++++-------------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 7484aa4438..6bf9d27d8a 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -218,7 +218,7 @@ static void dummy_cpu_set_irq(void *opaque, int irq, int level)
 {
 }
 
-static void main_cpu_reset(void *opaque)
+static void sun4m_cpu_reset(void *opaque)
 {
     SPARCCPU *cpu = opaque;
     CPUState *cs = CPU(cpu);
@@ -226,15 +226,6 @@ static void main_cpu_reset(void *opaque)
     cpu_reset(cs);
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
@@ -818,21 +809,17 @@ static const TypeInfo ram_info = {
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
-    if (id == 0) {
-        qemu_register_reset(main_cpu_reset, cpu);
-    } else {
-        qemu_register_reset(secondary_cpu_reset, cpu);
-        cs = CPU(cpu);
-        cs->halted = 1;
-    }
+    qemu_register_reset(sun4m_cpu_reset, cpu);
+    object_property_set_bool(OBJECT(cpu), "start-powered-off", id != 0,
+                             &error_fatal);
+    qdev_realize_and_unref(DEVICE(cpu), NULL, &error_fatal);
     *cpu_irqs = qemu_allocate_irqs(cpu_set_irq, cpu, MAX_PILS);
     env->prom_addr = prom_addr;
 }
