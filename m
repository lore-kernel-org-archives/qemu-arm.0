Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1282071lfm;
        Wed, 22 Jul 2020 19:58:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXNw24j+pVRYSzk9ikx/lBFvz0aaQz171aZKA4RmUE4nG3EMsa6zj1Zyh0HOAbXmFDd2K3
X-Received: by 2002:a25:ade4:: with SMTP id d36mr3940339ybe.92.1595473106730;
        Wed, 22 Jul 2020 19:58:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595473106; cv=none;
        d=google.com; s=arc-20160816;
        b=P+kOISx4ZOrhTIaTu51f2tKH1bCIMhAoDa7Cg8qhFR9hnKqKlS8rvonMkWEruTFZE9
         A1rIwP0PVMhjUOWgvIwZSAUgNhEc9jXDecNZFc+xCDOICmh/2X+5AWEzqjMotDPFkkYG
         ppa0DmoKh7J6IvmnPF0MC4q6PeAi1xFJb69YhvsCoiLFtqF9bVR8PAFWl05LwJmH4gEO
         eroNJxlGM84X+0Dd/wSG17NDVp/rKZT5ELxlqZztsJxCcezta7SWMBCiqVcm+UDnXU1u
         DwGGtyRJO9ct5V16LDXb1Dw0OXzTp0z7Ho6iE5D8pATxqOlvTyDxEVSSJl5l9zb33EuJ
         uLtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=bcPvmfrf5GrZZ94wwWx47+vCpOposhsSJifwRZe0/3o=;
        b=spaz7qWxm3z9YEzpihpcOQhFDLVzNVQ5/Tkr22wo6jP6qvo8+ClJ6f3/cf1pNcFNAq
         V3Ay7HZkDMuoFgbwtrSiQL6NxHxI5sg6Y0tPH0fo/Q3yZ4bC2kP+Fkw0/rR38avrtljC
         N7Nq0TpJGje6UY0I23kT4BNf9JvMuINK4EHhVPSdZk7hZqAJoG3UcKEIebcZY5qW3t+2
         LCsuFPPRgygo+bwNY0QU7cUri8NIRpegs4Xx9iLDXt9wx83H+/v/ZhuPOr60wmqnsPvn
         CpmgYyrYKNdCRYXQ5EMCZ684eWJc4nV2QsdJBdEnCVMIqJd6DU/NN5I/DyU6WyFG0T0m
         yG4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id w135si1549552ybe.45.2020.07.22.19.58.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Jul 2020 19:58:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06N2WDxB127965;
	Wed, 22 Jul 2020 22:58:08 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32d91wtrsr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2020 22:58:08 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06N2WMai128280;
	Wed, 22 Jul 2020 22:58:08 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32d91wtrsf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2020 22:58:08 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06N2p7qa019314;
	Thu, 23 Jul 2020 02:58:07 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
	by ppma03wdc.us.ibm.com with ESMTP id 32brq9h31v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2020 02:58:07 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 06N2w6aG16384578
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jul 2020 02:58:06 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C3496AC060;
	Thu, 23 Jul 2020 02:58:06 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 379EBAC05B;
	Thu, 23 Jul 2020 02:58:00 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.211.93.190])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jul 2020 02:57:59 +0000 (GMT)
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
Subject: [PATCH v3 6/8] sparc/sun4m: Remove main_cpu_reset()
Date: Wed, 22 Jul 2020 23:56:55 -0300
Message-Id: <20200723025657.644724-7-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200723025657.644724-1-bauerman@linux.ibm.com>
References: <20200723025657.644724-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-22_17:2020-07-22,2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=1 clxscore=1011
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007230014
X-TUID: ibfcDZdVCBUK

We rely on cpu_common_reset() to set cs->halted to 0, so main_cpu_reset()
is pointless.

Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 hw/sparc/sun4m.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

NB: I was only able to test that this patch builds. I wasn't able to
run it.

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 9be930415f..f1d92df781 100644
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
