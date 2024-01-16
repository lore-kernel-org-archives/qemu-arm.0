Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp1095638ejf;
        Tue, 16 Jan 2024 11:44:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGImru0/nqwhYI6s+d1OkW98KhQZssPR/RIuj1tCbCHWZZIxgPUkZJXpXm4aJDrmlYgSsUC
X-Received: by 2002:a05:6122:238a:b0:4b6:f0f7:1b53 with SMTP id bu10-20020a056122238a00b004b6f0f71b53mr2703099vkb.15.1705434266220;
        Tue, 16 Jan 2024 11:44:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705434266; cv=none;
        d=google.com; s=arc-20160816;
        b=FyRrXxbhiPQhi1T9b9iYdhfnX1VZ6SvtE64r1ioJCJq8cIBmrf7TiZcVjo0Z/MKVAR
         AzmbKYlESJYR0v+6cCd2ob+NHIe820VkxVduhvTVaNY/+C5sosPUEQ2Kw/UdIWUyWlLQ
         naic0/Vqfz7GhokLR3VJLMRAVraGhgokUNIbYYs0V+Z18SvxK3gzirJJWYwrngEf4gkj
         9rgPJTg2TS2NHm3bX7TTrjfoDdA0z6/kiRxydhpTMDjPT/hWhdO8EwtEabLh+U0+5ff5
         IUAAIlcM3WPBLTSMG9G7/lcZjqwJPNRrC6tRnPR//71WzT8e8zOWoolV9UCN9vlr7EG2
         4NNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=KjmSLcCXwUJSr7jviLnzM7LFNWe+BgYhIXpN7fszjng=;
        fh=HTHR+Q2d6bLhEl37Oh4T8uXQP5/6sUv4T2u8Op+j0Ns=;
        b=amFbxEsddLYx+nArJOvs0igqeaf/DMT9JMykpiCvAE9yXem0tQI2s2f7byVimUAar5
         CIpCSHH162j4FHyoNmSG717grEwV21DO/WN9hk1CYwdvo0/aGJfYlNcq0tlfwugDDp3s
         kmrG1yRE6zH4DDXQHIKTAgNAQwnz4apJM8R7sdny0cwatQk7AOGvANF2tKzLKTSsMSIj
         Zme89MxNLoM/UX0j6avN5HEyoxJyvrGETjKnWUoHiupCzPCoSyqE6cfDCyFpbD/jKiPn
         LPmIarzijCBdYFNXIUDSgLQtQRQzSI2CUdROX5x2bEzbz1iPujuY0ej7WgL/OhdUNdlO
         Ounw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=QV5HkfdC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n1-20020a0c8c01000000b0067f28fb3f53si10346552qvb.445.2024.01.16.11.44.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jan 2024 11:44:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=QV5HkfdC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPpM9-00016R-V1; Tue, 16 Jan 2024 14:44:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rPpM8-00015r-Gs; Tue, 16 Jan 2024 14:44:16 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.ibm.com>)
 id 1rPpM6-0002Yy-Ob; Tue, 16 Jan 2024 14:44:16 -0500
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 40GJb9U4025946; Tue, 16 Jan 2024 19:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=KjmSLcCXwUJSr7jviLnzM7LFNWe+BgYhIXpN7fszjng=;
 b=QV5HkfdCcJsf8ATLmv4j+ovMNS7bckdP4RHvFwvnB4OxG9ebuEpOvgJwTpgXXz/JeLFr
 xtTmAv92/HV0uzt0MgnN6zJ4y4NTsOcnXzod8m4LtcApV+JEaHmigUTYUn5w08xlVrel
 HAnYYI144DSpzP5hoXLtfTroUzML2HI6CqZR/1CHGY4dBXYJf4xCgFDn1tfoZD3H7Xwi
 8qfo+yJvSucnyuP5d+UAG187/MBJV094488vstI9vKdyohz5HpT/Jzi30iAO/gAbd8FI
 49tqhBdXtKM3PfGhptMzAOuEt2cEFARkIWw3UKNn7nJ9UrX0wVAp0ODuHvgKV7jLYpR4 wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vp042r7hf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jan 2024 19:43:56 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40GJbfLJ028196;
 Tue, 16 Jan 2024 19:43:55 GMT
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vp042r7gt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jan 2024 19:43:55 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 40GJ16gU008541; Tue, 16 Jan 2024 19:43:54 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vm5ungqrj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jan 2024 19:43:54 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 40GJhrAm52888148
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jan 2024 19:43:53 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8B885805A;
 Tue, 16 Jan 2024 19:43:53 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B55D58056;
 Tue, 16 Jan 2024 19:43:53 +0000 (GMT)
Received: from [9.24.12.86] (unknown [9.24.12.86])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jan 2024 19:43:53 +0000 (GMT)
Message-ID: <b062de94-d0df-43da-bac6-162ebb44485a@linux.ibm.com>
Date: Tue, 16 Jan 2024 13:43:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/9] hw/fsi: Introduce IBM's FSI master
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@codeconstruct.com.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org, Andrew Jeffery <andrew@aj.id.au>
References: <20240110231537.1654478-1-ninad@linux.ibm.com>
 <20240110231537.1654478-5-ninad@linux.ibm.com>
 <ea878161-a0cc-41ee-bece-3c2dc61eac21@kaod.org>
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <ea878161-a0cc-41ee-bece-3c2dc61eac21@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hg5x8DNkQexRjY_JNbkCJXgoIfg3N69v
X-Proofpoint-ORIG-GUID: YXtlcFNLnfhIXzoF_PrGcdk0tD9-RwT8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-16_12,2024-01-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 adultscore=0 mlxlogscore=706 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401160155
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
X-TUID: eBzHjwHfiGJs

Hello Cedric,


>>
>> [ clg: - move FSICFAMState object under FSIMasterState
>>         - introduced fsi_master_init()
>>         - reworked fsi_master_realize()
>>         - dropped FSIBus definition ]
>
> Move the list down before my S-o-b.
Done.
>
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> Reviewed-by: Joel Stanley <joel@jms.id.au>
>
> I think you can drop Joel's reviews, the code has changed a lot.
Removed Joel's review tag.
>
>> +static void fsi_master_reset(DeviceState *dev)
>> +{
>> +    FSIMasterState *s = FSI_MASTER(dev);
>> +    int i;
>> +
>> +    /* Initialize registers */
>> +    for (i = 0; i < FSI_MASTER_NR_REGS; i++) {
>> +        s->regs[i] = 0;
>> +    }
>
> memset(s->regs, 0, sizeof(s->regs));

Replaced for loop with memset.

Thanks for the review.

Regards,

Ninad


