Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp54195lfy;
        Tue, 18 Aug 2020 19:43:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzya+rwiXkiKTnfJIoldJbJjWq0BRaX6G/AY5COb/XQd0Q2P3Nu6g49P7KH2sAYSUKukLb5
X-Received: by 2002:a25:d30e:: with SMTP id e14mr29846815ybf.240.1597804992818;
        Tue, 18 Aug 2020 19:43:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597804992; cv=none;
        d=google.com; s=arc-20160816;
        b=pevwXmHi+D+xtCiVgB8hwbgIeV3UdwpBdfcF0lezjgYbVAzHciM4yRwyDqph6MZQIb
         +0W5/+GJXPIvJQyJkqvSAWz4GjIQltDjcqa6a+JX08yg5KaqOi5FC/8EigZLtSfJH4X4
         KVNABukRoLQUdnbireCtsEkagL5cgJN54RSlbn8ORT2mIQxvu9WtoqQlUy/0Gdnoy05A
         t2mQxRoPHBm/hXfIoFYVKvy3A9XcwC+K2UvNAiEHxVndxNavy2y/tWMIcmomhoDW1cO7
         03GegIcj17IOGxEFm7f1ahFmdOJjFll2WHLJSShmJNMD2Z8C5RkKLTLvV+UNrX8STayS
         tpTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MJVxnsr+PE9RmmiXUlrGdTqgD3hIqKlsXA4ckkbFYx8=;
        b=k91UqN5lsiX7nEToM9BDzcw6tLnQyWFdgwVgesbTszc4+T1jHSm/eL3b/knTxfCXeO
         uTqPAc8eExw+LsZfYArune3EAMuv8LOBLo/ng3jULWxHPwhS8o1lImqfjMGQD+YT+jl0
         SqyUntyFu0Z1xyYBnJ0TQxAX7ngkcshgflaLRgS8TibfMwfbJVBFKCcCrdq4HJ0oGHVY
         SC4Sazzk899ZFN8EjiYFSAWyoRVRvPA/7dIgMyUMWrfwj+qWcKQczmu53AMMJ9XcIrTt
         QM1/OVmgLZOdQR4Q1jcWW5NBUxDmoLNx8FTPyXOLHdADvHOrZOoJhjKXiEvRc6TijnPD
         5/Zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="Mzhm/lLf";
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id k20si23272592ybf.78.2020.08.18.19.43.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 19:43:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="Mzhm/lLf";
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07J2XSv8083360;
	Tue, 18 Aug 2020 22:42:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=MJVxnsr+PE9RmmiXUlrGdTqgD3hIqKlsXA4ckkbFYx8=;
 b=Mzhm/lLfS4dvPafzaJFXUQ9IKGgl9T9ZomPmfWmjRpjRceGdyFAt1L/xNMGgyEmqrK7k
 PVlOruw50/zltPswkeuXd85eAVbDUk+BK1tOujVn9yD76rcKpRMc4tKE4ZhBv8d9J+BW
 /3QExuXyGMGyI5Y2U8Urah2tdtzHDMlydq8aMqNjePoDE3+NYx+TDhV2IZm6n1JJWeUI
 3wIYK2SXPVwEVu5aRGfmx+ht2DRq47V0RNcsvkWtPHWjSDdKgJ6H58OdZdaYaOHHdS75
 rXwGx9SyML5K72mTDvNepv989K+EDCxdiD4VKwd4WVGUwzmlQWPRh9ZJsO5Ixa4JtrXS hA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304r42h10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 22:42:51 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07J2YDPm085500;
	Tue, 18 Aug 2020 22:42:50 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304r42h0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 22:42:50 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07J2cmq6002239;
	Wed, 19 Aug 2020 02:42:50 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma04wdc.us.ibm.com with ESMTP id 3304uegjfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 02:42:50 +0000
Received: from b03ledav005.gho.boulder.ibm.com (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07J2gkw127722136
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Aug 2020 02:42:46 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C104BE051;
	Wed, 19 Aug 2020 02:42:49 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DAE5CBE04F;
	Wed, 19 Aug 2020 02:42:43 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.163.41.251])
	by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 19 Aug 2020 02:42:43 +0000 (GMT)
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
Subject: [PATCH v5 2/8] target/arm: Move setting of CPU halted state to generic code
Date: Tue, 18 Aug 2020 23:42:14 -0300
Message-Id: <20200819024220.587612-3-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200819024220.587612-1-bauerman@linux.ibm.com>
References: <20200819024220.587612-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-19_02:2020-08-18,2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 priorityscore=1501 suspectscore=1 mlxlogscore=999 mlxscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008190022
X-TUID: QxFrEtsb7sTr

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
