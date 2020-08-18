Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3458542lfy;
        Mon, 17 Aug 2020 20:35:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLn4R0TgW0dA+2sv2MeWHKZTo0dibo8ey477gFILg77q+g1Q9RaMChSiK0cumz5QLcK2Fz
X-Received: by 2002:a25:f30c:: with SMTP id c12mr26258388ybs.471.1597721722409;
        Mon, 17 Aug 2020 20:35:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597721722; cv=none;
        d=google.com; s=arc-20160816;
        b=aRLJHgZXMNK4G6J3rDal99kuyatAo5xeMVIp4Xi0on5tpjSlHUcYn4oc+nQXloqcVw
         X18VTAVZp8Q2I49D6tr7dWFw1QN8RS90rZOQhlp/StWWwosYBjqE+LMqsMCoCPmDVSUM
         gobAEZESt7M+4DyZVY5YVoequ3lzmNL6HhEsfEyav5Oar4vivRP7XGjM4Taz8sY7q02K
         mqR+kKxgAyDefz2NVB9iuOeO/rYSnJNjIS2VJCofhKeanhP8XEon8SNYzTbOTvQQkdgE
         zTR63LbbO3mEXT74mvKh/4qcHDFh+yrmGcaROyw4ZU8AAhatqh6gv15xgb47QUxuDJ3k
         r2sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ROECkcpI83are7d45wAbKAxpYfn/EVXwsj77lZ8DuL8=;
        b=J4ECRLnRYR/TQ7AV9HSa3klDIqThyN9K1GRXcDZ/MAciR5edAbDS8Y45YxRn+D74Tu
         EL1UIWD4e4WXEBY9oCypnH9qgsV1TGfW3aefP16P5zJYwbB/0bBE3+ROqAp/LdvLv+kb
         XSpNXnYtw5JuTWALKlGiuq062ntl70gdUcN6X3zK0YTB5Vbwn2t/lq0bGIAJ1k+glNfV
         VoEuexCzIALNo9MW0atZHU76VcMPqQPEelzEawzac5bnjaGUQWwupHvBtQT6vRhP7WcA
         1ioDL0djRG3IfWFAyxTNgm4riV8cNj0T9dIjggMq3PXv5MMQCR0icStfTIbfq493flPt
         409g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=Fppjosor;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id j188si21473953ybj.477.2020.08.17.20.35.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2020 20:35:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=Fppjosor;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07I3WTeJ048356;
	Mon, 17 Aug 2020 23:34:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ROECkcpI83are7d45wAbKAxpYfn/EVXwsj77lZ8DuL8=;
 b=Fppjosor1T2GXFOnYGtwDoes429Sei5pUV8UKkOYk8TEyLgsB6p5KTbOMMg6DARzQBw/
 8R+1EZUamVTloztIn9U3jLmz3cPt78wFzslEd8rQYMYIqQdo2y8Ysrb90Uzl2deY8C7+
 bQnsG9l2+pyxCTjMhw7QPLFr2zM99lmniWDcCMS11QVnHa5fI/khhf55uqcFbmur/Nz8
 qxAm5YZNlSo39X0tvxDPW6huGkvsdVXywj+GfHv0yHJ8zTaTEt70rawqzk4lSJrrY0xy
 infZBN3CeJQw9NFWcWp8BNZPfR7OdHyD9Pj0B8cb+GYueTysW6nMOmu5c2M043nHmPC6 gQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304svu7ng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2020 23:34:55 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07I3Wj3e048630;
	Mon, 17 Aug 2020 23:34:55 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304svu7n5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2020 23:34:55 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07I3VB0L012882;
	Tue, 18 Aug 2020 03:34:54 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
	by ppma04dal.us.ibm.com with ESMTP id 3304uq8y89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 03:34:54 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07I3YrIH14877338
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Aug 2020 03:34:53 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD852AC05E;
	Tue, 18 Aug 2020 03:34:53 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C3667AC05B;
	Tue, 18 Aug 2020 03:34:46 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.211.138.167])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
	Tue, 18 Aug 2020 03:34:46 +0000 (GMT)
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
Subject: [PATCH v4 8/8] target/s390x: Use start-powered-off CPUState property
Date: Tue, 18 Aug 2020 00:33:23 -0300
Message-Id: <20200818033323.336912-9-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818033323.336912-1-bauerman@linux.ibm.com>
References: <20200818033323.336912-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-18_01:2020-08-17,2020-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=1 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008180022
X-TUID: zta8/3D2j+BC

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
