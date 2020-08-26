Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp473142lfc;
        Tue, 25 Aug 2020 22:56:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2fWEQ0omg9ycTZDqROWdYxgKYZt21O54T8anaZi4bci2Yworcfk2ZIonge6Wt+wRjxxnd
X-Received: by 2002:a17:902:bd49:: with SMTP id b9mr3238999plx.196.1598421415082;
        Tue, 25 Aug 2020 22:56:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598421415; cv=none;
        d=google.com; s=arc-20160816;
        b=A2oOMDPGrfkRFLZgDv8e0m9IoIV3IPmd3MnRfJxuvkPe2ak26hiDgYt24+jOOIgd/8
         Cp4VblvyjEstFOh6+0PcdZm9cveoFtvhaEWlMPinLiGUPkJcAu4JYZzPFgnT2y4+5Dcj
         1xlYH2bjRyccJTze9L4kuTLHjEu+M4oF4iO9aFVLJIKBQ6y6ttbDxhPsmNyqancKkEWX
         6huiD02Cz6bGP6xtngVAJ3xvy8GBA6LZP3KVzQ2/W5FKEjuJBxC5qGOg6T7DgpFGXZRX
         NFxEtjPLCwpKDib3Z0WI/S314G/F4mFJPEbEnvdZCjYbyTUQGc55lZbNx+LF52moxCNy
         X2Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wcozulgcpqPylsZTrgmzgmyFL/R2nv2XemoN+wFJmJI=;
        b=kdGeczxfpF8kkEBghc0AUdc1Fdbkb+EXkHh1Md3brnJThEVBte7mJFfG2yoqHAtFYV
         YpMf0VrmzbHMjt0lVPgkVD1nbLNVawid57v+1j9JPkDXPHnF04UOUY5vSO7fNJvuf3pH
         V0ND3pkIHOhDgxie2HVm7y46lo6KR1e0IcP/dR+cNCqlegpt5wTpV2sV1JNVU+Y6TBJo
         A4bRuJoaEyT3eiSYWDghVElw+prW1xtIRVy9r5UDsr24AwguKgPbPxrS1LdftcdmrgFP
         FmHShvjb9RjVrSP1arLm9FWdS+JVcdUIgQCHVtkuN4oKH3PWBAXiLQf52lLNp4hUzU/R
         SQYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=HIubkjMJ;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id d8si829953pls.289.2020.08.25.22.56.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Aug 2020 22:56:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=HIubkjMJ;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07Q5WLNc127402;
	Wed, 26 Aug 2020 01:56:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=wcozulgcpqPylsZTrgmzgmyFL/R2nv2XemoN+wFJmJI=;
 b=HIubkjMJggF2D+x0NQlQqvF1ps9s1d/eJYbNTod45ypCyfCrevQOGopz3/7rIrRwEiTS
 AsRzvUH9PsEF7gM1Y53hxjG7bZodD6T7oz/HC88HUKkX0P2Dq/VxHbyx2o+GrP1Y/sJq
 4FWa6nc+BUS1A6ODm7S3otSYhxPb/2t4oALf6GheBLvdI4RaRjplOhy3g5eMEcHOsVMR
 XwR8cyxvnPJxWbCo58t7ZGmlaUEn42diE3flZoy6tKsIAV1UH3KteuW0Hwkkn4tjAbWW
 FyO4NDXaEngTDGVNxBV1J8ljd3o3QYgg0CFgGPSCQEn4wGjYRY7SdM/YTIr9xEOdVnpx Ng== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 335hmj0jn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2020 01:56:29 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07Q5WNxs127572;
	Wed, 26 Aug 2020 01:56:28 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com with ESMTP id 335hmj0jmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2020 01:56:28 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07Q5lq4n007972;
	Wed, 26 Aug 2020 05:56:27 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
	by ppma02dal.us.ibm.com with ESMTP id 332utuf1jt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2020 05:56:27 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07Q5uQnn62062848
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Aug 2020 05:56:26 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 15BBCC605A;
	Wed, 26 Aug 2020 05:56:26 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D4470C6055;
	Wed, 26 Aug 2020 05:56:20 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.163.48.38])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 26 Aug 2020 05:56:20 +0000 (GMT)
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
Subject: [PATCH v7 6/8] sparc/sun4m: Don't set cs->halted = 0 in main_cpu_reset()
Date: Wed, 26 Aug 2020 02:55:33 -0300
Message-Id: <20200826055535.951207-7-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200826055535.951207-1-bauerman@linux.ibm.com>
References: <20200826055535.951207-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-25_11:2020-08-25,2020-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0
 suspectscore=1 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008260040
X-TUID: X58lmvB2z+85

We rely on cpu_common_reset() to set cs->halted to 0, it's redundant to do
it in main_cpu_reset().

Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 hw/sparc/sun4m.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index cf7dfa4af5..7484aa4438 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -224,7 +224,6 @@ static void main_cpu_reset(void *opaque)
     CPUState *cs = CPU(cpu);
 
     cpu_reset(cs);
-    cs->halted = 0;
 }
 
 static void secondary_cpu_reset(void *opaque)
