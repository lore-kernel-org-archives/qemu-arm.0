Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp2047600ejb;
        Mon, 9 Oct 2023 08:31:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnZPY1ndBFsMNyaJk2kO9oYOwWvmf2DKErhBoHmI4ioIm+lnDsUOhRRBUJYhS6c+2FSciD
X-Received: by 2002:a05:620a:2add:b0:775:c0e4:aea4 with SMTP id bn29-20020a05620a2add00b00775c0e4aea4mr16008040qkb.66.1696865474675;
        Mon, 09 Oct 2023 08:31:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696865474; cv=none;
        d=google.com; s=arc-20160816;
        b=FUuOBe7FXYpsJ0rs1ABmGa1+ltgisK1eKNM+589NYepzsCfvANxqXMbi2WzTuQR2B3
         QoVngb2DrvF4wfJuadft4PuXfQc7rvkXcq3/cmZOHMqOxRpRtgZEMLQ+KYESAEVY7SVJ
         BFwXxo5xlyLIB+NOgOQQb8RMT90cSdemZk1ZTtZ6Of6Zy4/P+xelqCypBsXrwNLLZH5B
         6bdoBIHDDRT1pSxDQVZqx0FHrue8TukJc+5ZRCa1e1/Y8iYONAUGrPxG8yeDDrUSLLFP
         ZM7qOPD1hVrNBCImW7sqzo23s+9sc8Ogxqx0Iviqi0mRo/OOMwfWPUU4uOVe06xeKaG0
         /DBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QfDOV5f2KMT9v/+XQtuxJQ3jk6F0qhOPBVJXc0FXSDw=;
        fh=qShmx9hl1ph34ulEBOCe1Wl+bd1jf8hIEJWbXZnp4xc=;
        b=VF3PdZNVw5MTsaLKpMrhxQ5QseApT998zHJP7OUn9O1LOXuhIVT34rIuekRVy6HHvF
         nf12OQotOtcPirAQv0o+X37RA7jQPSzJUVnQ41J0uIKg+isS1M4twoqIZg5PZv0tTiBg
         ueyTcAaXX8OJEw6057qYu5o/v9DJPf5EaARDOmQ8eMH833gXYj1mAwnccihx9uCUrVgA
         k5AB1DdVmoJAQi+2ra8OytDWidcOZ92x8YZf3Tzr71XQ9mbYYsStp9KmXKoJlp4tiLzg
         j0catMyE60p/Q5imfs9HPB+4XWGb66rTAQtKCr9Exg11oS3wkzvnkAUB1dhffrxLzDCq
         hF+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=dcMXOeWM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g22-20020a05620a279600b007740be11648si6333916qkp.38.2023.10.09.08.31.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Oct 2023 08:31:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=dcMXOeWM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qpsDd-0007IB-H4; Mon, 09 Oct 2023 11:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qpsDD-0007F9-1k; Mon, 09 Oct 2023 11:30:28 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1qpsD9-0003xN-LN; Mon, 09 Oct 2023 11:30:26 -0400
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 399FRptV028067; Mon, 9 Oct 2023 15:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=QfDOV5f2KMT9v/+XQtuxJQ3jk6F0qhOPBVJXc0FXSDw=;
 b=dcMXOeWMSznd/SgM1BuZvp1aY+W0C/sUswtW4Br1FbSMY/feGr7ThwtfNRxuyvCKjlwm
 6peBbDcNlbPd++8F/qIIbFs3mD4Sk/eyhV1oPfMwGQv20lZLkqdFhUDWNQBK9QF3xeml
 q4n/irppHCD/KNDUf7tMrDFEGzzy/gay3wEa0Kr5XnHJarKt4lcYLThDD6S1MshO04MQ
 8MYkXE58iT4SwG5Npbqdn0lTIc4915XNEzZ7kfEYeZJRrJe1wRQxeGy+v8xZoSx46khX
 wpOgMKaHikwWT46C8Dxo8DHhUMRT0eSFWyckqlG+csQC3Vp10edIn4GTwUkKQozKPeJj vA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmm66r3jn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 15:30:09 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 399FSAum029939;
 Mon, 9 Oct 2023 15:30:09 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmm66r3hh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 15:30:09 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 399DnhcA024487; Mon, 9 Oct 2023 15:30:08 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkhnsa7ce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 15:30:08 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com
 [10.241.53.101])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 399FU7qw58524132
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Oct 2023 15:30:07 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F0C258062;
 Mon,  9 Oct 2023 15:30:07 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9153E58068;
 Mon,  9 Oct 2023 15:30:06 +0000 (GMT)
Received: from [9.61.164.107] (unknown [9.61.164.107])
 by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  9 Oct 2023 15:30:06 +0000 (GMT)
Message-ID: <d6b88c83-18a1-43eb-9561-d61826488004@linux.ibm.com>
Date: Mon, 9 Oct 2023 10:30:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/10] hw/fsi: Update MAINTAINER list
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org
References: <20230908222859.3381003-1-ninad@linux.ibm.com>
 <20230908222859.3381003-11-ninad@linux.ibm.com>
 <cd44fbf6-135b-3ffb-0af4-d38381ce79cc@kaod.org>
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <cd44fbf6-135b-3ffb-0af4-d38381ce79cc@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: T0GMAO6u3-n17WyPqRjLdVEn5CMjjFt4
X-Proofpoint-ORIG-GUID: R8uttdY8ODFTf1BdQWEUeb0ipR7R6054
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_13,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0 mlxscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310090128
Received-SPF: pass client-ip=148.163.156.1; envelope-from=ninad@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7fYC5oTyp2l8

Hello Cedric,

On 9/11/23 07:33, Cédric Le Goater wrote:
> On 9/9/23 00:28, Ninad Palsule wrote:
>> Added maintainer for IBM FSI model
>>
>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>> ---
>> V4:
>>    - Added separate commit for MAINTAINER change.
>> ---
>>   MAINTAINERS | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 6111b6b4d9..285f3a3bc9 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3395,6 +3395,28 @@ F: tests/qtest/adm1272-test.c
>>   F: tests/qtest/max34451-test.c
>>   F: tests/qtest/isl_pmbus_vr-test.c
>>   +FSI
>> +M: Ninad Palsule <ninad@linux.ibm.com>
>> +S: Maintained
>
> Excellent !
Thanks!
>
>> +F: hw/fsi/aspeed-apb2opb.c
>> +F: hw/fsi/cfam.c
>> +F: hw/fsi/fsi.c
>> +F: hw/fsi/fsi-slave.c
>> +F: hw/fsi/opb.c
>> +F: hw/fsi/engine-scratchpad.c
>> +F: hw/fsi/fsi-master.c
>> +F: hw/fsi/lbus.c
>
> This would work the same :
>
> hw/fsi/*
> include/hw/fsi/*

Fixed.

Thanks for the review.

~ Ninad

>
>> +F: include/hw/fsi/aspeed-apb2opb.h
>> +F: include/hw/fsi/cfam.h
>> +F: include/hw/fsi/fsi.h
>> +F: include/hw/fsi/fsi-slave.h
>> +F: include/hw/fsi/opb.h
>> +F: include/hw/fsi/engine-scratchpad.h
>> +F: include/hw/fsi/fsi-master.h
>> +F: include/hw/fsi/lbus.h
>> +F: docs/specs/fsi.rst
>> +F: tests/qtest/fsi-test.c
>> +
>>   Firmware schema specifications
>>   M: Philippe Mathieu-Daudé <philmd@linaro.org>
>>   R: Daniel P. Berrange <berrange@redhat.com>
>
