Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp2237925ejt;
        Tue, 28 Nov 2023 14:50:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFD4u9MdYccC6BrWkjHwkLUxIHIuJCh6hRxv1936Fx7/x+9AgNeFnymdeCD0L2aI+R641Q3
X-Received: by 2002:ac8:4e4c:0:b0:417:b026:794a with SMTP id e12-20020ac84e4c000000b00417b026794amr20624129qtw.34.1701211803957;
        Tue, 28 Nov 2023 14:50:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701211803; cv=none;
        d=google.com; s=arc-20160816;
        b=fJfVG3BbpK7vhSREXy8+cw5d4jxV+a7jIRAyaNN/qpdUlJo9GHP8pBOikSlcH/zKgR
         DtkVigQ8+KRAr6xDCX7GI2S2v6J1tsJba+cBwjx1/iOvUz50fmemvJAb0M6Pe7mwavu5
         lVe4ySa6mtjsBc4cudSPsRBNJLtxkwms5jsaUPd1RW9u6dhZ4e0e8bcd40xjaEYLzNRz
         r5yK/dbVxPG58RblbxoY7T7HvovXSoTuLRfzfjTEXmqoRosR3FDbOOwc5OwHuIiJWtgC
         8lZcfLTBzderWTLSibJtYRmTLw8zw5dCm2KZN7ti57QxwAL7Uj1DtbSs6zh8bm7cPKss
         Ebmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:date:message-id:dkim-signature;
        bh=mpu4mcuAAZQO4bqk1WaxOES2tNaMXqyi6H3YLC0/LRY=;
        fh=cgAQA+XUIsr4IqXjvxsNSbu6yUfPNOKZue5KQ1lizTE=;
        b=lumUxU58BpNWTv7ApmfBRPpKef+LpO3ZUzJZFdQ2ExZKWevp4TVPylIm3cks0fhxlA
         HMX//e1wporH//1IaeDn5+jeIPiD0FiKHbsEbHB3jOqaNQWFUPgv94tp/LLrISmwHT5L
         3+wRX7GjMMiodliW5oegn7iMx2m0xlrUwTHcS6YJxIN+MuG7xKH6rBcQAz6pGjEGKrB6
         pyZgk48JGGgBjUFYeIjiW3Fg5eC/Qc/9JbHWAcY3IxQRtF8BicwrfkwVXSl+tPJAkYhF
         U5gMYluizTCCyXXgY82InmEA7c3u4brK+Ol9y9Yy5Ztaxboq/nRNfrCCUkCJGVcGvvQY
         W7IA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=TJiMX7ws;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cb17-20020a05622a1f9100b00423d3459f72si3144818qtb.808.2023.11.28.14.50.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Nov 2023 14:50:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=TJiMX7ws;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r86tk-0004oP-Pd; Tue, 28 Nov 2023 17:49:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1r86ti-0004nh-Gz; Tue, 28 Nov 2023 17:49:42 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1r86tg-00009h-JT; Tue, 28 Nov 2023 17:49:42 -0500
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ASMRkoT020831; Tue, 28 Nov 2023 22:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=mpu4mcuAAZQO4bqk1WaxOES2tNaMXqyi6H3YLC0/LRY=;
 b=TJiMX7wsbDHjiCtzo/pGgWJWT4bj0OI4F3RVOESpDw0pKGWvJALIljEAWLOY4iq1oaqB
 jO7WdgKrWs4goXcpB2sHYvF0f7hKBMku5LwssDXpx61wDbSeks7LxBMyD8Ywt+IKirSo
 LhwhaNTtTDy5DfKhmfK7LVjLbufy42OsQS3cI/AhmysBfI294LVunQbLHUcQbVLYkcXC
 fAa5QpE2go0u7h5w6m6Z1d7ouTN1+c6sfxpRUyzXzOTrUUEq4KgwcJ2rPqSFFnWdFt9B
 JsH3t8VydwBSHdyPUh4CRfMZ6mt9h06R/n76u5gev9/p8l8bCS0JgtNusI9egmVDFkCE Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3unr4ysudm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Nov 2023 22:49:24 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3ASMk813008931;
 Tue, 28 Nov 2023 22:49:24 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3unr4ysudb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Nov 2023 22:49:24 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ASK05gb004998; Tue, 28 Nov 2023 22:49:23 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ukwfk30uu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Nov 2023 22:49:23 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3ASMnMlR21299798
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Nov 2023 22:49:22 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 694E35804B;
 Tue, 28 Nov 2023 22:49:22 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBA095805B;
 Tue, 28 Nov 2023 22:49:19 +0000 (GMT)
Received: from [9.67.87.213] (unknown [9.67.87.213])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 28 Nov 2023 22:49:19 +0000 (GMT)
Message-ID: <2339b059-4297-450e-9616-6e6bc9c4926c@linux.ibm.com>
Date: Tue, 28 Nov 2023 16:49:19 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/10] Introduce model for IBM's FSI
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@codeconstruct.com.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org
References: <20231026164741.1184058-1-ninad@linux.ibm.com>
 <417e8a68-2f35-4315-b694-892f78c811b6@kaod.org>
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <417e8a68-2f35-4315-b694-892f78c811b6@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5TWZ2DfgaoJxORDXztWtvJSWHwDShib-
X-Proofpoint-GUID: mqXXEPAX_XuiX5Kt7tCYE9AL6aDbTnwJ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_24,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 mlxscore=0
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 mlxlogscore=659 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311280179
Received-SPF: pass client-ip=148.163.158.5; envelope-from=ninad@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: dD1e3nKJxRr2

Hello Cedric,

On 11/27/23 10:31, Cédric Le Goater wrote:
> Hello Ninad,
>
> On 10/26/23 18:47, Ninad Palsule wrote:
>> Hello,
>>
>> Please review the patch-set version 7.
>> I have incorporated review comments from Cedric, Philippe and Thomas.
>
>
> I reworked v7 with the suggestions I made in patches 1-6. Please check :
>
>   https://github.com/legoater/qemu/commits/aspeed-8.2
>
> I will have more questions on the mappings because some parts are really
> unclear.
>
Thanks for the changes. I have 2 changes. I will send it as v8.

Regards,

Ninad

>
> Thanks,
>
> C.
>
>
>>
>> Ninad Palsule (10):
>>    hw/fsi: Introduce IBM's Local bus
>>    hw/fsi: Introduce IBM's scratchpad
>>    hw/fsi: Introduce IBM's cfam,fsi-slave
>>    hw/fsi: Introduce IBM's FSI
>>    hw/fsi: IBM's On-chip Peripheral Bus
>>    hw/fsi: Aspeed APB2OPB interface
>>    hw/arm: Hook up FSI module in AST2600
>>    hw/fsi: Added qtest
>>    hw/fsi: Added FSI documentation
>>    hw/fsi: Update MAINTAINER list
>>
>>   MAINTAINERS                        |   8 +
>>   docs/specs/fsi.rst                 | 138 +++++++++++++++
>>   docs/specs/index.rst               |   1 +
>>   meson.build                        |   1 +
>>   hw/fsi/trace.h                     |   1 +
>>   include/hw/arm/aspeed_soc.h        |   4 +
>>   include/hw/fsi/aspeed-apb2opb.h    |  33 ++++
>>   include/hw/fsi/cfam.h              |  34 ++++
>>   include/hw/fsi/engine-scratchpad.h |  27 +++
>>   include/hw/fsi/fsi-master.h        |  30 ++++
>>   include/hw/fsi/fsi-slave.h         |  29 +++
>>   include/hw/fsi/fsi.h               |  36 ++++
>>   include/hw/fsi/lbus.h              |  43 +++++
>>   include/hw/fsi/opb.h               |  33 ++++
>>   hw/arm/aspeed_ast2600.c            |  19 ++
>>   hw/fsi/aspeed-apb2opb.c            | 272 +++++++++++++++++++++++++++++
>>   hw/fsi/cfam.c                      | 173 ++++++++++++++++++
>>   hw/fsi/engine-scratchpad.c         |  93 ++++++++++
>>   hw/fsi/fsi-master.c                | 161 +++++++++++++++++
>>   hw/fsi/fsi-slave.c                 |  78 +++++++++
>>   hw/fsi/fsi.c                       |  25 +++
>>   hw/fsi/lbus.c                      |  74 ++++++++
>>   hw/fsi/opb.c                       |  74 ++++++++
>>   tests/qtest/aspeed-fsi-test.c      | 205 ++++++++++++++++++++++
>>   hw/Kconfig                         |   1 +
>>   hw/arm/Kconfig                     |   1 +
>>   hw/fsi/Kconfig                     |  23 +++
>>   hw/fsi/meson.build                 |   6 +
>>   hw/fsi/trace-events                |  13 ++
>>   hw/meson.build                     |   1 +
>>   tests/qtest/meson.build            |   1 +
>>   31 files changed, 1638 insertions(+)
>>   create mode 100644 docs/specs/fsi.rst
>>   create mode 100644 hw/fsi/trace.h
>>   create mode 100644 include/hw/fsi/aspeed-apb2opb.h
>>   create mode 100644 include/hw/fsi/cfam.h
>>   create mode 100644 include/hw/fsi/engine-scratchpad.h
>>   create mode 100644 include/hw/fsi/fsi-master.h
>>   create mode 100644 include/hw/fsi/fsi-slave.h
>>   create mode 100644 include/hw/fsi/fsi.h
>>   create mode 100644 include/hw/fsi/lbus.h
>>   create mode 100644 include/hw/fsi/opb.h
>>   create mode 100644 hw/fsi/aspeed-apb2opb.c
>>   create mode 100644 hw/fsi/cfam.c
>>   create mode 100644 hw/fsi/engine-scratchpad.c
>>   create mode 100644 hw/fsi/fsi-master.c
>>   create mode 100644 hw/fsi/fsi-slave.c
>>   create mode 100644 hw/fsi/fsi.c
>>   create mode 100644 hw/fsi/lbus.c
>>   create mode 100644 hw/fsi/opb.c
>>   create mode 100644 tests/qtest/aspeed-fsi-test.c
>>   create mode 100644 hw/fsi/Kconfig
>>   create mode 100644 hw/fsi/meson.build
>>   create mode 100644 hw/fsi/trace-events
>>
>
