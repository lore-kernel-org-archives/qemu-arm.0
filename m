Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32936C5DF82
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 11:16:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx0kP-0003o1-9o; Thu, 20 Aug 2026 07:15:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0kN-0003nO-1q
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 07:15:47 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx0kK-0004pJ-LY
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 07:15:46 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KAP6ns2216049
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 11:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4SLVibBMk/Aiqw8eHpm17f0cJIXTBqJ/HCG7Q9Pig24=; b=Nh1Z5mAhjtI9gWuf
 CfsDiyWZDBRvGS3a0/vO1zIWQtVV+LCF+a7Zs5mhtjLrysfe/5A41Fs9Ah3iVzLJ
 6THvC2nYyz1ZBflkSE1emSnvWdV2MLoVLIhhAuubC/5H417ate3OUipfb7wQuET3
 giEzFPntqpjkOguFLDHOLUskIFcq68BScNhgXlF/Ze0usIJIZxYJiHUBb3vCyAgw
 hWZHrTXEL2Wo8LI+tlRfF915tKmBvaq1pqQY62fmBzweFGWSclFEvsRriiOWyjxw
 8hPpk/oYIh3mMex51O9JMMIOPAFRIIRTuF/xbeKeVGMr56m/Qc14RkzHcWsmadYe
 vnOBDQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ytc868b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 11:15:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-936aa34873bso189632385a.3
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 04:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787224541; x=1787829341; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=4SLVibBMk/Aiqw8eHpm17f0cJIXTBqJ/HCG7Q9Pig24=;
 b=RnXdiHSAJbWccJMOi6dgNmiIo+bddnizZXReu7Z6huwi/CX2YW+Z82Ui0klay9PEQG
 EgwP4NmzA3zFX3D/sHSQiVnWpgFAMw8kkTXhNC5UFttPCCv72SLkwryAUMjI/HCIplUW
 yvuDVXXzkjRoqp8nfL5dWqFHO1Iafy3hdiHfodi1cHtEOmVKOMhEhjuNVj9vTgS5V3Tl
 6z4BgfZbMWHwO1eqbWHr4EnjGcaSdNmL/MBx0aUN1irHIqEnRxiW4JnviNX0KbTPsoxn
 jpAjzvoKrD1ox2YQetaR9/mQyMq4EmoaoRDEje1I4thez8kgWua7ah62IDvE9YN2ZY1w
 JTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787224541; x=1787829341;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4SLVibBMk/Aiqw8eHpm17f0cJIXTBqJ/HCG7Q9Pig24=;
 b=IYaYcEpINkDkw54fEbMRqpb6Ndkmuk5Wu8dQLEOg8+uiBOzF2K4BEPHIMY5SJY5b6p
 H4EoaD73bC+LWnUl0aLKHPgYJdZXEq6OY3KrdH7Di894TfmTKuqClEIVgMqDojvAhP+7
 zCc3MKSVFgmh7xLcraoIMFWJYygYLfjuw328skvfoN7pA++hfR4Uy+bKrB8DKJgROdjt
 qyFyC+haO9GeeuKbzLa0RCj5x+LeSxXnzUEuWOh0KgrI9uiWp0sL0tTh4hpfySsTqc9j
 nop9vyTZZgSdKl7oPxMsLGsWjo3DcRVOfLp5gA59I+AH0OzMOcXjpewvMs8CWAptF4kD
 pZKA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqEZRVMo+XTaCVlD3rsAq+grFTUsD75dMPdJ3qn2j9UD1maT2PuudTs2T2MKHg8sZlUFEQGO1FtPA==@nongnu.org
X-Gm-Message-State: AOJu0YyNCjb/TGHZUlDQbEzJ5RMtWD7Is5TpNPNf0lYY7QNGB7jOiMPc
 0GIgycTVSR5iemtN/oEidQ6EK0UzZrULEMr1oEkdiVzzgozWuh0jbiRmhzRZXBq0Qo/SF3EOAYm
 RA0LqkoJUBt/7pLuDe6jT9ym/PXRLPLaNFnGZ5KeyAzoj7RzznFSsXyypXNJq1WrqxA==
X-Gm-Gg: AR+sD13BxfUF5zXte++HMMLvND4QAxJTUsVFfO265zmMSJZvFHhrF1gDU5pSzjzTrT8
 Y8eRGa/Pl4VBDYOLIq5lVxvYI8whNnuD+ahSKjMEJxzA/Hy9OWVKPI3DjiIALuMseabBwaZdrdP
 +axf7ftEe2aM1uEE12LsADZAwNYejoHNTaDSc95zZKHBrE+fr4aKU5ZGWkohXSVCFuUBXw9Qr5N
 XinS63Z7tADbIhtSY3lP5DWz7SVasXVDg/WkpejX5D11Sr6NDFQ6EujaQS7+jg+9AiHqXpBcf19
 uK38s16JpZzU2kp/uEz+wOPQ4GGdFJoDyK2/d49GKipnIUe242NELc2gTOaxTmhUaVcG3ZNe11T
 BLuLkpZjc7Aulbxg2jjGyTz6hStmaeryALKs=
X-Received: by 2002:a05:620a:2945:b0:936:cda2:bd4a with SMTP id
 af79cd13be357-9371e635d40mr834395885a.27.1787224539946; 
 Thu, 20 Aug 2026 04:15:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2945:b0:936:cda2:bd4a with SMTP id
 af79cd13be357-9371e635d40mr834391685a.27.1787224539493; 
 Thu, 20 Aug 2026 04:15:39 -0700 (PDT)
Received: from [192.168.69.231] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14d9783sm12032730f8f.37.2026.08.20.04.15.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 04:15:35 -0700 (PDT)
Message-ID: <10b4107d-2522-4d0b-a8b7-f5c7ccc7ecd1@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:15:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] hw/audio: Remove wm8750 I2C audio device
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Jan Kiszka <jan.kiszka@web.de>
References: <20260819185430.3467629-1-peter.maydell@linaro.org>
 <20260819185430.3467629-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260819185430.3467629-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OqZ/DS/t c=1 sm=1 tr=0 ts=6a86e1dd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=p0WdMEafAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=scklK8NlkdanN0GCpHoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA4MyBTYWx0ZWRfX/NT+M/ClQdoQ
 YjBzqToCajt1a2pakI3XFOk6O2D4GsCH6K8mAiOF1ViG3xhhUMmSQeY7zoVKTYWPmdi24H/WPxf
 jVEUvZrTByTVVjMtM6ej/ZCn4u+IoEOIkP9/WO6uWG/tPFpywMo7u2fK3MZI3Dip2l5iEPsLEOd
 WsnBh/q9gj9fG0hNOcLxxeujQ7scpMtSBCpb0UNRKKAOT4HFTxJeoPZHM9ku0/R6FTt9bHLTdjm
 R3dyNuVT+ziXl5mOyMtUdTbusE3vTA/lQzKhC4rss6bQPXvZNjljJftAl79ZjLul1ihMMXcEWn4
 +RkP7f2CFeuiI+RYPefQc1ftWXCmVnvQguhANqur8nKTOUq7wbgg8M+riqkXJhBUXAEX8Vd0g+5
 m7riahZbCDeKHxv3OEeeJignrtc6qlC+0jzfnDGJpJiWBxE2es8k1oZfidZtXg96gxR9ZwoZlcJ
 aSSHJo0VRQDIK+sJ7kQ==
X-Proofpoint-ORIG-GUID: Pb86NW5U86tmcA-tBHhBqbqvvCVHWrNT
X-Proofpoint-GUID: Pb86NW5U86tmcA-tBHhBqbqvvCVHWrNT
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA4MyBTYWx0ZWRfX4XFwn4UyNYpP
 pRRKCYw6YcOWQtMqAugAPWJumEKWcLw33TXl4WHlPQ0Y1BrPzjMazv03RDMMzBxwi9IOVJzYKIp
 byMtKrJ82tFNWxUTLtDd865JWQ3/EHE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200083
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

On 19/8/26 20:54, Peter Maydell wrote:
> The wm8750 audio I2C device was used only by the audio device on the
> SoC used in the now-removed musicpal machine.  Since it has no users,
> we can delete it entirely.
> 
> Although the wm8750 is an I2C device that could technically have been
> created on the command line, it isn't possible to do this usefully
> because the device only works when C code calls functions like
> wm8750_data_req_set() and wm8750_dac_buffer().
> 
> This resolves the problem noted in issue #4135 that there's a buffer
> overflow in the interaction between the marvell_88w8618 audio device
> and the wm8750, by removing the offending code entirely.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4135
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/audio/Kconfig          |   4 -
>   hw/audio/meson.build      |   1 -
>   hw/audio/wm8750.c         | 738 --------------------------------------
>   include/hw/audio/wm8750.h |  30 --
>   4 files changed, 773 deletions(-)
>   delete mode 100644 hw/audio/wm8750.c
>   delete mode 100644 include/hw/audio/wm8750.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

