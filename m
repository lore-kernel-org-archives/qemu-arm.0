Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp54409lfy;
        Tue, 18 Aug 2020 19:43:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNASkeuuu3L5MAPjfFrNj0p3JwLjzkGRFVxd50kcL8oY202RfIy08/MdCWOt6kuJYNjwSk
X-Received: by 2002:a25:5555:: with SMTP id j82mr33530128ybb.125.1597805023329;
        Tue, 18 Aug 2020 19:43:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597805023; cv=none;
        d=google.com; s=arc-20160816;
        b=nKjonb7c3//7ViFMpbX7ZJdD0KiGmX8c5wuKWebNpnEi2CXLBbB87SeFlH40wyJ7oX
         BpNHx1TR41FA+sQYLL8abjmTCHCKFp4tqdnInn1HXl77xTfax9ICbAsOcRpVg2vGc307
         ZZJbCZsQOdEKsoEOFunKhlYyH1Pf8jnOfvGKjX3OD81nETLTImWyuIFrR0ZfMcbhVTqH
         HdrfFpIte7rTVJoGrNGe9X529zhLy33nNpQOlEDz3wCIYQlF+RaP3Vn3zmFe8KOF+hAC
         69wTjpTnxF86kaol2xJn76tMEr2eBW5Y19L2os/Tk2iOzpMnsI0aDDQXkdDId6TcztCA
         dEdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ROECkcpI83are7d45wAbKAxpYfn/EVXwsj77lZ8DuL8=;
        b=038qHCzjOLawXI07b0g2ga36+KQT3HyQvpWFd4vtia52nQVF2k1fNhlDde+hpFZj2g
         UkN0D0CkrV8MMkBzQr1XksWdQnD1T9T7JZe3+NNuMJ4MK18BGODltZku0Z3fjom/chP6
         EgTfNJ14eUJSlqefM1L42Rwel4JoXVI1oRlbb+aKmtzFWGHvPyJ0Eeu4OuvW9M/HvVPK
         GBCtVjdzTGJyd1HBXKEdXCAmuthRWz4r0AO/+1pXndfQzY72kDwGI8NpQSjIjLj+mdtw
         v7+KVDeQ031xdEIBwD3KeSu8dUBpnqMr6TMQrSRTxMx4uNmecUrj9KfYqEFu0avKBgY+
         rjXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=Y3M3Ld3P;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id x9si30142761ybt.404.2020.08.18.19.43.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 19:43:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=Y3M3Ld3P;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07J2XXCj045928;
	Tue, 18 Aug 2020 22:43:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ROECkcpI83are7d45wAbKAxpYfn/EVXwsj77lZ8DuL8=;
 b=Y3M3Ld3PJlzPuyuxMm+s8hzune/xwJFLUjj+GmTunNagqp8cqa9DlqJsI4brF+Q/AoAC
 elS8HAgOeHe6ziIJLJPF8zkYaXJS3I1OmCSZGREr81wIANurbkdXTtjKWb+wdefDKRti
 1sZw6bNvxz5pkjOD3MqznfMQv5VMpwflbLWmXk8msGHpJPq4VQSkccwbQku/5VsyNFBc
 +oqFAw9C6UrVu9FwHA8UiI7Y9QNr4L9vsSkYKmzFeM8zdeVvmqJPdtCLHeNoCaRhLITd
 +JLrhLoBPeKRErUI3GJOukpYQnL+1Vl1bzCp0Z0+9O0A0E2nC4mE8uXJQjUcsReLVfJ2 Yg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 330ucn05r5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 22:43:24 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07J2afAa052956;
	Tue, 18 Aug 2020 22:43:24 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0b-001b2d01.pphosted.com with ESMTP id 330ucn05qv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 22:43:24 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07J2bYwa016224;
	Wed, 19 Aug 2020 02:43:23 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
	by ppma03dal.us.ibm.com with ESMTP id 3304ccjv51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 02:43:23 +0000
Received: from b03ledav005.gho.boulder.ibm.com (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
	by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07J2hJBU50659736
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Aug 2020 02:43:19 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 376E3BE04F;
	Wed, 19 Aug 2020 02:43:22 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 00E09BE051;
	Wed, 19 Aug 2020 02:43:17 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.163.41.251])
	by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 19 Aug 2020 02:43:16 +0000 (GMT)
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
Subject: [PATCH v5 8/8] target/s390x: Use start-powered-off CPUState property
Date: Tue, 18 Aug 2020 23:42:20 -0300
Message-Id: <20200819024220.587612-9-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200819024220.587612-1-bauerman@linux.ibm.com>
References: <20200819024220.587612-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-18_16:2020-08-18,2020-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 suspectscore=1 mlxscore=0 mlxlogscore=999 clxscore=1015
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008190017
X-TUID: H0MNG+fFDuTf

Instead of setting CPUState::halted to 1 in s390_cpu_initfn(), use the
start-powered-off property which makes cpu_common_reset() initialize it
to 1 in common code.

Note that this changes behavior by setting cs->halted to 1 on reset, which
didn't happen before.

Acked-by: Cornelia Huck <cohuck@redhat.com>
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
