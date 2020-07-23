Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1205551lfm;
        Wed, 22 Jul 2020 17:52:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymnnjfpMVY9bYXYa02ORM3wYxHQ5FfEtUPR6eZnU+vexGErrhWVsQV3z3Ot+rrfK5mDG5B
X-Received: by 2002:a25:ba41:: with SMTP id z1mr3461838ybj.33.1595465532429;
        Wed, 22 Jul 2020 17:52:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595465532; cv=none;
        d=google.com; s=arc-20160816;
        b=oTNkehHus6N6tOYv3UoFLoS4O2VUL3Qn8aB5XK3Tz3iRDJw9IE3Q2AuRfC9cLq2jtK
         mkZGZp9AObl+OBPQSRnQin2Y1aaBxYl4+Cxzqk9efqybx8FGlDmbIajkgO5VLuMhe171
         gcEhSsM8Qygj7ob4YAT9ZBg6IpD472nHLxpG5jCjLHMfEat+pPTlzSWL1mWGltbGD0bE
         G3LhUtRYPyKLoZHorGhSOViFU8GN5kMSwDRPW9uSi9ad13+qVaKINw9yWvdYk4k4hXRJ
         Ros/A4r8xKA5cxeuViRDr7DM0ffjCnYnZHvXS6wgn0DZmPHRsWIfEbyK1XA0vyI5PI+N
         QdEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :in-reply-to:subject:to:from:user-agent:references;
        bh=6RIqN+bfQBRC5Smwb6TZa3/rTvdLJz66jBO+W06DyiU=;
        b=JfDULO4PkQCpyD6uOHEVb/URDhEnpHv4bhUuGAF7rKaG54VvaWe1cITov96tedzMq+
         dT0ET2FjYvFvVE/D0Svrmfv/fvIoFoIQV2mgYvA2+rjI81LwO2KKS5jE7EVzfRZ/Hn0l
         m9aQh4LzXPbYKnznedQMNS6AsFO81sMne28QwLfdnDK0l1F9W0Gt2AMwnNR5ocFRhGIt
         C3jeDQU4mO1OJo0iji//roV/o2CwxgN3XRDiqVvuzcED/BXlkOwl/Pj8cE7OYyvHwSJM
         gpMH5pzqpg2Ujkq9rCa0F30lddIL5B+KppAF0AoKf8MpHOh1MecaJOvK3TSVUcS5MpHx
         p2uA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i143si1244104ybg.33.2020.07.22.17.52.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jul 2020 17:52:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:46534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jyPT1-0005ja-S1
	for alex.bennee@linaro.org; Wed, 22 Jul 2020 20:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bauerman@linux.ibm.com>)
 id 1jyPSt-0005jK-Q5; Wed, 22 Jul 2020 20:52:03 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29084
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bauerman@linux.ibm.com>)
 id 1jyPSs-0006GV-40; Wed, 22 Jul 2020 20:52:03 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06N0WXTb076739; Wed, 22 Jul 2020 20:51:43 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32e1vwd53p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 20:51:42 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06N0WaOm077109;
 Wed, 22 Jul 2020 20:51:42 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32e1vwd53a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 20:51:42 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06N0p6U5006635;
 Thu, 23 Jul 2020 00:51:41 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03wdc.us.ibm.com with ESMTP id 32brq9gafd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 00:51:41 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06N0pfBi52756924
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jul 2020 00:51:41 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 023CC112064;
 Thu, 23 Jul 2020 00:51:41 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB836112062;
 Thu, 23 Jul 2020 00:51:34 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.211.93.190])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 23 Jul 2020 00:51:34 +0000 (GMT)
References: <20200722035016.469075-1-bauerman@linux.ibm.com>
 <20200722035016.469075-10-bauerman@linux.ibm.com>
 <20200722170032.GN1274972@habkost.net>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [RFC PATCH v2 9/9] target/s390x: Use start-powered-off CPUState
 property
In-reply-to: <20200722170032.GN1274972@habkost.net>
Date: Wed, 22 Jul 2020 21:51:29 -0300
Message-ID: <87lfjbrr3i.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_16:2020-07-22,
 2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007220151
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=bauerman@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/22 18:08:00
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RWkaYQf7h0kJ


Eduardo Habkost <ehabkost@redhat.com> writes:

> On Wed, Jul 22, 2020 at 12:50:16AM -0300, Thiago Jung Bauermann wrote:
>> Instead of setting CPUState::halted to 1 in s390_cpu_initfn(), use the
>> start-powered-off property which makes cpu_common_reset() initialize it to
>> 1 in common code.
>>
>> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>> ---
>>  target/s390x/cpu.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> NB: I was only able to test that this patch builds. I wasn't able to
>> run it.
>>
>> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
>> index 08eb674d22..d3a14af1d9 100644
>> --- a/target/s390x/cpu.c
>> +++ b/target/s390x/cpu.c
>> @@ -291,7 +291,8 @@ static void s390_cpu_initfn(Object *obj)
>>      S390CPU *cpu = S390_CPU(obj);
>>
>>      cpu_set_cpustate_pointers(cpu);
>> -    cs->halted = 1;
>> +    object_property_set_bool(OBJECT(cs), "start-powered-off", true,
>> +                             &error_abort);
>
> Is this really OK?  s390 CPUs don't seem to set halted=1 on reset
> today.

Hm, good point. That is indeed a behavior change that this patch
introduces. I'll point it out in the description for v3, and if it's
wrong then this patch can simply be dropped.

--
Thiago Jung Bauermann
IBM Linux Technology Center
