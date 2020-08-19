Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp884293lfy;
        Wed, 19 Aug 2020 16:55:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyI9ykO38EzZa1jazecYHDX7Bb2+E1wtSeOrx5yMs2QfIgc9tTkIXJBj7iGMCprZxLkLBJ4
X-Received: by 2002:a62:5284:: with SMTP id g126mr219838pfb.139.1597881321097;
        Wed, 19 Aug 2020 16:55:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597881321; cv=none;
        d=google.com; s=arc-20160816;
        b=Zs+UEsMEqpQ+CMoqc2uxt1dDM0zN+1yHLTBCqFrJERM96nqOv4W8bSs1R6IL85GmXq
         3YjWIMMOPMcb1ud2Z4CSDR4EVdtESyu++lzqsQIeQ8Ssvn22cZ3mL7u/uJv7br0ziD5f
         0E+hUjqfwwrskckVPJ8OK9mWPMCdfc3lgC/iQeT1NIAs7FvxqDS6TPPbdygpmQOJZgXy
         Cpf5NnMwFhideGjnpY+945MeVddCCyKT/VeHOP9lGxfwRSgkVKIT4wz7awo1jAM3Yb0/
         QJ/PL/qc6WGZ3Gd6F6nfJqkj3OZP0Ea+Y8wgdKSaIqLe2Ji2cFSZOm2Rbh9SjAu6FitU
         9YBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
         :subject:cc:to:from:user-agent:references:dkim-signature;
        bh=dxMWs2C7MC9gxFY65qAy+eOEpz0SkpryOBNdGmCCfRw=;
        b=GfKuj+PGGOBD7ttAfdKfK6N/DOaeJuaTsPP1nPgYTxMktvWg1qGSdy031E23M7oMaK
         PDBf3d3fuLWJ7Jl8VEM7Ngs/qPh5DhA0ahQ9l/FluXLDlko4j3R7oJwGebS9Oo6Qg/O2
         KEgG4dr00uTk8LEhzic60xxnpBCqznZLFmQGSDyTUHoeyUcYnxiJprgudOkSCSRTsU7n
         eDdKmXJoEmRwSIcmJcR8b6rAxbzhJrwkV5hPAARB82ZrIlDQFWl8HKukTAcrw1yyDdfL
         xVkmU7fM/zksOuluNIObkpfGVoh1bJMzeWyiMhZa0DaT0K677/++nn08PIUH1NhjbTYA
         SLAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=MpkGoZEa;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id a15si376154pln.337.2020.08.19.16.55.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Aug 2020 16:55:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=MpkGoZEa;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07JNVqcm093860;
	Wed, 19 Aug 2020 19:54:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=dxMWs2C7MC9gxFY65qAy+eOEpz0SkpryOBNdGmCCfRw=;
 b=MpkGoZEajrBKfTH7qjxPKFhoEbUhEJBFSQUi/KSk4f+I3+AiaSCTal/AWdD63CXPOvXL
 du9PLwlNlBDxO11YB/P0JrKE8+3KoBiR/1zkPiKlKx7e/2qbrabG28NM1dY0hzAV+FIk
 lj5cKj0i03pkTq89lFhi33UOjHgYP4ejIk0IIqf0K8hJ3oAlJba2nqQ3b7SP5T8OlLUn
 hRA0HRgJ0fDp5HZ3744U69GoWsF+gMZhcRV5CUvVKFgG8YXOpZYTn6xG6VGjbjeqQiyd
 5pXtcY5uQTDkwLTZ9QTtyi0znfkeK22n9JxrtZ7y2MZ6SVYf5pM3KXHwn8ITJEPHhWIy ig== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3313ky3qrp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 19:54:44 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07JNZR7i104948;
	Wed, 19 Aug 2020 19:54:44 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3313ky3qra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 19:54:44 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07JNef9P023707;
	Wed, 19 Aug 2020 23:54:43 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
	by ppma04wdc.us.ibm.com with ESMTP id 3304ueqq10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 23:54:43 +0000
Received: from b03ledav005.gho.boulder.ibm.com (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07JNsfQl36503818
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Aug 2020 23:54:42 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E067BBE053;
	Wed, 19 Aug 2020 23:54:41 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8EC12BE056;
	Wed, 19 Aug 2020 23:54:36 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.211.41.171])
	by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
	Wed, 19 Aug 2020 23:54:36 +0000 (GMT)
References: <20200819164306.625357-1-bauerman@linux.ibm.com> <20200819164306.625357-8-bauerman@linux.ibm.com> <e38d45c9-1505-d596-6c2a-e82f73dc2935@redhat.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
        qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
        Paolo
 Bonzini <pbonzini@redhat.com>,
        Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Peter Maydell
 <peter.maydell@linaro.org>,
        Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>,
        Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
        David
 Hildenbrand <david@redhat.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
        Greg Kurz <groug@kaod.org>, Igor Mammedov
 <imammedo@redhat.com>
Subject: Re: [PATCH v6 7/8] sparc/sun4m: Use start-powered-off CPUState property
In-reply-to: <e38d45c9-1505-d596-6c2a-e82f73dc2935@redhat.com>
Date: Wed, 19 Aug 2020 20:54:33 -0300
Message-ID: <87imdedwee.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-19_13:2020-08-19,2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=999 malwarescore=0 suspectscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008190187
X-TUID: iyszY0U6ppdd


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 8/19/20 6:43 PM, Thiago Jung Bauermann wrote:
>> Instead of setting CPUState::halted to 1 in secondary_cpu_reset(), use t=
he
>> start-powered-off property which makes cpu_common_reset() initialize it
>> to 1 in common code.
>>=20
>> This makes secondary_cpu_reset() unnecessary, so remove it.
>>=20
>> Also remove setting of cs->halted from cpu_devinit(), which seems out of
>> place when compared to similar code in other architectures (e.g.,
>> ppce500_init() in hw/ppc/e500.c).
>>=20
>> Finally, change creation of CPU object from cpu_create() to object_new()
>> and qdev_realize_and_unref() because cpu_create() realizes the CPU and i=
t's
>> not possible to set a property after the object is realized.
>>=20
>> Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Thanks!

--=20
Thiago Jung Bauermann
IBM Linux Technology Center
