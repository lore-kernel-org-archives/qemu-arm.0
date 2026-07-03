Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C49C43458
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Jul 2026 09:24:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfa81-0002i7-Rd; Fri, 03 Jul 2026 05:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfa7z-0002hh-UW
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 05:24:07 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wfa7x-0005rj-MJ
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 05:24:06 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6636h0Qx3144241
 for <qemu-arm@nongnu.org>; Fri, 3 Jul 2026 09:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wfyTnT5jM0Dfotee9N7GYIMzJWZJb8180pLhqJQjo2Q=; b=bbm3qmkvNbJKZXFP
 iVI9+bxl07Ith4bgMIenja+bLYuY+sdAY32f+9ZpQHUSBYITHAODIElN5caZqgdU
 gE/SOXju79x/zyQiU7Ff4HbDj2jPt4FRmjiBH4MOxC74bKIxSorokMoK6n5Ki8Eo
 MszETB4PYb3eiq3xDc4AJvdlaOVzwgOGbm6eG0KTWB6H61wAdDYK7JFo/RReXbdx
 y9e2YQeAeDjOLARqc9k5z5cTNXmLv0ZMf6NZKMXLdbr8Ra4dxJLlSC98ckKuSDWo
 80CyHPZVRktubIGJstuYGlCbFbgDuJrmWYONWn2+o379cj4gApER0FiPPlOANFJ3
 xz02Qw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682brkch-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2026 09:24:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-9203d077d77so57378685a.2
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2026 02:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783070642; x=1783675442; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=wfyTnT5jM0Dfotee9N7GYIMzJWZJb8180pLhqJQjo2Q=;
 b=Ip2h6k0sfK6fV1aRdYGp63fAcm0F29mND5jVHRL6XZUzhwGylY9EOGi8MhEPgTinRV
 h15BQJMShO5ebi67ahfM6TKnfMScTqOa5SjFaEbLx70kr4F84Hd6n+DyuA+1Bc6kzRFA
 udEUxL7OS7ep7sRyxb0qmL1C0isUkUk0Lcb1mVHReg26mz5ZpZ4nFkUGTRgkQKSrOe04
 WuSxTspOlQ7zxkrs0Up0+anJyYHr82+X7FImo5L1aNes1A38hwyyRtOhzp7qkaMmryZt
 pVdUIn1lcOT+tKzpRvw1i4gf6NNaEPr8JQS++vmB0nKF1wc9q4qUBfwI/aPSJWySuci4
 riCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783070642; x=1783675442;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wfyTnT5jM0Dfotee9N7GYIMzJWZJb8180pLhqJQjo2Q=;
 b=sQYOrT7nNutkucHSfpP/t4w7jsQNZJ9byAsZqqO69XwdEYYiJTUyCU7czvWMJxkr2j
 8ZnN1LjloQ0mcJGkbP1sRqp7D1tg6/+uIEuCG7HsPgVbYadmLjHn06aK3/bytF8r5euP
 RhxFu7rXdIjRikD1fhJG3rhEpcVv/C0llxsXUL0yw7lWYQMjpbsJAmStDnZX80Tsr4wy
 CmsvQVRzJXytBgKu3bRK333us1cTGXrQOptjGYPx9UbNGi+7Bz9aGzPA3kQkFUf1W5B+
 bq4h2WOfeeh4OYgIwjydYE6hdHnmWo53gaA+wU4OH5L0df+MKo4pgpt4MisuIMc+BpmX
 0rRw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9xXQBlreMjPET4l6+9j+TuFDFv4dCJVwO5WqyuLR8sr8BbEAjHfW4xD9fRtXiIN59Xbab6MJZbCg==@nongnu.org
X-Gm-Message-State: AOJu0YzJXjhFnKbcjAGEFFYKkgEVkoZ58uk4G/I/R2hWsJaTJEDPy4AG
 JFsfwq50H7hMmPM6l78nfDEbJBA2TCyMgKGQGOB5JxtivdTbYGxLhjKH/4oIYzQCK60Jf8FrWGV
 BwiK462Ll87KzWtcl/uHIf2B8OjABGKnHRD9tqbyOz0xYoUwF9cqNUcA=
X-Gm-Gg: AfdE7cn/wWtSqtJgefIWjlO8mMnSKQ3PxVZb/8l7dtLr8K4Qy9xRbnUHOcxA5a3gM1/
 H0/N+OdPe/gDPKMCBEww3nebQrA1ytck7XXDoU+rACIV+hKh8Wev5rhXcu88UcX4WNLuDNz3Yca
 3UhIouT0iJucMEmg0eZYU+OtSqnbGUiFpPWiiTZlUwaLrtIraVLBTrHIJVlP0W1tExBLuEfvfkW
 d4shkeqtZqFgwgaA4ZL2B6MkXxUVafOJ0EaIXm1vIuKxvNlj1WiShXH5uRyUit7wyAOdiLVyVVU
 a+CIlKv1SNC0MEZdouubE/MBU85Wx1n8Nzu0iWO+u1JNeDTdk5ZqdDcnEl9ZzQoYUnYsOk3vcOB
 4XCNiL5sUkbp1oZVsO6kjL7LmEUzUmKtWMN2tSerWvoT+1GQX7AAdEGrczM6BCw==
X-Received: by 2002:a05:620a:4555:b0:92e:44be:bbd2 with SMTP id
 af79cd13be357-92e7afb2399mr1079516385a.9.1783070642335; 
 Fri, 03 Jul 2026 02:24:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4555:b0:92e:44be:bbd2 with SMTP id
 af79cd13be357-92e7afb2399mr1079513585a.9.1783070642000; 
 Fri, 03 Jul 2026 02:24:02 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c63bfba1sm134777755e9.15.2026.07.03.02.23.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jul 2026 02:24:00 -0700 (PDT)
Message-ID: <a987a022-377e-4a6b-b8fa-152dafc52120@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 11:23:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] hw/arm/aspeed_ast27x0: Add unimplemented OTP
 controller MMIO regions for SSP/TSP
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>
References: <20260703064506.937904-1-jamin_lin@aspeedtech.com>
 <20260703064506.937904-6-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260703064506.937904-6-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4OCBTYWx0ZWRfX23FJmYjuUyQ9
 f6gvm73h/DzTgINSAGxUZlx+Hn60LhqzdJyMtjBYH9K7tI3Eug9UgcqRwGREBKvVxlGTuRuqatW
 2O/DsXPSXBPwSM0S+3HUMePV04oOreWxzmceU30qxf8TYS8rUWZsIWKPUptRDBLfr4FGuLWvNg8
 ZTAjjtF9/RcoqG31x2oGrjbO6DMXBxsm5d/eFCxWXRM+h8YQ55buLyLibOAkQ2vZKwfM0Zwp+NG
 qqW18uJyKbEsN6ngGxS1ADIoVASz7klnUQtcoswaMBeXk5j7TG4Om4ryZlO45PaSOW4Hs2raGoP
 T9WPvdNWfr/6A19Ye2iDrd/SwxHFIt3w83e0UV5GKiyo+YHzDyyvCVryHEYX5JE4X5pe/OsEz6S
 ngTwL1evPJz4VlCriqqx3mqD/pdRg1uT9+bND5r4VNj/X+Ux7QHFEgCQgrlN4W3rWcd2OLSBOXj
 tev/Q936x/F5w6l4IUg==
X-Proofpoint-ORIG-GUID: fqRWp6-VtO8Ws-uPIiNSAFCSR3CKBUfd
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a477fb3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=V2NxCb60AAAA:8 a=EUspDBNiAAAA:8 a=0ue78yuwkkn2aMjpMEwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=3L6qF29SlnrayQqPM2jZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4OCBTYWx0ZWRfXwi263c4+SBFK
 FYL/zsuMyFL4GIbOvAR/mZjkFy9NNvnfYq7/Ap0GsxbRG34S2Xev2c5TNHYnqs3d/1Z5Vt9VTxf
 FHsOp4okPmVi+bPK/BxNmJFyDWNtk4A=
X-Proofpoint-GUID: fqRWp6-VtO8Ws-uPIiNSAFCSR3CKBUfd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030088
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

On 3/7/26 08:45, Jamin Lin wrote:
> The AST2700 SSP/TSP firmware accesses OTP MMIO regions that
> are not yet implemented in QEMU.
> 
> This change adds unimplemented MMIO devices for the OTP and maps them to
> their corresponding physical addresses in the SSP/TSP address space.
> These stub devices allow QEMU to safely handle firmware
> accesses and prevent spurious exceptions, while accurately reflecting
> the hardware memory map.
> 
> No functional changes.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   include/hw/arm/aspeed_coprocessor.h | 1 +
>   include/hw/arm/aspeed_soc.h         | 1 +
>   hw/arm/aspeed_ast27x0-ssp.c         | 6 ++++++
>   hw/arm/aspeed_ast27x0-tsp.c         | 6 ++++++
>   4 files changed, 14 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

