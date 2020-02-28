Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp942444lfg;
        Fri, 28 Feb 2020 09:52:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqyGFbuqa4ILr/RscYPY7WSffdPkhqCtTVyye0V/xa91phMoHWCdhvUO9jE/bArjpto/rD7P
X-Received: by 2002:ac8:45d1:: with SMTP id e17mr5296757qto.145.1582912350723;
        Fri, 28 Feb 2020 09:52:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582912350; cv=none;
        d=google.com; s=arc-20160816;
        b=KXJ7aBieDJiV7/s1OWKWL3cwCmZCMOnVqn1JQEMRfPdD1fWoqRjl1uEfE+G/t1ozMN
         Hoh8Cc2z+zHCR4fm+rT/HIs2ZqfV1S9D+g6/ZoPd5bG6Z8BPZenbnJTwpUQndOTP5vpy
         BW6QnyPAIfCkMbHmnL909WRLHWpepsLpl1e2BXW26TvtDHV33+PKeQKUl5umTsW4RKnj
         dmry3OSDFYphKT/Xr0BYnsyOVdaEpOBa55nC3Q5Zi24TtbmTFzhshWG1kWPSHSLcL8wv
         dsu2yOQ7FZydyb1HaW212salGG+skUTc1Vbm5M2QBGGVsctGHbVxOfZDqypDd34/19y/
         SAcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=MzyS+UeY21C1vvFrF9F/4iDdRkDkr+uYhhjr47GcwFs=;
        b=m2ZuMBYUMKqd7OwYsieTcJN/zikq/Icz0DV5+Ypm2O/PVGZD4APiEoXLNofsctbUPM
         C1BcwL9mvg5wbhBXGYVQ6h2dUPakKM2GfKBtHN7Ty93Om6TD7ar5uwtYjF7sY+qB4cfP
         h2+EGn/2YPAiCpLFC1IoiJB+qeErXnG3K9RVsnEOe4WdlFIqJpp87lteEKIDpq//r3DS
         nnl4s03ekPrUftSZ/Hz/PXBlJgOO+C37wprg+j94zREG3LYtzo7Bmc43UgXS6C0Ia5lq
         f4NVcTYjJgo3iDv3IvyW22zvcaj9NSnpq19ySKGfW0rg3iF3lhJB/uxOQsjlbzQFonTQ
         g0BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h6si1846760qtr.366.2020.02.28.09.52.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 09:52:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:51926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7joL-00019d-0l
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 12:52:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51397)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanb@linux.ibm.com>) id 1j7joD-00019G-Ac
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 12:52:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanb@linux.ibm.com>) id 1j7joC-0006ex-4V
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 12:52:21 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50324)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanb@linux.ibm.com>)
 id 1j7joB-0006e3-TL; Fri, 28 Feb 2020 12:52:20 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01SHnWEp105156; Fri, 28 Feb 2020 12:52:17 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yepwsynx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Feb 2020 12:52:17 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01SHoYQc108494;
 Fri, 28 Feb 2020 12:52:17 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yepwsynwb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Feb 2020 12:52:17 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01SHoKl0025364;
 Fri, 28 Feb 2020 17:52:15 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02wdc.us.ibm.com with ESMTP id 2yepv2p7aw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Feb 2020 17:52:15 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01SHqFVG54723012
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Feb 2020 17:52:15 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83CBBAC05B;
 Fri, 28 Feb 2020 17:52:15 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 725D9AC059;
 Fri, 28 Feb 2020 17:52:15 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 28 Feb 2020 17:52:15 +0000 (GMT)
Subject: Re: [PATCH v4 00/10] vTPM for aarch64
To: Auger Eric <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20200226205942.11424-1-eric.auger@redhat.com>
 <4fb16117-f9d3-61af-9198-931590a46e3d@linux.ibm.com>
 <ee98e8ab-06df-e422-1ca5-f3f6a48145f2@redhat.com>
 <2413ead7-3707-acc6-7900-bb3896082051@linux.ibm.com>
 <8ae6ca7b-34b5-b752-2bfd-4b7c2c9663f5@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <61c4ec54-e7ab-21a2-c446-b45d906ca4e1@linux.ibm.com>
Date: Fri, 28 Feb 2020 12:52:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <8ae6ca7b-34b5-b752-2bfd-4b7c2c9663f5@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-28_06:2020-02-28,
 2020-02-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 phishscore=0 clxscore=1015 adultscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxlogscore=839
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2002280135
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-001b2d01.pphosted.com id 01SHnWEp105156
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
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
Cc: marcandre.lureau@redhat.com, lersek@redhat.com, ardb@kernel.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xS1cBqCAwIv2

On 2/28/20 9:49 AM, Auger Eric wrote:
> Hi Stefan,
> On 2/28/20 3:37 PM, Stefan Berger wrote:
>> On 2/27/20 3:07 AM, Auger Eric wrote:
>>> Hi Stefan,
>>> On 2/26/20 11:44 PM, Stefan Berger wrote:
>>>> On 2/26/20 3:59 PM, Eric Auger wrote:
>>>>> This series adds the capability to instantiate an MMIO TPM TIS
>>>>> in ARM virt. It is candidate to qemu 5.0.
>>>> I queued it now here:
>>>> https://github.com/stefanberger/qemu-tpm/commits/tpm-next
>>>>
>>>> I will send the PR within a few days. Thanks!
>>> Thank you. I will just ping Peter to make sure he has no comments on
>>>
>>> [PATCH v4 06/10] hw/arm/virt: vTPM support
>>
>> The little dent is now an arm boot failure:
>>
>>
>> https://travis-ci.org/stefanberger/qemu-tpm/jobs/655573347?utm_medium=3D=
notification&utm_source=3Demail
> is this really related to the sysbus TPM-TIS addition? I have the
> impression cubieboard acceptance tests (ARM 32b) are failing. I touched
> ARM virt machine.

I hadn't seen this one here before:

https://travis-ci.org/qemu/qemu/jobs/656327906


We're good.


 =C2=A0=C2=A0 Stefan



>
> Thanks
>
> Eric
>>
>>
>> Have a look at the raw log.
>>
>>
>>  =C2=A0=C2=A0 Stefan
>>
>>
>>

