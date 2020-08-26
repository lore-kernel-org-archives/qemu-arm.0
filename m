Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp473230lfc;
        Tue, 25 Aug 2020 22:57:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz76MFZMnRP37//SiJgaCvxSOLE/pULEyeam2rxrdVH3CSfNI5t+1HcHxbFGgd1sxH1W+1E
X-Received: by 2002:a63:4916:: with SMTP id w22mr9196597pga.373.1598421426594;
        Tue, 25 Aug 2020 22:57:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598421426; cv=none;
        d=google.com; s=arc-20160816;
        b=FnQ4y4AzL6TSJ+N3/+5W4k0u+8x6CSPh+jrZc87vrYkFtJkL/1DSyOFLT+Aiz+/amC
         F9+oMtWPozdsgRsCPLh/LgbA+zSsRWED5rI2qcTxUwt4jhrDo0yZLTgAdO1UrcMxk1+d
         Ku8i3GT+UicTg/K70sUJPKXDJDRV88KCKY3oetPHT9d7+/+KmufOC1K+aXFaGZx9N3It
         duTI0b9hPx0grW/ijYRxSrMB1CfIwR45Gtsf+g39uBfFB1Kylimz9TTVmatQZDdGC5uc
         4Azg5qKRLjDWiQuaFC0hQA8Zaua5YcbmkIBuVFxvDCBLk/Eq92Vu05kRjS8emtr7EI2r
         eLVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iJtdvxKa+XZtymxYM+PkmbRZGwJ9gc6rD4nqdrm2uws=;
        b=xt09wrbh6W8u97L5luv9UOv3YIGy3iYeNOgEITjkoQYlB7R0v8+XsEGRRrIiERDuAv
         B18Tncpe55kqYyyCRE79mHH4UWlMYLnXsRFC38BAntO+9x1wmLZ3t77WIyRp1mq1HPAC
         hL0to5NBG1y1p/MUay/ur8T/sN/qWOTfCFJQpdu++Z2BYCjJuXNemkOBSlfE8xamGm4E
         M6wB9PuYygXWSqdKzeCNgL0K4Dd+lYN2tSAnZ8WAjwLkpna5gvLADKovZQ1/XZcFJkiD
         b/LLyjw9+GfZugmUIIxzfGxCJlBC2QCwmV8VjbkT5GN5OjCdTVsPJiuhTR3H7m83h80E
         oO2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="kWs/CAMO";
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id m10si831937pjk.155.2020.08.25.22.57.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Aug 2020 22:57:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="kWs/CAMO";
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07Q5WHZ5054493;
	Wed, 26 Aug 2020 01:56:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=iJtdvxKa+XZtymxYM+PkmbRZGwJ9gc6rD4nqdrm2uws=;
 b=kWs/CAMOUax5oij4Ux0HMpc7DLknTUpvRUbfmyb7tbB7Juvn5hBw8/LapVn5dvMj9Zh6
 emDBvu4AXgSmHBxRJja++OIRCmjnJTVwRkYZTDEjFwztOgNrsUl/6ZLipPT+FBFgDB4b
 umq3jrI8OyC/geGifxOSrU6xFTZPK8yo9qHDiuHAoMT6icaQPO1U3Z3PMXVxBBNnjuYC
 zn8p5ycoO5yPqOr4GcIKG7HQ5NtKBDunY7wDjot3UM3T0jQ16y2FggZ+S6FsNP6VWYVX
 HHUNaGw4vuCqb6J7lBKrY2zi5lkfnjhne/LLp1xY6veB6syqe5Z1R3Oog2leIcI2IzaG 2g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 335f6p406v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2020 01:56:40 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07Q5ZEW4061407;
	Wed, 26 Aug 2020 01:56:39 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com with ESMTP id 335f6p406e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2020 01:56:39 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07Q5lkxI021607;
	Wed, 26 Aug 2020 05:56:38 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma03dal.us.ibm.com with ESMTP id 332uttq251-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2020 05:56:38 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07Q5uYCH27001570
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Aug 2020 05:56:34 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37383C6059;
	Wed, 26 Aug 2020 05:56:37 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C680C6055;
	Wed, 26 Aug 2020 05:56:32 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.163.48.38])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 26 Aug 2020 05:56:31 +0000 (GMT)
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
Subject: [PATCH v7 8/8] target/s390x: Use start-powered-off CPUState property
Date: Wed, 26 Aug 2020 02:55:35 -0300
Message-Id: <20200826055535.951207-9-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200826055535.951207-1-bauerman@linux.ibm.com>
References: <20200826055535.951207-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-25_11:2020-08-25,2020-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=1
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008260040
X-TUID: RMw5K1xuhkPf

Instead of setting CPUState::halted to 1 in s390_cpu_initfn(), use the
start-powered-off property which makes cpu_common_reset() initialize it
to 1 in common code.

Note that this changes behavior by setting cs->halted to 1 on reset, which
didn't happen before.

Acked-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 target/s390x/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 08eb674d22..73d7d6007e 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -291,7 +291,7 @@ static void s390_cpu_initfn(Object *obj)
     S390CPU *cpu = S390_CPU(obj);
 
     cpu_set_cpustate_pointers(cpu);
-    cs->halted = 1;
+    cs->start_powered_off = true;
     cs->exception_index = EXCP_HLT;
 #if !defined(CONFIG_USER_ONLY)
     object_property_add(obj, "crash-information", "GuestPanicInformation",
