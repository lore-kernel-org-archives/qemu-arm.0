Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56BBC5DF6D
	for <qemu-arm@archiver.kernel.org>; Sun, 16 Aug 2026 14:55:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvcGh-0005mG-2l; Sun, 16 Aug 2026 10:55:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvcGf-0005m7-SM
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 10:55:21 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvcGe-0002sO-5C
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 10:55:21 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67GDkspN4143034
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 14:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uTC43qbSo69kYEW5XM8mPrtlwBF7sPekkWgrT/RX2Gc=; b=Ca6/RT6ylvwK7ahB
 J3+v4GS2A6Qnseu4aIjGYo2+6/Ce/C8hKZr/xP7ofjJV1ejrCUVSlWkDwrjX80r2
 vy1I+/eFz3Dl8wPNpAb5WRMT6HK0JKkTNm8CgLvwP7qOPYyGepbgUfj12CZ1IcxF
 patwpSl1Gwv2VOAkmDOVuSgZqrb+Dw+QLAbsSLg4Wc91uFx1ih+7lpjs3ho09tG2
 NLWeeQCurfeu/Z+Yn/GytrljEtxGipjYlh0ph75cnXW8fYpTbJNFYqsRctXV0OYd
 EWxqdQOb463v2FGA5huphthVLQGZf2e5bW5vMCFDHT0aj6A+Pdxal9NQMoELhVmv
 jRVg4Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghwkkr0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 14:55:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51c1d7886cdso51161421cf.1
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 07:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786892118; x=1787496918; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=uTC43qbSo69kYEW5XM8mPrtlwBF7sPekkWgrT/RX2Gc=;
 b=fe/GACSNJw0MX8UrxMdhuJRIsuJMPpmeeo42lt7xfTkLneNKnndCggfq8xff4hN/mQ
 wRpGU05nmDLmvWcvgLdLIKPaezlaVZmgEsZ3uuOWlcYmkrjR1r2taxQIuVzfm7vdRMWj
 jRVmAG+J3ocqYkbOxdLsTqZuPJiYp9m63mTFpc1TR5wATHyM/WBi2ChuLWdwP/82Nvu/
 0qU6pMKp4VmLBxNUS7ivRxN0JMz0fBhQaTA2ns1CC4U2jX01ZQvA5F3a7SfORhsodoAU
 cff82ly4wSVeS1RQACSxh+F2qd6O43YuvSPR9Md8iEQhkAH6EgtxxmA3tWYdohpfxW34
 2/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786892118; x=1787496918;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=uTC43qbSo69kYEW5XM8mPrtlwBF7sPekkWgrT/RX2Gc=;
 b=Xyaew6AeuF54gFS1WbS645/N+Njk3D2/vWwoM4ed2EkaXldCE+rv4VTUt3Nvny5j6j
 OBtWYl/9Ha8S7/B84dGe41sgjwylgwg1sd5mERr9ZzlMvzCjglX2ipmuU/mgIQ+gePBD
 4xMojgHzJjknhwdYNmLtKGpUB8iLGClfRxSYPhzNs2Auvb3xZc9nMWcmN11JmpoeoF33
 kJWsJ22x3Ws4rTjK082dqXJHZ5Igy9omiNNxn6wPIRM/TLGLI6XXxlzV4KCQv80lYeYc
 wLKmiyRUf6inF+ABrxEAb9tn1uhebtMUYvPN583yMKbziQvKQd01Z/oLIoxKRG3AD4lx
 DIbA==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro3VshQtH5wYErpg+mtceWgO/G5diCqXDhENiJnGnUMp7ZaHidiqc/EchInrb3meDyLv/XrjQG23w==@nongnu.org
X-Gm-Message-State: AOJu0YyQrQR+rFuaWi16KEeS0QgNNtaUvAMknoYOxWGGJ9b/ELXV4X4h
 7Wcl28Ds03oOa27Mw8cwOHLMJm8+HzyzBxCafOmHDRGJd88UNVXGSC1kwfQ/dandKW4WpwrOl8Y
 8c2JuT///j+ryN6KTNRJetfkpeU/TwtlXORWkoZbFubz7bYIdzi/Th8w+0dy4E/Y=
X-Gm-Gg: AR+sD13fGbyssJcrcHy3EfZstBD4+4OMk/+W1LE9caJdo62fHHSc31rJmXkj/z5Po1u
 mcKUZvRBAaWwuqWoBBYdd5w48pr/XaB5XpYsm7ukXozlYDBBDULCFWewJeOZsMSnrIf/+BmASQR
 8I4NFKNC9IkcscLLr6JQ2vkVT2mFPVBznTsmMXFXk3VGMDThGICxAESWR13sqPa3YRZ2k/y0Uyr
 1rdhZj/avT7HxK2ztnD+80nsdhasOH4ckDBXzPOdMGb1jCLkWGEv8QNM16/xgCXiZ8mja/ArsJc
 9CKkzc7o/NdKmDbcv6PgPEyIapFkx3gc9Jx7a4CN7lXVhMkmEQhr0pJnCSnRo33OI425pu8t6eG
 kWRzZhvzmsKx/D5qc+qcGvOxlcAr2k4ozQ+w=
X-Received: by 2002:a05:622a:2446:b0:51b:ee11:e71e with SMTP id
 d75a77b69052e-52d852fd473mr224734131cf.1.1786892117857; 
 Sun, 16 Aug 2026 07:55:17 -0700 (PDT)
X-Received: by 2002:a05:622a:2446:b0:51b:ee11:e71e with SMTP id
 d75a77b69052e-52d852fd473mr224733791cf.1.1786892117479; 
 Sun, 16 Aug 2026 07:55:17 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49996109652sm71478465e9.4.2026.08.16.07.55.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 07:55:16 -0700 (PDT)
Message-ID: <d5204740-8f52-4e82-a9c4-a739b528e9cd@oss.qualcomm.com>
Date: Sun, 16 Aug 2026 16:55:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/20] hw/arm: aspeed_ast27x0-fc: Store boot info in
 the machine state
Content-Language: en-US
To: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 qemu-arm@nongnu.org
References: <20260816131300.51799-1-bin.meng@processmission.com>
 <20260816131300.51799-3-bin.meng@processmission.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260816131300.51799-3-bin.meng@processmission.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FMo_8bT-zyNOLKIVRY__-S3o3YcG2gcR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDExOSBTYWx0ZWRfX528x2IR1GdnE
 OnNOKzSUN9G/n1YUOhRwsNgMt6Ne+L/G2HBCQDfDGa/y7bmzS6kK1MJlI/DxjfvV4aoK3fJdRI3
 XeoZttCsm42P4Q5btB3/aH/F68WFBBinrYEbHxWrSOLKie1+p13FaKsDRlFER/ZKscmjC4xVsET
 g8wNTVxZZbOqYC6EGITJv9xlOBQ1wPl8iK9fUHmxysSAEnUKBIjsgUWSAmabEHEwszQC51KTuYz
 gvv5Z+EszULxWVhO5nvNuWPkklYU08ITCEete9JwS8/Me6j1Dl3LcaCoQYLdXWN8lBVITAHKc6c
 3w+xjZs0yaM2CvtFGJKW5mFM8d1p/IHOza7C5qchApFAtQM+IWkcIbXVhu8LCN20Tu5AZoIuijC
 VttWd2psrzr2PKyRqdRDbqPFGCHefRKjalpwNcLUBDs7sDAuaTi5fWuF8Nh4isJ/YZMNccaIDjo
 +UX4Uv3OY1MNdUTvQnw==
X-Proofpoint-GUID: FMo_8bT-zyNOLKIVRY__-S3o3YcG2gcR
X-Authority-Analysis: v=2.4 cv=DdknbPtW c=1 sm=1 tr=0 ts=6a81cf56 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=FRSEYCzRAAAA:8 a=EUspDBNiAAAA:8 a=P5mgNStSnDlmL_58Bq4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDExOSBTYWx0ZWRfX0Vtol/zJh8H3
 2XHZZ2efHvjqqm35LY0Eg375rN3Fu1mGKDFVlBLpFCa2RPCBD6sue3LzU5PGUkbLC3U9GOnmML4
 ddZ+3UU+G6yUOPDew9SoY6HnFxVDLTU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608160119
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

On 16/8/26 15:12, Bin Meng wrote:
> arm_load_kernel() keeps a pointer to the boot info struct for the
> lifetime of the VM, so the struct logically belongs to the machine
> rather than to a file scoped static object.
> 
> Move the boot info into the existing Ast2700FCState.
> 
> As in the xlnx-zcu102 and raspi machines, the boot info belongs to
> the machine rather than to a static object:
> 
> 4d1ac883a7 ("hw/arm: xlnx-zcu102: Move arm_boot_info into XlnxZCU102")
> 0f15c6e338 ("hw/arm/raspi: Move arm_boot_info structure to RaspiMachineState")
> 
> Signed-off-by: Bin Meng <bin.meng@processmission.com>
> ---
> 
>   hw/arm/aspeed_ast27x0-fc.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

