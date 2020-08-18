Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3458169lfy;
        Mon, 17 Aug 2020 20:34:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJr18AlT3H4KNQiE+5OIakdeg7XAMMwsgMHHi3nTz+BxHw1wu0UeEJJTzXbcExitNf4/vj
X-Received: by 2002:aa7:96e5:: with SMTP id i5mr10793743pfq.108.1597721689174;
        Mon, 17 Aug 2020 20:34:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597721689; cv=none;
        d=google.com; s=arc-20160816;
        b=nzsTNzI4R/imxfpSqGF6eVB4/EbZ2k9BSZh5GG8Orp5M7raSRS2glBlS8sqf9Tm3iW
         35Fff+RvypLL7kgC71gUXVfOaF0e27BlIcyYAsfvwQz4kPZBXeoGipC4QQChwUCZGNx0
         8HHktVw7upuvDRkAKBj9+btK7Qa3ZW/S4pVDC1xmP9Eh7KRr6meGi46CIg283Nt+O9Bf
         4KE7QAQA+2Gb06jzCEgzEHnKUlv7fBTteJ8CzDAaG8X3Rn51/dNrpdytnDKphj6j1ohn
         wo4vswapvSEn9f7xN3OBzzqFVFpUXlGobwPROqCDSW2VUpv6cdT3h8JRffKDAi8fscVF
         sT9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Vc2zx12UOMaphWtyABPPHXpZMOTQHMRCgSz79WbZ/Wk=;
        b=1KnGJDsh5yOq3T7ovUQ0GVPFXvQMaTkgm1I+abwj57ecPKVWMbnKu0i20aHib83vXs
         vw1D7FKkzBY9ktcD1TuH2rq0F3GN1liVM195Z/mOSZc7XDmCcSpbAKMvJwDQfE5XbAuC
         zRWy3H9HLjtBtJd8CMHau+8/du7VSwPCXQN9LQaiweg3EdulVMCop32i57aGoxIqvEd1
         gokrvTWKs3gSpkfTnsUBRWRKTCGOLm3LlhefVL6avjzHA0pDtDQmvdr7gI16wBw3JpT2
         o6mMBuBG/w6dq3szhdYxicjoIFVCXJLk5sH32YuEfKCxMVCi8oJf7eWYvOaKHBhObWrz
         sxSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=fPfvXdPZ;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id t7si14849140pfh.191.2020.08.17.20.34.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2020 20:34:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=fPfvXdPZ;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07I33Xgb073959;
	Mon, 17 Aug 2020 23:34:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Vc2zx12UOMaphWtyABPPHXpZMOTQHMRCgSz79WbZ/Wk=;
 b=fPfvXdPZ52Imk4Rsfhg/G4nPTOojNiRP+YihT1V3aTs8PCEqgZX0hiVNEOopbcdfoOY5
 ++C9ihSkRHygFiGn3RQ8ppkOfbygWgRjSLv1JLMhT/HbcC4jk3nWRdpu6XNkD00IzbwP
 5Vbui92eXlWoraPHQ2fWxxsjtvuL6VosEh8FTrcDrWC5bcUdnm33ZL3x/9Wv18EQG2QA
 XkVSFS+5hSoZFhUOOjGKn5O5DuzR/ES3qOXGsr2H7biUU+l5s3rKXp2d0zfM3NgHg+4S
 SfrH0/axnYo2HLO0gdeKeaszHT3mSGeN/Jlro2M+jz1DbOInZ80puY9QItcem3KwQo8j Xg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304r2u4ra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2020 23:34:25 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07I358Br081098;
	Mon, 17 Aug 2020 23:34:24 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304r2u4r2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2020 23:34:24 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07I3VGpF012918;
	Tue, 18 Aug 2020 03:34:23 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma04dal.us.ibm.com with ESMTP id 3304uq8y5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 03:34:23 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07I3YMwH50004342
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Aug 2020 03:34:22 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCB72AC05B;
	Tue, 18 Aug 2020 03:34:22 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 71130AC059;
	Tue, 18 Aug 2020 03:34:15 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.211.138.167])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
	Tue, 18 Aug 2020 03:34:15 +0000 (GMT)
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
Subject: [PATCH v4 4/8] ppc/e500: Use start-powered-off CPUState property
Date: Tue, 18 Aug 2020 00:33:19 -0300
Message-Id: <20200818033323.336912-5-bauerman@linux.ibm.com>
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
X-TUID: ZOJfe0IMn7sG

Instead of setting CPUState::halted to 1 in ppce500_cpu_reset_sec(), use
the start-powered-off property which makes cpu_common_reset() initialize it
to 1 in common code.

Also change creation of CPU object from cpu_create() to object_new() and
qdev_realize() because cpu_create() realizes the CPU and it's not possible
to set a property after the object is realized.

Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 hw/ppc/e500.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index ab9884e315..0077aca74d 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -704,9 +704,6 @@ static void ppce500_cpu_reset_sec(void *opaque)
 
     cpu_reset(cs);
 
-    /* Secondary CPU starts in halted state for now. Needs to change when
-       implementing non-kernel boot. */
-    cs->halted = 1;
     cs->exception_index = EXCP_HLT;
 }
 
@@ -864,8 +861,9 @@ void ppce500_init(MachineState *machine)
         PowerPCCPU *cpu;
         CPUState *cs;
         qemu_irq *input;
+        Error *err = NULL;
 
-        cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
+        cpu = POWERPC_CPU(object_new(machine->cpu_type));
         env = &cpu->env;
         cs = CPU(cpu);
 
@@ -897,6 +895,19 @@ void ppce500_init(MachineState *machine)
         } else {
             /* Secondary CPUs */
             qemu_register_reset(ppce500_cpu_reset_sec, cpu);
+
+            /*
+             * Secondary CPU starts in halted state for now. Needs to change
+             * when implementing non-kernel boot.
+             */
+            object_property_set_bool(OBJECT(cs), "start-powered-off", true,
+                                     &error_abort);
+        }
+
+        if (!qdev_realize(DEVICE(cs), NULL, &err)) {
+            error_report_err(err);
+            object_unref(OBJECT(cs));
+            exit(EXIT_FAILURE);
         }
     }
 
