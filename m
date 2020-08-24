Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2961749lfy;
        Mon, 24 Aug 2020 16:35:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0lHL+fPrFaqUA0tgpVN9zw5E8Cda9ATDa9ZAxmmx/ENEierJntzfJngURmw2S4EdjcfXf
X-Received: by 2002:a25:e83:: with SMTP id 125mr11715274ybo.376.1598312110594;
        Mon, 24 Aug 2020 16:35:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598312110; cv=none;
        d=google.com; s=arc-20160816;
        b=Fm5BUPz7PHMVV0F5jVRXaVZqsrQzpRO81DYgLM+SVlKQ+dnPgs0ZmT5tX4xX2LcVtf
         id7t/kXJPF/MD97g8WH2n2b0x/QQJPq9ye/W2WO7gXpwIyIQioXvWXs+Bf4Cc26Q10LH
         NU1i51BLp1yiu3DEMVg85TaplE+gx420vhMu/+6e6fdfIa8B92PP0FAlriqmpUyp7QFp
         mdEfbxo50Jhc10ndGOp27BM5nZg6Tc+xJKMAZqV5QoAzfjQVWVaJ6ULCOLLTDEKHVfqQ
         gfx7vFGdOXJJXalthE4m7046Xc7E7FqEWDYpzls+g4bMl4YzOqAUTj6zL8F/27gfieFP
         vFGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
         :subject:cc:to:from:user-agent:references:dkim-signature;
        bh=AGsSv3Q5943UkrMsUV6z9Q8Hz/NQt6erlplFz3Tw54M=;
        b=JqpTAyLvgceSb6RYQM6/+pcEA2h4S4hZ7vR013mWd0DwxtlFp2unYyUBWrxsagUKwE
         OZSVTidoka/Sb83IEPnMNniC8o91u9QU2vY5RJujpWvnr6w7xbb8LhaHN4AktkOm3cS3
         ZX+CMPmZ+u/urspcXReszTn4VVlNZxOCZscQvs5np4ILx+erNnYpmp+qVN6TB8hU743g
         Djqsu9QaVXHg+wSMpjHBH9G3FPhjx0KBWbbgWHP6OEOSVP2cE5HOgrFyXDP616OMIoda
         8jUhVW09bb7Xk1FbO+tUFxOo5D4mWuITOMFNdfy3kAsuoDfCXSCR2zABgm0ttuP9mfoJ
         G0zQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=qCX7wymh;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id m8si13976261ybm.318.2020.08.24.16.35.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Aug 2020 16:35:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=qCX7wymh;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07ONVMqL157169;
	Mon, 24 Aug 2020 19:34:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=AGsSv3Q5943UkrMsUV6z9Q8Hz/NQt6erlplFz3Tw54M=;
 b=qCX7wymh3uuvLDRSB1Q6gKKgM15X2L4UiRjpZEfy/cFlAGoW9iAkkwxRcUsvrrZhu/Uv
 wJ/xlyXITb+TXiBASibURiSkuUALcbcZjizpxsb6ym5T6uwQLfwm6DkAGF+tETdONf/9
 SyjEL4Zq4Q6Vnitr5V0hQsZuLy4A2BwOat2OpfS0IRRWvSHFnLJ0I8wXRpKaY8MI2keb
 shlbKmDvWh6OzPII0QT2QhDwe2XVR9pGMt5xe9+TiRUOssMLjrlRuiGac7DuGdidmfAF
 +Qxh11QmZ2NvXYGNFGWuxMY2WZxsC4jl2ooLWyLJPA3ZjE1bjQb815v657xYLtfPDrF5 Lw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 334p8yhhb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2020 19:34:47 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07ONXLGh162186;
	Mon, 24 Aug 2020 19:34:47 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com with ESMTP id 334p8yhhan-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2020 19:34:46 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07ONQkWx004908;
	Mon, 24 Aug 2020 23:34:46 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
	by ppma05wdc.us.ibm.com with ESMTP id 332uw751bx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2020 23:34:46 +0000
Received: from b03ledav005.gho.boulder.ibm.com (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07ONYect37618166
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Aug 2020 23:34:40 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 32FABBE06A;
	Mon, 24 Aug 2020 23:34:45 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 30C6FBE05F;
	Mon, 24 Aug 2020 23:34:40 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.163.25.204])
	by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
	Mon, 24 Aug 2020 23:34:39 +0000 (GMT)
References: <20200819164306.625357-1-bauerman@linux.ibm.com> <20200819164306.625357-5-bauerman@linux.ibm.com> <3dd050ad-147e-c365-883a-3384130b0d2f@kaod.org> <2fee9e37-f420-c0d0-dc57-c0ce273a1882@redhat.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, qemu-ppc@nongnu.org,
        Peter Maydell <peter.maydell@linaro.org>,
        David Hildenbrand
 <david@redhat.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Aleksandar
 Markovic <aleksandar.qemu.devel@gmail.com>,
        Thomas Huth
 <thuth@redhat.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        Artyom
 Tarasenko <atar4qemu@gmail.com>,
        Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>,
        Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
        qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Cornelia
 Huck <cohuck@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Aurelien
 Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v6 4/8] ppc/e500: Use start-powered-off CPUState property
In-reply-to: <2fee9e37-f420-c0d0-dc57-c0ce273a1882@redhat.com>
Date: Mon, 24 Aug 2020 20:34:36 -0300
Message-ID: <87ft8b4nzn.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-24_12:2020-08-24,2020-08-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008240180
X-TUID: cMus6Dl3l9ti


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

Thanks for the references, those are very useful.

--=20
Thiago Jung Bauermann
IBM Linux Technology Center
