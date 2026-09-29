Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A0DCA5FA1
	for <qemu-arm@archiver.kernel.org>; Tue, 29 Sep 2026 12:18:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBWnI-0001QH-RI; Tue, 29 Sep 2026 08:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBWnC-0001IH-Ab
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:18:42 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBWn9-00032q-Hn
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 08:18:41 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68TCEFAl3851848
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 A5G20+4ZQ6SOlaNQMtrfvSJv1ZHGuI4oPb+Cy6y0BOE=; b=gbO/OjhCcHI2HzOd
 WP6he3NNj/+4MUCv/0kJe3kMz8Yx9ZkPTbL96zf+16432Y75JVksnytqsvM1mrmh
 SQSMhMV1jsRcI80zDGZgH3KU6haWPh12Rzumj0RAcxkodkRoR6mre8oVf4DnqkjY
 NSmFTx/vhD6R2R34/EBQpYOSSWN8mn+5u9qg7ljo2czCWcTweixlnou4NqznhGb5
 m8ZN07+hQcU5+hXVkuhbcRk4+HhkPKDXv0Y64xpA1BAui4gp/3rL5+tjMtjD6JvL
 rRLAVFQRMofaHjtSCtdjTBBGp8Kp0YHCSq9kAUdxs52sRUEq6F7L/1Mn/LrKnOhD
 +rMJhw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0bn1gdc0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 12:18:38 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-7909e307799so3901891137.3
 for <qemu-arm@nongnu.org>; Tue, 29 Sep 2026 05:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790684317; x=1791289117; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=A5G20+4ZQ6SOlaNQMtrfvSJv1ZHGuI4oPb+Cy6y0BOE=;
 b=OUpJmI7l4tcumDuPlofnM6wuuFJ50OYrprHMwPFXj8lifwhLtXYhoLiTHoyhnesDFS
 GDT0F10gQiE9XVMXmFYx7cXG9QS4dy7G8hSx5yvkxYy+WOSAQPey4AYdiQFBIuZJ4uct
 113vlQZbDsG5Kyn10kkoCL1FFAM3CDVlyNJz8KnS1G3/sb8TNMScatWp+irf8z810R04
 3w2yotXWt0aHw1nMetZrsIgvPCYMV2WiEqUoLjpksi2Jq6gu/W4RiMrQ9jAH8dWpeBeZ
 p77p2gBSc6z3K0Xeh4xuO4GmE1fbKPLN4KeWZJkxoTXK6wDvrs6/ojAgpG1EWvuxeceU
 UjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790684317; x=1791289117;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=A5G20+4ZQ6SOlaNQMtrfvSJv1ZHGuI4oPb+Cy6y0BOE=;
 b=HSyFixyk3RTj/IxGCyh7CUxd/Z29cZ6U2sXlFEjpHCsaaO+qVRrCxe3WaDvIOW+VXD
 usY6Yde3JTZf+lwp1M2fzc4omj74DpLpCwlR0FZY7AT+hUnemQ9euxYfGRusrMUqtMyL
 A1X7Rb6LMWI4J+oKtq/hSWGp/rXi+KPOH+tXc7RrAMlyMfgjQVmsDx0PUonvHyTUJ/W3
 +3xULEvNOzmH5IqmoPS35yqvqHxugGuhbsJIGtvMW/iwWhJ0QLoiRZSLCvjNG1hju7Ov
 3845uonc6FG2so/MxmoQw8oVU3EUJ5HI+RoMR/IGA1io46Vinlz1UsOp5uAEYnEbifCa
 h2cg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwxxKpE1tZFqOJzzwvptAcQSmfBObtXze+pIaCNLmnrb+9DzBkVn2/G+lfbF74Q3ui2IB7hVFL8Cg==@nongnu.org
X-Gm-Message-State: AFq9FYLIw22vvqvnCs49M2oreLhQtJW0c3xLArA0SgeoZ74pWB31duUv
 QUIBqxDK5Ro7cdWXPuxi/67y9yoZlqJly2skC+Bf8qBfC/qACcOfRQ4ycsbOxaWdpthxbGhF/9C
 iopJ2pNw8GmpPMslrf7/yp5m7yCk/+oDRYVdDb89oDz+ASZbxTmQdDgQ=
X-Gm-Gg: AYBFou0kO5yRWItm1UdOW43O8lAJ9o2e0EiNYxYuujJmbVEI+SdKnYeDIezO+7xhWFn
 UFJ+YlwvUT9/PPorErLrGOC6eh3Ozdl5EZkcpw9ACiyOQfTULtQNf3ulOMEqYvYJupO179zprqn
 wozw2Um8ItrAAufpIzSsn6WakbZIyfZO5sWRBaIsDPEjDY0VxvZfpeElfzU6WW6BtBXEgmBRt+c
 iYMyxwOQTJQ3dpZK5A0CUK1pUqaZVICxBxWi4wR9lNcjiPzDS09Ob8N4XJOTLLzjGBVPp6sbFsV
 XztfHtrrbXzOaZdaE43sLwjtgIfUfAnNZC4H8yOqkD1n9gcOoYd+DWWU7wxdYucUTTAQ0fERFyO
 FlWAOTWWQhSrCeg54qfa4UViNiQv6BKYMhA==
X-Received: by 2002:a05:6102:849c:20b0:7b4:6e46:4cb6 with SMTP id
 ada2fe7eead31-7b46e4651a2mr1732873137.6.1790684317085; 
 Tue, 29 Sep 2026 05:18:37 -0700 (PDT)
X-Received: by 2002:a05:6102:849c:20b0:7b4:6e46:4cb6 with SMTP id
 ada2fe7eead31-7b46e4651a2mr1732865137.6.1790684316643; 
 Tue, 29 Sep 2026 05:18:36 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a013ccb74asm34765e9.1.2026.09.29.05.18.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 05:18:35 -0700 (PDT)
Message-ID: <1c53e4fb-c195-4e67-b45b-44f223436d6d@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:18:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/42] hw/timer/imx_epit: Wire clock control module via
 link property
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
References: <20260921214710.29422-1-shentey@gmail.com>
 <20260921214710.29422-18-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260921214710.29422-18-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0OCBTYWx0ZWRfXzDhMS53buUNW
 9u1e/e5aabMDuBVmAFcwhRSOjQF1gJsuHDLa1iHKzM7kc8EENW96+nYdFL1eijQownh/EV5+n9b
 dQCbrO2WJyEMemDmKK9I0nr9vgtz/rM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0OCBTYWx0ZWRfX9Qa5WKw6+Guv
 nHwrpP86UKJ+XJc0kqHE0vL9Y5uuq6GjKxJPaHjKVNw5x7Eco1BKL7H0YEQbsBKe++35YfvPdDA
 HzAxjPcUXB6etQHQ3eKppToFxbwcD12UQJechQKCtlsXUwgHQa01A7FfhS9UtQFQ7s5z/Hi44Fm
 TQfoNu8QIis6CG8+vgCH856zbHRs0j3avWzTCs64ads/2w7Hm1u5mAbKTqbGKL50MX3rmRFXmmF
 danSOhzYNIzeuzS+jvF/MUc+A4xK8XW1blkVCclAdQCdGFhzM1F/9vmntJP5nT49bt+NpzO26J/
 eBBzTCg0mhr9RD9CdzUzJb6X3f69Lq6O3PAyipYhszr4GE+eN4BMWFZWI0BC9ViyKnEm1I8xo49
 bjudbXh8/6iTBDQcuZHefsVcfKMGmmF5Y4kZ718lvg+LfizOlm0Ubhe7SCAiLpz5yRJIIMp5Cdd
 HjpbdMw8DSOXTy5Ensg==
X-Authority-Analysis: v=2.4 cv=JMiuIMKb c=1 sm=1 tr=0 ts=6abbac9e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=3vsBvid6nmlQ9tsTqnQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: f4mFFhqFE83wRmLDK-MeUMVPHmp2TuVh
X-Proofpoint-GUID: f4mFFhqFE83wRmLDK-MeUMVPHmp2TuVh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290048
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

On 21/9/26 23:46, Bernhard Beschow wrote:
> When wiring struct IMXEPITState to the clock control module, it is
> currently necessary to reach into its private data. Moreover, when
> forgetting to wire the clock control module, QEMU will crash after the
> guest has already started. Fix both by letting struct IMXEPITState
> expose a link property which is checked at realize time.
> 
> Inspired-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/arm/fsl-imx25.c  |  3 ++-
>   hw/arm/fsl-imx31.c  |  3 ++-
>   hw/arm/fsl-imx6.c   |  3 ++-
>   hw/arm/fsl-imx6ul.c |  3 ++-
>   hw/timer/imx_epit.c | 14 ++++++++++++++
>   5 files changed, 22 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

