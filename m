Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp1090189ejf;
        Tue, 16 Jan 2024 11:32:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECu75aFo6l+rnLFRdtn7/aMULzLTJAm9GIH5YlLSSzdP4hCuLAPHbmJRYbvuIsH2MHFfoo
X-Received: by 2002:a05:6214:31a1:b0:681:5629:c2c8 with SMTP id lb33-20020a05621431a100b006815629c2c8mr6417626qvb.117.1705433556520;
        Tue, 16 Jan 2024 11:32:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705433556; cv=none;
        d=google.com; s=arc-20160816;
        b=iwi7Lj714+hJqXbxbQEuhrShjNijNLeFJQyNEgrmS1Iw+YpjMCZABJX2FDw+ocwjw5
         bum3GqT+l949GpWWr5/I/bDG6w60yyYRPr7S9fLpih7CPtmxzZMaoMdf5BT0ylDUzxhc
         6/GdrayhYR8/lu6Kn3fc951t8kbJHHaB2xynlFCQnMxZGhXkmmBryA/N+s4J4yjH7I3b
         gnNVcEukzQh056xIjDBaWNQweG8xzvP94Vsadp7NbwkJ34PqpejPRd62MXTBFLhdWy/G
         hY5WFfjq/xfZc+iHTDoi0UnqSPunP369Nm+WgP9NyJ7rWhNO/ksuvXf+b0JcL44z6fKv
         XHDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=4tg8BpELTxKwl3eiGvl6SWp/fnCMecN81ckgX8wF+io=;
        fh=cgAQA+XUIsr4IqXjvxsNSbu6yUfPNOKZue5KQ1lizTE=;
        b=q/MDs9KSS33RWMKO0pDpuCb0SEBMw5yKla0JdABMsXD3vcazf9kxvbf9szN9vcy60o
         zYqidH5qwqGxolk9bzoUx+sQtmzf5MJ3xnEKcZC3+VwoX8hBQt+SfkTydrAqwQfOZ73B
         Vmu7hvSwnCVkPlVX4yhF9PPInS9uipsErLwnIeusoM45wr2SgYmMQYGMa7o0J7JJtTXf
         oJvNVwP9JLNWSCdZSjHP++ts6OE16nA9DVRrsYP+9tteCRlNXPn6odXHz5u7Z4SWAv3G
         1crCc7HtK5c7j7IjNIGsb8gQD9Pg08f9suaizeX7wSe6QO+24rnWUVbDwUsS5S9u6BEI
         FICA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=IonM8E1L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7-20020a0cf387000000b006817002c68esi1519102qvk.574.2024.01.16.11.32.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jan 2024 11:32:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=IonM8E1L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPpAK-0003fK-5G; Tue, 16 Jan 2024 14:32:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rPpAI-0003eq-Ga; Tue, 16 Jan 2024 14:32:02 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rPpAG-0000bf-Ev; Tue, 16 Jan 2024 14:32:02 -0500
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 40GJK1Gt001573; Tue, 16 Jan 2024 19:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=4tg8BpELTxKwl3eiGvl6SWp/fnCMecN81ckgX8wF+io=;
 b=IonM8E1LgH0UMwLjlvzdqqua3c0vTi3dUc+TX9d4T8NNy75E2C28dlbFlMlDFBc9jkBJ
 O2LYjboTsVJldY9SnvkkaU5KdwIiOPwpErj9p9gFHnXsDyMggiKfk6cOjfUHXjXzFrm0
 rUM0kZexYNzqP7ms2qnlarUTMBzDDr/inraoXaxtDMeTCpCrWYECmERTJgeL7TDF3kLj
 gArWoze/spa6NkFOQ2kf7Sk/m1j8NL4BdPNjZuYaXov9AVLu/64VOOe/2UQjO83ZqpmF
 mQm3YnnT0hQjkBctwL4D2mkfWV68bm1mDf5wOtte4lumb3Djs1SzssgKmvV5il3ZN016 fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vnyrsggmt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jan 2024 19:30:47 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40GJF7P7012003;
 Tue, 16 Jan 2024 19:30:46 GMT
Received: from ppma22.wdc07v.mail.ibm.com
 (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vnyrsggme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jan 2024 19:30:46 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 40GJCrDW010973; Tue, 16 Jan 2024 19:30:45 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
 by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vm57ygtva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jan 2024 19:30:45 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com
 [10.241.53.101])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 40GJUiOo12190346
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jan 2024 19:30:44 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D21085805E;
 Tue, 16 Jan 2024 19:30:44 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74C2B5805A;
 Tue, 16 Jan 2024 19:30:44 +0000 (GMT)
Received: from [9.24.12.86] (unknown [9.24.12.86])
 by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jan 2024 19:30:44 +0000 (GMT)
Message-ID: <02b84057-b100-4708-8415-909ed26ac922@linux.ibm.com>
Date: Tue, 16 Jan 2024 13:30:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 9/9] hw/fsi: Update MAINTAINER list
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@codeconstruct.com.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org
References: <20240110231537.1654478-1-ninad@linux.ibm.com>
 <20240110231537.1654478-10-ninad@linux.ibm.com>
 <39f33cc8-7457-43a1-a5dd-d6afada07e10@kaod.org>
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <39f33cc8-7457-43a1-a5dd-d6afada07e10@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OAloF6jDiibeATJQ7ZY2ouEmkIA1Hmea
X-Proofpoint-ORIG-GUID: NaUQOg4e1V31PnqbYwgskEoGjyDhNrJf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-16_11,2024-01-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 mlxlogscore=682 phishscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401160152
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
X-TUID: M2LCMQ0PgQUh

Hello Cedric,

On 1/12/24 10:03, Cédric Le Goater wrote:
> On 1/11/24 00:15, Ninad Palsule wrote:
>> Added maintainer for IBM FSI model
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>
> Please remove my S-o-b.
Removed.
>
>>
>>   F: tests/qtest/isl_pmbus_vr-test.c
>>   +FSI
>> +M: Ninad Palsule <ninad@linux.ibm.com>
>
> and add me as Reviewer.

Added you as a reviewer.

Thanks for the review.

Regards,

Ninad

>
>
