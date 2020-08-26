Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp473109lfc;
        Tue, 25 Aug 2020 22:56:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYRN/vUboPULOXgOq6WaJB25ACfE/IAW+wwcUQKF4GKDS1Uy51pAlvdPRW7dK4uu1FcHlT
X-Received: by 2002:a05:6a00:2295:: with SMTP id f21mr10788550pfe.51.1598421411891;
        Tue, 25 Aug 2020 22:56:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598421411; cv=none;
        d=google.com; s=arc-20160816;
        b=gzONOIKnNUW+sCZ/+Ljgy80kf2tZdt0xzDyJEIdj0z7Fcde8lXbuRxTVHWVadYf747
         4BDWjEVK/msdDugIxEky8xNiBClBTd4pmzRCu9T80ZH+LDq2YbNs3emHFVGfPFbH8ImK
         KgmQ6U0v2W6vt3VWSJXIz+tunAqsHvh82SRVO7qSmSrfGq+Kg7gE/jY9lb8IiYRHv1UB
         EKHEa6gfKnlLWeJrP2N9o7v3aAoui2+/t8WYwkxxNjdQ1erdMpBtX4t3Qcd+YgUlNLLP
         xB3mNWcLK9XB/QDC5h2UYCuU+HCA+rYMcFsDIG0/BcakKzHyTNtY8HSTqd+WbsaMWGXu
         ofog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XrxBHV8YQC3B+hBtragKGLFK4MktAPxO3MXlcxkka9I=;
        b=OCevhOwDdpNq1NIEWVnMMUwF3fdk7euNS8n1o/uw5W0tJRAptleZZzlkWOcu/MiwlO
         H366ovkvu2yIx4MiTfxrMq1bZQZgpraOduXdrfB0yg8uKSYyH2QtdiyJ75jIrLyUThUL
         D2dQPx0rIQ+G8ru91HD0ZBjK3jV5IQbUWZBOplJH7/Q46zYu77AcuZnV7QAt9Vt2mfUS
         EfwOYgRYln7DmT4Ng/aKdH4gvQbHD9z4/5iGLM4ZuxA/1ujkwFswSjxvz9xLQAWcNXr/
         Uo4Pwh5izpZ+m/DQclLK2NWmIwZ8lNmbEDJzWIYMfSq/LdZcWYEkCru2AYZB2zSGd/nI
         QSpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=UwxuchbU;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id l22si816498pgt.78.2020.08.25.22.56.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Aug 2020 22:56:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=UwxuchbU;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07Q5VwcK194581;
	Wed, 26 Aug 2020 01:56:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=XrxBHV8YQC3B+hBtragKGLFK4MktAPxO3MXlcxkka9I=;
 b=UwxuchbUFnZMxM3QwGpZOU+S+XXf/9lXj9ARxZoMiWelDcTVTDpxcX+wqM0rTcq/NggN
 42c5I+I/hpqAy3EtPGURz4YyQcwidmZRsXHTSXSEOUGwLcyoGsPIFk541DxlOC2RJvYf
 3eFBAGnrdiSQ9t4ooPRFflhhjqNwZ++X57K2Q/y5ov9eHoPE56Vzq6dzhWPdLaEzGpNl
 0ZSALT9TM9mzG24jpNnlzTnbgP7F3p86vRfeP7aaixwPDTmqwQxw0IpKg3H+8ZEo5ITr
 pBvpB/YJxJlyD8zyTiK1V2xeWQH4U6dSmeP3bk/RTKbaCHXrv9J3p52VjtntiKNv3qYp xw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 335ggn21h0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2020 01:56:25 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07Q5W0LL194635;
	Wed, 26 Aug 2020 01:56:23 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com with ESMTP id 335ggn21fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2020 01:56:23 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07Q5mWl8023193;
	Wed, 26 Aug 2020 05:56:21 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
	by ppma03wdc.us.ibm.com with ESMTP id 332utqy89u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2020 05:56:21 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07Q5uKai56885530
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Aug 2020 05:56:20 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7DFB2C605A;
	Wed, 26 Aug 2020 05:56:20 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 38EAAC6059;
	Wed, 26 Aug 2020 05:56:15 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.163.48.38])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 26 Aug 2020 05:56:14 +0000 (GMT)
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
Subject: [PATCH v7 5/8] mips/cps: Use start-powered-off CPUState property
Date: Wed, 26 Aug 2020 02:55:32 -0300
Message-Id: <20200826055535.951207-6-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200826055535.951207-1-bauerman@linux.ibm.com>
References: <20200826055535.951207-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-25_11:2020-08-25,2020-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=1 phishscore=0
 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008260040
X-TUID: mZZDMkz59hRx

Instead of setting CPUState::halted to 1 in main_cpu_reset(), use the
start-powered-off property which makes cpu_common_reset() initialize it
to 1 in common code.

Also change creation of CPU object from cpu_create() to object_new() and
qdev_realize_and_unref() because cpu_create() realizes the CPU and it's not
possible to set a property after the object is realized.

Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 hw/mips/cps.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/hw/mips/cps.c b/hw/mips/cps.c
index 615e1a1ad2..23c0f87e41 100644
--- a/hw/mips/cps.c
+++ b/hw/mips/cps.c
@@ -52,9 +52,6 @@ static void main_cpu_reset(void *opaque)
     CPUState *cs = CPU(cpu);
 
     cpu_reset(cs);
-
-    /* All VPs are halted on reset. Leave powering up to CPC. */
-    cs->halted = 1;
 }
 
 static bool cpu_mips_itu_supported(CPUMIPSState *env)
@@ -76,7 +73,17 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
     bool saar_present = false;
 
     for (i = 0; i < s->num_vp; i++) {
-        cpu = MIPS_CPU(cpu_create(s->cpu_type));
+        cpu = MIPS_CPU(object_new(s->cpu_type));
+
+        /* All VPs are halted on reset. Leave powering up to CPC. */
+        if (!object_property_set_bool(OBJECT(cpu), "start-powered-off", true,
+                                      errp)) {
+            return;
+        }
+
+        if (!qdev_realize_and_unref(DEVICE(cpu), NULL, errp)) {
+            return;
+        }
 
         /* Init internal devices */
         cpu_mips_irq_init_cpu(cpu);
