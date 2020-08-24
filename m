Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2961365lfy;
        Mon, 24 Aug 2020 16:34:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAMs0Y3FycLktcbHEbLyna2cBJAcUifGacTW2mXMJHcb/dIQ/ABbhk2x5vCzOROhKbEkN/
X-Received: by 2002:a63:4246:: with SMTP id p67mr4830323pga.110.1598312077879;
        Mon, 24 Aug 2020 16:34:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598312077; cv=none;
        d=google.com; s=arc-20160816;
        b=yWpEWARypDrC8vJ0evY0q9wHAOI/6DuXyKqweAMCwb6kD+0O0JygmH2ONMS2psovDT
         ZR/zMp5MfJlECR3GYbjZqc7yu1PvibWEukF7Drzcwg2E4MvDGB07chRd52Z9qLX5OyW3
         yV/CjUdBDJmYMkoCkCQpZT4GvhcUOAYb4aPUVpUek3e1Pnz/Z9eWRGtqxGfS2Xg1bWzI
         EQmcwKq87WNzCPJOMHKBxw8bNzFAivqX+tw5WHzHhLgoitQ644dmYS1STrf7OdqENNfu
         yqbfZddeyeRPHZ6KHIVn8u82RBrkQYj3yYQU7krxqWWpFPCGoUzsMZ0El1PX57jBUEly
         vJ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
         :subject:cc:to:from:user-agent:references:dkim-signature;
        bh=S8zw6Bgkz6PFEXBgnOpPvo7u9/SeY9sINEI+jQAWj0U=;
        b=Lidc5PCH1zrV3UKEGAPy9JiboE+y59687p49EmYtrjB/D38x5t+JnSsUcPaSwggbf1
         jCmczdFyc9H+OVJglEaDu3DnMMWT2p0SPgG+XV5W7sM9X1vuSPgJ8wdAF/05ybpMGXqG
         5ZuQUGovqoPHeUQG7hq5M8qPhNgidGW72Gt/qc4RFGkqkbgEXR2kYKY6RomHIrNh5VJH
         +gg8Cf7t+URk53L5TmrQc7tpMGvxXXV8/C75aYUk3vUCIfdAmjNZpBUg07jsMNeaE97c
         aggGuJAB1L08wE/1Rd1iW0bDQhbNl0yDujdSAWcm8YqsKEf0sn1o3UG6DgoTBxSL8ejI
         0y9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=RglZzcjF;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id x136si8943279pfc.38.2020.08.24.16.34.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Aug 2020 16:34:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=RglZzcjF;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07ONWif3144045;
	Mon, 24 Aug 2020 19:33:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=S8zw6Bgkz6PFEXBgnOpPvo7u9/SeY9sINEI+jQAWj0U=;
 b=RglZzcjFN+6K8pm7GwSAH0rmXeet+wQlA4KfrfLEE21uk92Gvz2sby7YZcycTaPEuEtK
 BTeFG9MBGc5cq1dHV2Klmle9DuT5tQOYa5N8HocLk5Nwspbu4o3OS3SyCjpxHDo256s7
 0sxETHZN4xOnKfyD4HuKoV0pnbHNJ8UbFojBjzkLvWwVYJmA2OwycAeffJbVluqIFM+M
 c0NONiTuLBKY3fSHaQ2l/BhZ6WYRyHTajqQC07QjphIWopS7gdipfXT+fE4CWokP77Zx
 UjXTvOhQZg/kTrhMHXQaN1Air+fTreLzXjyrck/yIwj6y8qA7Nf5njq3g60h/G9j1wTV kw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 334p541pw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2020 19:33:53 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07ONXr7C146785;
	Mon, 24 Aug 2020 19:33:53 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com with ESMTP id 334p541pve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2020 19:33:53 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07ONQwl7028200;
	Mon, 24 Aug 2020 23:33:52 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
	by ppma01dal.us.ibm.com with ESMTP id 332utt2dey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2020 23:33:52 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07ONXpNL15139440
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Aug 2020 23:33:51 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 59195AC05B;
	Mon, 24 Aug 2020 23:33:51 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 50225AC059;
	Mon, 24 Aug 2020 23:33:44 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.163.25.204])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
	Mon, 24 Aug 2020 23:33:43 +0000 (GMT)
References: <20200819164306.625357-1-bauerman@linux.ibm.com> <20200819164306.625357-5-bauerman@linux.ibm.com> <3dd050ad-147e-c365-883a-3384130b0d2f@kaod.org> <20200823071413.GB4734@yekko.fritz.box>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>
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
        Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Aleksandar
 Rikalo <aleksandar.rikalo@syrmia.com>,
        Eduardo Habkost
 <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
        qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson
 <rth@twiddle.net>,
        Cornelia Huck <cohuck@redhat.com>,
        Igor Mammedov
 <imammedo@redhat.com>,
        Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH v6 4/8] ppc/e500: Use start-powered-off CPUState property
In-reply-to: <20200823071413.GB4734@yekko.fritz.box>
Date: Mon, 24 Aug 2020 20:33:41 -0300
Message-ID: <87h7sr4o16.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-24_12:2020-08-24,2020-08-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008240180
X-TUID: eD7cCeyKeHH1


David Gibson <david@gibson.dropbear.id.au> writes:

> On Sat, Aug 22, 2020 at 10:59:56AM +0200, C=C3=A9dric Le Goater wrote:
>> Hello,
>>=20
>> On 8/19/20 6:43 PM, Thiago Jung Bauermann wrote:
>> > Instead of setting CPUState::halted to 1 in ppce500_cpu_reset_sec(), u=
se
>> > the start-powered-off property which makes cpu_common_reset() initiali=
ze it
>> > to 1 in common code.
>> >=20
>> > Also change creation of CPU object from cpu_create() to object_new() a=
nd
>> > qdev_realize_and_unref() because cpu_create() realizes the CPU and it'=
s not
>> > possible to set a property after the object is realized.
>> >=20
>> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> > Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
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
>>     AFAIUI, 'input is not initialized since the CPU is not yet
>>     realized.
>
> Sigh.  For future reference, Thiago, running an all-targets make check
> is pretty much a minimum bar to test before posting.

Sorry for the breakage. I'm working on it.

--=20
Thiago Jung Bauermann
IBM Linux Technology Center
