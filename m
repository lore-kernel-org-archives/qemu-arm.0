Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7869C5DF6D
	for <qemu-arm@archiver.kernel.org>; Sun, 16 Aug 2026 15:07:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvcS4-0000j7-94; Sun, 16 Aug 2026 11:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvcS2-0000ir-Qj
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 11:07:06 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wvcS1-0003jU-8z
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 11:07:06 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67GDlNlm3215394
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 15:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BnbDhG/x1l592LnB6gZoTi7PgNaEX+1XcUg5ZHKL7Eo=; b=YWTLvAdr4/2/+zI/
 bkQEe9htzlQI+JInDS4SlMjX1hBuvgknP2oWIM3wjqEdKUyNUM7ycQYhnEIXC+FR
 OJ0bUtn5RpKvXNWA6O0Ey7gIp6h4VZiv9vLOkaLEaq2cOd53zPbM0zE3GaQHjCaH
 YPBNeeM6D9A52oErbHbuu2Ko9FTe12CLa5OPnv0ucXk7L0REt7Bdw8lSxcOzF0gS
 EFGgxx4gzPGnBRzNX7KbSqfrfrwH9WXwb0qlcp0NVlUcw0kru0LX12+fQtsAblHf
 oR1eRiTmNsFYyOA3MC9hyvlVzn8tMSVwyA8ZBwNPwfGon4fUDCsn9cJ4VALRxeBT
 DjnD2Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghfbpd0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 15:07:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-936d067836eso256613585a.0
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 08:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786892820; x=1787497620; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=BnbDhG/x1l592LnB6gZoTi7PgNaEX+1XcUg5ZHKL7Eo=;
 b=SJOYLguP720OJfLQM1XHOJlN++sTHfSAfq62AzRXg8BaTBT4xP/LJILWxENi0TlASE
 lQdXo4Q0C4WXffh8S3Cspt7JOUCzWZDPPrtirP79+eVxeshiTjFqvD+QTw3/RL9nFDLA
 kxIAPtsscrgcOqE5mUvyO5j2cdgJ/+OnR0pYfIBk+NsDQStEieojH6v1bv1KuUEUEglE
 y4hH608oLRUG0QVrCIjtwCJ/Yxn6ex7qQiITcZPvMP77r/p42RcogMDle4rA/9xEX7qZ
 KqiuZAEgrZ5X7InQq0nlcOH0f1zF4b3W1LXZEyzNNuQ+ajvICAC+YYxI27Icm/2/7aLF
 5TZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786892820; x=1787497620;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BnbDhG/x1l592LnB6gZoTi7PgNaEX+1XcUg5ZHKL7Eo=;
 b=LTrpfhRtaNJvwCjCyDWucYf5KF0TSk0wAhE0tT8D4cKjiRE+YvyJCW6JhyO/iyXzh5
 NCh7Y6mUc/DVcGUlY8G/w9qH7F+V5aUQ8oUiXA8Hjw7hyVkCSG3Fyr44zn2yzsHDL4FK
 ZvTbRATJ3QbnF6cDeB8uufmWQ0Xtiea3axWqV+zbNlL1dsfmYHnYJqq+CXFjO4yNUhfb
 SC+sLM5shgz/St2SX1wOBcXI0zQOQ8ux5HJCYEqZ0V54xiwhj+u4uHJ2sMP9diCSQxBo
 G/3qYqxK21+Km/mpZKdmwXiZRD9yIch0SOVFO1U2SLH5n74QqzizqUwuYEbnE4vGf+8E
 xYdA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq7N+lO1pwaW+Z4sQyK5+3oZfFlsXb0ibKoRdHbGlw/091ywCOAnuqFLt6A0yo9QU15RAFcFVmTbw==@nongnu.org
X-Gm-Message-State: AOJu0YxAGTejXIPXwgeUwOuJXzgwX4iRupuIeL4sU8W613ivgOr8pkjg
 olQ0vOVbOrXKOsN4210k/k7YruydGkf7ZP1/OSfUgQBfm4h6OX8WqStFJNrScLCS2+uisHu/0EN
 yc20UqSJanHhUd2qkYXY2Vtd3Zr5EsYMgeCoZgx/xDGXikif0e7Byumc=
X-Gm-Gg: AR+sD107YvFT8G/AlI1zjOnsqjpoAC2qp7+llOlZNH+vG4evacKX8zmmrgGcWl7ene8
 juYo3oQakmzATRbR4k/RV1XRTTsPP3zKjFwYr304xhVbcAyoNfdWzzBMhDspUG6Hf+JhlKqSQQ6
 5xuZKRxdq//WX9BqpxwwHUCiREUkR/JfNdCSQ0h5IWmiBFrqRu9POa3upmAHrj/V+ix05c4ssv1
 8o8qxgD2T1KA7SqZl+HS5C+OlpmZ8PfmTcKDRpupb5SbPRuCHv+DtyjqaP6Xd1V4DR2ghgE4bo0
 eYtQbj0ekhnUDf5ikNk2TXzk2MHlVp2FDoVuCfV7q9N89Zx/dWRGgXhVM2/l+ulODoNXj0SdVBr
 TkUOS78p9V2beSNBUf9Tr2nlEbQ7cyagmHK8=
X-Received: by 2002:a05:620a:710c:b0:936:e71c:444a with SMTP id
 af79cd13be357-936e71c4b50mr915638185a.4.1786892820202; 
 Sun, 16 Aug 2026 08:07:00 -0700 (PDT)
X-Received: by 2002:a05:620a:710c:b0:936:e71c:444a with SMTP id
 af79cd13be357-936e71c4b50mr915633385a.4.1786892819746; 
 Sun, 16 Aug 2026 08:06:59 -0700 (PDT)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49996100184sm81484405e9.1.2026.08.16.08.06.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 08:06:58 -0700 (PDT)
Message-ID: <10643a9a-8b04-48d9-a8ad-6dd86a4f29d1@oss.qualcomm.com>
Date: Sun, 16 Aug 2026 17:06:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/20] hw/arm: versatilepb: Store boot info in the
 machine state
Content-Language: en-US
To: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20260816131300.51799-1-bin.meng@processmission.com>
 <20260816131300.51799-20-bin.meng@processmission.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260816131300.51799-20-bin.meng@processmission.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE2MDEyMSBTYWx0ZWRfX+soAKGRuWuYu
 XbpvkYWfp3QlhDnWXCJeBiU0WiO2Vd95uQ/HKd4ScmvxTv+5ET7UMSaID1DKTS3V4bXyiBbJQmQ
 5cNCfosa/fAbZT/GPbW2ncxRI28BLT0=
X-Proofpoint-ORIG-GUID: pUGJZqapmkgsqUr8Xr6hy44Emv1Zx841
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE2MDEyMSBTYWx0ZWRfX6hdfqfRqo//K
 xyGJNj9zEtbpJPfLCJ096phga1mwIcPq64lEBI2JFbUg9t0Ef5EP7S82YwWLrJtE4SwjqaeNQJ2
 i73bVH7/nhWvbpG72YSxr+20iU5ocoVQDDmUwcBjUHuxoi3BOikAtsFT8NX4PGOlIFJpr1iozYi
 jWWDNdhJZzSR4QkEIMpYSOTTH48aQIuWZDRz98g5JacYfkQ29AUb9xWVlajBxriUFHzdIWbcuMG
 8jQ/00WGMwhtR04Oq6aILAXEyH8OnJqOUWkFGhEYvW4rgi6adYEYX3dlEXWBfVvxdMfO7YbxtFO
 1wmFf7Y0IM9lJ7GiaLadRgJG/6CnT1MH4IVjq3pUKh3liFcVdw5kCcxjdxd39lIeoDY1sbuRoXB
 DUVSZPYKxl1uCqVZrONJM4U0I8RqzQug8KBQYnI39C3+zekTzGZ9BPR8ADOhynSGlTP+lgzsZ1p
 2aW1GY4RmhRWDnsvuMA==
X-Proofpoint-GUID: pUGJZqapmkgsqUr8Xr6hy44Emv1Zx841
X-Authority-Analysis: v=2.4 cv=I/dVgtgg c=1 sm=1 tr=0 ts=6a81d215 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=FRSEYCzRAAAA:8 a=HTSKhpLi-foQE7UxHhEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
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
> Give both machine types the same VersatileMachineState instance struct
> and store the boot info there.
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
>   hw/arm/versatilepb.c | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
> index c6991a52e6..520af79c80 100644
> --- a/hw/arm/versatilepb.c
> +++ b/hw/arm/versatilepb.c
> @@ -182,10 +182,16 @@ static void vpb_sic_init(Object *obj)
>      peripherals and expansion busses.  For now we emulate a subset of the
>      PB peripherals and just change the board ID.  */
>   
> -static struct arm_boot_info versatile_binfo;
> +typedef struct VersatileMachineState {
> +    MachineState parent;
> +
> +    struct arm_boot_info bootinfo;
> +} VersatileMachineState;
>   
>   static void versatile_init(MachineState *machine, int board_id)
>   {
> +    /* versatilepb and versatileab embed the same state as first member */
> +    VersatileMachineState *vms = (VersatileMachineState *)machine;

Use OBJECT_DECLARE_SIMPLE_TYPE() and the defined macro?


