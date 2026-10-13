Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B6ACC6B03
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 11:07:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGaLd-0002wf-0d; Tue, 13 Oct 2026 07:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xGaLU-0002sh-CG
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 07:07:02 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xGaLR-0000lW-OM
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 07:06:59 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69D9t7lu173328
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 11:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 95UByHkw+0BP+P86uKrKF33ytXy5Wg+6bBpWzLbSzr4=; b=aJVYaZb3YZCbJpJy
 l5zWJItaJI5MKSoZ2g+CV9VHuIZ75ee3MXkCdgGOuINRSF3yJRvNBKCP59n4H41d
 nP7Fvm87pIkO/0zL0QlQhwQR4f/8HXaf051SRvrGQVGaIhLkoSArVezxx4CMs58e
 gOgSkm0tOVFSwhKWj/mfrZcdhe9TCn7jUH57rP8cQvMYGGiS1qS1KKMlIQl/pJa3
 N3jtORsbfCDgr0/cw8TCWJeXSs4MyeQAckC/9Vd+8CVOjmcKjjfWOKcMvv844VgF
 58dcld0+lEnKXQ2o2b1ddn3aNmBhy03ydbyYhlLNcveE6aHgZqNtAhvzkr6j5Bmr
 mfb6Bg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9daqsnqa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 11:06:56 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-91786abb5abso46261446d6.3
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 04:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791889615; x=1792494415; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=95UByHkw+0BP+P86uKrKF33ytXy5Wg+6bBpWzLbSzr4=;
 b=c35zQ6hOEyS7fV7yCnHcyvwqion8fthvACwQoCOLgUYGG/SYGBDgK8ihl3mcjbVyOz
 GLqBFx8/kCFNwtF/ySWjF9TSuHO9j+hXvcfOa4UzsnWuWS5lYPMEHgUGfyLvxFXznLlX
 ol/PjB6yO8oKvp6bUqE0fx4m63tZ6nwHz3KPhZMgDB/ATp9HGxnIdkJnGnlr8WVdBhwW
 Awlbf3tTEGj5Kt2rtAfeokSn55sgCDywxphrDlx20aM7aJEGY/nuhqamgWTeg0LJ/uKi
 3ZGtp0+oXyFPwE8oJLUGUs2qBrB1KXwmyunHDW6IqgSK1OHVzbY+ESlYwkvdvFWhTEf2
 /UMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791889615; x=1792494415;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=95UByHkw+0BP+P86uKrKF33ytXy5Wg+6bBpWzLbSzr4=;
 b=u69KCyUNEw96B5MBVCt5QKxFe+EigmhhFAqB2tsyhIyO/Pkx3BCAuMkN0R8iDZaKLg
 ug6FvSo86jukqpItFTE5+tgu/u+A3alE4IJDtprkB9MRJ6KRyoBiTSTt1G9p0TGnGsZ1
 Hn+W2g/lzldcMzwgQAsseBjlxCAbU38+43p2o2X50pbnDSJFe2IY8VQY4sc4tyBcQqtH
 R9LHapDpgmxyjcb3G4gPC0LTcLutOBD6yz4LLPR4KW1wCwWwoV+ugdrrOKwV0JvyKWrN
 HtJ+SrCyFJeudolBsKirx19ViwicjfkHHKWLr8g3uzVJUmwmbOd24fGJFH4ChNyylhLW
 Uddw==
X-Forwarded-Encrypted: i=1;
 AKwUvBw8jpG84Mug07SzuTlwtANWVSE1iu+5/utROhestTOJxiI3MumTyvbtFqMUUUBqWmPaI5vLWliW4Q==@nongnu.org
X-Gm-Message-State: AFq9FYLfLSWS/4XJ/TZ6cs3xO3MDearPDQLp73PbyuQL7w38sksxm/0B
 BgO/KCXldzw8QBleyo4D6o8kV63Ey7KGZQXk/DWT4VRvBPNJNbpaqDUh6rvScrqbIcL08TsrH7K
 8D31moON/3fo696uQlAD5VMk72a3tKKYTeKX8wnoR1Odi0E2NFdKJG0YFWyDnaLDZNQ==
X-Gm-Gg: AYBFou0Pd/hpHP/mE64lKJNihM0vhO75Hmurn5nAeOBWIsQgXFj7LNCrmX11qtxJq98
 rVgy8aWUP/+IlCO831UTBTwzxqFKweqoz9G5V/c5fIlC01eRVMbH71vHaF2gE5ybjW3kgxSAcT3
 YJXWwBaXMU95UdDS9h9JeAZsZmfvFLsVw4GJF6kMa6NYd1UUzCMUF7BbhM3wGo6gyZg+ofoSte0
 B3pAvUyl5sYpK92HzPl4FJV7Z9WaGkC8vpBTMOy7kquiiEajv4iX1rWGfB9Uk2FqMW2rYGg53QA
 BFCCBBdPqEcs9qkPLSjIlb7nq+V+R07O76Yv47g3OendbiOhpBGsespK5onnCCHzmGldpj2Fgiq
 5Au4IFah6ItsOpctppnmsGQQY4SrAcBfTDA==
X-Received: by 2002:a05:620a:2949:b0:93e:c12c:4409 with SMTP id
 af79cd13be357-93ec12c4a64mr1866842985a.69.1791889615085; 
 Tue, 13 Oct 2026 04:06:55 -0700 (PDT)
X-Received: by 2002:a05:620a:2949:b0:93e:c12c:4409 with SMTP id
 af79cd13be357-93ec12c4a64mr1866839385a.69.1791889614707; 
 Tue, 13 Oct 2026 04:06:54 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0bc4ec6sm4359226f8f.48.2026.10.13.04.06.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2026 04:06:51 -0700 (PDT)
Message-ID: <eb8bb3bd-660b-455e-a981-0c4052d2b81e@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 13:06:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm/tcg/gicv5-cpuif: Fix typo in
 ICC_PPI_SPENDR1_EL1 name
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20261013105704.1071427-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261013105704.1071427-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: d-h9js2CYG7xsqM4Q0_shWNFVMNsqLMQ
X-Authority-Analysis: v=2.4 cv=FZuiV5+6 c=1 sm=1 tr=0 ts=6ace10d0 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=SR6j1nv5fr4d5LppKAYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0NCBTYWx0ZWRfX5jeGjiK8d0d3
 mLSgr4oka25msqm2VLKcBraUiXWtjCcMQKMvFPskNjm9ueh1baLghoox7srZ6eUnLKvbpEp7bb+
 cwv2ASVbOMcX6V3IZWhcd3qvTYvbDz8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0NCBTYWx0ZWRfX06QQZxw3alDD
 z8iIY+xxhwnRAVFPEHI1k7oFFoL1gFF1Cf3jO258kt9cKsgBoBerQclP0+8Q6nn14YnFoTzdqjX
 2VxxJdLu0gUB8kwsSJZjoIeS3TJ2k1O1L/GLUVBJ8tvoE/fwnrwqr2j0Iklhj1X68u8hMXyOxTN
 opQGhOjvDiDYe3sZDTWfYPa+mINZseA8ezjwLERW99l3MIgTWOTWtD8+WcQ1y3Z+VGTnhVVJydv
 uRGEBVmspfQYjQNr6EsZBfONPaJSej5G9Lvhd4SGiH8otm4k7IwlqcRyzdZBioFUk4ML+u47SdP
 ZyMrYzC9XkI4xTxWdZePP/G0o7FRliDIZePMqaoYSDbKWbe27yYJf9HsEfttqg7vQ4jy2InNdIQ
 CGpQukYXlTyuWQFOxGWBrOhT8p2adD36rUjF+/PtV+NOGnuo39tBTSHUODyqZ/E1oeaLxwILsNA
 KN7EyqTKu3Vi5GVD2kQ==
X-Proofpoint-ORIG-GUID: d-h9js2CYG7xsqM4Q0_shWNFVMNsqLMQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130044
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

On 13/10/26 12:57, Peter Maydell wrote:
> A cut-and-paste error meant that the cpreg for ICC_PPI_SPENDR1_EL1
> incorrectly named it SPENDR0; as these regs aren't exposed to gdb the
> string here is for debug only, so this has no visible consquences,
> but it's confusing.  Fix the error.
> 
> Fixes: 585dad9e79e1 ("target/arm: GICv5 cpuif: Implement PPI pending status registers")
> Reported-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/gicv5-cpuif.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

Thanks!

