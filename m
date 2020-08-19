Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp606257lfy;
        Wed, 19 Aug 2020 09:44:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyB21Z5YXKZGmAacosxtyH/NC1IXEBcqSJdD/GA5qNIbBfIqe5XtETpn6XQZmAyuwCX1bzX
X-Received: by 2002:a25:3b4a:: with SMTP id i71mr32921540yba.464.1597855454423;
        Wed, 19 Aug 2020 09:44:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597855454; cv=none;
        d=google.com; s=arc-20160816;
        b=HtNbuHVHrOTrNnEflw7rexSEmPJsknGetEl+Pcnofu7nYQdaR6TMJkOQ/AQyhCUnCn
         KXrRjGjSRV6dVkpcHpebjc+QFKVyr5cvmENkBlUL4KMc85ohomLzHU5wV/ptEo+OtXKA
         LlMU0OMm8V52FH2FT5K15uI4twtmDDNt0HnDKAU2gvlpto+nCNHAv63Crj/NKGX4Aw+K
         UL9F7mEN7+798KLiuRfa2VAUUlS7cb8fCkY4Q8gv7/1ZSwSs/RukAfsULPJ1yK15J8Ze
         WcHjhUXt41G8c+qFfBsU15xebc1nt6yCBOKhC/99/vbUA+MbfdHeQpmwl5bPZclibHLE
         8+ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=r2BmvyAmYHEGvGkHmLwrHK+cKApYuesXX55h9lGayGM=;
        b=e0NslTwEnxuxY3WeKLH5UO4ny30uyagmuzDzPgjdyf5KwT+UBIeoE3sWZJEc3cX6xy
         OmA7UFtmlpPnfk6A+pwuo882uTS9R+HYukEptM8azOsV/7s0nGkm32W5zsmW/TmPOufR
         2+YhGnpUUVsf7mXCnM9MXkW3IVVe9PCFO3hOfLF7hScSzntJh+m0rKhUcXZlJ4XYIvIY
         xskKPTLNF3H7b/C0hlLyQe2OmZmPsIgwYoATuY9uA6vZXTuH8nQKDqeaJxZ/WqstUqn+
         DbHCYK1qSkzy2k8sHoAcXcRXRvsX6Oxrmr56LcakZgoSGopbUPqW+FZ0VeIAAWbFNKdS
         OJ+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=ihLjJs38;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id x3si24078540ybn.390.2020.08.19.09.44.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Aug 2020 09:44:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=ihLjJs38;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07JGfX3R031821;
	Wed, 19 Aug 2020 12:43:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=r2BmvyAmYHEGvGkHmLwrHK+cKApYuesXX55h9lGayGM=;
 b=ihLjJs38oaFtsKe0DmZW8xHbb2vtPQIot74oxqdyk3W7BqeIRw+s27AIFx3WCYBpsueI
 VX/3WDbYbYH7AZFiDDIYMBuGlL7aXHaH7e0/5UFKYmrdkH0akwbRQ1+GwiIm/bxE7psC
 nUNoN5ZpSN/Jwp/DT7BbmS/atvdU/R5g5cWnk/K9c15IpImPIPxtHWWhLWHDnmNV8iN5
 O9gPLy9dnv4pmSo4ewKUPs+Y1rPjNJLTRtgq4Az108/olKE62XY6QULAYHOzbFc2l7WK
 2ERlQn9n3SL707bxcfEa07MtisO2gSTU+ZzWABbF/gh2gb8Wk71wB2TdEkUoPi84JTlg /A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304r4ph8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 12:43:54 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07JG3mo3032132;
	Wed, 19 Aug 2020 12:43:53 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304r4ph7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 12:43:53 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07JGOdSp006817;
	Wed, 19 Aug 2020 16:43:52 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma01dal.us.ibm.com with ESMTP id 3304ccgv5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 16:43:52 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07JGhpFs66585016
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Aug 2020 16:43:51 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 115F4C6055;
	Wed, 19 Aug 2020 16:43:51 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B646EC6057;
	Wed, 19 Aug 2020 16:43:45 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.211.41.171])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 19 Aug 2020 16:43:45 +0000 (GMT)
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
Subject: [PATCH v6 4/8] ppc/e500: Use start-powered-off CPUState property
Date: Wed, 19 Aug 2020 13:43:02 -0300
Message-Id: <20200819164306.625357-5-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200819164306.625357-1-bauerman@linux.ibm.com>
References: <20200819164306.625357-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-19_09:2020-08-19,2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 priorityscore=1501 suspectscore=1 mlxlogscore=999 mlxscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008190135
X-TUID: 5wfY5h82iAEW

Instead of setting CPUState::halted to 1 in ppce500_cpu_reset_sec(), use
the start-powered-off property which makes cpu_common_reset() initialize it
to 1 in common code.

Also change creation of CPU object from cpu_create() to object_new() and
qdev_realize_and_unref() because cpu_create() realizes the CPU and it's not
possible to set a property after the object is realized.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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
