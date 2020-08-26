Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp473002lfc;
        Tue, 25 Aug 2020 22:56:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywXOLPtIIp+yphHzgLEjkxlxI7qYgnriuxY5SJUMVwmhSGIQmMqKE57Ea7NYGb+KAKYGv0
X-Received: by 2002:a25:38c5:: with SMTP id f188mr19163515yba.132.1598421398227;
        Tue, 25 Aug 2020 22:56:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598421398; cv=none;
        d=google.com; s=arc-20160816;
        b=kyOswOxmTmr2fYvCT6yo4RGubRZxVaGDbM3UrL0xS9XjNoMKwhhCcHC1lcIA9v6U0C
         hai9G4JuHF6CII9eqP8RwMP0NP0+/t/12Xr6Z8j1cpSWsg5B12SieN8SVPe+ajoj07y5
         CNiig7rC5SDzCaT4Drrl7U34YeXSwHGODVi9MwRUnn5eVFVYS2lqyUYDirdJQDnZ7R0r
         XlH1zXMOMNnaMtPYjvV9kyGRZ8DTpR4p2HNLR56nJKadVgRQbCHdydNt+Y3pIh5NP8+2
         1l7CNewQbeewcGMGHq7ied5ifxAA4q3L0iU/vu9Tu3888aQeyrFRBsgEnw1DPUVEbV29
         YqKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ImfHbufiWEShYlyk8bCuzDxu0HKLaoGnoAzDATG6sGM=;
        b=uy6H3tMEb7Zr5llwEKL6mswD+DWz3IFk5dwD6WmZ+El+HB4c0NU64CCOjKaq+FMwaK
         jTmsSPdASnpp5rmeBBjD9u5oJYWt+rKSJ8c7i1JfHm+Uhk6D4cxe7SjU7RGSY82ZrNN+
         ISFRVcpbe2vgRf0/jy08/QrRVq85NKhhqpKoIrs8uY0jd/gxud06fKo4Sc59iPlJ7Ey5
         JVMUyNEFvEStasww0iAdi20wI5MMvzavamwx175Hf9BRPeAiNA3kYWY9ZLxuSnK26uF6
         ijwgGfq/emD6y1GlIbwmxRzAREX9DY0mp54X3RkBkQZD9NKrbVy/lwb3U/EFYN6hrVXK
         GHWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=aynhe8qL;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id k8si1711568ybt.344.2020.08.25.22.56.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Aug 2020 22:56:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=aynhe8qL;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07Q5uBou042358;
	Wed, 26 Aug 2020 01:56:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ImfHbufiWEShYlyk8bCuzDxu0HKLaoGnoAzDATG6sGM=;
 b=aynhe8qLAREtpomOvPaJbPRZkebcB5/rmjgaqoo//8nWjyveBzDf6mtrKf99PF9mjasY
 lDGPtrA8Zvs/tAEhlA80NUpCgCnlexDShAKtp9z4ZkQKlOe8xZIwN+QgudRpeIxRafUC
 0aKuKEiDv9UMAq2g1RfPX0MmbbLd2RH2TiJts5Sw4djXDZ9omDu6G1b4bRBheJKzpAmo
 YijRz5rZvVPI4Uzb0szH7msFR8wYNm56m6H3JYb68O/4Vscz7qCsGD4sbuaHnS0ldOGJ
 9bNYJL+61+dcnVUgO8ptGCCZnWTGOMDD+If5OLMysHo39L97VP+SNYoH1tMZtWZL2zUt Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 335j1e000s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2020 01:56:11 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07Q5uBQQ042327;
	Wed, 26 Aug 2020 01:56:11 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0b-001b2d01.pphosted.com with ESMTP id 335j1e000h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2020 01:56:11 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07Q5lgJk021573;
	Wed, 26 Aug 2020 05:56:10 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma03dal.us.ibm.com with ESMTP id 332uttq21h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2020 05:56:10 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07Q5u9J654657442
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Aug 2020 05:56:09 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 490B3C6055;
	Wed, 26 Aug 2020 05:56:09 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88B3CC605B;
	Wed, 26 Aug 2020 05:56:03 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.163.48.38])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 26 Aug 2020 05:56:03 +0000 (GMT)
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
Subject: [PATCH v7 3/8] ppc/spapr: Use start-powered-off CPUState property
Date: Wed, 26 Aug 2020 02:55:30 -0300
Message-Id: <20200826055535.951207-4-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200826055535.951207-1-bauerman@linux.ibm.com>
References: <20200826055535.951207-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-25_11:2020-08-25,2020-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=1 bulkscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008260040
X-TUID: kPgL6JgKDthM

PowerPC sPAPR CPUs start in the halted state, and spapr_reset_vcpu()
attempts to implement this by setting CPUState::halted to 1. But that's too
late for the case of hotplugged CPUs in a machine configure with 2 or more
threads per core.

By then, other parts of QEMU have already caused the vCPU to run in an
unitialized state a couple of times. For example, ppc_cpu_reset() calls
ppc_tlb_invalidate_all(), which ends up calling async_run_on_cpu(). This
kicks the new vCPU while it has CPUState::halted = 0, causing QEMU to issue
a KVM_RUN ioctl on the new vCPU before the guest is able to make the
start-cpu RTAS call to initialize its register state.

This problem doesn't seem to cause visible issues for regular guests, but
on a secure guest running under the Ultravisor it does. The Ultravisor
relies on being able to snoop on the start-cpu RTAS call to map vCPUs to
guests, and this issue causes it to see a stray vCPU that doesn't belong to
any guest.

Fix by setting the start-powered-off CPUState property in
spapr_create_vcpu(), which makes cpu_common_reset() initialize
CPUState::halted to 1 at an earlier moment.

Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 hw/ppc/spapr_cpu_core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index c4f47dcc04..2125fdac34 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -36,11 +36,6 @@ static void spapr_reset_vcpu(PowerPCCPU *cpu)
 
     cpu_reset(cs);
 
-    /* All CPUs start halted.  CPU0 is unhalted from the machine level
-     * reset code and the rest are explicitly started up by the guest
-     * using an RTAS call */
-    cs->halted = 1;
-
     env->spr[SPR_HIOR] = 0;
 
     lpcr = env->spr[SPR_LPCR];
@@ -274,6 +269,11 @@ static PowerPCCPU *spapr_create_vcpu(SpaprCpuCore *sc, int i, Error **errp)
 
     cs = CPU(obj);
     cpu = POWERPC_CPU(obj);
+    /*
+     * All CPUs start halted. CPU0 is unhalted from the machine level reset code
+     * and the rest are explicitly started up by the guest using an RTAS call.
+     */
+    cs->start_powered_off = true;
     cs->cpu_index = cc->core_id + i;
     spapr_set_vcpu_id(cpu, cs->cpu_index, &local_err);
     if (local_err) {
