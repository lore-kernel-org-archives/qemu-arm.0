Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp54328lfy;
        Tue, 18 Aug 2020 19:43:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwrQKQ2L/vc0p/4dtzdedVOI1OOr4qLwhbD310x5lx/pTXcsKis5CCYC3eJeC8f805Eh4Z
X-Received: by 2002:a25:7141:: with SMTP id m62mr30406186ybc.443.1597805012476;
        Tue, 18 Aug 2020 19:43:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597805012; cv=none;
        d=google.com; s=arc-20160816;
        b=0GaCseS4fJdlrPUMAzGW6rnYFUSQFDs2bTKpw1I5i00cs6Bpm8wppyeD8koyQBhNTr
         jGpTLcxYhKBzAAAXP2uhsyI3tNBlfz8AFdnVpqycuMrxlOlr9hwsuqo8PlumPzOKULFq
         wLHWNELFVftFTF5FwVNlJAuG58UY0PYvXeiB706pjS31MaHGske9BO3S+qxvRsKSWdUp
         /l+v4HwWBT20jKxG1aDiDBDEG71LTJLa9aFUzGFbDrbdwCC7jpgoDjixfAbI+OFGkNto
         PNKaP3DNlcJlpyIGhDif8kq4v0omJKATMydN2qTBEDPhctMle16Vt59TT4uI6XcpDRTx
         cqrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=pUx1xndl8OaYYT4lu2boH8iswrWm0QKL6lecpHHWchA=;
        b=DwJqW3mEei2DfRivuOsEpLCber60jvki2hAqBvOdGAsK2MgopxjuUpoF2d2ENzAk/n
         3C1b7W19LbsIgfMRo1Uh9v0b0F195O+OoI1Ausd/tpCnsPOmc2lum0C94PSIwhytckH3
         Zr4l6M83HSOLFnVpK9mqUCmKU7h7LYJrkP44x5O6gFDcs44DuPtLRlvmxybmywGqARPI
         KoYV1DgjyXoNQf53T0w6VgjlO7u524d5WTh9A+R4Oq/gDrKUGnUIEEViCzi16pkUIaJd
         44Tvr8JRFUpntm+hidA2uUYHzE6o9Jf3+lBjx5KZ9FQrJufKqCUbk8kUDDWHWcXzFD+o
         PWDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=Z9Ugvuhr;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id y184si23817931ybe.462.2020.08.18.19.43.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 19:43:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=Z9Ugvuhr;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07J2VYTZ030096;
	Tue, 18 Aug 2020 22:43:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=pUx1xndl8OaYYT4lu2boH8iswrWm0QKL6lecpHHWchA=;
 b=Z9UgvuhrtNlk4VKx/acOmSS+e+lb2CpYbDFkVJtOu9tTBe/BH97eBfrADzMmz6/YjIBw
 Zb+B6PN+BLkL+tjxLK/YYY6GhtMLmQ1jq+AIrIpmdUojDMBN09gRWtynKQVlNV9FIaLY
 4ODzWz5LB+KIYqH4A0eb4y8SqbSvRZrcsWlDeO9Fw/06CMtRTtnG3d2Aa1/KtpzQs/DX
 jvHLGmSVKhaJ9Bt2+r397Rn+aXWfHshG8PTcA4U/4A8xjWyUD4jrLDWtyUd3YvETzh/C
 X5dPddfZ2vlp7LsGZpq1WVh3Dw9FGnVrKcDXsTbT+7fMVlbqkpK8kxmyItEAMoOCdpdc Xg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 3304pfejsf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 22:43:13 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07J2WR9P032056;
	Tue, 18 Aug 2020 22:43:13 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0b-001b2d01.pphosted.com with ESMTP id 3304pfejrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 22:43:12 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07J2cpxq020649;
	Wed, 19 Aug 2020 02:43:12 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
	by ppma01wdc.us.ibm.com with ESMTP id 3304tkgjd8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 02:43:12 +0000
Received: from b03ledav005.gho.boulder.ibm.com (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07J2hBgP36831646
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Aug 2020 02:43:11 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0FFDBBE053;
	Wed, 19 Aug 2020 02:43:11 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E6C17BE04F;
	Wed, 19 Aug 2020 02:43:05 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.163.41.251])
	by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 19 Aug 2020 02:43:05 +0000 (GMT)
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
Subject: [PATCH v5 6/8] sparc/sun4m: Remove main_cpu_reset()
Date: Tue, 18 Aug 2020 23:42:18 -0300
Message-Id: <20200819024220.587612-7-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200819024220.587612-1-bauerman@linux.ibm.com>
References: <20200819024220.587612-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-18_16:2020-08-18,2020-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 impostorscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=1 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008190017
X-TUID: Lyyg4HyNpqIq

We rely on cpu_common_reset() to set cs->halted to 0, so main_cpu_reset()
is pointless.

Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 hw/sparc/sun4m.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index cf7dfa4af5..22c51dac8a 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -218,15 +218,6 @@ static void dummy_cpu_set_irq(void *opaque, int irq, int level)
 {
 }
 
-static void main_cpu_reset(void *opaque)
-{
-    SPARCCPU *cpu = opaque;
-    CPUState *cs = CPU(cpu);
-
-    cpu_reset(cs);
-    cs->halted = 0;
-}
-
 static void secondary_cpu_reset(void *opaque)
 {
     SPARCCPU *cpu = opaque;
@@ -827,9 +818,7 @@ static void cpu_devinit(const char *cpu_type, unsigned int id,
     env = &cpu->env;
 
     cpu_sparc_set_id(env, id);
-    if (id == 0) {
-        qemu_register_reset(main_cpu_reset, cpu);
-    } else {
+    if (id != 0) {
         qemu_register_reset(secondary_cpu_reset, cpu);
         cs = CPU(cpu);
         cs->halted = 1;
