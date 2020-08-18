Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp4241128lfy;
        Tue, 18 Aug 2020 16:14:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5Pe0sn+X5skpCSYGcSeFoRNiHvWMFeN+xpYRcxX1EweN5mtLi013IwuHsbtC3qMEWmegu
X-Received: by 2002:a25:f807:: with SMTP id u7mr30529423ybd.291.1597792498332;
        Tue, 18 Aug 2020 16:14:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597792498; cv=none;
        d=google.com; s=arc-20160816;
        b=qJuRkbQtR2Cnr6iAo7pwTHT0LFIS+YMB2wdHUhyzpVIOKwfjS0h1b4/rPp+8z+PB2P
         HUp2FG+quL/mDRe7PqD8wPT733CuaRB0xhdvgxk0nk4aF15ruPRGLELXsuQjEr1yyZxR
         da+UOfLBSchGsT9VMpLsGxkwYaQcWiHiukupzkdmj9auB7S1SIL/j/2yPxZAk35dbSUh
         J4DWzn+HAkVGNyfTPZvdDG/2Uo0hWol0Ln3omseQqPys9CHvjOtFooiT57D4z/wGqOvB
         6ndXDt7j3k7HcowAKL6As9JbkgOc9hpjwD2jgm8YclMlEtPK204Ai+nZesHAKoE4ZD7X
         XNvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
         :subject:cc:to:from:user-agent:references:dkim-signature;
        bh=Gi58uPbs8miNcf6fq8TVM+bHKAYjQCAdElAyHFf1dM4=;
        b=FPvxDbnoA4+jwIKDxX2KGQf/p6yPc5MVIzi1d/nMOhZCWc7c7b2vw8sV7E8HM3qKG7
         BSmbDC2AB+KNDHvcOMVjqH116HfK8cA+IeJxNl9uvalwTAhOg2cAM84vU5KfRKXO7qbm
         BsRAL11B5Ig28lUScTo5WJTrHhwDM+STIdZ8BaBRFnIST/Sor9WAkpyhroUHtpXTuW2a
         mqkUC2LmxuHFfO4NpH/z+Ir4EgVO0o9bzfgH5EBBy/kxN2Hu1DrlR/vR+dEdo8rS1AzF
         dKNDHKRa5JTrZDHhwaeEmw/elDlRzLiH+gW4+rSNJCayIqbnNpGojQvt0B99Ee1q9KsB
         GJ+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=c+gnT67M;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id j142si22874698ybj.379.2020.08.18.16.14.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 16:14:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=c+gnT67M;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07IN3INJ005370;
	Tue, 18 Aug 2020 19:14:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=references : from : to :
 cc : subject : in-reply-to : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Gi58uPbs8miNcf6fq8TVM+bHKAYjQCAdElAyHFf1dM4=;
 b=c+gnT67MgZQxXDnpDwmYKNAZzv2flRWv0AizbTXX1Ey0nNQuyZgZ4xtYr7/MITfATGJt
 socyDAZkRJkpaPyEdWDIWXG5BFGcI8N2lRX7MeasvCsX1jNVljNwU2N07LXq1jiSoIXV
 851isavhyffUS1p5htTvGbbU4fPXDtD9mT5g7v2MjQENaQNF29l9f+Kx5H3NtL5vVtZx
 WMXeJ8W1VDFPPAKmVRF5zNVdIjmgsHe1R2gyqekNuBzHuSa41uk/7RCXStQUHf6+afMw
 pde/Cwpc42buGPCIS1PEZHupaPHeCP5hCnQbzsqfM4BMXd/yCIRRi3fmxPYJT5bmLxWc GQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304r3xe41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 19:14:33 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07IN3TZd005988;
	Tue, 18 Aug 2020 19:14:32 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304r3xe3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 19:14:32 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07IN4cQA006494;
	Tue, 18 Aug 2020 23:14:31 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
	by ppma01dal.us.ibm.com with ESMTP id 3304cc9j4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 23:14:31 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
	by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07INEV4t14811702
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Aug 2020 23:14:31 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 12535AE063;
	Tue, 18 Aug 2020 23:14:31 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E9BEBAE060;
	Tue, 18 Aug 2020 23:14:23 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.163.41.251])
	by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
	Tue, 18 Aug 2020 23:14:23 +0000 (GMT)
References: <20200818033323.336912-1-bauerman@linux.ibm.com> <20200818033323.336912-5-bauerman@linux.ibm.com> <83c5045d-ee26-9433-46a3-4919bcea7cd3@redhat.com> <65395b58-82d7-fd6b-ebc2-3fa7cb25d324@redhat.com> <874kozmu4t.fsf@morokweng.localdomain>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
        qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
        "Paolo
 Bonzini" <pbonzini@redhat.com>,
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
        "David
 Hildenbrand" <david@redhat.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
        Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v4 4/8] ppc/e500: Use start-powered-off CPUState property
In-reply-to: <874kozmu4t.fsf@morokweng.localdomain>
Date: Tue, 18 Aug 2020 20:14:19 -0300
Message-ID: <87364jmtro.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-18_16:2020-08-18,2020-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=848 mlxscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008180163
X-TUID: Tek67y/We7k4


Thiago Jung Bauermann <bauerman@linux.ibm.com> writes:

> Hello Philippe,
>
> Thanks for your review.
>
> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>
>> On 8/18/20 9:22 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> @@ -897,6 +895,19 @@ void ppce500_init(MachineState *machine)
>>>>          } else {
>>>>              /* Secondary CPUs */
>>>>              qemu_register_reset(ppce500_cpu_reset_sec, cpu);
>>>> +
>>>> +            /*
>>>> +             * Secondary CPU starts in halted state for now. Needs to=
 change
>>>> +             * when implementing non-kernel boot.
>>>> +             */
>>>> +            object_property_set_bool(OBJECT(cs), "start-powered-off",=
 true,
>>>> +                                     &error_abort);
>>>
>>> [*]
>>>
>>>> +        }
>>>> +
>>>> +        if (!qdev_realize(DEVICE(cs), NULL, &err)) {
>>>> +            error_report_err(err);
>>>> +            object_unref(OBJECT(cs));
>>>> +            exit(EXIT_FAILURE);
>>>>          }
>>>
>>> The last 4 lines are equivalent to:
>>>
>>>            qdev_realize(DEVICE(cs), NULL, &error_fatal)) {
>>
>> I meant:
>>
>>              qdev_realize(DEVICE(cs), NULL, &error_fatal);
>
> Ah! Thanks for pointing it out. I'll use that (along with
> qdev_realize_and_unref()).
>
>>
>>>
>>> This is also the preferred form, as we can not propagate errors
>>> from the machine_init() handler.
>>>
>>> Since you use &error_abort in [*], maybe you want to use it here too.
>
> I think &error_fatal is better since it preserves the behavior from
> cpu_create().

I'll change [*] to &error_fatal as well, for consistency.

--=20
Thiago Jung Bauermann
IBM Linux Technology Center
