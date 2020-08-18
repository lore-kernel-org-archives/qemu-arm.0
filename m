Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3458152lfy;
        Mon, 17 Aug 2020 20:34:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBsmQ1n1qLNe78Z/MzMtZyZD4xuKAUng38vLv31vMetMUN4pbUIgXrb2Ka7+aTF5C7yhUB
X-Received: by 2002:a05:6902:4a8:: with SMTP id r8mr21522094ybs.424.1597721686846;
        Mon, 17 Aug 2020 20:34:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597721686; cv=none;
        d=google.com; s=arc-20160816;
        b=T/fpkU+JJEwCjggi3U+fbeT+oOdd3VLO1l87Ohg5MmoxNbmIso71KBYazvUIhYHAYs
         0GVdrD96XPJRKRrheL38CFiPdBfcLU3EAU5t3MOWcyI9pMKIpJpLeZUf7zHSlMkm/vlk
         5IyO99w5VXqNJoQ76GIxkXwjH/aXPZKsivgBAlfo38tsVlQSMlCwNHs5DTT/+SICtXu7
         HttCl77iV1YcS99AJEa13y4BuRUxr/IpOF1RNOhg88zROa3X+sQbCTlPSMky9WcdSIjX
         xC6IHgaaMnkuj6f4sZsE2NarOv8uJu074W7c4wp+KtnADBwiwsE0Qtb6Xj08gozntXgR
         RW5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ImfHbufiWEShYlyk8bCuzDxu0HKLaoGnoAzDATG6sGM=;
        b=TWj6teQ3EJ5XR/g2pYZX3NHJ5NQM1YemhD3CjpVBlgC8AJvTN4Geb54Q7ZchmmPx5K
         Zmfr1X68bQ14+LQq9XsO9nIza7F9EhdZR+6no5sSmjJsk++dbJJsy3MuhD12DWrnlVIZ
         yGjofcSvrP4nA2ARr/Hc+p0Z6UvQExC8aspNsSXmS14+rc6wPT2+M6TfzFLftNIoqyCk
         UoX5ZJ76Lr5zQD667AeLbS35vGGma1sEZgxWLLNghCQ9xPGdEaNbiTkhzqLNxX/QGCo2
         ysAtHo0zaOrNo1DDuD98a+XhI8plhZJ9ZP+BDHOsPQI15w9O8ODrt7GO9t2uDP3IAUhu
         P3BA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=pH87TPQ8;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id b18si18618714ybr.89.2020.08.17.20.34.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2020 20:34:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=pH87TPQ8;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07I3WR11000833;
	Mon, 17 Aug 2020 23:34:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ImfHbufiWEShYlyk8bCuzDxu0HKLaoGnoAzDATG6sGM=;
 b=pH87TPQ8q97N8xl5NB/lY4Z0mTX8yXMsGmT2XU2DN1RMEWsTFBZj6pnz+7dBvr9Znx9T
 2OhFi7h1/yreZDplFQmuYbEk6hHoIBA7EYEqWMqzT1U+ua4Ii9S362a8PjxFoNBrXgxf
 U3mHg/nFoTVRysgbIRFrsCGHg2D5hdujQHnL6cTGHvnABOWL+NoAKTZu4SIQGmfpTK/+
 Ms7rcdKduc5WMjVgB/OIIzq4oRwqZukcMIHyM77y5k2feaMRIz+cTai8F5uuvK4t7Q0p
 37Ney28Lc4xGuVwG7zfPrYU3HmYNKdohZAK7F3NP+ynCo+t71MWfH5k56Wd1Ejqye9y8 KA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 3304t133wh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2020 23:34:17 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07I3WSLq000882;
	Mon, 17 Aug 2020 23:34:16 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0b-001b2d01.pphosted.com with ESMTP id 3304t133w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2020 23:34:16 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07I3UXPb015644;
	Tue, 18 Aug 2020 03:34:15 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
	by ppma05wdc.us.ibm.com with ESMTP id 3304tggsbd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 03:34:15 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07I3YEQS55312694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Aug 2020 03:34:14 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CFA0EAC05B;
	Tue, 18 Aug 2020 03:34:14 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A8796AC059;
	Tue, 18 Aug 2020 03:34:07 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.211.138.167])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
	Tue, 18 Aug 2020 03:34:07 +0000 (GMT)
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
Subject: [PATCH v4 3/8] ppc/spapr: Use start-powered-off CPUState property
Date: Tue, 18 Aug 2020 00:33:18 -0300
Message-Id: <20200818033323.336912-4-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818033323.336912-1-bauerman@linux.ibm.com>
References: <20200818033323.336912-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-18_01:2020-08-17,2020-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 suspectscore=1 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008180022
X-TUID: C9YzZsJVfAcX

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
