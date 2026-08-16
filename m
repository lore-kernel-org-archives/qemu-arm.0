Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F0BC5B572
	for <qemu-arm@archiver.kernel.org>; Sun, 16 Aug 2026 15:07:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvcSU-0000oV-JO; Sun, 16 Aug 2026 11:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvcST-0000o5-SO
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 11:07:33 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvcSS-0003sh-Fm
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 11:07:33 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67GDlJvV2399156
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 15:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 13y+9o1Ozcn7mPTCBn6QY2ifzE584n+Fjq917jZBqVw=; b=Zag9elMoTEiNSOUT
 iONfWdK8X/LrswW9aaNogkgQtrGAMzhAR7hKqTxSmFJoKAuEkuXcDPWLRaEptt00
 4r8Fz3XKUUYTAyxtQStVWjryRaNpwj+UJ0/3cHbshb38Meg+lUtierCQa25FLJiV
 0niKR1P9CRZIy7hVZJdqgvO9QJjBWW6TFZqOXQxlN43nCbQIb5QZ6uoMyKXhJtF5
 35HyJmhqMxiVLnELo0Q29nam4YIKThzM8wFgcSbyYU0sX5V8IWd59MhPie42SUhk
 8sd8XL8VDnRfYhFpbKXTHj3/n/0HmpiARwBb6N6X/8eeGn71akMvoC+HgNS+SXc4
 XH/0dQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghq3pte-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 15:07:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-930b571432fso247481985a.0
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 08:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786892851; x=1787497651; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=13y+9o1Ozcn7mPTCBn6QY2ifzE584n+Fjq917jZBqVw=;
 b=jgUwn2sw7tetoT4hystJiGamWNgz7H9N7/2tBXNX31nLx1XbL4qUzd4cc5mBKS5Ubm
 nED1dFWGsSnEcKaIVMGjQ3UWywKvYAsBg2PfNG76QPCD8Q2yzW0oKgt482lrvQZcmXiY
 3LEAgHE/qV9Np8XZHcChHR3SMPaW0Q0JRTxN0os0yxZd9v1ba7AA5c50unRXdM1yrqoy
 RjSmZtW32EFV+3l9vkETodam07Y4Eb/AaL+13YAjFmGCJPTgMrqZcYTEJCzwD/q5HVFe
 XWS13LkvVIVfPs14VTDblKki0l6Jw3Tce4Q4MDBYhvDxqO63mNsVXNjro4SsitqNWy+X
 jvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786892851; x=1787497651;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=13y+9o1Ozcn7mPTCBn6QY2ifzE584n+Fjq917jZBqVw=;
 b=Pc+fERdTLAqr+qWjAfWmYymAh1tTwWwYZ+5jzqa3u8KDOzdLl2/L0JiWq9NRjArf0P
 /baCx5S/5zphrSlGH/1HLcM37xD82hEwNcSGWXX31P95jZu+9RzAyiqOYdGKmPGy3Oyy
 yDkYwX87teMWCWA+Q7IrcHY6FXAn5FcqDkznLV1ADBdMZlwJEdyovzeSUmJZg/DMU1+p
 5D3WqCb03ixCrD7YUTYhpvYwX4oMO4jRh7X7LdH30xgfRjxR2TSjUzXvAvyMMW30468e
 JTK3U16UIYwAhzIu7Uepio5CHGepkGobLNc0oeWqfgNmWNTNflKBL11uDmt1sS6aUywG
 Cw5Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RqdFelxv5BDGjgm9QlQwHPRFYyDQxOapGgh7+0nKlKFGROfRxuJGj5sG5sJJNt0cQOlzPLhp/nl/A==@nongnu.org
X-Gm-Message-State: AOJu0YxOm6LEnMxfIS/DLFPMvU6/Aka9ycoPv+Zne2KFgvm7Q0ddpaIq
 nqQsdoiI3hmwMNbPxB28CThG9bk5OcL6ybe4R435NJkAaYxtKBm+1NIpzsVJS8oPm6Q5lFGUj5+
 wVStyUlgLK6bqahzpmtS3Vxckl9BzGhtdDlEKs7sPL8yxfsgGwkDggg4=
X-Gm-Gg: AR+sD12vWYCuB6cYxH5vuUL+m7LD2Hmnmtwbj6Z6BbYNnXSRlwZBGrm31I1sODhNXqK
 kkqFJIsB/25wdRGRktAWxxCJZqT8D702DPaD67mt81uliqaNOzeTrFXan/Am5GD2fDZn0JpRF+g
 ZQaY8CgQnXaN/LWvevmxOp1FVhijZWsYKzttIRuMPHUmg3Z/wHzgZZA8KVxmxvqc/m1cuLZ4juY
 W91Cq5+yD1AROETWS39WFboAtvl0LEHuBa7xw4jPQqyQTlGIEgQhXORTQtRTZhA6G+slPthgvaj
 HkKdHoOXgx+1MttO2014qYn8Yp6fb66IHmr5aGMvmxXTdItlrLgw/mp1oB6Ix4RlyiYgIliidtu
 gU0Jvq9xIq+MnPk4X1x8zNX8iXVugJAfLEyw=
X-Received: by 2002:a05:620a:4013:b0:932:db03:4da3 with SMTP id
 af79cd13be357-936c079414emr2669847685a.19.1786892850834; 
 Sun, 16 Aug 2026 08:07:30 -0700 (PDT)
X-Received: by 2002:a05:620a:4013:b0:932:db03:4da3 with SMTP id
 af79cd13be357-936c079414emr2669842085a.19.1786892850474; 
 Sun, 16 Aug 2026 08:07:30 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49996100073sm67837245e9.3.2026.08.16.08.07.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 08:07:29 -0700 (PDT)
Message-ID: <e283cca3-2e53-4cea-9154-2796797ca25e@oss.qualcomm.com>
Date: Sun, 16 Aug 2026 17:07:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/20] hw/arm: sabrelite: Store boot info in the
 machine state
Content-Language: en-US
To: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20260816131300.51799-1-bin.meng@processmission.com>
 <20260816131300.51799-19-bin.meng@processmission.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260816131300.51799-19-bin.meng@processmission.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDEyMSBTYWx0ZWRfX9CaOzSdF/295
 MgPdiUnSy2oY5wvkqtVg//PMHPTyfNXvNQDEM5pdLcHk2+y60eByVCB6OZLc5fBVhbY7FOHagr2
 Ksz9PxnYlyJgIh3iOXwX9F21gPJY23gh7O+HruFnDORDjvDxUdITQXbHRaO/0LFpfKNGerPHWlc
 zMFYWCsD1W/IpBXGlpt4QkDdB5sOMaYfLOHf652t7tA7GyC18R/4tw96g4lZSncuYu/kXxfBJms
 Um5s5dYhXt26HrNb0Ozl4HmU7BTZO7b29J9bk0dby87R4cWguB4Fr+ePFWXfr+h+ZN8EGUiuyT1
 /qZ+1hUL0lcYsK0Vc28DsMvtclCjDKdwUwIi68ddI16SyXy+jpewMFPPow2pZ8SERxovJwgWyRL
 941hv20Yn2vUdX0XI+zsfB+pcEc5EvPiA1k0ta1Pen60Mwd39XQW2zERwQTUdM3LEQXH3dd6Xhd
 4d9HynpxLdsLEdGz2tw==
X-Proofpoint-ORIG-GUID: QU-YGXjr-QaLFV01hN_QH3xOc9OBcon9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDEyMSBTYWx0ZWRfX2ZweYWhURtL6
 4HCskCVdCNUILvwebrHnohlLjOYf0/O41zHu2JNf4FJmmkYhrlTz6ZqB12dGtO6SYPTHZMGnYpo
 NkxGGe690VFjnd9p45AxaHdpMDTRr+M=
X-Proofpoint-GUID: QU-YGXjr-QaLFV01hN_QH3xOc9OBcon9
X-Authority-Analysis: v=2.4 cv=dvHrzVg4 c=1 sm=1 tr=0 ts=6a81d233 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=FRSEYCzRAAAA:8 a=EUspDBNiAAAA:8 a=P5mgNStSnDlmL_58Bq4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608160121
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

On 16/8/26 15:12, Bin Meng wrote:
> arm_load_kernel() keeps a pointer to the boot info struct for the
> lifetime of the VM, so the struct logically belongs to the machine
> rather than to a file scoped static object.
> 
> Move the boot info into the existing SabreliteMachineState.
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
>   hw/arm/sabrelite.c | 22 ++++++++++------------
>   1 file changed, 10 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

