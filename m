Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3458363lfy;
        Mon, 17 Aug 2020 20:35:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOFlWNCeaoQz3sVlecRWbGpCiIKG/wDbk5hsmEa6ZLNcGktpvG6KQ+Qf/JnzTuaXe3/QE6
X-Received: by 2002:a25:6c8a:: with SMTP id h132mr25913375ybc.68.1597721707807;
        Mon, 17 Aug 2020 20:35:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597721707; cv=none;
        d=google.com; s=arc-20160816;
        b=oGhOouBMahzFkyX0AYiT50/rdkUeytU5K8C7TuutUWHhsb69g6pmP+S971g/F3ZQwR
         LuvFYdkyNckBto3W/pmyBUzBhbV7Vl23w1q/44BGUjUKZ+yu6AKTJgUBktH8VZc52mYz
         ZBV389kBRSikG2OyiEgVbz4cMI8NeiryVdou4Zwv5026av5rYpYr5RqeuNS3GqbYH6T5
         XwjgqcX6RnaxdpDs53cDM36mELSEuGnUgVSH6VpstXRTehpI+l5q0NjMr1jQGRUd+J+y
         oaKu2gWn7IKyjiytTF+oKxXI1/nAh0QPT4woJDTaiZYbnp9C18pcTEDc5gW8K6ikdmqO
         taCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CQrxg/OF5ga3Tf7sEHbvVx7uiqTao1wgQrITxhY6Bq8=;
        b=gXqT6yMqw5KV77nIsgg2hy1gXg7shLtM0HCbGdA7yVjS1GkS9DrRHX5j/bcL2Yxnmo
         +moFSFQiIVYmp2P1JqdkO+JZA+/mkhcM2H0q/ZIUCZMz2mZz66vK3dJJ7XZkaRKroEo9
         SlsVnexHs4rBrzoIVRxGXJsUy+09vw684Fpx288pL3qg+OjpfPofczvhnRieaYlP3hFB
         Ddm1P5yzGgjyqnEQNjLqHH9EL05ykHu4nPtVKLdaIQFOtEWbSsjS8dsgWGHlkKyGrUlC
         3L2wdIzqTqyvDdPBzTvhW40EJt+QF+hK8eguQQVOMFXW9xFl6hYpc1JoF4SrY34uAmk8
         1Qxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="QWS/fg6h";
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id h19si22755372ybj.306.2020.08.17.20.35.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2020 20:35:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="QWS/fg6h";
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07I3XAn0189090;
	Mon, 17 Aug 2020 23:34:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=CQrxg/OF5ga3Tf7sEHbvVx7uiqTao1wgQrITxhY6Bq8=;
 b=QWS/fg6hqHpe11MnjB701CAu4FQkN3Z2oYvDuk+MjM5hWcYmcUMP9oOn3MdTomc+Y0AW
 zZflTHcIwYs0BfXgU21CyU5EWEByeaDRZFhhwdBppfrvA8Wc8L7HjefisK9AXsTfZOQT
 7/xEZhqShG6jKyIH7gtL5/ekPDuwpIKZJuaHH6XW+XSpPT5SsGpiW6lfUekHs0C4or8h
 pahSnDMticq/2mp6nl3ATiGoejJatjrLCLwzDPUmrQTQUM2WsmdZdXCF/CVlNc5itgbl
 ewGF2QwR6GWbUMQmT2Xhyk2/q3TNKv0lUOdyQYKV0U0SfajpURL1efP/VRIwbZZzsrNG CQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 3304pf39j8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2020 23:34:40 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07I3YeQn193446;
	Mon, 17 Aug 2020 23:34:40 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0b-001b2d01.pphosted.com with ESMTP id 3304pf39hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2020 23:34:40 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07I3UBOM007543;
	Tue, 18 Aug 2020 03:34:39 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
	by ppma03wdc.us.ibm.com with ESMTP id 3304cdrw5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 03:34:39 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07I3YcoI56623500
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Aug 2020 03:34:38 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9439FAC059;
	Tue, 18 Aug 2020 03:34:38 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A27AAC05E;
	Tue, 18 Aug 2020 03:34:31 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.211.138.167])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
	Tue, 18 Aug 2020 03:34:30 +0000 (GMT)
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
Subject: [PATCH v4 6/8] sparc/sun4m: Remove main_cpu_reset()
Date: Tue, 18 Aug 2020 00:33:21 -0300
Message-Id: <20200818033323.336912-7-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818033323.336912-1-bauerman@linux.ibm.com>
References: <20200818033323.336912-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-18_01:2020-08-17,2020-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=1 mlxlogscore=999 impostorscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008180025
X-TUID: cJ0hX7+/uzHu

We rely on cpu_common_reset() to set cs->halted to 0, so main_cpu_reset()
is pointless.

Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 hw/sparc/sun4m.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 9be930415f..f1d92df781 100644
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
