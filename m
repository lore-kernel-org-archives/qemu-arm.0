Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2200634lff;
        Mon, 14 Jun 2021 11:12:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4jQkUjWQMi1NhEx5FtsBJ5nmcgRWWHlL+GKew96E42QOETzv97MLuf63gVE2L/w3ixW1P
X-Received: by 2002:a05:6102:241a:: with SMTP id j26mr717997vsi.59.1623694346737;
        Mon, 14 Jun 2021 11:12:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623694346; cv=none;
        d=google.com; s=arc-20160816;
        b=TMhQjVfGdOmwxoyM3HAngGkNmAI0n1UvERzykf6kLqNxUl5t3zSzVxM/qZkqUjCfLA
         UuIKTDn5yW12tjME3Os0qm9nqkkEh+iYguvTDawmdlYrD100DAOosBJ00piuQNfLgA/8
         0U51Ux3Ae+/KR5n3uABa4azT+nHWnDu71QmFKuNrB/ob6znxs77NB0D+zOnE5EJT2zXp
         Yrflt2UJf3VvxGmBCJ9BZ6KZnmL0Ixa8Avo7bhPa8wDI4dI4B7cxxUBB2Uo3rGEY/yvy
         gwD1jF+qvB73bynOQtAV8rDrVjegc3sL3gyc3AyYTeFH3HdzSUNtK9YdySN9CUQsAT/P
         tgPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=UJAVGt13YiHXbCFKXfob74VcvQuzzhS6/Jd5OkEDxOY=;
        b=X0SJlkea3ZCduUttfIxE/Hy3dB1qixlDuLndye2AzbJj9+AsmUd+BdRyTFqM5JIsDM
         RpDAPKdALwDVQQk/+soVHHyd5rI39clTufWZhS3bBYorS/iW7RjpHIObVYsNoMd8tb2c
         CjsE77PlEcX7I5nGCR92SdjIczYzK2tL4kGOyOvhjCx8Tu3c+OLAd4nYoL0poYPfk4yv
         E0sVP0yD1XNwp30DwUS3Yo3ngfm8ENeuQpXGx/pzT1tAcd4uBJmbSjOSgZ4WN5d4hVHA
         +/ARodNUrtVC1vun5Cjy23bD2cGeuOuP8sNnGQ1ppyPas2uzhkjnwfBF9waC12jjVDWt
         X77Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ibm.com header.s=pp1 header.b=L4JUPBAs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w13si1077749vkw.38.2021.06.14.11.12.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 11:12:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ibm.com header.s=pp1 header.b=L4JUPBAs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:38066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsr4U-0005FG-1H
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 14:12:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lsr4F-0005EJ-0v; Mon, 14 Jun 2021 14:12:11 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:13750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1lsr4C-0005G9-RF; Mon, 14 Jun 2021 14:12:10 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15EI4Flk058816; Mon, 14 Jun 2021 14:12:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=UJAVGt13YiHXbCFKXfob74VcvQuzzhS6/Jd5OkEDxOY=;
 b=L4JUPBAsrTrRijAvkKkOrXE3HV2n6OIVTUNeNqfdprfLoxNo46pgltaC2/nI4G78UX9S
 Vwn6VVuSSSp31Pvo24239O2rBWeQeo43Nik8MdYUqxpHpwLgrFOxPHu80NVwHLYgXyxZ
 2ZwM6UyfBVSiQke6+OQn7X5v92VYM68nyesfLOWUkOmhyZ3P1yWmwPYLyxX8t4M5Ofof
 sWIcw22SsrCJ9xgR5G3HUDPa7vjnbTwfMmQY4lYYL+qE6DevHC5v65+yYP867sqM7GwW
 a0yLa3BjM2JsuY2VKmN3TWef60clQdcoq1Di+wrLVeB1tY7LAn1PTjUz29zKOaKuQXE3 HQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3968u6q09u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 14:12:05 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15EI4Jv1059042;
 Mon, 14 Jun 2021 14:12:05 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3968u6q099-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 14:12:05 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15EI2M1Z027279;
 Mon, 14 Jun 2021 18:12:04 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 394mj99mkm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 18:12:04 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15EIC3W622086126
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Jun 2021 18:12:03 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26095136051;
 Mon, 14 Jun 2021 18:12:03 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C195A136055;
 Mon, 14 Jun 2021 18:12:02 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 14 Jun 2021 18:12:02 +0000 (GMT)
Subject: Re: [RFC PATCH V1 1/3] acpi: Eliminate all TPM related code if
 CONFIG_TPM is not set
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 armbru@redhat.com, qemu-devel@nongnu.org, qemu-arm <qemu-arm@nongnu.org>
References: <20210612012102.1820063-1-stefanb@linux.ibm.com>
 <20210612012102.1820063-2-stefanb@linux.ibm.com>
 <d097926e-5f55-e2a0-0cf9-42dfd71815d4@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <06d0af74-a54e-a568-2325-03f3b23b69dd@linux.ibm.com>
Date: Mon, 14 Jun 2021 14:12:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <d097926e-5f55-e2a0-0cf9-42dfd71815d4@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: z7Dzakw2dZ-KWQZZn2c_tGDEN-D2Fhee
X-Proofpoint-GUID: dKfXKzUjacNfQoIE2iOdqL9t7Zi1QMba
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-14_12:2021-06-14,
 2021-06-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 clxscore=1011 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106140110
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 "M : Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uzEb4OFobA69


On 6/14/21 5:53 AM, Philippe Mathieu-Daudé wrote:
> On 6/12/21 3:21 AM, Stefan Berger wrote:
>> Cc: M: Michael S. Tsirkin <mst@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>> ---
>>   hw/acpi/aml-build.c      |  2 ++
>>   hw/arm/virt-acpi-build.c |  2 ++
>>   hw/i386/acpi-build.c     | 20 ++++++++++++++++++++
>>   include/hw/acpi/tpm.h    |  4 ++++
>>   stubs/tpm.c              |  4 ----
>>   5 files changed, 28 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>> index f0035d2b4a..d5103e6d7b 100644
>> --- a/hw/acpi/aml-build.c
>> +++ b/hw/acpi/aml-build.c
>> @@ -2044,6 +2044,7 @@ build_hdr:
>>                    "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id);
>>   }
>>   
>> +#ifdef CONFIG_TPM
>>   /*
>>    * build_tpm2 - Build the TPM2 table as specified in
>>    * table 7: TCG Hardware Interface Description Table Format for TPM 2.0
>> @@ -2101,6 +2102,7 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
>>                    (void *)(table_data->data + tpm2_start),
>>                    "TPM2", table_data->len - tpm2_start, 4, oem_id, oem_table_id);
>>   }
>> +#endif
> This makes the ARM virt machine build to fail for missing
> the build_tpm2() symbol.
>
> You probably need to split the patch in 2 and rearrange the
> series:
>
> 1/ hw/i386    (current 1)
> 2/ hw/arm     (current 2)
> 3/ hw/acpi    (current 1)
> 4/ sysemu/tpm (current 3)


I took a bottom-up approach where I also eliminated all callers. So from 
what I can see build_tpm2() symbol has been eliminated by both i386 and 
aarch64, but ok, I will change it to a top-down approach.



