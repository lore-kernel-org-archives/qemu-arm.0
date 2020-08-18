Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3458290lfy;
        Mon, 17 Aug 2020 20:34:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyb3d1b80rVgEKvxUK1p6du2sH/TncTe+XPOUigzX0WWYQiV2M0x/C7ZyboDzJYvsJAJ1Fx
X-Received: by 2002:a17:902:8543:: with SMTP id d3mr13622354plo.244.1597721699677;
        Mon, 17 Aug 2020 20:34:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597721699; cv=none;
        d=google.com; s=arc-20160816;
        b=MxKSkwY76Jnv0N9m3yjvzY2p6avy5fZgfEr7+gr8o+n4TM6+TPdUTkutQhdnd/f05D
         LqrmM9UH/gUOUKbgQ3FBNe9lDcYpE/mXGzfsPBhYuP7UqJbhQ503Qo6MnxiebBAfuEox
         y5whyxWjN+8M2u+vNE9KQ8lZP+6R7Xmy0R2Qq+jAAbuqoiAAj1xigBt3H4UPH3zqF+QK
         FsQcaapd0jDVMTOlBNsSoRvLqmidzWvo3XPAIbjnzo7Bj7UrZxoQgX7Nb+zV/WgZauDg
         X5N1HUWDlOYa+vfoRdQgvMoHOjkgiUrvrI8Io2xuQGIr0PsrGUzBnBDpKpozPPYE0Mpq
         v5aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5Cp+2Pjd9M1dvY9eDK1iY1GEDvhSr53MHy1G+xNlYlQ=;
        b=nPm0gK3OYX7AhxVCO4rrZH9JrKBrZX2qZqG+/K73UIHTqUEav7vJYw/68Qca/C/Hxc
         +4q4vpwTE2E2/D88qv7z0LJWGNXjYi1WHYWOwhl+MYjvtElZZfmEvGLZlhBK4hoyogzM
         5n1mAODTiZfoXfHrqNJOEt2+LGo5yxd1CZE1OQ3NzixiA4ZTbcwPh9CS+AjbzEfmESHY
         3QT6WsTKJdJGRPiGxWOGJWzbyyTFbLa+J4js4IfNvy5eWTyQUXMl1JExIVMuMrUQX/KV
         LmX6VGSou36zz1dZdU6grU17E1Vt70BApqJZPVBenSkYqlv/u6GOhQS4z9nVWxi8RgtJ
         IfjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=D6v0p9Kb;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id t4si14774180pjb.150.2020.08.17.20.34.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2020 20:34:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=D6v0p9Kb;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07I33X6V073927;
	Mon, 17 Aug 2020 23:34:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=5Cp+2Pjd9M1dvY9eDK1iY1GEDvhSr53MHy1G+xNlYlQ=;
 b=D6v0p9KbMwMaNlo/upSL/zYD7tQlscocFY9DXoqVa9/DaXiTapk1vmYQ37OGQTkQiICl
 L1m6AGfWflnHhMP6esordhPN32CUIHFQDSwd0gXpz6Tyc0XqpyG5oXuWtc+8h/dhoJXM
 /OtmErxkLdAZknyuGsgi+Xx0yvZv/CEvzYJp7FU8N+gKW2vBMXGkJSzeIcr1rDUuzPTt
 8S7DCV0Qg5y4Vm6k/L+cDG3nx3oEgEdU8JW2HaLTk4OG9DT1jQviu2KE2meRDV24RcNG
 ULkTDK05CQzrVFJs7t6jQ5HeyH+4zWuyE6a51lvoTr0v21gMzqJbBetj5JtJ4IUldC/x pA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304r2u4t2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2020 23:34:32 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07I34B0O075178;
	Mon, 17 Aug 2020 23:34:32 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304r2u4sk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2020 23:34:32 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07I3UBOK007543;
	Tue, 18 Aug 2020 03:34:30 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
	by ppma03wdc.us.ibm.com with ESMTP id 3304cdrw55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 03:34:30 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07I3YUVa53084456
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Aug 2020 03:34:30 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 65525AC05B;
	Tue, 18 Aug 2020 03:34:30 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 706CFAC059;
	Tue, 18 Aug 2020 03:34:23 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.211.138.167])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
	Tue, 18 Aug 2020 03:34:23 +0000 (GMT)
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
Subject: [PATCH v4 5/8] mips/cps: Use start-powered-off CPUState property
Date: Tue, 18 Aug 2020 00:33:20 -0300
Message-Id: <20200818033323.336912-6-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818033323.336912-1-bauerman@linux.ibm.com>
References: <20200818033323.336912-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-18_01:2020-08-17,2020-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=1 priorityscore=1501
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008180022
X-TUID: O/sCGZ1mf/Gr

Instead of setting CPUState::halted to 1 in main_cpu_reset(), use the
start-powered-off property which makes cpu_common_reset() initialize it
to 1 in common code.

Also change creation of CPU object from cpu_create() to object_new() and
qdev_realize() because cpu_create() realizes the CPU and it's not possible to
set a property after the object is realized.

Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 hw/mips/cps.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/hw/mips/cps.c b/hw/mips/cps.c
index 615e1a1ad2..be85357dc0 100644
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
@@ -76,7 +73,9 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
     bool saar_present = false;
 
     for (i = 0; i < s->num_vp; i++) {
-        cpu = MIPS_CPU(cpu_create(s->cpu_type));
+        Error *err = NULL;
+
+        cpu = MIPS_CPU(object_new(s->cpu_type));
 
         /* Init internal devices */
         cpu_mips_irq_init_cpu(cpu);
@@ -89,7 +88,16 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
             env->itc_tag = mips_itu_get_tag_region(&s->itu);
             env->itu = &s->itu;
         }
+        /* All VPs are halted on reset. Leave powering up to CPC. */
+        object_property_set_bool(OBJECT(cpu), "start-powered-off", true,
+                                 &error_abort);
         qemu_register_reset(main_cpu_reset, cpu);
+
+        if (!qdev_realize(DEVICE(cpu), NULL, &err)) {
+            error_report_err(err);
+            object_unref(OBJECT(cpu));
+            exit(EXIT_FAILURE);
+        }
     }
 
     cpu = MIPS_CPU(first_cpu);
