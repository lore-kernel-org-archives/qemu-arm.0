Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp606409lfy;
        Wed, 19 Aug 2020 09:44:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMdh7C4cCYXaX4qc7HSthhJkZ8psu7FARWdYWm8hzGP3SEndnVFuilJnHe1M4QaskA4ERK
X-Received: by 2002:a63:6dcd:: with SMTP id i196mr17972316pgc.70.1597855469963;
        Wed, 19 Aug 2020 09:44:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597855469; cv=none;
        d=google.com; s=arc-20160816;
        b=zLOo24EQMWXcxPvwQkHfAkrzoYOxVwASlSzLPD/m8l6SkzOfRfRCBOP6vA0vLWiEuV
         ey9tIs0oiz+OdRoHGnoSCQ9ObCEGOdtM6XuXfL8Ma77LmSLHevCt8X3iaR0uwmBtbcgb
         P6oQg2yjuyMS9rNhhVd74ue40pzl6me1+l08C5TR8Ah4bLeDkJ1nbId6WtQUVh0thGbj
         y+EuB587tYDgFSpR0zAMCn65cvblT8Gdwrn0mcA71oJ2MRh5RMGZkEOg9AxWWNSfIjT1
         ka/efgCio7Y8ZWRYP1lP0Jm/oC9lvtI+wss4GHSdOwesiCsQoIvds2lJdUF26BPLnAgi
         lmBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=dZpLbHpmB2FodbynjJgXPtXurWZeiP4T4hkWkLJYRPE=;
        b=aHVh7O4rdTcRgLrRv2W4UQRRuUCu7zi8jjvBdPFr+F16QpSKVPB51uGBhS+eudtxog
         aUPSjtG5I1cNC7pPeiBLI+Z5bYU6z5ynjWMPHPs1g5eCrvjo9XifXMIWMR6w7dzw2waD
         yjPuxV2iOZBtSAN9D4ZASbk2Y4AAEybxkSm22FLtOfxbtJNXDpYevohAneGeglPFHaUG
         VtjLQYj/BFD+iIoAXbhZbfCCGOD99+snC9QoTq8fSaOv4xGRwr03bK5sFjlcXKqUuyWV
         wfTcQW9lX4YyGz0J83kjWLjcS0nrY7JH6hSmNFXEGQQqri9xLzuT3/TEPZgH6/4MfIBr
         2dEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=AkVs1aST;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id 190si18870322pfc.171.2020.08.19.09.44.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Aug 2020 09:44:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=AkVs1aST;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07JGWqC5074445;
	Wed, 19 Aug 2020 12:44:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=dZpLbHpmB2FodbynjJgXPtXurWZeiP4T4hkWkLJYRPE=;
 b=AkVs1aST4w7ktyhFRnZxFvVmy0c71oOYZ7PSh4AeCwLUcecFYTaqkbTiQ8PN+PZLuSwx
 ui4Su9ktAIFCkWZrfnCEaTRYvn4SGfUUuIXMqYY5hX8odb2gYvALlXs4mOry/haYd56y
 bALdFZ61lrV9wGv1XEsMRx3LCw0cwuwkp+cjfu1Itrt50HCirog1VvKLmJfR1jNStG1L
 zijarbt9T9jtl/KdSHfg5uu5mU/27/1V56TA+LznBDncAyR5trIVX8m82WZHAFAzeRn5
 uk3m6thktWzeRHyvEg276D+pdF7E8woVFRpapE4LyjiuC8rxQP2Abzj3XPEufrl8LAc8 ww== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 330ccb8efa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 12:44:05 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07JGX5hB075429;
	Wed, 19 Aug 2020 12:44:05 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com with ESMTP id 330ccb8eeq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 12:44:05 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07JGOXJd018228;
	Wed, 19 Aug 2020 16:44:04 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
	by ppma05wdc.us.ibm.com with ESMTP id 3304tgwbxd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 16:44:03 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07JGi2bh60490104
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Aug 2020 16:44:02 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 83DADC605B;
	Wed, 19 Aug 2020 16:44:02 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E0F7C6055;
	Wed, 19 Aug 2020 16:43:57 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.211.41.171])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 19 Aug 2020 16:43:57 +0000 (GMT)
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
Subject: [PATCH v6 6/8] sparc/sun4m: Remove main_cpu_reset()
Date: Wed, 19 Aug 2020 13:43:04 -0300
Message-Id: <20200819164306.625357-7-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200819164306.625357-1-bauerman@linux.ibm.com>
References: <20200819164306.625357-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-19_09:2020-08-19,2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 suspectscore=1 impostorscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008190138
X-TUID: 2TXc2BFya8QD

We rely on cpu_common_reset() to set cs->halted to 0, so main_cpu_reset()
is pointless.

Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 hw/sparc/sun4m.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index cf7dfa4af5..22c51dac8a 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -218,15 +218,6 @@ static void dummy_cpu_set_irq(void *opaque, int irq, int level)
 {
 }
 
-static void main_cpu_reset(void *opaque)
-{
-    SPARCCPU *cpu = opaque;
-    CPUState *cs = CPU(cpu);
-
-    cpu_reset(cs);
-    cs->halted = 0;
-}
-
 static void secondary_cpu_reset(void *opaque)
 {
     SPARCCPU *cpu = opaque;
@@ -827,9 +818,7 @@ static void cpu_devinit(const char *cpu_type, unsigned int id,
     env = &cpu->env;
 
     cpu_sparc_set_id(env, id);
-    if (id == 0) {
-        qemu_register_reset(main_cpu_reset, cpu);
-    } else {
+    if (id != 0) {
         qemu_register_reset(secondary_cpu_reset, cpu);
         cs = CPU(cpu);
         cs->halted = 1;
