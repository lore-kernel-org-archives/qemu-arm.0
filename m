Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1290983ejb;
        Mon, 22 May 2023 08:39:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5zmUSwDO/d7+rI1FYgkkShg9JMXZGwf8L4SBC9i4mNNIj3VKCZbfGrn1bifsvfycgDHEXG
X-Received: by 2002:a05:622a:11cb:b0:3f2:2fb1:dc71 with SMTP id n11-20020a05622a11cb00b003f22fb1dc71mr20729073qtk.41.1684769945650;
        Mon, 22 May 2023 08:39:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684769945; cv=none;
        d=google.com; s=arc-20160816;
        b=ZLjXH4QLvbVchk4Jy94MmfUoWUmsz/EtI4d//nApdSUwavx8nXuXaMRDK8a2U6dndB
         cSQKuV71mR9y9mHRj4BBp/xbsJYcrN6NfcRZ5anA/3mdd5VMBbXGul6nYGArzzcY0Bvr
         qLvCKyU0eaNssW4kI6/nTfpKMcrtK1n0onBeACBwJMIKXiLkkd0IxdBNnP1+FEanqqzX
         PCFpNX4QaCIKrM/vXp7Sm9h4hRBb/sFzTT34sjm57E2Li8iSV154oM5eivkRmS4+ngHu
         1aLRPNA+Z++DnHqV4UDJUOPeJKYXxNiajdeUcIVHKwFLOzLJuQrTcL0swhztvziw30VH
         jlPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=OaHuNH8YMqerG3tPtfLbpnSUfPoxE2DNVQJyJ1zGnlg=;
        b=Uab8L/z3jNJDzFFPlhT0/y5k52fDqzuy/Np/fgJlqc5ouS2mbyX9pk3fgN4E6mbAyB
         mF/JAi2/BUUc4h5O5u7PV9Ov5LOSF1io4FuBLSiMDDM0Lqoy4z3VBSnX8zBbpHiohc8/
         IZtOTVyxve2iXCBqT4huPND/k+Xbc9yLUma/ebS0Zc8QHelMTNbFNZDshxBBZGnLo4WR
         anfgU6SWoaoirCsWPKECvEl0lHC2f9fanIx0DscUI+XIOV95ggrd+yQTpfOZLQ4oqCnD
         lgGVKc3tnQcdSa/VfZAZ2uYj50EmCVrW5/EWMlneAHW8MKNv6B8IEvoih+5NwMSczcDQ
         cBYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=dif+rtTN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 16-20020ac85910000000b003e4e85115casi3859024qty.679.2023.05.22.08.39.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 May 2023 08:39:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=dif+rtTN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q17ce-0001fx-GX; Mon, 22 May 2023 11:38:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1q17cc-0001e3-5y
 for qemu-arm@nongnu.org; Mon, 22 May 2023 11:38:54 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1q17ca-0002jn-B7
 for qemu-arm@nongnu.org; Mon, 22 May 2023 11:38:53 -0400
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34MFP7WN015021; Mon, 22 May 2023 15:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=OaHuNH8YMqerG3tPtfLbpnSUfPoxE2DNVQJyJ1zGnlg=;
 b=dif+rtTNHB3JTANrKc/tmSmctO66YxYToqTzOv0gvHpD8uF/dlErjpatxcMebCeA+1Lu
 sMN39rX5OZLCl3NKXFUtntMkhrn/d8FoRNuQC+K7Ye+wR67S04lysqdWKLTkQvWeb+z3
 QAJXIDjBRl+hcqzzeUgDk7ZY14IYO4lkoBoBOCaKEI/vApxfs2fABMwjY1HxuG5dyMtE
 3pl3izCLtpgyo7+tAXVJaN+Smwju5csNoG1q6PFsuBfDH7KX4qvwj0VW/JH4C1XnQJ90
 1YqYoJ4OC7pFLtzFqbyoIheHsZPC12+NHtXgteG7ik0gOsH/i0LhfRa1ZNM4TT+Ho059 Ig== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qr9x2kph7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 15:38:45 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34ME1K4o018060;
 Mon, 22 May 2023 15:38:45 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
 by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3qppdqaxgd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 15:38:45 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 34MFchOw63963582
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 May 2023 15:38:43 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DCD558066;
 Mon, 22 May 2023 15:38:43 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 195F858062;
 Mon, 22 May 2023 15:38:43 +0000 (GMT)
Received: from [9.163.56.240] (unknown [9.163.56.240])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 22 May 2023 15:38:43 +0000 (GMT)
Message-ID: <516bc36b-a314-737b-d566-d0d0733a986d@linux.vnet.ibm.com>
Date: Mon, 22 May 2023 10:38:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v1 1/1] Add vpd data for Rainier machine
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ninad Palsule <ninad@linux.ibm.com>, peter.maydell@linaro.org,
 andrew@aj.id.au, qemu-arm@nongnu.org, joe@jms.id.au
Cc: Ninad Palsule <ninadpalsule@us.ibm.com>
References: <20230519212412.3362107-1-ninad@linux.ibm.com>
 <20230519212412.3362107-2-ninad@linux.ibm.com>
 <c44cb708-2494-fedf-da79-892f34f8a747@kaod.org>
From: Ninad Palsule <ninad@linux.vnet.ibm.com>
In-Reply-To: <c44cb708-2494-fedf-da79-892f34f8a747@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: x1g1Gp0c5_LmIOtpP03y3UEZ7lS8PwwX
X-Proofpoint-ORIG-GUID: x1g1Gp0c5_LmIOtpP03y3UEZ7lS8PwwX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_10,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 spamscore=0
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
X-TUID: 51p+jCVKgUEA

Hello Cedric,

On 5/22/23 4:52 AM, Cédric Le Goater wrote:
> Hello Ninad,
>
> On 5/19/23 23:24, Ninad Palsule wrote:
>> From: Ninad Palsule <ninadpalsule@us.ibm.com>
>>
>> The VPD data is added for system and BMC FRU. This data is fabricated.
>>
>> Tested:
>>     - The system-vpd.service is active.
>>     - VPD service related to bmc is active.
>> Signed-off-by: Ninad Palsule <ninadpalsule@us.ibm.com>
>
> Could you please resend a v2 copying qemu-devel@ as Peter pointed out ?
Sorry about that. I have sent the V2.
>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
>
> Thanks,
>
> C.
>
>
>> ---
>>   hw/arm/aspeed.c        |  6 ++++--
>>   hw/arm/aspeed_eeprom.c | 45 +++++++++++++++++++++++++++++++++++++++++-
>>   hw/arm/aspeed_eeprom.h |  5 +++++
>>   3 files changed, 53 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index 0b29028fe1..bfc2070bd2 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -788,8 +788,10 @@ static void 
>> rainier_bmc_i2c_init(AspeedMachineState *bmc)
>>                        0x48);
>> i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), TYPE_TMP105,
>>                        0x4a);
>> -    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x50, 64 * 
>> KiB);
>> -    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51, 64 * 
>> KiB);
>> +    at24c_eeprom_init_rom(aspeed_i2c_get_bus(&soc->i2c, 8), 0x50,
>> +                          64 * KiB, rainier_bb_fruid, 
>> rainier_bb_fruid_len);
>> +    at24c_eeprom_init_rom(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51,
>> +                          64 * KiB, rainier_bmc_fruid, 
>> rainier_bmc_fruid_len);
>>       create_pca9552(soc, 8, 0x60);
>>       create_pca9552(soc, 8, 0x61);
>>       /* Bus 8: ucd90320@11 */
>> diff --git a/hw/arm/aspeed_eeprom.c b/hw/arm/aspeed_eeprom.c
>> index dc33a88a54..ace5266cec 100644
>> --- a/hw/arm/aspeed_eeprom.c
>> +++ b/hw/arm/aspeed_eeprom.c
>> @@ -119,9 +119,52 @@ const uint8_t yosemitev2_bmc_fruid[] = {
>>       0x6e, 0x66, 0x69, 0x67, 0x20, 0x41, 0xc1, 0x45,
>>   };
>>   +const uint8_t rainier_bb_fruid[] = {
>> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
>> 0x00, 0x84,
>> +    0x28, 0x00, 0x52, 0x54, 0x04, 0x56, 0x48, 0x44, 0x52, 0x56, 
>> 0x44, 0x02,
>> +    0x01, 0x00, 0x50, 0x54, 0x0e, 0x56, 0x54, 0x4f, 0x43, 0x00, 
>> 0x00, 0x37,
>> +    0x00, 0x4a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x50, 0x46, 0x08, 
>> 0x00, 0x00,
>> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46, 0x00, 
>> 0x52, 0x54,
>> +    0x04, 0x56, 0x54, 0x4f, 0x43, 0x50, 0x54, 0x38, 0x56, 0x49, 
>> 0x4e, 0x49,
>> +    0x00, 0x00, 0x81, 0x00, 0x3a, 0x00, 0x00, 0x00, 0x00, 0x00, 
>> 0x56, 0x53,
>> +    0x59, 0x53, 0x00, 0x00, 0xbb, 0x00, 0x27, 0x00, 0x00, 0x00, 
>> 0x00, 0x00,
>> +    0x56, 0x43, 0x45, 0x4e, 0x00, 0x00, 0xe2, 0x00, 0x27, 0x00, 
>> 0x00, 0x00,
>> +    0x00, 0x00, 0x56, 0x53, 0x42, 0x50, 0x00, 0x00, 0x09, 0x01, 
>> 0x19, 0x00,
>> +    0x00, 0x00, 0x00, 0x00, 0x50, 0x46, 0x01, 0x00, 0x00, 0x00, 
>> 0x36, 0x00,
>> +    0x52, 0x54, 0x04, 0x56, 0x49, 0x4e, 0x49, 0x44, 0x52, 0x04, 
>> 0x44, 0x45,
>> +    0x53, 0x43, 0x48, 0x57, 0x02, 0x30, 0x31, 0x43, 0x43, 0x04, 
>> 0x33, 0x34,
>> +    0x35, 0x36, 0x46, 0x4e, 0x04, 0x46, 0x52, 0x34, 0x39, 0x53, 
>> 0x4e, 0x04,
>> +    0x53, 0x52, 0x31, 0x32, 0x50, 0x4e, 0x04, 0x50, 0x52, 0x39, 
>> 0x39, 0x50,
>> +    0x46, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x23, 0x00, 
>> 0x52, 0x54,
>> +    0x04, 0x56, 0x53, 0x59, 0x53, 0x53, 0x45, 0x07, 0x49, 0x42, 
>> 0x4d, 0x53,
>> +    0x59, 0x53, 0x31, 0x54, 0x4d, 0x08, 0x32, 0x32, 0x32, 0x32, 
>> 0x2d, 0x32,
>> +    0x32, 0x32, 0x50, 0x46, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 
>> 0x00, 0x23,
>> +    0x00, 0x52, 0x54, 0x04, 0x56, 0x43, 0x45, 0x4e, 0x53, 0x45, 
>> 0x07, 0x31,
>> +    0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x46, 0x43, 0x08, 0x31, 
>> 0x31, 0x31,
>> +    0x31, 0x2d, 0x31, 0x31, 0x31, 0x50, 0x46, 0x04, 0x00, 0x00, 
>> 0x00, 0x00,
>> +    0x00, 0x00, 0x15, 0x00, 0x52, 0x54, 0x04, 0x56, 0x53, 0x42, 
>> 0x50, 0x49,
>> +    0x4d, 0x04, 0x50, 0x00, 0x10, 0x01, 0x50, 0x46, 0x04, 0x00, 
>> 0x00, 0x00,
>> +    0x00, 0x00,
>> +};
>> +
>> +/* Rainier BMC FRU */
>> +const uint8_t rainier_bmc_fruid[] = {
>> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
>> 0x00, 0x84,
>> +    0x28, 0x00, 0x52, 0x54, 0x04, 0x56, 0x48, 0x44, 0x52, 0x56, 
>> 0x44, 0x02,
>> +    0x01, 0x00, 0x50, 0x54, 0x0e, 0x56, 0x54, 0x4f, 0x43, 0x00, 
>> 0x00, 0x37,
>> +    0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x50, 0x46, 0x08, 
>> 0x00, 0x00,
>> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1c, 0x00, 
>> 0x52, 0x54,
>> +    0x04, 0x56, 0x54, 0x4f, 0x43, 0x50, 0x54, 0x0e, 0x56, 0x49, 
>> 0x4e, 0x49,
>> +    0x00, 0x00, 0x57, 0x00, 0x1e, 0x00, 0x00, 0x00, 0x00, 0x00, 
>> 0x50, 0x46,
>> +    0x01, 0x00, 0x00, 0x00, 0x1a, 0x00, 0x52, 0x54, 0x04, 0x56, 
>> 0x49, 0x4e,
>> +    0x49, 0x44, 0x52, 0x04, 0x44, 0x45, 0x53, 0x43, 0x48, 0x57, 
>> 0x02, 0x30,
>> +    0x31, 0x50, 0x46, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00,
>> +};
>> +
>>   const size_t tiogapass_bmc_fruid_len = sizeof(tiogapass_bmc_fruid);
>>   const size_t fby35_nic_fruid_len = sizeof(fby35_nic_fruid);
>>   const size_t fby35_bb_fruid_len = sizeof(fby35_bb_fruid);
>>   const size_t fby35_bmc_fruid_len = sizeof(fby35_bmc_fruid);
>> -
>>   const size_t yosemitev2_bmc_fruid_len = sizeof(yosemitev2_bmc_fruid);
>> +const size_t rainier_bb_fruid_len = sizeof(rainier_bb_fruid);
>> +const size_t rainier_bmc_fruid_len = sizeof(rainier_bmc_fruid);
>> diff --git a/hw/arm/aspeed_eeprom.h b/hw/arm/aspeed_eeprom.h
>> index 86db6f0479..bbf9e54365 100644
>> --- a/hw/arm/aspeed_eeprom.h
>> +++ b/hw/arm/aspeed_eeprom.h
>> @@ -22,4 +22,9 @@ extern const size_t fby35_bmc_fruid_len;
>>   extern const uint8_t yosemitev2_bmc_fruid[];
>>   extern const size_t yosemitev2_bmc_fruid_len;
>>   +extern const uint8_t rainier_bb_fruid[];
>> +extern const size_t rainier_bb_fruid_len;
>> +extern const uint8_t rainier_bmc_fruid[];
>> +extern const size_t rainier_bmc_fruid_len;
>> +
>>   #endif
>
