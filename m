Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp606114lfy;
        Wed, 19 Aug 2020 09:44:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+ioFhNlxZeOQrvoVglLhf9RWY/fG6yIpoPgnsNwWJP95MoYv4fB6Xc0MRcTEka4Az9HH9
X-Received: by 2002:a05:6902:68a:: with SMTP id i10mr33820049ybt.404.1597855440803;
        Wed, 19 Aug 2020 09:44:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597855440; cv=none;
        d=google.com; s=arc-20160816;
        b=LIMWUh1nq/bIEZS/S641OV3n9O0YKZUdVqeHsilXQ5PJCxHeakYMrb17uDuWZBlk+o
         qqUBzwA6MsSD4o7wHELmdPB5LJhTqKMhmsHN1SfbMcMpUgJ31RTfs4Q57obXFjQaghIU
         1tJqMzno0ZK4rk8PvdMU1phcJaF91cfdQz+hgzzu5BBOiphxnV/Xei0iAtGJOTEU0IkS
         ob0G1Jf4jr3mWsV6C4xEXMDJznV1UNTVvOtKYVVBwD+fXovzMtu1YytqyUNYmSCD4hXK
         Eegd+G6kwLxPm088H8TjhnvjB2mfQ0jA4wI9V515kD064QyAfBK3lnfKjDOt2qNJafv+
         Sp0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MJVxnsr+PE9RmmiXUlrGdTqgD3hIqKlsXA4ckkbFYx8=;
        b=JEStiJ/VDTClntBptzbs4ScQQM5eQsTGb/s3ixWYSkaoJDtUrdxA8JUze4cFCZWm6D
         xTNfq/yTxuhM6xhbA8Z1U6Vq5b1tCvd9WBMFWryK9NJtGn/aNMuHiaiheoU85ae/4z9u
         CGVOdIFhn4TRLqlKDPemHEfWGM3+CX6EwQuFXV6X4i5NWZU9lRwAJZSB80EcaNJ4fm5i
         +ZDVTrcw0/AOF7U5jODg3qMeaCAsdexFfDqtm6sGhRbzXzif3zhXH15sIE5lLaIiSvMy
         ixZUO6oAOJ9uIO6oqPOUoz2LTu6ebtWoXjzF5cQ1iSMPPRu2VaMN+36OiS1cuuzM92xG
         oLjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=cgL4P2Oz;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id 2si24212695ybb.152.2020.08.19.09.44.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Aug 2020 09:44:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=cgL4P2Oz;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07JGUjSI169613;
	Wed, 19 Aug 2020 12:43:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=MJVxnsr+PE9RmmiXUlrGdTqgD3hIqKlsXA4ckkbFYx8=;
 b=cgL4P2OziKGZ9Lz17czqcSoTKwUdy/lU+Bxn0E6w9oMH8aTZFFVjNqx8+i+EFyulf9aw
 0tnmW9GLM4iMPp55pFGY9VHHw+RhhpIsV3RmvIqxwqTTKwh2d7QFtfrsLo/DOFvvwom/
 GSumV1jUzx1nvHvcOTPbPJrBTIzuzLhlNsph0c8O5ozCgFWSDEx9Cdx5+sCaEjgV0+aQ
 Y4JgtEFNeTji2bHvhH9SRDgFBlsXSPdtOSrTfm+q+BnG6bxf2F/G/PrZ9Ju3GvL9hBmd
 yCOGJZ+Xf+ZPW8ZpcFbzpGIRtbpIrnYzYFjvsvfxDnQQCjCFUjrPWT4ILGA9t812zrBi Dg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 3313qr17kg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 12:43:42 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07JGUkp6169680;
	Wed, 19 Aug 2020 12:43:41 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0b-001b2d01.pphosted.com with ESMTP id 3313qr17k1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 12:43:41 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07JGPZjR012145;
	Wed, 19 Aug 2020 16:43:41 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma02dal.us.ibm.com with ESMTP id 3304ccrucw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 16:43:40 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07JGhdZb16581024
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Aug 2020 16:43:39 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A8FF6C605B;
	Wed, 19 Aug 2020 16:43:39 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 664A6C6059;
	Wed, 19 Aug 2020 16:43:34 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.211.41.171])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 19 Aug 2020 16:43:34 +0000 (GMT)
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
Subject: [PATCH v6 2/8] target/arm: Move setting of CPU halted state to generic code
Date: Wed, 19 Aug 2020 13:43:00 -0300
Message-Id: <20200819164306.625357-3-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200819164306.625357-1-bauerman@linux.ibm.com>
References: <20200819164306.625357-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-19_09:2020-08-19,2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=1
 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008190135
X-TUID: 7ZVD/+mdo0W5

This change is in a separate patch because it's not so obvious that it
won't cause a regression.

Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 hw/core/cpu.c    | 2 +-
 target/arm/cpu.c | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 594441a150..71bb7859f1 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -258,7 +258,7 @@ static void cpu_common_reset(DeviceState *dev)
     }
 
     cpu->interrupt_request = 0;
-    cpu->halted = 0;
+    cpu->halted = cpu->start_powered_off;
     cpu->mem_io_pc = 0;
     cpu->icount_extra = 0;
     atomic_set(&cpu->icount_decr_ptr->u32, 0);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ec65c7653f..b6c65e4df6 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -175,7 +175,6 @@ static void arm_cpu_reset(DeviceState *dev)
     env->vfp.xregs[ARM_VFP_MVFR2] = cpu->isar.mvfr2;
 
     cpu->power_state = s->start_powered_off ? PSCI_OFF : PSCI_ON;
-    s->halted = s->start_powered_off;
 
     if (arm_feature(env, ARM_FEATURE_IWMMXT)) {
         env->iwmmxt.cregs[ARM_IWMMXT_wCID] = 0x69051000 | 'Q';
