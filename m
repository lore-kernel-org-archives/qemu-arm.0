Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F09CD98C7
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 11:55:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZ5uW-0000bo-4g; Mon, 15 Jun 2026 07:55:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wZ5uU-0000Zk-Si
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 07:55:22 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wZ5uT-0007RT-Ag
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 07:55:22 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65FAoN5r3956028
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 11:55:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Hu70N4SBODulejlwkPLWQIUY/OZNAOuwCFqDKKbFmOM=; b=XJcHzaGAohFYuP6r
 20WpnqR5jbwq+K+TbD8QtmdFgiC2qW9Im4jc3lIYClloN5xhXCDgkOhslPbn5ZpP
 ZLWjDsuKr38ZY5h+JVbkYm6TcfwYhNTEIZpNz1l79YmnMs9R0g+WzD3eMyn6GDiI
 NQ2EyO4zKsGXHTjBjsIY1eiZsOJrBsYo7lIJstqB6EEaXlnR9ESVTgLT87igO52l
 MCiurjIyXsbBM+O79Idt/1ZrFIi0PaUedscGbAKBMNhlCkBW/sb3fj/mqOOsqoSb
 btgWzxha6PsIhwLyu6Xy9JXLwVyyzRs+SQmFOnk2CP+s88GAGs9u1FrTiaCwh7R9
 s6gNmQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter00h25-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 11:55:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-918622c3c7bso460213885a.3
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 04:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781524519; x=1782129319; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hu70N4SBODulejlwkPLWQIUY/OZNAOuwCFqDKKbFmOM=;
 b=O4bRPTD1yIe7+g/0pjgkS8B/6DC/0LeZbOU8CyfulXIqZo9jkYUTy9EbP5yYOvK2Yf
 hHvQqoBT0iMlBh0lH/9ttjdgNqeDj46/uYwReFjmzGihwPxMAb0vvpc56Fv9igHVA0sh
 DPSRdb+6xmaiKGvzYWRtHNwB/WDr6rroHkVDhL5oKSuTzFOlYtlvv2fTsRzTNzk7QpPP
 LCbCXkXsCFXM8BvICV2a0halRUB/SRZHMFyEYgFe7IG6gLSDrj6ePESAI/JYg+QVdWtV
 IBi4GcEi4E4pBm4WRkPmxiDKKy9++S7KTQuCoXXAD6DUs3sZP3MYWZ38xKw+1zrXnJK0
 Bt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781524519; x=1782129319;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hu70N4SBODulejlwkPLWQIUY/OZNAOuwCFqDKKbFmOM=;
 b=UvaCSbhJq3lmXXAN/eXU+QR9cS0M1vqDy4xw5iHmhVhmy1/xeaRje2ZdZgmrE+Ilnf
 RLDSfSoLImYnqAKexuBHfVHhSwud3foE59IRG/WK9oiG55JFzvecd5FURMaF1y+a6paL
 HdAuocROlkV4lTwHPzsxKtAToEW51q86qJeSUJLp5Bj+4x1hnqJkeBCOzgyO6YQFY8oN
 luZwBWldpQ2ETI3c5sMVSboYkDfCWO9JNPPMqGCQq4be948pqJJOD9iPG5sefZZIGiaZ
 ERYOk6m75es+IZ769DC7tH0c30OI1bAo6wqBpsWFt7D4pGoRB8SDp/7fSCMFoj+JgBA2
 B8Dw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+eb5z1gHyZeUVbLqdZheUrqeq60XE9ooG4sUZW4THa1B2KZ7qcLDZKuCXO+Inv2UUgvdi0043CuA==@nongnu.org
X-Gm-Message-State: AOJu0YwwlgmJCvWw9qliWmDEPvWEemWtZIX2+Y21QBnm33wFQtenDb0E
 m9B7RLtAXUuDDwtFA7OACnY+7+FKoFV9nEEUlRSG6IJPwMqaMSpVzFpRnfFW+O9SIE3/NzrWkRc
 Jaz64VLHhFYqHiVU+qaTcEUpLFtj0Cpv6ooBwRwKF9+At6Xuhk3xzDK0=
X-Gm-Gg: Acq92OF0dPrSHsbBOE/bXt+8aC7+8T/Kq/JB0Jr3H59Cg96YcI2131EkVlJcTCGgPo3
 RPjZmpDyoSTckHW6gNp6XuosfNPf2850GVxAmwErrwnmADSejaqn1CwybMsueiRVvQ9vhFDkfgd
 zvcqMyvKyVCi8W0Hd04VsbAnXsOAmoy0gUApo73VtllzNkf93ZoneoMlNFCYd8+gauHUvN8ITnw
 ceaE4/Ji0c8lYq57dWG5yqIHgW3TeZ4ykjHzHLz2PFUj8jEOHFcqqbonfFyYGp6+tsEaaY68Fan
 +FadViMa4geCbS9mq4ubXJUFHLdgttFf7Ql/YDuKWVXctn1MtL3WU49f9oyMEdI5QzTiGTPhMt0
 WdbMaXt7o63tqDrcJXcwbaBi8yD5I6Ee4E6bx6pJXQDz3qD7VxiV/XakGXDt+MZAqDRVY4hnK
X-Received: by 2002:a05:620a:6c0c:b0:915:9984:5781 with SMTP id
 af79cd13be357-917f196806bmr1664291485a.51.1781524518341; 
 Mon, 15 Jun 2026 04:55:18 -0700 (PDT)
X-Received: by 2002:a05:620a:6c0c:b0:915:9984:5781 with SMTP id
 af79cd13be357-917f196806bmr1664286585a.51.1781524517916; 
 Mon, 15 Jun 2026 04:55:17 -0700 (PDT)
Received: from [192.168.69.214] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bfdb4420854sm461090266b.7.2026.06.15.04.55.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 04:55:17 -0700 (PDT)
Message-ID: <20f2547c-7787-4fc7-b372-4b93a9a64728@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 13:55:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] target/arm: GICv5 cpuif: Tag ICC_PPI_PRIORITYR<n>
 regs as ARM_CP_NO_RAW
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260615105029.2898872-1-peter.maydell@linaro.org>
 <20260615105029.2898872-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260615105029.2898872-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -qJnu2tXDHvhxlbUXT0vkPLWhSuzs8G2
X-Proofpoint-GUID: -qJnu2tXDHvhxlbUXT0vkPLWhSuzs8G2
X-Authority-Analysis: v=2.4 cv=UPzt2ify c=1 sm=1 tr=0 ts=6a2fe827 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=h4B_N9_jLeHJ1tJJC-YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEyNiBTYWx0ZWRfX42Us81pi/w1W
 9/ROww98nJ1jTknM4ftmpTtcR5EB99JhYSOMIH9F/5j4NrONfnMtJ/v/mqHi/I5z+MzY2ZDWLLV
 rPGpMlnP6Ofe2RxjXljNTMv8ozzBEBkEmk1O3NtWilSB88zSJOXLO6H84a8KL7HnCebozOSUZLU
 szr/+cahwuust904d+zMIs9tPOZ37sSxgS02w8gWFshb4KGLVR78miVHe0hphCBmo/KxxcbiWLq
 s4GSq7x+LfPeYRakbKYsnuxdtMxH9XyhxZZA5kC356edD9ixCCX9+eGIVTw+DG5a43IxWSU/Dwl
 d/YMZ1uP35RKgAj++6Y+SQvuSQIB6/wnUkgJ2iAEqCTxQAsi6yJnilIqNbIAcct3fjqmk2p3eTb
 y8l/WEWoTfTfa/9JVH3bEzbshPW71Cd7VLTxEslyzAbzGaxKTgcTp9KI+msAyWHTaTreOvS02cn
 18+hqwN/as4RpgfwXQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEyNiBTYWx0ZWRfXzarUrYmjdROP
 40swpN7oTQvY+yAUfhY7KtHcMxYOTVFqLAJl3jCWCK9VVEpL9zAMS7sXTRNnikEvabUp/D8iwR2
 QRC+7+8UCsBo4j2R/doKJkvnfDBJ0wY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150126
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 15/6/26 12:50, Peter Maydell wrote:
> The GICv5 system registers are all tagged with ARM_CP_NO_RAW, because
> we don't want them to use the standard mechanisms for migration or
> KVM state synchronization.  (GICv5 handling of both migration and KVM
> support is a "will be implemented later" feature.) We missed this tag
> on the ICC_PPI_PRIORITYR<n>_EL1 registers; add it.
> 
> Fixes: ef540c1d301 ("target/arm: GICv5 cpuif: Implement PPI priority registers")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/gicv5-cpuif.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

