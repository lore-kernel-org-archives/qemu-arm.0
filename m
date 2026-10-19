Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA0ECCF2D6
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Oct 2026 10:12:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIkLQ-0004nB-7D; Mon, 19 Oct 2026 06:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xIkL7-0004dV-Aw
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 06:11:37 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xIkL5-0007l0-Nk
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 06:11:33 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69J8OwAo3256648
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 10:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6atYF+h7TRCvEyz4k2sRHO/Wsg+zADX5PrTHm6gKNuQ=; b=Gc6M3pC/kodF3E4O
 tCDMNMrEQyX4vCG17fj28JRlGWFgD4wdMjRt6TM3wYMJaesYNUaMe9Nxjk+zHM+U
 ra+X5nCarJoiNpIKyBs/FiKNvoMzBompeOIfq4qM8RGZM79pF7vnQPLYP36XmUUX
 frmWovjqxg5yZOHVsF5yLnl1HVm8gz8P8igfzdX2QJjwooTdE6tTWFqlYAMYAtYq
 QXtJGMmOUFN/66N7eq979cVxy/rynsUyiYw1oSGvY+Fi8kcwibn3B6YOqczdEWUE
 i3NCDKbnNrFp8r3spw5Whfe3PXCDnKi8llm8s+Q3p9tHEON2U3qyi4y3JIwhiXxr
 NHdMbg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3f8j6u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 10:11:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93e49a1d3b1so490640985a.2
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 03:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792404688; x=1793009488; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=6atYF+h7TRCvEyz4k2sRHO/Wsg+zADX5PrTHm6gKNuQ=;
 b=aUXu4ejlfFw5e5PLOE/5385PQqyya/aodvXmnqqRIyeYCPORR/UiXCbFW+/AEao4xX
 lOozapMtWUg674qQoMt5SIF8V9Fagw9lSB+SZ97zUGEMouQcIPmQucPqCxgxg6y4fDLn
 VjCT+iFC0zw7jX0gVlgEqAi3OsQ0fE2YxafeLESsN0bCv7T9Y9LGd/95EuvjxfGRxwVW
 udQEcyPdJMpdDrCQAKHmQzLTOwvHCYi6+BlPqEqfLA6Q37JAwLYUuCREGQ7oHjvI6O+J
 /Wjrg4ZifmjLbaLYE6vDAMjIEuk5RKVAx5jHM1t1zhZ/ppwYPCRIqRl8mS4jY2T6ieLO
 Yd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792404688; x=1793009488;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6atYF+h7TRCvEyz4k2sRHO/Wsg+zADX5PrTHm6gKNuQ=;
 b=LV9zEwFUlPCUvlUNPpow5O86FPCCJbatsiUqa9kDJy4zwdz9Of8OC8Ldx7bBGFZ51A
 jkuKZpc7Ea5r/lrFBN2RfqC9TLRFn6lMlSr7uLOh69GZgPMzd6l5EXn78HMVE2ZBa4Uo
 UhlPMkCYXSfrcjt/igxYTimDczgYevzim0PaHhfxSQAuY+WsHFfVYAVwnKsYuUzrJRz4
 NIxKI0BeKbljbSSZqRDKY83B/R/1/OIXXWcSKGV5n+LVvurMxrpKZOz/sZEVlDQEuo4W
 IZRD/DRiOUObcN0ywSDHvHT/WPviDd8LPFl6qpKP1DEHd4dIcBPnF8EHVyYVt5Acf/7k
 3fwQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByR/xx+1opFkgs/fKjsNrKA2PDNAVhTgdVoiB7EEctvZInJEI35negHBWEIF/qu605XyPnccslbvA==@nongnu.org
X-Gm-Message-State: AFq9FYLE2eaxO+YhiO4y6CMV5U6zfvj1fRk44wGknuYfHIk25WQ7oUcJ
 7PrdlgSa4OFlAScVRc7Q6CHtWi4t9gD1fjF3HJTVdSnoAuBr0R3it5H/2mgNnzvuAAEIQKdoHXM
 Pdq9NlzgdHOH8LqX7GlIzRJ7hWIA7bIWysBgdqDjv6PJs9gNLwRAtueU=
X-Gm-Gg: AYBFou1n5E1ZdbdWaDOmjlbBZYuN7qOMI3NxClj7rnLpwl+ZgWwodQzHN972kD1VaQx
 19ihA5EORMwkCUu8kG3lTBT5y/HoSoZy1uGuHgB/QtMOdJ5jWf2VpOhGzDcrRS9v0E+f/BMpJij
 qWW3+TqZ9qj/gBBc6uBKZenU+ypFAQey9VU/DFZMZJ9dXzPzvpt04wKerB8KYm/a8uZoGnPR17S
 8h1SP80KHt3q1uqou6IblUGHxpMdBXSHW6Yeu/PIyrIYrik/+UPF8zX3G1c5x5yTBDnUf4AU7O9
 GWfJDn40cx0wfpCILr1b2HvhuEZkdra6f61GHCRUlkgs+RJE+yNw52cF0+sAdQdkJ7WNyJqXLhZ
 vvY4A30Fi424RO+knEKG5tQ==
X-Received: by 2002:a05:620a:3955:b0:93e:c12c:f13d with SMTP id
 af79cd13be357-93f29df4e6cmr1208371085a.71.1792404688388; 
 Mon, 19 Oct 2026 03:11:28 -0700 (PDT)
X-Received: by 2002:a05:620a:3955:b0:93e:c12c:f13d with SMTP id
 af79cd13be357-93f29df4e6cmr1208367885a.71.1792404687954; 
 Mon, 19 Oct 2026 03:11:27 -0700 (PDT)
Received: from [10.251.42.127] ([212.136.9.21])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd510d60sm21494973f8f.58.2026.10.19.03.11.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2026 03:11:27 -0700 (PDT)
Message-ID: <271cde58-d72b-4dd4-b0c8-e3ceba7da342@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:11:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] hw/pci-host/aspeed_pcie: Fix global MSI setting during
 class initialization
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 "marcelomanzo@gmail.com" <marcelomanzo@gmail.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Kane Chen <kane_chen@aspeedtech.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>
References: <20261019024441.3554329-1-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261019024441.3554329-1-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Z0gZ-fpFEmIrGVkUST2_dt7s7k_naVGV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MCBTYWx0ZWRfX+qRB6uk7FOuS
 zwhcJ0rz9bHmG80F500lv3OvGEBwUXpGHKVKMoRr8RUe6JfmUuvbM4e/AW6TpuE/gVUPcdauHMI
 EFkdidKroKgz7G83jL7OUcQV6PttUjWv9mdu4xpV+ES0JDFbW+CpApGrYEsSsTDoUHfFNvuYL+7
 Nd5N1IryV7JsIkc80o3PBNpD5mhZvriTBc13A6B9CqAbfzgauc1hVBMSLsw/IQQt8RHxN3cMzOW
 5uOFanxJottP9CDpdjk6pFdMVSgb0YH+09DK7fuCdQTSNMNz4eb3iFjH9K0RfCOebSxck9nAQuh
 FP6ortcxCApIqIwui1ZKwUzI5CEOrq81PitV6HTr5P87gqTV+mHG0sabbmeVsc28X7BaVSgpvNi
 q0VjcfkVliAIbpzK3wEzPtHTovJJvm6DMhE4ESCpPOK4069gdXmpPjoalxl3nP6lHpStJaGd7UD
 I/pkl36tHWqsroYEMCg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MCBTYWx0ZWRfXyv77O+46TA9C
 z39ybHzgNwtd50hl95qzPMEinBDI2ZBv9C3uVgIFfP2ZAYY8/yYYwEUpDqD9ijDIhiKf7syebyY
 Kyc1carHdazHD87La4yEy6D7W2tL1K4=
X-Proofpoint-GUID: Z0gZ-fpFEmIrGVkUST2_dt7s7k_naVGV
X-Authority-Analysis: v=2.4 cv=OaANnRTY c=1 sm=1 tr=0 ts=6ad5ecd1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=/bviTfK1dmy+WGcHzWQ0gg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=V2NxCb60AAAA:8 a=G6qdztrpheCHo-GLH1MA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=3L6qF29SlnrayQqPM2jZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190040
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

On 2026-10-19 4:44, Jamin Lin wrote:
> Setting msi_nonbroken in class_init() affects all machine types,
> even when the ASPEED PCIe controller is not used.
> 
> Move msi_nonbroken to realize() to ensure it is only set when
> the ASPEED PCIe controller is realized.
> 
> Reported-by: Marcelo Manzo <marcelomanzo@gmail.com>
> Fixes: f002aa35f3205d55bbe4a68670ba19a6dcf1d6a8 ("hw/pci-host/aspeed: Add AST2600 PCIe config space and host bridge")

This commit mentions AST2600 but also enable that for AST2400/2500
and AST2700.

AST2700 wires it in commit ba6fb09048198a2952d731cd063f4307b137e7ec.

AST2400/2500 share hw/arm/aspeed_ast2400.c which has no PCIe host
bridge. Previous commits could have been better, but too late, OK.

Suggestion:

   The ASPEED PCIe class may be registered for machines that do not
   instantiate a PCIe root complex. Updating the global msi_nonbroken
   flag from class_init() therefore affects unrelated machines.

   Defer the update to the per-device realize handler, so the flag
   changes only when an ASPEED PCIe root complex is actually
   instantiated.

Fixes: f002aa35f3 ("hw/pci-host/aspeed: Add AST2600 PCIe host bridge")
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/pci-host/aspeed_pcie.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

