Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp472983lfc;
        Tue, 25 Aug 2020 22:56:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrIEz1P4ELsCRIPxD9/cy1VaYawU9VkbnV/vF6azGJD98GQ4PS528QW0Qbi535lwuwEqDx
X-Received: by 2002:a17:902:8bcb:: with SMTP id r11mr10628976plo.65.1598421395070;
        Tue, 25 Aug 2020 22:56:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598421395; cv=none;
        d=google.com; s=arc-20160816;
        b=nXpLqkDbLFGtn8S0xXsMQmqR6dWa9cQtTNeCrNq9PTK2n7An3iVj1PTAknb3/hd/F+
         tdEqTJH3uZWrL8xUR9qjh4wqt5DObZeO8/K2QBjYnQwAgyYrt7RbMkzz4Fne2XpRoxyN
         /5tyVztRGKoMNlsZhqoCbfPuBhmJie10Y+ShPy+pEQgkrdm7JHeWz1aokZ5P2bZ2fYyn
         ExFUkhXszDfEyxabmYlashbIYbAfgH8fOPajyY0HcvvPiYHCEgPVf3n2oRA/xAlckgBu
         0jgRX+8uV3/hxtvTNJhPIPCJxJIR9ZQLYQ6y9d/NfPwKYOB0Wq9S9coki09LXQjHOm8X
         BU8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MJVxnsr+PE9RmmiXUlrGdTqgD3hIqKlsXA4ckkbFYx8=;
        b=uftcRCtcLodEHwfsaaxBu5rlkmJk6onOLGXF/9gx+48r/Bpp1QE76BG23cLOoaRUuj
         9dO4Uc7AF1F88Uq37ikcfPPrLOYWZmAiLyPqWIg3gOjDCnxwa+djl+IhhDlzQccZgs+V
         2AS4ueBSct+xhAwG5eK6SVz0yZtBkMoOBObBsZP9Ll9NVGIiDfYPHqCbhU7LtOfk51b9
         Ssm4/q41ZZICIBwPmU2weWb0t12LWPktDz5ukO+HiC5NLqTOXFbDcCeJQqt2izUIJlem
         6vwHzgnPuehArXRFwJViD11y7EBknK6EudV4Wk1AgckgGnx4959JaicxTgTENIcrnGES
         byfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=ElcX4pV7;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id g22si1021192pfh.274.2020.08.25.22.56.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Aug 2020 22:56:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=ElcX4pV7;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07Q5W2Gh121076;
	Wed, 26 Aug 2020 01:56:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=MJVxnsr+PE9RmmiXUlrGdTqgD3hIqKlsXA4ckkbFYx8=;
 b=ElcX4pV7Wg1xzlKcmzDwC4dhbjZhLd/dFI7U4OO2f4RZjOrOWHHC37x3rPTXSuzBMDap
 w5nsXhxQvUWhEmWgLZUcbO+CU35zBNgdDg5DNcJRbYEJgMbMQCLuA0hxgmyL2F76K3S4
 /FanzsS6Uujrz0MpsgWyXWlB2MkqE/PuBhUajD8drYE8EosAeLywxUT0QbZdnNJr2sxW
 TmAuAMMOenuFt0fobe/wBspxrH1RZRZmqcVxt5ajFYy4I/G6bUEMvj7y6cITajZ4Woz4
 ZKXEMLQ7bkF41W8B7wH9bg3xqcn/NQT3xpK7LoPcZJREVIJnedXcQJ2wraU3pjT0ES60 xg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 335ggsa5r4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2020 01:56:06 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07Q5WVNT123769;
	Wed, 26 Aug 2020 01:56:05 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com with ESMTP id 335ggsa5q6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2020 01:56:05 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07Q5mXcU023204;
	Wed, 26 Aug 2020 05:56:04 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma03wdc.us.ibm.com with ESMTP id 332utqy88c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2020 05:56:04 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07Q5u3dn39649760
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Aug 2020 05:56:03 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 243C7C605D;
	Wed, 26 Aug 2020 05:56:03 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EE0E7C6055;
	Wed, 26 Aug 2020 05:55:57 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.163.48.38])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 26 Aug 2020 05:55:57 +0000 (GMT)
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
Subject: [PATCH v7 2/8] target/arm: Move setting of CPU halted state to generic code
Date: Wed, 26 Aug 2020 02:55:29 -0300
Message-Id: <20200826055535.951207-3-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200826055535.951207-1-bauerman@linux.ibm.com>
References: <20200826055535.951207-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-25_11:2020-08-25,2020-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008260040
X-TUID: efdCQtT1uoo5

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
