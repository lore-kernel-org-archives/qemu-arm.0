Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1281910lfm;
        Wed, 22 Jul 2020 19:58:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/E3DGzyGAvqBSwnANOan0hcu9DGKtbEszRvIQ5tSuCGNXyuzhRCyLRSIwlAusmKNTADf9
X-Received: by 2002:a17:902:7149:: with SMTP id u9mr2201282plm.84.1595473088839;
        Wed, 22 Jul 2020 19:58:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595473088; cv=none;
        d=google.com; s=arc-20160816;
        b=uEELPrfXxAuMEMSUwzbcO0RGeDuOGtK8pwKOpFcp2ZONDEOuWWekXFAbGbtrVlbTlY
         gTn+rXs2JbKrR7M7y8LmIEUl6YdvfiauHV8kw3jueFFvgoBRLQniqBW9TJD2uKzqqyba
         uEe9RYjNvXeyl/7/Pkocf8paFBn+9NBH23WQgAcQVGS4pOPPrJZdzmBjTL0u6TqbYRn/
         ErEt+L/FfgKhhP4IrvoP9hKfluCJGB8FvmAy8Tb3wx1wyk8cVwPydGf7l8WM9qV/RrZV
         cSrx915YQApDtQmRDrORBPVleYsw+USjpiZw3VjGlGH/5/gL4S3xMrgf8QyurC8/SBmg
         nJIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=5fXBX6f8N5bZOkP6x8uJjw3QdhBUsjdbbCWTGckL2iE=;
        b=DQ0Y0d0cq/g82X1MGojOQYWCwYpkCPaVmTolfmXwB8ql+ySG+yfCbsWccOlRdnM15a
         WuLZH8tFKoo9Z2LidOwqnVGVIGh0ACsQfVkXDwT685I4A49noBewNCMpnlAFJVZtDq/c
         A4RDzC3uxrvVB/IcR4Y0SC9lCgA+AICjyCth1WhEmUNZzloxVb9i0/v+XEIulPR5xzu6
         HMOS33PlEAzqqPGXzGDxfdPOhs76bTW5VkRC6Z+163BCQ9eUax2DhiHb+QFexVvg9TU7
         Cm1O0ZJ3to93GRD5kQLivsko6ZmwGFrgAPdsmXEUzSmoKCfNRyPF7vIdwSkcdkP4T4Zi
         mS2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id t98si1012276pjb.81.2020.07.22.19.58.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Jul 2020 19:58:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06N2Vnrn018072;
	Wed, 22 Jul 2020 22:57:47 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32e1vufp24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2020 22:57:46 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06N2iSWL052808;
	Wed, 22 Jul 2020 22:57:46 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32e1vufp1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2020 22:57:46 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06N2oPN6013498;
	Thu, 23 Jul 2020 02:57:45 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
	by ppma02dal.us.ibm.com with ESMTP id 32brq9u9yp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2020 02:57:45 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 06N2viZS50332150
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jul 2020 02:57:44 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 95DC5AC059;
	Thu, 23 Jul 2020 02:57:44 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D5687AC062;
	Thu, 23 Jul 2020 02:57:37 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.211.93.190])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jul 2020 02:57:37 +0000 (GMT)
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
Subject: [PATCH v3 3/8] ppc/spapr: Use start-powered-off CPUState property
Date: Wed, 22 Jul 2020 23:56:52 -0300
Message-Id: <20200723025657.644724-4-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200723025657.644724-1-bauerman@linux.ibm.com>
References: <20200723025657.644724-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-22_17:2020-07-22,2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 mlxscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=1 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007230014
X-TUID: tm+MHxEVLtCC

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
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 hw/ppc/spapr_cpu_core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

NB: Tested on ppc64le pseries KVM guest with two threads per core. 
Hot-plugging additional cores doesn't cause the bug described above
anymore.

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
