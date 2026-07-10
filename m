Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C596C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 22:19:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiJZH-0004xz-5d; Fri, 10 Jul 2026 18:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJZE-0004ws-BP
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 18:19:32 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJZA-0005FA-Gl
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 18:19:32 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AK3RpQ1697270
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 22:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9FP4t3RBgLTor+Cjcn8Dnut9fM4NzStxUlgVMrdmBvc=; b=pAZnoo9j4f/Bi6pF
 3fw6dD/VrC6Q2Kqhn25Fvdp86mqRsoHT21HASx5Zqs7sd9CbqJiOrRvKE2+ib07U
 2tV/Vv7xL9xdAZ+ru6aSlf3ozoxWEzjEZd5FHLbAocEFhxCAXPeyJ4YFAdn2q7MC
 AQcaZ1k4ostsZKLw0tai9IHzhp87toAb78QTTsllOTm+Yl3bUEeL1QQFgb5p3T3f
 HV6PA2gnTQTXkyYrVqDkCO5lkVWlZSa6MZr2BlmsiEgv0ZUjdBaIn1LZq2szjgnT
 j25J75FuFDW6/G9ksHde+9EHLjFLE2TZFNJBGGRW74hu1Y9elx49uC67/pCFAQHE
 WFT0+g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5djkp2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 22:19:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c12e43b98so18399831cf.1
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 15:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783721965; x=1784326765; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=9FP4t3RBgLTor+Cjcn8Dnut9fM4NzStxUlgVMrdmBvc=;
 b=ENTLSyvvaj/2NewZSv6IfSTyvYwlsnHKHh5SjAfH0hOeKTLpcHSGt1CY/LrDwRBWoC
 AtItikerBrHO2q8Yuq1ayF5ydEXAfRaR9UyGvl31wCwMVXEgxgul4eMiY/AM9p3NnZDU
 Z4SU+4qpjSoqARAgfbnuoyFtmSSGL5EA7iVK3Iw747+RA1vxNKUwM0jtPOijdeYkWVqn
 GznLuRAsN9dHWqjnPVvZ4pxXusx1/yn9pbGHp49zsoSTSV08727YM8lIYoInbU6crxOd
 25/7sXiEsfphvE37iz05eIKuhkQwZ9SajVBIqOfFPTzVEmFWnuFuTyrWSUMuoqZzq5Yj
 tDRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783721965; x=1784326765;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9FP4t3RBgLTor+Cjcn8Dnut9fM4NzStxUlgVMrdmBvc=;
 b=VJXfb0h0sWmABXwrFOG3bwsp8O3f6vkn7nEMfEwvEo/N1+Hsp1WrfFlPdcI0IqVKvE
 tSgVVi7+Sv4KCyAu6ZXny/xz6VK32Tyc6FiUtvw32MKWbR5iHy77UVMVU7blybGfwlwT
 EFpppzxKD6mw6SBwZVIGFzHhuyokzAQ47+xm0ziZTLfMRhRwMEmHZnFRjRfVo2Y0CYfF
 8kjA3IxmiYiLjYxnBha9E+bnL6BfwZYJnjdhsi0XNYzOiQJRTxn2vhJkYqDQIF6y025l
 FPNLJKlgjXfwKTx+nLLrMNlnQvleyKxXp6NthvC3cHuEwOsrexnqbSgNzjxxyJ4L0emo
 qaUg==
X-Gm-Message-State: AOJu0Yy1zUJhvd+f+ptC/IPmaP+nYLO9jGfdS18XL9BqZwSfyEqaWYFY
 i0HN/t8AqOZnCEoiCBpmN4tCMYV792T7X06Q9yPwtGJ3dMxQ3g7uQZ12c7U2iFeYtD9rOLP3uFl
 Uye9c66XKDa4m2JGFFlqFxZEN56/509bmMYj/3FHlL0cycm7fXjYmsYk=
X-Gm-Gg: AfdE7clzXcIcRRNxMjIy5GB5gaWdXlhd1hhK3dOSzrZVKjGBD1jr8aOY2oX9bx8KZah
 jUKYp0Mu4D9rO3DQh1ZjsB2u19JKeqsLraHzqxnwovMSRj0GYoJYt3yftyO7MKsDEch+j/gDSBQ
 Tja+71r8HvkMTTiqugW98NfZE8axk60fhsecFpPYw9lFPjers96YQUpV5ghrLzL3VgSB1z1aY4V
 W+uYwzaJaWwlL7OYedKMM79jQJ0xJi/0hYTp0+uX1F19UxCWZIaTkc/l0P9cfh6dV1Id67/7s34
 zv+Zss/FFFqaZ8fsSrffvRNQu4kHJ3lqDoEsgN8OxgkwvP08Sbj7U32sarUHslbcqpn55yZaP1a
 EOEIveH1ZNcpzTgpL2CkZyvArx2c0KqRyesI2skjTSsPPTqCyCVU/CSH/7D6htw==
X-Received: by 2002:a05:622a:1928:b0:51c:7b13:62f3 with SMTP id
 d75a77b69052e-51cbf30dcfbmr8099591cf.73.1783721965159; 
 Fri, 10 Jul 2026 15:19:25 -0700 (PDT)
X-Received: by 2002:a05:622a:1928:b0:51c:7b13:62f3 with SMTP id
 d75a77b69052e-51cbf30dcfbmr8099341cf.73.1783721964748; 
 Fri, 10 Jul 2026 15:19:24 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9e4d83bdsm63071820f8f.13.2026.07.10.15.19.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 15:19:24 -0700 (PDT)
Message-ID: <a0210af0-f92b-4939-8fb9-90672d156b82@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 00:19:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-11.1 v3 48/51] target/arm: Be more defensive for
 invalid tlbi_aa64_get_range
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, qemu-stable@nongnu.org
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-49-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710205401.836304-49-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIyNCBTYWx0ZWRfX94L3YKYDSB36
 /bUcejT1CcVyqmOPC6lRePHaIX+NeDtnyu8C4eVwLXEauVFxCPaFZvGd74nOFgdgf8my4egik7U
 opLyqANxLoDwsMKXxg8WPQu+NCxGzBY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIyNCBTYWx0ZWRfXxuyeH9wTOh2v
 g03YIc79hhdTD4HGPivfY55TnMnfTbyiVvvdpl9OOP3iFKByVYaMVnFmgFlorOqx7julN+g4+42
 ra6PLwfDTclQbNCl3pGT+ECBedrOAHg3w+tL5+SL+l+H8hiIIAapN+a4+UKnXg5I33kH2GmlrMZ
 O/F0abfZwp7D88Y7yZnj1psDRQT8xXEDBHVE09JlqVLiGPdPqWYPeok9TZsiBf/mNpdhUC1nLep
 iETOwGnQXVvCd3GVsdEqB7XJTesBz5DusjxqQoz7utUKTxtpRINtSBzdTRoTeK4rhJ1XFb/10t9
 BePe0DAAI0qZVSQoqc/kmDz48+TO9SV7OYY7Nf315jHTvMu4AMtWJiQw3tker/ek2oX10cT8yF+
 Z0DWsb8/FgP7xd9EscUY6M7cJNrhvjZrPxwpI1PMfZ3Ee6APCMZYF0HZIKqhS9hwoAoXVGMSCOq
 FNNV4WdEwJOorvlDj1Q==
X-Proofpoint-GUID: b5OnYqKKUO0GG8-6urEUj2mB1b9hEHba
X-Proofpoint-ORIG-GUID: b5OnYqKKUO0GG8-6urEUj2mB1b9hEHba
X-Authority-Analysis: v=2.4 cv=M/x97Sws c=1 sm=1 tr=0 ts=6a516fee cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=69wJf7TsAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VM2QREBHC_YskJq0tasA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=Fg1AiH1G6rFz08G2ETeA:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100224
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 10/7/26 22:53, Richard Henderson wrote:
> It's possible to program TCR_ELx with an invalid granule size,
> which could match passing an invalid granule size to TLBI RVA,
> which would then fall through to assert in arm_granule_bits.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: 3c003f7029e ("target/arm: Use ARMGranuleSize in ARMVAParameters")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/tlb-insns.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/tcg/tlb-insns.c b/target/arm/tcg/tlb-insns.c
> index 1a0a332583..b24eb57788 100644
> --- a/target/arm/tcg/tlb-insns.c
> +++ b/target/arm/tcg/tlb-insns.c
> @@ -854,7 +854,7 @@ static TLBIRange tlbi_aa64_get_range(CPUARMState *env, ARMMMUIdx mmuidx,
>       gran = tlbi_range_tg_to_gran_size(page_size_granule);
>   
>       /* The granule encoded in value must match the granule in use. */
> -    if (gran != param.gran) {
> +    if (gran != param.gran || gran == GranInvalid) {
>           qemu_log_mask(LOG_GUEST_ERROR, "Invalid tlbi page size granule %d\n",
>                         page_size_granule);
>           return ret;

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


