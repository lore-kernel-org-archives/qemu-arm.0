Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1291050ejb;
        Mon, 22 May 2023 08:39:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5prBLx1pMx3YoPfi/3ZwZCNfyv7N0cTNW9kIw24cjS/5BeMvGNIMPhvb5X2ewEUlDd80dX
X-Received: by 2002:a05:6214:d8d:b0:621:363c:ea93 with SMTP id e13-20020a0562140d8d00b00621363cea93mr15979009qve.15.1684769950567;
        Mon, 22 May 2023 08:39:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684769950; cv=none;
        d=google.com; s=arc-20160816;
        b=hMI4oRWw0kCgSH2O3NwM0iU3Zz/XoSURGHZB9VXS1rX1442MGsEllVViwy10B1pfOj
         6BitxqAsuGi4qlJc+lzHMbG3TJYj+0+4C9hHFkJKA7/Mt4EyqQtKeq0iZ/1QwWfmcxG0
         l54Hfu5PVqO1qqUb8+eERLXfVOgZTFp3V118mGNKlipazEonCc8GpD6PmejIyYeLBcnD
         ALW23z9WWCoxwBpssvyjsQ6MRUn+DPNoptqeZoER32XAMJDdh8FYpuXS62po5dX4I1+2
         31NAShRMJhqhGmlBwn1QBrmbkN3I/ILK4gYGAh1zPBRS0M5y8ASiYNu9S6hMI9t/Wf58
         B+Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=lDyoC2ebPV+I2g1hZF778ATMjV9hPVhWkJrPdzEW0sk=;
        b=KPyKsW0sBHindXIDnVbT+n6wjABbEecDsFr5cKXi8E2eATNUCBdXhn5ntFZtPehpgC
         BNSrLYRBCoT1C6T2XAtUCsgCezBAEQwWkrDLEB9VhXRG73N3Gis5veIRWPJ9zO8W5w1+
         XzBfbtVI2ZmGZ1tM5gUdij15XJZ40J/DJfKYAGLNhL4OhvSCCx/niwyPZpn+QoOWyqU8
         GtX89Af1rTAHCisj+1vm5lDLgCuuis7QrNDgk345EIRmB7TSllbwZC/xjPqtTPI3c1M+
         IE1gzhgUqY3Uf6c4uhvvcIlw002ycvyBJpIsg4/4PtfSffE0AQ+gDqLrT2tzYhrT4MBN
         +HQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=bvQf+eKd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m11-20020a05620a13ab00b0074fb2b87c68si3420227qki.693.2023.05.22.08.39.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 May 2023 08:39:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=bvQf+eKd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q17cq-0001n6-SE; Mon, 22 May 2023 11:39:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1q17cp-0001m0-JC
 for qemu-arm@nongnu.org; Mon, 22 May 2023 11:39:07 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1q17co-0002km-2h
 for qemu-arm@nongnu.org; Mon, 22 May 2023 11:39:07 -0400
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34MFQEmE019670; Mon, 22 May 2023 15:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=lDyoC2ebPV+I2g1hZF778ATMjV9hPVhWkJrPdzEW0sk=;
 b=bvQf+eKdzwmVOiusxIkCSPCESREIYBYEu3uieTgK0hId6/daU50bB/d/0eYDEN7dEbbd
 vsiqHwL87mVagou3hyRqQTO1oft8xHCNJqXUGFEFLjc3MfwNxIdZ4ORawmvhd6mxR3QY
 A29jF7NGuRZtS6kuhTRVcATRHFEaqgoRZUbvYCyJSnqxeFSoyioz/gBCNWiEQzILP0VU
 pLeHdp7phcY6hTAyLBjtMt2CIn75RAHSVF5NLn0jCHZrGwZJ0Dm/Cr5skXpBQOKgrOVc
 IQFCsgDy0URtBdIGd+WgWw6ajNY5lFsLEDRnMTSwIhFhCTtrpvUkYj7vq33DRYGQLm4b UA== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qrb1jgmcw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 15:38:38 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34ME1K4c018060;
 Mon, 22 May 2023 15:38:04 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
 by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3qppdqaxd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 15:38:03 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 34MFc26L36897458
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 May 2023 15:38:03 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91D9E5806A;
 Mon, 22 May 2023 15:38:02 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17A6258054;
 Mon, 22 May 2023 15:38:02 +0000 (GMT)
Received: from [9.163.56.240] (unknown [9.163.56.240])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 22 May 2023 15:38:01 +0000 (GMT)
Message-ID: <2ef92b6d-8a2b-1e7a-e73f-5f70e0b28e9b@linux.vnet.ibm.com>
Date: Mon, 22 May 2023 10:38:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v1 0/1] Add vpd data for Rainier machine
To: Peter Maydell <peter.maydell@linaro.org>,
 Ninad Palsule <ninad@linux.ibm.com>
Cc: clg@kaod.org, andrew@aj.id.au, qemu-arm@nongnu.org, joe@jms.id.au,
 Ninad Palsule <ninadpalsule@us.ibm.com>
References: <20230519212412.3362107-1-ninad@linux.ibm.com>
 <CAFEAcA87xyjb7r9vXDA-kF-FJEAR51-ZCc9=pLohDWPqkAMmYA@mail.gmail.com>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.vnet.ibm.com>
In-Reply-To: <CAFEAcA87xyjb7r9vXDA-kF-FJEAR51-ZCc9=pLohDWPqkAMmYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LIPKB-d6svxIi2NtPmgbkLe9Cr876PwX
X-Proofpoint-GUID: LIPKB-d6svxIi2NtPmgbkLe9Cr876PwX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_10,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 mlxlogscore=912 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305220130
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=ninad@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-TUID: 9fOqHyZ+GTHM

Hello Peter,

On 5/20/23 7:19 AM, Peter Maydell wrote:
> On Fri, 19 May 2023 at 22:24, Ninad Palsule <ninad@linux.ibm.com> wrote:
>> From: Ninad Palsule <ninadpalsule@us.ibm.com>
>>
>> Please review the change for vpd data for rainier.
>>
>> Ninad Palsule (1):
>>    Add vpd data for Rainier machine
> Please can you send all patchsets to qemu-devel (cc'ing
> qemu-arm) -- we have automated tooling which only looks
> on the main list for patches.
Sorry about that. I have sent the V2.
>
> thanks
> -- PMM
