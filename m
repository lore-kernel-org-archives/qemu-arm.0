Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1282030lfm;
        Wed, 22 Jul 2020 19:58:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4B7E+YvcnLfzuRjQEzfnpzy4HweHwENLoyp4OhSsoh35bbqr4oMuiIEVRsgymlLf0YLBx
X-Received: by 2002:a63:af01:: with SMTP id w1mr2455691pge.23.1595473101201;
        Wed, 22 Jul 2020 19:58:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595473101; cv=none;
        d=google.com; s=arc-20160816;
        b=mSZtnh2aC8aZr/arRMXVMI2cTMmfU2RlOMVuFIM6S2ulvIdqIYkv2ThOLrrW+Ti4pt
         mdBI5voYB5ZpBweEOumOQLhaGLhblj2Sm5l1UhQxvJsGo2crtyPYjoWxBDHywfyJVgD3
         HrToWL7vymsqj8xmTOriuqPK5dNWjqkwro5zAhkIyofUu3aCBtAt6F9JIroTpmoVKuve
         f5IQ2/m4RbPcD1RY71blfP49RAXZkwryF04Q324Jh4hkT1MUASVeMiHBN5qjobuTUOBU
         ClrTk8oKYa5nrhceKCRKRMquOtNmPowwEPh2YBEgUsxisfCOxuYsdGQacZLD6S+ublvs
         3VhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=I/QshspLnRdWVLVGr1AaKZpZw3CK2uct3ZuCH9r2FNU=;
        b=TKpTzPzU/hVEcB+hjMp6rKl+Mires5vDFNJAjvjoeUdWYfuSv0WMszSsaj2FmGvvy+
         OrDPleD4Sljr8is0Bk3DZKM9LwmWzfcTcFc9UeZiLScEv0qD9kQI+yzWxNWF2Z//zeiC
         7ysQoKOW1hykAWQqaR5EnVU5tiKQ4jmqAisP6BDOR/qdDWLTC5Oxm/QqodEi7rulb27A
         XvDgjx6LSuJZKUhq7Wa87Q7T+BquOinkN+XiUHy2cOkkZHtKLGk6Lnq7DVdBFHhlEWlA
         E3Ju3O82Et3IbUIMPwmvuHZW8BJ6D+xyRVln8MyDRnZsCZunAsWa12x1X6s8GpHP1inh
         XncQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id p9si830884plq.27.2020.07.22.19.58.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Jul 2020 19:58:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06N2WFEj048962;
	Wed, 22 Jul 2020 22:58:02 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32ecpb5j07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2020 22:58:02 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06N2qUlL105138;
	Wed, 22 Jul 2020 22:58:02 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32ecpb5hyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2020 22:58:01 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06N2oxeX016127;
	Thu, 23 Jul 2020 02:58:00 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
	by ppma01dal.us.ibm.com with ESMTP id 32brq939rt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2020 02:58:00 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 06N2vx6811207650
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jul 2020 02:57:59 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC5C8AC059;
	Thu, 23 Jul 2020 02:57:59 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A235AC05F;
	Thu, 23 Jul 2020 02:57:52 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.211.93.190])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jul 2020 02:57:52 +0000 (GMT)
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
Subject: [PATCH v3 5/8] mips/cps: Use start-powered-off CPUState property
Date: Wed, 22 Jul 2020 23:56:54 -0300
Message-Id: <20200723025657.644724-6-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200723025657.644724-1-bauerman@linux.ibm.com>
References: <20200723025657.644724-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-22_17:2020-07-22,2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 impostorscore=0 clxscore=1015 suspectscore=1 phishscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 mlxlogscore=961 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007230014
X-TUID: l7DFBSylDcIO

Instead of setting CPUState::halted to 1 in main_cpu_reset(), use the
start-powered-off property which makes cpu_common_reset() initialize it
to 1 in common code.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 hw/mips/cps.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

NB: I was only able to test that this patch builds. I wasn't able to
run it.

diff --git a/hw/mips/cps.c b/hw/mips/cps.c
index 615e1a1ad2..d5b6c78019 100644
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
@@ -89,6 +86,9 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
             env->itc_tag = mips_itu_get_tag_region(&s->itu);
             env->itu = &s->itu;
         }
+        /* All VPs are halted on reset. Leave powering up to CPC. */
+        object_property_set_bool(OBJECT(cpu), "start-powered-off", true,
+                                 &error_abort);
         qemu_register_reset(main_cpu_reset, cpu);
     }
 
