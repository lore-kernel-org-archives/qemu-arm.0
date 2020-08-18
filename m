Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp4236634lfy;
        Tue, 18 Aug 2020 16:07:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+Whgfz5G6ahYN1Q4EgecFCE290fowBqC2ZrfNLhavDIz5OONTl8UK/LiF3f3HO0YOOW2s
X-Received: by 2002:a63:4714:: with SMTP id u20mr14997043pga.104.1597792037052;
        Tue, 18 Aug 2020 16:07:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597792037; cv=none;
        d=google.com; s=arc-20160816;
        b=fu4mAV+CYIiDWbye1nc56+Iq3K8qltJGIdV926U8vkkZb+9hk+WHaixQDry4r2U2Zk
         92HLWx6h+hkdCdQYvw0xGpFJZOXRAGyJao16sS0AD8M4RHZ8F78s09wcbSzq45pnOi2O
         7xj89fkO48NsRVsgzj9efMp7r+uuFRcUHJWf4ls10IrTXF+8EvIbPe2NMEuw3pRj6TPp
         yxbR2qiTVpQnEurpoL9u29bvNi4kH/hmxePOH/hmy/fVBYiPZbf0Pyek7ps9An0q283+
         lfz9ClsdpluknTr1dWJc+JpIX3C2pkkMY1qcfQu6iEIDe9QMf/jETIWD3Fu8J1+pd/lN
         b8UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
         :subject:cc:to:from:user-agent:references:dkim-signature;
        bh=S48EIvtTnLLRemw3xGbSTwV+oo1+wGqeoMTX9VWlt2Y=;
        b=nCkWssHFZbrjWRxCN76yoZf+w48ArU2iNgn/hvowRN0ht3l55TuceKzkvfzK3rIikr
         2DsddYZQkZYjUYVM+wYDgbVT+uMSRyIgATJUzRyDAYxtIEgrMqsDihdcSA9jwYFcY1aj
         6QE+Z4tN8CGAHJ+ISK6475xv4wddM6HTPOps4GMLBSXphpxY5Y+bv4PUxYcerT9fGKzO
         3PlSrFRgakChLaLF5z6E6m3JdgF6ahGBI9Ev8885CU/gyJKCmn42HdxgBGDmyAAac57L
         ZZwkZURFhGMsGLfvorsdZjTA1KA3X/bYqNGN33Rt8fTTwQC4Wn0E0wNThcXfaXNaPHrW
         6VNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=ESoRYMA7;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id k2si19013255plk.114.2020.08.18.16.07.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 16:07:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=ESoRYMA7;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07IN1tUE120604;
	Tue, 18 Aug 2020 19:06:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=S48EIvtTnLLRemw3xGbSTwV+oo1+wGqeoMTX9VWlt2Y=;
 b=ESoRYMA7Fd2FN3J9DeTd577QXDBNU9qUtUNBmcqRr/k1R+Ncslthehdriwn/hyty5iVB
 mHE459EYZFT9Rn+j12V6MnBNqmhB8hfR6m+mAkippMzlgASN/vJRDFGVMWmF53o+0Q2g
 LIMgdMA08MRvVDP+Rwdkp+WWR6XUTn2gtkxoZ4j3GtGQacOe5UEj1Bccy1pMxsjRoJ1Z
 PaxRdkXpahHJao1lGPq9YWSeMoTTGyVVwCLObQpjsMzovQ4ihUXSI2ZZUUFG12glO+az
 OWSIqd3TDjb7snZCMwrVVZiNPrUMeEBNpjHtjRSfUR4jgqvI4i88Nq9BE3Zq8cVLvvuQ 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304tehxhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 19:06:40 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07IN24I4121086;
	Tue, 18 Aug 2020 19:06:40 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304tehxgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 19:06:39 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07IN5VBU002589;
	Tue, 18 Aug 2020 23:06:36 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
	by ppma02dal.us.ibm.com with ESMTP id 3304cchgus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 23:06:36 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07IN6WZ325428332
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Aug 2020 23:06:32 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A240DC6055;
	Tue, 18 Aug 2020 23:06:34 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D8D08C605F;
	Tue, 18 Aug 2020 23:06:29 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.163.41.251])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
	Tue, 18 Aug 2020 23:06:29 +0000 (GMT)
References: <20200818033323.336912-1-bauerman@linux.ibm.com> <20200818033323.336912-5-bauerman@linux.ibm.com> <83c5045d-ee26-9433-46a3-4919bcea7cd3@redhat.com> <65395b58-82d7-fd6b-ebc2-3fa7cb25d324@redhat.com>
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
Subject: Re: [PATCH v4 4/8] ppc/e500: Use start-powered-off CPUState property
In-reply-to: <65395b58-82d7-fd6b-ebc2-3fa7cb25d324@redhat.com>
Date: Tue, 18 Aug 2020 20:06:26 -0300
Message-ID: <874kozmu4t.fsf@morokweng.localdomain>
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
 definitions=main-2008180160
X-TUID: VDCutNKlCwoX


Hello Philippe,

Thanks for your review.

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 8/18/20 9:22 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 8/18/20 5:33 AM, Thiago Jung Bauermann wrote:
>>> Instead of setting CPUState::halted to 1 in ppce500_cpu_reset_sec(), use
>>> the start-powered-off property which makes cpu_common_reset() initializ=
e it
>>> to 1 in common code.
>>>
>>> Also change creation of CPU object from cpu_create() to object_new() and
>>> qdev_realize() because cpu_create() realizes the CPU and it's not possi=
ble
>>> to set a property after the object is realized.
>>>
>>> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>>> ---
>>>  hw/ppc/e500.c | 19 +++++++++++++++----
>>>  1 file changed, 15 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
>>> index ab9884e315..0077aca74d 100644
>>> --- a/hw/ppc/e500.c
>>> +++ b/hw/ppc/e500.c
>>> @@ -704,9 +704,6 @@ static void ppce500_cpu_reset_sec(void *opaque)
>>>
>>>      cpu_reset(cs);
>>>
>>> -    /* Secondary CPU starts in halted state for now. Needs to change w=
hen
>>> -       implementing non-kernel boot. */
>>> -    cs->halted =3D 1;
>>>      cs->exception_index =3D EXCP_HLT;
>>>  }
>>>
>>> @@ -864,8 +861,9 @@ void ppce500_init(MachineState *machine)
>>>          PowerPCCPU *cpu;
>>>          CPUState *cs;
>>>          qemu_irq *input;
>>> +        Error *err =3D NULL;
>>>
>>> -        cpu =3D POWERPC_CPU(cpu_create(machine->cpu_type));
>>> +        cpu =3D POWERPC_CPU(object_new(machine->cpu_type));
>>>          env =3D &cpu->env;
>>>          cs =3D CPU(cpu);
>>>
>>> @@ -897,6 +895,19 @@ void ppce500_init(MachineState *machine)
>>>          } else {
>>>              /* Secondary CPUs */
>>>              qemu_register_reset(ppce500_cpu_reset_sec, cpu);
>>> +
>>> +            /*
>>> +             * Secondary CPU starts in halted state for now. Needs to =
change
>>> +             * when implementing non-kernel boot.
>>> +             */
>>> +            object_property_set_bool(OBJECT(cs), "start-powered-off", =
true,
>>> +                                     &error_abort);
>>
>> [*]
>>
>>> +        }
>>> +
>>> +        if (!qdev_realize(DEVICE(cs), NULL, &err)) {
>>> +            error_report_err(err);
>>> +            object_unref(OBJECT(cs));
>>> +            exit(EXIT_FAILURE);
>>>          }
>>
>> The last 4 lines are equivalent to:
>>
>>            qdev_realize(DEVICE(cs), NULL, &error_fatal)) {
>
> I meant:
>
>              qdev_realize(DEVICE(cs), NULL, &error_fatal);

Ah! Thanks for pointing it out. I'll use that (along with
qdev_realize_and_unref()).

>
>>
>> This is also the preferred form, as we can not propagate errors
>> from the machine_init() handler.
>>
>> Since you use &error_abort in [*], maybe you want to use it here too.

I think &error_fatal is better since it preserves the behavior from
cpu_create().

--
Thiago Jung Bauermann
IBM Linux Technology Center
