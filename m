Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp550116lfy;
        Wed, 19 Aug 2020 08:27:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzp/UXAKf+mJCHUj/WSx2V0M6z17FPlz3TtPg+1DTg9UixFYAQO3HLk15iidaW0dXWllOrz
X-Received: by 2002:a25:42d6:: with SMTP id p205mr34309092yba.284.1597850863105;
        Wed, 19 Aug 2020 08:27:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597850863; cv=none;
        d=google.com; s=arc-20160816;
        b=P4mZMtDc+5XqnarnMXHOBhx0dFL7nTMzTbaxg3Ztpac3VgIgQsQfJO27hcpV5Ewezd
         T8iAKOpO3rFA0OS1lEap8C/lPnrQUdqpSySKQUFhGKgJDwODioueMbcfA+CHlTjZEBsU
         E0CyS97hhhhZ076/oY41GGHcW8a/d/J6UeulyRXKZAywxd+7xX6cMOfAojXyAAg5HC0b
         YZVFqoYG7EumkKjH1BtN1/g3dtnrbhGEpNU8V3M6Fthcia5TwDRgTVnBbRZKN3I0VC4o
         l3JgHqOzAPkbO9MrwjWd03hHJfnl8EZSk55cIMcxoFAirpdXXfAPN1X7eFEPKFWqiwY0
         jWhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
         :subject:cc:to:from:user-agent:references:dkim-signature;
        bh=Gw8Z17rQPOMpQRdSu01gz13ze+J8ctBmjOln6LBHLes=;
        b=tiq859PZbrBo09GTIsLQCiW4uNRkRupFBc5O+AJ9c6uTtuj/97Gc7cHgJ+tuVJvf+1
         EYu9lS12RSVMejs5KXuE1MIZZ9Zp+m9JPMmudgLaGYu9sh2ISq4Z7bfV8n5i53Qun8rv
         cqd2+hxPnIlXBfcodkXdIpwL1FGuy5oIKktHLkCDDFUeK/ZkK5/hlLl91y+1Wuk64FZ7
         WLeMKRocJNNcfKRUyzV6VSNT31uN78bLttnCdGlh2ALNt9yQWQB1EmA9pgLp8Z4QkdVk
         xdNnI/HsMff3/R44aiZXN2Z6ieQNTNTkp3n1RkSpjupCvZQJBwISkehP28hpou/ZCG76
         s88g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=eXI2Q7Kn;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id o81si29844637ybc.465.2020.08.19.08.27.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Aug 2020 08:27:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=eXI2Q7Kn;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07JF5sY3049098;
	Wed, 19 Aug 2020 11:27:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Gw8Z17rQPOMpQRdSu01gz13ze+J8ctBmjOln6LBHLes=;
 b=eXI2Q7KnbiTXZZXOgNndCOaf1o5By3Vauom1i0/QgS3Yf5NUQSNuOCbUyZEWDTuj/L77
 njkn8MWmRqDEd2wUJR8132kHAls0kMFstU7+gjJeBKkkO19vDlRlSYglbDw5Y6pLxu17
 DwRYpNvYnik3sdescZ4Dk3X/v0LcJAjAW7uTfUET++rlgYk8MLHfVGsWZp8ozWU1Zu1U
 hdJlOSaL2XmDoZqc9knQXFQt3VkN6LdcZ9NCNymj9weMYYpDA/u1XHE52ZR7namPnNO2
 NcAaHzSgBbn1uDfNtuttlRD/i/MaLl8nxssj8f+mUAsona5+uXIADooJJr+dm3kkaehk xQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304r4mjet-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 11:27:08 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07JF6IZi050172;
	Wed, 19 Aug 2020 11:27:07 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304r4mje5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 11:27:07 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07JF9Q9u019182;
	Wed, 19 Aug 2020 15:27:06 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
	by ppma03dal.us.ibm.com with ESMTP id 3304ccr8fc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 15:27:06 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07JFR5c355574806
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Aug 2020 15:27:05 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B11C4AC05B;
	Wed, 19 Aug 2020 15:27:05 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 60D23AC059;
	Wed, 19 Aug 2020 15:26:59 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.211.41.171])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
	Wed, 19 Aug 2020 15:26:59 +0000 (GMT)
References: <20200819024220.587612-1-bauerman@linux.ibm.com> <20200819024220.587612-8-bauerman@linux.ibm.com> <350a0f8f-8db7-2e91-28e3-e114fc05c340@redhat.com>
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
        Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v5 7/8] sparc/sun4m: Use start-powered-off CPUState property
In-reply-to: <350a0f8f-8db7-2e91-28e3-e114fc05c340@redhat.com>
Date: Wed, 19 Aug 2020 12:26:56 -0300
Message-ID: <87mu2qejwf.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-19_08:2020-08-19,2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008190131
X-TUID: ufrMJtgV/Yx+


Hi Philippe,

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 8/19/20 4:42 AM, Thiago Jung Bauermann wrote:
>> Instead of setting CPUState::halted to 1 in secondary_cpu_reset(), use t=
he
>> start-powered-off property which makes cpu_common_reset() initialize it
>> to 1 in common code.
>>
>> This makes secondary_cpu_reset() unnecessary, so remove it.
>>
>> Also remove setting of cs->halted from cpu_devinit(), which seems out of
>> place when compared to similar code in other architectures (e.g.,
>> ppce500_init() in hw/ppc/e500.c).
>>
>> Finally, change creation of CPU object from cpu_create() to object_new()
>> and qdev_realize_and_unref() because cpu_create() realizes the CPU and i=
t's
>> not possible to set a property after the object is realized.
>>
>> Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>> ---
>>  hw/sparc/sun4m.c | 21 +++++----------------
>>  1 file changed, 5 insertions(+), 16 deletions(-)
>>
>> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
>> index 22c51dac8a..1925f415e7 100644
>> --- a/hw/sparc/sun4m.c
>> +++ b/hw/sparc/sun4m.c
>> @@ -218,15 +218,6 @@ static void dummy_cpu_set_irq(void *opaque, int irq=
, int level)
>>  {
>>  }
>>
>> -static void secondary_cpu_reset(void *opaque)
>> -{
>> -    SPARCCPU *cpu =3D opaque;
>> -    CPUState *cs =3D CPU(cpu);
>> -
>> -    cpu_reset(cs);
>> -    cs->halted =3D 1;
>> -}
>> -
>>  static void cpu_halt_signal(void *opaque, int irq, int level)
>>  {
>>      if (level && current_cpu) {
>> @@ -810,21 +801,19 @@ static const TypeInfo ram_info =3D {
>>  static void cpu_devinit(const char *cpu_type, unsigned int id,
>>                          uint64_t prom_addr, qemu_irq **cpu_irqs)
>>  {
>> -    CPUState *cs;
>>      SPARCCPU *cpu;
>>      CPUSPARCState *env;
>>
>> -    cpu =3D SPARC_CPU(cpu_create(cpu_type));
>> +    cpu =3D SPARC_CPU(object_new(cpu_type));
>>      env =3D &cpu->env;
>>
>>      cpu_sparc_set_id(env, id);
>> -    if (id !=3D 0) {
>> -        qemu_register_reset(secondary_cpu_reset, cpu);
>> -        cs =3D CPU(cpu);
>> -        cs->halted =3D 1;
>> -    }
>> +    object_property_set_bool(OBJECT(cpu), "start-powered-off", id !=3D =
0,
>> +                             &error_fatal);
>
> Why not call here:
>
>        qdev_realize_and_unref(DEVICE(cpu), NULL, &error_fatal);
>
> ?

I can do that. I was unsure about whether qemu_allocate_irqs() could
come after realize, but now that you pointed it out it obviously can
since this code was working with cpu_create(). I'll send a v6 with that
change.

>>      *cpu_irqs =3D qemu_allocate_irqs(cpu_set_irq, cpu, MAX_PILS);
>>      env->prom_addr =3D prom_addr;
>> +
>> +    qdev_realize_and_unref(DEVICE(cpu), NULL, &error_fatal);
>>  }
>>
>>  static void dummy_fdc_tc(void *opaque, int irq, int level)
>>


--
Thiago Jung Bauermann
IBM Linux Technology Center
