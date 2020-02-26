Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3487169lfg;
        Wed, 26 Feb 2020 12:02:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqxBGSG8sFNIoSgIzJKQCvjAlDsbRuqQpGgG0qLZCvwHPigcm4ws32LctLMOekXqxB4j5Q3+
X-Received: by 2002:a0c:bf0b:: with SMTP id m11mr823624qvi.63.1582747336681;
        Wed, 26 Feb 2020 12:02:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582747336; cv=none;
        d=google.com; s=arc-20160816;
        b=Zf7si3VqLVJwuY/T8GxQ2kENOhlg6cwLuhpOrv9ZUdW6pd5o7tf/rsq0Dx8Wc5pORv
         bNbzQEkz2gxzLovg+bDHP5YZESfUHjKojPwUQxXVeITwH+8gOv2AqWI5lSLJqwMtPAnH
         7vrqIIf4kZbK+7/Wv8qFpGGdUzH5z+KHcQmCHQdLJNHDx29XzV7aEOHhHMBdGoqYdylj
         LGFww6Au08fLuOuKyuz+aX3563Px/ijSlAJc1raQBMPl51XVPxeqb08hoT1ixVanx5Yi
         uPXB+F+2MyACLMDNLkrlKrQZ0Af+vZRXdRs4bJEPRd462CmNRsngValAhdfldwXQeh9U
         tjIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=QVAYVXYHvkT9JL7kChGrZ3mZXN69ZwUzjKCoy/q5ZNE=;
        b=NZKgVGKM0G6YzsslEHnDNL4mszwZGcMZ4uhoWMX7MZiF+Hnq0SKWfNVoOYdHvJK5Ou
         OV/sAFm6OVmLrGaf8e6p04zgg8PH0yaGtUBPVl39x5H6x+YE/1xYPqF9EJRZKZ7tk5+A
         jRTaJdbNkes0jwBF2OjFw1kBHJFoX1zwrsjTgZTHK3/N9GfJj0NQuY3uyzzAvdqBFdD6
         Fua3TIyiVHhncmcMNv7CfHNQLpv0pkJ8pjxOku+lhaREPbVTkl8LTi+K2R7STluokwTQ
         vkPMoYyeR2PWGrTOihAWHt0nH2nGOgTmjDIHxab8iLpqadCeurZNH5OtPRkFCLstO/t+
         Ph/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 142si298221qkh.201.2020.02.26.12.02.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 12:02:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:49294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j72sq-0002sF-4F
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 15:02:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43051)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanb@linux.ibm.com>) id 1j72se-0002rp-2h
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 15:02:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanb@linux.ibm.com>) id 1j72sc-0002nj-Eh
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 15:02:03 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:9938
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanb@linux.ibm.com>)
 id 1j72sb-0002gl-FJ; Wed, 26 Feb 2020 15:02:02 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01QJtadP058204; Wed, 26 Feb 2020 15:01:57 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ydqf7sgs1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2020 15:01:57 -0500
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01QJtj97058584;
 Wed, 26 Feb 2020 15:01:57 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ydqf7sgrb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2020 15:01:57 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01QK1L7l024900;
 Wed, 26 Feb 2020 20:01:56 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 2ydcmksqkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2020 20:01:56 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01QK1tGG40173834
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Feb 2020 20:01:55 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3C3D6A051;
 Wed, 26 Feb 2020 20:01:54 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 310506A054;
 Wed, 26 Feb 2020 20:01:54 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 26 Feb 2020 20:01:53 +0000 (GMT)
Subject: Re: [PATCH v3 00/10] vTPM for aarch64
To: Auger Eric <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20200226102549.12158-1-eric.auger@redhat.com>
 <31e81f4b-ef00-692e-540f-ef3d9be5bb9a@linux.ibm.com>
 <22380cd3-b13e-aede-a7f5-158d86ca6136@redhat.com>
 <a8913524-4de3-dc0a-0b2c-2deb88c33859@linux.ibm.com>
 <df345076-8def-9ba5-6c11-2bcaa2293ca1@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <bf008b7d-e6dc-5eeb-03e0-a141db367b6d@linux.ibm.com>
Date: Wed, 26 Feb 2020 15:01:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <df345076-8def-9ba5-6c11-2bcaa2293ca1@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-26_07:2020-02-26,
 2020-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002260121
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0b-001b2d01.pphosted.com id 01QJtadP058204
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
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
X-TUID: v5E56xBvJA4R

On 2/26/20 1:18 PM, Auger Eric wrote:
> Hi Stefan,
>
> On 2/26/20 6:53 PM, Stefan Berger wrote:
>> On 2/26/20 12:47 PM, Auger Eric wrote:
>>> Hi Stefan,
>>>
>>> On 2/26/20 2:32 PM, Stefan Berger wrote:
>>>> On 2/26/20 5:25 AM, Eric Auger wrote:
>>>>> This series adds the capability to instantiate an MMIO TPM TIS
>>>>> in ARM virt. It is candidate to qemu 5.0.
>>>> Looks good. Can you run the checkpatch script over the patches and
>>>> address the warnings?
>>>>
>>>>
>>> Thank you for you review!
>>>
>>> About warnings
>>>
>>> - There are warnings due to new files added but I think they all have=
 an
>>> entry in MAINTAINERS as wildcards are used.
>>>
>>> - In tpm: Add the SysBus TPM TIS device.
>>>  =C2=A0=C2=A0 There is line over 80 chars but I think it is fine
>>>
>>> #define TPM_TIS_SYSBUS(obj) OBJECT_CHECK(TPMStateSysBus, (obj),
>>> TYPE_TPM_TIS_SYSBUS)
>>
>> Ok, leave it as it is.
> and sorry, what about the comment style issues derived from existing fi=
les?
>
> "
> - test: tpm-tis: Get prepared to share tests between ISA and sysbus dev=
ices
> has lots of warnings due to old comment style being used in
> tests/qtest/tpm-tis-test.c. I did not fix the style issue because I jus=
t
> copy the code into tpm-tis-util.c
>
> Do you want me to fix them in the same patch, in a separate patch or
> ignore the style issue for now?


if you could fix them that would be great...


> "
>
> Thanks
>
> Eric
>
>
>>
>>  =C2=A0=C2=A0 Stefan
>>
>>

