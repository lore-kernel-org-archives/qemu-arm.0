Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp606299lfy;
        Wed, 19 Aug 2020 09:44:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjK6vdgaXOKDm8el3jT4LjIycEIErW97s9/pOS5X/BPhF4MqBWswvTr4pj4qm5B9L/BREG
X-Received: by 2002:a25:854c:: with SMTP id f12mr35361212ybn.130.1597855458164;
        Wed, 19 Aug 2020 09:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597855458; cv=none;
        d=google.com; s=arc-20160816;
        b=NywTRZAEPu0OzjP3Mz03eBl9KTwcrM7XydyoEOD46zhtKBIIPE0CvJ181nqPRqjq97
         BnXCZoaCqSlbTdpx7tlwd9VcplRrxpRPzXpT+rm5ivauGwk6DnMEUOGzfsuiqyxq1QjE
         Q8gymxkspIidUuuZYTZWaaRpn4hntv7UYWyhREt3ZZ29DOsoocctSMXAqIL1I5eJbuai
         iSLl0hnjnWYaebgj3E+aMB1yoKdltP54dFKNtV5+1bXe5+YVsK29QYQV6YCzUbkjzZsz
         YAq3NaucNpH4UxUpKqIOnVUeGtBitAPKXrQb8Vb/v2aMrgMzR0N2v27FUiWH7mnEpA4A
         Zu1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=glsojxp4qtfGg8Khy2gOItqGH8ZRugBAjJSwXcy6CXY=;
        b=gem1cuBmrfSOpm+6ex/OPZbw8qLn24wd3amJrtki7Bb2gY7IeiEBaYVTt5ujMX2OdF
         NT69sD77LGwIoI8bd/9b6r3fDCrdYESKig9dn+ztX6aRoOYqE53wsHlZUCksMOUjFNTu
         rtiSO+twY7nFMfSJiPDUawGIAA1MkA8N1wBBnoF+17bJEFeL3gn9wSkhE537mm6ZGfGz
         kNu1EbXNeufInsf5i6LrnY4Sf//lKg4FP74KuVXcezPtGtGii7W5FTPCRSGFXO15sbLp
         q6JpuVpqQeLV5JW17eLGX1cIDPEC4mNCvK8TEv7HRh8ZI6qXXpCocE/VUTnTK5nJKtpa
         Z2yQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=lhEI4ho9;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id o11si24365039ybm.201.2020.08.19.09.44.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Aug 2020 09:44:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=lhEI4ho9;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07JGVf0r188799;
	Wed, 19 Aug 2020 12:44:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=glsojxp4qtfGg8Khy2gOItqGH8ZRugBAjJSwXcy6CXY=;
 b=lhEI4ho9GHkjK9o86/BRbTEN5KU/rjRxy6R4lpobU/rgpZqxp337Jc1Z3lpKesmuHA+t
 aqByKWVuf05Yisu2kkL0BcDHFErfm87M3MwPXFhlZCi2sSUE6LEvL2Cj5p+WOAdQddsw
 kckYDnu4wwWYqgd/fEbXbHq+cym99QuCRXoWJa8BnittC9x4aXGgZbUCi2MRbpAMJ7bL
 XbyX654XlJXXihWQR6E8HAUP2dEvCK2FrMoTn7K1bpPXzxiqE9E0ppO2WRrdMGvIH15Z
 Lzij+49ZFBCeRam8Ethr/B5L4gQvYFrfdkZbwJD2kwXwmdyRRKclguO3/5H6co+IvCQZ Sw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 330ww9bx5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 12:43:59 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07JGVsFT189472;
	Wed, 19 Aug 2020 12:43:58 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0b-001b2d01.pphosted.com with ESMTP id 330ww9bx5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 12:43:58 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07JGQGIB031367;
	Wed, 19 Aug 2020 16:43:58 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
	by ppma02wdc.us.ibm.com with ESMTP id 3304scwcxd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 16:43:57 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07JGhu7c40173898
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Aug 2020 16:43:57 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE7CEC605A;
	Wed, 19 Aug 2020 16:43:56 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 75064C6055;
	Wed, 19 Aug 2020 16:43:51 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.211.41.171])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 19 Aug 2020 16:43:51 +0000 (GMT)
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
Subject: [PATCH v6 5/8] mips/cps: Use start-powered-off CPUState property
Date: Wed, 19 Aug 2020 13:43:03 -0300
Message-Id: <20200819164306.625357-6-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200819164306.625357-1-bauerman@linux.ibm.com>
References: <20200819164306.625357-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-19_09:2020-08-19,2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 mlxscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 suspectscore=1 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2008190135
X-TUID: O1eUo6oqC1YX

Instead of setting CPUState::halted to 1 in main_cpu_reset(), use the
start-powered-off property which makes cpu_common_reset() initialize it
to 1 in common code.

Also change creation of CPU object from cpu_create() to object_new() and
qdev_realize_and_unref() because cpu_create() realizes the CPU and it's not
possible to set a property after the object is realized.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 hw/mips/cps.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/mips/cps.c b/hw/mips/cps.c
index 615e1a1ad2..4a98cf2287 100644
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
@@ -76,7 +73,7 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
     bool saar_present = false;
 
     for (i = 0; i < s->num_vp; i++) {
-        cpu = MIPS_CPU(cpu_create(s->cpu_type));
+        cpu = MIPS_CPU(object_new(s->cpu_type));
 
         /* Init internal devices */
         cpu_mips_irq_init_cpu(cpu);
@@ -89,7 +86,16 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
             env->itc_tag = mips_itu_get_tag_region(&s->itu);
             env->itu = &s->itu;
         }
+        /* All VPs are halted on reset. Leave powering up to CPC. */
+        if (!object_property_set_bool(OBJECT(cpu), "start-powered-off", true,
+                                      errp)) {
+            return;
+        }
         qemu_register_reset(main_cpu_reset, cpu);
+
+        if (!qdev_realize_and_unref(DEVICE(cpu), NULL, errp)) {
+            return;
+        }
     }
 
     cpu = MIPS_CPU(first_cpu);
