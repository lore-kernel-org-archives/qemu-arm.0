Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp606845lfy;
        Wed, 19 Aug 2020 09:44:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGrvhSHlQzTlQGe6eOyQWHvtFeMb0wcfKY2HnzyWt4Lx6YTbCEoVv5riRzlmV6PXRYIpKH
X-Received: by 2002:a63:d5f:: with SMTP id 31mr16909187pgn.331.1597855483868;
        Wed, 19 Aug 2020 09:44:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597855483; cv=none;
        d=google.com; s=arc-20160816;
        b=AMr8LQVBcf70N2kgthMZLlrWVonhIouzvbpag19RlE4UatAYBuWGiFbgLjVq1VnIw5
         OHqQLLe6y2tZg2awEIlvlVAERQVymugrMuBO0uRMPscYImutS4QFgI2bUhCCLbVj0tq9
         k7mukXM0JCK/MoX5WNWP5XlYIuNu+NSss5JyeuY5IBqyeMhLVhcFcUesj/vQHeFwSpOl
         fErydaMQj+317m+nFA1EoLQmryLchgSvu1pjcSTLHbNwy7Hf9Kcr/gRanh0Pe5q5vW2+
         Y71EUtLZOmxWyRcMmKM/0W50tpk6HAeOGh4rfcBkwtNn3NzdeqJ+q15XLEAHscrDYa8+
         7APA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iJtdvxKa+XZtymxYM+PkmbRZGwJ9gc6rD4nqdrm2uws=;
        b=W7eOs9MBaQ/SlVBSOzQdKnE8t/ft2lvuYc7XiRP+8e+hW9rpBrMiex7sow2VL46j5H
         pY+FOa+BDsm1rZ+LxjCuifGT5WbIGqh1WrhWVr7fGg2ltEq0V+y5pTu66AG63kQcJhAR
         2u2rM7iOwYrJMUPZ4xcJdXKrbnxJbVx5y5yQ2gVRGdQxhh9Hzu4BeWKduVzqnb44T0Qv
         MfIdNKSYKLFPCSaFzVcf2EgmQtMLvhGlJRld/qf+mIC/QK7PAvJ1Fi+i8pAjO9w3QWKF
         x+oA1EikToJsE4vAvTkCMfSlxwMBi48KbvXtlM7bwYOiL9ysj0yHyqv23OPn7o3NF8CX
         4W1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=qX8PPFE5;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id z6si3037311pgp.512.2020.08.19.09.44.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Aug 2020 09:44:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=qX8PPFE5;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07JGWdFQ103600;
	Wed, 19 Aug 2020 12:44:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=iJtdvxKa+XZtymxYM+PkmbRZGwJ9gc6rD4nqdrm2uws=;
 b=qX8PPFE5e47lXdpYKiE4SAzFQvDtTim3UZw5roXpBF1S58C+OyCTkirIBIq57KR77hVQ
 uzCYjFOQmFPAci+Up9avMYu7gohdR00OdBSEznfFu89j2JlOZU7fVC1sdNAHca+0M7Ys
 yrJ6r/DCz51yjRipvHYs7SUN+ABWL+QUsqoHJ/TP5w8KuIMUB2HS0C/nsgxQim4rF5Jf
 my+d2P4+ahKgbE2H+fjnM5Ej0pAnf/fEJiFUJXXwwM70zJDFR+u/ISlQuuZtsYHBMDe2
 AJSPIW7+X99/cMBP7EOPyLr6IRs/6W3vNx96Rqp6Q3YVLxDOtPVqhhqdAxo6eM3Z9GvY Zg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3310eyfkn8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 12:44:17 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07JGYMaI108216;
	Wed, 19 Aug 2020 12:44:16 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3310eyfkmq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 12:44:16 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07JGQFZl012238;
	Wed, 19 Aug 2020 16:44:15 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
	by ppma03wdc.us.ibm.com with ESMTP id 3304ce5g5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 16:44:15 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07JGiEgu40173906
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Aug 2020 16:44:14 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 34451C6059;
	Wed, 19 Aug 2020 16:44:14 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C02B6C6057;
	Wed, 19 Aug 2020 16:44:08 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.211.41.171])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 19 Aug 2020 16:44:08 +0000 (GMT)
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
Subject: [PATCH v6 8/8] target/s390x: Use start-powered-off CPUState property
Date: Wed, 19 Aug 2020 13:43:06 -0300
Message-Id: <20200819164306.625357-9-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200819164306.625357-1-bauerman@linux.ibm.com>
References: <20200819164306.625357-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-19_09:2020-08-19,2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 suspectscore=1
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008190138
X-TUID: OHAohuh+K426

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
