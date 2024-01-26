Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp786242ejc;
        Fri, 26 Jan 2024 02:31:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8pjNCYNtaMy8BNukIWIK/LUNeUaNJjR+1itqj13IS6KFwEIxoxn3DjnU9OPcXRqP9mIQQ
X-Received: by 2002:a05:620a:385c:b0:783:c2cf:ade with SMTP id po28-20020a05620a385c00b00783c2cf0ademr1055317qkn.83.1706265070137;
        Fri, 26 Jan 2024 02:31:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706265070; cv=none;
        d=google.com; s=arc-20160816;
        b=mImy3oJQ8oAKdkMhuL6pHy0nfmO5txoz0/t1IcGl1jaF7IQdh2iUrblTNvvTbBQyJZ
         rxH+YXvZbRUJLZNRNoKzdnuz2831xNLbXc5McFRgrwRhJ6RGFKkBAlH1dquD1WxC0GMx
         zi2K1cfmsLeYKD7Ze8fGBvMdx12me7FmdSUSA+UnaS1eb9bYK87I/Det7r2h1E5PMBAt
         5duNlLBnUTk5/KRfnSqYsegN7V2Vb0PBUFwglRRNUWAv1c+mpLn9FPUXU7o3BYu576Qz
         UVtCi5rycsO2l6CbmHdsZxgJYB5x5BLE3L7X0QrGIs3zGZ0Kuydn/jxPqPGTeGEABbvZ
         Ah7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=eZlaQeUpgthLjvi6UkRtZUPHOu2HwFyGFVnW+Ln2xmY=;
        fh=cgAQA+XUIsr4IqXjvxsNSbu6yUfPNOKZue5KQ1lizTE=;
        b=ciQbZVH5UBwPyBAB+kX2IKByRURg+uJW1BNVfo9fPf3l06ZTJN2PKInCUtJNxHaviZ
         lrKVlBMjPYc52JIaYXJcDLovgBoPsQ/gmhHiNoJiynurXoQcKVxMNykY4luSe+6Tgbdr
         FWQZYZu4sYuPRiY/XkjgIdMuVIhV031FSrnpk6PeBZG1BmNh8PFZMYEiX5FDRO69wWOn
         pVSmfjAsRdSECmwrR1i6EgIx8DDlHOZIhlPGWEITqpKyqj5E2zD4a2blzJucTDM+0dSf
         5bIIQ7nzVOyfVgmX75HYqwwt4XDQQiF7bOAR5dQeO+sQMChC3+rR/Gzt+EFpkayFaICu
         HCrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=IcYQrzOR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp43-20020a05620a45ab00b007839d816e60si1117437qkb.425.2024.01.26.02.31.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 02:31:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=IcYQrzOR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTJU5-00038A-UP; Fri, 26 Jan 2024 05:30:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rTJTt-00030y-A6; Fri, 26 Jan 2024 05:30:51 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rTJTj-0003qs-T1; Fri, 26 Jan 2024 05:30:39 -0500
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 40Q85rJA006784; Fri, 26 Jan 2024 10:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=eZlaQeUpgthLjvi6UkRtZUPHOu2HwFyGFVnW+Ln2xmY=;
 b=IcYQrzOR9ApCX/maikweBPv/vxP/FLJ6CGZUd5iJQ0JBm/k387yTpX+jQQq6vPytbzHi
 GVVqeBQvGPoEbXTqSACmbbVOjREIqibPBMQDj3eNJfUpDP+aX2f73k4z/trd9WUmcRI7
 GZUvgOiJz8C6B+6kJJqLn88U64PopbXn5/RjPKgNg0P2BLakBPGvCHLzMmUBtODDv3ka
 CGa+BXWSGmJ9eetPHZNbpBLpNjR1KAN3w8yG26OtDTsnzQPcFvJkSXS9ckiCFBZPEGYu
 wC74XoR3lroXS8DKWeuTCkmNgoDgurSFC1UJr/4wfI7Fr0AinShY4I30s3ve4REPhxg5 cA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vv89sv307-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 10:30:14 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40QAKoCV030001;
 Fri, 26 Jan 2024 10:30:14 GMT
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vv89sv2ys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 10:30:14 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 40Q8xTiC022438; Fri, 26 Jan 2024 10:30:13 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vrt0mj0nu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 10:30:13 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 40QAUCfF20382374
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jan 2024 10:30:12 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8F335805C;
 Fri, 26 Jan 2024 10:30:12 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 827EC5805D;
 Fri, 26 Jan 2024 10:30:11 +0000 (GMT)
Received: from [9.61.160.70] (unknown [9.61.160.70])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jan 2024 10:30:11 +0000 (GMT)
Message-ID: <4ed4ce4e-6e8b-4790-808d-1d296cd1c0e3@linux.ibm.com>
Date: Fri, 26 Jan 2024 04:30:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 11/11] hw/fsi: Update MAINTAINER list
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@codeconstruct.com.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org
References: <20240126034026.31068-1-ninad@linux.ibm.com>
 <20240126034026.31068-12-ninad@linux.ibm.com>
 <4ec645e9-0fa7-46f5-ade0-847b3bdbb384@kaod.org>
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <4ec645e9-0fa7-46f5-ade0-847b3bdbb384@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0dVVP_sQJ6WPfBku21hxcqmSbWuDnYwN
X-Proofpoint-ORIG-GUID: HZ4MxueSm2KXHn7iR2t0_N4-lv7GA8qt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 bulkscore=0 mlxlogscore=724 priorityscore=1501 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401260076
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
X-TUID: fGm4g+kDbSQM

Hello Cedric,

On 1/26/24 02:57, Cédric Le Goater wrote:
> On 1/26/24 04:40, Ninad Palsule wrote:
>> Added maintainer for IBM FSI model
>>
>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>> ---
>> v11:
>>   - Added Cedric as reviewer.
>
>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>

Added the tag. Thanks for the review.

Regards,

Ninad

