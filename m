Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1281974lfm;
        Wed, 22 Jul 2020 19:58:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy38jGYY8JSK6bVoPit7df3XMl71fzeLvbXT823eXiBSKzNh1OcApfmOJaLMzJERbeN/N48
X-Received: by 2002:a25:3d87:: with SMTP id k129mr655495yba.356.1595473096774;
        Wed, 22 Jul 2020 19:58:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595473096; cv=none;
        d=google.com; s=arc-20160816;
        b=UYrOqwk3Fj2OUW/QrpqKTOTYZOT0pv6ziwsxSy8jp+4dxic1WJTgjrFx+1aEeOaB2d
         98BDvNTJ2bi+aLerB6xI2aB7wvWrcA/6EQ5+2zIc0bdGEUOQi43kC1Xbqy8TpCQdEEtq
         XLP385JgMmvIGZmWhnXK9PcWpgkdvlCwqD7nILecXVZaBpPzA9m9wpm9SAZoOXFCmgfX
         DtQlUuxov4TjUm5/skPu2bxsI6TNsVzeSESUYmXB1ymrfQc+rbrdFz8OJ6v1aHqQZzCm
         owrIGqtGHNNusIbq1XI56zXjmwPVhDLnAhgfVxtXcUAH2laPoXDK51uAROAVK3DxjS4D
         H74g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=A96b293kqnPHFykOlIsxcYnGXrubEn+ozKf77EeYlO4=;
        b=Tr9f6NOhi1uBiS52jsiWikpwP+NcB1MRowysUKt14jiqORljD8yxAWz1e3mLyb9uqA
         8/pHr5OX4hMr6jcJltLM7z9vgyF8GvTorkN27nMhnT4UXURmJKlOvq2+AxX4guaWBTiE
         BeS94aYzWNgb++8/uhZHv3UnZX6omcYqa7fgIY6TGlIiLd39AmwCri2N9brE2/4S3frI
         JzCLr+oecBAP0U3jd9U7vfopfGWoli0kB2OLF5GHJJFW2Z2FW6x3PvykLY4rJbJ0f3VT
         qg6c0YLKYErIGqhQ25NBR2FFFPDq1X2rUivmGXYjf3rS3dWvD+7sfRj+kympHXN6fSFA
         YteQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id n4si1551756ybk.197.2020.07.22.19.58.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Jul 2020 19:58:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06N2ZWlZ144123;
	Wed, 22 Jul 2020 22:57:53 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 32e1vwfsk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2020 22:57:53 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06N2mfrs184668;
	Wed, 22 Jul 2020 22:57:53 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0b-001b2d01.pphosted.com with ESMTP id 32e1vwfsjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2020 22:57:53 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06N2nYsX009798;
	Thu, 23 Jul 2020 02:57:52 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
	by ppma05wdc.us.ibm.com with ESMTP id 32brq910x7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2020 02:57:52 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 06N2vppB51314986
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jul 2020 02:57:52 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2765AC05E;
	Thu, 23 Jul 2020 02:57:51 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1EEF2AC060;
	Thu, 23 Jul 2020 02:57:45 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.211.93.190])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jul 2020 02:57:44 +0000 (GMT)
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
Subject: [PATCH v3 4/8] ppc/e500: Use start-powered-off CPUState property
Date: Wed, 22 Jul 2020 23:56:53 -0300
Message-Id: <20200723025657.644724-5-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200723025657.644724-1-bauerman@linux.ibm.com>
References: <20200723025657.644724-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-22_17:2020-07-22,2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 adultscore=0 suspectscore=1 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007230014
X-TUID: 5ZIj67znqbKt

Instead of setting CPUState::halted to 1 in ppce500_cpu_reset_sec(), use
the start-powered-off property which makes cpu_common_reset() initialize it
to 1 in common code.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 hw/ppc/e500.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

NB: I was only able to test that this patch builds. I wasn't able to
run it.

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index ab9884e315..dda71bc05d 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -704,9 +704,6 @@ static void ppce500_cpu_reset_sec(void *opaque)
 
     cpu_reset(cs);
 
-    /* Secondary CPU starts in halted state for now. Needs to change when
-       implementing non-kernel boot. */
-    cs->halted = 1;
     cs->exception_index = EXCP_HLT;
 }
 
@@ -897,6 +894,13 @@ void ppce500_init(MachineState *machine)
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
         }
     }
 
