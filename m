Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A9E606A32D
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Nov 2026 18:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PZa8IBcu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q6plhQlf
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xRCmF-0002fd-5o; Wed, 11 Nov 2026 13:10:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xRCmD-0002e8-9r
 for qemu-arm@nongnu.org; Wed, 11 Nov 2026 13:10:29 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xRCmA-00021t-Se
 for qemu-arm@nongnu.org; Wed, 11 Nov 2026 13:10:28 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ABHtFKr2052160
 for <qemu-arm@nongnu.org>; Wed, 11 Nov 2026 18:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 j78EHnLMpbHBfKYr+yxhRxrLFZf8x2hIcKbEaHdplf4=; b=PZa8IBcu2X8y0nuf
 wrnUhs9VNFEg0Zh45jzzjEYIvso9q6SMBwXf5zdCXS65AQ3XviNkGXoyi6aP0cZs
 0eNZKl+EMwHuIUTAMAQYSHnsUc2OBAURxPFhOnipg0n5H+3m4bJjiaHS3mz4+LdZ
 wetWqmBvQxhzYxu2lS5wq7u92RRTUqHGOPi2yjio3Lls/BUkLigs1Kof3Rru46V6
 J99aBhTuwX/HiX53Gm0vxB7mW8A0bhL7cxJ/8sSslk6pPflqLpguLCv7y3OFG98S
 3KXFWrmYzsOrg9V+VNZKaWPFh8MNVCixOX3FKK62rSvK1S02mHqcgyH5YZNV+CKU
 +crwcA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7ptmdr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 11 Nov 2026 18:10:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-36efb506f29so6455725eec.1
 for <qemu-arm@nongnu.org>; Wed, 11 Nov 2026 10:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794420622; x=1795025422; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=j78EHnLMpbHBfKYr+yxhRxrLFZf8x2hIcKbEaHdplf4=;
 b=Q6plhQlf3t32C/MXg8bfJSpSNOebTQuhHcm2iEa1Mc7mlMcuamURUn4dbVeHWmI03Y
 qJiYgvjMfhUhNMrmIezLb1ktukQKHHWzdsg4h8jr1HjixJL0/gS6f8dyFTgRbRNaR884
 /u+amNm9aluzgLcrKyy0xS6YKksrAxl1StNTmi5hGO4h84oEUATrIrKKCGqHdH4gO7ye
 nE+wETKPELzlGzHjxsHF42k2DyIQxmtl7a7ZF5j7VZnp0UuWHt6Hi5frPyZFdKrAXsC2
 CicCL8ydSEmDyoaF60U1rL55t+91OmHiWrtzSwjnYNMfSQ4TIFkCBGIc14sHUf5LDWko
 69Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794420622; x=1795025422;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=j78EHnLMpbHBfKYr+yxhRxrLFZf8x2hIcKbEaHdplf4=;
 b=OxUT+ueU00RQ9316EK22Eiek7tg7bP0euVE6UW9adxf8/CXqLyYqOBLRGXb/usw5Fo
 M2hJ12onG6Bg6LPRktOWtchpnwVi5+PHJFJnoKZCCR8gnjsPff2fYdDeUrnWFZp5OKA5
 EKiWqOYe/OOJiBbSSaIzY01KY8VHvL85hvrMEl3QYcQZTKKaoKEAudf0eaPYIUbUI/7+
 cHdaGwk8NGNlbGY+I7iUXl9rlFVNBhrgSjc+ygGTHtZRYFai10bhByLNE4xJe0Qt/5FF
 fjiPa0huY1+K2E4ZYSxP2sv4Te624FAKxQQzfYFtocDsLqzNh1MIEX3u8mfGMHad2vSV
 CY3A==
X-Forwarded-Encrypted: i=1;
 AL+hErGqfafkpLQE3B92405V7D5vhwNMSiuyGVyVhdK8fX16vYWeJV3euTxq/4atOXqMHpJaUkJ/nFXcIg==@nongnu.org
X-Gm-Message-State: APuU4Z/DXx0qqIHaRPsKPTb5HOJI7AF5apkcJWUSjQ5fPR3u/0fCUAP3
 F3fzsuTHfuyjSrFdots8cJac4RSk553iVKs9RtXfKW84wP24e+Be9VgxQ+bdss+egWL6qz07ewU
 6GUlX1FbcpIXJgFAc0h0aV2sF06Y++dhj/kU7AVXC5HtsCKvaSYeYQ8c=
X-Gm-Gg: AYBFou2r1+w1x5NUZFfXN9ItiWUep9d2CrppJvG9/F9o8cq7FvIJgdyvGEhe4VQa5ZS
 et/as6gEMuJi71Dy0e33AsR486ZMhwibW16CkFF3yMjSHIw6deKcIcU6OM27xu5IZ2wJVV4vWAZ
 M6zSG38e7xyiRClTKQnaYO5AYWAQpFQFJT2Pvrl5JMVelIfvNITGqbRIZ2fgz0qJON3KNEey8Of
 MtfYraclvgZNYZ29MbL3VU49TpyDDkbAoYxj8HHjxUu/F+KOFiyaPYSe2wP1fyU6V8YAnYQMra0
 41dvQdNQKYRGfzqI4OkHoFnn+3pxs9zncM4tCJoocaWO90ZRuM0YfVNT9+E7OLW7qQxW5kpVgtG
 ALsAVQfVrss7fEWQMwKw0ZkwHvGKshyHstz8nOBx61Ilw1OZryS7JHVz4XqyyY36PgVBWFZ03Ay
 bbrmkJU0pXEds4QdTuwHEoz/e6s14fVMSyfy4u0G5lz60=
X-Received: by 2002:a05:7301:1927:b0:372:2ed7:8f89 with SMTP id
 5a478bee46e88-3768701e997mr3845755eec.34.1794420621812; 
 Wed, 11 Nov 2026 10:10:21 -0800 (PST)
X-Received: by 2002:a05:7301:1927:b0:372:2ed7:8f89 with SMTP id
 5a478bee46e88-3768701e997mr3845719eec.34.1794420621061; 
 Wed, 11 Nov 2026 10:10:21 -0800 (PST)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-375212e7d24sm29998658eec.22.2026.11.11.10.10.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 10:10:20 -0800 (PST)
Message-ID: <47529a98-e02d-4cfe-a8b5-8b3f44bda15c@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 10:10:18 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hw/arm/sbsa-ref.c: Increase SMMU space for Root
 registers
To: Jim MacArthur <jim.macarthur@linaro.org>,
 Gustavo Romero <gromero@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>
References: <20261016-jmac-smmu-root-registers-v1-0-e78e8879d347@linaro.org>
 <20261016-jmac-smmu-root-registers-v1-2-e78e8879d347@linaro.org>
 <dxrwkmt76n62imxwycc6j2mcjihdhqmhukzc3ypojuepkprzsp@dm4yqcp75wrt>
 <avSYUeEmFFBdVePq@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <avSYUeEmFFBdVePq@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfXyHE96trXEnos
 QIUU/zw8LaF9T1AM1dBVHwtgMmI1P4tq1dETgu4hbWeF1zAw6cp8nfka4eyoY6wta1HkwFd8Viz
 uIv71mA9xExkG8vMTGLvEr1JHPk5AAs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX+JhC1cVdgTZh
 DXVzx9huLPV0p0YSoyeX1QcPWe/TVDo6CFEchbWEdfCD6jOhxhfDMuoT3/YHo4BYscfWnIZTQvH
 JAHo/VOiqBy7dikX6gUURYl1lTGbzLEAfcp40x5nD1iDbANwT/w/8vpUhuCaksAaQ+/4CYAZbPI
 g/1NCG8QkCIPP/QkOMdkOnEEz/bPL214Uej/UQIxg/1Mn0ZbhyWOTRvb0atX0Te/KvbCStTPXQv
 E/U7ebYgbhMI6VRKJd7drx8g3QZsoN2CZPrFgf4cyiG/8372AROSeoAMmArPhJSTJatEiOJhvWW
 osI6Fmgxj6AGuVa5kVD84ApOImDOBYv0qXA1xbTBi7sw/25qcbsAPfROVuSzOwO8eyXB/vav+hT
 eXDCg3lw57ZqCfa+H4MKT7j2b2QqMow8b4wB5sH9CUFM7bqzyaB4RrfwkugbyjGj2k0gXIHVtQZ
 beiMqC4JazboCJOCP7g==
X-Proofpoint-GUID: ucqBLMVOhSUEnb-d19zYDIdnS16RGvNx
X-Proofpoint-ORIG-GUID: ucqBLMVOhSUEnb-d19zYDIdnS16RGvNx
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af4af8e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=HKE0CAtXTSkKgA3dMWYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110072
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/11/2026 8:31 AM, Jim MacArthur wrote:
> On Fri, Nov 06, 2026 at 11:21:12PM +0100, Gustavo Romero wrote:
>> Hi Jim,
>>
>> On Fri, Oct 16, 2026 at 10:40:52AM +0100, Jim MacArthur wrote:
>>> In our implementation, SMMU Root registers are directly after the
>>> non-optional SMMU registers. Realms registers will be added above the
>>> root registers later.
>>
>> nit: Root registers
> 
> Noted.
> 
>>
>>
>>>
>>> Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
>>> ---
>>>  hw/arm/sbsa-ref.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
>>> index 158b461eb4..0747f5ca9f 100644
>>> --- a/hw/arm/sbsa-ref.c
>>> +++ b/hw/arm/sbsa-ref.c
>>> @@ -129,7 +129,7 @@ static const MemMapEntry sbsa_ref_memmap[] = {
>>>      [SBSA_GPIO] =               { 0x60020000, 0x00001000 },
>>>      [SBSA_SECURE_UART] =        { 0x60030000, 0x00001000 },
>>>      [SBSA_SECURE_UART_MM] =     { 0x60040000, 0x00001000 },
>>> -    [SBSA_SMMU] =               { 0x60050000, 0x00020000 },
>>> +    [SBSA_SMMU] =               { 0x60050000, 0x00040000 },
>>
>> Why +0x20000 bytes here instead of +0x10000 bytes (1 x 64K page)?
> 
> Ultimately the plan is to add the Realm registers in here as well, and
> those have to be at a 128K-aligned offset from the SMMU base, so per the
> original plan they would have started at 0x40000. Now that you mention it
> though, it makes more sense to slot the Realm registers in at offset 0x20000
> and move the Root registers to 0x40000 when we do so - which means we still
> have space in the memory map for a second SMMU. So for now, I'll trim
> this back to +0x10000.
> 
>>
>> Most importantly, incresing the size of the SBSA_SMMU index is not enough, we
>> need to increase also the size of the "arm-smmuv3" container (memory region).
>>
>> With this change applied I still see:
>>
>> 0000000060050000-000000006006ffff (prio 0, i/o): arm-smmuv3
> 
> Thanks, I hadn't spotted that the actual allocation was specified separately;
> I'll fix that in the next version.
> 
>>
>> on (qemu) info mtree.
>>
>> 2 x 64K pages: Page 0 and Page 1. Rather we should see a range to fit 3 x 64K:
>>
>> 0000000060050000-000000006007ffff (prio 0, i/o): arm-smmuv3
>>
>> Another issue, afaics, is that the Root register page will be added to
>> every machine that uses the SMMUv3 device, right? Because we're not gating the
>> addition of Root registers based on the presence of RME.
>>
>> So I think we should add one boolean "x-root" property (flag) to the SMMUv3
>> device that will be used to increase the size of the "arm-smmuv3" if it's set
>> and let it by default set to "false".
>>
>> This "x-root" property would be set at the machine level, so via
>> object_property_set_bool() in create_smmu. For example:
>>
>> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
>> index 0747f5ca9f..36b0164510 100644
>> --- a/hw/arm/sbsa-ref.c
>> +++ b/hw/arm/sbsa-ref.c
>> @@ -630,6 +630,7 @@ static void create_smmu(const SBSAMachineState *sms, PCIBus *bus,
>>                               &error_abort);
>>      object_property_set_link(OBJECT(dev), "secure-memory", OBJECT(secure_sysmem),
>>                               &error_abort);
>> +    object_property_set_bool(OBJECT(dev), "x-root", true, &error_abort);
>>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
>>      for (i = 0; i < NUM_SMMU_IRQS; i++) {
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index 9d9bc2601b..9912fbf920 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -2267,6 +2267,7 @@ static void smmu_realize(DeviceState *d, Error **errp)
>>      SMMUv3Class *c = ARM_SMMUV3_GET_CLASS(s);
>>      SysBusDevice *dev = SYS_BUS_DEVICE(d);
>>      Error *local_err = NULL;
>> +    uint64_t size = SMMUV3_REGS_SIZE;
>>  
>>      if (!smmu_validate_property(s, errp)) {
>>          return;
>> @@ -2291,8 +2292,12 @@ static void smmu_realize(DeviceState *d, Error **errp)
>>  
>>      qemu_mutex_init(&s->mutex);
>>  
>> +    if (s->has_root) {
>> +        size += SMMUV3_ROOT_PAGE_SIZE;
>> +    }
>> +
>>      memory_region_init_io(&sys->iomem, OBJECT(s),
>> -                          &smmu_mem_ops, sys, TYPE_ARM_SMMUV3, 0x20000);
>> +                          &smmu_mem_ops, sys, TYPE_ARM_SMMUV3, size);
>>  
>>      sys->mrtypename = TYPE_SMMUV3_IOMMU_MEMORY_REGION;
>>  
>> @@ -2382,6 +2387,7 @@ static const Property smmuv3_properties[] = {
>>      /* Identifier used for ACPI IORT SMMUv3 (and DSDT for CMDQV) generation */
>>      DEFINE_PROP_UINT8("identifier", SMMUv3State, identifier, 0),
>>      DEFINE_PROP_BOOL("accel", SMMUv3State, accel, false),
>> +    DEFINE_PROP_BOOL("x-root", SMMUv3State, has_root, false),
>>      /* GPA of MSI doorbell, for SMMUv3 accel use. */
>>      DEFINE_PROP_UINT64("msi-gpa", SMMUv3State, msi_gpa, 0),
>>      /*
>> diff --git a/include/hw/arm/smmuv3-common.h b/include/hw/arm/smmuv3-common.h
>> index a538334066..5d1cb759c3 100644
>> --- a/include/hw/arm/smmuv3-common.h
>> +++ b/include/hw/arm/smmuv3-common.h
>> @@ -411,7 +411,10 @@ REG32(EVENTQ_IRQ_CFG2,     0xbc)
>>  
>>  #define A_IDREGS           0xfd0
>>  
>> -#define SMMU_ROOT_REG_START 0x20000
>> +#define SMMUV3_PAGE_SIZE        0x10000
>> +#define SMMUV3_REGS_SIZE        (2 * SMMUV3_PAGE_SIZE) /* Page 0 and Page 1 */
>> +#define SMMUV3_ROOT_REG_OFFSET  0x20000
>> +#define SMMUV3_ROOT_PAGE_SIZE   SMMUV3_PAGE_SIZE
>>  
>>  REG32(ROOT_IDR0,            0x0)
>>      FIELD(ROOT_IDR0, ROOT_IMPL,   0,  1)
>> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
>> index e2708e13fe..a8b354438c 100644
>> --- a/include/hw/arm/smmuv3.h
>> +++ b/include/hw/arm/smmuv3.h
>> @@ -92,6 +92,7 @@ struct SMMUv3State {
>>      OnOffAuto cmdqv;
>>  
>>      Notifier machine_done;
>> +    bool has_root;
>>      SMMUv3RootRegBank root;
>>  };
>>
>>
>> Cheers,
>> Gustavo
> 
> Thank you for doing this. The only complication is that we'll probably want
> an x-realms flag as well later, and if we do the rearrangement of the map
> as above then SMMUV3_ROOT_REG_OFFSET will have to be variable. I'll handle
> that when we get to the Realm part.
>

The biggest different with realms is the presence of GPC, for which the
GPT has to be configured correctly to allow accesses.
However, in TF-A, this is gated behind cpu support for realms, which
also require setting up GPT.

```
/* drivers/arm/smmu/smmu_v3.c */
	if (is_feat_rme_present()) {
		if ((mmio_read_32(smmu_base + SMMU_ROOT_IDR0) &
				  SMMU_ROOT_IDR0_ROOT_IMPL) == 0U) {
			WARN("Skip SMMU GPC configuration.\n");
		} else {
			uint64_t gpccr_el3 = read_gpccr_el3();
			uint64_t gptbr_el3 = read_gptbr_el3();

			/* SMMU_ROOT_GPT_BASE_CFG[16] is RES0. */
			gpccr_el3 &= ~(1UL << 16);
			mmio_write_32(smmu_base +SMMU_ROOT_GPT_BASE_CFG,
				      gpccr_el3);
			mmio_write_64(smmu_base + SMMU_ROOT_GPT_BASE,
				      gptbr_el3 << 12);
			mmio_setbits_32(smmu_base + SMMU_ROOT_CR0,
					SMMU_ROOT_CR0_GPCEN);
                }
        }
```

As a result, once both will enabled (root + realm), I think we can
enable both by default, as they will be automatically depend on cpu
support for realms. For now, root only would have to be false by default
though.

At the time, I could also run all our tests successfully, without having
to do any modification.

> Jim
> 

Regards,
Pierrick

