Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp563369ejc;
        Thu, 25 Jan 2024 16:00:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhRiUE5B+YfK+RuMXh87wKYP1NBQXaRzMKL9oLymbX7vvdGZnoqcPgniCVepghxuHH9Y8l
X-Received: by 2002:a05:6102:38d0:b0:46a:f502:95d9 with SMTP id k16-20020a05610238d000b0046af50295d9mr719091vst.0.1706227224297;
        Thu, 25 Jan 2024 16:00:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706227224; cv=none;
        d=google.com; s=arc-20160816;
        b=mQ6421xmlrgwxd3O5tI7s6l1keGpMzxnwyZe/WU5Ujz67i5an3KabY2DaQhCqsT6+A
         t71c+JrAg/Wa8MHalP3gm0f0vMvLCm5JjWJAbAzPAgemR1XjjTw1ax+UusLwFgVkGZpy
         k9P2tkDvgXugcpLrHtsbJWlyYBUfB5CvHVbo3F0n71A2MdU10sWX5j9D3Ih6zwNxwcyE
         Apm3XsX7Yb+0epne7y+4uzWpcW4gW7XZRbWVcXwXA4CQThG4LkiR7Ob2ydlm8qDe8oT+
         Tk6CJGW4AVCt2+uaEV7XEyo8RncTqE1yJ+gnSTMsFrbmbKkF1LUy9TSzp8ZIHROymN8M
         NwuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=dX19Am+HvclHJQ3uJ9tcZ8MYKhJH3pZmY/+Avj5rbk4=;
        fh=HTHR+Q2d6bLhEl37Oh4T8uXQP5/6sUv4T2u8Op+j0Ns=;
        b=hmm7QgcxWEi2Ys0xWv8GYKnoAz836uEOIfQo4ab2P8Xt39UWor/1hkkyKV0IHEcpHA
         7GIyc5TtAcSugBHE6SuyUUau4Ld0f95M4oQtOgX2IxaL1wiM0wMwrw7zxF6aZBVzULSq
         ggVFHvKa98fhAeRJ+R05z5TSChXL+KpZPHVdMenYac1fCMpAISkvHAZ8wpHyT0J4PXFv
         4tl1LRcbeD1iO5ZLyE5DKffc4tE9qDu6e8ARXnLCWm9Cl0IpBu8KSsn8gZfZ1RDxGcLU
         RT51cTw8H4YInY17q4iOPYAgvjumBT3TBqF1WyfRqrMODJimVUYBgb/P1gMi9ygnqQ/3
         DUIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=TnGPa2Bv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5-20020a67fd45000000b0046b1d95b90dsi9653vsr.384.2024.01.25.16.00.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jan 2024 16:00:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=TnGPa2Bv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rT9dl-0006wC-Ad; Thu, 25 Jan 2024 19:00:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rT9dj-0006vn-UT; Thu, 25 Jan 2024 19:00:11 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rT9df-0003Me-Le; Thu, 25 Jan 2024 19:00:10 -0500
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 40PNvXoU013256; Thu, 25 Jan 2024 23:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=dX19Am+HvclHJQ3uJ9tcZ8MYKhJH3pZmY/+Avj5rbk4=;
 b=TnGPa2Bv7WokRkMyt7Ehxe0XzedsWE01XVuplgR5zoidGiXvljfHq+RmjDCD09kp/iZt
 c+qRFu/MCYTwqswzPo/T+Lh0ubBfe4gNg+pZ17QC9Y9JNibIsQvUXJWZ9lPa7JPcGJK6
 v1wJARhdsSTsKPTblF03lHXbfbusWLlIDh/2o27b80zwtt41gesqD00DofxiQSE53Vv3
 qQLeAcXvW4nG2pkUnK0/CUM4Ml80/M6MK69unFcrJ/QKAySzWc1oEpzq11TDac6nuQcX
 G+S9nmuM0ILWo/eeWismXPH9ufBHgiBUjbzOFhTnIWaG6GD+uc4Pg6u+NXR88iycxQe3 Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vv1s5r26h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jan 2024 23:59:49 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40PNwRMm016115;
 Thu, 25 Jan 2024 23:59:48 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vv1s5r266-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jan 2024 23:59:48 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 40PKe1jA026876; Thu, 25 Jan 2024 23:59:47 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vrrgtqqwg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jan 2024 23:59:47 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com
 [10.39.53.231])
 by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 40PNxlfC22282762
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Jan 2024 23:59:47 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0BCE058050;
 Thu, 25 Jan 2024 23:59:47 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A82958045;
 Thu, 25 Jan 2024 23:59:46 +0000 (GMT)
Received: from [9.61.160.70] (unknown [9.61.160.70])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 25 Jan 2024 23:59:46 +0000 (GMT)
Message-ID: <efe97ee9-c773-4779-90e0-b7eef7a4e68c@linux.ibm.com>
Date: Thu, 25 Jan 2024 17:59:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/9] hw/fsi: Introduce IBM's FSI Bus and FSI slave
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@codeconstruct.com.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org, Andrew Jeffery <andrew@aj.id.au>
References: <20240110231537.1654478-1-ninad@linux.ibm.com>
 <20240110231537.1654478-3-ninad@linux.ibm.com>
 <aded5ed9-bdf5-4ee0-a213-aba7c1dcd74c@kaod.org>
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <aded5ed9-bdf5-4ee0-a213-aba7c1dcd74c@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Vhf-xxYR6uz-_GqfisbiR_6EetRP20cf
X-Proofpoint-ORIG-GUID: faqw5b6OCuct6uqpXTRTmVV6SJCf-EgZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=609 phishscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2401250173
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
X-TUID: BQfbOQdkLq7Y

Hello Cedric,

>>
>> The FSI slave: The slave is the terminal point of the FSI bus for
>> FSI symbols addressed to it. Slaves can be cascaded off of one
>> another. The slave's configuration registers appear in address space
>> of the CFAM to which it is attached.
>
> Please add another patch.
Added new patch for FSI-slave.
>
>> [ clg: - removed include/hw/fsi/engine-scratchpad.h and
>>              hw/fsi/engine-scratchpad.c
>>         - dropped FSI_SCRATCHPAD
>>         - included FSIBus definition
>>         - dropped hw/fsi/trace-events changes ]
>
> Move the list down before my S-o-b.
Moved the list.

Thanks for the review.

Regards,

Ninad


