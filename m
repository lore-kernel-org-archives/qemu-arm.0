Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6A5C4451B
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Jul 2026 08:30:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wljOM-0000SS-GU; Mon, 20 Jul 2026 04:30:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wljOA-0000OR-5L
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 04:30:16 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wljO8-0002GR-1R
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 04:30:13 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66K76veN1896150
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 08:30:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4GbL/Bi34jpIGCIi4pSoC4Z5XYmH9HUQfSWr5eLg/tU=; b=ScQQnBNI1qo0seSB
 Lv0CMHGRP/eHIbEmCTv7A3uScu2CQOlJVO05VXhtAROowwtFcHQW6gQxAxc8gh+L
 8IoJ/cwmOaMQl2hf+y/l49PP545KPn1mp5bVQA8329WtuhAb5RE36C1ExA8ibLIN
 w348cKzTKEvFjvinoDIX7ARGKl5snKJE6vMGJhkmURa//4J3NfOMvcJz1rac823w
 wdjlTbz3b3VY+DxZpq5kguzuyEKeJrYiLCsBrVdu+iLaU2YcaLABVgiDOPQk9XVp
 aPoJcWA7LoylpUgKx8k9U6P4oauMEryNX7g+L1gbBBV56Ktc+JcJa26+gd09oewD
 SFXA1Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhf0kran1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 08:30:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51a8db414c7so164263821cf.0
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 01:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784536210; x=1785141010; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=4GbL/Bi34jpIGCIi4pSoC4Z5XYmH9HUQfSWr5eLg/tU=;
 b=Q5U9VioJsTNFVdo950UFnBfktNrO06VRZCKYIWclTnL6EDpMZy1dAwcInXpegUTm6L
 /uyzXOJolw/CmeSEgeAwo/mJ+D0V5oSp+yE3xombN0C53E4GN+MHElfyEb0FRcD0NLTS
 +woE6GhF1GY1bQFGLebh2Pq213vKoYCiOGU++a7KtcTccxBbe5dYJl/UOHWUFxWfS7Hh
 VaVX4w7jcgxiLY55kK0YvoTUDwE7Kz7D59uolH5GMtC9GRWW2OGihC4Puo0HFrnCB8o/
 RoHzcMzi8l56eiuaaABkKwR1COi+MZAalWGTlmfsV8Vtt4Fi0R362TEaAwssj1an11zr
 IrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784536210; x=1785141010;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4GbL/Bi34jpIGCIi4pSoC4Z5XYmH9HUQfSWr5eLg/tU=;
 b=hzqlaf3h44YQJs8xSnZ1W4jo62siRUh+JASLEaqI812qBx1NSwEgMnM8hx6GVld9C5
 MPTHuGVHPv4ltdSEDD9O/CCcb/MGF0iYjf9TLuNIZ9kNvPl1JaaTSETz5D3DvevcIgvQ
 sQDL21Ucr9NWizhtv7MhLNEn0p3YzTa/2D8dYz3v3MOCok2lp3UC37rQPOenTvNbsRX+
 ifZPEgahg4WBS0LqYgP2VEzWJEbXB7C4iXLQNlDUztM52h63bMDgwt3jnwbt5rQe0l6o
 kPdBfxEp6VoPi2P2Vfe98I2MqZhmm/i3RQrtQ5IClOP+gtPliKlIiiRnZCUdksvjB6JK
 Wnfg==
X-Gm-Message-State: AOJu0YyxHp2SC4CBBRKuCEvrnf4KgTfux0oPeqO4Hmak7WT0jvqAn8P7
 KaR7XCjAUJpbWgEy40AYDKECWSlp1Ng/MXFrU2fjdpT3kgycQ/Yu6O7NDQg6LJHuDz6ZnW/KbiI
 v4+eyAQ3SxmZgjEnNlXkZU9QU6fsrY2OX7Y4Q17mIs7DS0XNHZ7PhT6A=
X-Gm-Gg: AfdE7cmxrY+7QZqc9tpMqg9fzfeUc2KiC5ViKmc3VKd0Wo4OyZZavsrzXGl47I3h6YN
 /4l8TJZygV2r8M+pY9Y+f0ikIb/+GTcpo4VSGK+NxPeNlY+5S5163f6+/qFHRz4MNwh/QrKxLaH
 tTpHsXBKDBpEdRa0YhhPglA50Oz0Y7zzhW1e0sMvmuMZk82cMCw3QnOG5ssbq3lw71OdL4H8ePB
 GblIeyjdKlcF+CmaC65uknwlguSlm2QUryyj2ab/2+O6Iv6JziuB/clGZgp9EEfu6kMgluaC1dc
 1CYU8E+8qCd1vc5SpovXQlYTbCi9lKPiJOwR/Yllcac8hzEqiNdvqCQdivwuAdXlpidFo2Ae3iV
 JjWbbgULoNVFGDHLNRWCV82ZjpEa6X+jf+vfV6jmbFZWSwOpvxDE=
X-Received: by 2002:a05:622a:22a4:b0:517:57f5:e21a with SMTP id
 d75a77b69052e-5213e7825a3mr125502671cf.41.1784536210518; 
 Mon, 20 Jul 2026 01:30:10 -0700 (PDT)
X-Received: by 2002:a05:622a:22a4:b0:517:57f5:e21a with SMTP id
 d75a77b69052e-5213e7825a3mr125502271cf.41.1784536210011; 
 Mon, 20 Jul 2026 01:30:10 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63eddd1csm27884886f8f.29.2026.07.20.01.30.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 01:30:09 -0700 (PDT)
Message-ID: <6c43e974-105d-4f87-9a85-4e6e2905b52f@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:30:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/17] target/arm: Simplify invalid page test in
 allocation_tag_mem_internal
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260717232306.378988-1-richard.henderson@linaro.org>
 <20260717232306.378988-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260717232306.378988-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JDr1xhF0GHfVMca9A35LScFvx8bkfAoJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MyBTYWx0ZWRfX9Lzm6pHnciWy
 m8NR/YxqpG8/d4rOE68GD77ZpwgQoa/Vf0Edd92Q6Fn6Zz7mk87eVml2e5ApWwfDOsypZTc01kP
 Eem49ttmdeeF7jXiRXuCB+G25xYCKMQ=
X-Authority-Analysis: v=2.4 cv=G58s1dk5 c=1 sm=1 tr=0 ts=6a5ddc93 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=F4whdlzREtsA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MyBTYWx0ZWRfXzzB7k55IcyLY
 WSoPVo3Gl2Rj2UIbDDPp/CA2LBGRRv9pg5KKKwR45+4nOB4KBHn3dQE8IxBvZK6gczAomMS4N23
 Bmusr95Rj1t0iXTDiH5pZJMYWxSUYDOW90zwOnxy+C8FTaxuLF8qJ7vb9va195Vg/ifAvIegJ3G
 dE6kgp+YaFkRRvIpBDSyMWxV8ONOec+Uhn6h7/TLhQuwMJSL7FtRli0xw8Ahsn1qKEzSG4zyN8U
 bOu3zxBeH2c4aeerBSrhDjcXKiHzamjT0upcXceVIvSDN7/azn+nihqpiytjfWx+7dlotHY4LTq
 z+Vhhkm0bxMNXynBiSZ9SCk608GL7cCPF+/kZAMG2Vd7GM9OhxUEDkCFYznNEvMMxWkYJ8TZgJt
 RV+TjEr25IdYABVWcshGySG7bLp5iFrSB75AS1MkuCE0tLlyTIelaKETa/MyASsT92XmeTqPWM+
 8N6I22cWJ+7e+ME1SZA==
X-Proofpoint-GUID: JDr1xhF0GHfVMca9A35LScFvx8bkfAoJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200093
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 18/7/26 01:22, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/mte_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

