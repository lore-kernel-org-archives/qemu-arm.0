Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659A3CD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 17:16:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNw8V-0005hT-HQ; Fri, 15 May 2026 13:15:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wNw7w-0005Mk-Oh
 for qemu-arm@nongnu.org; Fri, 15 May 2026 13:15:22 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wNw7t-0005fm-PI
 for qemu-arm@nongnu.org; Fri, 15 May 2026 13:15:08 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64FCM3b63795431
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 17:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AWQa9PYZcA22WBJsRTPM8//wP/1FG2LBXPYiOz0NCj0=; b=nJwM5pqZlR93SMRM
 oZlW7H4GZIWg0drJ36L7vkrTj165GowUetLfRYvBgCWiBIR+pSrW+GKOmJZYZLY+
 HceoDluk/lrpnOKZtAAbLHh5aCiOsBnPtHT/Ws+YxLnGun5t9dLrdBtDBMLUvTck
 0YjqSVQTyZ0Qar6Fhc84BTBIlqXXE/sjfJeS36xPw00GAYHj1dBmjfUuy01nwq6g
 aqp7t1P7Stk76MGXr03Yay4nQFx9tNtg4kmt3S9TwBEyFWZ2basl5QGqD2e2NQqa
 d2vjOgDB9H8TfTakN89LupDDJLAsOu6RwcC/Mac+Vii9MV8gH65ZzLovGHORvWGR
 LXvlcg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1sv4e7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 17:15:02 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-2ef37c3f773so42715eec.1
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 10:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778865301; x=1779470101; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AWQa9PYZcA22WBJsRTPM8//wP/1FG2LBXPYiOz0NCj0=;
 b=G8BW1WSQ2XwYeNuUkWCczu0k6r8XB36wTdcLV+U+RCJ/IYAIjXs209dFqURA8Be8q3
 ffAcFX1CGx7WU+BYWXSTbDUtlDeU8NyITc3HuL9JtG15igOas/omi9eYxR71lexJbUJi
 MiuXsL8l6u7U4vVaRooopkuK7asW4JzdI+DEduqn1rywlitvKhc27PhNRdrtJ/QH5SIc
 4/1RQ0u/eV5Ij5en0ZBU/SQeAvv4zhCvY68H37A5uXVu7GpnhyeoshfLUdzcsfGT4wO9
 BnLwPgVs5RMnSGL2rTkkCQZ4l+5+PHadRA8h3FaLJ5BJ+IkNjT2NGv38XbgyKMIFavmM
 W3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778865301; x=1779470101;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AWQa9PYZcA22WBJsRTPM8//wP/1FG2LBXPYiOz0NCj0=;
 b=Sqtrzuu37YtaKzZtY7IViCW0qs/j7FhRjKyRc7mH49boWS2ocow4+DkyEc/+256VLX
 uPl0FXFTqp7icbk/l6RHMQMWCvoJkXZY4VI+jVF+cSNbNSFgU2LsW12+Bqa0dXSeY6jt
 KdnGW8VfYmTAooUxBMvyKVS7iDalgZ/0so69lq1KtYL0UWmQxygIyoKvzacyykFkECip
 9oWtDF0UtWkhpqcHAROLxwjR8/wAvlXsV6G4FyvOGdoFNNFK+/H4OoNq7Cw61FBKDJc9
 dT04bN4dlT+ctayA0cZ9ri3Sz8nqrplDXJvxfoVnIWrlZmSb0cvgfbcct01ne2vpx2XG
 XrKw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/DPOw4rHoMAkEyJksWobzLpIV6vOU4L5coVl/c1kI7BPp+Kk4P/AB0331hNVGuSDJt5xei6jf9qQ==@nongnu.org
X-Gm-Message-State: AOJu0YwpBxItRRypAhohsVqWPhHEYbrpKT+UkfJQcfH4QOsNggTyy7Ea
 ohhO0OUBRjftcV/jvEWJUIjbyjXk81Xvz21/3ZmlDtkpXmfdXfFQK57hf4rG/Tnl/0zyX9r2HYF
 UM95zUXm+/eITXLow2HTtIuy4iE6GE/O7Ig7k2Jgn52PCT4aN9ibqpuE=
X-Gm-Gg: Acq92OGKPFcQ2MT5Riz18oQcu803255F69hn8Q/cR3Cpap95f9Uib8jlEKd/a49OB9+
 YBADzVnXNYadK8aqGExi6ubgTvFrcNit3u5N9sctfxtIeqFp6oaQI3RydwD/h4MQnQGYbHXC8C+
 aaDukiyrCbInujsTZSMREtdBzoRQWoALIsJ6GuqsJVCNjFPGo79yBcm1wv9EF2AZNEsXUuSFRck
 TopyKy+uQsB6rNhWqwNNjCd6/CKr+Bhe0vMqzr7N6x0ZWwgfiNl0chtFUwmqqpWi7pnDhoMNuoI
 RXinsV2rvik8FUZuHUR1geW7PXCJN+hXYP9WcewunQw0KHyrTE4zKIkTnsomwCwxX9UMF+DRGGz
 Xq6DqquS0fY6plNcSVg6Gc5qYxxXhEO69m+PGCZ4JBrRz814DTqgSTeHMSh7iu8zbDziE6u2WPT
 9xv312pY9SCAcvCQ==
X-Received: by 2002:a05:7301:6449:b0:2cb:4b8f:b2bd with SMTP id
 5a478bee46e88-3039818e82amr2518716eec.6.1778865301120; 
 Fri, 15 May 2026 10:15:01 -0700 (PDT)
X-Received: by 2002:a05:7301:6449:b0:2cb:4b8f:b2bd with SMTP id
 5a478bee46e88-3039818e82amr2518694eec.6.1778865300592; 
 Fri, 15 May 2026 10:15:00 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30294500726sm7213655eec.10.2026.05.15.10.14.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 10:15:00 -0700 (PDT)
Message-ID: <4b833434-9e3d-45a1-b4e9-97ceeec205bb@oss.qualcomm.com>
Date: Fri, 15 May 2026 10:14:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 19/20] target/arm: Build cpu32-system.o as common object
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goate?=
 =?UTF-8?Q?r?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-20-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260515141032.3271-20-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE3NSBTYWx0ZWRfXyRt1/8CUm0g2
 9GaJzA4yfZMdLtlJ3tSlzMsARK4Odv1S+JW2i7PSww2zVcE10FPKROT6vB1kZcSMrr7DkRo+0XK
 5JoFAAYPnACfRCFVHADkvy+cX/pr8CDMvLpLC5TKIu3w1s61pwHdKUjodvKqlYL3m/JwQ2T0DPi
 7L8/nZz9RLOAnc8dxI5Cfq8zPf6y5Zsusal08PzkqEx5sjVgErZJmV+Q5JLuih71g/1m+WtuO/K
 gF1oYBvn9ws1eEjhrOQJ3uNROpML4tC/W9kEszRaSKaUrCxpq02klXbMFnca9zCW512g+c0jM4D
 GPgDiQ2SNHrxG5e7EfphUlbK/IeVoAul286NSpKQgUZbQF8AFauS30NYsAUO3js6DVme0ugRpYV
 clhogLhDvu2ikzbGm2NM7miOxBwnzcykSvGix6Uw1aP2S13wRzCWITsdjodP+iWYvhD5Vi4OzkM
 V0fpEiu+HqJ8l32FcuA==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a075496 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=LAUfPzkrTfg_cwmdbVAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: HAzEUPM34_q295GKGppXDNZePpkRdy5V
X-Proofpoint-ORIG-GUID: HAzEUPM34_q295GKGppXDNZePpkRdy5V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150175
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 5/15/2026 7:10 AM, Philippe Mathieu-Daudé wrote:
> cpu32.c only contains CPU types used in 32-bit system emulation:
> rename it as cpu32-system.c; always compile the file but only
> register the QOM types for the 32-bit binary.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/arm/tcg/{cpu32.c => cpu32-system.c} | 19 ++++++-------------
>  target/arm/tcg/meson.build                 |  5 +----
>  2 files changed, 7 insertions(+), 17 deletions(-)
>  rename target/arm/tcg/{cpu32.c => cpu32-system.c} (98%)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

