Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp473016lfc;
        Tue, 25 Aug 2020 22:56:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylm3FiqAQGFOnicimnAwXFKGbSdgrqDAhS76GjBJ6MpzgC+WYf2NzhVGoWbvizjDerNegP
X-Received: by 2002:a63:c10:: with SMTP id b16mr9116334pgl.240.1598421399753;
        Tue, 25 Aug 2020 22:56:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598421399; cv=none;
        d=google.com; s=arc-20160816;
        b=glw45jqzhla8Y/9zym7opLjR1/F6AhgeqxIlCTzMAESJ9Dwh103olWII+Czt2N8dXf
         An542jUBWXXKZBnjfbsK1VxJ1pWzmLDAof3HjvYfwCfbZOHDE21APXaNIIKoJNlFO9iY
         qme0GVd8w/fl4Im22gsBG8qcrYOMQMMgO/+JyOMonuWm9V3hD34khIkowwI3m9USYy7V
         3P2Tj3mSVW1WF6nQIw9Bm7SjH1kJuV0yONgh6ogYfLJE9cWuh52mEeypnrge6LsytGn8
         1qhT12KVIbf8OOvwLfyi3SGH5Ui+OscpKSVyUWYEaRVK1oAHE96OWYninSbMMRg575oc
         bQgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WjA51qR1tJ1GnmzpyrD7tREwDezbUBrRItTnjm47UI4=;
        b=ExV/MY8aLm7lUy9ISAXdDee3q1CmZr/3y9uYW5Ak1MyDnbrxQ+fZ21RuzDXILklh2Q
         FF0bozZ+o/TZREN/ALoiUZict806h9UjTXZgUJuRxTVkJ6V0Gspv2kXJDC6qfpdqRJM2
         7fteaPyiphIdZuMsYkcTPL7q0tWzlJvTIdJTrS66wxzhkVjxSVcKojYLIAYMI0l+MGgr
         foTNP3sKiv7gka4C/92XSt/mL2VrxOwdHO7dpuXbHzKl3/izvokhhRrd6M6LgWNNud36
         bukKU3D6du0lW2WwLVON2I5HIreq3SziXYNvRHCtRCdqjCb/HCBRsHjVwEQWO5jb6gtj
         7UjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=rjQsN6fl;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id s17si836942pfs.60.2020.08.25.22.56.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Aug 2020 22:56:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=rjQsN6fl;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07Q5WPv3089178;
	Wed, 26 Aug 2020 01:56:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=WjA51qR1tJ1GnmzpyrD7tREwDezbUBrRItTnjm47UI4=;
 b=rjQsN6floAEUsqaA6zPWAFzhZ8JZ9isVf7QYqj3LP8DLJbqSbIAzVrRGsgeHa2x1sYEK
 pRz3MFwZ/ixeFCoyr2Jd2XNjm5yOCGiZHaez5iMqNykK0J0lo1ptilopbYGlO+tnq29H
 dS2rnwwRooX7kbZmlKfrjCTze/cLPd6eXkhIogv7r7E4+GaKaxC2AJCGSYxd2bBOv+jL
 1Msbf8ZvlpmaDHBEkyo+LNCeiuIZHchiUmebC5Cb16md5WB7f8US4gX/t1q2FOX64o7z
 vxJUCjKHqAaROwZtkfu9V2uCCQk+CuoUuVwyJHI0LhBZYAO4iAVLJFDI8dKIZRldpHOV +g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 335g80tprx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2020 01:56:17 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07Q5X8b7090711;
	Wed, 26 Aug 2020 01:56:17 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com with ESMTP id 335g80tpr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2020 01:56:17 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07Q5mb4u023220;
	Wed, 26 Aug 2020 05:56:15 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
	by ppma03wdc.us.ibm.com with ESMTP id 332utqy89h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2020 05:56:15 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07Q5uEA262390724
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Aug 2020 05:56:14 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C9308C6057;
	Wed, 26 Aug 2020 05:56:14 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A4005C6055;
	Wed, 26 Aug 2020 05:56:09 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.163.48.38])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 26 Aug 2020 05:56:09 +0000 (GMT)
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
Subject: [PATCH v7 4/8] ppc/e500: Use start-powered-off CPUState property
Date: Wed, 26 Aug 2020 02:55:31 -0300
Message-Id: <20200826055535.951207-5-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200826055535.951207-1-bauerman@linux.ibm.com>
References: <20200826055535.951207-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-25_11:2020-08-25,2020-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 clxscore=1015 spamscore=0 mlxscore=0 suspectscore=1
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008260040
X-TUID: Ruovb2OVjfPH

Instead of setting CPUState::halted to 1 in ppce500_cpu_reset_sec(), use
the start-powered-off property which makes cpu_common_reset() initialize it
to 1 in common code.

Also change creation of CPU object from cpu_create() to object_new() and
qdev_realize_and_unref() because cpu_create() realizes the CPU and it's not
possible to set a property after the object is realized.

Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 hw/ppc/e500.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index ab9884e315..ae39b9358e 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -704,9 +704,6 @@ static void ppce500_cpu_reset_sec(void *opaque)
 
     cpu_reset(cs);
 
-    /* Secondary CPU starts in halted state for now. Needs to change when
-       implementing non-kernel boot. */
-    cs->halted = 1;
     cs->exception_index = EXCP_HLT;
 }
 
@@ -865,7 +862,7 @@ void ppce500_init(MachineState *machine)
         CPUState *cs;
         qemu_irq *input;
 
-        cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
+        cpu = POWERPC_CPU(object_new(machine->cpu_type));
         env = &cpu->env;
         cs = CPU(cpu);
 
@@ -875,6 +872,14 @@ void ppce500_init(MachineState *machine)
             exit(1);
         }
 
+        /*
+         * Secondary CPU starts in halted state for now. Needs to change
+         * when implementing non-kernel boot.
+         */
+        object_property_set_bool(OBJECT(cs), "start-powered-off", i != 0,
+                                 &error_fatal);
+        qdev_realize_and_unref(DEVICE(cs), NULL, &error_fatal);
+
         if (!firstenv) {
             firstenv = env;
         }
