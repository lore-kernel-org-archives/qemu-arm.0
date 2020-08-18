Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3458080lfy;
        Mon, 17 Aug 2020 20:34:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2e6Rl2fXm02NK438k1Ae6ig4TI3MOy8bLTSBh2eEfYTyFPWmwKjUzN2Ys5OSzpLAzoR8P
X-Received: by 2002:a65:66c4:: with SMTP id c4mr12555122pgw.442.1597721679937;
        Mon, 17 Aug 2020 20:34:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597721679; cv=none;
        d=google.com; s=arc-20160816;
        b=aMgMH9NBCR3hjdD/E8rJt1nQNKrIOjWU2FDdsKSjr8bpgE4FoVYm9vprb2SoeiMSDI
         cJxExY+qR99uiwKrAM24NqD5jnmRK8fsyZTXsrseLclIhVPF/rVPebxF+N3bjH1EICao
         8zz2fZHEFjfqjd7PrNbjTV1Hyw7WZHQuYnTIyWlpzaGosM95duFrnBO+usAE1Vugmx+V
         zYAWo1GhZPAebA9Y9+OsuNwzOijCeSZT4DBBvtFI4OaJEe43zaLApxPg1YnpaSNawj8A
         Ebpj+tyGg1f3CjgN1Qi5ymFEtUWoFoMrc04v5FY3Nr3MG4D7Fd5+Ee52J+3XoSbX4nUC
         ppxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MJVxnsr+PE9RmmiXUlrGdTqgD3hIqKlsXA4ckkbFYx8=;
        b=hjwvLTuFjnozE3S0FESz6bMexb+HZ0dWPkHVHuhlDqfKRZwzTKF2v1WrqL2B0cr6rd
         ZnE03bhVgaDBI2B1+UZIEfE89Kiw0cWDYxHigbt/j13L8xZbTvNmzK+4xUchbhcwyNJe
         oypuJD+9VXIDnm7vXCPhY3DdP66p/gI9Up+j3ZmwdMgqJMTMOq20JBaAqR1pC56jEBxs
         GZzqydBCcyPttHC2giLnZ2wm617/zxGj1ong4Q+Rl72zNTCnLpY0NOaaypFcemOVphsQ
         4hCYFxl0kfwxiYWyIiyz3Q0d9PjP4uEMpyR1RQ7PXjjMdQf3TpeTQOhwl0C8NA8+/eIG
         DWeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=eGqGNHe1;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id f5si15105698pfe.25.2020.08.17.20.34.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2020 20:34:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=eGqGNHe1;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07I34qc4092442;
	Mon, 17 Aug 2020 23:34:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=MJVxnsr+PE9RmmiXUlrGdTqgD3hIqKlsXA4ckkbFYx8=;
 b=eGqGNHe1ENEsdz1LOrfbwUWYtEY5x9nK+MsB2t3qSiytOv8bt6yL861/85hqn9Pyellf
 btpEZtEnklx1TnHjnJWEKpUrcSV2D/K9DLz5Sx0OV1MWhdhqgiUgkvvIxi8SUHdBa5bZ
 Q0n9Jy5i8cgSPjE6QcyP/0rOpVUqFGEc+zL0N9k4OxBwEFj02t3NLAhimfznVbqb/wJa
 UtyrHVPHCwP8eE1/pcmBcT8qIX7KHObZEa6DcDphwGMmIFlt3rqFM8qgRft4Cngtuqun
 eyoA9u15wyujdss+kBmmcKQ4x8F8wd5ts+/a1NRC48aqSjtu3AEXcssMXuo7J+lOt8LF tA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304rsu3u9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2020 23:34:09 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07I358eT092762;
	Mon, 17 Aug 2020 23:34:09 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304rsu3tu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2020 23:34:09 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07I3UBNU027192;
	Tue, 18 Aug 2020 03:34:07 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
	by ppma02wdc.us.ibm.com with ESMTP id 3304scgsnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 03:34:07 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07I3Y7IQ52232486
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Aug 2020 03:34:07 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B127AC05B;
	Tue, 18 Aug 2020 03:34:07 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB5EFAC059;
	Tue, 18 Aug 2020 03:33:59 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.211.138.167])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
	Tue, 18 Aug 2020 03:33:59 +0000 (GMT)
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
Subject: [PATCH v4 2/8] target/arm: Move setting of CPU halted state to generic code
Date: Tue, 18 Aug 2020 00:33:17 -0300
Message-Id: <20200818033323.336912-3-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818033323.336912-1-bauerman@linux.ibm.com>
References: <20200818033323.336912-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-18_01:2020-08-17,2020-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 suspectscore=1 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008180022
X-TUID: KbTG4GQ7wbZi

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
