Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp54234lfy;
        Tue, 18 Aug 2020 19:43:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQGlmqGmN5cGVhWwhX86F2qHc64Jzv3ceWYZ8//TU4GVbj/4Pp561Peg7IVKUoBvciywHu
X-Received: by 2002:a25:428a:: with SMTP id p132mr30344393yba.453.1597804998988;
        Tue, 18 Aug 2020 19:43:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597804998; cv=none;
        d=google.com; s=arc-20160816;
        b=l7es2lMlZD0sb9ky+T0m8NM/hEjV2OqtIHjHUAR9T8eUS8SLn0WpKmIK1A1wNLegWw
         MGfeo+lUFqk3gI68rtQnC0lW3b1Kb/nH7arTVshJ1f0/Hde9LHQyB+x06/P0JDPmlPBG
         oU3CQPcejFZ3pWBwIAyJCQprUFzr8fK3HAHDz90oS6CBeztaft7qVGVUCzgRlQyxhtDA
         A/EI7DsDAOkDilyekBN3b0Un4wieDn1ps5b/fPKdJKe9P6bfDyVhB2XeukDP9A0jLnDZ
         1quGI4gYKr0lyFJ+X/nSbzlaLWM5UV+tih6AysLpJpENsD7NsAT8QlLTMjkeSiKpC9AV
         PnXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=aL1FYi7GAJcnVcsdpNGk1BintOjCarw6Fa63OV0YM78=;
        b=C6IPYbspihcPuUGEcZBNhfSBsrPsoXGh6lTnbWfN/8lnjd+fgF4mCTd+dQ8TR8Ny+j
         /2cborr/Th8sYCHwPHwghRCw59nT8yyPEXxhqYBcFbMIYI0fLagmJtomEKOgQb8kzBbU
         TNBpbuuc6vvWpWu3yFl9B0lTNTFDSR4zb3wmRehaMSy/6kqYeQhP38BjsaSjUqgYz7ms
         SDrKbU1smrdBju7xkGQHTmcUlaQV5swYMA+opzzw7RcOrZSVStGvxi1y8TLj3+DkCUrZ
         xNdfQSvfRF2wm/qohEqutIE0PVxbQO2KEGy23lvftCH0MWXUmZbnoeZe/+cGYtmAVwcZ
         DT2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=g+x7lTJd;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id l186si25960191ybc.441.2020.08.18.19.43.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 19:43:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=g+x7lTJd;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07J2VZ1i030232;
	Tue, 18 Aug 2020 22:43:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=aL1FYi7GAJcnVcsdpNGk1BintOjCarw6Fa63OV0YM78=;
 b=g+x7lTJdRQQv80NXXvrJVU/61z3zoyzpLPe3kAMPMfjVuxdVpCvwNfDe2rIV3FlB8ikt
 6ezlNEg5NOqg2pscZ+BLvCkUd8EPt8EEuRR5EC0ulRYSY0mLZCR2v6bQ1jjpynBVGgGC
 saWc703ADBjMeDWm04HimaXkjXuwya9tSvhHFaiJrh7L7Cy7BZNVT8NVRBjUODTeVOyv
 /VbEKFz+wb9ztYXTqxjupwm3lsfCJOzbuydw1b7KfAZlb1ZEDmG4kP9vXrg+ZRcZ4DDD
 NcKpy3YQh6F5VNntb3ZNuK6XQ0WJqvy2TyjZHqsO8ma56iNDnlL0/199M7BLvEv2MRfn pg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 3304pfejp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 22:43:02 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07J2ffOG056024;
	Tue, 18 Aug 2020 22:43:01 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0b-001b2d01.pphosted.com with ESMTP id 3304pfejnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 22:43:01 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07J2ccq8030379;
	Wed, 19 Aug 2020 02:43:00 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
	by ppma05wdc.us.ibm.com with ESMTP id 3304tgrjru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 02:43:00 +0000
Received: from b03ledav005.gho.boulder.ibm.com (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07J2gxMo41484734
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Aug 2020 02:43:00 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC952BE04F;
	Wed, 19 Aug 2020 02:42:59 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F0E22BE051;
	Wed, 19 Aug 2020 02:42:54 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.163.41.251])
	by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 19 Aug 2020 02:42:54 +0000 (GMT)
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
Subject: [PATCH v5 4/8] ppc/e500: Use start-powered-off CPUState property
Date: Tue, 18 Aug 2020 23:42:16 -0300
Message-Id: <20200819024220.587612-5-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200819024220.587612-1-bauerman@linux.ibm.com>
References: <20200819024220.587612-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-18_16:2020-08-18,2020-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 impostorscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=1 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008190017
X-TUID: 8MTgpN80AOao

Instead of setting CPUState::halted to 1 in ppce500_cpu_reset_sec(), use
the start-powered-off property which makes cpu_common_reset() initialize it
to 1 in common code.

Also change creation of CPU object from cpu_create() to object_new() and
qdev_realize_and_unref() because cpu_create() realizes the CPU and it's not
possible to set a property after the object is realized.

Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 hw/ppc/e500.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index ab9884e315..d7b803ef26 100644
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
 
@@ -897,7 +894,16 @@ void ppce500_init(MachineState *machine)
         } else {
             /* Secondary CPUs */
             qemu_register_reset(ppce500_cpu_reset_sec, cpu);
+
+            /*
+             * Secondary CPU starts in halted state for now. Needs to change
+             * when implementing non-kernel boot.
+             */
+            object_property_set_bool(OBJECT(cs), "start-powered-off", true,
+                                     &error_fatal);
         }
+
+        qdev_realize_and_unref(DEVICE(cs), NULL, &error_fatal);
     }
 
     env = firstenv;
