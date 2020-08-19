Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp54238lfy;
        Tue, 18 Aug 2020 19:43:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwD/NvsA/B2b2xQ2Lfo1BZW/ZQoWYYYMvuLIDXvOi2EYjlyJicHJLxjg+WhVNJx2i/5lWbA
X-Received: by 2002:a62:5214:: with SMTP id g20mr17802543pfb.168.1597804999074;
        Tue, 18 Aug 2020 19:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597804999; cv=none;
        d=google.com; s=arc-20160816;
        b=AnOM0qWswH09chTWqUG5iA6+ZeDLB84ouSm4yRsgh20UGJZiW2Xm8x7q2NEGTZcsW1
         +RVS6HDEBpF2TAAePJCnu+SliQvlirbUWdLvZe7CC/smuK1y9kfQKZggGC9rkR8/ksYA
         T0XmM7g0AuW9+/UTMMSNXEqRKDmQdi+HkqEWypkpIwZIMYWsEt+EJv6NrozhxNyXxeDD
         wMFUJ+pXJldDtRaVp2rbBzuv2etrDDLdwsNqEsb/REbFUGICuEhjsnRaMJ4couYj8RNp
         aqDeuoknfrr9cELjKVu6twNV1J3sTRDlL+ReXMrgxWXVbDSwVztPqItD7KsoXj5F+pDY
         HuuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ImfHbufiWEShYlyk8bCuzDxu0HKLaoGnoAzDATG6sGM=;
        b=il/midGQO719m49jIHbdyfyQyv1SYbQtFbthMiigBFsLO24NCCaMlpnovY+lBgDoFS
         6vE7Y4YnmqvMc81kjuYyebD3bnA+65W6eQ+mN/nH2qqfVQ4In3/s41luLTbJ9VsUi4HJ
         FCa7ESZR2tKw2T9X1HCWv7OgE3gpx9PJsGdLB+GSRUsLegwsDQxiXe1011037GCeiQ0s
         21fNuPjUoLXECPvOQlZGJiTk99U/br4t8CNTSStMEY8ROazUwZLBFP4zSYdzUNt8TnsW
         mO8D8JGkEj+M76jOzase7EiexAzfIy4FnkAr7tClVx5vFcFX7foH9eTG8NqaEc3DN+Ns
         JlwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=sTT5kFTz;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id p7si16475750plx.418.2020.08.18.19.43.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 19:43:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=sTT5kFTz;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07J2VtdB180774;
	Tue, 18 Aug 2020 22:42:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ImfHbufiWEShYlyk8bCuzDxu0HKLaoGnoAzDATG6sGM=;
 b=sTT5kFTzgCcVc1ieXQGb1nOjK8KP1Gl+cXDXvSgy7ikFNouvSo2KiGrNm9YhkflaSBzP
 6bh07nk5eePh77JDBBkWpM9xDUtB4gMo3bmY04YcSqflHMvc4EefeVOVjuYdOhv6CSxu
 vdl26zAAdgsvTa7GUipDMC//vLKw1pmJEJLFwPJ0zgDVkb4yyL1hCgGozSgGm5mHrXdh
 rM+qheSAE/Ct9s43AId0Y5Z2nESyisbvuAMgOCeY8b1FLtVq9YZoP9p2o/dyCTkYY48g
 beP/2LAJksmlZEpn+ELtjDaPNN7Uybji2s78r+FhaoA56Dv8Mc43XM7VZmonEQ/f2pbW AQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304rttv3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 22:42:57 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07J2VuQ1180829;
	Tue, 18 Aug 2020 22:42:57 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304rttv36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 22:42:57 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07J2ch4T021252;
	Wed, 19 Aug 2020 02:42:56 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
	by ppma01dal.us.ibm.com with ESMTP id 3304ccavbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 02:42:56 +0000
Received: from b03ledav005.gho.boulder.ibm.com (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07J2godN55181700
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Aug 2020 02:42:50 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D382BE051;
	Wed, 19 Aug 2020 02:42:54 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6995FBE04F;
	Wed, 19 Aug 2020 02:42:49 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.163.41.251])
	by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 19 Aug 2020 02:42:49 +0000 (GMT)
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
Subject: [PATCH v5 3/8] ppc/spapr: Use start-powered-off CPUState property
Date: Tue, 18 Aug 2020 23:42:15 -0300
Message-Id: <20200819024220.587612-4-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200819024220.587612-1-bauerman@linux.ibm.com>
References: <20200819024220.587612-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-18_16:2020-08-18,2020-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 suspectscore=1 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008190017
X-TUID: AnjpDRuIm6qK

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
