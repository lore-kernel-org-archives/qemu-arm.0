Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CB3606A31B
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Nov 2026 11:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MAoMZorx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gozxRTvF
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOZ6G-0001cF-He; Wed, 04 Nov 2026 06:24:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOZ6E-0001bv-IT
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 06:24:14 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOZ6D-0003rD-0Q
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 06:24:14 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A4B5oEq1290022
 for <qemu-arm@nongnu.org>; Wed, 4 Nov 2026 11:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 16qNYKIP8RUViNdyWuZwni3i1blPecNaljxWIb8q1Jw=; b=MAoMZorxz8ooMlTE
 hvvIYy1nbKDx127y/AZAsgSHpMlWpbxbWxAppVGcehEm0yAC24XCv6TaYaYO6PB0
 Vrecr7tKHWUCOPKo8E4G/INwhyjTlYFs7F98vl4xDYQqct32Rtpz9mUz77FEQSwd
 b40Whtts2+NCfU+l6OR6FFyVmcd4duCyS5OFiPTNQa/9NsoxJus86txUZTIrHhEO
 ORMYVCloM8A2TOWg5SLWAmDpC1C+TLAoQgye009Avrog9l+qG5OqzklHca/13B72
 udcp4am+CBbr927MAVCHad+ygYkxXGFzcd+Vw3wON67XLOYE+obeUXu/RG8s0sCt
 SXi9jQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqvsg9tuf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2026 11:24:11 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-7cc37ee6562so145862137.1
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2026 03:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793791450; x=1794396250; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=16qNYKIP8RUViNdyWuZwni3i1blPecNaljxWIb8q1Jw=;
 b=gozxRTvF/913s2ValQd29rwu6BtU7sxWiKB3ElTdR4+wCIrCmnxid4OaWniyCsaCi7
 6S4tnJiTExO48hcDDvx/+lY3jEpAMT9I29mvgsz4bUWYllvP9iXxuO9L8RVMnvofh1mi
 eHHcdhoxcfOvBdEtUnUwdj24sakhfpxwIRbEptOfhdB9dpBtwebzrzQAVpsSh3imgfyy
 Zs++cEllXvgdhGoXedey9wylmPkLhnW1uNeHPNFS4H7nY/viFpYdsI1KPq++8EIv8KJv
 /qbpt+Aw4E6ZgM9bPbyMISKGgTZj5XFX0m6nTO/ot/TsNG+/K6ZFh7xFwS18wFgbsY0e
 TDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793791450; x=1794396250;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=16qNYKIP8RUViNdyWuZwni3i1blPecNaljxWIb8q1Jw=;
 b=Uktzi1N8JZh0BGSazi7XEW77HVIwpCxrhSAvMEccA1jvHXAa10Pf2kLJZEb/rKzevm
 Cd0DQC2zYEldGLdX8L825TEHobNNx9C3zFQBiMPua9CH0pfW1nqtEAralD+7X2mf6yUW
 wMJNfb3bEEqfn8DbT19F0l9NnYIVoWNJuAVrfndU6SJb7GQwtiFPmsnIq+fu8GtDu8Iy
 HKZ/UMWssI1m4JYSSLHDxyDUyeuwH5vScuiUyAZ844tdQK+Po+vMraV+saUbKl5js5j8
 QiZ3oXKIRS11zhfyAmBqmHBda0OqRoqTOpsPCI7IzjgPu4TSXsDCjbnnj/acsKO6sbi7
 0/5A==
X-Forwarded-Encrypted: i=1;
 AKwUvBzkxmVsS+aOcbcFlzfu+GiVhoJgKMUzGWZTtfdqR5x/I+hxEAlENyO+oTlj8/dMxHlyqJZEf0rx2w==@nongnu.org
X-Gm-Message-State: APuU4Z/ed+0UqJ3OPogszsFriz42XVNZM3aVG0Oioc9+lvCKEnCdjsOi
 Jq+f1yRyEpcj9fTrmybjBEe1j4pxtYWWk5+k/DsNnQoFDLpQz1f+05nfaHel7rm4uEQ7N5oVOOu
 z2KAoR1kvN/QVxftw1JCAKa0Y4cybsb75jPG0NJj0tAGtarwFjPvPQrM=
X-Gm-Gg: AYBFou0lOXwWxQiUWV9a0wHalFlbFw2apPwWhbNdvjmjy6mjSMWgZQfd8UtM9r0TOod
 D8FJL/lbHrPkH+4ZIqJX0f/PuZ1Xsbn227YOHZsbLf6lcwUevywQkFW3O0/lkJroP3SqSP1Jlyh
 ivDE3vRqf3jWavTEvpNsUs5+hmRY6NJ50fAu0LlqWTpqq6dNm8JRJJoLQJfsrogupxY75iyawqC
 4zCGwRJalZ7budfpVtzzM3AonW0YEXdoW2egYZM9TlQ7ycniOZMsk++IBIXhKvp2pEU9uRTfZ59
 ykFj43Z4YIsOHkzcu4MV3V4VaABL52Awf7x0iRKqR2hMShEpnkGo2L9zns5yTVFF0ciyl+hTpkb
 cDagbAvGhqlYGodW1qJwKo2KpYJM+ys6whJmEopD2poMBlC4x0oSnt8ZT9m2SD98Opk4GxMdzdV
 rRW/7DeQ==
X-Received: by 2002:a05:6102:41a7:b0:7cc:2712:cafb with SMTP id
 ada2fe7eead31-7d0726a8a89mr5449991137.15.1793791450466; 
 Wed, 04 Nov 2026 03:24:10 -0800 (PST)
X-Received: by 2002:a05:6102:41a7:b0:7cc:2712:cafb with SMTP id
 ada2fe7eead31-7d0726a8a89mr5449988137.15.1793791449859; 
 Wed, 04 Nov 2026 03:24:09 -0800 (PST)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48feda20935sm3309709f8f.54.2026.11.04.03.24.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 03:24:09 -0800 (PST)
Message-ID: <50dcaa06-1f02-4662-8c4f-9ce2ab5e923a@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 12:24:08 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-11.2 4/4] hw/intc/arm_gicv5: Use correct type for
 value in lpi_cache_get_hppi()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20261103172616.2400758-1-peter.maydell@linaro.org>
 <20261103172616.2400758-5-peter.maydell@linaro.org>
 <CAFEAcA8X1ARhpncsz=kE2JxFjALGej4ycw3hus=m5kfcVSJXYw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <CAFEAcA8X1ARhpncsz=kE2JxFjALGej4ycw3hus=m5kfcVSJXYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GtnXaU1C c=1 sm=1 tr=0 ts=6aeb15db cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=69wJf7TsAAAA:8 a=Id7gVtO8_quhM8CtL5oA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-ORIG-GUID: SoHjcAs--9xF0507NdVSSljxxHHiiNgv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0NSBTYWx0ZWRfXzbc0ArsYJAov
 s2+oofP2PS8VBxzoOfDQJoZXPA0Vn/9mFacUSFu4dYzfkeye3b1xbgtMFyF6JUOxYoHY08Se/4R
 pduGik3Rtt6OAN+8dFzfGOnsXsMTiLQpFioGPPxz1/cu/dSliMKcEhftSHNjwiTVnTgb7umyBRp
 fkn5TNKsI94PwMWgOasvOVpOVRSDUwR7h6mvgDG3fRYHTILrPB5xMzNIGpnAggTUh1Yp6HQZFv3
 f8CN9WSiIpINdW7t18DeKJI4mPy1FoecOkO8Y6SXBAfzo5HJ3ZIQ/2IsmkODexNs7PcYDOG9EmP
 fqEDBVIihcQfioakCJAEtentKtfUqXD6TIAAjl9UPQ76n3fuNwPurrzudwuyyIcjSzkJRNveqG4
 AtFHr44stgt5xhryYXltor8Tr4R35dw9zEw2B5OQdqmIPWMCIU0zDVEy2waEgc8a5wkYkiu3uo8
 d4DDIOjONYdakJqwxDg==
X-Proofpoint-GUID: SoHjcAs--9xF0507NdVSSljxxHHiiNgv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0NSBTYWx0ZWRfX/up3JUFd7jBR
 CdfDph09DHVya0MG0KE49JGqPL0k04kRQ+wq2YfyS4n4sfXxlAF8WK19eeVQ8ISBuSAdTk0xYx4
 zEFOC3MPpXTDAfTlQ/Opyf6dGLCOrDQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_03,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040045
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 3/11/26 18:49, Peter Maydell wrote:
> On Tue, 3 Nov 2026 at 17:26, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> lpi_cache_get_hppi() is a function we pass to g_hash_table_foreach()
>> to iterate over the LPI cache hashtable.  This hash table has keys
>> which are GINT_TO_POINTER(intid) and values which hold the L2 ISTE
>> value, allocated as "hashvalue = g_new(uint32_t, 1)".
>>
>> The function is passed the key and value as type 'gpointer' and has
>> to cast them to the real types itself, but it incorrectly casts the
>> value pointer to a uint64_t*.  This works on little-endian hosts
>> (since we only read specific fields of the L2 ISTE using bitmasking),
>> but won't work on big-endian, and trips the clang sanitizer.
>>
>> Fix the pointer type.
>>
>> Cc: qemu-stable@nongnu.org
>> Fixes: a0562ada75e ("hw/intc/arm_gicv5: Calculate HPPI in the IRS")
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>   hw/intc/arm_gicv5.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
>> index fd6456cd8aa..a362349e5ed 100644
>> --- a/hw/intc/arm_gicv5.c
>> +++ b/hw/intc/arm_gicv5.c
>> @@ -390,7 +390,7 @@ typedef struct GetHPPIUserData {
>>   static void lpi_cache_get_hppi(gpointer key, gpointer value, gpointer user_data)
>>   {
>>       uint64_t id = GPOINTER_TO_INT(key);
>> -    uint64_t l2_iste = *(uint64_t *)value;
>> +    uint64_t l2_iste = *(uint32_t *)value;
>>       uint32_t prio, iaffid;
>>       GetHPPIUserData *ud = user_data;
> 
> Looking at this again we could also make the local variable
> be uint32_t; but getting the type wrong on that doesn't matter.

Should we use GUINT_TO_POINTER() when inserting in put_l2_iste()
and recover here with GPOINTER_TO_UINT()?

