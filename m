Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp843757wrv;
        Wed, 17 Jul 2019 05:59:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwSdCp1dZRZPUJbZ0Mm0LSp8zILYqcVi2fOWDR82e2SvXN6/6guWuotmCQOIPdp7T+U1Drb
X-Received: by 2002:a50:9203:: with SMTP id i3mr35583983eda.302.1563368393036;
        Wed, 17 Jul 2019 05:59:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563368393; cv=none;
        d=google.com; s=arc-20160816;
        b=FRcoosukuEyXiESju4HjSKb6LuMsl18IHsTK4T5kGg87Bq3lCTj7EJRvfCsmh0y3+8
         ez+AHPNiw9vF77ZRxh6puz1iSU/fsENZNJIy1yPnoMqexwpEh1xlxlrh79IMOxO+wMxW
         MANz54QId14PvKBV+//Wtfl7QlTf++aVUrW96PB/e8Vx1ChoXTgcZvUz7skQ32ezGg2r
         N9eqfsao7zNmhG0n4eo4jgkAvrk+X8sfHL9x6eIcZqsRrUiD/Oee+TS6nZ225sfGz18U
         OfJuut8XxnDw4n6T873NdCU/vL/vZ4ig0kbDOiaaARrHyqr8WA9Vb8Ldx8RN/vWWjtwO
         CUpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:from:references:to;
        bh=V8Xd9UftPtKqByfXOwcSR4xnH/XiavURK3J7qHPpwEA=;
        b=Nl0Hxc0viEQWoPUMA3HBWi3hAruNyip0sqiJydzDKzPIdW37b4Got45LpZpMQQdW8p
         i81tkOjoY47S2NF7VwtC4HRk3iVTbTHFBQFgRQMFgAXIWLDlg8BQgV4CCH3DhpEhiV2E
         4yK0jixqsLrIOhgugqyyJ8NfIzvFavAxgzadbYqqHEZFm8XWEIg+oB4/v+CcNzcv7GA4
         Nmf1eA1aolp+CWc4kpSuA+Q6RneHkPSHuT6ILRnSpNkDbWDarWGvg1PewHyYPiirCflX
         jvA6xR5Y+6u9f6Nwcem8HNWP/cfy8ILtvH7oUrrFvAOlERguwWzSeK2vnntIswBhg8o3
         ZtIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x29si14134346edd.266.2019.07.17.05.59.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2019 05:59:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:56836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hnjXE-0005ek-61
	for alex.bennee@linaro.org; Wed, 17 Jul 2019 08:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41570)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <walling@linux.ibm.com>) id 1hnjX5-0005Na-P2
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 08:59:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <walling@linux.ibm.com>) id 1hnjX4-00084e-3l
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 08:59:43 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:21624
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <walling@linux.ibm.com>)
 id 1hnjX3-00083P-TC
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 08:59:42 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6HCwQg0011136
 for <qemu-devel@nongnu.org>; Wed, 17 Jul 2019 08:59:39 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tt38btqdq-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 17 Jul 2019 08:59:39 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <walling@linux.ibm.com>;
 Wed, 17 Jul 2019 13:59:39 +0100
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 17 Jul 2019 13:59:31 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6HCxUmP33095998
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Jul 2019 12:59:31 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3DDFAC05E;
 Wed, 17 Jul 2019 12:59:30 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69B75AC05B;
 Wed, 17 Jul 2019 12:59:30 +0000 (GMT)
Received: from [9.60.89.78] (unknown [9.60.89.78])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 17 Jul 2019 12:59:30 +0000 (GMT)
To: Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20190715095545.28545-1-philmd@redhat.com>
 <20190715095545.28545-2-philmd@redhat.com>
 <ca528cdc-6118-0b2f-c1b8-30b06875dde8@redhat.com>
 <CAFEAcA-wgTVfj0TUJ=piP0wEgLGiNpOYia5DK2GQAO4Q7gNaWg@mail.gmail.com>
 <6d69e8ad-d720-ce04-20f2-a03193903078@redhat.com>
 <20190715125653.6e65d575.cohuck@redhat.com>
 <c1c68faf-0424-6c7c-e39f-42159457c3ee@redhat.com>
 <20190715130955.4a117388.cohuck@redhat.com>
 <13fce62f-234c-1b13-595f-5910c066bc4f@redhat.com>
 <6c39a198-e951-c0bd-1ddc-5d227afe72ff@redhat.com>
 <87a7dfth4i.fsf@dusky.pond.sub.org>
 <20190715181206.3cb1db93.cohuck@redhat.com>
 <799aa0f5-8850-5caa-5103-e1cf3cdb018f@redhat.com>
 <87h87m2knh.fsf@dusky.pond.sub.org>
 <beb5fe93-991d-ba2b-d2c1-51e01b912dbe@redhat.com>
From: Collin Walling <walling@linux.ibm.com>
Date: Wed, 17 Jul 2019 08:59:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <beb5fe93-991d-ba2b-d2c1-51e01b912dbe@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19071712-0060-0000-0000-000003623FDE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011445; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01233452; UDB=6.00649931; IPR=6.01014777; 
 MB=3.00027759; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-17 12:59:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071712-0061-0000-0000-00004A2FD889
Message-Id: <50befb09-d381-4362-9cd1-6fb11c96a719@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-17_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907170158
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: Re: [Qemu-devel] [qemu-s390x] [RFC PATCH 1/3] hw/Kconfig: PCI bus
 implies PCI_DEVICES
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@sifive.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Helge Deller <deller@gmx.de>,
 Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>,
 "open list:S390" <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fBWKNeEiyiLT

On 7/16/19 11:04 AM, Thomas Huth wrote:
> On 16/07/2019 15.06, Markus Armbruster wrote:
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>
>>> On 15/07/19 18:12, Cornelia Huck wrote:
>>>>> Is it INTx vs. MSI vs. MSI-X?
>>>>
>>>> I think for s390x we need (INTx || MSI) vs MSI-X...
>>>
>>> I think MSI vs MSI-X is just how it's configured, not the actual
>>> behavior, so it should be irrelevant.
>>
>> My best guesses from confusing information, please correct
>> misunderstandings:
>>
>> 1. PCI devices need to support MSI or MSI-X to work with s390x.
> 
> I think Cornelia mentioned that we might even require MSI-X there ...
> Collin (being listed as "S390 PCI" maintainer), can you confirm?
> 

MSI-X is mandatory for PCI devices in the s390 architecture.

>> 2. We want a way to Kconfig the PCI devices that work, i.e. only the
>>     ones that support MSI or MSI-X.
>>
>> I don't like calling devices without any MSI capability "classic" or
>> "conventional devices".  I'd rather call them "MSI-capable" or
>> "MSI/MSI-X devices".
> 
> But you still need a config switch that you can set to enable the
> non-MSI devices ... what's so wrong with "conventional" if that's even
> the wording from the PCI SIG?
> 
>> Since PCI-E devices must implement MSI or MSI-X, we could perhaps
>> configure just the PCI-E devices for s390x.  No need to invent a new
>> name then.  Do we even have device models that can do MSI but not E?
> 
> I don't know if anybody ever tried a non-virtio PCIe device from QEMU on
> s390x ... I guess there will be quite a bit of other hurdles, too (e.g.
> the Linux driver also has to work without MMIO), so I'm not sure whether
> we really want to enable all PCIe devices there...
> 
>   Thomas
> 

