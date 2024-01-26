Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp770671ejc;
        Fri, 26 Jan 2024 01:55:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXSiqaL2tBhEXCaObarFbYcINXQjAFnucyJHA7tN+VPyp2ys0xaeMp2C+5PDJ677sOK8br
X-Received: by 2002:a05:620a:1471:b0:783:9b7c:50f with SMTP id j17-20020a05620a147100b007839b7c050fmr1478946qkl.14.1706262905796;
        Fri, 26 Jan 2024 01:55:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706262905; cv=none;
        d=google.com; s=arc-20160816;
        b=UTQVERByi0JBSCgEw16yER3BgfibtUXDQhsAdu3V2/dAV2hmTLSMhpfmPdVTXyBRNa
         qVtGrDKjZXW35EZ78c7F+bW5l5zecHilnpIbQjssFBC5wbpy2+6KSeKtnPlvxY4GKqr3
         TON2g/X3awSVS+a1ZiMFWnABHVOK3my0jn8iVINeC1s062V1BbXiMs1zaJyvOPuuac9/
         0TuG8Jqo04ysp1aNfhWRU30zjOypNYkV9GJDe+jKpxDMTz65+wdFfWw8RK79HuENageY
         u8hDB8Wo/SZiGZm0hZGdbWl8Dami72F1yT/RCa8XN9eWWh/max73aBXJjC+NN8Hvm+v9
         FKpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fsg2uOAHruHwKN6KVIsmq0BuYgLGXAEdRiW11b/HEVg=;
        fh=HTHR+Q2d6bLhEl37Oh4T8uXQP5/6sUv4T2u8Op+j0Ns=;
        b=a22XArzhuqPLxndTqpVX+kdgXQIyXevuEmla8KwB9fiXetX+LYHxkjRlsAfxmFrz52
         clI4kIpzof9FAr0GhkgnrfZ7BtNkAKcpKQ4KYqHXTDqSfQBBqPM987Xh9JbszPCKRSnm
         E0uB45xeM/5Zu/Wd7o8ZIW9R1DJ+KVgJf/rtELv9ZSXZHWq+ET6BCWtjdOmdQst0sAI8
         pbVG+NFlcRcOaKhlwexUoH6lzkiHGxLM5uDrBE4y7hRon0DDFOhn2Yu6OnM7sqbdXAFe
         y3WUxpFNBavxyucrSCCjsMZ3jyZarf/NISptcgZtbH+0uDEkU3E0ksf/ICy0u9R27ZGl
         MVqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=f0WT+IyW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl14-20020a05620a1a8e00b007839e5e5129si1053020qkb.39.2024.01.26.01.55.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 01:55:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=f0WT+IyW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTIv1-00067r-Jj; Fri, 26 Jan 2024 04:54:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rTIuz-00065t-S5; Fri, 26 Jan 2024 04:54:37 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rTIux-0000RE-Pp; Fri, 26 Jan 2024 04:54:37 -0500
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 40Q9WtwO014684; Fri, 26 Jan 2024 09:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=fsg2uOAHruHwKN6KVIsmq0BuYgLGXAEdRiW11b/HEVg=;
 b=f0WT+IyWvgK2X9JZaFRo5oe+KmhxJ/omu8TtGptkWiilAOw/4a9OBDyd+plAmtg21I40
 mu065flHKce05ujMn4NqC1Wk/Jxj1mDXZ+bPaYOGq8f0CmP8Cc7/Wtx62QQtG46VuAd9
 3zhew8bZ00qts+mT2WmfDsP8cad0UjJaSMgS29pJEC7ptT0n0qwBPUsd9PvZKALIbSlx
 2LO7iIjdMDlvjJxyNW2zsSOwjJWciqwCJkvj3PCr5WrX2iEC0hsr4abxY+l9Se7eZcGz
 tI2zOaZ6u/XV+6rDvkTbrHe6T3W6+kn6BdJMlfOjtG3cPppC75jIDiNAYdG98xj5acz4 EA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vva6v8f09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 09:54:18 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40Q9XEqM015470;
 Fri, 26 Jan 2024 09:54:17 GMT
Received: from ppma22.wdc07v.mail.ibm.com
 (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vva6v8eyr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 09:54:17 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 40Q7UI4W010860; Fri, 26 Jan 2024 09:54:17 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
 by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vrrw0a39f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jan 2024 09:54:17 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 40Q9sGId49873278
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jan 2024 09:54:16 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF77F5805D;
 Fri, 26 Jan 2024 09:54:16 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E569C58054;
 Fri, 26 Jan 2024 09:54:15 +0000 (GMT)
Received: from [9.61.160.70] (unknown [9.61.160.70])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jan 2024 09:54:15 +0000 (GMT)
Message-ID: <e5f33e95-183d-4f0b-9fa5-8a636b4d60e1@linux.ibm.com>
Date: Fri, 26 Jan 2024 03:54:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 02/11] hw/fsi: Introduce IBM's scratchpad device
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@codeconstruct.com.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org, Andrew Jeffery <andrew@aj.id.au>
References: <20240126034026.31068-1-ninad@linux.ibm.com>
 <20240126034026.31068-3-ninad@linux.ibm.com>
 <116910db-f8bf-40ed-85ea-aac76ef6e92a@kaod.org>
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <116910db-f8bf-40ed-85ea-aac76ef6e92a@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jOmNzRdu_xMR3KaTQ7VxoCnpJRoqTGhY
X-Proofpoint-ORIG-GUID: 5PATKTezYk77RhLnYviqfqZ9Dq1dU8rO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 mlxlogscore=739 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401260071
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
X-TUID: hhFjYHX3o4EB

Hello Cedric,


>>   +static uint64_t fsi_scratchpad_read(void *opaque, hwaddr addr, 
>> unsigned size)
>> +{
>> +    FSIScratchPad *s = SCRATCHPAD(opaque);
>> +    int reg = TO_REG(addr);
>> +
>> +    trace_fsi_scratchpad_read(addr, size);
>> +
>> +    if (reg >= FSI_SCRATCHPAD_NR_REGS) {
>
> usually, the model logs a GUEST_ERROR in such case, specially when the 
> MMIO
> window is larger than the register set. Same comment for the write memop.
>
> with that,
>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>

Added error log. Added tag.

Thanks for the review.

Regards,

Ninad

