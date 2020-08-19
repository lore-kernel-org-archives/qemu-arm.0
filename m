Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp4275216lfy;
        Tue, 18 Aug 2020 17:13:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnyq5Ffb1qyl5nLOxSpiyDdaO4gf16uW/rW8/lvKriD6oO4Jlxz46apgU/AtTJtExdejbt
X-Received: by 2002:a05:6a00:81:: with SMTP id c1mr17600667pfj.189.1597796032305;
        Tue, 18 Aug 2020 17:13:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597796032; cv=none;
        d=google.com; s=arc-20160816;
        b=0vOjhmBY52Io2K01Hm2xo9a5we3ihKiNxTU3r503zSmgwHYzEXUY7EmkNxqUHvajO6
         uYupa8D9w80nFWiBa0RTn9z2I9gn698IguhuiyYty2ku32PKxXEur16JhOZRNlbpzJOm
         RXQweyF2mYES6rGNXCISsyt08A5knElt64+QgLobsUHe0Psunvxlf6l9AkZxf8xcKZs2
         GfzlGyw7X1X7AEqixLYN0ssStCUlkq2R/Ifip4r5m0NKETscB5pUqf6zOwAq7+sn6jsK
         I6FWWupx8owrdNCr2qLG/mIw+DUcJmm+GTyNr1xMSHF2o1p4vbmnnkgTYGX7uVwAJEIN
         k71A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
         :subject:cc:to:from:user-agent:references:dkim-signature;
        bh=Z0KxpXAk+xPpuSvVyDgLts5DhE8KXkmN5125/lfVYG0=;
        b=QHxxqMcoBXtTnWrT7BVU98XgkEH3yNozoF08OnXh6oMRyG50UWOymnby5xdcbWi6oE
         ljPj9hI153oHpgSWmHlZ/HSAJg0cbGA/zxKEgx88ICIr9VKpg5PrLUwAP0lK1b6FPqAA
         BVu+oFClfagY1GJ61hcVFTT5j5QkzvpTLzGnNo/i1r0+ONUYUk5v/vPn1UYWm5NkifhK
         olClfh3Ert1SwxS3nKs+lPXmRLMOqXVVvv1vjLXoGriqZKMYuGT/b6H/FKGqNaOcL7rg
         RvGFE5UMkslDIFn5ojGmBYRMp8RWZUxEXnxg5MGI/sbWDovfBzljr2JBZzCmpy32gK0X
         NffQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=D6UnmQC3;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id cm23si1108523pjb.22.2020.08.18.17.13.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 17:13:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=D6UnmQC3;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07J01s2Q023059;
	Tue, 18 Aug 2020 20:13:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Z0KxpXAk+xPpuSvVyDgLts5DhE8KXkmN5125/lfVYG0=;
 b=D6UnmQC3xaWDkuH0Ht+tQR5KjbP0BuewcKSeM+HOuJKXeK0ynJ3f/c4icEM8S+nDO++X
 oedft+h3LMsQCgSw3VY7p2D+xpDTklce+xYps4j3IH6Hd+Bo7hDX2AqconmbalrYOf1w
 goP6wSzTOn+P9WoqBNtXTWTW203iKllep9KyvpeA2fatCr+3mrnbAOviyi5hzshjJFkP
 +ChihJv3WHAHHK4LpFVv4w/IFmiAFOWpojS/0Stcj8dCF1ATcRrfEiXd/5LnRTFmQ9LT
 G98n9zWUYQXkEeNNYhxsNjgPeGJgVIn2YbOhVO980WnGgzYlHwqk72z2i4QgcrKtOqny Tw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304tek8ta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 20:13:07 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07J029qw023920;
	Tue, 18 Aug 2020 20:13:07 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304tek8ss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 20:13:07 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07J0AEgC021968;
	Wed, 19 Aug 2020 00:13:06 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
	by ppma03wdc.us.ibm.com with ESMTP id 3304cdyxxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 00:13:06 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07J0D5VZ54657530
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Aug 2020 00:13:05 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 894C4AC065;
	Wed, 19 Aug 2020 00:13:05 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E930FAC060;
	Wed, 19 Aug 2020 00:12:58 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.163.41.251])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
	Wed, 19 Aug 2020 00:12:58 +0000 (GMT)
References: <20200818033323.336912-1-bauerman@linux.ibm.com> <20200818033323.336912-6-bauerman@linux.ibm.com> <8c454fa8-12a6-0258-04e8-6f3c093eb333@redhat.com>
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
Subject: Re: [PATCH v4 5/8] mips/cps: Use start-powered-off CPUState property
In-reply-to: <8c454fa8-12a6-0258-04e8-6f3c093eb333@redhat.com>
Date: Tue, 18 Aug 2020 21:12:54 -0300
Message-ID: <871rk3mr21.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-18_16:2020-08-18,2020-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0
 mlxscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008180166
X-TUID: Do9sAVqSew+i


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 8/18/20 5:33 AM, Thiago Jung Bauermann wrote:
>> Instead of setting CPUState::halted to 1 in main_cpu_reset(), use the
>> start-powered-off property which makes cpu_common_reset() initialize it
>> to 1 in common code.
>>
>> Also change creation of CPU object from cpu_create() to object_new() and
>> qdev_realize() because cpu_create() realizes the CPU and it's not possib=
le to
>> set a property after the object is realized.
>>
>> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>> ---
>>  hw/mips/cps.c | 16 ++++++++++++----
>>  1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/mips/cps.c b/hw/mips/cps.c
>> index 615e1a1ad2..be85357dc0 100644
>> --- a/hw/mips/cps.c
>> +++ b/hw/mips/cps.c
>> @@ -52,9 +52,6 @@ static void main_cpu_reset(void *opaque)
>>      CPUState *cs =3D CPU(cpu);
>>
>>      cpu_reset(cs);
>> -
>> -    /* All VPs are halted on reset. Leave powering up to CPC. */
>> -    cs->halted =3D 1;
>>  }
>>
>>  static bool cpu_mips_itu_supported(CPUMIPSState *env)
>> @@ -76,7 +73,9 @@ static void mips_cps_realize(DeviceState *dev, Error *=
*errp)
>>      bool saar_present =3D false;
>>
>>      for (i =3D 0; i < s->num_vp; i++) {
>> -        cpu =3D MIPS_CPU(cpu_create(s->cpu_type));
>> +        Error *err =3D NULL;
>> +
>> +        cpu =3D MIPS_CPU(object_new(s->cpu_type));
>>
>>          /* Init internal devices */
>>          cpu_mips_irq_init_cpu(cpu);
>> @@ -89,7 +88,16 @@ static void mips_cps_realize(DeviceState *dev, Error =
**errp)
>>              env->itc_tag =3D mips_itu_get_tag_region(&s->itu);
>>              env->itu =3D &s->itu;
>>          }
>> +        /* All VPs are halted on reset. Leave powering up to CPC. */
>> +        object_property_set_bool(OBJECT(cpu), "start-powered-off", true,
>> +                                 &error_abort);
>>          qemu_register_reset(main_cpu_reset, cpu);
>> +
>> +        if (!qdev_realize(DEVICE(cpu), NULL, &err)) {
>> +            error_report_err(err);
>> +            object_unref(OBJECT(cpu));
>> +            exit(EXIT_FAILURE);
>> +        }
>
> Here errp is available, so we can propagate the error to the caller:
>
>            if (!qdev_realize(DEVICE(cpu), NULL, errp)) {
>                return;
>            }

Ah, nice. I made this change (using qdev_realize_and_unref()).

I also changed object_property_set_bool() to use errp as well instead of
&error_abort (and also early return on error).

> For example in hw/mips/boston.c:
>
>     object_initialize_child(OBJECT(machine), "cps", &s->cps, TYPE_MIPS_CP=
S);
>     object_property_set_str(OBJECT(&s->cps), "cpu-type", machine->cpu_typ=
e,
>                             &error_fatal);
>     object_property_set_int(OBJECT(&s->cps), "num-vp", machine->smp.cpus,
>                             &error_fatal);
>     sysbus_realize(SYS_BUS_DEVICE(&s->cps), &error_fatal);
>
> This will be propagated here ---------------^^^^^^^^^^^^^

Interesting. Thanks for the explanation.

--
Thiago Jung Bauermann
IBM Linux Technology Center
