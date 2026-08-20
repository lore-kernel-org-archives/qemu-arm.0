Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6475C5DF87
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 10:55:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx0QY-0005FD-LG; Thu, 20 Aug 2026 06:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0QX-0005EI-8I
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 06:55:17 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0QV-0007Mg-P0
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 06:55:17 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67K8tGUM3515446
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 10:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BpR73BTf1YtpAr3ZE6EiP23yFQwK2M+fAv/L6W7BmRU=; b=jJ9QXHW3LYIlgFcU
 1tCgx4kuUwAEa/V5ZrcUeaRGGu3UouBeXYmhYH7/Z2xZ+OK977RA39/Ja2hJQwGG
 vgrw7w2e166/00Pr/7/OuXgETei5N7ntFz6lrCn/sZZ+BohNsW8S9YZvMGjJ7aTq
 RGg+p2rZv8Ou+oGOvYhQR1/qaGgts0ork7ubAZh3qaZzJFVqvOmwthRJwy3CaAiK
 V7hiHcznSDl4btN+GQOS+cnkEBRyDNCZtWuX5iT4BNM+sk5QK1PGSVp1nusYWqJt
 SXyCi6nA9C16eR06VoHVJ1nQUCV5dHB5SzsybwCE4l2NfGVgDbOCTtFDe7V44elh
 vg7c3g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xgc8fts-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 10:55:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-92e62e3459fso242062985a.0
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 03:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787223313; x=1787828113; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=BpR73BTf1YtpAr3ZE6EiP23yFQwK2M+fAv/L6W7BmRU=;
 b=jg63fR1eq1R8Wv4inLWl+d0jvEOmpi+Qwozzw5duXwfIa4ylLMhjjZBYS4nPXurCAz
 Oq5Ix4gRzXQvhnT8ZEwy7AwwTaH13ed9nlsMShHU2jccYZAaIDS/EIv6ScekU0Mw0UYT
 k1uYVOxjEzI14j8x18qvrXgV/BH4y6dazeL3+t9EwqpTXuEWi/UndEQ83VxIkiF1pvOe
 nOu2t+dvdgpf2c+CWiJgZ7NC7c4XZi+yhIo4eAnZ8YXnJXYy+WWwgv5HG2VZkoxu2AVW
 Bb3NP3fVieE5ZdKLNmFXyYaPXmpwB4FkVcljggqS0SHkxv9udQOX6PCQOtn6e07DdIMH
 jG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787223313; x=1787828113;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BpR73BTf1YtpAr3ZE6EiP23yFQwK2M+fAv/L6W7BmRU=;
 b=dUiIAcyudqHnHd7eNHQy+Dl+haRegROC19HCcFCb/VuHnS64OB2OL+WpBrxcrYGsaE
 u23B7tIKgBqJJ4OvxasGJBxPdwMOCcnDUqUOE0c+aKCIP3SSVqG7LCXDfReTJiDZBsK+
 y19lMsOrGYxRgIsYaAgQCXbMgH1HAo+5dqjnUClNG13kcwanJRKfvJ7l3LLQv0FL1JKh
 GrpohOyLbJZIpATg3Xr9Vp5DPDRcprr6V3LlANhNs76CfnFP51tQ7/V+878xP/eoN9/q
 uFyADmx7HuMdgKwKB94NOHS7qTLzf8awkPQ8fySLY/+gpfS3Qny0ztcOL/HifF7M4ZSP
 UyOw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqTOnkmQ9KMuHGDf+sn5ebOuIJWxVa3aeXJKXaWJKTdjyh4Fd34HPKKw+pAJXddGsAXcVdwycvwpQ==@nongnu.org
X-Gm-Message-State: AOJu0YyasM8gkCYRY5wBsPVm3FlJmtQ3cWsnr7iz13SqnjcKX4eP+p/g
 kKryPoEK2QGKA5LLlkjj5/OcK9G9yv2TNmuG+fuHzU4SMuU6QG8De+qvRq6j/ePp0uaD79gpOaE
 j4+0E7iXM3NVdv2hkXbtv5j6y3dEb9y1wsCBXW8eTHRbIDeuAFiPZ9fo=
X-Gm-Gg: AR+sD116MhnmBS6XP1hyJeaALwbP+S9rcDb0VGwvHHQpEv81AyKTG+eZOhzlJ6DjSs+
 jJawshLAXHwlJ67nzmiyBO0549GgsZG17Se1Zcp98azttSARoBUPGZQfOFCBe7brl8XtTyjg3J2
 9QlbYFW5UQUL1bnJgnLC/pPzijSC9Y60esziloDwBwftOM4tDeEiGpLAT+5+cB/W5QIMejQI1Ok
 JJ3AHrC+LqhwZHpAmZ+4eKqTGEG91xcfpq1tyFeQlI9oXBCoayM13CaFIoLNm8QUd65TJ6T9qek
 2PaN5XwKXL/ukuG9jUtJFX36ZQ3KG5dIF7ivv1gn38+PdkJsgg9H9rpnVpIc/+PaDnBtAE3beUn
 eNGEWdZWkRNPBmzaCa5AU+DvnaPECUDoBHAU=
X-Received: by 2002:a05:620a:7081:b0:914:e3dd:17ea with SMTP id
 af79cd13be357-9371e22056amr1039099985a.12.1787223312830; 
 Thu, 20 Aug 2026 03:55:12 -0700 (PDT)
X-Received: by 2002:a05:620a:7081:b0:914:e3dd:17ea with SMTP id
 af79cd13be357-9371e22056amr1039095485a.12.1787223312384; 
 Thu, 20 Aug 2026 03:55:12 -0700 (PDT)
Received: from [192.168.69.231] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14b7d4asm10629227f8f.21.2026.08.20.03.55.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 03:55:11 -0700 (PDT)
Message-ID: <be278ba9-1e87-4def-8bb9-eeb14b17a03a@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 12:55:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] hw/arm: Remove spurious WM8750 dependency from
 Realview Kconfig
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Jan Kiszka <jan.kiszka@web.de>
References: <20260819185430.3467629-1-peter.maydell@linaro.org>
 <20260819185430.3467629-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260819185430.3467629-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GPM41ONK c=1 sm=1 tr=0 ts=6a86dd11 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=69wJf7TsAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=NbfgatFzXNzTUJnNQ2AA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Fg1AiH1G6rFz08G2ETeA:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: hwZ_5OtY9Mg6R5YpLamp_WO-4lWhWaRh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA4MCBTYWx0ZWRfXwlcwayjG+66M
 1ze7U99T8uiKRzMMO3Xy5rday980tJ2lRQvV1QV4BEiGGLxUcqzUw+cCqSpUtC+6E2uZ8kuGDMA
 f6yEyoeCuXWHdh1Jb2N/x4sRVEzFZTp1SV8TycQiVtCdQ4i1KTbtfVOzefOkvyOXj+dMD+6aKca
 3h0thrBHfZgyKUjr9k3HbHwdV9XOdwsC7CeXrDR8z7IrB/A8a1/YO8jublasXPXDN6KGXJBIKch
 BnyQJd2SqPmEyKh5dVGkVtGmB+cX0i5Td+rEHWar1v6wc1lffqFZVP8YmZXJ9+KG0a7xNJrBlMu
 B8pRo2XYYH7Z1ezYcVvcTRvGLIZg6UcYvdazmx1GNg+AWvhZjlk2tZ69GqqNgulGbZezjwF9PGk
 v0I+rW5llT1RVapxTFV9u7qE0oE4G3H80+Sj1hGX5lJFsLrbaKeBZPbBnErHBD+8YwpHxAvkrSA
 3dpyaGyXeGB/CGskx8g==
X-Proofpoint-GUID: hwZ_5OtY9Mg6R5YpLamp_WO-4lWhWaRh
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA4MCBTYWx0ZWRfX4cDrPd3SPr38
 VYJuOF4+OPRNaCqNny7o/iYVEjlbrMyFtQonnCutT7hlDe+ToOaKnFbsyINjUv8iI/mkqzX2mZG
 vb3mhFxkfr4MMzCWE89XvYbR9A2z12g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200080
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

On 19/8/26 20:54, Peter Maydell wrote:
> The REALVIEW Kconfig stanza has a "select WM8750"; however the board
> itself doesn't actually use this i2c audio device: its audio is
> provided by the pl041 (which connects to an LM4549). Remove the
> spurious dependency.
> 

Is it worth Cc'ing stable?

Cc: qemu-stable@nongnu.org
Fixes: 79e93e24de8 ("hw/arm: Express dependencies of realview, versatile 
and vexpress with Kconfig")

Anyway,
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/Kconfig | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 260d2f0751..5e9a0bd8dc 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -155,7 +155,6 @@ config REALVIEW
>       select ARM11MPCORE
>       select ARM_TIMER
>       select VERSATILE_PCI
> -    select WM8750 # audio codec
>       select LSI_SCSI_PCI
>       select PCI
>       select PL011 # UART


