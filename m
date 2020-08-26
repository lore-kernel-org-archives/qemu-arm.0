Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp469315lfc;
        Tue, 25 Aug 2020 22:49:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwu+gAnyvHmHLOOCN/i4J0rhiFJGJ1HHTayr1O3XKdj2QmWJPVXwnLroAlyn3888mkwlsFu
X-Received: by 2002:a25:9887:: with SMTP id l7mr17926759ybo.3.1598420943793;
        Tue, 25 Aug 2020 22:49:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598420943; cv=none;
        d=google.com; s=arc-20160816;
        b=SQTAqXw0jFkJF5/y/wbbgMy+hZDfaoXFbgp6liM1huAu0Npjx1svDxnBsYX0GFUGI8
         VzF2q1mpD9UhZNBhMEgy7X7snbnPQRc5s1Ya3BEBQiPXhGgjKbbTbOyry+PFKuSc5y/0
         oWM90Cja3wbUURNba3Qn3Ub3zRDKZqG+q/Wr57S0K/O2jWbtrtg0nx4R6jdtSX1UN3sl
         T0ARrEiqq9Wfh+DVGLq2TRYse6JGeBL67MQ+O2Pis/20JmEUufHMWndUXF7wYRzJqmHn
         HfFOsRJlcp2eRRGG7qRub0S+PXNXZhzMtxKe1qB5BxrN2hSGzFYzEpZsXdd7QyCnK9c6
         2i7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
         :subject:cc:to:from:user-agent:references:dkim-signature;
        bh=dcxb6Jwuf5SJkfmaOFW772Frk9TrnM/XhuhQrCIIzgo=;
        b=jsO5PDOLvwEkJ79/pAcruPBYGvGM6ulNV/UNMyDZWJdaYtIdaaSmLNvfSAXH/7Oq2g
         tawtyLO0ZuN/1aq1Snt0f7YX4VCX4piEwYXwLCniXk1tFAJAHq9iPJ+LLgDmvcY+hmp2
         hKIYsoc71Pf29uCV1wTyPz1jraY8m+/HQAMyBwRv82ngnKbduc7aeSsY+58yeyBYKqMA
         WXIYdVk/xnDO4VnNYb4zJlOHgiBDyZ5xZictC2UpRe/qlvV8ciUmB3NQvimmTxkjhg3i
         DfgBqrwCpTCdWNeZwh+xtqiDuDJLH7DaVm6dZacih/ZUAySiV9A13ni00jip712Fddfr
         EUmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=FQzx9+Pi;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id a5si1272918ybs.375.2020.08.25.22.49.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Aug 2020 22:49:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=FQzx9+Pi;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07Q5Vvxj183636;
	Wed, 26 Aug 2020 01:48:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=dcxb6Jwuf5SJkfmaOFW772Frk9TrnM/XhuhQrCIIzgo=;
 b=FQzx9+PiX8LG0duB9qrOZyl/BdWG75BCU9n796+GFnQUuWlG3EPkQQSz+ERBYUbsIM8H
 QQyPcctr38JQpGRTNg28bUw6L2rE/VmgfJYGk49eB4NagE2gw811qJZyKgo7MpnJNrKP
 psBoHRNnWV8UvaW8uue3EMmMVxU0FYwUFqgJug9JQRgOpNVx4ZwT2X3sbsMdSecy48d2
 BTvHQHCBtul1vRyK4xkZ/t0n9GaNFgoAmwZXnyeLIUww69WQU9LkcuTYCvGBhi9nLkT2
 k3B/gkHvSdhFRy69ZHv0FKSaTS6dzw3/5qOZM3DSRwRfBcLL3A7n4ZT7Rd3NbSIEd0Rv yg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 335hfbrpe7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2020 01:48:35 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07Q5XFf3186641;
	Wed, 26 Aug 2020 01:48:34 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0b-001b2d01.pphosted.com with ESMTP id 335hfbrpdt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2020 01:48:34 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07Q5la4Z013503;
	Wed, 26 Aug 2020 05:48:34 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma04dal.us.ibm.com with ESMTP id 332ujr6yf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2020 05:48:34 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07Q5mXfK41550106
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Aug 2020 05:48:33 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 375BBAC059;
	Wed, 26 Aug 2020 05:48:33 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 78B97AC05B;
	Wed, 26 Aug 2020 05:48:26 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.163.48.38])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
	Wed, 26 Aug 2020 05:48:26 +0000 (GMT)
References: <20200819164306.625357-1-bauerman@linux.ibm.com> <20200819164306.625357-5-bauerman@linux.ibm.com> <3dd050ad-147e-c365-883a-3384130b0d2f@kaod.org> <2fee9e37-f420-c0d0-dc57-c0ce273a1882@redhat.com>
User-agent: mu4e 1.4.10; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
        Peter Maydell
 <peter.maydell@linaro.org>,
        Thomas Huth <thuth@redhat.com>, Eduardo
 Habkost <ehabkost@redhat.com>,
        David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
        Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>, Greg Kurz
 <groug@kaod.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        qemu-arm@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
        Igor Mammedov
 <imammedo@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Richard
 Henderson <rth@twiddle.net>,
        Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org
Subject: Re: [PATCH v6 4/8] ppc/e500: Use start-powered-off CPUState property
In-reply-to: <2fee9e37-f420-c0d0-dc57-c0ce273a1882@redhat.com>
Date: Wed, 26 Aug 2020 02:48:22 -0300
Message-ID: <87v9h69cux.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-25_11:2020-08-25,2020-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008260040
X-TUID: dejvehWaTL9i


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 8/22/20 10:59 AM, C=C3=A9dric Le Goater wrote:
>> Hello,
>>=20
>> On 8/19/20 6:43 PM, Thiago Jung Bauermann wrote:
>>> Instead of setting CPUState::halted to 1 in ppce500_cpu_reset_sec(), use
>>> the start-powered-off property which makes cpu_common_reset() initializ=
e it
>>> to 1 in common code.
>>>
>>> Also change creation of CPU object from cpu_create() to object_new() and
>>> qdev_realize_and_unref() because cpu_create() realizes the CPU and it's=
 not
>>> possible to set a property after the object is realized.
>>>
>>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>>=20
>>=20
>> This is breaking make check :=20
>>=20
>>     tests/qtest/libqtest.c:175: kill_qemu() detected QEMU death from sig=
nal 11 (Segmentation fault) (core dumped)
>>     ERROR boot-serial-test - too few tests run (expected 7, got 0)
>>     make: *** [/home/legoater/work/qemu/qemu-powernv-5.2.git/tests/Makef=
ile.include:650: check-qtest-ppc64] Error 1
>>     make: *** Waiting for unfinished jobs....
>>=20=20=20=20=20
>>=20=20=20=20=20
>>     gdb --args build/ppc64-softmmu/qemu-system-ppc64  -display none   -M=
 ppce500
>>     ...
>>     Thread 1 "qemu-system-ppc" received signal SIGSEGV, Segmentation fau=
lt.
>>     0x000055555596ebf2 in ppce500_init (machine=3D0x5555567aa6e0)
>>         at /home/legoater/work/qemu/qemu-powernv-5.2.git/hw/ppc/e500.c:8=
80
>>     880	        irqs[i].irq[OPENPIC_OUTPUT_INT] =3D input[PPCE500_INPUT_=
INT];
>>=20=20
>>=20=20=20=20=20
>>     AFAIUI, 'input is not initialized since the CPU is not yet realized.
>
> Thiago, see ad938fc1d53 ("hw/arm/palm.c: Encapsulate misc GPIO handling
> in a device") and eventually f8a865d36dc ("hw/arm/allwinner-a10:
> Simplify by passing IRQs with qdev_pass_gpios") to get an idea how you
> can fix that.

I ended up not following this route. There were other patches in this
series which also caused problems in make check, but in those cases it
wasn't related to IRQ setup.

I started feeling like I had fallen into a rabbit hole so I opted
instead to solve these problems by minimizing the consequences of the
changes made by this patch series.

--=20
Thiago Jung Bauermann
IBM Linux Technology Center
