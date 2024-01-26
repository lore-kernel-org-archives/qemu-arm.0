Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp568536ejc;
        Thu, 25 Jan 2024 16:10:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMLFkT3u7toUz4jDcck0LeEXHYPCbKSi5WzLrANWZkn1E2fucwOHz7EilYZvaziN76LvQJ
X-Received: by 2002:a05:622a:352:b0:42a:5150:3e46 with SMTP id r18-20020a05622a035200b0042a51503e46mr569261qtw.47.1706227810061;
        Thu, 25 Jan 2024 16:10:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706227810; cv=none;
        d=google.com; s=arc-20160816;
        b=aQqHHmlq3/0QYtpWbmH52ew+LMnsWuxd1PGJS3E+0lMDSdX4oD3E9X2o0hl51M4K3J
         53aivJjIfvwOAR4tSzc4Q8Mcw2UT54vOtjKRw8Xjj1ZyjkIRN+CI60eLowK4czzLw9xx
         H7+VUMA7Pgt5Z1P1vyGi0UY0zpIp3Cch6Es3J3EZWgIZKl9bIpIwKftVD0Gqi3fkOmLF
         DEVOuTmSyYgYLxBOhfmVZqrHYpVQZ+akX5PIWwzc+aF1IuBccAZwZ+G7jDzqYDEVQHCf
         NeSeK8/NC2EN+UuVPPsgIc/cldE8aUoEZVbeT602EQ3wIgk3dq+mApoYbSuvH4Rjr54S
         z+rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=lthent0jMfwPWB1p4SgTBWPZCcG/fXMVBuiZXdjd3Uk=;
        fh=HTHR+Q2d6bLhEl37Oh4T8uXQP5/6sUv4T2u8Op+j0Ns=;
        b=uxlJuxcUdF42Gh4jk3iKexMyIpqQAZ+jUTTABYaNjFMVe9OF0w1yI64A3aliNlTsnx
         PYKkXIbQha6SWTNzRZTNu9G6vpLPW2CRr3teFErWHLhfwaFg4vEvLO/CZkTScma/Vk9b
         Lgu4XAmBJJC7RWvZiuvluqh89UjXo2Ad58AKf1VGzoZhOulvDxC2WhKAfqk3eJJRZdUG
         dYMNZr1BVvwl53XXBdM7ayD+eItgLg4nscVOXccxEzFxoddmdQDYEzTEJ8xXqgnO7O2f
         nYzrnurkBh5GdNLV0lSu8hSWYJQfQR9MNAEV+qriT71Vuv/CyXdv9suuTO2nrFUwAszQ
         crWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="KbllQG/n";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8-20020ac85e08000000b00428204215cdsi13913823qtx.74.2024.01.25.16.10.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jan 2024 16:10:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b="KbllQG/n";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rT9n1-0001U6-VU; Thu, 25 Jan 2024 19:09:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rT9mv-0001Td-T1; Thu, 25 Jan 2024 19:09:41 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rT9mt-0000QX-VV; Thu, 25 Jan 2024 19:09:41 -0500
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 40PNvJla024142; Fri, 26 Jan 2024 00:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=lthent0jMfwPWB1p4SgTBWPZCcG/fXMVBuiZXdjd3Uk=;
 b=KbllQG/nIeTZa6o2ZgGoh1l0P86FNwbM5fmvOdWKndAFgA4c838luYTtoYC6cXThjOal
 6ejtHUijfdK7MrWvJcUZnS96YLeJG0fVcDfkTSfA2eCrlhXuMazJqqbVx+hVTp0lUcOz
 u/lxUXZ1NeVDXqpYZSnbRdfUuV20Of2yHYvZ/s987rGSyK4o4BrqcqcgTb2kLsBPFsCS
 YaZ5zdZQeex773llqxq1HKQIIKJ04iLRJblyz8eAyV0rbL6L30ty2/+rtn8ZNRqa3Ult
 LB2aq6nXGBPWVgwQb30SSKSwJgNDI+Udx6QWNpJKAnSmIPluLhEy2FxqPnap11YYa9Qd Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vv1s10aq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 00:09:21 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40PNxLWW030893;
 Fri, 26 Jan 2024 00:09:20 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vv1s10apr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 00:09:20 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 40PNL6AT025291; Fri, 26 Jan 2024 00:09:19 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vrtqkq5ne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 00:09:19 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com
 [10.39.53.231])
 by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 40Q09JMX27984328
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jan 2024 00:09:19 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA3DA58050;
 Fri, 26 Jan 2024 00:09:18 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 267515805E;
 Fri, 26 Jan 2024 00:09:18 +0000 (GMT)
Received: from [9.61.160.70] (unknown [9.61.160.70])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jan 2024 00:09:18 +0000 (GMT)
Message-ID: <9ab956ee-f753-4829-be2d-31f86b55db0d@linux.ibm.com>
Date: Thu, 25 Jan 2024 18:09:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/9] hw/fsi: Introduce IBM's cfam
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@codeconstruct.com.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org, Andrew Jeffery <andrew@aj.id.au>
References: <20240110231537.1654478-1-ninad@linux.ibm.com>
 <20240110231537.1654478-4-ninad@linux.ibm.com>
 <a7f8e651-025a-4252-931f-f05ad86e8c6e@kaod.org>
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <a7f8e651-025a-4252-931f-f05ad86e8c6e@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YviQhnMnh9Nwujn3q090ahJnGTq5u-g-
X-Proofpoint-ORIG-GUID: DHgwnyRGUrtZJNodR7T9ZF2mCMWmmF7m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 impostorscore=0 mlxlogscore=880 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401250174
Received-SPF: pass client-ip=148.163.156.1; envelope-from=ninad@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
X-TUID: qluXBPOkEZLZ

Hello Cedric,

>>
>> [ clg: - moved object FSIScratchPad under FSICFAMState
>>         - moved FSIScratchPad code under cfam.c
>>         - introduced fsi_cfam_instance_init()
>>         - reworked fsi_cfam_realize() ]
>
> Move the list down before my S-o-b.
Done.
>
>>
>> +
>> +/* Valid, slots, version, type, crc */
>> +#define CFAM_CONFIG_REG_FSI_SLAVE (ENGINE_CONFIG_NEXT       | \
>> + 0x00010000               | \
>> + 0x00005000               | \
>> + ENGINE_CONFIG_TYPE_FSI   | \
>> +                                            0x0000000a)
>> +
>> +/* Valid, slots, version, type, crc */
>> +#define CFAM_CONFIG_REG_SCRATCHPAD (ENGINE_CONFIG_NEXT       | \
>> + 0x00010000               | \
>> + 0x00001000               | \
>> + ENGINE_CONFIG_TYPE_SCRATCHPAD | \
>> +                                            0x00000007)
>
> I was expecting a macro taking argument to build the config reg value
> of each sub engine but that's fine also.

Added single macro.


>
>>
>> +
>> +    memory_region_add_subregion(&cfam->mr, 0, &cfam->config_iomem);
>> +    memory_region_add_subregion(&cfam->mr, 0x800, &slave->iomem);
>> +    memory_region_add_subregion(&cfam->mr, 0xc00, &cfam->lbus.mr);
>> +
>> +    /* Add scratchpad engine */
>> +    if (!qdev_realize(DEVICE(&cfam->scratchpad), BUS(&cfam->lbus),
>> +                                errp)) {
>
> could be a single line.

Yep, Made it a single line.

Thanks for the review.

Regards,

Ninad


