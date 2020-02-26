Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3363469lfg;
        Wed, 26 Feb 2020 09:53:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqxL/pNFMLXSmazjqbd5guLsScWQLCfjYfx5GbRvi9gOs8nr+qPQCdXIwe7myNgwRJWoPSxj
X-Received: by 2002:a05:620a:14ad:: with SMTP id x13mr298955qkj.448.1582739600958;
        Wed, 26 Feb 2020 09:53:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582739600; cv=none;
        d=google.com; s=arc-20160816;
        b=Wi8TBNk0ttXI8bHIq0doL2UoXCIT9v21McsMK1BZXdDfLbu3N2kuRAydm3OnrKctcF
         rlMakb8bSyjLyEGoIuALVvdtzjwAb7Rc5u8vskDnauehxXEvt6tVDD7nC7eYqLzKuzL4
         d5jEFaHaTV6fS0lm5K9xtD6N7fqCtrxym4tsMpM6SX4ByNi9zuFd4RLmDcqxPPvh8Gjv
         fCoMJFUd0xOMf3NvwDPDdck94ATyKOTMAtq196oiKoowulaa0ANihfEiAnmmnISRB36e
         jZbi3ZPXw4WEalYfSmAooCJhFyWGNsUAv9gEzS3GRDzoLjOPOrpeaSdGUNdbFJKZLpfD
         j3vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=CE7kllOHWtNuOUYiESSrKUD7W//QsI54X1Pe+BaM2Js=;
        b=lZtX5NXm0awa8T3nl/8OWE/fMq1owUp2xeeTyvyyvs83bHHc44vzdobvhcbOr6ryOD
         ehgT7Rbh0LCmyphoMNhG21U0rwzTbUYlgzuwfkv+BiXMcPVH7RH3+Z3CbVNz7j7HlXDg
         ekFBQsgKRJTXklRqspoVBNg19lGt6b+tkTowBYynfoj7o7CjS40Md1aDEh47XHynu2Ng
         BrWWkpRfvCKD5e38DJAk9+Hb/kqJbSLOxWr07m2KU6KNjRcLMhyIqH48yooneAcEcVuZ
         w1hB+/JjFIggEY7WUcE1OHEWs0UZcXip0Wq8doi613DI5m2az4WkltSu4Lj0MkNgbkHs
         ewSw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g55si81211qtb.278.2020.02.26.09.53.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 09:53:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:47992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j70s4-000331-Dp
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 12:53:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59879)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanb@linux.ibm.com>) id 1j70rr-0002x5-Jq
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 12:53:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanb@linux.ibm.com>) id 1j70rq-0003Ay-IU
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 12:53:07 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:4104
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanb@linux.ibm.com>)
 id 1j70rq-0003A7-DK; Wed, 26 Feb 2020 12:53:06 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01QHqa0u099038; Wed, 26 Feb 2020 12:53:03 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ydcngq9ns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2020 12:53:03 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01QHr2oq101490;
 Wed, 26 Feb 2020 12:53:03 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ydcngq9nj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2020 12:53:02 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01QHoqt0012418;
 Wed, 26 Feb 2020 17:53:02 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03wdc.us.ibm.com with ESMTP id 2ydcmkq1n0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2020 17:53:02 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01QHr1LY37224934
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Feb 2020 17:53:01 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDA15AC05B;
 Wed, 26 Feb 2020 17:53:01 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1295DAC05E;
 Wed, 26 Feb 2020 17:53:00 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 26 Feb 2020 17:53:00 +0000 (GMT)
Subject: Re: [PATCH v3 00/10] vTPM for aarch64
To: Auger Eric <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20200226102549.12158-1-eric.auger@redhat.com>
 <31e81f4b-ef00-692e-540f-ef3d9be5bb9a@linux.ibm.com>
 <22380cd3-b13e-aede-a7f5-158d86ca6136@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <a8913524-4de3-dc0a-0b2c-2deb88c33859@linux.ibm.com>
Date: Wed, 26 Feb 2020 12:53:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <22380cd3-b13e-aede-a7f5-158d86ca6136@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-26_06:2020-02-26,
 2020-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002260115
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0b-001b2d01.pphosted.com id 01QHqa0u099038
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
X-TUID: Yx1A+NsrBNdx

On 2/26/20 12:47 PM, Auger Eric wrote:
> Hi Stefan,
>
> On 2/26/20 2:32 PM, Stefan Berger wrote:
>> On 2/26/20 5:25 AM, Eric Auger wrote:
>>> This series adds the capability to instantiate an MMIO TPM TIS
>>> in ARM virt. It is candidate to qemu 5.0.
>> Looks good. Can you run the checkpatch script over the patches and
>> address the warnings?
>>
>>
> Thank you for you review!
>
> About warnings
>
> - There are warnings due to new files added but I think they all have a=
n
> entry in MAINTAINERS as wildcards are used.
>
> - In tpm: Add the SysBus TPM TIS device.
>    There is line over 80 chars but I think it is fine
>
> #define TPM_TIS_SYSBUS(obj) OBJECT_CHECK(TPMStateSysBus, (obj),
> TYPE_TPM_TIS_SYSBUS)


Ok, leave it as it is.


 =C2=A0=C2=A0 Stefan


